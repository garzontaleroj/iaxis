<%/**
*   
*  Pantalla de pruebas
*  Fecha: 13/03/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><fmt:message key="1000182"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
            }
            
            function f_disable_buttons(){
                objDom.setVisibilidadPorId("but_cancelar", "hidden");
            }
            function f_but_anterior() {
                // objUtiles.ejecutarFormulario("axis_axisctr004.do", "form", document.miForm, "_self");
                objUtiles.ejecutarFormulario("axis_axisctr005.do", "anterior", document.miForm, "_self");
            }
            function f_but_siguiente() {
                // objUtiles.ejecutarFormulario("axis_axisctr006.do", "form", document.miForm, "_self");
                objUtiles.ejecutarFormulario("axis_axisctr005.do", "siguiente", document.miForm, "_self");
            }
            
            function f_but_riesgo(){
                //Acción para acceder a la pantalla axisctr006
            }
            
            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr005", "cancelar", document.miForm, "_self");
            }    
            
            // TODO: Pendiente revisar 
            function f_seleccionar_producto (SPRODUC){ 
                //Ejecutamos formulario según producto seleccionado 
                if (!objUtiles.estaVacio (SPRODUC)) {
                    objDom.setValorPorId ("SPRODUC", SPRODUC);
                } else {
                    var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("radioProducto", "SPRODUC");
                    if (!hayAlgunChecked) {
                        alert (objJsMessages.jslit_selecciona_producto);
                        return;
                    }
                }
                objUtiles.ejecutarFormulario ("axis_axisctr001.do", "siguiente", document.miForm, "_self");
                //en la funcion siguiente de este service guardará información sobre el producto
            }
            
            
        </script>
    </head>
    <body onload="f_onload()">
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><fmt:message key="101110" /></c:param>
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><fmt:message key="1000182" /></c:param>
                  
                <c:param name="form">axisctr005</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000182" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                         <table class="seccion">
                            <tr>
                                <th style="width:68%; height:0px"></th>
                                <th style="width:25%; height:0px;"></th>
                                <th style="width:7%; height:0px"></th>
                            </tr>
                            <tr>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,anterior,siguiente</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>