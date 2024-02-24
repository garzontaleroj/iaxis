<%
/**
*  Fichero: axispsu018.jsp
*  
*
* Descripción de pantalla
*
*  Fecha: 02/02/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
 <head>
    <title><axis:alt f="axispsu015" c="TITULO_HTML" lit="9002255"/></title> <%-- Politica de subscripción detalle --%>
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        
        <script language="Javascript" type="text/javascript">
        // Código javascript
        
            function f_onload() {       
                
         
                  f_cargar_propiedades_pantalla();
            }
            
            
            function f_but_cancelar(){
                parent.f_cerrar_axispsu018();
            }
            
            function f_but_aceptar(){
           
            	
            	
               if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axispsu018.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }
            
            
         
        // Fin código javascript
        </script>
 </head>   
 <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>                    
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
           
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axispsu015" c="TIT_FORM" lit="9002255"/></c:param>
                <c:param name="producto"><axis:alt f="axispsu015" c="TIT_FORM" lit="9002255"/></c:param>
                <c:param name="form">axispsu018</c:param>
            </c:import>
            
            <input type="hidden" name="SSEGUROS" id="SSEGUROS" value="${__formdata['SSEGUROS']}"/>
            <input type="hidden" id="NVERSIONS" name="NVERSIONS" value="${__formdata['NVERSIONS']}"/>
            <input type="hidden" name="NMOVIMIS" id="NMOVIMIS" value="${__formdata['NMOVIMIS']}"/>
            
                    
                  
            <!-- Area de campos  -->
                    <table class="mainModalDimensions base" align="center" 
                           cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                              
                            <div class="separador">&nbsp;</div>
                            
                                <c:set var="resumen">
                                    <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                        <b><axis:alt f="axispsu018" c="RESUM_PSU" lit="9900980"/>:</b> ${__formdata.CCONTROL} &nbsp; <b> - </b> ${__formdata.TCONTROL }                         
                                    </span>
                                </c:set>
                            
                
                                
                            <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axispsu015" c="DSP_PSU" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp;</div>
                              <!--campos-->
                                
                               <table class="seccion" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                               
                                            </tr>
                                            
                                            <tr>
                                                <axis:visible f="axispsu018" c="TUSUMOV " >
                                                    <td class="titulocaja">
                                                        <b id="label_TUSUMOV"><axis:alt f="axispsu015" c="TUSUMOV" lit="9900981"/></b> <%-- Usuario emisión --%>                                                
                                                    </td>
                                                </axis:visible>
                                              
                                            </tr>
                                            <tr>                 
                                             <axis:visible f="axispsu015" c="TUSUMOV " >
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="TUSUMOV " name="TUSUMOV " size="15" 
                                                        <axis:atr f="axispsu018" c="TUSUMOV" a="modificable=false"/>
                                                        value="${__formdata.CUSUALT}"
                                                         title="<axis:alt f="axispsu018" c="TUSUMOV" lit="9900981"/>"/>
                                                    </td>
                                                </axis:visible>
                                          
                                            </tr>    
                                     
                                            <tr>
                                            
                                                <tr>
                                                 <axis:visible f="axispsu015" c="FAUTREC" >
                                                    <td class="titulocaja">
                                                        <b id="label_FAUTREC"><axis:alt f="axispsu018" c="FAUTREC" lit="100562"/></b> <%-- % Observaciones --%>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </axis:visible>
                                               </tr>
                                            
                                                <axis:visible f="axispsu015" c="FAUTREC" >
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" id="FAUTREC" name="FAUTREC" size="15" 
                                                        <axis:atr f="axispsu015" c="FAUTREC" a="modificable=false"/>
                                                        value="<fmt:formatDate value="${__formdata.FALTA}" pattern="dd/MM/yyyy" />" 
                                                        style="width:80%"
                                                        title="<axis:alt f="axispsu015" c="FAUTREC" lit="9900983"/>"/>
                                                    </td>
                                                </axis:visible>
                                                
                                                 <tr>
                                                 <axis:visible f="axispsu015" c="CAUTREC" >
                                                    <td class="titulocaja">
                                                        <b id="label_CAUTREC"><axis:alt f="axispsu018" c="CAUTREC" lit="100587"/></b> <%-- % Observaciones --%>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </axis:visible>
                                                </tr>
                                                
                                                 <axis:visible f="axispsu015" c="CAUTREC" >
                                                 <td class="campocaja">
                                                     <select name = "CSUBESTADO" id="CSUBESTADO" onchange="f_cargar_propiedades_pantalla();" class="campowidthinput campo campotexto" style="width:95%" 
                                                          <axis:atr f="" c="CAUTREC" a="modificable=true&obligatorio=true&&isInputText=false"/>  size="1" title="<axis:alt f="axispsu015" c="CAUTREC" lit="9900977"/>">
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axispsu015" c="SNV_COMBO" lit="108341"/> - </option>
                                                            <c:forEach var="listado" items="${listValores.estadocontrol}">
                                                                <option value = "${listado.CATRIBU}"
                                                                    <c:if test="${listado.CATRIBU == __formdata.CSUBESTADO}">selected</c:if>>
                                                                    ${listado.TATRIBU}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                </td>
                                                </axis:visible>
                                               
                                                
                                            </tr>
                                           
                                            <tr>
                                                 <axis:visible f="axispsu015" c="OBSERV" >
                                                    <td class="titulocaja">
                                                        <b id="label_OBSERV"><axis:alt f="axispsu018" c="OBSERV" lit="101162"/></b> <%-- % Observaciones --%>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </axis:visible>
                                            </tr>
                                            <tr>
                                                <axis:visible f="axispsu015" c="OBSERV" >
                                                    <td class="campocaja" colspan="4">
                                                     <textarea class="campowidthinput campo campotexto"  <axis:atr f="axispsu015" c="OBSERV" a="modificable=true&isInputText=false"/> style="width:100%;" name="OBSERV" id="OBSERV">${__formdata.COBSERVACIONES}</textarea>
                                                    </td>
                                                </axis:visible>
                                               
                                                                             
                                            </tr>
                                        </table>
                            </td>
                        </tr>
                      </table>
                    
                    
                    
                    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispsu018</c:param>
                        <c:param name="__botones">cancelar,<axis:visible c="BT_ACEPTAR" f="axispsu018">aceptar</axis:visible></c:param>
                    </c:import>
                    
        </form>
        <c:import url="../include/mensajes.jsp"/>
        </body>
        </html>
