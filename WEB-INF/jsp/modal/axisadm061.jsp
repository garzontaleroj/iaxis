<%/*
*  Fichero: axisadm061.jsp
*  @author <a href = "mailto:icanada@csi-ti.com">Ivan Canada</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisadm061();
       }       
    
       function f_onload(){
                f_cargar_propiedades_pantalla();                  
       }           
            
      
       
       function f_but_buscar(){   
            if (objValidador.validaEntrada()) {              
                f_recarga_combos('R');            
                objDom.setValorPorId ("INDICE",0);   
                objUtiles.ejecutarFormulario("modal_axisadm061.do", "buscar", document.axisadm061Form, "_self", objJsMessages.jslit_cargando);
            }
       }
       
       function f_seleccionar_cobrador(CCOBBAN){           
            if (objValidador.validaEntrada()) {
                parent.f_buscar(CCOBBAN);
            }
       }
       
       
       function f_but_aceptar()
       {
          if (objValidador.validaEntrada()) {
            var CCOBBAN =  '${listaCobradores[__formdata.INDICE].CCOBBAN}';          
            if ( !objUtiles.estaVacio(CCOBBAN )){
                 parent.f_buscar(CCOBBAN);
            }else{
                alert("<axis:alt f='axisadm061' c='lit_1000413' lit='1000413' />")
            }
          }
       }
       
       function f_formatdate(entrada,title){
             var jDate = new JsFecha();
                if(entrada.value.length>0){
                    entrada.value=jDate.formateaFecha(entrada.value);
                
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt c="aler" f="axisadm061" lit="1000421"/>");
                    }
                }
            }  
            
            
        function f_but_nuevo()
       {               
               var PARAMS = "&MODIF="+"true";                            
               objUtiles.abrirModal("axisadm059", "src", "modal_axisadm059.do?operation=form"+PARAMS); 
            
       }
       
       /***************************************** AJAX ******************************************/
       
       function f_recarga_combos(comboOrigen) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axisadm061.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
            }       
            
            
            function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);    
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   rellenarCombo(doc, "SPRODUC"); 
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }                
            
             function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
            }
            
            function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
            }
            
            
            
            function f_actualizar_agente(){
                 if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("modal_axisadm061.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
                 }
                
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }
            
            
            function callbackAjaxCambiarBanco(ajaxResponseText){            
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){   
                    var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTBANCO"), 0, 0);                
                    objDom.setValorPorId("TBANCO", TBANCOformateado);
                 }
            } 
            
            
             function f_actualizar_banco(){
             
                 if (objValidador.validaEntrada()) {
                     var CBANCO =  objDom.getValorPorId("CBANCO");
                     objDom.setValorPorId("TBANCO", "");         
                     objAjax.invokeAsyncCGI("modal_axisadm061.do", callbackAjaxCargarBanco, "operation=ajax_actualizar_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_cargando);                
                 }
            }
            
            function callbackAjaxCargarBanco(ajaxResponseText){                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CBANCO")[0]) && elementos[0]){
                        var CBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CBANCO"), 0, 0);
                        var TBANCOformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TBANCO"), 0, 0);
                        objDom.setValorPorId("CBANCO", CBANCOformateado); 
                        objDom.setValorPorId("TBANCO", TBANCOformateado);                         
                    }else{                        
                        objDom.setValorPorId("CBANCO",""); 
                        objDom.setValorPorId("TBANCO","");                        
                    }
                }
            }
            
            
           /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisadm061.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
                        
            
            function f_abrir_axisadm062() {
                objUtiles.abrirModal("axisadm062","src","modal_axisadm062.do?operation=form");
            }
            
            function f_cerrar_axisadm062() {
                objUtiles.cerrarModal("axisadm062")
            }    
            function f_aceptar_axisadm062 (CBANCO){
                objDom.setValorPorId("CBANCO", CBANCO);
                f_cerrar_axisadm062();                
                objAjax.invokeAsyncCGI("modal_axisadm061.do", callbackAjaxCambiarBanco, "operation=ver_banco&CBANCO=" + CBANCO, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_cerrar_axisadm059()
            {
                objUtiles.cerrarModal("axisadm059");
            }
            
            function f_aceptar_axisadm059()
            {
                f_cerrar_axisadm059();
                f_but_buscar();
            }
            
             function f_seleccionar_indice(posicion)           
            {    
                objDom.setValorPorId ("INDICE",posicion);                   
                objUtiles.ejecutarFormulario("modal_axisadm061.do", "buscar", document.axisadm061Form, "_self", objJsMessages.jslit_cargando);
            }
            
            
             
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisadm061Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="INDICE" value="${__formdata.INDICE}" id="INDICE">
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form"  f="axisadm061" lit="9901515" /></c:param>
                <c:param name="producto"><axis:alt  c="producto" f="axisadm061" lit="9901515" /></c:param>
                <c:param name="form">axisadm061</c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo14" f="axisadm061" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo62" f="axisadm061" lit="9901537" /></c:param>
                <c:param name="nid" value="axisadm062" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo59" f="axisadm061" lit="9901531" /></c:param>
                <c:param name="nid" value="axisadm059" />
            </c:import>
            <!-- Area de campos  -->
            
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisadm061" c="CEMPRES"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="2" ><!-- EMPRESA -->
                                         <b><axis:alt f="axisadm061" c="CEMPRES" lit="101619"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisadm061" c="CRAMO"  dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisadm061" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>     
                                 <axis:ocultar f="axisadm061" c="SPRODUC"  dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisadm061" c="SPRODUC" lit="100829"></axis:alt></b>
                                    </td>
                                </axis:ocultar>  
                             </tr>
                             <tr>
                               <axis:ocultar f="axisadm061" c="CEMPRES"  dejarHueco="false"> 
                                   <c:choose>  
                                                <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                                  <td class="campocaja" colspan="2">
                                                        <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                        title="<axis:alt c="CEMPRES" f="axisadm061" lit="101619"/>" onchange="f_recarga_combos('E')"
                                                        <axis:atr f="axisadm061" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                            <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="SELECC" f="axisadm061" lit="108341"/> - </option>                                                                                                        
                                                            <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                                <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                            </c:forEach>
                                                        </select>
                                                  </td>           
                                               </c:when>
                                    <c:otherwise> 
                                                 <td class="campocaja" colspan="2" >
                                                 
                                                 <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                                 <axis:atr f="axisadm061" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                                   </td>    
                                                    </c:otherwise> 
                                     </c:choose>  
                                 </axis:ocultar>
                                 <axis:ocultar f="axisadm061" c="CRAMO"  dejarHueco="false"> 
                                     <td class="campocaja" colspan="2">
                                                    <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt c="CRAMO" f="axisadm061" lit="100784"/>" onchange="f_recarga_combos('R');"
                                                    <axis:atr f="axisadm061" c="CRAMO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="SELECC" f="axisadm061" lit="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTRAMOS}" var="item">
                                                            <option value = "${item.CRAMO}" <c:if test="${!empty  __formdata.CRAMO && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                        </c:forEach>
                                                    </select>
                                      </td>  
                                  </axis:ocultar>
                                  
                                  <axis:ocultar f="axisadm061" c="SPRODUC"  dejarHueco="false"> 
                                      <td class="campocaja" >
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:80%"
                                                    title="<axis:alt c="SPRODUC" f="axisadm061" lit="100829"/>" <axis:atr f="axisadm061" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="SELECC" f="axisadm061" lit="108341"/> - </option>
                                                        <c:forEach items="${DOM_LSTPRODUCTOS}" var="item">
                                                            <option value = "${item.SPRODUC}" <c:if test="${!empty __formdata.SPRODUC && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                       </td> 
                                   </axis:ocultar>
                             </tr>
                             <%-- SECCION 2 --%>
                             <tr>                             
                                <axis:ocultar f="axisadm061" c="CBANCO"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="3"><!-- BANCO -->
                                         <b><axis:alt f="axisadm061" c="CBANCO" lit="9000964"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisadm061" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt c="CAGENTE" f="axisadm061" lit="100584" /></b>                                   
                                    </td>
                                </axis:ocultar>                        
                             </tr>
                             <tr>   
                                <%-- BANCO --%>
                                <axis:ocultar f="axisadm061" c="CBANCO"  dejarHueco="false"> 
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="CBANCO" id="CBANCO" value="${__formdata.CBANCO}" class="campowidthinput campo campotexto" style="width:20%"
                                        formato="entero" maxLength="4" title="<axis:alt  c="CBANCO" f="axisadm061" lit="9000964"/>" 
                                        <axis:atr f="axisadm061" c="CBANCO" a="modificable=true"/> onchange="f_actualizar_banco()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisadm062()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="TBANCO" id="TBANCO" value="${__formdata.TBANCO}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>                                
                                <%-- AGENTE --%>
                                <axis:ocultar f="axisadm061" c="CAGENTE"  dejarHueco="false" > 
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                         formato="entero" title="<axis:alt  c="CAGENTE" f="axisadm061" lit="100584"/>" 
                                        <axis:atr f="axisadm061" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                    </td>                                    
                                </axis:ocultar>                                
                               
                             </tr>
                             
                             <%-- SECCION 3 --%>
                             <tr>                                
                                <axis:ocultar f="axisadm061" c="CCOBBAN"  dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- PÓLIZA -->
                                         <b><axis:alt f="axisadm061" c="CCOBBAN" lit="100879"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisadm061" c="CTIPBAN"  dejarHueco="false"> 
                                    <td class="titulocaja" ><!-- CTIPBAN -->
                                         <b><axis:alt f="axisadm061" c="CTIPBAN" lit="9001200"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>    
                                <axis:ocultar f="axisadm061" c="NCUENTA"  dejarHueco="false"> 
                                    <td class="titulocaja" colspan="2" ><!-- NCUENTA -->
                                         <b><axis:alt f="axisadm061" c="NCUENTA" lit="100965"></axis:alt></b>                                 
                                    </td>
                                </axis:ocultar>              
                             </tr>
                             <tr>     
                                <%-- CCOBBAN --%>
                                <axis:ocultar f="axisadm061" c="CCOBBAN"  dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campo campotexto" id="CCOBBAN" name="CCOBBAN" size="15" 
                                        formato="entero" maxLength="3"
                                                           value =  "${__formdata.CCOBBAN}" />                                                        
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisadm061" c="CTIPBAN"  dejarHueco="false"> 
                                     <td class="campocaja">
                                            <select name="CTIPBAN" id ="CTIPBAN" size="1"  class="campowidthinput campo campotexto" 
                                            title="<axis:alt  c="CTIPBAN" f="axisadm061" lit="9001200"/>" 
                                            <axis:atr f="axisadm061" c="CTIPBAN" a="isInputText=false&obligatorio=false"/>>
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt c="CTIPBAN" f="axisadm061" lit="9001200"/> - </option>                                                                                                        
                                                <c:forEach items="${__formdata.listaCuenta}" var="item">
                                                    <option value = "${item.CTIPBAN}" <c:if test="${!empty __formdata.CTIPBAN && __formdata.CTIPBAN == item.CTIPBAN}"> selected </c:if>>${item.TTIPO}</option>
                                                </c:forEach>
                                            </select>
                                      </td> 
                                  </axis:ocultar>    
                                  <axis:ocultar f="axisadm061" c="NCUENTA"  dejarHueco="false"> 
                                      <td class="campocaja" colspan="2">
                                        <input type= "text" class="campo campotexto"  id="NCUENTA" name="NCUENTA" value = "${__formdata.NCUENTA}"
                                                 maxLength="34"
                                                    <axis:atr f="axisadm061" c="NCUENTA" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>                                
                               </tr>
                               <%-- SECCION 4 --%>
                               <tr> 
                                    <axis:ocultar f="axisadm061" c="CDOMENT"  dejarHueco="false"> 
                                        <td class="titulocaja" ><!-- Entidad -->
                                             <b><axis:alt f="axisadm061" c="CDOMENT" lit="9001624"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>    
                                    <axis:ocultar f="axisadm061" c="TSUFIJO"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- Sufijo -->
                                             <b><axis:alt f="axisadm061" c="TSUFIJO" lit="9001734"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisadm061" c="CDOMSUC"  dejarHueco="false"> 
                                        <td class="titulocaja"  ><!-- Sucursal -->
                                             <b><axis:alt f="axisadm061" c="CDOMSUC" lit="9002202"></axis:alt></b>                                 
                                        </td>
                                    </axis:ocultar>         
                               </tr>
                               <tr>
                               
                                 <axis:ocultar f="axisadm061" c="CDOMENT"  dejarHueco="false"> 
                                      <td class="campocaja" >
                                        <input type= "text" class="campo campotexto"  id="CDOMENT" name="CDOMENT" value = "${__formdata.CDOMENT}"
                                        formato="entero" maxLength="4"
                                                    <axis:atr f="axisadm061" c="CDOMENT" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>   
                                   <axis:ocultar f="axisadm061" c="TSUFIJO"  dejarHueco="false"> 
                                      <td class="campocaja" >
                                        <input type= "text" class="campo campotexto"  id="TSUFIJO" name="TSUFIJO" value = "${__formdata.TSUFIJO}"
                                         maxLength="4"
                                                    <axis:atr f="axisadm061" c="TSUFIJO" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>   
                                   <axis:ocultar f="axisadm061" c="CDOMSUC"  dejarHueco="false"> 
                                      <td class="campocaja" >
                                        <input type= "text" class="campo campotexto"  id="CDOMSUC" name="CDOMSUC" value = "${__formdata.CDOMSUC}"
                                        formato="entero" maxLength="4"
                                                    <axis:atr f="axisadm061" c="CDOMSUC" a="modificable=true"/>/>                                    
                                      </td>  
                                  </axis:ocultar>   
                               
                               </tr>                        
                                </table>                                 
                            </td>
                        </tr>
                        </table>                        
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm061" c="flecha" lit="102074" /></div>
                                <axis:visible f="axisctr001" c="SPRODUC"> <!-- TODO C: lista de cobradores -->
                                    <table class="seccion" align="center">
                                        <tr>
                                            <td>
                                            <table class="area" align="center"> 
                                            <tr>
                                                <td>       
                                                  <c:set var="title1"><axis:alt c="CCOBBAN" f="axisadm061" lit="100879"/></c:set>  <%-- CCOBBAN --%>
                                                  <c:set var="title2"><axis:alt c="NCUENTA" f="axisadm061" lit="100965"/></c:set>   <%-- NCUENTA --%>
                                                  <c:set var="title3"><axis:alt c="ENTIDAD" f="axisadm061" lit="9001624"/></c:set>   <%-- ENTIDAD --%>
                                                  <c:set var="title4"><axis:alt c="SUFIJO" f="axisadm061" lit="9001734"/></c:set>  <%-- SUFIJO --%>
                                                  <c:set var="title5"><axis:alt c="DESCRIP" f="axisadm061" lit="100588"/></c:set>   <%-- DESCRIP --%>
                                                  <c:set var="title6"><axis:alt c="SELEC" f="axisadm061" lit="9000574"/></c:set>   <%-- SELEC--%>
                                                  <c:set var="title7"><axis:alt c="NIF" f="axisadm061" lit="105904"/></c:set>  <%-- NIF --%>
                                                  <c:set var="title8"><axis:alt c="BAJA" f="axisadm061" lit="9901519"/></c:set>   <%-- BAJA --%>                                                  
                                                  <% int i=0; %>
                                                  <c:set var="pos"><%=i%></c:set>
                                                  <!-- Valores de columnas -->
                                                  <div class="displayspace">                                             
                                                    <display:table name="${listaCobradores}" id="miListaId" export="false" class="dsptgtable" 
                                                    pagesize="-1" defaultsort="2" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" 
                                                    requestURI="modal_axisadm061.do?operation=form&paginar=true">
                                                      <%@ include file="../include/displaytag.jsp"%>
                                                      <!-- Check versión -->
                                                      <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" >
                                                        <div class="dspIcons">                                                
                                                          <input value="${pos}"  <c:if test="${pos== __formdata.INDICE}">checked</c:if> onclick="javascript:f_seleccionar_indice('${pos}')" type="radio" id="radioNVERSIO" name="radioNVERSIO" selected="true"/>
                                                        </div>
                                                      </display:column>                                              
                                                      <!-- Cobbancario -->                                                       
                                                      <axis:visible f="axisadm061" c="CCOBBAN"> 
                                                          <display:column title="${title1}" sortable="true" sortProperty="CCOBBAN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                            <div class="dspText"><a href="javascript:f_seleccionar_cobrador('${miListaId['CCOBBAN']}');">${miListaId['CCOBBAN']}</a></div>                                                            
                                                          </display:column>
                                                      </axis:visible>                                                        
                                                      <axis:visible f="axisadm061" c="NCUENTA"> 
                                                          <display:column title="${title2}" sortable="true" sortProperty="NCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                              <div class="dspText">${miListaId.DESCUENTA}</div>
                                                          </display:column>
                                                      </axis:visible>                                                    
                                                      <axis:visible f="axisadm061" c="CDOMENT"> 
                                                          <display:column title="${title3}" sortable="true" sortProperty="CDOMENT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.CDOMENT}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisadm061" c="TSUFIJO"> 
                                                          <display:column title="${title4}" sortable="true" sortProperty="TSUFIJO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.TSUFIJO}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>   
                                                      <axis:visible f="axisadm061" c="DESCRIPCION"> 
                                                          <display:column title="${title5}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.DESCRIPCION}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisadm061" c="NPRISEL"> 
                                                          <display:column title="${title6}" sortable="true" sortProperty="NPRISEL" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.NPRISEL}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>  
                                                      <axis:visible f="axisadm061" c="NNUMNIF"> 
                                                          <display:column title="${title7}" sortable="true" sortProperty="NNUMNIF" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.NNUMNIF}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>  
                                                       <axis:visible f="axisadm061" c="CBAJA"> 
                                                          <display:column title="${title8}" sortable="true" sortProperty="CBAJA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                             <div class="dspText">${miListaId.CBAJA}</div>                                           
                                                          </display:column>  
                                                      </axis:visible>  
                                                        <%i++;%>
                                                        <c:set var="pos"><%=i%></c:set>
                                                    </display:table>
                                                  </div>  
                                                <div class="separador">&nbsp;</div>
                                                </td>
                                                </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>                                    
                                </axis:visible>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm061</c:param><c:param name="f">axisadm061</c:param>
                <c:param name="f">axisadm061</c:param>        
                <c:param name="__botones">cancelar,buscar<axis:visible f="axisadm061" c="BT_NUEVO" >,nuevo</axis:visible>,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FVALORA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FVALORA", 
            singleClick    :    true,
            firstDay       :    1
            });            
            
         
</script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

