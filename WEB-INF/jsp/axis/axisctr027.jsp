<%/**
*  Fichero: axisctr027.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Título: Datos de gestión y Cláusulas
*
*  Pantalla que representa la unión de axisctr004 (Datos de gestión) y axisctr008 (Cláusulas).
*  Para el nuevo flujo de Alta de Pólizas con las pantallas unificadas.
*
*  Fecha: 29/02/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000194"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr004.jsp">
               <c:param name="multiPantalla" value="true"/>
        </c:import>            
        <c:import url="../../../scripts/axis/axisctr008.jsp">
               <c:param name="multiPantalla" value="true"/>
        </c:import>            
    </head>
        <body onload="f_onload_axisctr004();">
            <!-- AXCTR004  -->
            <c:import url="axisctr004_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
    
            <!-- AXCTR008  -->
            <c:import url="axisctr008_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
            
            <c:import url="../include/mensajes.jsp" />
        </body>
</html>

