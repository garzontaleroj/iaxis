<%/* Revision:# RRS4RkF72O/gMxmrzw7knw== # */%>
<%/*
*  Fichero: axisctr230.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 16/06/2015
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
<style>
*{margin:0;padding:0}
html, body {height:100%;width:100%;overflow:hidden}
table {height:90%;width:100%;table-layout:static;border-collapse:collapse}
iframe {height:100%;width:100%}
.content {height:100%}
</style>
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
        
        function f_but_cerrar() {
        	parent.f_tarifar_paso2();
            parent.f_cerrar_axisctr230();
        }  
        
    </script>
    </head>
    <body>
    	<div id="wrapper" class="wrapper">
	    	<table>
			 	<tr><td class="content">
			      <iframe src="<%=request.getParameter("url")%>" frameborder="0"></iframe></td></tr>
			</table>
	    	<c:import url="../include/botonera_nt.jsp">
	            <c:param name="f">axisctr230</c:param>
	            <c:param name="__botones">cerrar</c:param>
	        </c:import>
        </div>
    </body>
</html>