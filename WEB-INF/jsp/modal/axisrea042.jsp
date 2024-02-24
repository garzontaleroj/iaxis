<%/**
*  Fichero: axisrea042.jsp 
*
*  Fecha: 08/04/2014
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisrea042" c="TITULO" lit="9906724"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                f_cargar_propiedades_pantalla();
            }
            
            function f_but_cancelar() {
                 parent.f_cerrar_modal("axisrea042");                
            }           
            
            function f_but_aceptar() {
                 if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("modal_axisrea042.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                 }           
            }       
            
            function f_but_9906723() {
                if (objValidador.validaEntrada()) {
                    if (!objUtiles.estaVacio(document.miForm.ID.value)) {
                        f_nuevo_axisrea043();
                    } else {
                        alert(document.miForm.ERROR_ID.value);
                    }
                 }   
            }
            
            function f_but_9904925() {
                if (objValidador.validaEntrada()) {
                    if (!objUtiles.estaVacio(document.miForm.ID.value)) {
                        objUtiles.ejecutarFormulario("modal_axisrea042.do", "copiar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    } else {
                        alert(document.miForm.ERROR_ID.value);
                    }
                }   
            }
            
            function f_cerrar_modal(modal) {            
               objUtiles.cerrarModal(modal);
               objUtiles.ejecutarFormulario("modal_axisrea042.do?MODO=MODIFICAR", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_nuevo_axisrea043() {
                var id = document.miForm.ID.value;
                var SCONTRA = document.miForm.SCONTRA.value;
                var CTRAMO = document.miForm.CTRAMO.value;
                var CRAMO = document.miForm.CRAMO.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                objUtiles.abrirModal("axisrea043", "src", "modal_axisrea043.do?operation=form&ID_CTTO="+id+"&SCONTRA="+SCONTRA+"&CTRAMO="+CTRAMO+"&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC);  
            }   
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            function f_cargar_version(scontra) {       
                objAjax.invokeAsyncCGI("modal_axisrea042.do", callbackAjaxCargarVersion, "operation=ajax_cargar_version&SCONTRA=" + scontra, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_cargar_tramos(scontra,nversio) {      
                objAjax.invokeAsyncCGI("modal_axisrea042.do", callbackAjaxCargarTramos, "operation=ajax_cargar_tramos&SCONTRA="+scontra+"&NVERSIO="+nversio, this, objJsMessages.jslit_actualizando_registro);

            }
            
            function f_cargar_ramos(scontra) {       
                objAjax.invokeAsyncCGI("modal_axisrea042.do", callbackAjaxCargarRamos, "operation=ajax_cargar_ramos&SCONTRA="+scontra, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_cargar_productos(cramo) {       
                objAjax.invokeAsyncCGI("modal_axisrea042.do", callbackAjaxCargarproductos, "operation=ajax_cargar_productos&CRAMO="+cramo, this, objJsMessages.jslit_actualizando_registro);
            }
            
            
            function f_onchange_contrato(scontra) {       
                f_cargar_version(scontra);
               
            }
            
            function f_onchange_ramo(cramo) {       
                f_cargar_productos(cramo);
               
            }
            
             function callbackAjaxCargarVersion(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                        var version = objUtiles.existeObjetoXml(elementos[0].getElementsByTagName("NVERSIO")[0]) ? objDom.getValorNodoDelComponente(elementos[0].getElementsByTagName("NVERSIO"), 0, 0) : "";
                        var scontra = objDom.getValorPorId("SCONTRA");
                        objDom.setValorPorId("NVERSIO", version);;
                        f_cargar_tramos(scontra,version);
                      }
                      if (elementos.length == 0) {
                          objDom.setValorPorId("NVERSIO", null);
                          
                          var modelocombo = document.miForm.CTRAMO;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="CTRAMO" lit="9000609"/> -", modelocombo, 0);
                          
                          var scontra = objDom.getValorPorId("SCONTRA");
                          f_cargar_ramos(scontra);
                      }
                  }
              } catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }
          
          function callbackAjaxCargarTramos(ajaxResponseText) {  
               try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                        var modelocombo = document.miForm.CTRAMO;
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="CTRAMO" lit="9000609"/> -", modelocombo, 0);
                        for (i = 0;i < elementos.length;i++) {
                            var ctramo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CTRAMO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CTRAMO"), 0, 0) : "";
                            var ttramo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TTRAMO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TTRAMO"), 0, 0) : "";
                            objDom.addOpcionACombo(ctramo, ctramo+" "+ttramo, modelocombo, i + 1);
                        }
                      }
                  }
                  var scontra = objDom.getValorPorId("SCONTRA");
                  f_cargar_ramos(scontra);
              } catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }
          
           function callbackAjaxCargarRamos(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                        var modelocombo = document.miForm.CRAMO;
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="CRAMO" lit="100784"/> -", modelocombo, 0);
                        for (i = 0;i < elementos.length;i++) {
                            var cramo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CRAMO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CRAMO"), 0, 0) : "";
                            var tramo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TRAMO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TRAMO"), 0, 0) : "";
                            objDom.addOpcionACombo(cramo, cramo+" "+tramo, modelocombo, i + 1);
                        }
                      }
                      if (elementos.length == 0) {
                          var modelocombo = document.miForm.CRAMO;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="CRAMO" lit="100784"/> -", modelocombo, 0);
                      }
                  }
              } catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }
          
           function callbackAjaxCargarproductos(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                        var modelocombo = document.miForm.SPRODUC;
                        objDom.borrarOpcionesDeCombo(modelocombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="SPRODUC" lit="9902909"/> -", modelocombo, 0);
                        for (i = 0;i < elementos.length;i++) {
                            var sproduc = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("SPRODUC")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("SPRODUC"), 0, 0) : "";
                            var ttitulo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TTITULO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TTITULO"), 0, 0) : "";
                            objDom.addOpcionACombo(sproduc, sproduc+" "+ttitulo, modelocombo, i + 1);
                        }
                      }
                      if (elementos.length == 0) {
                          var modelocombo = document.miForm.SPRODUC;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea042" c="SPRODUC" lit="9902909"/> -", modelocombo, 0);
                      }
                  }
              } catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST"> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea042" c="TITULO" lit="9906724"/></c:param>
                <c:param name="titulo"><axis:alt f="axisrea042" c="TITULO" lit="9906724"/></c:param> 
                <c:param name="form">axisrea042</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea043|<axis:alt f="axisrea043" c="LIT_MODAL_AXISREA043" lit="9906724" /></c:param>
            </c:import>
            
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="ID" name="ID" value="${__formdata.ID}"/>
            <input type="hidden" id="ERROR_ID" name="ERROR_ID" value="<axis:alt f="axisadm004" c="ERROR_ID" lit="9906726" />"/>
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisrea042" c="SCONTRA">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="SCONTRA" lit="9001894"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea042" c="NVERSIO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="NVERSIO" lit="9001146"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea042" c="CTRAMO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="CTRAMO" lit="9000609"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:visible c="SCONTRA" f="axisrea042">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="SCONTRA" name="SCONTRA" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisrea042" c="SCONTRA" lit="9001894"/>"
                                                        onchange="f_onchange_contrato(this.value)" 
                                                        <axis:atr f="axisrea042" c="SCONTRA" a="modificable=true&obligatorio=true"/>>
                                                    <option value="null"> - <axis:alt f="axisrea042" c="SCONTRA_VALOR" lit="9001894"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTCONTRATOS}" var="item">
                                                        <option value="${item.SCONTRA}" <c:if test="${item.SCONTRA  == __formdata.SCONTRA}">selected</c:if>>
                                                            ${item.SCONTRA} ${item.TDESCRIPCION}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <td class="campocaja">
                                                <input id="NVERSIO" name="NVERSIO" type="text" class="campo campotexto" style="width:10%" maxlength="120"
                                                title=<axis:alt f="axisrea042" c="NVERSIO" lit="9001146" />
                                                alt=<axis:alt f="axisrea042" c="NVERSIO" lit="9001146"/> 
                                                value="${__formdata.NVERSIO}"
                                                <axis:atr f="axisrea042" c="NVERSIO" a="modificable=false&obligatorio=true"/>/>
                                            </td>
                                            <axis:visible c="CTRAMO" f="axisrea042">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CTRAMO" name="CTRAMO" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisrea042" c="CTRAMO" lit="9000609"/>"
                                                        
                                                        <axis:atr f="axisrea042" c="CTRAMO" a="modificable=true&obligatorio=true"/>>
                                                    <option value="null"> - <axis:alt f="axisrea042" c="CTRAMO_VALOR" lit="9000609"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTTRAMOS}" var="item">
                                                        <option value="${item.CTRAMO}" <c:if test="${item.CTRAMO  == __formdata.CTRAMO}">selected</c:if>>
                                                            ${item.CTRAMO} ${item.TTRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisrea042" c="CRAMO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="CRAMO" lit="100784"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea042" c="SPRODUC">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="SPRODUC" lit="9902909"/></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea042" c="PORCEN">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisrea042" c="PORCEN" lit="101467"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible c="CRAMO" f="axisrea042">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CRAMO" name="CRAMO" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisrea042" c="CRAMO" lit="100784"/>"
                                                        onchange="f_onchange_ramo(this.value)" 
                                                        <axis:atr f="axisrea042" c="CRAMO" a="modificable=true&obligatorio=true"/>>
                                                    <option value="null"> - <axis:alt f="axisrea042" c="CRAMO_VALOR" lit="100784"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTRAMOS}" var="item">
                                                        <option value="${item.CRAMO}" <c:if test="${item.CRAMO  == __formdata.CRAMO}">selected</c:if>>
                                                            ${item.CRAMO} ${item.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <axis:visible c="SPRODUC" f="axisrea042">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="SPRODUC" name="SPRODUC" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisrea042" c="SPRODUC" lit="9902909"/>"
                                                        
                                                        <axis:atr f="axisrea042" c="SPRODUC" a="modificable=true&obligatorio=false"/>>
                                                    <option value="null"> - <axis:alt f="axisrea042" c="SPRODUC_VALOR" lit="9902909"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTPRODUCTOS}" var="item">
                                                        <option value="${item.SPRODUC}" <c:if test="${item.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>
                                                            ${item.SPRODUC} ${item.TTITULO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <axis:visible c="PORCEN" f="axisrea042">
                                            <td class="campocaja">
                                                  <input id="PORCEN" name="PORCEN" type="text" class="campo campotexto" style="width:10%" maxlength="120"
                                                title=<axis:alt f="axisrea042" c="PORCEN" lit="101467" />
                                                alt=<axis:alt f="axisrea042" c="PORCEN" lit="101467"/> 
                                                value="${__formdata.PORCEN}"
                                                <axis:atr f="axisrea042" c="PORCEN" a="modificable=true&obligatorio=false"/>/>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>                                          
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisrea042</c:param>
                <c:param name="__botones">cancelar,9906723,9904925,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>