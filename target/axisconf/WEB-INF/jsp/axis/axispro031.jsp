<%/**
*  Fichero: axispro031.jsp
*   
*  Pantalla de edición de actividad
*
*  Descripción de pantalla
*
*  Fecha: 12/01/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script language="Javascript" type="text/javascript">
        function f_onload() {
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axispro001", "cancelar", document.miForm, "_self");
        }
        
        function f_but_103669() {
            objUtiles.ejecutarFormulario("axis_axispro031.do", "duplicar_actividad", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_actualiza_actividad_seleccionable(CACTIVI_SEL, checked){
            var ISSELEC = (checked ? "1" : "0");
            objUtiles.ejecutarFormulario("axis_axispro031.do?CACTIVI_SEL=" + CACTIVI_SEL + "&ISSELEC=" + ISSELEC, "actualizarISSELEC", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    </script>
    </head>
    <body onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import><form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CRAMO" id="CRAMO"
                   value="${__formdata.CRAMO}"/>
            <input type="hidden" name="CMODALI" id="CMODALI"
                   value="${__formdata.CMODALI}"/>
            <input type="hidden" name="CTIPSEG" id="CTIPSEG"
                   value="${__formdata.CTIPSEG}"/>
            <input type="hidden" name="CCOLECT" id="CCOLECT"
                   value="${__formdata.CCOLECT}"/>
            <input type="hidden" name="SPRODUC" id="SPRODUC"
                   value="${__formdata.SPRODUC}"/>
            <input type="hidden" name="CACTIVI" id="CACTIVI"
                   value="${__formdata.CACTIVI}"/>
            <input type="hidden" name="TACTIVI" id="TACTIVI"
                   value="${__formdata.TACTIVI}"/>
                   
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <fmt:message key="9000731"/>
                </c:param>
                <c:param name="producto">
                    ${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}
                </c:param>
                <c:param name="form">axispro031</c:param>
            </c:import>
            
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <!-- Lista de actividades del producto -->
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><fmt:message key="9000732"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0">
                                        <fmt:message key="103477"/>
                                    </c:set>
                                    <div class="displayspaceGrande">
                                        <display:table name="${sessionScope.T_IAX_PRODACTIVIDADES}"
                                                       id="miListaId"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="1"
                                                       defaultorder="ascending"
                                                       requestURI="" sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}"
                                                            sortable="false"
                                                            headerClass="headwidth5 sortable"
                                                            sortProperty="CACTIVI"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    ${miListaId.OB_IAX_PRODACTIVIDADES.CACTIVI}
                                                </div>
                                            </display:column>
                                            <display:column title=""
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            sortProperty="TACTIVI"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    ${miListaId.OB_IAX_PRODACTIVIDADES.TACTIVI}
                                                </div>
                                            </display:column>
                                        </display:table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <!-- Lista de actividades seleccionables -->
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><fmt:message key="9000733"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0">
                                        <fmt:message key="103477"/>
                                    </c:set>
                                    <div class="displayspaceGrande">
                                        <display:table name="${sessionScope.actividades}"
                                                       id="miListaIdSelec"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="1"
                                                       defaultorder="ascending"
                                                       requestURI=""
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}"
                                                            sortable="false"
                                                            sortProperty="CACTIVI"
                                                            headerClass="headwidth5 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    ${miListaIdSelec.CACTIVI}
                                                </div>
                                            </display:column>
                                            <display:column title=""
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            sortProperty="TACTIVI"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    ${miListaIdSelec.TACTIVI}
                                                </div>
                                            </display:column>
                                            <display:column title=""
                                                            sortable="false"
                                                            sortProperty="esSeleccionada"
                                                            headerClass="headwidth5 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcons">
                                                    <input type="checkbox"
                                                           <c:if test="${miListaIdSelec.ISSELEC == '1'}">checked="checked"</c:if>
                                                           onclick="javascript:f_actualiza_actividad_seleccionable('${miListaIdSelec.CACTIVI}', this.checked)"
                                                           value=""/>
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
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">salir,103669</c:param>
            </c:import>
        </form><c:import url="../include/mensajes.jsp"/>
    </body>
</html>