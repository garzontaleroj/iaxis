<%/*
*  Fichero: axisadm034.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 20/05/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            revisarEstilos();
            f_cargar_propiedades_pantalla();
            
            var cempres =  "${__formdata.CEMPRES}"; 
            if(!objUtiles.estaVacio(cempres)){
                f_cargar_ramos();
            }
        }
                
        function f_but_aceptar (cual) {
            var SDEVOLU = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SDEVOLU = cual;
            else if (!objUtiles.estaVacio(document.miForm.seleccionaDev)) {
                // Checkeada por el radio button
                SDEVOLU = objUtiles.f_GuardaCasillasChecked("seleccionaDev");
            } 
            
            if (typeof SDEVOLU == 'boolean' || objUtiles.estaVacio (SDEVOLU)) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
                // Si hay una seleccionada, llamar al Action.
                parent.f_aceptar_axisadm034(SDEVOLU);
            
         }

        function f_but_imprimir (cual) {
            var SGESCARTA = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SGESCARTA = cual;
            else if (!objUtiles.estaVacio(document.miForm.seleccionaDev)) {
                // Checkeada por el radio button
                SGESCARTA = objUtiles.f_GuardaCasillasChecked("seleccionaDev");
            } 

            // bug 0022030            
            var SDEVOLU = "";

            if (typeof SGESCARTA == 'boolean' || objUtiles.estaVacio (SGESCARTA)) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else{
                // bug 0022030          
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_cartas&SGESCARTA=" + SGESCARTA + "&SDEVOLU=" + SDEVOLU, 0, 0);
            }
            
         } 
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
            objUtiles.ejecutarFormulario("modal_axisadm034.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
     
        }         
        function f_but_buscar() {
           objUtiles.ejecutarFormulario("modal_axisadm034.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisadm034');
        }

        function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada            
           objDom.setValorPorId("CEMPRES", CEMPRES);
           objUtiles.ejecutarFormulario("modal_axisadm034.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_cargar_ramos(){
            var ccompani = objDom.getValorPorId("CEMPRES");
            if (!objUtiles.estaVacio(ccompani)) {
                if (document.getElementById('ramoProducto')!= null){
                    if (document.getElementById('ramoProducto').options[0]!=null){
                        document.getElementById('ramoProducto').value = document.getElementById('ramoProducto').options[0].value;
                    }    
                }
                
                if (document.getElementById('SPRODUC')!= null){
                    if (document.getElementById('SPRODUC').options[0]!=null){
                        document.getElementById('SPRODUC').value = document.getElementById('SPRODUC').options[0].value;
                    }
                }
            }
            objDom.setValorComponente(document.miForm.CRAMO, null);
            objDom.setValorComponente(document.miForm.TRAMO, null);
            
            objAjax.invokeAsyncCGI("modal_axisadm034.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
        }
        
        function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisadm034.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
        }      
        
        function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0); 
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }
                   f_cargar_productos();

                }
            }  
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   
                }
            } 
       
            function f_actualizar_agente(){
                 if (objValidador.validaEntrada()) {
                    var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                    objDom.setValorPorId("CAGENTE",CAGENTE);
                    objDom.setValorPorId("NOMBRE_TEXT", ""); 
                    objAjax.invokeAsyncCGI("modal_axisadm034.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
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
                objAjax.invokeAsyncCGI("modal_axisadm034.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
    
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
            
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>         
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm034" c="titform" lit="9001638" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm034" c="titsubf" lit="9001638" /></c:param>
                <c:param name="form">axisadm034</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisadm034" c="nidytit" lit="1000205" /></c:param>
             </c:import>  
                
                <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt c="titulo14" f="axisfis002" lit="1000234" /></c:param>
                    <c:param name="nid" value="axisctr014" />
                </c:import>
                
                <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                       
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axisadm034" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="EMPRESA" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm034" c="CRAMO" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="CRAMO" lit="100784"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm034" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisadm034" c="SPRODUC" lit="100829"/></b> <%-- Producte --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axisadm034" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja">                                
                                                    <select name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axisadm034" c="CEMPRES" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:90%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm034" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                            <option value = "${element.CEMPRES}"
                                                            <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                                                ${element.TEMPRES} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm034" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                                <td class="campocaja">
                                                    <select name = "ramoProducto" id="ramoProducto" style="width:90%;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm034" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                            <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                                <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                                ${ramos.TRAMO}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm034" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan="2">
                                                    <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:95%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm034" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                                            <option value = "${element.SPRODUC}"
                                                            <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                                                ${element.TTITULO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axisadm034" c="NREMESA" dejarHueco="false"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="NREMESA" lit="9001945"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm034" c="CAGENTE" dejarHueco="false"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="CAGENTE" lit="9901930"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm034" c="NREMESA">
                                                <td class="campocaja">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NREMESA" name="NREMESA" size="15"
                                                    value="${__formdata.NREMESA}" <axis:atr f="axisadm034" c="NREMESA" a="modificable=true"/>/>
                                                </td>  
                                            </axis:visible>
                                            
                                            <axis:ocultar f="axisadm034" c="CAGENTE"  dejarHueco="false" > 
                                                <td class="campocaja" colspan="3">
                                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                                     title="<axis:alt  c="CAGENTE" f="axisadm034" lit="9901930"/>" 
                                                    <axis:atr f="axisadm034" c="CAGENTE" a="modificable=true&obligatorio=false"/> onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:73%" class="campowidthinput campo campotexto"/>
                                                </td>                                    
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                           <axis:visible f="axisadm034" c="NPOLIZA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="npoliza" lit="100836" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm034" c="NRECIBO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="nrecibo" lit="100895" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axisadm034" c="CESTIMP" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="cestimp" lit="100587" /></b>
                                                </td>
                                             </axis:visible>	
                                             
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisadm034" c="NPOLIZA">
                                                    
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                                            value="${__formdata.NPOLIZA}" <axis:atr f="axisadm034" c="NPOLIZA" a="modificable=true"/>/>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                        <axis:visible f="axisadm034" c="NRECIBO">
                                                    
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NRECIBO" name="NRECIBO" size="15"
                                                            value="${__formdata.NRECIBO}" <axis:atr f="axisadm034" c="NRECIBO" a="modificable=true"/>/>
                                                     </td>     
                                                     
                                          </axis:visible>                                           
                                          <axis:visible f="axisadm034" c="CESTIMP">
                                                    
                                                     <td class="campocaja">
                                                            <select name = "CESTIMP" id ="CESTIMP" size="1" <axis:atr f="axisadm034" c="CESTIMP" a="modificable=true&isInputText=false"/>
                                                                title="<axis:alt f="axisadm034" c="cestimp" lit="101619" />"
                                                                class="campowidthselect campo campotexto">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm034" c="cestimp2" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.listValores.lstestados}" var="emp">
                                                                    <option value = "${emp.CATRIBU}" <c:if test="${emp.CATRIBU  == __formdata.CESTIMP}">selected</c:if>>${emp.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                            
                                         </tr>
                                         <tr>
                                             <axis:visible f="axisadm034" c="FINI" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="fini" lit="9000526" /></b>
                                                </td>
                                             </axis:visible>	  
                                           <axis:visible f="axisadm034" c="FFIN" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm034" c="ffin" lit="9000527" /></b>
                                                </td>
                                             </axis:visible>	
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisadm034" c="FINI">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FINI" name="FINI" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINI}"/>" title="<axis:alt f="axisadm034" c="fini2" lit="100885"/>" <axis:atr f="axisadm034" c="FINI" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FINI" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm034" c="icon_fini2" lit="108341" />" title="<axis:alt f="axisadm034" c="icon" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisadm034" c="FFIN">
                                                 <td class="campocaja">
                                                    <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FFIN" name="FFIN" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" title="<axis:alt f="axisadm034" c="ffin2" lit="100885"/>" <axis:atr f="axisadm034" c="FFIN" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FFIN" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axisadm034" c="icon_fffin3" lit="108341" />" title="<axis:alt f="axisadm034" c="ffin4" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                         </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
<div class="separador">&nbsp;</div>                       
                        <!--campos-->
                  <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisadm034" c="camp1" lit="9001729"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm034" c="camp2" lit="9001640"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm034" c="camp3" lit="100836"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm034" c="camp4" lit="100895"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm034" c="camp5" lit="9000437"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm034" c="camp6" lit="9001192"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm034" c="camp7" lit="9001630"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm034" c="camp8" lit="9001642"/></c:set>
                                            <c:set var="title9"><axis:alt f="axisadm034" c="camp9" lit="9001643"/></c:set>
                                            <c:set var="title10"><axis:alt f="axisadm034" c="camp10" lit="100587"/></c:set>
                                            
                                            <div class="seccion displayspaceGrande">
                                            <display:table name="${__formdata.cartas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisadm034.do?paginar=true"
                                            sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input <c:if test="${miListaId['seleccionaDev']}">checked</c:if> type="radio" id="seleccionaDev" name="seleccionaDev" value="${miListaId['SGESCARTA']}"/></div>
                                                </display:column>
                                                <display:column title="${title1}" headerClass="sortable" sortProperty="SGESCARTA" style="width:5%"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SGESCARTA']}')">${miListaId.SGESCARTA}</a></div>
                                                </display:column>
                                                <display:column title="${title2}" headerClass="sortable" sortProperty="TTIPCAR"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SGESCARTA']}')">${miListaId.TTIPCAR}</a></div>
                                                </display:column>
                                                <display:column title="${title3}" headerClass="sortable" sortProperty="NPOLIZA"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SGESCARTA']}')">${miListaId.NPOLIZA}</a></div>
                                                </display:column>
                                                <display:column title="${title4}" headerClass="sortable" sortProperty="NRECIBO"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.NRECIBO}</div>
                                                </display:column>                                                
                                                <display:column title="${title6}" headerClass="sortable" sortProperty="FSOLICI"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FSOLICI}"/></div>    
                                                </display:column>                                                
                                                <display:column title="${title7}" headerClass="sortable" sortProperty="USUSOL"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.USUSOL}</div>    
                                                </display:column>                                                
                                                <display:column title="${title8}" headerClass="sortable" sortProperty="FIMPRES"  media="html" autolink="false" >
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FIMPRES}"/></div>    
                                                </display:column> 
                                                <display:column title="${title9}" headerClass="sortable" sortProperty="USUIMP"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.USUIMP}</div>    
                                                </display:column>
                                                <display:column title="${title10}" headerClass="sortable" sortProperty="USUSOL"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.TESTIMP}</div>    
                                                </display:column>                                                
                                             </display:table> 
                                            </div>	
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm034</c:param><c:param name="f">axisadm034</c:param>
                <c:param name="f">axisadm034</c:param>
                <c:param name="__botones">cancelar,buscar,aceptar<axis:visible f="axisadm034" c="BT_IMPRIMIR">,imprimir</axis:visible></c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FFIN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFIN",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>

