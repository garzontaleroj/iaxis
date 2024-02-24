<%/**
*  Fichero: axisctr028.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Título: Garantías, Datos riesgo y beneficiarios 
*
*  Pantalla que representa la unión de axisctr006 (Beneficiarios) y axisctr007 (Garantías).
*  Para el nuevo flujo de Alta de Pólizas con las pantallas unificadas.
*
*  Fecha: 03/03/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="100649"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr006.jsp">
           <c:param name="multiPantalla" value="true"/>
           <c:param name="nombrePantalla" value="axisctr028"/>            
        </c:import>            
        <c:import url="../../../scripts/axis/axisctr007.jsp">
               <c:param name="multiPantalla" value="true"/>
        </c:import>            
        <script type="text/javascript">
            function f_onload() {
                f_onload_axisctr006();
                f_onload_axisctr007();
            }
        </script>
    </head>
        <body onload="f_onload()">
            <!-- AXCTR006  -->
            <c:import url="axisctr006_body.jsp">
                <c:param name="multiPantalla" value="true"/>
                <c:param name="nombrePantalla" value="axisctr028"/>
            </c:import>
    
            <!-- AXCTR007  -->
            <c:import url="axisctr007_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
            
            <c:import url="../include/mensajes.jsp" />
        </body>
</html>

