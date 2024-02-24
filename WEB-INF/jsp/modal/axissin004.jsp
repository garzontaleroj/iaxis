<%/*
*  Fichero: axisctr010.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 21/11/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            parent.f_cerrar_axissin004();
        }
        
    </script>
  </head>
    <body class=" " onload="f_onload()">
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin004" c="TITULO" lit="1000232" /></c:param>
                <c:param name="producto"><axis:alt f="axissin004" c="TITULO" lit="1000232" /></c:param>
                <c:param name="form">axissin004</c:param>
            </c:import>

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- DisplayTag Recibos -->
                                    <c:set var="title0"><axis:alt f="axissin004" c="NRECIBO" lit="800636"/></c:set>
                                    <c:set var="title1"><axis:alt f="axissin004" c="FEFECTO" lit="100883"/></c:set>
                                    <c:set var="title2"><axis:alt f="axissin004" c="FVENCIM" lit="100885"/></c:set>
                                    <c:set var="title3"><axis:alt f="axissin004" c="ICONCEP" lit="100563"/></c:set>
                                    <c:set var="title4"><axis:alt f="axissin004" c="TTIPREC" lit="102302"/></c:set>
                                    <c:set var="title5"><axis:alt f="axissin004" c="TESTREC" lit="100874"/></c:set>
                                    <div class="displayspace">
                                        <display:table name="${__formdata.T_IAX_RECIBOS}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                        requestURI="modal_axissin004.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspNumber">${miListaId.NRECIBO}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEFECTO}"/></div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="FVENCIM" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVENCIM}"/></div>
                                            </display:column>                                            
                                            <display:column title="${title3}" sortable="true" sortProperty="ICONCEP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.ICONCEP}"/></div>
                                            </display:column>                                                                                        
                                            <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspText">${miListaId.TTIPREC}</div>
                                            </display:column>                                                                                                                                    
                                            <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div <c:if test="${miListaId['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaId['CESTREC']!=0}">class="dspText"</c:if>>${miListaId['TESTREC']}</div>
                                            </display:column>                                                                                                                                     
                                        </display:table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axissin004</c:param>
                <c:param name="__botones">salir</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
