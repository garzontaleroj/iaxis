<%/**
*  Fichero: axisctr008.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  
*  Octava pantalla del flujo de trabajo "Contratación Vida Riesgo".
*  Título: Cláusulas
*  Muestra las cláusulas para el producto seleccionado en axisctr001.jsp
*  Permite añadir cláusulas específicas para el producto actual.
*
*  Fecha: 30/10/2007
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr008" c="AXISCTR008_TITLE" lit="101791"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr008.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>                    

    </head>
    <body onload="f_onload_axisctr008();try{document.getElementById('DSP_CLAUSUDEF').style.height=document.getElementById('Dt_CLAUSUDEF').clientHeight+'px'}catch(e){}">
        <c:import url="axisctr008_body.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

