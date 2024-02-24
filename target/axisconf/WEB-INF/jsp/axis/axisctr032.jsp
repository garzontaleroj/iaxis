<%/**
*  Fichero: axisctr032.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*
*  Título: Garantías ahorro y rentas, Datos riesgo y beneficiarios 
*
*  Pantalla que representa la unión de axisctr006 (Beneficiarios) y axisctr031 (Garantías ahorro y rentas).
*  Para el nuevo flujo de Ahorro y rentas con las pantallas unificadas.
*
*  Fecha: 12/03/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000198"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr006.jsp">
           <c:param name="multiPantalla" value="true"/>
           <c:param name="nombrePantalla" value="axisctr032"/>            
        </c:import>            
        <c:import url="../../../scripts/axis/axisctr031.jsp">
            <c:param name="multiPantalla" value="true"/>
        </c:import>            
        <script type="text/javascript">
            function f_onload() {
                f_onload_axisctr006();
                f_onload_axisctr031();
            }
        </script>
    </head>
        <body onload="f_onload()">
            <!-- AXCTR006  -->
            <c:import url="axisctr006_body.jsp">
                <c:param name="multiPantalla" value="true"/>
                <c:param name="nombrePantalla" value="axisctr032"/>                            
            </c:import>
    
            <!-- AXCTR031  -->
            <c:import url="axisctr031_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
            
            <c:import url="../include/mensajes.jsp" />
        </body>
</html>

