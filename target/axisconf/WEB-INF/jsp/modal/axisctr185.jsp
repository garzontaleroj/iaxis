<%/*
*  Fichero: axisctr185.jsp
*
*  Fecha: 22/02/2012
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <%-- <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" /> --%>
    <%-- <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width:100%;height: 480px;overflow: auto;} </style> --%>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />

    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_aceptar() {
            parent.f_cerrar_modal("axisctr185");
        }
        
        function f_but_cancelar() {
            //Crear este método en el padre
            parent.f_cerrar_axisctr185();
        }        
        
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="">
        <!-- <div id="wrapper" class="wrapper"> -->
            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            <form name="miForm" action="" method="POST">
                <input type="hidden" name="operation" value=""/>
                <input type="hidden" name="URL" id="URL" value="${URLCuestionario}"/>
                
                <c:set var="tituloModal"><axis:alt f="axisctr185" c="TITULO" lit="1000108"/></c:set>
    
                <c:if test="${!empty URLCuestionario}">
                    <iframe src="${URLCuestionario}" frameborder=0 width="1000" height="750"> </iframe>
                </c:if>
                
                <!-- Botonera -->
                <c:import url="../include/botonera_nt.jsp">
                    <c:param name="f">axisctr185</c:param>
                    <c:param name="__botones">cancelar,aceptar</c:param>
                </c:import>
    
            </form>
            <c:import url="../include/mensajes.jsp" />
        <!-- </div> -->
    </body>
</html>