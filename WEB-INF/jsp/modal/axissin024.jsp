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
          parent.f_aceptar_axissin024();
         }
    }
    function f_but_aceptar(){
        if (objValidador.validaEntrada()) 
            objUtiles.ejecutarFormulario("modal_axissin024.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
    }

    function f_but_cancelar(){
        parent.f_cerrar_modal('axissin024');
    }
   function f_actualizar(thiss){
       if (objUtiles.utilEquals(thiss.id,"SPRODUC")){
        document.miForm.SPRODUC.value = thiss.value;
        document.miForm.CACTIVI.value = null;
        document.miForm.CGARANT.value = null;
        document.miForm.CTRAMIT.value = null;
           }else   if (objUtiles.utilEquals(thiss.id,"CACTIVI")){
                    document.miForm.CACTIVI.value = thiss.value;
                    document.miForm.CGARANT.value = null;
                    document.miForm.CTRAMIT.value = null;
               }else   if (objUtiles.utilEquals(thiss.id,"CGARANT")){
                        document.miForm.CGARANT.value = thiss.value;
                        document.miForm.CTRAMIT.value = null;
                   }else   if (objUtiles.utilEquals(thiss.id,"CTRAMIT")){
                            document.miForm.CTRAMIT.value = thiss.value;
                       }
   
     objUtiles.ejecutarFormulario("modal_axissin024.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
   }    
        
     function f_but_formula() {
         objUtiles.ejecutarFormulario("modal_axissin024.do", "formula", document.miForm, "_self", objJsMessages.jslit_cargando);
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
                    <fmt:message key="9001720"/>
                </c:param>
                <c:param name="producto">
                    <fmt:message key="9001720"/>
                </c:param>
                <c:param name="form">axissin024</c:param>
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
                                <axis:visible f="axissin024" c="SCAUMOT" >
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
                                <!-- T. Destinatari -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001213"/></b>
                                </td>                                
                            </tr>
                            <tr>
                                <!-- SCAUMOT -->
                                <axis:visible f="axissin024" c="SCAUMOT" >
                                <td class="campocaja">
                                     <input type="text" name="SCAUMOT"
                                           value="${sessionScope.cabecera.SCAUMOT}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin024" c="SCAUMOT" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <!-- Causa -->
                                <td class="campocaja">
                                  <input type="text" name="CCAUSIN"
                                           value="${sessionScope.cabecera.TCAUSIN}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin024" c="CCAUSIN" a="modificable=false"/>/> 
                                </td>
                                <!-- Motiu -->
                                <td class="campocaja">
                                   <input type="text" name="CMOTSIN"
                                           value="${sessionScope.cabecera.TMOTSIN}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin024" c="CMOTSIN" a="modificable=false"/>/> 
                                </td>
                               <!-- T. Destinatari -->
                                <td class="campocaja">
                                
                                <select name="CTIPDES" id="CTIPDES" size="1"
                                    <axis:atr f="axissin024" c="CTIPDES" a="isInputText=false&modificable=false"/>
                                    class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="ele"
                                                   items="${__formdata.listValores.lsttipdest}">
                                            <option value="${ele.CATRIBU}"
                                                    <c:if test="${sessionScope.cabecera.CTIPDES == ele.CATRIBU}">selected</c:if>>
                                                ${ele.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
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
                                <!-- Elemento -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001680"/></b>
                                </td>
                                <!-- Formula -->
                                <td class="titulocaja">
                                    <b><fmt:message key="108347"/></b>
                                </td>
                                                              
                            </tr>
                            <tr>
                                <!-- Elemento -->
                                <td class="campocaja">
                                    <select name="CCAMPO" id="CCAMPO" size="1" <c:if test="${isNew eq 'No'}"> disabled</c:if>
                                    <axis:atr f="axissin024" c="CCAMPO" a="obligatorio=true&modificable=true"/>
                                    class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="ele"
                                                   items="${__formdata.listValores.lstelementos}">
                                            <option value="${ele.CCAMPO}"
                                                    <c:if test="${__formdata['CCAMPO'] == ele.CCAMPO}">selected</c:if>>
                                                ${ele.TCAMPO}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Formula -->
                                <td class="campocaja" colspan="2">
                                    <select name="CCLAVE" id="CCLAVE" size="1"  <axis:atr f="axissin024" c="CCLAVE" a="obligatorio=false&modificable=true"/>
                                    <c:if test="${isNew eq 'No'}"> disabled</c:if> class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="for"
                                                   items="${__formdata.listValores.lstformulas}">
                                            <option value="${for.CLAVE}"
                                                    <c:if test="${__formdata['CCLAVE'] == for.CLAVE}">selected</c:if>>
                                                ${for.DESCRIPCION}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                               
                                 
                               
                                <%-- <img border="0" alt="<fmt:message key="151477"/>" title="<fmt:message key="151477"/>" src="images/find.gif"/>--%>
                                <td class="titulocaja">
                                            <input type="button" class="boton" id="but_formula" name="but_formula"  value="<fmt:message key="108347" />" 
                                            onclick="f_but_formula()" <c:if test="${isNew eq 'No'}"> disabled</c:if> />
                                </td>
                               
                                
                            </tr>       
                            
                        </table>
                    </td>
                </tr>
              </table>
            
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,<axis:visible c="BT_GUARDAR" f="axissin024"><c:if test="${isNew eq 'Si'}">,aceptar</c:if></axis:visible></c:param>
            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>
</html>

