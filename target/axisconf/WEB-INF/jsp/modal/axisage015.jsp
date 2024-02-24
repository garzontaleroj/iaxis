<%--
      NOMBRE:    axisage015.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 24/10/2011
      PROPÓSITO (descripción pantalla):  Mantenimiento valor del soporte por ARP
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        24/10/2011   JTS(iniciales)     1. 19169: LCOL_C001 - Campos nuevos a añadir para Agentes.

--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
           function f_onload(){
               f_cargar_propiedades_pantalla();
               <c:if test="${resultadoOK=='OK'}" >
                    //alert("<axis:alt f='axisage015' c='ALERT' lit='1000405' />");
                    parent.f_cerrar_modal('axisage015');
               </c:if>
           }
            
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("modal_axisage015.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
           }  
           
           function f_but_cancelar(){
               parent.f_cerrar_modal('axisage015');
           }
           
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="EDICION" name="EDICION" value="${__formdata.EDICION}"/>
            
            <c:set var="modoEdit" value="${__formdata.EDICION}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisage015" lit="9902556"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisage015" lit="9902556"/></c:param>
                <c:param name="form">axisage015</c:param>
            </c:import>
            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt c="DSP_TITULO" f="axisage015" lit="9902556"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <%-- Tipo agente --%>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage015" c="CTIPAGE" lit="100584"/></b>
                                </td>
                            </tr>
                            <tr>
                                <%-- Código agente --%>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" <axis:atr f="axisage015" c="CAGENTE"/>
                                    style="width:8%;" title="<axis:alt f="axisage015" c="CAGENTE" lit="9000531"/>" readonly="readonly" >                             

                                <%-- Código agente --%>
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" 
                                    style="width:50%;" title="<axis:alt f="axisage015" c="TAGENTE" lit="100584"/>" readonly="readonly"/>
                                </td> 
                            </tr>
                            
                            <tr>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage015" c="FINIVIG" lit="104095" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisage015" c="FFINVIG" lit="103051" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisage015" c="IIMPORTE" lit="100563"/>
                                </td>
                            </tr> 
                            <tr>
                                <td class="campocaja" > 
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                                
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" 
                                    name="FINIVIG" id="FINIVIG"
                                    title="<axis:alt f='axisage003' c='FINIVIG' lit='104095'/>"
                                    <c:if test="${!modoEdit}">obligatorio="true"</c:if>
                                    <c:if test="${modoEdit}">readonly="true" disabled="true" obligatorio="false"</c:if> />
                                    <c:if test="${!modoEdit}">
                                        <a style="vertical-align:middle;">
                                        <img id="icon_FINIVIG" alt="<axis:alt f="axisage003" c="FINIVIG" lit="104095"/>" title="<axis:alt f="axisage003" c="FINIVIG" lit="104095" />" src="images/calendar.gif"/></a>
                                    </c:if>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                                
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" 
                                    name="FFINVIG" id="FFINVIG"
                                    title="<axis:alt f='axisage003' c='FFINVIG' lit='103051'/>"
                                    <c:if test="${!modoEdit}">obligatorio="true"</c:if>
                                    <c:if test="${modoEdit}">readonly="true" disabled="true" obligatorio="false"</c:if>/>
                                    <c:if test="${!modoEdit}">
                                        <a style="vertical-align:middle;">
                                            <img id="icon_FFINVIG" alt="<axis:alt f="axisage003" c="FFINVIG" lit="103051"/>" title="<axis:alt f="axisage003" c="FFINVIG" lit="103051" />" src="images/calendar.gif"/>
                                        </a>
                                    </c:if>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="IIMPORTE" name="IIMPORTE" 
                                    title="<axis:alt c='IIMPORTE' f='axisage015' lit='100563'/>"
                                    <axis:atr f="axisage015" c="IIMPORTE" a="obligatorio=true&modificable=true&formato=decimal"/>
//                                    value="<fmt:formatNumber value="${__formdata.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>" />
                                    value="<fmt:formatNumber value="${__formdata.IIMPORTE}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
     </form>
<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisage015</c:param>
            <c:param name="__botones">
                cancelar,aceptar
            </c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
   <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FINIVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIG", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINVIG",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIG", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>
</body>
</html>