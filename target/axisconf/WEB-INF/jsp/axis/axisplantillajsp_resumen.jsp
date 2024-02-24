<%/*
*  Fichero: axisplantillajsp_resumen.jsp
*  Se corresponde a la pantalla de resumen: similar a la pantalla axisctr020
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 23/04/2008
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="formulario.axisplantillajsp_resumen"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
        // Despliegue subseccion contenida parámetro: "subpantalla"
            <% 
            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %>       
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';                        
                if (subpantalla.startsWith("datoseccion") && subpantalla != "datoseccion") {                    
                    objEstilos.toggleDisplay("datoseccion", document.getElementById("datoseccion_parent"));
                }
                
            <% } %>
        
        }
        
         function f_but_cancelar() {
            
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_resumen", "cancelar", document.miForm, "_self");
        }
        
       
        function f_but_imprimir() {
        }
   </script>    
</head>

<body onload="javascript:f_onload()">
   <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="formulario.axisplantillajsp_general" /></c:param>
                <c:param name="form">axisplantillajsp_general</c:param>
   </c:import>

<!-- Area de campos  -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <div class="separador">&nbsp;</div>
            <div class="titulo">
                <img src="images/flecha.gif"/><fmt:message key="datos_resumen"/>
                   
            </div>
           
            <table class="seccion">
                <tr>
                    <td>
                        
                        <table class="area" align="center">
                             <tr>
                                <th style="height:0px"></th>
                            </tr>
                            <!-- Inicio Seccion -->
                            <tr>
                                <td class="tituloseccion campocaja" >
                                     
                                    <div style="float:left;">
                                        <img id="datoseccion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datoseccion', this)" style="cursor:pointer"/> 
                                        <b><fmt:message key="datos_seccion"/></b> &nbsp; datos_generales_resumen { ... }
                                    </div>
                                
                                    <div style="clear:both;width:101.5%" >
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>                                    
                            <tr id="datoseccion_children" style="display:none">
                                <td>
                                    <c:import url="axisplantillajsp_seccion.jsp"/>
                                </td>
                            </tr>
                            <!-- Fin seccion -->
                        </table>
       </td>
    </tr>
</table>
</td>
</tr>
</table>

<c:import url="../include/botonera_nt.jsp">
    <c:param name="__botones">cancelar,imprimir</c:param> 
</c:import>

<form name="miForm" action="axis_plantilla.do">
   <input type="hidden" name="operation" value=""/> 
</form>

<c:import url="../include/mensajes.jsp"/>
</body>
</html>