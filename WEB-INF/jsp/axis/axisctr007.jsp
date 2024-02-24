<%/**
*  Fichero: axisctr007.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  
*  S?ptima pantalla del flujo de trabajo "Contrataci?n p?liza". En ella:
*
* 	El multirregistro superior muestra las preguntas a nivel de riesgo definidas para el producto. 
*	Forma de pago. Si solo hay un asegurado se puede cambiar los datos desde aqu? y en caso de que haya m?s de un asegurado solo es informativo.
*	El usuario informa del capital y pulsa a tarifar para que el sistema calcule las primas. Se han de tarifar todas las garant?as obligatorias y las opcionales que se deseen. 
*	Mediante los accesos de color verde podemos acceder al detalle de importes (D),  preguntas por garant?a (P) y franquicias (F). Cada uno de estos accesos conduce a una pantalla emergente (por definir). Una vez accedido a una de estas pantallas y cumplimentados los datos, al regresar a la pantalla de garant?as, el acceso cambia de color y/o forma para indicar al usuario que dicha informaci?n ya est? cumplimentada. Se ha de parametrizar por producto o instalaci?n que accesos han de aparecer.
*	Al pulsar a siguiente el sistema comprueba que est?n cumplimentados todos los datos necesarios.  Si todo es correcto retornamos a la pantalla de datos de asegurados en caso de que el producto admita m?s de un asegurado y en caso contrario accedemos directamente a la pantalla de cl?usulas.
*	Si pulsamos cancelar o anterior retrocedemos al flujo general, es decir a la pantalla de gesti?n de asegurados.
*
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
        <title><axis:alt f="axisctr007" c="TITOLAXISCRT007" lit="1000183"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 85px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr007.jsp">
               <c:param name="multiPantalla" value="false"/>
        </c:import>                    
    </head>
    <body onload="f_onload_axisctr007();revisarEstilos();">
        
      <%--  <c:import url="axisctr007_preguntas.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>--%>
        <c:import url="axisctr007_body.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
        
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

