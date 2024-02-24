<%/*
*  Fichero: axisctr067.jsp
*
*  Fecha: 16/12/2009
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
    <title><fmt:message key="9900852"/></title> <%-- Consulta de cesiones --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspace {
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
        
        function f_onload() { 
            revisarEstilos();
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            
            if (${empty sessionScope.listaPolizas} && !hayErrores)         
                f_but_buscar();       
        }        
        
         function f_aceptar_axisctr066(CAGENTE,FEFEINI,FEFEFIN) {
            objUtiles.cerrarModal("axisctr066");           
            objDom.setValorPorId("CAGENTE", CAGENTE);
            objDom.setValorPorId("FEFEINI", FEFEINI);
            objDom.setValorPorId("FEFEFIN", FEFEFIN);
            objUtiles.ejecutarFormulario("axis_axisctr067.do", "busqueda_polices", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr067", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal("axisctr066");
        }
        
       function f_busca_comisions(SSEGURO,NPOLIZA) {          
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objDom.setValorPorId("NPOLIZA", NPOLIZA);
            objUtiles.ejecutarFormulario("axis_axisctr067.do", "busqueda_comisions", document.miForm, "_self", objJsMessages.jslit_cargando);            
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

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_axisctr066() {
            objUtiles.cerrarModal("axisctr066");
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900852"/></c:param>     <%-- Consulta de comissions --%>
                <c:param name="formulario"><fmt:message key="9900852"/></c:param> <%-- Consulta de comissions --%>
                <c:param name="form">axisctr067</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisctr066|<fmt:message key="9900854"/><%-- Buscador de comissions d'adquisició --%>
            </c:param>
        </c:import>
    
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" id="FEFEINI" name="FEFEINI" value="${__formdata.FEFEINI}"/>
        <input type="hidden" id="FEFEFIN" name="FEFEFIN" value="${__formdata.FEFEFIN}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>        
        <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${__formdata.NPOLIZA}"/>        
     
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <c:if test="${!empty requestScope.T_IAX_CESIONESREA && empty requestScope.__mensajes.m__clave}">
                        <c:set var="resumen">
                            <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                <b><fmt:message key="9001875"/>:</b> ${__formdata.NPOLIZA}   
                                <b>   <fmt:message key="101096"/></b> ${__formdata.NCERTIF}   
                            </span>
                        </c:set>
                    </c:if>
                    
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><fmt:message key="9001349"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<fmt:message key="9000508"/>" title="<fmt:message key="9000508"/>"/></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                        <%-- DisplayTag Cesiones --%>
                                            <c:set var="title0"><fmt:message key="100624"/></c:set> <%-- Num. pòlissa --%> 
                                            <c:set var="title1"><fmt:message key="100584"/></c:set>  <%-- Agent --%>
                                            <c:set var="title2"><fmt:message key="101028"/></c:set> <%-- Assegurat --%>                                                                                      
                                           
                                            <div class="displayspaceGrande">
                                                <display:table name="${sessionScope.listaPolizas}" id="listaPolizas" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisrea011.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                                       
                                                    <display:column title="" style="width:5%" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" 
                                                                name="selCesiones" 
                                                                id="radioPoliza" 
                                                                value="${listaPolizas['NPOLIZA']}"
                                                                onclick="f_busca_comisions('${listaPolizas.SSEGURO}','${listaPolizas.NPOLIZA}');"
                                                                <c:if test="${__formdata.NPOLIZA == listaPolizas.NPOLIZA}"> checked </c:if>                                                             
                                                             </input>
                                                        </div>
                                                        </div>
                                                    </display:column>                                                    
                                                    <display:column title="${title0}" style="width:15%" sortable="true" sortProperty="NUM" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${listaPolizas.NPOLIZA}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" style="width:40%" sortable="true" sortProperty="CGARANT" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            ${listaPolizas.CAGENTE}${!empty listaPolizas.CAGENTE && !empty listaPolizas.TAGENTE ? ' - ' : ''}${listaPolizas.TAGENTE}                                                                                    
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" style="width:40%" sortable="true" sortProperty="SCONTRA" headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                          ${listaPolizas.SSEGURO}${!empty listaPolizas.SSEGURO && !empty listaPolizas.TNOMBRE ? ' - ' : ''}${listaPolizas.TNOMBRE}                                                                                                                                                
                                                        </div>
                                                    </display:column>                                                    
                                                </display:table>                                                        
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="left">
                            <div class="separador">&nbsp;</div>
                                <table class="area" align="center" id="detalle">                                
                                    <tr>
                                        <td>
                                            <c:set var="resumen_detalle">
                                                <span id="resumen_detalle" class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                                    ${__formdata.SCONTRA}/${__formdata.NVERSIO} &nbsp; ${__formdata.TCTRAMO} &nbsp; <b><fmt:message key="100883"/>:</b> <fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy"/>                        
                                                </span>
                                            </c:set>
                                                
                                            <div class="titulo" ><img src="images/flecha.gif"/><fmt:message key="9900852"/> <%-- Detalle comisió --%></div>

                                            <table class="area" align="center">
                                             <tr>
                                                <th style="width:100%;height:0px"></th>                                                     
                                             </tr>
                                             <tr>
                                              <td>
                                                <c:set var="title0">&nbsp;</c:set>
                                                <c:set var="title1">
                                                    <fmt:message key="110994"/><!-- Garantia TGARANT-->
                                                </c:set>
                                                <c:set var="title2">
                                                    <fmt:message key="1000336"/><!-- Prima a liquidar durante los 10 años ITOTCOM -->
                                                </c:set>
                                                <c:set var="title3">
                                                    <fmt:message key="9001923"/><!-- Porcentaje de la comisión que se aplica PCOMISI -->
                                                </c:set>
                                                <c:set var="title4">
                                                    <fmt:message key="1000497"/><!-- Prima a liquidar durante un año ICOMANU-->
                                                </c:set>                                
                                                <c:set var="title5">
                                                    <fmt:message key="101368"/><!-- Prima sobre la que se calculo la comisión IPRIANU-->
                                                </c:set>                                
                                                <c:set var="title6">
                                                    <fmt:message key="100883"/><!-- Data efecte FEFECTO-->
                                                </c:set>                                                                            
                                                <div class="seccion  displayspace">                                    
                                                    <display:table name="${listaComisions}"
                                                                   id="miListaId"
                                                                   export="false"
                                                                   class="dsptgtable"
                                                                   pagesize="-1"
                                                                   requestURI="axis_axispen003.do?paginar=true"
                                                                   sort="list"
                                                                   cellpadding="0"
                                                                   cellspacing="0">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                            <display:column title="${title1}"
                                                                            style="width:40%"
                                                                            sortable="true"
                                                                            sortProperty="CCODPLA"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false">
                                                                           
                                                               <div class="dspText">
                                                                        ${miListaId['TGARANT']}
                                                                </div>   
                                                            </display:column>
                                                            <display:column title="${title2}"
                                                                            sortable="true"
                                                                            sortProperty="TNOMPLA"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false"
                                                                            style="width:20%">
                                                               <div class="dspText">
                                                                        ${miListaId['ITOTCOM']}
                                                                </div>                                               
                                                            </display:column>
                                                            <display:column title="${title3}"
                                                                            sortable="true"
                                                                            sortProperty="TMODALI"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false"
                                                                            style="width:10%">
                                                               <div class="dspText">
                                                                        ${miListaId['PCOMISI']}
                                                                </div>                                             
                                                            </display:column>
                                                            <display:column title="${title4}"
                                                                            sortable="true"
                                                                            sortProperty="TSISTEM"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false"
                                                                            style="width:10%">
                                                               <div class="dspText">
                                                                        ${miListaId['ICOMANU']}
                                                                </div>                                             
                                                            </display:column>
                                                             <display:column title="${title5}"
                                                                            sortable="true"
                                                                            sortProperty="TSISTEM"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false"
                                                                            style="width:10%">
                                                               <div class="dspText">
                                                                        ${miListaId['IPRIANU']}
                                                                </div>                                             
                                                            </display:column>                                                        
                                                            <display:column title="${title6}"
                                                                            sortable="true"
                                                                            sortProperty="FBAJARE"
                                                                            headerClass="sortable fixed"
                                                                            media="html"
                                                                            autolink="false"  style="width:10%">
                                                               <div class="dspText"><fmt:formatDate value="${miListaId['FEFECTO']}" pattern="dd/MM/yy" />
                                                                </div>             
                                                            </display:column>                                                 
                                                        </display:table>                                         
                                                        <c:choose>
                                                            <c:when test="${!empty listaPlanes}">
                                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <script language="javascript">
                                                                //objLista.esconderListaSpans();
                                                                //objLista.esconderListaLinks();     
                                                                </script>
                                                            </c:otherwise>
                                                        </c:choose>
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
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>