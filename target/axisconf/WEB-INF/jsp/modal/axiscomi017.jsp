<%/*
*  Fichero: axiscomi017.jsp
*  Fecha: 17/09/2011
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
            //alert("on load");
            f_recarga_combos('E');
            f_cargar_propiedades_pantalla();
        }
         
        function f_but_buscar() {
         if (objValidador.validaEntrada())
           objUtiles.ejecutarFormulario("modal_axiscomi017.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_recargar(thiss) {
           if (thiss.value > 0) 
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario("modal_axiscomi017.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscomi017');
        }
        
        function f_recarga_combos(comboOrigen) {
        //alert("en recarga de combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");                
               
                objAjax.invokeAsyncCGI("modal_axiscomi017.do", callbackAjaxActualizarCombos, 
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
          
       function f_editar_convenio(CONVENIO,FINIVIG,MODO) {
            parent.f_editar_convenio(CONVENIO,FINIVIG,MODO);
        }    
       
       function f_alta_convenio(){
            parent.f_alta_convenio();
       }

       /* ******************************************************************************************** */
       /* *********************************** tratamiento agentes ************************************ */
       /* ******************************************************************************************** */
        
        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("modal_axiscomi017.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
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
                    objDom.setValorPorId("CAGENTE","");
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

    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" id="operacion" value=""/>
            <input type="hidden" name="selRentaValor" id="selRentaValor" value=""/>
            <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
           <%-- <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>--%>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>  
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi017" c="LIT_FORMULARIO_1" lit="9905092" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi017" c="LIT_PANTALLA_1" lit="9905092" /></c:param>
                <c:param name="form">axiscomi017</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscomi017" c="TITULO_INC" lit="1000234"/></c:param>
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
                                           <axis:visible f="axiscomi017" c="CRAMO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscomi017" c="LIT_CRAMO" lit="100784" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axiscomi017" c="SPRODUC" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscomi017" c="LIT_SPRODUC" lit="100829" /></b>
                                                </td>
                                             </axis:visible>	                                 
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axiscomi017" c="CRAMO"> 
                                                <td class="campocaja">
                                                    <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axiscomi017" c="LIT_TIT_CRAMO" lit="100784" />" onchange="f_recarga_combos('R');"
                                                    <axis:atr f="axiscomi017" c="CRAMO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi017" c="LIT_SEL_CRAMO" lit="108341" /> - </option>
                                                        <c:forEach items="${DOM_LSTRAMOS}" var="item">
                                                            <option value = "${item.CRAMO}" <c:if test="${!empty __formdata.CRAMO  && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>  
                                            </axis:ocultar>
                                            <axis:ocultar f="axiscomi017" c="SPRODUC"> 
                                                <td class="campocaja" colspan="1">
                                                    <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:95%"
                                                    title="<axis:alt f="axiscomi017" c="LIT_TIT_SPRODUC" lit="100829" />" <axis:atr f="axisadm054" c="SPRODUC" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi017" c="LIT_SEL_SPRODUC" lit="108341" /> - </option>
                                                        <c:forEach items="${DOM_LSTPRODUCTOS}" var="item">
                                                            <option value = "${item.SPRODUC}" <c:if test="${!empty __formdata.SPRODUC  && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi017" c="CAGENTE_TEXT" lit="9902363"/></b> <%-- Intermediario --%>
                                            </td>
                                            <td class="titulocaja" colspan="3">
                                                <b><axis:alt f="axiscomi017" c="NOMBRE_TEXT" lit="100588"/>&nbsp;<axis:alt f="axiscomi017" c="INTERMED_D" lit="9902363"/></b> <%-- Descripción Intermediario--%>
                                            </td>                  
                                        </tr>
                                        <tr>
                                            <td class="campocaja">                 
                                                <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:65%;" value="${__formdata.CODI}" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axiscomi017" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    &nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td class="campocaja" colspan="3">                             
                                                 <input readonly="true" type="text" style="width:50%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto"/>
                                            </td>
                                            <td class="titulocaja">
                                                &nbsp;
                                            </td>                                 
                                        </tr>
                                        <tr>
                                           <axis:visible f="axiscomi017" c="FINIVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscomi017" c="LIT_FINIVIG" lit="9000716" /></b>
                                                </td>
                                             </axis:visible>	
                                           <axis:visible f="axiscomi017" c="FFINVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axiscomi017" c="LIT_FFINVIG" lit="9000717" /></b>
                                                </td>
                                             </axis:visible>	
                                        </tr>
                                        <tr>
                                            <axis:visible f="axiscomi017" c="FINIVIG">
                                                 <td class="campocaja">
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FINIVIG" name="FINIVIG" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" title="<axis:alt f="axiscomi017" c="x" lit="100885"/>" <axis:atr f="axiscomi017" c="FINIVIG" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FINIVIG" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axiscomi017" c="ddd" lit="108341" />" title="<axis:alt f="axiscomi017" c="x1" lit="108341" />" src="images/calendar.gif"/>
                                                    </a>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axiscomi017" c="FFINVIG">
                                                 <td class="campocaja">
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FFINVIG" name="FFINVIG" size="15"
                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" title="<axis:alt f="axiscomi017" c="x" lit="100885"/>" <axis:atr f="axiscomi017" c="FFINVIG" a="modificable=true&formato=fecha"/>/>
                                                    <a id="icon_FFINVIG" style="vertical-align:middle;" href="#">
                                                    <img border="0" alt="<axis:alt f="axiscomi017" c="ddd" lit="108341" />" title="<axis:alt f="axiscomi017" c="x1" lit="108341" />" src="images/calendar.gif"/>
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
                        
                  <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axiscomi017" c="LIT_IMG_1" lit="9905091" />
                  </div>      
                  <table class="seccion">
                             <!-- titulo -->
                                    <tr>
                                        <td class="campocaja" >
                                            <div style="float:right;" id="DATOS_CORRETAJE"><img id="DSP_CORRETAJE_parent" src="images/new.gif" onclick="f_alta_convenio()" alt="<axis:alt f="axisret002" c="LIT_TIT_CONV" lit="9904269" />" title="<axis:alt f="axisret002" c="LIT_TIT_CONV" lit="9904269" />"  style="cursor:pointer"/></div>
                                        </td>                    
                                    </tr>
                                    <!-- titulo -->
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                   
                                    <tr>
                                        <td>
                                            <c:set var="title0"><axis:alt f="axiscomi017" c="LISTA_CODIGO" lit="109155"/></c:set>
                                            <c:set var="title1"><axis:alt f="axiscomi017" c="LISTA_TDESCRI" lit="100588"/></c:set>
                                            <c:set var="title2"><axis:alt f="axiscomi017" c="LISTA_FINIVIG" lit="9000716"/></c:set>
                                            <c:set var="title3"><axis:alt f="axiscomi017" c="LISTA_FFINVIG" lit="9000717"/></c:set>
                                            <c:set var="title4"><axis:alt f="axiscomi017" c="EDITAR" lit="9901356"/></c:set>
                                            <c:set var="title5"><axis:alt f="axiscomi017" c="VIGENCIA" lit="9901307"/></c:set>
                                            <c:set var="title6"><axis:alt f="axiscomi017" c="CONSULTAR" lit="1000439"/></c:set>
                                            
                            
                                            <div class="seccion displayspaceGrande">
                                            <display:table name="${lista_convenios}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axiscomi017.do?paginar=true"
                                            sort="list" cellpadding="0" cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                               <display:column title="${title0}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" style="width:10%" >
                                                    <div class="dspText">${miListaId.SCOMCONV}</div>
                                                </display:column>
                                                <display:column title="${title1}" headerClass="sortable" sortProperty="TDESCONV"  media="html" autolink="false" style="width:55%">
                                                    <div class="dspText">${miListaId.TCONVENIO}</div>
                                                </display:column>
                                                <display:column title="${title2}" headerClass="sortable" sortProperty="FINIVIG"  media="html" autolink="false" style="width:10%">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINIVIG}"/></div>    
                                                </display:column>
                                                <display:column title="${title3}" headerClass="sortable" sortProperty="FFINVIG"  media="html" autolink="false" style="width:10%">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FFINVIG}"/></div>    
                                                </display:column>
                                                
                                                <display:column title="${title4}" headerClass="sortable" sortProperty="TNOMTOM"  media="html" autolink="false" style="width:5%">
                                                    <div class="dspIcons">
                                                        <c:if test="${miListaId.ESEDITABLE == 1 && empty miListaId.FANUL}">
                                                        <img border="0"
                                                            alt='<axis:alt f="axiscomi017" c="MENS_ALT" lit="9901356"/>'
                                                            title1='<axis:alt f="axiscomi017" c="MENS_ALT" lit="9901356"/>'
                                                            src="images/lapiz.gif"
                                                            width="16px" height="16px"
                                                            style="cursor:pointer;"
                                                            onclick="f_editar_convenio('${miListaId.SCOMCONV}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINIVIG}"/>','MODIFICAR')"/>
                                                        </c:if>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title5}" headerClass="sortable" sortProperty="TNOMTOM"  media="html" autolink="false" style="width:10%">
                                                    <div class="dspIcons">
                                                        <c:if test="${miListaId.ESEDITABLE == 1 && empty miListaId.FANUL}">
                                                        <img border="0"
                                                            alt='<axis:alt f="axiscomi017" c="MENS_ALT" lit="9901307"/>'
                                                            title1='<axis:alt f="axiscomi017" c="MENS_ALT" lit="9901307"/>'
                                                            src="images/calendar.gif"
                                                            width="16px" height="16px"
                                                            style="cursor:pointer;"
                                                            onclick="f_editar_convenio('${miListaId.SCOMCONV}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINIVIG}"/>','NUEVAVIG')"/>
                                                        </c:if>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title6}" headerClass="sortable" sortProperty="TNOMTOM"  media="html" autolink="false" style="width:10%">
                                                    <div class="dspIcons">
                                                        <img border="0"
                                                            alt='<axis:alt f="axiscomi017" c="MENS_ALT" lit="1000439"/>'
                                                            title1='<axis:alt f="axiscomi017" c="MENS_ALT" lit="1000439"/>'
                                                            src="images/mas.gif"
                                                            width="11px" height="11px"
                                                            style="cursor:pointer;"
                                                            onclick="f_editar_convenio('${miListaId.SCOMCONV}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FINIVIG}"/>','CONSULTAR')"/>
                                                    </div>
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
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi017</c:param><c:param name="f">axiscomi017</c:param>
                <c:param name="f">axiscomi017</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINIVIG",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIVIG", 
        singleClick    :    true,
        firstDay       :    1
    });
    

    Calendar.setup({
        inputField     :    "FFINVIG",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINVIG",  
        singleClick    :    true,
        firstDay       :    1
    });

</script>    
    </body>
</html>