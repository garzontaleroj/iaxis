
<%
/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */
%>
<%
/**
*  Fichero: axisctr004.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  
*  Cuarta pantalla del flujo de trabajo "Contratación Vida Riesgo".
*  Título: Datos de Gestión
*  Permite editar el ramo y el producto seleccionados en axisctr001.jsp
*
*  Fecha: 26/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title><axis:alt f="axisctr004" c="titulo" lit="151090" /></title>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<%-- Especial per controlar els scroll amb iPad --%>
<link type="text/css" href="styles/jquery.jscrollpane.css"
	rel="stylesheet"
	media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
<style type="text/css" id="page-css"
	media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)">
.wrapper {
	width: 100%;
	height: 80px;
	overflow: auto;
}
</style>
<script type="text/javascript" src="scripts/jsFecha.js"></script>
<!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
<%-- FI Especial per controlar els scroll amb iPad --%>
<c:import url="../include/carga_framework_js.jsp" />
<c:import url="../../../scripts/axis/axisctr004.jsp">
	<c:param name="multiPantalla" value="false" />
</c:import>
</head>
<body onload="f_onload_axisctr004()">
	<c:import url="axisctr004_body.jsp">
		<c:param name="multiPantalla" value="false" />
	</c:import>
	<%--c:import url="axisctr004_body2.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import--%>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>

