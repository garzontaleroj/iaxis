<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axispro001" c="LIT_FORMULARIO" lit="1000217"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            f_cargar_propiedades_pantalla();
            }
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
           
<c:set var="title1"><axis:alt f="axispro001" c="CGARANT" lit="1000109" /></c:set>
<c:set var="title2"><axis:alt f="axispro001" c="TGARANT" lit="1000073" /></c:set>
<c:set var="title3"><axis:alt f="axispro001" c="TGARANT" lit="102517" /></c:set>
<c:set var="title4"><axis:alt f="axispro001" c="TTIPGAR" lit="1000488" /></c:set>
<c:set var="title5"><axis:alt f="axispro001" c="CGARDEP" lit="102511" /></c:set>
  <display:table name="${mntproducto_garantias}" requestURI="axis_axispro001.do?paginar=true" id="miListaIdGL" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
    <%@ include file="../include/displaytag.jsp"%>
    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.CGARANT" headerClass="sortable" media="html" autolink="false" >
        <div class="dspNumber">${miListaIdGL.OB_IAX_PRODGARANTIAS.CGARANT}</div>
    </display:column>
    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TGARANT" headerClass="sortable" media="html" autolink="false" >
        <div class="dspText">${miListaIdGL.OB_IAX_PRODGARANTIAS.TGARANT}</div>
    </display:column>
    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TTIPGAR" headerClass="sortable" media="html" autolink="false" >
        <div class="dspText">${miListaIdGL.OB_IAX_PRODGARANTIAS.TTIPGAR}</div>
    </display:column>
    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.TTIPCAP" headerClass="sortable" media="html" autolink="false" >
        <div class="dspText">${miListaIdGL.OB_IAX_PRODGARANTIAS.TTIPCAP}</div>
    </display:column>
    <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PRODGARANTIAS.CGARDEP" headerClass="sortable" media="html" autolink="false" >
        <div class="dspNumber">${miListaIdGL.OB_IAX_PRODGARANTIAS.CGARDEP}</div>
    </display:column>
    <display:column title="" sortable="false"                          headerClass="sortable" media="html" autolink="false" >
        <div class="dspIcono"><img src="images/lapiz.gif" style="cursor:pointer" 
        alt="<axis:alt f='axispro001' c='ICONO' lit='9000552'/>" title="<axis:alt f='axispro001' c='ICONO' lit='9000552'/>"
        onclick="parent.abrirModalGarantias('${miListaIdGL.OB_IAX_PRODGARANTIAS.CGARANT}')"/></div>
    </display:column>
</display:table>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
