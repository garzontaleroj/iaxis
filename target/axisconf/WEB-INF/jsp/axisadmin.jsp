<%/**
*  Fichero: axisadmin.jsp
*  pantalla para funciones administrativas - utiliza plantilla nueva
*  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>  
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>  
*  Fecha: 23/04/2008
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
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="./include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisadmin", "cancelar", document.miForm, "_self");
            }           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function f_but_aceptar(que) {
                if (que=='recargarbundles') {
                    document.miForm.operation.value="recargarbundles";
                    document.miForm.action="axis_axisadmin.do";
                    document.miForm.submit()
                }            
            }
            
            // TODO Implementar CallBack Ajax

  
            
        </script>
    </head>
    <body  onload="f_onload()">  
        <c:import url="./include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <c:import url="./include/titulo_nt.jsp">
                <c:param name="formulario">AXISAdmin</c:param>
                <c:param name="form">axisadmin</c:param>
            </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>ResourceBundles</div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b>Bundle</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                            <input type="text" class="campowidth campo campotexto_ob" value="Mensajes*" readonly="readonly" />
                                            </td>
                                            <td class="campocaja">
                                            </td>
                                            <td class="campocaja">
                                                <input  type="button" class="boton" id="but_aceptar_recargarbundles" name="but_aceptar_recargarbundles" value="<fmt:message key="100009" />" onclick="f_but_aceptar('recargarbundles')"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
             <div class="separador">&nbsp;</div>
            <c:import url="./include/botonera_nt.jsp">
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </form>
        <c:import url="./include/mensajes.jsp" />
    </body>
</html>