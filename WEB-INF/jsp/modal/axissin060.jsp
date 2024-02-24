<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
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
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {            
            f_cargar_propiedades_pantalla();
            var aceptar = "${__formdata.aceptar}";
            var COFICI_OUT = "${__formdata.COFICI_OUT}";
            var MODO = "${__formdata.MODO}";
            if ((!objUtiles.estaVacio(aceptar))&&(aceptar=="0")){
               parent.f_aceptar_modal("axissin060");
            }
            if (!objUtiles.estaVacio(COFICI_OUT)) {
                parent.f_aceptar_modal("axissin060", "COFICI_OUT="+COFICI_OUT);
            }
        }
                
        function f_but_cancelar() {
            parent.f_cerrar_modal("axissin060"); 
        }        
        
        function f_but_aceptar() {
        
            var CDP = objUtiles.utilSplit($("#CONTRATO").val(), "|")[0]; // CDP
            var POSPRES = objUtiles.utilSplit($("#CONTRATO").val(), "|")[1]; // POSPRES
            var CRP = objUtiles.utilSplit($("#CONTRATO").val(), "|")[2]; // CRP
            var POSCRP = objUtiles.utilSplit($("#CONTRATO").val(), "|")[3]; // POSCRP
            var PCONTRATO = objUtiles.utilSplit($("#CONTRATO").val(), "|")[4]; // CONTRATO
            var CGESTOR = objUtiles.utilSplit($("#CONTRATO").val(), "|")[5]; // CGESTOR
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin060.do?CDP="+CDP+
                                                                "&POSPRES="+POSPRES+
                                                                "&CRP="+CRP+
                                                                "&POSCRP="+POSCRP+
                                                                "&PCONTRATO="+PCONTRATO+
                                                                "&CGESTOR="+CGESTOR+
                                                                "&SIDEPAG="+$("#SIDEPAG").val(),
                                            "aceptar",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
    </script>
  </head>
    <body onload="f_onload()">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="SIDEPAG" name="SIDEPAG" value="${__formdata.SIDEPAG}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin060" c="FORM" lit="109452" /></c:param>
                <c:param name="producto"><axis:alt f="axissin060" c="FORM" lit="109452" /></c:param>
                <c:param name="form">axissin060</c:param>
            </c:import>
                    
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:34%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin060" c="CONTRATO" dejarHueco="false"> 
                                                  <td class="titulocaja" >
                                                      <b><axis:alt f="axissin060" c="CONTRATO" lit="109452"/></b>
                                                  </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axissin060" c="CONTRATO" >
                                              <td class="campocaja">
                                                  <select name="CONTRATO" id="CONTRATO" size="1" class="campowidthselect campo campotexto_ob" 
                                                    <axis:atr f="axissin013" c="CONTRATO" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                    style="width:90%;">
                                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin013" c="SNV_COMBO" lit="1000348"/> - </option>
                                                        <c:forEach var="c" items="${__formdata.CONTRATOS}">
                                                            <option value = "${c.OB_IAX_SIN_TRAMI_PAGO_CTR.CDP}|${c.OB_IAX_SIN_TRAMI_PAGO_CTR.POSRES}|${c.OB_IAX_SIN_TRAMI_PAGO_CTR.CRP}|${c.OB_IAX_SIN_TRAMI_PAGO_CTR.POSCRP}|${c.OB_IAX_SIN_TRAMI_PAGO_CTR.CONTRATO}|${c.OB_IAX_SIN_TRAMI_PAGO_CTR.CGESTOR}">
                                                                ${c.OB_IAX_SIN_TRAMI_PAGO_CTR.DESC_CONTRATO} + ${c.OB_IAX_SIN_TRAMI_PAGO_CTR.IMP_MONEDA_LOCAL}
                                                            </option>
                                                        </c:forEach>
                                                  </select>
                                              </td>
                                            </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>						
                    </td>
                </tr>
            </table>
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin060</c:param>
                <c:param name="__botones">
                    <axis:visible f="axissin060" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axissin060" c="BT_ACEPTAR">,aceptar</axis:visible>
                </c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin060');
      </script >                   
    </c:if>
</html>


