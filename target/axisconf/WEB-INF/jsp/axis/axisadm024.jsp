<%/*
*  Fichero: axisadm024.jsp
*
*  Fecha: 19/02/2009
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisadm024" c="TITULO" lit="9000960"/></title> <%-- Importes pendientes de tratar --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        var nuevaVentana         = null;
        var idVentanas           = new Array();
        var contadorVentanas     = 0;

        function f_onload() { 
        	var refcur = "${requestScope.REFCURSOR}";           
        
            if (objUtiles.estaVacio(refcur)) {                    
                // No hay datos
                // Abrir buscador AXISADM026
                f_but_9000508();                                    
            } else if (!objUtiles.estaVacio("${__formdata.SPROCES_CODA}") && objUtiles.estaVacio("${__formdata.loadedOnce}")) {                    
                // Abrir "Resumen del fichero CODA"
                objUtiles.abrirModal("axisadm023", "src", "modal_axisadm023.do?operation=form&SPROCES=${__formdata.SPROCES_CODA}");        
            } else if (!objUtiles.estaVacio("${sessionScope.FICHERO}")) {                    
                nuevaVentana = window.open("axis_axisadm024.do?operation=mostrar_fichero");    
                // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                if (document.all) {
                    idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                    contadorVentanas++;
                }       
            } 
            
            objDom.setValorPorId("loadedOnce", true);
            
             f_cargar_propiedades_pantalla();
            
        }
        
        function f_cerrar_nuevaVentana() {
            try {
                if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                    nuevaVentana.window.close();
                }
            } catch (e) {}
        }        
        
        function f_but_salir() {
            // Para IE, limpiar las funciones setInterval
            if (document.all) {
                for (var i=0; i < idVentanas.length; i++)
                    clearInterval(idVentanas[i]);
            }
            
            objAjax.invokeAsyncCGI('axis_axisadm024.do', callbackCancelar, 'operation=cancelar', this, null);
        }
        
        function f_but_9000508() {
            objUtiles.abrirModal("axisadm026", "src", "modal_axisadm026.do?operation=form");        
        }
        
        function f_but_108502() { // Resumen fichero CODA
            objUtiles.abrirModal("axisadm023", "src", "modal_axisadm023.do?operation=form&SPROCES=${__formdata.SPROCES_CODA}");        
        } 
        
        function f_but_imprimir() {
            objUtiles.ejecutarFormulario ("axis_axisadm024.do", "imprimir", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_editar_registro(SPROCES, NNUMLIN, CBANCAR1, NNUMORD, FULTSALD) {
            objDom.setValorPorId("SDEVOLU", SPROCES);
            objDom.setValorPorId("CBANCAR1", CBANCAR1);
            objDom.setValorPorId("NNUMORD", NNUMORD);
            objDom.setValorPorId("FULTSALD", FULTSALD);
            objDom.setValorPorId("NNUMLIN", NNUMLIN);
            objDom.setVisibilidadPorId("but_cerrar_modal_axisadm025", "hidden");
            objUtiles.abrirModal("axisadm025", "src", "modal_axisadm025.do?operation=form&SPROCES=" + 
                SPROCES + "&NNUMLIN=" + NNUMLIN + "&CBANCAR1=" + CBANCAR1+ "&NNUMORD=" + NNUMORD);                    
        }
        
        function f_descartar_registro(SPROCES, NNUMLIN, CBANCAR1, NNUMORD,FULTSALD ) {
            objDom.setValorPorId("SDEVOLU", SPROCES);
            objDom.setValorPorId("CBANCAR1", CBANCAR1);
            objDom.setValorPorId("NNUMORD", NNUMORD);
            objDom.setValorPorId("FULTSALD", FULTSALD);
            objDom.setValorPorId("NNUMLIN", NNUMLIN);
            if(confirm("<axis:alt f="axisadm024" c="CONFIRM" lit="9002141"/>")){
              objUtiles.ejecutarFormulario ("axis_axisadm024.do?CANCCODA=1&SPROCES_CANC="+SPROCES+"&NNUMLIN_CANC="+NNUMLIN
              +"&CBANCAR1_CANC="+CBANCAR1+"&NNUMORD_CANC="+NNUMORD, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }         
        }
        function f_reactivar_registro(SPROCES, NNUMLIN, CBANCAR1, NNUMORD,FULTSALD ) {
            objDom.setValorPorId("SDEVOLU", SPROCES);
            objDom.setValorPorId("CBANCAR1", CBANCAR1);
            objDom.setValorPorId("NNUMORD", NNUMORD);
            objDom.setValorPorId("FULTSALD", FULTSALD);
            objDom.setValorPorId("NNUMLIN", NNUMLIN);
              objUtiles.ejecutarFormulario ("axis_axisadm024.do?CANCCODA=1&SPROCES_CANC="+SPROCES+"&NNUMLIN_CANC="+NNUMLIN
              +"&CBANCAR1_CANC="+CBANCAR1+"&NNUMORD_CANC="+NNUMORD, "reactivar", document.miForm, "_self", objJsMessages.jslit_cargando);
     
        }

        /****************************************************************************************/
        /******************************** CALLBACKS AJAX ****************************************/
        /****************************************************************************************/
        
        function callbackCancelar(dummy) {   
            if (${!empty __formdata.SPROCES_CODA})
                // Volver a AXISADM022
                objUtiles.ejecutarFormulario ("axis_axisadm022.do?SPROCES=${__formdata.SPROCES_CODA}", "form", document.miForm, "_self");
            else
                // Volver al menú
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadm024", "cancelar", document.miForm, "_self");
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
       
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if (cual == "axisadm025")
                objUtiles.ejecutarFormulario ("axis_axisadm024.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axisadm026(SPROCES, FECHAINI, CTIPREG, CBANCO, TNOMBRE, NNUMREC) {
            objDom.setValorPorId("SPROCES_PANTALLA", SPROCES);
            objUtiles.ejecutarFormulario ("axis_axisadm024.do?FECHAINI=" + FECHAINI + "&CTIPREG=" + CTIPREG + 
                "&CBANCO=" + CBANCO + "&TNOMBRE=" + TNOMBRE + "&NNUMREC=" + NNUMREC + "&BUSCA=" + 1, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cargar_detalle(SDEVOLU,CBANCAR1,NNUMORD,FULTSALD,NNUMLIN){
        
            objDom.setValorPorId("SDEVOLU", SDEVOLU);
            objDom.setValorPorId("CBANCAR1", CBANCAR1);
            objDom.setValorPorId("NNUMORD", NNUMORD);
            objDom.setValorPorId("FULTSALD", FULTSALD);
            objDom.setValorPorId("NNUMLIN", NNUMLIN);
            
            objUtiles.ejecutarFormulario ("axis_axisadm024.do", "cargar_detalle", document.miForm, "_self", objJsMessages.jslit_cargando);        
        }
                
        function f_seleccionar_recibo(NRECIBO,SSEGURO,SPROCES,NLINEA){           
            objUtiles.ejecutarFormulario("axis_axisadm024.do?NRECIBO=" + NRECIBO, "navegarRecibo", document.miForm, "_self", objJsMessages.jslit_cargando);
        }                
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisadm024" c="titulo" lit="9000960"/></c:param>     <%-- Importes pendientes de tratar --%>
                <c:param name="formulario"><axis:alt f="axisadm024" c="formulario" lit="9000960"/></c:param> <%-- Importes pendientes de tratar --%>
                <c:param name="form">axisadm024</c:param>
        </c:import>        
   
        <%-- Resumen del fichero CODA --%><%-- Selección de recibos --%><%-- Buscador de recibos pendientes --%>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisadm023|<axis:alt f="axisadm023" c="TITULO" lit="9000959"/>#axisadm025|<axis:alt f="axisadm023" c="TITULO" lit="9000961"/>#axisadm026|<axis:alt f="axisadm023" c="TITULO" lit="9000962"/>
            </c:param>
        </c:import>
   
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPROCES_PANTALLA" id="SPROCES_PANTALLA" value="${__formdata.SPROCES_PANTALLA}"/>
        <input type="hidden" name="NNUMLIN" id="NNUMLIN" value="${__formdata.NNUMLIN}"/>
        <input type="hidden" name="FULTSALD" id="FULTSALD" value="${__formdata.FULTSALD}"/>
        <input type="hidden" name="FULTSALD2" id="FULTSALD2" value="${__formdata.FULTSALD2}"/>
        <input type="hidden" name="NNUMORD" id="NNUMORD" value="${__formdata.NNUMORD}"/>
        <input type="hidden" name="CBANCAR1" id="CBANCAR1" value="${__formdata.CBANCAR1}"/>
        <input type="hidden" name="SDEVOLU" id="SDEVOLU" value="${__formdata.SDEVOLU}"/>
        
        <input type="hidden" name="loadedOnce" id="loadedOnce" value="${__formdata.loadedOnce}"/>        
        <div class="separador">&nbsp;</div>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                     <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm024" c="TITULO" lit="9000963"/></div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                    <tr><td>
                   
                    <table class="area" align="center">
                        <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisadm024" c="title0" lit="100562"/></c:set>   <%-- Fecha --%>
                                <c:set var="title1"><axis:alt f="axisadm024" c="title1" lit="1000576"/></c:set>  <%-- Proceso --%>                                 
                                <c:set var="title2"><axis:alt f="axisadm024" c="title2" lit="105940"/></c:set>   <%-- Nombre --%>                                 
                                <c:set var="title3"><axis:alt f="axisadm024" c="title3" lit="100563"/></c:set>   <%-- Importe --%>                                 
                                <c:set var="title4"><axis:alt f="axisadm024" c="title4" lit="100584"/></c:set>   <%-- Agente --%>                                 
                                <c:set var="title5"><axis:alt f="axisadm024" c="title5" lit="100588"/></c:set>   <%-- Descripción --%>                                                                 
                                <c:set var="title6"><axis:alt f="axisadm024" c="title6" lit="9000964"/></c:set>  <%-- Banco --%>              
                                <c:set var="title7"><axis:alt f="axisadm024" c="title7" lit="100895"/></c:set>   <%-- Recibo --%> 
                                <c:set var="title8"><axis:alt f="axisadm024" c="title8" lit="100587"/></c:set>   <%-- Estado --%>              
                                <c:set var="title9"><axis:alt f="axisadm024" c="title9" lit="9900731"/></c:set>   <%-- I pendent --%>              
                                <c:set var="title10"><axis:alt f="axisadm024" c="title10" lit="9900730"/></c:set>   <%-- I Pagat --%>              
                                
                                
                                <!--div id="dt_polizas" class="seccion displayspaceMaximo"-->
                                  <script language="Javascript">
                                document.write('<div id="dt_polizas" class="seccion displayspaceMaximo" style="overflow-x:auto;width:'+(objUtiles.miInnerWidth()*0.85)+'px">');
                                  </script>
                                    <display:table name="${requestScope.REFCURSOR}" style="width:98%" id="REFCURSOR" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisadm024.do?paginar=false">
                                        <%@ include file="../include/displaytag.jsp"%>
                                          <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons">
                                        <input <c:if test="${REFCURSOR.SDEVOLU == __formdata.SDEVOLU && 
                                        REFCURSOR.CBANCAR1 == __formdata.CBANCAR1 && 
                                        REFCURSOR.NNUMORD == __formdata.NNUMORD && 
                                        REFCURSOR.FULTSALD == __formdata.FULTSALD && 
                                        REFCURSOR.NNUMLIN == __formdata.NNUMLIN}">checked</c:if>
                                        type="radio" id="checked_cursor" name="checked_cursor" 
                                        onclick = "f_cargar_detalle('${REFCURSOR.SDEVOLU}','${REFCURSOR.CBANCAR1}','${REFCURSOR.NNUMORD}', '<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>','${REFCURSOR.NNUMLIN}')"
                                         value="${REFCURSOR['SDEVOLU']}"/>
                                        </div>
                                         </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value="${REFCURSOR.FPROCES}" pattern="dd/MM/yyyy"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="SDEVOLU" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.SDEVOLU}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TPAGADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.TPAGADOR}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                                <fmt:formatNumber value="${REFCURSOR.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/><br/>                                                
                                            </div>
                                        </display:column>
                                        <display:column title="${title10}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                                <fmt:formatNumber value="${REFCURSOR.IPAGADO}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/><br/>                                                
                                            </div>
                                        </display:column>
                                         <display:column title="${title9}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                            	<c:choose>
                                            <c:when test="${REFCURSOR.IIMPORTE - REFCURSOR.IPAGADO > 0}">
                                            <fmt:formatNumber value="${REFCURSOR.IIMPORTE - REFCURSOR.IPAGADO}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </c:when>
                                            
                                            <c:when test="${REFCURSOR.IIMPORTE - REFCURSOR.IPAGADO < 0}">
                                            	<fmt:formatNumber value="${REFCURSOR.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </c:when>
                                            <c:otherwise>
                                            	<fmt:formatNumber value="0" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </c:otherwise>
                                          </c:choose>
                                                
                                                
                                                <br/>                                                
                                            </div>
                                        </display:column>
                                        <%--<display:column title="${title4}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                            </div>
                                        </display:column>--%>
                                        <display:column title="${title5}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.TDESCRIP}
                                            </div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="CBANCO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.CBANCO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" sortProperty="NNUMREC" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.NNUMREC}
                                            </div>
                                        </display:column>
                                        <display:column title="${title8}" sortable="true" sortProperty="TTIPOREG" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.TTIPOREG}
                                            </div>

                                        </display:column>
                                            <display:column title=""
                                             headerClass="headwidth5 sortable"
                                             media="html"
                                             autolink="false">
                                                <div class="dspIcons" style="border:0px;">
                                                <c:choose>
                                                <c:when test="${REFCURSOR.IIMPORTE > 0 }">
                                                    <c:if test="${empty REFCURSOR.NNUMREC && REFCURSOR.CTIPOREG != 7}">
                                                        <c:if test="${REFCURSOR.IIMPORTE - REFCURSOR.IPAGADO > 0}">
                                                        <a href="javascript:void(0)"  onclick="f_editar_registro('${REFCURSOR.SDEVOLU}', '${REFCURSOR.NNUMLIN}', '${REFCURSOR.CBANCAR1}', '${REFCURSOR.NNUMORD}','<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>')">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisadm024" c="EDITARREG" lit="100002"/>'
                                                                 title='<axis:alt f="axisadm024" c="EDITARREG" lit="100002"/>'
                                                                 src="images/lapiz.gif"/>
                                                        </a>
                                                      </c:if>
                                                    </c:if>
                                                    <c:if test="${REFCURSOR.CTIPOREG == 1 || REFCURSOR.CTIPOREG == 2}">
                                                        <a href="javascript:void(0)"  onclick="f_descartar_registro('${REFCURSOR.SDEVOLU}', '${REFCURSOR.NNUMLIN}', '${REFCURSOR.CBANCAR1}', '${REFCURSOR.NNUMORD}','<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>')">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisadm024" c="DESCARTREG" lit="9002140"/>'
                                                                 title='<axis:alt f="axisadm024" c="DESCARTREG" lit="9002140"/>'
                                                                 src="images/delete.gif"/>
                                                        </a>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${REFCURSOR.IIMPORTE < 0 }">
                                                    <c:if test="${empty REFCURSOR.NNUMREC && REFCURSOR.CTIPOREG != 7}">
                                                        <c:if test="${REFCURSOR.IIMPORTE + REFCURSOR.IPAGADO !=  0}">
                                                        <a href="javascript:void(0)"  onclick="f_editar_registro('${REFCURSOR.SDEVOLU}', '${REFCURSOR.NNUMLIN}', '${REFCURSOR.CBANCAR1}', '${REFCURSOR.NNUMORD}','<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>')">
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisadm024" c="EDITREGUS" lit="100002"/>'
                                                                 title='<axis:alt f="axisadm024" c="EDITREGUS" lit="100002"/>'
                                                                 src="images/lapiz.gif"/>
                                                        </a>
                                                      </c:if>
                                                    </c:if>
                                                    <c:if test="${REFCURSOR.CTIPOREG == 1 || REFCURSOR.CTIPOREG == 2}">
                                                        <a href="javascript:f_descartar_registro('${REFCURSOR.SDEVOLU}', '${REFCURSOR.NNUMLIN}', '${REFCURSOR.CBANCAR1}', '${REFCURSOR.NNUMORD}','<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>')" >
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisadm024" c="DESCARTREG" lit="9002140"/>'
                                                                 title='<axis:alt f="axisadm024" c="DESCARTREG" lit="9002140"/>'
                                                                 src="images/delete.gif"/>
                                                        </a>
                                                    </c:if>
                                              
                                                </c:when>
                                                </c:choose>
                                                 
                                                 <c:if test="${!empty REFCURSOR.CTIPOREG && REFCURSOR.CTIPOREG == 7}">
                                                 <a href="javascript:f_reactivar_registro('${REFCURSOR.SDEVOLU}', '${REFCURSOR.NNUMLIN}', '${REFCURSOR.CBANCAR1}', '${REFCURSOR.NNUMORD}','<fmt:formatDate value="${REFCURSOR.FULTSALD}" pattern="dd/MM/yyyy"/>')" >
                                                            <img border="0"
                                                                 alt='<axis:alt f="axisadm024" c="EDITREC" lit="9000656"/>'
                                                                 title='<axis:alt f="axisadm024" c="EDITREC" lit="9000656"/>'
                                                                 src="images/update.gif"/>
                                                        </a>
                                                 </c:if>
                                                </div>
                                            </display:column>

                                    </display:table>     
                                    <c:choose>
                                        <c:when test="${!empty requestScope.REFCURSOR}">
                                        <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                            <script language="javascript">objUtiles.retocarDsptagtable("REFCURSOR");</script>
                                        </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <script language="javascript">
                                               objLista.esconderListaSpans();
                                               objLista.esconderListaLinks();     
                                            </script>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="separador">&nbsp;</div>
                                <div class="separador">&nbsp;</div>
                            
                                                 
                        <table class="area" align="right">
                        <tr>
                            <td>
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm024" c="detalle" lit="102239"/></div>
                            </td>
                            </tr>
                            <tr>
                            <td>
                            
                                <c:set var="title0"><axis:alt f="axisadm024" c="title0" lit="151474"/></c:set>   <%-- Fecha --%>
                                <c:set var="title3"><axis:alt f="axisadm024" c="title3" lit="100563"/></c:set>   <%-- Importe --%>                                 
                                <c:set var="title7"><axis:alt f="axisadm024" c="title7" lit="100895"/></c:set>   <%-- Recibo --%> 
                                <c:set var="title8"><axis:alt f="axisadm024" c="title8" lit="100587"/></c:set>   <%-- Estado --%>              
                                <c:set var="title9"><axis:alt f="axisadm024" c="title9" lit="9900731"/></c:set>   <%-- I pendent --%>              
                                <c:set var="title10"><axis:alt f="axisadm024" c="title10" lit="9900730"/></c:set>   <%-- I Pagat --%>              
                                
                                
                                <div id="dt_polizas" class="seccion displayspaceMaximo">
                                    <display:table name="${requestScope.REFCURSOR_DETALLE}" id="REFCURSOR" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisadm024.do?paginar=false">
                                        <%@ include file="../include/displaytag.jsp"%>
                                       <display:column title="" sortable="true" style="width:10%" sortProperty="NORDEN" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.NORDEN}
                                            </div>
                                        </display:column>
                                        
                                         <display:column title="${title8}" style="width:20%"  sortable="true" sortProperty="TTIPOREG" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${REFCURSOR.TTIPOREG}
                                            </div>
                                         </display:column>
                                          <display:column title="${title3}" style="width:15%" sortable="true" sortProperty="ICODA" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                                <fmt:formatNumber value="${REFCURSOR.ICODA}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title10}" sortable="true" style="width:15%" sortProperty="IPAGADO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                              <fmt:formatNumber value="${REFCURSOR.IPAGADO}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </div>
                                        </display:column>
                                            
                                        <display:column title="${title9}" sortable="true" style="width:15%" sortProperty="IPENDIENTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber">
                                                 <fmt:formatNumber value="${REFCURSOR.IPENDIENTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" style="width:15%" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                             <c:if test="${!empty REFCURSOR.NRECIBO}">
                                             <div class="dspText">
                                                 ${REFCURSOR.NRECIBO}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                  <img id="find" border="0" src="images/find.gif" 
                                                  alt="<axis:alt f="axisadm024" c="SELRECIB" lit="9901120"/>" onclick="f_seleccionar_recibo('${ REFCURSOR['NRECIBO']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                              </div>
                                            </c:if>
                                            
                                            
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" style="width:10%" sortProperty="FMOVREC" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value="${REFCURSOR.FMOVREC}" pattern="dd/MM/yyyy"/>
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
                </td>     
            </tr>   
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
        	<c:param name="f">axisadm024</c:param>
            <c:param name="__botones">salir,9000508<c:if test="${!empty requestScope.REFCURSOR}">,imprimir</c:if><c:if test="${!empty __formdata.SPROCES_CODA}">,108502</c:if><%-- Resumen --%></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>