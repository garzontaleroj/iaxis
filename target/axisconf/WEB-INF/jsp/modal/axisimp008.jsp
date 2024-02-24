<%/**
*  Fichero: axisimp008.jsp
*  Pantalla de alta de impuestos por empresa.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 30/12/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
 
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>    
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script> 
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
                var grabarOK = ${requestScope.grabarOK == 0};
                var CCONCEP_new = "${__formdata.CCONCEP_new}";
                if (grabarOK)
                    parent.f_aceptar_modal("axisimp008", "CCONCEP_new="+CCONCEP_new+"&");
            }
            
            function f_but_cancelar() {
                parent.f_cerrar_modal("axisimp008");
            }           
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("modal_axisimp008.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
        </script>
    </head>
    
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>             
            <input type="hidden" name="CCONCEP_ant" id="CCONCEP_ant" value="${__formdata.CCONCEP_ant}"/>             
            <input type="hidden" name="TCONCEP" id="TCONCEP" value="${__formdata.TCONCEP}"/> 
            <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/> 
            
            <c:import url="../include/titulo_nt.jsp">
               <c:param name="formulario">
                <axis:alt c="formulario" f="axisimp008" lit="9905895" />
               </c:param>
               <c:param name="producto">
                <axis:alt c="formulario" f="axisimp008" lit="9905895" />
               </c:param>
               <c:param name="form">axisimp008</c:param>
            </c:import> 
            
            <!-- Área de campos  -->
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp; </div>                                        
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisimp008" c="CCONCEP" dejarHueco="false"> 
                                                <td class="titulocaja">
                                                   <div class="separador">&nbsp;</div>
                                                   <b><axis:alt f="axisimp008" c="CCONCEP" lit="9001284"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr> 
                                        <tr>
                                            <axis:ocultar f="axisimp008" c="CCONCEP" dejarHueco="false"> 
                                                <td class="campocaja" >
                                                <select name="CCONCEP" id="CCONCEP" size="1" class="campowidthselect campo campotexto_ob" 
                                                        <axis:atr f="axisimp008" c="CCONCEP" a="obligatorio=true&isInputText=false&modificable=true"/>
                                                        title= "<axis:alt f="axisimp008" c="CCONCEP" lit="9001284"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                      <axis:alt f="axisimp008" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="concepto" items="${__formdata.LSTCONCEPTO}">
                                                        <option value="${concepto.CVALAXIS}"
                                                                <c:if test="${__formdata['CCONCEP'] == concepto.CVALAXIS}">selected</c:if>>
                                                            ${concepto.CVALEMP}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                </td>
                                            </axis:ocultar> 
                                        </tr>
                                    </table>           
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp; </div>                                        
                        <c:import url="../include/botonera_nt.jsp">
                            <c:param name="f">axisimp008</c:param>
                            <c:param name="__botones">cancelar,aceptar</c:param>
                        </c:import>
                    </td>
                </tr>
            </table>
        </form>
         
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
