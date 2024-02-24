<%/**
*  Fichero: axispro031.jsp
*   
*  Pantalla de edición de recargo de fraccionamiento
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismpr002", "cancelar", document.miForm, "_self");
        }
        
        function f_but_aceptar() {
            if(objValidador.validaEntrada()){
                objUtiles.ejecutarFormulario("axis_axispro032.do", "aceptar_recargo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
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
            <input type="hidden" name="T_IAX_PRODFORMAPAGO_LENGTH" id="T_IAX_PRODFORMAPAGO_LENGTH"
                   value="${fn:length(requestScope.T_IAX_PRODFORMAPAGO)}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <fmt:message key="9000734"/>
                </c:param>
                <c:param name="producto">                    
                    ${__formdata.TACTIVI}, ${mntproducto.SPRODUC} - ${mntproducto.TITULO[0].OB_IAX_PRODTITULO.TTITULO}
                </c:param>
                <c:param name="form">axispro032</c:param>
            </c:import>
            
            <div style="clear:both"/>
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <!-- Lista de actividades del producto -->
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><fmt:message key="103313"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0">
                                        <fmt:message key="9000719"/>
                                    </c:set>
                                    <c:set var="title1">
                                        <fmt:message key="1000485"/>
                                    </c:set>
                                    <% int contador = 0; %>
                                    <div class="displayspaceGrande">
                                        <display:table name="${requestScope.T_IAX_PRODFORMAPAGO}"
                                                       id="miListaId"
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
                                                            headerClass="sortable"
                                                            sortProperty="TFORPAG"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <input type="hidden" name="CFORPAG_<%= contador %>" id="CFORPAG_<%= contador %>" value="${miListaId.OB_IAX_PRODFORMAPAGO.CFORPAG}">
                                                    ${miListaId.OB_IAX_PRODFORMAPAGO.TFORPAG}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}"
                                                            sortable="false"
                                                            headerClass="headwidth10 sortable"
                                                            sortProperty="PRECARG"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <input maxlength="3" formato="decimal" type="text" name = "PRECARG_<%= contador %>" id="PRECARG_<%= contador %>"
                                                    value="<fmt:formatNumber pattern='###.##' value='${miListaId.OB_IAX_PRODFORMAPAGO.PRECARG}'/>"  class="campo campotexto" style="width:30px;" title="">%
                                                </div>
                                            </display:column>
                                            <% contador++; %>
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
                <c:param name="__botones">salir,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp"/>
    </body>
</html>