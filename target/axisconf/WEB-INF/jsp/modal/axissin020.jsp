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
    }
    

    function f_but_cancelar(){
        parent.f_cerrar_modal('axissin020');
    }
    
    function f_but_buscar(){

        CEMPRES = objDom.getValorPorId("CEMPRES");
        CRAMO = objDom.getValorPorId("CRAMO");
        SPRODUC = objDom.getValorPorId("SPRODUC");
        CCAUSIN = objDom.getValorPorId("CCAUSIN");
        CMOTSIN = objDom.getValorPorId("CMOTSIN");
        CTIPDES = objDom.getValorPorId("CTIPDES");

        parent.f_buscar(CEMPRES,CRAMO,SPRODUC,CCAUSIN,CMOTSIN,CTIPDES);
    }  

    function f_actualitzar(){
             objUtiles.ejecutarFormulario("modal_axissin020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }    
    
// Fin código javascript
</script>

<body onload="f_onload()">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
            
<form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
        <c:if test="${fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1  && !empty __formdata.LSTVALORES.LSTEMPRESAS}">
        <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.LSTVALORES.LSTEMPRESAS[0].CEMPRES}" />
        </c:if>            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <fmt:message key="9001681"/>
                </c:param>
                <c:param name="producto">
                    <fmt:message key="9001681"/>
                </c:param>
                <c:param name="form">axissin020</c:param>
            </c:import>
            
            
    <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center" 
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                                
                            </tr>
                            <tr>
                                <!-- Empresa -->
                                <axis:visible f="axissin020" c="CEMPRES" >
                                <c:if test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) > 1}">
                                <td class="titulocaja">
                                    <b><fmt:message key="101619" /></b>
                                </td>
                                </c:if>
                                </axis:visible>
                                <!-- Ramo -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100784"/></b>
                                </td>
                                <!-- Producte -->
                                <td class="titulocaja">
                                    <b><fmt:message key="100829"/></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Empresa -->
                                <axis:visible f="axissin020" c="CEMPRES" >
                                <c:if test="${!empty __formdata.listValores.lstempresas && fn:length(__formdata.listValores.lstempresas) > 1}">
                                <td class="campocaja">
                                     <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_actualitzar();" 
                                        title="<fmt:message key="101619" />"
                                        class="campowidthselect campo campotexto" <axis:atr f="axissin020" c="CEMPRES" a="modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option> 
                                        <c:forEach items="${__formdata.listValores.lstempresas}" var="emp">
                                            <option value = "${emp.CEMPRES}" <c:if test="${emp.CEMPRES  == __formdata.CEMPRES}">selected</c:if>>${emp.TEMPRES}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </c:if>
                                </axis:visible>
                                <!-- RAMO -->
                                <td class="campocaja">
                                    <select name = "CRAMO" id ="CRAMO" onchange="f_actualitzar();"
                                    title="<fmt:message key="100784" />" <axis:atr f="axissin020" c="CRAMO" a="modificable=true"/>
                                    class="campowidthselect campo campotexto"
                                    <c:if test="${__formdata.RADIO == 2}">
                                        obligatorio="true"
                                    </c:if>
                                    >&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option> 
                                  <%--  <c:if test="${!empty __formdata.CEMPRES || fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1}">--%>
                                    <c:forEach items="${__formdata.listValores.lstramos}" var="ram">
                                        <option value = "${ram.CRAMO}" <c:if test="${ram.CRAMO  == __formdata.CRAMO}">selected</c:if>>${ram.TRAMO}</option>
                                    </c:forEach>
                                  <%--  </c:if>--%>
                                </select>    
                                </td>
                                <!-- Producte -->
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC"
                                        title="<fmt:message key="100829" />" <axis:atr f="axissin020" c="SPRODUC" a="modificable=true"/>
                                        class="campowidthselect campo campotexto">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option> 
                                        <c:forEach items="${__formdata.listValores.lstproductos}" var="prod">
                                            <option value = "${prod.SPRODUC}" <c:if test="${prod.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>${prod.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <!-- Causa -->
                                <td class="titulocaja">
                                    <b><fmt:message key="101040"/></b>
                                </td>
                                <!-- Motiu -->
                                <td class="titulocaja">
                                    <b><fmt:message key="102577"/></b>
                                </td>
                                <!-- T.Destinatari -->
                                <td class="titulocaja">
                                    <b><fmt:message key="9001213"/></b>
                                </td>
                            </tr>
                            <tr>
                                <!-- Causa -->
                                <td class="campocaja">
                                    <select name="CCAUSIN" id="CCAUSIN" size="1" onchange="f_actualitzar();" <axis:atr f="axissin020" c="CCAUSIN" a="modificable=true"/>
                                            class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="cau"
                                                   items="${__formdata.listValores.lstcausas}">
                                            <option value="${cau.CCAUSIN}"
                                                    <c:if test="${__formdata['CCAUSIN'] == cau.CCAUSIN}">selected</c:if>>
                                                ${cau.TCAUSIN}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- Motiu -->
                                <td class="campocaja">
                                    <select name="CMOTSIN" id="CMOTSIN" size="1"  <axis:atr f="axissin020" c="CMOTSIN" a="modificable=true"/>
                                            class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="mot"
                                                   items="${__formdata.listValores.lstmotivos}">
                                            <option value="${mot.CMOTSIN}"
                                                    <c:if test="${__formdata['CMOTSIN'] == mot.CMOTSIN}">selected</c:if>>
                                                ${mot.TMOTSIN}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <!-- T. Destinatari -->
                                <td class="campocaja" >
                                    <select name="CTIPDES" id="CTIPDES" size="1" <axis:atr f="axissin020" c="CTIPDES" a="modificable=true"/>
                                            class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">
                                            -
                                            <fmt:message key="108341"/>
                                            -
                                        </option>
                                        <c:forEach var="estado"
                                                   items="${__formdata.listValores.lstdestinataris}">
                                            <option value="${estado.CATRIBU}"
                                                    <c:if test="${__formdata['CESTSIN'] == estado.CATRIBU}">selected</c:if>>
                                                ${estado.TATRIBU}
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
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>
</html>

