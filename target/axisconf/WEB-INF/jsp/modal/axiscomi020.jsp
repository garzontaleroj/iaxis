<%/**
*  Fichero: axiscomi020.jsp
*  Pantalla de cambio de datos de usuario y de alta usuario.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 07/11/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <title><axis:alt f="axiscomi020" c="NOMBREPANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {                
                if (${requestScope.grabarOK == true}) {
                    parent.f_aceptar_modal("axiscomi020");
                } else {
                    if (${__formdata.isNewUser != "true"}) {
                        document.getElementById("CEMPRES").readOnly = "readonly";
                        document.getElementById("CEMPRES").setAttribute("obligatorio", false);
                    } else 
                        document.getElementById("CEMPRES").focus();                
                }
                f_cargar_propiedades_pantalla();
                revisarEstilos();
            }
            
            function f_but_aceptar() {
                    objUtiles.ejecutarFormulario("modal_axiscomi020.do", "aceptar", document.miForm, "_self");
                    

            }            

            function f_but_cancelar() {
                parent.f_aceptar_modal("axiscomi020");
                
            }
            
               
            
            function f_seleccionar_autologin(){
            }
            
            function f_seleccionar_cvispubli(){
                objDom.setValorPorId("CVISPUBLI_CHECK", ((document.miForm.CVISPUBLI.checked)? "1" : "0"));
            }            
            
        </script>
    </head>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="isNewUser" id="isNewUser" value="${__formdata.isNewUser}"/>
            <input type="hidden" name="CAUTLOG_CHECK" id="CAUTLOG_CHECK" value="${__formdata.CAUTLOG}"/>
            <input type="hidden" name="CVISPUBLI_CHECK" id="CVISPUBLI_CHECK" value="${__formdata.CVISPUBLI}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi020" c="CAUTLOG_CHECK" lit="${__formdata.isNewUser == 'true' ? '9908141' : 9908140}"/></c:param>
                <c:param name="titulo"><axis:alt f="axiscomi020" c="CAUTLOG_CHECK_TIT" lit="${__formdata.isNewUser == 'true' ? '9908141' : 9908140}"/></c:param>
                <c:param name="form">axiscomi020</c:param>
            </c:import>
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axiscomi020" c="CAMPOS" lit="9908139"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axiscomi020" c="CEMPRES">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi020" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="NMES_I">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi020" c="MES_I" lit="9908142"/></b> <%-- Mes Inicial --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="NMES_F">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi020" c="MES_F" lit="9908138"/></b> <%-- Mes final --%>
                                            </td>   
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="PANULAC">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axiscomi020" c="ANULAC" lit="9908139"/></b> <%-- Porcentaje retrocesion comision --%>
                                            </td>   
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axiscomi020" c="CEMPRES">
                                            <td class="campocaja"> 
                                                <input type="hidden" class="campowidthinput campo campotexto" id="CEMPRES_OLD" name="CEMPRES_OLD" size="15"
                                                style="width:80%"  value="${__formdata.CEMPRES}"/>
                                                <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axiscomi020" c="CEMPRES" lit="1000348"/> - </option>
                                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                        <option value = "${element.CEMPRES}"
                                                        <c:if test="${__formdata.CEMPRES == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1}"> selected = "selected"</c:if>>
                                                            ${element.TEMPRES} 
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="NMES_I">

                                            <td class="campocaja">  
                                                <input type="hidden" class="campowidthinput campo campotexto" id="NMES_I_OLD" name="NMES_I_OLD" size="15"
                                                style="width:80%"  value="${__formdata.NMES_I}"/>
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NMES_I}" name="NMES_I" id="NMES_I" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi020" c="MES_I" lit="9908142"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="NMES_F">

                                            <td class="campocaja">
                                                <input type="hidden" class="campowidthinput campo campotexto" id="NMES_F_OLD" name="NMES_F_OLD" size="15"
                                                style="width:80%"  readonly="true"  value="${__formdata.NMES_F}"/>
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.NMES_F}" name="NMES_F" id="NMES_F" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi020" c="MES_F" lit="9908138"/>" />
                                            </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axiscomi020" c="PANULAC">

                                            <td class="campocaja">  
                                                <input type="hidden" class="campowidthinput campo campotexto" id="PANULAC_OLD" name="PANULAC_OLD" size="15"
                                                style="width:80%"  readonly="true"  value="${__formdata.PANULAC}"/>
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                value="${__formdata.PANULAC}" name="PANULAC" id="PANULAC" formato="entero"
                                                style="width:40%;" title="<axis:alt f="axiscomi020" c="ANULAC" lit="9908139"/>" />
                                            </td> 
                                        </axis:ocultar>                                        
                        
                         </tr>              
                                    </table>
                                </td>
                            </tr>
                        </table>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi020</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>