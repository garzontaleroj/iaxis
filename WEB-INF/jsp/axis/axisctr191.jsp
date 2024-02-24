<%/**
*  Fichero: axisctr191.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr191" c="TITULO_HTML" lit="1000181"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
           <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr191.jsp">        
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload_axisctr191() ">
                <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr191" c="titulo" lit="9000642"/></c:param>
                <c:param name="nid">axisper016</c:param>
        </c:import>
        <c:import url="axisctr191_body.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

