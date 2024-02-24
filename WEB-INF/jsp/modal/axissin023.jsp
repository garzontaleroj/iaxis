<%/**
*  Fichero: axissin023.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a>
*
*  Fecha: 26/05/2009
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

<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp"/>

<script language="Javascript" type="text/javascript">
// Código javascript  

    function f_but_cancelar(){
        parent.f_cerrar_modal("axissin023");
    }
    
    function f_but_aceptar(){
        objUtiles.ejecutarFormulario("modal_axissin023.do","guardar_detcausamotivo", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_onload(){
     revisarEstilos();
     var ver="${ERROR}";
        if (!objUtiles.estaVacio(ver) && '${ERROR}' == 0){
            parent.f_aceptar_axissin023();
        }
    }    

// Fin código javascript
</script>

<body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
<form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="SCAUMOT" value="${sessionScope.cabecera.SCAUMOT}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <fmt:message key="9001732"/>
                </c:param>
                <c:param name="producto">
                    <fmt:message key="9001732"/>
                </c:param>
                <c:param name="form">axissin023</c:param>
            </c:import>
            
            
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:5%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:23%;height:0px"></th>
                                
                               
                           </tr>
                            <tr>
                                <td></td>
                                <!-- Cod.Motivo/Causa -->
                                <td class="titulocaja">
                                    <b><fmt:message key="800440"/></b>
                                </td>
                                <!-- Causa -->
                                <td class="titulocaja">
                                    <b><fmt:message key="101040"/></b>
                                </td>
                                <!-- Motivo -->
                                <td class="titulocaja">
                                    <b><fmt:message key="102577"/></b>
                                </td>
                                <!-- Tip. Movimiento -->
                                <td class="titulocaja">
                                    <b><fmt:message key="1000591"/></b>
                                </td>
                                <!-- Acción apertura -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001691"/></b>
                                </td>
                                <!-- Acción finalización -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001692"/></b>
                                </td>
                               
                            </tr>
                            <tr>
                                <td></td>
                                
                                <td class="campocaja" > 
                                    <input type="text" name="CSCAUMOT" id="CSCAUMOT"  value="${sessionScope.cabecera.SCAUMOT}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="CSCAUMOT" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" name="TSCAUMOT" id="TSCAUMOT"  value="${sessionScope.cabecera.TCAUSIN}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="TSCAUMOT" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" name="TMOTSIN" id="TMOTSIN"  value="${sessionScope.cabecera.TMOTSIN}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="TMOTSIN" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" name="TMOVIMI" id="TMOVIMI"  value="${sessionScope.cabecera.TMOVIMI}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="TMOTSIN" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" name="TMOTMOV" id="MOTMOV"  value="${sessionScope.cabecera.TMOTMOV}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="TMOTSIN" a="modificable=false"/>/>
                                </td>
                                <td class="campocaja" >
                                    <input type="text" name="TMOTFIN" id="TMOTFIN"  value="${sessionScope.cabecera.TMOTFIN}"  class="campowidthinput campo campotexto"
                                           <axis:atr f="axissin023" c="TMOTSIN" a="modificable=false"/>/>
                                </td>
                                
                            </tr>
                        </table>
                         <div class="separador">&nbsp;</div>
                        <table class="seccion" >
                            <tr>
                                <th style="width:2%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:28%;height:0px"></th>
                                
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Causa -->
                                <axis:visible c="CCAUSIN" f="axissin023">
                                <td class="titulocaja" colspan="2">
                                    <b><fmt:message key="9001213"/></b>
                                </td>
                                </axis:visible>
                                <!-- Motiu -->
                                <axis:visible c="CMOTSIN" f="axissin023">
                                <td class="titulocaja" colspan="2">
                                    <b><fmt:message key="9001679"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <td></td>
                                <!-- Causa -->
                                <axis:visible c="CTIPDES" f="axissin023">
                                <td class="campocaja" colspan="2">
                                    <select  name = "CTIPDES" id="CTIPDES"  <axis:atr f="axissin022" c="CTIPDES" a="obligatorio=true&modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto" <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="desti" items="${LSTDESTINATARIOS}">
                                                    <option value = "${desti.CATRIBU}"
                                                     <c:if test="${(!empty CCTIPDES) && CCTIPDES == desti.CATRIBU}">selected</c:if>>
                                                     ${desti.TATRIBU}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <!-- Motiu -->
                                <axis:visible c="CMODFIS" f="axissin023">
                                <td class="campocaja" colspan="2">
                                    <select name = "CMODFIS" id="CMODFIS"  <axis:atr f="axissin022" c="CMODFIS" a="obligatorio=true&modificable=true&isInputText=false"/>
                                         value="" size="1" onchange="" class="campowidthselect campo campotexto" <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="modelos" items="${LSTMODFISCALES}">
                                                    <option value = "${modelos.CATRIBU}"
                                                     <c:if test="${(!empty CCMODFIS) && CCMODFIS == modelos.CATRIBU}">selected</c:if>>
                                                     ${modelos.TATRIBU}</option>  
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                               
                            </tr>
                        </table>
                    </td>
                </tr>
              </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones"><axis:visible c="BTCANCELAR" f="axissin022">cancelar,</axis:visible><axis:visible c="BTACEPTAR" f="axissin022"><c:if test="${isNew eq 'Si'}">aceptar</c:if></axis:visible>  </c:param>
            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>
