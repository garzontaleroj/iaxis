<%/**
*  Fichero: axisctr006.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  
*  Sexta pantalla del flujo de trabajo "Contratación póliza". 
*
*
*  Fecha: 30/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000079"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr006.jsp">
           <c:param name="multiPantalla" value="false"/>
           <c:param name="nombrePantalla" value="axisctr006"/>            
        </c:import>            
    </head>
    <body onload="f_onload_axisctr006()">
        <c:import url="axisctr006_body.jsp">
            <c:param name="multiPantalla" value="false"/>
            <c:param name="nombrePantalla" value="axisctr006"/>            
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

