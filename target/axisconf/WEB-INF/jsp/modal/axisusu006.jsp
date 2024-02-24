<%/**
*  Fichero: axisusu006.jsp
*  Pantalla de cambio de terminales.
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>  
*
*  Fecha: 07/11/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><fmt:message key="1000233"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                revisarEstilos();
                <% if(request.getAttribute("RESPUESTA_OK") != null){%>
                    parent.f_axisusu006_aceptar();
                <%}%>    
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()) {                
                    objUtiles.ejecutarFormulario("modal_axisusu006.do", "aceptar", document.miForm, "_self");                               
                }
            }            

            function f_but_cancelar() {
                parent.f_cerrar_modal("axisusu006");
            }           
            
        </script>
    </head>
    <body  onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><fmt:message key="9000590" /></c:param>
                <c:param name="titulo"><fmt:message key="9000590" /></c:param>
                <c:param name="form">axisusu006</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="9000599"/></div>
                        <!-- Sección Nuevo terminal -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área Nuevo terminal -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:75%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000596"/></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><fmt:message key="9000597"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CMAQFISI" name="CMAQFISI" size="15"
                                                style="width:80%" value="${__formdata.CMAQFISI}" obligatorio="true" alt="<fmt:message key="9000596"/>" title="<fmt:message key="9000596"/>"/>
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CTERMINAL" name="CTERMINAL" size="15"
                                                style="width:30%" value="${__formdata.CTERMINAL}" obligatorio="true" alt="<fmt:message key="9000597"/>" title="<fmt:message key="9000597"/>"/>
                                            </td>
                                        </tr>                                        
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>                                                                          
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>