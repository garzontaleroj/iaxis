<%/**
*  Fichero: axisplantillajsp.jsp
*  Pantalla que sirve de plantilla para construir otros JSP de iAxis.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 06/02/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><fmt:message key="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisnombrepantalla", "cancelar", document.miForm, "_self");
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            // TODO Implementar CallBack Ajax
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="formulario.axisnombrepantalla" /></c:param>
                <c:param name="form">axisnombrepantalla</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="primera_seccion"/></div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:80%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_1 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_2
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_3
                                            </td>
                                        </tr>                                                                                
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="segunda_seccion"/></div>
                        <!-- Sección 2 -->
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:80%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_4"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_4
                                            </td>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_5"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_5
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_6"/></b>
                                            </td>
                                            <td class="campocaja">
                                                campo_6
                                            </td>
                                        </tr>                                                                                
                                    </table>
                                </td>
                            </tr>
                        </table>                                                                           
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

