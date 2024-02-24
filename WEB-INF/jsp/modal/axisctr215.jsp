<%/*
*  Fichero: axisctr215.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 28/02/2007
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad--%>
        <link type="text/css" href="styles/jquery.jscrollpane.css"
              rel="stylesheet"
              media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"/>
        <style type="text/css" id="page-css"> </style>
        <%-- FI Especial per controlar els scroll amb iPad--%>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script language="Javascript" type="text/javascript">
        function f_onload() {        	
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_cerrar() {
            parent.f_cerrar_axisctr215();
        }     
        
    </script>
    </head>
    <body onload="f_onload()"><div id="wrapper" class="wrapper">
            <form name="miForm" action="" method="POST">
                <input type="hidden" name="operation" value=""/>
                <c:import url="../include/titulo_nt.jsp">
                    <c:param name="formulario">
                        <axis:alt f="axisctr215" c="LIT_PANTALLA" lit="102656"/>
                    </c:param>
                    <c:param name="producto">
                        <axis:alt f="axisctr215" c="LIT_PANTALLA" lit="102656"/>
                    </c:param>
                    <c:param name="form">axisctr215</c:param>
                </c:import>
                <table id="tabla1" class="mainModalDimensions base"
                       align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table class="seccion">
                                <tr>
                                    <td align="left">
                                        <div class="displayspace">
                                            <c:set var="title0">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_TGARANT"
                                                          lit="100561"/>
                                            </c:set>
                                             
                                            <c:set var="title1">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_FINIEFE"
                                                          lit="100562"/>
                                            </c:set>
                                             
                                            <c:set var="title2">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_NDETGAR"
                                                          lit="1000196"/>
                                            </c:set>
                                             
                                            <c:set var="title3">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_ICAPITAL"
                                                          lit="1000073"/>
                                            </c:set>
                                             
                                            <c:set var="title4">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_IPRIANU"
                                                          lit="101368"/>
                                            </c:set>
                                             
                                            <c:set var="title5">
                                                <axis:alt f="axisctr215"
                                                          c="TIT_IPROVRES"
                                                          lit="1000518"/>
                                            </c:set>
                                             
                                            <display:table name="${__formdata.PROVISION}"
                                                           id="PROVISION"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           defaultsort="1"
                                                           defaultorder="ascending"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0"
                                                           requestURI="modal_axisctr215.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible c="TGARANT"
                                                              f="axisctr215">
                                                    <display:column title="${title0}"
                                                                    sortable="true"
                                                                    sortProperty="TGARANT"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspText">
                                                            ${PROVISION.TGARANT}
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="FINIEFE"
                                                              f="axisctr215">
                                                    <display:column title="${title1}"
                                                                    sortable="true"
                                                                    sortProperty="FINIEFE"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspDate">
                                                            <fmt:formatDate value="${PROVISION.FINIEFE}"
                                                                            pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="NDETGAR"
                                                              f="axisctr215">
                                                    <display:column title="${title2}"
                                                                    sortable="true"
                                                                    sortProperty="NDETGAR"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspText">
                                                            ${PROVISION.NDETGAR}
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="ICAPITAL"
                                                              f="axisctr215">
                                                    <display:column title="${title3}"
                                                                    sortable="true"
                                                                    sortProperty="ICAPITAL"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspNumber">
                                                            <fmt:formatNumber value="${PROVISION.ICAPITAL}"
                                                                              pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="IPRIANU"
                                                              f="axisctr215">
                                                    <display:column title="${title4}"
                                                                    sortable="true"
                                                                    sortProperty="IPRIANU"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspNumber">
                                                            <fmt:formatNumber value="${PROVISION.IPRIANU}"
                                                                              pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible c="IPROVRES"
                                                              f="axisctr215">
                                                    <display:column title="${title5}"
                                                                    sortable="true"
                                                                    sortProperty="IPROVRES"
                                                                    headerClass="sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspNumber">
                                                            <fmt:formatNumber value="${PROVISION.IPROVRES}"
                                                                              pattern="${__formatNumberPatterns[CMONEDAPROD]}"/>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                            </display:table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <c:import url="../include/botonera_nt.jsp">
                    <c:param name="f">axisctr215</c:param>
                    <c:param name="__botones">cerrar</c:param>
                </c:import>
                <c:import url="../include/mensajes.jsp"/>
            </form>
        </div></body>
</html>