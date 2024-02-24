<%/**
*  Fichero: axisctr002.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*
*  Segunda pantalla del flujo de trabajo "Contrataci?n p?liza". Inicialmente abrimos el modal de personas para escoger
*  una persona. Seguidamente, llamaremos a la funci?n:
*  PAC_IAX_PRODUCCION.F_LeeTomadores - retornar? el objeto T_IAX_TOMADORES que contiene todos los tomadores
*  o bien
*  PAC_IAX_PRODUCCION.F_LeeUltTomador - Devolver? el objeto OB_IAX_TOMADORES con el ?ltimo registro 
*  de la colecci?n de tomadores para mostrar en el multiregistro.
*  El multirregistro de tomadores aparecer? solo en aquellos productos que:
*       - Permitan m?s de un tomador.
*       - No se mostrar? el campo ?El tomador es un asegurado?
*  NOTA: Para saber si mostrar el multiregistro de tomadores usaremos la funci?n:
*           PAC_IAXPAR_PRODUCTOS.F_PermitirMultiTomador que devolver? 
*           - 1 aparece multiregistro y no muestra ?El tomador es un asegurado?. Entonces en el multiregistro podremos 
*               seleccionar si un tomador es asegurado o no.
*           - 0 no aparece multiregistro y se muestra ?El tomador es un asegurado?
*   El usuario selecciona domicilio y marca si el tomador ser? tambi?n asegurado. 
*   Pulsando sobre el bot?n + de direcciones podemos a?adir una nueva direcci?n a la persona que nos permita
*   posteriormente seleccionarla. El resto de campos son informativos y no modificables.
*
*  Fecha: 29/10/2007
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000181"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
           <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr002.jsp">        
            <c:param name="multiPantalla" value="false"/>
        </c:import>
    </head>
    <body onload="f_onload_axisctr002() ">
                <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><fmt:message key="9000642"/></c:param>
                <c:param name="nid">axisper016</c:param>
        </c:import>
        <c:import url="axisctr002_body.jsp">
           <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

