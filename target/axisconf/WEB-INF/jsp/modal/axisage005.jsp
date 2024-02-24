<%/*
*  Fichero: axisage005.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 24/12/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
    <!--********** CALENDARIO ************************* -->
      <!-- Hoja de estilo del Calendario -->
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <!-- Script principal del calendario -->
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <!-- Idioma del calendario, en funcin del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        var buscar=1;
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisage005');                      
        }
        
        function f_but_aceptar() {
        	var domicilio   = '${__formdata.CDOMICI}'; <%-- TCS-7 21/02/2019 AP --%>
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisage005.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_nuevo() {
            if (document.getElementById("CTIPAGE") != null){
            	if (document.getElementById("CTIPAGE")[0] != null){
            		document.getElementById("CTIPAGE")[0].selected = "1";
            	}
            }
            objDom.setValorPorId("CPADRE", "");
            objDom.setValorPorId("TPADRE", "");
            objDom.setValorPorId("FMOVINI", "");
            if (document.getElementById("CPERNIVEL") != null){
            	if (document.getElementById("CPERNIVEL")[0] != null){
            		document.getElementById("CPERNIVEL")[0].selected = "1";
            	}
            }
            if (document.getElementById("CPOLNIVEL") != null){
            	if (document.getElementById("CPOLNIVEL")[0] != null){
            		document.getElementById("CPOLNIVEL")[0].selected = "1";
            	}
            }
            
            
            objDom.setValorPorId("CPOLVISIO", "");
            objDom.setValorPorId("TPOLVISIO", "");
            objDom.setValorPorId("CPERVISIO", "");
            objDom.setValorPorId("TPERVISIO", "");
            
            objDom.setValorPorId("TPERVISIO", "");
            objDom.setValorPorId("CAGEIND", "");
            objDom.setValorPorId("TAGEIND", "");
            f_cargar_propiedades_pantalla();
            CPERVISIO = objDom.getValorPorId("CPERVISIO");
               if (!objUtiles.estaVacio(CPERVISIO))
                    f_actualizar_visio(CPERVISIO);
        }

        function f_rellenar_formulario(CTIPAGE_FMOVINI_CPADRE_TPADRE_CPERNIVEL_CPERVISIO_CAGENTE_TAGENTE) {
            var splitted  = CTIPAGE_FMOVINI_CPADRE_TPADRE_CPERNIVEL_CPERVISIO_CAGENTE_TAGENTE.split("_");
            var CTIPAGE   = splitted[0];
            var FMOVINI   = splitted[1];
            var CPADRE    = splitted[2];
            var TPADRE    = splitted[3];
            var CPERNIVEL = splitted[4];
            var CPERVISIO = splitted[5];
            var CAGENTE = splitted[6];
            var TAGENTE = splitted[7];
            var CPOLVISIO  = splitted[8];
            var CPOLNIVEL  = splitted[9];
            var CENLACE    = splitted[10];
            var TENLACE    = splitted[11];
            if (!objUtiles.estaVacio(CTIPAGE))
                objDom.setValorPorId("CTIPAGE", CTIPAGE);
            else
                objDom.setValorPorId("CTIPAGE", "");
            
            if (!objUtiles.estaVacio(CPADRE)) {
                objDom.setValorPorId("CPADRE", CPADRE);
                objDom.setValorPorId("TPADRE", TPADRE);
            } else {
                objDom.setValorPorId("CPADRE", "");
                objDom.setValorPorId("TPADRE", "");
            }
            
            if (!objUtiles.estaVacio(CENLACE)) {
                objDom.setValorPorId("CENLACE", CENLACE);
                objDom.setValorPorId("TENLACE", TENLACE);
            } else {
                objDom.setValorPorId("CENLACE", "");
                objDom.setValorPorId("TENLACE", "");
            }
            
            if (!objUtiles.estaVacio(FMOVINI))
                objDom.setValorPorId("FMOVINI", objUtiles.formateaTimeStamp2(FMOVINI));
            else
                objDom.setValorPorId("FMOVINI", "");
                
            objDom.setValorPorId("CPERVISIO", CPERVISIO);
            f_actualizar_visio(CPERVISIO)
            
            if (document.getElementById('CAGEIND')!=null){
                if (!objUtiles.estaVacio(CAGENTE)) {
                    objDom.setValorPorId("CAGEIND", CAGENTE);
                    objDom.setValorPorId("TAGEIND", TAGENTE);
                } else {
                    objDom.setValorPorId("CAGEIND", "");
                    objDom.setValorPorId("TAGEIND", "");
                }
            }
            
            if (!objUtiles.estaVacio(CPOLVISIO)){
                objDom.setValorPorId("CPOLVISIO", CPOLVISIO);
            }
            if (!objUtiles.estaVacio(CPOLNIVEL)){
                objDom.setValorPorId("CPOLNIVEL", CPOLNIVEL);
            }

            
        }
        
        function f_actualizar_agente(CAGENTE, pmodo) {
		//alert("act agente");
                modo = pmodo;
                objAjax.invokeAsyncCGI("modal_axisage005.do", callbackAjaxActualizarAgente, 
                "operation=actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
        }
        
        function f_actualizar_visio(CAGENTE) {
		//alert("act visio");
            if (objUtiles.estaVacio(CAGENTE)) {
                objDom.setValorPorId("CPERVISIO", "");
                objDom.setValorPorId("TPERVISIO", "");
            }else{
                objAjax.invokeAsyncCGI("modal_axisage005.do", callbackAjaxActualizarAgenteVisio, 
                    "operation=actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
            }
        }        
        
        function f_actualizar_visioPOL(CAGENTE) {
		//alert("act visio pol");
            if (objUtiles.estaVacio(CAGENTE)) {
                objDom.setValorPorId("CPOLVISIO", "");
                objDom.setValorPorId("TPOLVISIO", "");
            }else{
                objAjax.invokeAsyncCGI("modal_axisage005.do", callbackAjaxActualizarAgenteVisioPOL, 
                    "operation=actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
            }
        } 
        
        function f_onload() {
            if (${requestScope.grabarOK == true})
                parent.f_aceptar_modales_axisage004_axisage005("axisage005");
            else if (${requestScope.grabarOK == null}){
            
                try {
                    document.miForm.selRed[0].checked = true;
                    document.miForm.selRed[0].onclick();                
                } catch (e) {
                    try {
                        document.miForm.selRed.checked = true;
                        document.miForm.selRed.onclick();
                    } catch (e2) {
                    }
                } 
                
            }
            
            f_cargar_propiedades_pantalla();
            
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        var modo = 0;
        function f_abrir_axisctr014(pmodo) {
            modo = pmodo;
            f_abrir_modal("axisctr014", true);
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
    
        function f_aceptar_axisctr014 (CAGENTE){
            f_cerrar_axisctr014();
            if (modo == 1){
                objDom.setValorPorId("CPADRE", CAGENTE);            
                f_actualizar_agente(CAGENTE, modo);
            }else if (modo == 2){
                if (document.getElementById('CAGEIND')!=null){
                    objDom.setValorPorId("CAGEIND", CAGENTE); 
                    f_actualizar_agente(CAGENTE, modo);
                }
            }else if (modo == 3){
                if (document.getElementById('CENLACE')!=null){
                    objDom.setValorPorId("CENLACE", CAGENTE); 
                    f_actualizar_agente(CAGENTE, modo);
                }
            }else if (modo == 4){
                if (document.getElementById('CPOLVISIO')!=null){
                    objDom.setValorPorId("CPOLVISIO", CAGENTE); 
                    f_actualizar_agente(CAGENTE, modo);
                }
            }else if (modo == 5){
                if (document.getElementById('CPERVISIO')!=null){
                    objDom.setValorPorId("CPERVISIO", CAGENTE); 
                    f_actualizar_agente(CAGENTE, modo);
                }
            }
            
        }

        
        function f_aceptar_axisage006(CAGENTE, TAGENTE) {
            objUtiles.cerrarModal("axisage006");
            if (buscar==1){
                objDom.setValorPorId("CPERVISIO", CAGENTE);
                objDom.setValorPorId("TPERVISIO", TAGENTE);
            }else{
                objDom.setValorPorId("CPOLVISIO", CAGENTE);
                objDom.setValorPorId("TPOLVISIO", TAGENTE);
            }    
        }
        
        function f_cerrar_axisage006() {
            objUtiles.cerrarModal("axisage006");     
        }

        /****************************************************************************************/
        /******************************* CALLBACKS AJAX *****************************************/
        /****************************************************************************************/    

        function callbackAjaxActualizarAgenteVisio(ajaxResponseText) {
		//alert("Al volver en agente visio"+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            objDom.setValorPorId("CPERVISIO", "");
            objDom.setValorPorId("TPERVISIO", "");
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]))
                        objDom.setValorPorId("CPERVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0]))
                        objDom.setValorPorId("TPERVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                } else {
                    objDom.setValorPorId("CPERVISIO", "");    //prueba Sheila
                    objDom.setValorPorId("TPERVISIO", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            if (objUtiles.estaVacio(objDom.getValorPorId("CPERVISIO"))) {
                var mensajesAlert = "<axis:alt f='axisage003' c='MENSAAGE' lit='101378'/>";
                alert(mensajesAlert);
            }else{
                f_actualizar_visioPOL(document.getElementById("CPOLVISIO").value);
            }
            
        }
        
        
        function callbackAjaxActualizarAgenteVisioPOL(ajaxResponseText) {
		//alert("Al volver en agente pol"+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            objDom.setValorPorId("CPOLVISIO", "");
            objDom.setValorPorId("TPOLVISIO", "");
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]))
                        objDom.setValorPorId("CPOLVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0]))
                        objDom.setValorPorId("TPOLVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                } else {
                    objDom.setValorPorId("CPOLVISIO", "");
                    objDom.setValorPorId("TPOLVISIO", "");    //prueba Sheila
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                   alert (e.name + " " + e.message);
            }
            
            if (objUtiles.estaVacio(objDom.getValorPorId("CPOLVISIO"))) {
                var mensajesAlert = "<axis:alt f='axisage003' c='MENSAAGE' lit='101378'/>";
                alert(mensajesAlert);
            }
        }
        
        function callbackAjaxActualizarAgente(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0])){
                        if (modo == 1){
                            objDom.setValorPorId("CPADRE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        }else if (modo == 2){
                            objDom.setValorPorId("CAGEIND", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        }else if (modo == 3){
                            objDom.setValorPorId("CENLACE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        }else if (modo==4){
                            objDom.setValorPorId("CPOLVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        }else if (modo==5){
                            objDom.setValorPorId("CPERVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                        }
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])){
                         if (modo == 1){
                            objDom.setValorPorId("TPADRE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        }else if (modo == 2){
                            objDom.setValorPorId("TAGEIND", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        }else if (modo == 3){
                            objDom.setValorPorId("TENLACE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        }else if (modo == 4){
                            objDom.setValorPorId("TPOLVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        }else if (modo == 5){
                            objDom.setValorPorId("TPERVISIO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        }
                    }
                } else {
                    if (modo == 1){
                            objDom.setValorPorId("CPADRE", "");
                            objDom.setValorPorId("TPADRE", "");
                        }else if (modo == 2){
                            objDom.setValorPorId("CAGEIND", "");
                            objDom.setValorPorId("TAGEIND", "");
                        }else if (modo == 3){
                            objDom.setValorPorId("CENLACE", "");
                            objDom.setValorPorId("TENLACE", "");
                        }                        
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }

        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisage005.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage005" c="TIT_AXISAGE005" lit="9000712"/></c:param>     <%-- Mantenimiento de Red Comercial --%>
            <c:param name="formulario"><axis:alt f="axisage005" c="TIT_AXISAGE005" lit="9000712"/></c:param> <%-- Mantenimiento de Red Comercial --%>
            <c:param name="form">axisage005</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr014|<axis:alt f="axisage005" c="TIT_AXISCTR014" lit="1000234"/><%-- Mantenimiento de Agentes --%>#axisage006|<axis:alt f="axisage005" c="TIT_AXISAGE006" lit="9000713"/><%-- Bsqueda de Agentes --%></c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>        
        <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/>  
        <input type="hidden" id="CTIPAGE" name="CTIPAGE" value="${__formdata.CTIPAGE}"/> 
        <input type="hidden" id="CDOMICIAGE" name="CDOMICIAGE" value="${__formdata.CDOMICIAGE}"/>  <%-- TCS-7 21/02/2019 AP --%> <%-- IAXIS-2415 27/02/2019 --%>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>  
                    <div class="titulo"><img src="images/flecha.gif"/>
                    <b> ${__formdata.CAGENTE}   
                    </div>
                    <table class="area" align="center">                    
                        <tr>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>   
                        <tr>
                            <td class="titulocaja" colspan="4">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <%-- DisplayTag Red Comercial --%>
                                <c:set var="title0"><axis:alt f="axisage005" c="FDESDE" lit="104095"/></c:set>  <%-- Desde --%>
                                <c:set var="title1"><axis:alt f="axisage005" c="FHASTA" lit="103051"/></c:set>  <%-- Hasta --%>
                                <c:set var="title2"><axis:alt f="axisage005" c="CTIPAGE" lit="9000519"/></c:set> <%-- Tipo agente --%>
                                <c:set var="title3"><axis:alt f="axisage005" c="TPADRE" lit="1000566"/></c:set> <%-- Gestor --%>
            
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="modal_axisage005.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" headerClass="sortable headwidth5"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="radio" name="selRed" onclick="f_rellenar_formulario(this.id)"
                                                id="${HISTORICO.OB_IAX_REDCOMERCIAL.CTIPAGE}_${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVINI}_${HISTORICO.OB_IAX_REDCOMERCIAL.CPADRE}_${HISTORICO.OB_IAX_REDCOMERCIAL.TPADRE}_${HISTORICO.OB_IAX_REDCOMERCIAL.CPERNIVEL}_${HISTORICO.OB_IAX_REDCOMERCIAL.CPERVISIO}_${HISTORICO.OB_IAX_REDCOMERCIAL.CAGEIND}_${HISTORICO.OB_IAX_REDCOMERCIAL.TAGEIND}_${HISTORICO.OB_IAX_REDCOMERCIAL.CPOLVISIO}_${HISTORICO.OB_IAX_REDCOMERCIAL.CPOLNIVEL}_${HISTORICO.OB_IAX_REDCOMERCIAL.CENLACE}_${HISTORICO.OB_IAX_REDCOMERCIAL.TENLACE}"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVINI" style="width:15%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVINI}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVFIN" style="width:15%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVFIN}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TCTIPAGE" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TCTIPAGE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPADRE" style="width:50%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPADRE}
                                            </div>
                                        </display:column>
                                    </display:table>                                                        
                                </div>
                                <div class="separador">&nbsp; </div>                                                                                                                            
                            </td> 
                        </tr>       
                        <tr>

                             <%-- Fecha --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage005" c="FMOVIMI" lit="100562"/></b>  
                            </td>                 
                             <%-- Gestor --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage005" c="CPADRE" lit="1000566"/></b>  
                            </td>                 
                        </tr>
                        <tr>
                           
                            <%-- Fecha --%>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:46%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FMOVINI}"/>" name="FMOVINI" id="FMOVINI"
                                alt="<axis:alt f="axisage005" c="FMOVIMI" lit="100562"/>" title="<axis:alt f="axisage005" c="FMOVIMI" lit="100562"/>"
                                <axis:atr f="axisage005" c="FMOVINI" a="formato=fecha&obligatorio=true"/> /><a style="vertical-align:middle;"><img
                                id="icon_FMOVINI" alt="<axis:alt f="axisage005" c="FMOVIMI" lit="100562"/>" title="<axis:alt f="axisage005" c="FMOVIMI" lit="100562"/>" src="images/calendar.gif"/></a>
                            </td>            
                            <%-- Gestor --%>
                            <td class="campocaja">
                                <input type="text" name="CPADRE" id="CPADRE" value="${__formdata.CPADRE}" class="campowidthinput campo campotexto" style="width:70%"
                                onchange="f_actualizar_agente(this.value,1)" obligatorio="true" formato="entero" title="<axis:alt f="axisage005" c="CPADRE" lit="1000566"/>" alt="<axis:alt f="axisage005" c="CPADRE" lit="1000566"/>" />
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(1)" style="cursor:pointer"
                                alt="<axis:alt f='axisage005' c='ICO_CPADRE' lit='9000508'/>" title="<axis:alt f='axisage005' c='ICO_CPADRE' lit='9000508'/>"/>
                            </td>
                            <td class="campocaja">    
                                <input readonly="true" type="text" name="TPADRE" id="TPADRE" value="${__formdata.TPADRE}" class="campowidthinput campo campotexto"/>
                            </td>
                        </tr>
                        <tr>
                            <%-- Tipo de visin --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage005" c="CPERNIVEL" lit="9000708"/></b>   
                            </td>
                            <%-- Nivel de visin --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage005" c="CPERVISIO" lit="9000707"/></b>   
                            </td>
                        </tr>
                        
                         <c:set var="VALOR_DEFECTO">
                                 <c:if test="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.CPERNIVEL==null && __formdata.CPERNIVEL==null}" >
                                    ${__formdata.LISTVALORES.LSTTIPOVISION[0].CATRIBU}
                                 </c:if>
                         </c:set>
                        
                        <tr>
                            
                           
                            <%-- Tipo de visin --%>
                            <td class="campocaja" colspan="2">
                                <select name="CPERNIVEL" id="CPERNIVEL" size="1"
                                <axis:atr f="axisage005" c="CPERNIVEL" a="modificable=true&isInputText=false&obligatorio=true"/>
                                class="campowidthselect campo campotexto"  style="width:79%;" title="<axis:alt f="axisage005" c="CPERNIVEL" lit="9000708"/>" alt="<axis:alt f="axisage005" c="CPERNIVEL" lit="9000708"/>" >&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage005" c="SNV_COMBO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOVISION}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.CPERNIVEL == element.CATRIBU}"> selected = "selected"</c:if>
                                        <c:if test="${__formdata.CPERNIVEL == element.CATRIBU}"> selected = "selected"</c:if>
                                        <c:if test="${VALOR_DEFECTO == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <%-- Nivel de visin --%>
                            <td class="campocaja">           <!-- onclick="buscar=1;f_abrir_modal('axisage006', true, '&buscarAlCargar=false')" ********* f_abrir_axisctr014(5) -->
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:85%;"
                                <c:if test="${empty __formdata.CPERVISIO}">value="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.CPERVISIO}"</c:if> obligatorio="true"  
                                <axis:atr f="axisage005" c="CPERVISIO" a="modificable=true"/>
                                <c:if test="${!empty __formdata.CPERVISIO}"> value="${__formdata.CPERVISIO}"</c:if>
                                name="CPERVISIO" id="CPERVISIO" onchange="f_actualizar_visio(this.value)"
                                title="<axis:alt f='axisage005' c='CPERVISIO' lit='9000707'/>" />                                 
                                <img border="0" src="images/find.gif" id= "ICON_CPERVISIO" name= "ICON_CPERVISIO"
                                onclick="buscar=1;f_abrir_modal('axisage006', true, '&buscarAlCargar=false')"
                                alt="<axis:alt f='axisage005' c='ICO_CPERVISIO' lit='9000508'/>" title="<axis:alt f='axisage005' c='ICO_CPERVISIO' lit='9000508'/>"
                                style="cursor:pointer"/>                                
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15"
                                <c:if test="${empty __formdata.TPERVISIO}">value="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.TPERVISIO}"</c:if> name="TPERVISIO" id="TPERVISIO"
                                <c:if test="${!empty __formdata.TPERVISIO}"> value="${__formdata.TPERVISIO}"</c:if>
                                title="<axis:alt f='axisage005' c='TPERVISIO' lit='9000707'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>
                        </tr>
                        <axis:ocultar f="axisage005" c="NIVELPOLIZA" dejarHueco="false"> 
                        <tr>
                            <%-- Tipo de visin --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage005" c="CPOLNIVEL" lit="9902709"/></b>   
                            </td>
                            <%-- Nivel de visin --%>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisage005" c="CPOLVISIO" lit="9902710"/></b>   
                            </td>
                        </tr>
                        <tr>
                            <%-- Tipo de visin --%>
                            <td class="campocaja" colspan="2">
                                <select name="CPOLNIVEL" id="CPOLNIVEL" size="1" class="campowidthselect campo campotexto"  
                                <axis:atr f="axisage005" c="CPOLNIVEL" a="modificable=true&isInputText=false"/> style="width:79%;">&nbsp;
                                  <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage005" c="SNV_COMBO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOVISION}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.CPOLNIVEL == element.CATRIBU}"> selected = "selected"</c:if>
                                        <c:if test="${__formdata.CPOLNIVEL == element.CATRIBU}"> selected = "selected"</c:if>
                                        <c:if test="${VALOR_DEFECTO == element.CATRIBU}"> selected = "selected"</c:if>>
                                           ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <%-- Nivel de visin --%>
                            <td class="campocaja">   <!-- onclick="buscar=2;f_abrir_modal('axisage006', true, '&buscarOnload=false')" *************  f_abrir_axisctr014(4) --> 
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:85%;"
                                <c:if test="${empty __formdata.CPOLVISIO}">value="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.CPOLVISIO}"</c:if> <axis:atr f="axisage005" c="CPOLNIVEL" a="obligatorio=true"/>
                                <c:if test="${!empty __formdata.CPOLVISIO}">value="${__formdata.CPOLVISIO}"</c:if>
                                name="CPOLVISIO" id="CPOLVISIO" onchange="f_actualizar_visioPOL(this.value)"
                                title="<axis:alt f='axisage005' c='CPOLVISIO' lit='9902709'/>" />                                 
                                <img border="0" src="images/find.gif"
                                onclick="buscar=2;f_abrir_modal('axisage006', true, '&buscarAlCargar=false')" 
                                alt="<axis:alt f='axisage005' c='ICO_CPOLVISIO' lit='9902709'/>" title="<axis:alt f='axisage005' c='ICO_CPOLVISIO' lit='9902709'/>"
                                style="cursor:pointer"/>                                
                            </td>
                            <td class="campocaja">  
                                <input type="text" class="campowidthinput campo campotexto" size="15"
                                <c:if test="${empty __formdata.TPOLVISIO}"> value="${__formdata.HISTORICO[0].OB_IAX_REDCOMERCIAL.TPOLVISIO}"</c:if> name="TPOLVISIO" id="TPOLVISIO"
                                <c:if test="${!empty __formdata.TPOLVISIO}"> value="${__formdata.TPOLVISIO}"</c:if>
                                title="<axis:alt f='axisage005' c='TPOLVISIO' lit='9000707'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>
                        </tr>
                        </axis:ocultar>
                        <axis:ocultar f="axisage005" c="CAGEIND" dejarHueco="false"> 
                        <tr>
                             <%-- Gestor --%>
                             <td class="titulocaja">
                                <b><axis:alt f="axisage005" c="CAGEIND" lit="9902599"/></b>  
                            </td>                 
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <input type="text" name="CAGEIND" id="CAGEIND" value="${__formdata.CAGEIND}" class="campowidthinput campo campotexto" style="width:70%"
                                onchange="f_actualizar_agente(this.value,2)" obligatorio="false" formato="entero" title="<axis:alt f="axisage005" c="CAGEIND" lit="9902599"/>" alt="<axis:alt f="axisage005" c="CAGEIND" lit="9902599"/>" />
                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(2)" style="cursor:pointer"
                                alt="<axis:alt f='axisage005' c='ICO_CAGEIND' lit='9902599'/>" title="<axis:alt f='axisage005' c='ICO_CAGEIND' lit='9902599'/>"/>
                            </td>
                            <td class="campocaja">    
                                <input readonly="true" type="text" name="TAGEIND" id="TAGEIND" value="${__formdata.TAGEIND}" class="campowidthinput campo campotexto"/>
                            </td>
                        </tr>
                        </axis:ocultar>
                        
                        <axis:ocultar f="axisage005" c="CENLACE" dejarHueco="false"> 
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisage005" c="CENLACE" lit="9903796"/></b>  
                                </td>                 
                            </tr>
                            <tr>
                                <td class="campocaja" colspan=2>
                                    <input type="text" name="CENLACE" id="CENLACE" value="${__formdata.CENLACE}" class="campowidthinput campo campotexto" style="width:20%"
                                    onchange="f_actualizar_agente(this.value,3)" formato="entero" title="<axis:alt f="axisage005" c="CENLACE" lit="9903796"/>" alt="<axis:alt f="axisage005" c="CENLACE" lit="9903796"/>" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(3)" style="cursor:pointer"
                                    alt="<axis:alt f='axisage005' c='ICO_CENLACE' lit='9903796'/>" title="<axis:alt f='axisage005' c='ICO_CENLACE' lit='9903796'/>"/>
                                    &nbsp;&nbsp;
                                    <input readonly="true" style="width:50%" type="text" name="TENLACE" id="TENLACE" value="${__formdata.TENLACE}" class="campowidthinput campo campotexto"/>
                                </td>
                            </tr>
                        </axis:ocultar>
                    </table>   
                </td>
            </tr>
        </table>
   
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage005</c:param><c:param name="__botones">cancelar,nuevo,aceptar</c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FMOVINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FMOVINI", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>

</body>
</html>
