<%/**
*  Fichero: axissin006.jsp
*  @author <a href = "mailto:xvila@csi-ti.com">Xavi Vila</a>
*  @author <a href = "mailto:xpator@csi-ti.com">Xavi Pastor</a>
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Primera pantalla del flujo de trabajo "Consulta de Siniestro". En ella:
*
* Descripción de pantalla
*
*  Fecha: 19/10/2007
*/
%>
<html>
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

    function f_onload() {
        revisarEstilos();
        var grabat = "${__formdata.OK}";
         if (!objUtiles.estaVacio(grabat) && objUtiles.utilEquals(grabat,"0")){
          parent.f_aceptar_axissin025();
         }
    }
    function f_but_aceptar(){
        if (objValidador.validaEntrada()) 
            objUtiles.ejecutarFormulario("modal_axissin025.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }

    function f_but_cancelar(){
        parent.f_cerrar_modal('axissin025');
    }
   function f_actualizar(thiss){
       if (objUtiles.utilEquals(thiss.id,"SPRODUC")){
            document.miForm.SPRODUC.value = thiss.value;
            document.miForm.CACTIVI.value = null;
            document.miForm.CGARANT.value = null;
            document.miForm.CTRAMIT.value = null;
       }else if (objUtiles.utilEquals(thiss.id,"CACTIVI")){
            document.miForm.CACTIVI.value = thiss.value;
            document.miForm.CGARANT.value = null;
            document.miForm.CTRAMIT.value = null;
       }else if (objUtiles.utilEquals(thiss.id,"CGARANT")){
            document.miForm.CGARANT.value = thiss.value;
            document.miForm.CTRAMIT.value = null;
       }else if (objUtiles.utilEquals(thiss.id,"CTRAMIT")){
            document.miForm.CTRAMIT.value = thiss.value;
       }
   
        objUtiles.ejecutarFormulario("modal_axissin025.do?isNew=Si", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
   }    
// Fin código javascript
</script>

<body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
<form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <fmt:message key="9001715"/>
                </c:param>
                <c:param name="producto">
                    <fmt:message key="9001715"/>
                </c:param>
                <c:param name="form">axissin025</c:param>
            </c:import>
            
            
    <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center" 
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                                
                            </tr>
                            <tr>
                                <!-- SCAUMOT -->
                                <axis:visible f="axissin025" c="SCAUMOT" >
                                <td class="titulocaja">
                                    <b><fmt:message key="1000109" /></b>
                                </td>
                                </axis:visible>
                                <!-- Causa -->
                                <td class="titulocaja">
                                    <b><fmt:message key="101040"/></b>
                                </td>
                                <!-- Motiu -->
                                <td class="titulocaja">
                                    <b><fmt:message key="102577"/></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- SCAUMOT -->
                                <axis:visible f="axissin025" c="SCAUMOT" >
                                <td class="campocaja">
                                     <input type="text" name="SCAUMOT"
                                           value="${sessionScope.cabecera.SCAUMOT}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin025" c="SCAUMOT" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <!-- Causa -->
                                <td class="campocaja">
                                  <input type="text" name="CCAUSIN"
                                           value="${sessionScope.cabecera.TCAUSIN}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin025" c="CCAUSIN" a="modificable=false"/>/> 
                                </td>
                                <!-- Motiu -->
                                <td class="campocaja">
                                   <input type="text" name="CMOTSIN"
                                           value="${sessionScope.cabecera.TMOTSIN}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin025" c="CMOTSIN" a="modificable=false"/>/> 
                                </td>
                            </tr>
                            </table>
                             <div class="separador">&nbsp;</div>
                            <table class="seccion" >
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Producte -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100829"/></b>
                                </td>
                                <!-- Activitat -->
                                <td class="titulocaja">
                                    <b><fmt:message key="103481"/></b>
                                </td>
                                <!-- Garantia -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100561"/></b>
                                </td>
                                <!-- Tramitació -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9000908"/></b>
                                </td>                                
                            </tr>
                            <tr>
                                <!-- Producte -->
                                <td class="campocaja">
                                    <select name="SPRODUC" id="SPRODUC" size="1" onchange="f_actualizar(this)"
                                    <axis:atr f="axissin025" c="SPRODUC" a="obligatorio=true&modificable=true"/>
                                    class="campowidthselect campo campotexto"
                                    <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="prod"
                                                   items="${__formdata.listValores.lstproductos}">
                                            <option value="${prod.SPRODUC}"
                                                    <c:if test="${__formdata['SPRODUC'] == prod.SPRODUC}">selected</c:if>>
                                                ${prod.TTITULO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Activitat -->
                                <td class="campocaja">
                                    <select name="CACTIVI" id="CACTIVI" size="1"  <axis:atr f="axissin025" c="CMOTSIN" a="obligatorio=true&modificable=true"/>
                                     onchange="f_actualizar(this)"       class="campowidthselect campo campotexto"
                                     <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="act"
                                                   items="${__formdata.listValores.lstactividades}">
                                            <option value="${act.CACTIVI}"
                                                    <c:if test="${__formdata['CACTIVI'] == act.CACTIVI}">selected</c:if>>
                                                ${act.TTITULO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Garantia -->
                                <td class="campocaja">
                                    <select name="CGARANT" id="CGARANT" size="1" <axis:atr f="axissin025" c="CTIPDES" a="obligatorio=true&modificable=true"/>
                                    onchange="f_actualizar(this)"        class="campowidthselect campo campotexto"
                                    <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="gar"
                                                   items="${__formdata.listValores.lstgaranties}">
                                            <option value="${gar.CGARANT}"
                                                    <c:if test="${__formdata['CGARANT'] == gar.CGARANT}">selected</c:if>>
                                                ${gar.TGARANT}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Tramitació -->
                                <td class="campocaja">
                                    <select name="CTRAMIT" id="CTRAMIT" size="1" <axis:atr f="axissin025" c="CTIPDES" a="modificable=true&obligatorio=true"/>
                                         class="campowidthselect campo campotexto"
                                         <c:if test="${isNew eq 'No'}"> disabled</c:if> >
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="tram"
                                                   items="${__formdata.listValores.lsttramitacions}">
                                            <option value="${tram.CTRAMIT}"
                                                    <c:if test="${__formdata['CTRAMIT'] == tram.CTRAMIT}">selected</c:if>>
                                                ${tram.TTRAMIT}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>                                
                            </tr>       
                            
                        </table>
                    </td>
                </tr>
              </table>
            
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,<axis:visible c="BT_GUARDAR" f="axissin025"><c:if test="${isNew eq 'Si'}">,aceptar</c:if></axis:visible></c:param>
            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>
</html>

