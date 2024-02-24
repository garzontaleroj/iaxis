<%/*
*  Fichero: axisadm013.jsp
*  @author <a href = "mailto:Joan Colldeforns@csi-ti.com">JCA</a> 
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 02/09/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="9000494"/></title> <%-- EDICIÓN DATOS DE CIERRES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->  
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            revisarEstilos();
            var guardarOK = ${requestScope.guardarOK == '0'};
            if (guardarOK) {
                parent.f_aceptar_modal("axisadm013");
            } else {
                var FPERINI = "${requestScope.FPERINI}";
                if (!objUtiles.estaVacio(FPERINI))
                    objDom.setValorPorId("FPERINI", FPERINI);
                var FPERFIN = "${requestScope.FPERFIN}";
                if (!objUtiles.estaVacio(FPERFIN))
                    objDom.setValorPorId("FPERFIN", FPERFIN);
                var FCIERRE = "${requestScope.FCIERRE}";
                if (!objUtiles.estaVacio(FCIERRE))
                    objDom.setValorPorId("FCIERRE", FCIERRE);                    
            }
        }
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisadm013');                      
        }
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisadm013.do", "guardar", document.miForm, "_self");                
            }
        }

        function f_but_9000479() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisadm013.do", "validar", document.miForm, "_self");                
            }
        }

    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9000494"/></c:param>     <%-- EDICION DE CIERRES --%>
                <c:param name="formulario"><fmt:message key="9000494"/></c:param> <%-- EDICION DE CIERRES --%>
                <c:param name="form">axisadm013</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="status" value="${__formdata.status}"/>

        <input type="hidden" name="FECMODIF" value="${__formdata.FECMODIF}"/>
            
        <c:if test="${__formdata.status != 'new'}">
            <input type="hidden" name="CTIPO" value="${__formdata.CTIPO}"/>            
        </c:if>        
        
        <c:if test="${__formdata.status == 'new'}">
            <input type="hidden" name="CESTADO" value="${__formdata.CESTADO}"/>
            <input type="hidden" name="FCIERRE" value="<fmt:formatDate value='${__formdata.FCIERRE}' pattern='dd/MM/yyyy'/>"/>
        </c:if>

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                    </div>

                    <table class="seccion" align="center">
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
                                        <%-- Empresa --%>
                                        <td class="titulocaja">
                                            <b><fmt:message key="101619"/></b> <%-- Empresa --%>
                                        </td>
                                         <%-- Tipo Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000488"/> </b> <%-- Tipo Cierre --%>
                                        </td>                 
                                         <%-- Estado Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000489"/> </b> <%-- Estado Cierre --%>
                                        </td>           
                                    </tr>
                                    <tr>
                                        <%-- Empresa --%>
                                        <td class="campocaja">                                            
                                            <input type="text" name = "TEMPRES" id ="TEMPRES" readonly="readonly"
                                                class="campowidthinput campo campotexto" style="width:85%" value="${__formdata.TEMPRES}"/>
                                            <input type="hidden" name = "CEMPRES" id ="CEMPRES" value="${sessionScope.__usuario.cempres}"/>
                                        </td>
                                        <%-- Tipo Cierre --%>
                                        <td class="campocaja">
                                            <select name = "CTIPO" id ="CTIPO" size="1" onchange="" class="campo campotexto" style="width:90%" obligatorio="true"
                                            title="<fmt:message key='9000488'/>"
                                            <c:if test="${__formdata.status != 'new'}"> disabled="disabled" </c:if>>>
                                                <option value="null"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstValores.lstTipoCierres}" var="item">
                                                    <option value = "${item.CTIPO}" 
                                                    <c:if test="${__formdata.CTIPO == item.CTIPO}"> selected </c:if>>${item.TCTIPO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         <%-- Estado Cierre --%>
                                        <td class="campocaja">
                                            <select name = "CESTADO" id ="CESTADO" size="1" onchange="" class="campo campotexto" style="width:90%"
                                            <c:if test="${__formdata.status == 'new'}"> disabled="disabled" </c:if>>
                                                <option value="<%=Integer.MIN_VALUE%>"> - <fmt:message key="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstValores.lstEstadoCierres}" var="item">
                                                    <option value = "${item.CATRIBU}" 
                                                    <c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>      
                                    </tr>
                                    <tr>
                                         <%-- Fecha Desde --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="104095"/></b>  <%-- Fecha Desde --%>
                                        </td>                                                  
                                         <%-- Fecha Hasta --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="103051"/></b>  <%-- Fecha Hasta --%>
                                        </td>                                                  
                                         <%-- Fecha Cierre --%>
                                         <td class="titulocaja">
                                            <b><fmt:message key="9000490"/></b>  <%-- Fecha Cierre --%>
                                        </td>                                                  
                                    </tr>
                                    <tr>
                                        <%-- Fecha Desde --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            <c:if test="${empty __formdata.FECMODIF || __formdata.FECMODIF != '1'}"> readonly="readonly" </c:if>
                                            value="<fmt:formatDate value='${__formdata.FPERINI}' pattern='dd/MM/yyyy'/>"
                                            name="FPERINI" id="FPERINI"
                                            style="width:25%;" <axis:atr f="axisadm013" c="FPERINI" a="formato=fecha"/>
                                            title="<fmt:message key="104095"/>"/><a id="icon_FPERINI" style="vertical-align:middle;"><c:if test="${__formdata.FECMODIF == '1'}"><img 
                                            alt="<fmt:message key="108341"/>" title="<fmt:message key="104095" />" src="images/calendar.gif"/></a></c:if>
                                        </td>
                                        <%-- Fecha Hasta --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            <c:if test="${empty __formdata.FECMODIF || __formdata.FECMODIF != '1'}"> readonly="readonly" </c:if>
                                            name="FPERFIN" id="FPERFIN"
                                            value="<fmt:formatDate value='${__formdata.FPERFIN}' pattern='dd/MM/yyyy'/>" 
                                            style="width:25%;" <axis:atr f="axisadm013" c="FPERFIN" a="formato=fecha"/>
                                            title="<fmt:message key="103051"/>"/><a id="icon_FPERFIN" style="vertical-align:middle;"><c:if test="${__formdata.FECMODIF == '1'}"><img 
                                            alt="<fmt:message key="108341"/>" title="<fmt:message key="103051" />" src="images/calendar.gif"/></a></c:if>
                                        </td>
                                        <%-- Fecha Cierre --%>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            <c:if test="${__formdata.status == 'new'}"> readonly="readonly" </c:if>
                                            value="<fmt:formatDate value='${__formdata.FCIERRE}' pattern='dd/MM/yyyy'/>" name="FCIERRE" id="FCIERRE"
                                            style="width:25%;" <axis:atr f="axisadm013" c="FCIERRE" a="formato=fecha"/>
                                            title="<fmt:message key="9000490"/>"/><a id="icon_FCIERRE" style="vertical-align:middle;"><c:if test="${__formdata.status != 'new'}"><img 
                                            alt="<fmt:message key="108341"/>" title="<fmt:message key="9000490" />" src="images/calendar.gif"/></a></c:if>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                    <div class="separador">&nbsp;</div>
                    <div class="separador">&nbsp;</div>
        
                    <c:import url="../include/botonera_nt.jsp">
                          <c:param name="__botones">cancelar<c:if test="${__formdata.status == 'new'}">,9000479</c:if><c:if test="${__formdata.status != 'new'}">,aceptar</c:if></c:param> 
                    </c:import>
        
                </td>
            </tr>        
        </table>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <c:if test="${__formdata.FECMODIF == '1'}">
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FPERINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FPERINI", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FPERFIN",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FPERFIN", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
    </c:if>
    <c:if test="${__formdata.status != 'new'}">
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     </c:if>

</body>
</html>