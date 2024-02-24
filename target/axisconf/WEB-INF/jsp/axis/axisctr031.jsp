<%/**
*  Fichero: axisctr031.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". 
*
*
*  Fecha: 12/03/2007
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
        <title><axis:alt f="axisctr031" c="TITOLAXISCRT007" lit="1000197"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <link rel="stylesheet" href="styles/displaytag.css">        
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr031.jsp">
               <c:param name="multiPantalla" value="false"/>
        </c:import>                    
    </head>
    <body onload="f_onload_axisctr031()">
        <c:import url="axisctr031_body.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>
        <c:import url="../include/mensajes.jsp" />
        
        <style type="text/css">
         div.fixedHeaderTable {
             position: relative;
             height: 100px;
             overflow-y: auto;
             overflow-x: hidden; 

         }
         
         div.fixedHeaderTable tbody {
             height: auto;
             position:relative;
         }

         div.fixedHeaderTable table {
            height: auto;
            border-width: thin;
            border-style: solid;
            border-color: #E6E6E6;
         }
         
         /* IE */
         div.fixedHeaderTable {
             *position: relative;
             *height: 100px;
             *overflow-y: auto;
             *overflow-x: hidden;
         }
         
         div.fixedHeaderTable tbody {
             *height: auto;
             *position:relative;
         }  
         
         div.fixedHeaderTable table {
            *height: auto;
            *border-width: thin;
            *border-style: solid;
            *border-color: #E6E6E6;  
         }
        </style>        
    </body>
</html>

