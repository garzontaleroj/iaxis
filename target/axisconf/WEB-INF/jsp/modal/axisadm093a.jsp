<!--**********************************************AXISADM093 JSP ******************************** -->
<!--*********************************** Payment and Breakdown without selecting invoice ******************************** -->
<!--*********************************** JOHN BENITEZ  - ABRIL 2015 - BUG 33886/199826 ******************************** -->
<!-- INCLUDING LIBRARIES AND SETTING LOCAL VARIABLES -->
<%@ page contentType="text/html;charset=windows-1252"
errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<!-- HTML START -->
<html>
<!-- HEAD START -->
<head>
<!-- TITTLE START -->
<title>
            <axis:alt f="axisadm090" c="LIT_TITULO" lit="1000231"/>
</title>
<!-- TITTLE FINISH -->
       <!-- HEAD IMPORTS -->
        <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
        <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial para controlar los scroll con iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css">
            </style>
        <c:import url="../include/carga_framework_js.jsp"/>
<!--************************ JAVASCRIPTS FUNCTIONS ************************* -->
<!-- JAVASCRIPTS FUNCTIONS START -->
<script  language="Javascript" type="text/javascript">
  /****************************************************************************************/
  /************************************** LOAD PAGE***********************************/

  /****************************************************************************************/
  function f_onload() {
      f_cargar_propiedades_pantalla();
  }
  /****************************************************************************************/
  /************************************** BUTTON´S ACTIONS**********************************/

  /****************************************************************************************/
  function f_but_cancelar() {
      parent.f_cerrar_axisadm093a();
  }

  function solocero() {

      var poliza = document.getElementById("POLICY").value;

      
      if (poliza != 0) {
          objAjax.invokeAsyncCGI("modal_axisadm093a.do", CallbackValidaPoliza, "operation=ajax_search_amount" + "&POLICY=" + poliza, this, objJsMessages.jslit_cargando);

      }
      return true
  }

  function CallbackValidaPoliza(ajaxResponseText) {

      var doc = objAjax.domParse(ajaxResponseText);
      if (objAppMensajes.existenErroresEnAplicacion(doc)) {
          document.miForm.POLICY.value = '';
      }
  }

  
  
  function f_but_aceptar() {
  
 

      if (!objUtiles.estaVacio(objDom.getValorPorId("POLICY"))) {

         
          if (objValidador.validaEntrada()) {
              POLIZA = document.miForm.POLICY.value;
              MONTO = document.miForm.AMOUNT.value;
              parent.f_aceptar_axisadm093a(POLIZA, MONTO);
          }
          
      }
      else {
          objAlert.formateaMensaje("- " + objJsMessages.jslit_campo_validador + " '" + $('#POLICY').attr('name') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
          objAlert.muestraAlert();
          objAlert.vaciaAlert();
      }
  }

  /****************************************************************************************/
  /************************************** AXISCTR019****************************************/

  /****************************************************************************************/
  function f_aceptar_axisctr019(SSEGURO, NPOLIZA, NCERTIF) {
      objUtiles.cerrarModal("axisctr019");
      document.miForm.POLICY.value = NPOLIZA;
      document.miForm.SSEGURO.value = SSEGURO;
  }

  function f_abrir_axisctr019() {
      objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
  }

  function f_cerrar_axisctr019() {
      objUtiles.cerrarModal("axisctr019");
  }
  /****************************************************************************************/
  /************************************** OTHERS - UTILITIES*********************************/

  /****************************************************************************************/
  function f_cerrar_modal(cual) {
      objUtiles.cerrarModal(cual);
  }

  function val_number(valor) {
    try {    
        if(!objUtiles.estaVacio(valor)){
            if(objNumero.validarNegativos(valor)){
                entrada = objNumero.formateaNumero(valor, true);  
                entrada = objNumero.quitarSeparadorMiles(entrada);
                document.miForm.AMOUNT.value = objNumero.formateaNumeroMoneda(valor);
            }
            else {
            alert(objJsMessages.jslit_valor_numerico);
            document.miForm.AMOUNT.value = '';
            document.miForm.AMOUNT.focus();
            }
        }
    }
    catch (e) {
    alert(e.name + " " + e.message);
    }
    }
</script>
<!-- JAVASCRIPTS FUNCTIONS FINISH -->
</head>
<!-- HEAD FINISH -->
<!-- BODY START -->
<body onload="f_onload()">
<!-- FORM START -->
<form name="miForm" action="" method="POST">
<!-- HIDDENS INPUTS -->
<input type="hidden" id="operation" name="operation" value=""/>
<input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
<input type="hidden" id="TID" name="TID" value="${__formdata.TID}"/>
<input type="hidden" id="AMOPAY" name="AMOPAY" value="${__formdata.AMOPAY}"/>

<!-- MODAL IMPORTS -->
<c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>
<c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm093a" c="TITULO" lit="9907770"/></c:param>     
            <c:param name="formulario"><axis:alt f="axisadm093a" c="TITULO" lit="9907770"/></c:param>
            <c:param name="form">axisadm093a</c:param>
</c:import>
<c:import url="../include/modal_estandar.jsp">
       <c:param name="titulo"><axis:alt f="axisadm093a" c="TITULO" lit="9907777" /></c:param>
       <c:param name="nid" value="axisctr019" />
</c:import>

    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
        <tr>
        <td>
            <div class="separador">&nbsp;</div>
            <div class="titulo">
                <img src="images/flecha.gif"/>
                <b><axis:alt f="axisadm093a" c="SEARCH_POLICY" lit="9907771"/></b>
            </div>
        </td>
        </tr>
        
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>                                
            <th style="width:25%;height:0px"></th>
        </tr> 
        
        <tr>
            <axis:ocultar f="axisadm093a" c="POLICY" dejarHueco="false"> 
                <td class="titulocaja" colspan = "2" >
                    <b><axis:alt f="axisadm093a" c="POLICY" lit="9907772"/></b>
                </td>                                            
            </axis:ocultar>
        </tr>
                        
        <tr>
            <axis:visible f="axisadm093a" c="POLICY">
                <td class="campocaja">
                    <input type="text"  onchange="solocero()"  class="campo campotexto" value="${__formdata.POLICY}" name="POLICY" id="POLICY" size="10"
                    <axis:atr f="axisadm093a" c="POLICY" a="obligatorio=true"/> />
                    <axis:visible f="axisadm093a" c="BT_BUSCAR_LT"> 
                        <td class="campocaja">
                            <img id="BT_BUSCAR_LT" border="0" src="images/find.gif" onclick="f_abrir_axisctr019();" style="cursor:pointer"/>
                        </td>
                    </axis:visible>
                </td>
            </axis:visible>                                              
            
        </tr>
                        
        <tr>
            <axis:ocultar f="axisadm093a" c="AMOUNT" dejarHueco="false"> 
                <td class="titulocaja" colspan = "2">
                    <b><axis:alt f="axisadm093a" c="AMOUNT" lit="9907773"/></b>
                </td>                                            
            </axis:ocultar>
        </tr>
        
        <tr>
            <axis:visible f="axisadm093a" c="AMOUNT">
                <td class="campocaja">
                    <input type="text" class="campo campotexto" value="${__formdata.AMOUNT}" name="AMOUNT" id="AMOUNT" size="10" onchange="val_number(this.value)" 
                    <axis:atr f="axisadm095a" c="AMOUNT" a="decimal=true&obligatorio=true"/> />
                </td>
            </axis:visible>                                              
            
        </tr>
        
    </table>


<!-- BUTTON IMPORTS -->                         
<c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisadm093a</c:param>
        <c:param name="__botones">cancelar
        </c:param>
</c:import>
<c:import url="../include/botonera_nt.jsp">
         <c:param name="f">axisadm093a</c:param>
         <c:param name="__botones">
         <axis:visible c="BT_ACEPTAR" f="axisadm093a">aceptar</axis:visible>
         </c:param>
</c:import>
</form>
<c:import url="../include/mensajes.jsp" />
<!-- FORM END -->
</body>
<!-- BODY END -->
</html>
<!-- HTML END -->