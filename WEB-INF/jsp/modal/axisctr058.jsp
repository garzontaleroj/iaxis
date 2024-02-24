<%/*
*  Fichero: axisctr058.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 05/03/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
      <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
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
    <c:set var="isAxisctr065Embedded" value="true"/>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisctr058();
        }
       
       // Primero miramos si hay alguna opción de la lista seleccionada
       <c:if test="${isAxisctr065Embedded == 'false' || empty sessionScope.mostrarAxisctr065Embed}">
       function f_but_aceptar() {                    
        var hayChecked = objUtiles.f_GuardaCasillasChecked("seleccionaVersion");
        if(typeof hayChecked == 'boolean') {
            alert(objJsMessages.jslit_selecciona_producto);
        }else{
            f_seleccionar (hayChecked);
            }
        }
        </c:if>
        
        function f_seleccionar(CVERSION){
            if (objUtiles.estaVacio(CVERSION))
                alert (objJsMessages.jslit_error_de_seleccion);
            else
                parent.f_aceptar_axisctr058(CVERSION);
        }
    
        function f_but_9001184(){
            f_abrir_axisctr065(null);  
        }
        
        /****************************************************************************************/
        /********************************* MODAL AXISCTR065 *************************************/
        /****************************************************************************************/
        
        function f_abrir_axisctr065(CVERSION) {
            var isAxisctr065Embedded = "${isAxisctr065Embedded}";
            
            if (document.axisctr058Form.CVERSION == undefined){
                if (isAxisctr065Embedded == "true")
                    objUtiles.ejecutarFormulario("modal_axisctr058.do?CVERSION="+CVERSION, "editarVersion",  document.axisctr058Form, "_self", objJsMessages.jslit_cargando);   
                else
                    objUtiles.abrirModal("axisctr065", "src", "modal_axisctr065.do?operation=form&CVERSION="+CVERSION, 800, 300);        
            }else{
                document.axisctr058Form.CVERSION.value = CVERSION;
                 if (isAxisctr065Embedded == "true")
                    objUtiles.ejecutarFormulario("modal_axisctr058.do", "editarVersion",  document.axisctr058Form, "_self", objJsMessages.jslit_cargando);   
                else
                    objUtiles.abrirModal("axisctr065", "src", "modal_axisctr065.do?operation=form", 800, 300);        
            }
        
        }
        
        function f_cerrar_axisctr065() {
            var isAxisctr065Embedded = "${isAxisctr065Embedded}";  
            if (isAxisctr065Embedded == "true")
                objUtiles.ejecutarFormulario("modal_axisctr058.do?esconderAxisctr065Embed=true", "form", document.axisctr058Form, "_self", objJsMessages.jslit_cargando);   
            else
                objUtiles.cerrarModal("axisctr065");
        }
        
        function f_aceptar_axisctr065() {
            // Cerrar modal y recargar la pantalla
            var isAxisctr065Embedded = "${isAxisctr065Embedded}";
            if (isAxisctr065Embedded == "true") {
                objUtiles.ejecutarFormulario("modal_axisctr058.do?esconderAxisctr065Embed=true", "form", document.axisctr058Form, "_self", objJsMessages.jslit_cargando);                   
            } else {
                f_cerrar_axisctr065();
                objUtiles.ejecutarFormulario("modal_axisctr058.do", "form", document.axisctr058Form, "_self", objJsMessages.jslit_cargando, 800, 300);   
            }
        }
        
        function f_onload(){
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr058');
					</c:if>
            if ( document.axisctr058Form.TMARCA != undefined)
                document.axisctr058Form.TMARCA.value = document.axisctr058Form.XTMARCA.value;
            if ( document.axisctr058Form.TMODELO != undefined)
                document.axisctr058Form.TMODELO.value = document.axisctr058Form.XTMODELO.value;
                f_cargar_propiedades_pantalla();
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr058Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="XCMARCA" id="XCMARCA" value="${__formdata.XCMARCA}" />
            <input type="hidden" name="XCMODELO" id="XCMODELO" value="${__formdata.XCMODELO}" />
            <input type="hidden" name="NPUERTAS" id="NPUERTAS" value="${__formdata.NPUERTAS}" />
            <input type="hidden" name="CCOMBUSTIBLE" id="CCOMBUSTIBLE" value="${__formdata.CCOMBUSTIBLE}" />
            <input type="hidden" name="XTMARCA" id="XTMARCA" value="${sessionScope.axisctr058_listaVersiones[0].TMARCA}" />
            <input type="hidden" name="XTMODELO" id="XTMODELO" value="${sessionScope.axisctr058_listaVersiones[0].TMODELO}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr058" c="TIT_058" lit="9001258" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr058" c="TIT_058" lit="9001258" /></c:param>
                <c:param name="form">axisctr058</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag ListaPersonas -->
                        <c:set var="title1"><axis:alt f="axisctr058" c="RD_CVERSION" lit="108341"/></c:set>
                        <c:set var="title2"><axis:alt f="axisctr058" c="CMARCA" lit="9001046"/></c:set>
                        <c:set var="title3"><axis:alt f="axisctr058" c="CMODELO" lit="108515"/></c:set>
                        <c:set var="title4"><axis:alt f="axisctr058" c="CVERSION" lit="9001146"/></c:set>
                        <c:set var="title5"><axis:alt f="axisctr058" c="DES_VERSION" lit="9000580"/></c:set>
                        <c:set var="title6"><axis:alt f="axisctr058" c="FLANZAM" lit="9000628"/></c:set>
                        <c:set var="title7"><axis:alt f="axisctr058" c="CCLAVEH" lit="9001060"/></c:set>
                        <c:set var="title8"><axis:alt f="axisctr058" c="CTIPVEH" lit="9001059"/></c:set>
                        <div class="seccion displayspacePersonas">
                           <display:table name="${sessionScope.axisctr058_listaVersiones}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr058.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title1}" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                     <div class="dspIcons"><input <c:if test="${miListaId['seleccionaVersion']}">checked</c:if> type="radio" id="seleccionaVersion" name="seleccionaVersion" value="${miListaId['CVERSION']}"/></div>
                                </display:column>
                                <axis:visible c="CMARCA" f="axisctr058">
                                <display:column title="${title2}" sortable="true" sortProperty="TMARCA" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['CMARCA']} - ${miListaId['TMARCA']}</div>
                                </display:column>
                                </axis:visible>
                              
                                 <axis:visible c="CTIPVEH" f="axisctr058">
                                <display:column title="${title8}" sortable="true" sortProperty="TTIPVEH" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['CTIPVEH']} - ${miListaId['TTIPVEH']}</div>
                                </display:column>
                                </axis:visible>
                                <axis:visible c="CMODELO" f="axisctr058">
                                <display:column title="${title3}" sortable="true" sortProperty="TMODELO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TMODELO']}</div>
                                </display:column>
                                </axis:visible>  
                                <axis:visible c="CVERSION" f="axisctr058">
                                <display:column title="${title4}" sortable="true" sortProperty="TVERSION" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar('${miListaId['CVERSION']}');">${miListaId['TVERSION']}</a></div>
                                </display:column>
                                </axis:visible>
                                <axis:visible c="DES_VERSION" f="axisctr058">
                                <display:column title="${title5}" sortable="true" sortProperty="DES_VERSION" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['DES_VERSION']}</div>
                                </display:column>
                                </axis:visible>
                                <axis:visible c="FLANZAM" f="axisctr058">
                                <display:column title="${title6}" sortable="true" sortProperty="FLANZAM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><fmt:formatDate value="${miListaId['FLANZAM']}" pattern="dd/MM/yyyy" /></div>
                                    
                                </display:column>
                                </axis:visible>
                                <axis:visible c="CCLAVEH" f="axisctr058">
                                <display:column title="${title7}" sortable="true" sortProperty="TCLAVEH" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TCLAVEH']}</div>
                                </display:column>
                                </axis:visible>
                                
                                <axis:visible c="NUEVO" f="axisctr058">
                                <display:column title="" sortable="true" sortProperty="NUEVO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                <c:if test="${miListaId['CVEHB7'] == 0 }">
                                    <a href="javascript:f_abrir_axisctr065('${miListaId['CVERSION']}')">
                                    <img border="0" alt="<axis:alt f="axisctr058" c="NUEVO" lit="9001370"/>" title="<axis:alt f="axisctr058" c="NUEVO" lit="9001370"/>" src="images/lapiz.gif"/>
                                    </a>
                                </c:if>
                                </div>
                                </display:column>
                                </axis:visible>
                            </display:table>
                        </div>	
                    </td>
                </tr>
                <tr>
                    <td> 
                       <c:if test="${isAxisctr065Embedded == 'true' && !empty sessionScope.mostrarAxisctr065Embed}">
                        <div id="axisctr065_embed">
                          <jsp:include page="axisctr065.jsp">
                            <jsp:param name="embedded" value="${isAxisctr065Embedded}"/>
                          </jsp:include>
                        </div>
                       </c:if>
                    </td>
                </tr>
            </table>						
            
            <c:if test="${isAxisctr065Embedded == 'false' || empty sessionScope.mostrarAxisctr065Embed}">
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr058</c:param><c:param name="f">axisctr058</c:param>
                <c:param name="__botones">cancelar<axis:visible c="BT_NUEVO" f="axisctr058">,9001184</axis:visible>,aceptar</c:param>
            </c:import>
            </c:if>
        </form>
      <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

