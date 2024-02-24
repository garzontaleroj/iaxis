<%/**
*  Fichero: ${pantalla}.jsp

*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
    <!-- f_cargar_propiedades_pantalla(); -->
        <title><axis:alt f="axisctr187" c="TIULO_PANTALLA" lit="9903385"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr187.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload_axisctr187()">
        <c:import url="axisctr187_body.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>


