<%/**
*  Fichero: ${pantalla}.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  
*  Tercera pantalla del flujo de trabajo "Contratación póliza". Inicialmente abrimos el modal de personas para escoger
*  una persona. Seguidamente:
* 	La pantalla se muestra con los datos de la persona escogida cumplimentados automáticamente con la información recuperada de la bbdd. 
*	El multirregistro de asegurados aparecerá solo en aquellos productos que permitan más de un asegurado. Los asegurados añadidos se pueden eliminar pulsando el botón de eliminación del registro.
*	El usuario selecciona el vínculo con el tomador será también asegurado. Pulsando sobre el botón + de vínculos podemos añadir un nuevo vínculo a la persona que nos permita posteriormente seleccionarlo. 
*	Botón Siguiente:
*	Se han de realizar las validaciones pertinentes dependientes de producto.
*
*
*  Fecha: 29/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr175" c="CORRETAJE_TIT" lit="102826"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr175.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload_axisctr175()">
        <c:import url="axisctr175_body.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr176" c="titulo" lit="9001543" /></c:param>
            <c:param name="nid" value="axisctr176" />
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

