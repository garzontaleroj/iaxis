<%--/**
*  Fichero: axispro012.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  T?tulo: Modal Introducción/Modificación Duraciónes permitidas
*
*  Fecha: 25/04/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="1000182"/></title>
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
        function f_onload(){
        }
        
        function f_but_aceptar(){
            if(objValidador.validaEntrada()){
                var SPRODUC = ((document.getElementById("SPRODUC"))? objDom.getValorPorId("SPRODUC") : null);
                var FINICIO = ((document.getElementById("FINICIO"))? objDom.getValorPorId("FINICIO") : null);
                var NDURPER = ((document.getElementById("NDURPER"))? objDom.getValorPorId("NDURPER") : null);
                var NDURPEROLD = ((document.getElementById("NDURPEROLD"))? objDom.getValorPorId("NDURPEROLD") : null);
                objAjax.invokeAsyncCGI("modal_axispro012.do", callbackAjaxSetDurPeriod, "operation=ajax_set_dur_period&SPRODUC="+SPRODUC+"&FINICIO="+FINICIO+
                                            "&NDURPER="+NDURPER+"&NDURPEROLD="+NDURPEROLD, this, objJsMessages.jslit_cargando);
            }
        }
        
        function callbackAjaxSetDurPeriod (ajaxResponseText){
            try{
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_OK")[0])){
                        if(parent.document.miForm.hay_cambios_en_duraciones) 
                            parent.document.miForm.hay_cambios_en_duraciones.value = "true";
                        
                        if(parent.parent.document.getElementById("but_cerrar_modal_axispro011"))
                            parent.parent.document.getElementById("but_cerrar_modal_axispro011").style.visibility="hidden";
                        
                        if(parent.parent.parent.document.getElementById("but_cerrar_modal_axispro005"))
                            parent.parent.parent.document.getElementById("but_cerrar_modal_axispro005").style.visibility="hidden";
                        
                        parent.f_aceptar_axispro012();
                    }
                }
            }catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal_axispro012();
        }
                
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
    <input type="hidden" name="operation" value="" />
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${param.SPRODUC}" />
    <input type="hidden" id="FINICIOOLD" name="FINICIOOLD" value="${param.FINICIO}" />
    <input type="hidden" id="NDURPEROLD" name="NDURPEROLD" value="${param.NDURPER}" />
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="1000228"/></c:param>
        <c:param name="formulario"><fmt:message key="1000228"/></c:param>
        <c:param name="form">axispro012</c:param>
    </c:import>

    <div class="separador">&nbsp;</div>
    <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="seccion" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td align="left">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja" align="left">
                                    <b><fmt:message key="101742"/></b>
                                </td>
                                <td class="titulocaja" align="left">
                                    <b><fmt:message key="111274"/></b>
                                </td>
                                <td></td>
                                <td></td>
                            <tr>
                            </tr>
                                <td align="left">
                                    <input type="text" id="FINICIO" name="FINICIO" value="${param.FINICIO}" class="campowidthinput campo campotexto"
                                        size="15" formato="fecha" title="<fmt:message key="101742"/>" style="width:35%"
                                        <c:if test="${!empty param.FINICIO}">disabled</c:if> <axis:atr f="axispro012" c="FINICIO" a="modificable=true&obligatorio=true"/>/>
                                        <c:if test="${empty param.FINICIO}">
                                            <a style="vertical-align:middle;"><img 
                                                id="popup_calendario_finicio" alt="<fmt:message key="101742"/>" title="<fmt:message key="101742" />" src="images/calendar.gif"/></a>
                                        </c:if>
                                </td> 
                                <td align="left">
                                    <input type="text" id="NDURPER" name="NDURPER" value="${param.NDURPER}" class="campowidthinput campo campotexto"
                                        style="width:25%;" formato="entero" title="<fmt:message key="111274"/>" <axis:atr f="axispro012" c="NDURPER" a="modificable=true&obligatorio=true"/>/>
                                </td> 
                                <td></td>
                                <td></td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
    <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FINICIO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_finicio", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
</body>
</html>