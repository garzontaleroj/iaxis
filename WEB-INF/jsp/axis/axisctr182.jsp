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
        <title><axis:alt f="axisctr182" c="LIT_TITULO" lit="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />

      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>

        <script type="text/javascript">
            var vctramte = '';
            function f_onload(){
                
                if (!objUtiles.estaVacio(objDom.getValorPorId('ok'))){
                    if (objDom.getValorPorId('ok')=='0'){
                        objAppMensajes.pintarMensajePantalla('<axis:alt f="axisctr181" c="CORRECTAMENTE" lit="1000405"/>', "info"); 
                        objDom.setValorPorId("MODO", "4");
                    }
                    
                }
                if (objUtiles.estaVacio(objDom.getValorPorId('SSEGURO'))){
                    f_abrir_axisctr181();
                    //Buixa
                    /*objDom.setValorPorId("CTAPRES", "111qwe");
                    objDom.setValorPorId("SSEGURO", "251825");
                    objDom.setValorPorId("MODO", "1");
                    objUtiles.ejecutarFormulario ("axis_axisctr182.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                    */
                }
              
                
                //ecg 20120927 bug 23749 
                var ORIGEN_Y_OPERACION_value=document.miForm.ORIGEN_Y_OPERACION.value;
                if (ORIGEN_Y_OPERACION_value=="axisctr181_ALTA") {
                	//- si s'arriba des de la pantalla axisctr181 amb el botó Alta, mostrar el botó Guardar (l'existent)
                	var obut_aceptar=document.getElementById("but_aceptar");
                	if (obut_aceptar!=undefined) {
                		obut_aceptar.style.visibility="visible";	
                		obut_aceptar.disabled=false;
                	}
                }
                if (ORIGEN_Y_OPERACION_value=="axisctr181_CONSULTA") {
                    //- si s'arriba des del botó Consultar del multiregistre de l'axisctr181:
                    //-- si el prestec esta en estat Pendiente(0) mostrar els botons Autoritzar i Rebutjar
                    //-- si el prestec estaen qualsevol altre estat no mostrar cap botó        
                        var oestatPrestec=document.getElementById("CESTADO");
                	var obut_aceptar=document.getElementById("but_aceptar");
                	var obut_9000545=document.getElementById("but_9000545");
                	if (oestatPrestec!=undefined && oestatPrestec.value=='0') {
	                	if (obut_aceptar!=undefined) {
	                		obut_aceptar.style.visibility="visible";	
	                		obut_aceptar.style.display="";	
	                		obut_aceptar.disabled=false;
	                	}
	                	if (obut_9000545!=undefined) {
	                		obut_9000545.style.visibility="visible";	
	                		obut_9000545.style.display="";	
	                		obut_9000545.disabled=false;
	                	}
                	}
                	else {
	                	if (obut_aceptar!=undefined) {
	                		obut_aceptar.style.visibility="hidden";	
	                	}
	                	if (obut_9000545!=undefined) {
	                		obut_9000545.style.visibility="hidden";	
	                	}
                	
                	}
                	
                }
  f_cargar_propiedades_pantalla();
            }
            
            function f_abrir_axisctr181() {
                objUtiles.abrirModal("axisctr181","src","modal_axisctr181.do?operation=form");
            }
            /****************************************************************************************/
            /*******************************MODAL  GENERICO *****************************************/
            /****************************************************************************************/
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                    
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
            }
            
            function f_abrir_modal_agenda(cual, noXButton, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                    
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);        
            }
            
          
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
            }
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr182", "cancelar", document.miForm, "_self");
            }
            
            function f_but_aceptar(){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("axis_axisctr182.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                 
                }
            }
            function f_aceptar_axisctr181(CTAPRES, SSEGURO, MODO){
                objUtiles.cerrarModal("axisctr181");
                objDom.setValorPorId("CTAPRES", CTAPRES);
                objDom.setValorPorId("SSEGURO", SSEGURO);
                objDom.setValorPorId("MODO", MODO);
                objDom.setValorPorId("ok", "1");
                if (CTAPRES==null && MODO=='1') {
                	document.miForm.ORIGEN_Y_OPERACION.value="axisctr181_ALTA";
                }
                if (CTAPRES!=null && MODO=='2') {
                	document.miForm.ORIGEN_Y_OPERACION.value="axisctr181_CONSULTA";
                }
                
                objUtiles.ejecutarFormulario ("axis_axisctr182.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                 
                
            }
            function f_cerrar_axisctr181(){
                objUtiles.cerrarModal("axisctr181");
                f_but_cancelar();
            }
            
            function f_abrir_axisper014(SPERSON) {
                objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+SPERSON); 
            }
            function f_cerrar_axisper014 () {
            objUtiles.cerrarModal("axisper014"); 
        }    
    
        function f_aceptar_axisper014 (SPERSON) {
            f_cerrar_axisper014();
            objAjax.invokeAsyncCGI("axis_axisadm018.do", callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomador&SPERSON="+SPERSON, this, objJsMessages.jslit_cargando);
        }
        
       
        
        function callbackAjaxCargarCuentasTomador (ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    var elementos = doc.getElementsByTagName("element");
                    var cccCombo = document.getElementById('CBANCAR');     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    
                   for (i = 0; i < elementos.length; i++) {
                        var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                        var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                     objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0): "";
                        
                        objDom.addOpcionACombo(codigo, desc, cccCombo, i);
                    }
                    
                }
            }  
        }
        
        function f_but_9000545(){
            if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("axis_axisctr182.do", "rechazar", document.miForm, "_self", objJsMessages.jslit_cargando);                 
                }
        }
        
        function f_but_9904315(){
            if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("axis_axisctr182.do", "reversar", document.miForm, "_self", objJsMessages.jslit_cargando);                 
                }
        }
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    
        <!-- Modal direcciones -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <!-- axisctr181 DETALLE SINIESTRO  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr181|<axis:alt f="axisctr182" c="MODAL_AXISCTR181" lit="9903063"/></c:param>
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr182" c="LIT_1000216" lit="1000216" /></c:param>
            <c:param name="nid" value="axisper014" />
        </c:import>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr182" c="LIT_TTITULO" lit="9903062"/></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr182</c:param>
        </c:import>


    <!-- Seccion datos Póliza -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       
       <tr>
          <td>
            <!-- Datos póliza -->
            <div class="separador">&nbsp;</div>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr182" c="LIT_DATOS_POLIZA" lit="1000098" /></div>
                <c:import url="axissin006_datospoliza.jsp" >
                    <c:param name="screenName" value="axisctr182"></c:param>
                </c:import>
             <div class="separador">&nbsp;</div> 
  
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr182" c="PROVISIONES" lit="102656" /></div>
            <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <axis:ocultar f="axisctr182" c="IVALRES">
                            <td class="titulocaja" style="width:25%">
                                <b><axis:alt f="axisctr182" c="IVALRES" lit="9902632" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IVALPRE">
                            <td class="titulocaja" style="width:25%">
                                <b><axis:alt f="axisctr182" c="IVALPRE" lit="9902881" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IVALDIS">
                            <td class="titulocaja" style="width:25%">
                                <b><axis:alt f="axisctr182" c="IVALDIS" lit="9902880" /></b>
                            </td>
                            </axis:ocultar>
                            <td></td>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr182" c="IVALRES"> 
                            <td class="campocaja" style="width:25%">
                                <input type="text" class="campowidthbig campo campotexto" id="IVALRES" name="IVALRES" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IVALRES}' maxFractionDigits='2'/>" <axis:atr f="axisctr182" c="IVALRES" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='IVALRES' lit='9902632' />" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IVALPRE"> 
                            <td class="campocaja" style="width:25%">
                                <input type="text" class="campowidthbig campo campotexto" id="IVALPRE" name="IVALPRE" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.IVALPRE}' />" <axis:atr f="axisctr182" c="IVALPRE" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='IVALPRE' lit='9902881' />" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IVALDIS"> 
                            <td class="campocaja" style="width:25%">
                                <input type="text" class="campowidthbig campo campotexto" id="IVALDIS" name="IVALDIS" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IVALDIS}' maxFractionDigits='2'/>" <axis:atr f="axisctr182" c="IVALDIS" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='IVALDIS' lit='9902880' />" />
                            </td>
                            </axis:ocultar>
                        </tr>
                      </table>
                    </td>
                </tr>
             </table>
             <div class="separador">&nbsp;</div>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr182" c="DSP_DATOSPRESTAMO" lit="9902882" />
                <img border="0" style="cursor:pointer" onclick="f_abrir_axisctr181();" src="images/find.gif">
            </div>
            <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        <input type="hidden" name="SSEGURO" id ="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="SPERSON" id ="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CTAPRES" id ="CTAPRES" value="${__formdata.CTAPRES}"/>
        <input type="hidden" name="CFORPAG_OUT" id ="CFORPAG_OUT" value="${__formdata.CFORPAG}"/>
        <input type="hidden" name="CBANCAR_OUT" id ="CBANCAR_OUT" value="${__formdata.CBANCAR}"/>
        <input type="hidden" name="ok" id ="ok" value="${__formdata.ok}"/>
        <input type="hidden" name="CMODO" id ="CMODO" value="${sessionScope.CMODO}"/>
        <input type="hidden" name="MODO" id ="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="ORIGEN_Y_OPERACION" id ="ORIGEN_Y_OPERACION" value="${__formdata.ORIGEN_Y_OPERACION}"/>
        <input type="hidden" name="CESTADO" id ="CESTADO" value="${__formdata.CESTADO}"/>
            <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <axis:ocultar f="axisctr182" c="CTIPPRES">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="CTIPPRES" lit="9900883" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="FINIPREST">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="FINIPREST" lit="9000526" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="FFINPREST">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="FFINPREST" lit="9000527" /></b>
                            </td>
                            </axis:ocultar>
                            <td></td>
                        </tr>
                        <tr>
                        
                            <axis:ocultar f="axisctr182" c="CTIPPRES"> 
                            <td class="campocaja" style="width:25%">
                                <select name = "CTIPPRES" id ="CTIPPRES" size="1" onchange="" 
                                    class="campowidthselect campo campotexto" <axis:atr f="axisctr182" c="CTIPPRES" a="isInputText=false&modificable=false"/>>&nbsp;
                                    <option value=""> -  <axis:alt f="axisctr182" c="SELECCIONE" lit="1000348"/> - </option>
                                    <c:forEach items="${__formdata.lstctipres}" var="lst">
                                        <option value = "${lst.CATRIBU}" <c:if test="${lst.CATRIBU  == __formdata.CTIPPRES}">selected</c:if>>${lst.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="FINIPREST"> 
                            <td class="campocaja" style="width:25%">
                               <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FINIPREST" name="FINIPREST" size="15"
                                value ="<fmt:formatDate value="${__formdata.FINIPREST}" pattern="dd/MM/yyyy"/>" onblur="" 
                                title="<axis:alt f="axisctr182" c="FINIPREST" lit="9000526"/>" <axis:atr f="axisctr182" c="FINIPREST" a="modificable=false&obligatorio=false&formato=fecha"/>/>
                                <a id="icon_FINIPREST" style="vertical-align:middle;" href="#">
                                    <img border="0" alt="<axis:alt f="axisctr182" c="ICO_FINIPREST" lit="9000526" />" title="<axis:alt f="axisctr182" c="FINIPREST" lit="9000526"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                           <axis:ocultar f="axisctr182" c="FFINPREST"> 
                            <td class="campocaja" style="width:25%">
                               <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FFINPREST" name="FFINPREST" size="15"
                                value ="<fmt:formatDate value="${__formdata.FFINPREST}" pattern="dd/MM/yyyy"/>" onblur="" 
                                title="<axis:alt f="axisctr182" c="FFINPREST" lit="9000527"/>" <axis:atr f="axisctr182" c="FFINPREST" a="modificable=false&obligatorio=false&formato=fecha"/>/>
                                <a id="icon_FFINPREST" style="vertical-align:middle;" href="#">
                                    <img border="0" alt="<axis:alt f="axisctr182" c="ICO_FFINPREST" lit="9000527" />" title="<axis:alt f="axisctr182" c="FFINPREST" lit="9000527"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <td></td>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr182" c="ISALDO">
                            <td class="titulocaja"> 
                                <b><axis:alt f="axisctr182" c="ISALDO" lit="9001942" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="ICAPINI">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="ICAPINI" lit="1000073" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IPENDENT">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="IPENDENT" lit="9902740" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="ITASA">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr182" c="ITASA" lit="1000543" /></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr182" c="ISALDO"> 
                            <td class="campocaja">
                                <input type="text" class="campowidthbig campo campotexto" id="ISALDO" name="ISALDO" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ISALDO}' />" <axis:atr f="axisctr182" c="ISALDO" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='ISALDO' lit='9001942' />" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="ICAPINI"> 
                            <td class="campocaja">
                                <input type="text" class="campowidthbig campo campotexto" id="ICAPINI" name="ICAPINI" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ICAPINI}' />" <axis:atr f="axisctr182" c="ICAPINI" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='ICAPINI' lit='1000073' />" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="IPENDENT"> 
                            <td class="campocaja">
                                <input type="text" class="campowidthbig campo campotexto" id="IPENDENT" name="IPENDENT" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.IPENDENT}' />" <axis:atr f="axisctr182" c="IPENDENT" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='IPENDENT' lit='9902740' />" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="ITASA"> 
                            <td class="campocaja">
                                <input type="text" class="campowidthbig campo campotexto" id="ITASA" name="ITASA" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.ITASA}' />" <axis:atr f="axisctr182" c="ITASA" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='ITASA' lit='1000543' />" />
                            </td>
                            </axis:ocultar>
                            <!-- bug 0019238  -->
                            <td class="campocaja" style="width:25%">
                                <input type="hidden" class="campowidthbig campo campotexto" id="IVALDIS" name="IVALDIS" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPRO]}' value='${__formdata.IVALDIS}' />" <axis:atr f="axisctr182" c="IVALDIS" a="modificable=false"/> 
                                title="<axis:alt f='axisctr182' c='IVALDIS' lit='9902880' />" />
                            </td>

                        </tr>
                      </table>
                    </td>
                </tr>
             </table>
              <div class="separador">&nbsp;</div>
            
    
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr182" c="DSP_FORMAPAGO" lit="100712" /></div>
            <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <axis:ocultar f="axisctr182" c="FORDEN">
                            <td class="titulocaja" style="width:25%">
                                <b><axis:alt f="axisctr182" c="FORDEN" lit="101573" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="CFORPAG">
                            <td class="titulocaja" style="width:25%">
                                <b><axis:alt f="axisctr182" c="CFORPAG" lit="100712" /></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="CBANCAR">
                            <td class="titulocaja" id="tit_CBANCAR" style="width:25%" >
                                <b><axis:alt f="axisctr182" c="CBANCAR" lit="100965" /></b>
                            </td>
                            </axis:ocultar>
                            <td></td>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr182" c="FORDEN"> 
                            <td class="campocaja" style="width:25%" >
                               <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FORDEN" name="FORDEN" size="15"
                                value ="<fmt:formatDate value="${__formdata.FORDEN}" pattern="dd/MM/yyyy"/>" onblur="" 
                                title="<axis:alt f="axisctr182" c="FORDEN" lit="101573"/>" <axis:atr f="axisctr182" c="FORDEN" a="modificable=false&obligatorio=true&formato=fecha"/>/>
                                <a id="icon_FORDEN" style="vertical-align:middle;" href="#">
                                    <img border="0" alt="<axis:alt f="axisctr182" c="ICO_FORDEN" lit="101573" />" title="<axis:alt f="axisctr182" c="FORDEN" lit="101573"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr182" c="CFORPAG">
                            <td class="campocaja" style="width:25%" >
             
                                 <select name = "CFORPAG" id ="CFORPAG" size="1" onchange="f_cargar_propiedades_pantalla();" 
                                    class="campowidthselect campo campotexto" <axis:atr f="axisctr182" c="CFORPAG" a="isInputText=false&modificable=false&obligatorio=true"/>>&nbsp;
                                    <option value= "<%= Integer.MIN_VALUE %>"> -  <axis:alt f="axisctr182" c="SELECCIONE" lit="1000348"/> - </option>
                                    <c:forEach items="${__formdata.lstcforpag}" var="fp">
                                        <option value = "${fp.CATRIBU}"
                                      
                                        <c:if test="${fp.CATRIBU  == __formdata.CFORPAG}"> selected </c:if>>
                                        ${fp.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                           <axis:ocultar f="axisctr182" c="CBANCAR"> 
                            <td class="campocaja" id="td_CBANCAR">
                            <axis:encryptflag f="axisctr182" c="CBANCAR" />
                                <select name="CBANCAR" id="CBANCAR" size="1" style="width:90%" 
                                    class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr182" c="CBANCAR" a="isInputText=false&modificable=false&obligatorio=false"/>>&nbsp;
                                    <option value=""> -  <axis:alt f="axisctr182" c="SELECCIONE" lit="1000348"/> - </option>
                                    <c:forEach items="${__formdata.TOMADORCCC}" var="cuentaTomador">
                                       <option value = "${cuentaTomador.OB_IAX_CCC.CBANCAR}"
                                            <c:if test="${__formdata.CBANCAR == cuentaTomador.OB_IAX_CCC.CBANCAR}">selected</c:if>>
                                            <axis:masc f="axisctr182" c="CBANCAR" value="${cuentaTomador.OB_IAX_CCC.CBANCAR}"/>
                                        </option>
                                    </c:forEach>
                                 </select>
                                
                                <axis:ocultar f="axisctr182" c="EDIT_CBANCAR">
                            <c:if test="${__formdata.MODO eq '1'}">
                                <a id="icon_CBANCARS" href="javascript:f_abrir_axisper014(${__formdata.SPERTOM})"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" title="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" src="images/lapiz.gif"/></a>
                            </c:if>
                                </axis:ocultar>
                            </td>
                            </axis:ocultar>
                            <td>&nbsp;</td>
                        </tr>
                                 </table>
                            </td>
                  
                </tr>
             </table>
              
    
              <div class="separador">&nbsp;</div>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr182" c="DSP_FORMACOBRO" lit="9901393" /></div>
            <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <axis:ocultar f="axisctr182" c="FCUOTA1">
                            <td class="titulocaja" style="width:25%" >
                                <b><axis:alt f="axisctr182" c="FCUOTA1" lit="9902883" /></b>
                            </td>
                            </axis:ocultar>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr182" c="FCUOTA1"> 
                            <td class="campocaja" style="width:25%" >
                               <input style="width:75%"  type="text" class="campowidthinput campo campotexto" id="FCUOTA1" name="FCUOTA1" size="15"
                                value ="<fmt:formatDate value="${__formdata.FCUOTA1}" pattern="dd/MM/yyyy"/>" onblur="" 
                                title="<axis:alt f="axisctr182" c="FCUOTA1" lit="9902883"/>" <axis:atr f="axisctr182" c="FCUOTA1" a="modificable=false&obligatorio=true&formato=fecha"/>/>
                                <a id="icon_FCUOTA1" style="vertical-align:middle;" href="#">
                                    <img border="0" alt="<axis:alt f="axisctr182" c="ICO_FCUOTA1" lit="9902883" />" title="<axis:alt f="axisctr182" c="FCUOTA1" lit="9902883"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                      </table>
                    </td>
                </tr>
             </table>
          
          </form>
          </td>
        </tr>
 </table>
 
 
<div class="separador">&nbsp;</div>
<table><tr><td></td></tr></table>
<% System.out.println("***********************************************************1"); %>
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr182</c:param><c:param name="f">axisctr182</c:param>
	<c:param name="f">axisctr182</c:param>
    <c:param name="__botones">cancelar,aceptar<c:if test="${__formdata.MODO=='2' && __formdata.VALOR_REVERSO=='1'}" >,9904315</c:if><axis:visible c="BT_ANULAR" f="axisctr182">,9000545</axis:visible></c:param>
</c:import>

<% System.out.println("***********************************************************2"); %>
<c:import url="../include/mensajes.jsp" />

</body>
<script type="text/javascript">

<axis:visible f="axisctr182" c="FINIPREST" >
    Calendar.setup({
        inputField     :    "FINIPREST",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FINIPREST",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


<axis:visible f="axisctr182" c="FCUOTA1" >
    Calendar.setup({
        inputField     :    "FCUOTA1",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FCUOTA1",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


<axis:visible f="axisctr182" c="FFINPREST" >
    Calendar.setup({
        inputField     :    "FFINPREST",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINPREST",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

<axis:visible f="axisctr182" c="FORDEN" >
    Calendar.setup({
        inputField     :    "FORDEN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FORDEN",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

</script>
</html>