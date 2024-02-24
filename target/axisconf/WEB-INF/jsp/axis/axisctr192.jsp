<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr192" c="CORRETAJE_TIT" lit="9904182"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr192.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload_axisctr192()">
        <c:import url="axisctr192_body.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr193" c="titulo" lit="9904183" /></c:param>
            <c:param name="nid" value="axisctr193" />
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

