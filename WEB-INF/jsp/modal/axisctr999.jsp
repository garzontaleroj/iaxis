<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/**
*  Fichero: axisctr999.jsp
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

          function f_but_aceptar() {
              if (objValidador.validaEntrada()) {
                  objUtiles.ejecutarFormulario("modal_axisctr999.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
              }
          }

          function f_but_cancelar() {
              parent.f_cerrar_axisctr999();
          }

          function f_but_buscar() {
              if (objValidador.validaEntrada()) {
                  objUtiles.ejecutarFormulario("modal_axisctr999.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
              }
          }

          function f_but_9000756() {
              f_but_marcar_todo(1);
          }

          function f_but_9000757() {
              f_but_marcar_todo(0);
          }

          /****************************************************************************************/
          /******************************* CALLBACKS AJAX *****************************************/
          /****************************************************************************************/

          function f_but_marcar(thiss, CGARANT, SPRODUC) {
              marcado = thiss.checked ? 1 : 0;
              var strURL = "modal_axisctr999.do?operation=marcar_json&MARCAR=" + marcado + 
                                                                     "&CGARANT=" + CGARANT + 
                                                                     "&SPRODUC=" + SPRODUC;
              var ajaxTexto = objJsMessages.jslit_cargando;
              objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
          }

          function f_but_marcar_todo(marcar) {
              var inputs = document.getElementsByTagName("input");
              for (i = 0;i < inputs.length;i++) {
                  if (inputs[i].type == "checkbox") {
                      if (inputs[i].name.indexOf("checked_marcar_" == 0)) {
                          if (marcar == 0)
                              inputs[i].checked = false;
                          else 
                              inputs[i].checked = true;
                      }
                  }

              }
              var strURL = "modal_axisctr999.do?operation=marcar_json&MARCAR=" + marcar;
              var ajaxTexto = objJsMessages.jslit_cargando;
              objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto);
          }

          function callbackselected(p) {
              objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
              if (!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")) {
                  if (!objUtiles.estaVacio(p.JSON2.CGARANT)) {
                      document.miForm.CGARANT.value = p.JSON2.CGARANT;
                  }
                  else {
                      document.miForm.CGARANT.value = '';
                  }
              }
          }

          function f_llenar_productos(valor) {
              objAjax.invokeAsyncCGI("modal_axisctr999.do", callbackAjaxRecuperarproductos, "operation=ajax_recuperar_productos&CVALOR=" + valor, this, objJsMessages.jslit_actualizando_registro);
          }

          function f_llenar_actividades(sproduc, cramo) {
              //alert($('#CRAMO').val());
              objAjax.invokeAsyncCGI("modal_axisctr999.do", callbackAjaxRecuperaractividad, "operation=ajax_recuperar_actividades&SPRODUC=" + sproduc + '&CRAMO=' + $('#CRAMO').val(), this, objJsMessages.jslit_actualizando_registro);
          }

          function f_llenar_garantias(valor) {
              objAjax.invokeAsyncCGI("modal_axisctr999.do", callbackAjaxRecuperargarantia, "operation=ajax_recuperar_garantias&CACTIVI=" + valor + '&CRAMO=' + $('#CRAMO').val() + '&SPRODUC=' + $('#SPRODUC').val(), this, objJsMessages.jslit_actualizando_registro);
          }

          function callbackAjaxRecuperarproductos(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      var modelocombo = document.miForm.SPRODUC;
                      objDom.borrarOpcionesDeCombo(modelocombo);
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                          var elementos = doc.getElementsByTagName("element");
                          var modelocombo = document.miForm.SPRODUC;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "<axis:alt f="
                          axisctr999" c="
                          SPRODUC" lit="100829"/>", modelocombo, 0);
                          for (i = 0;i < elementos.length;i++) {
                              var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("SPRODUC")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("SPRODUC"), 0, 0) : "";
                              var desc = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TTITULO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TTITULO"), 0, 0) : "";
                              objDom.addOpcionACombo(codigo, desc, modelocombo, i + 1);
                          }

                      }
                      if (elementos.length == 0) {
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", modelocombo, 0);
                          var elementos = doc.getElementsByTagName("element");
                          var versioncombo = document.miForm.SPRODUC;
                          objDom.borrarOpcionesDeCombo(versioncombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", versioncombo, 0);
                      }

                  }
              }
              catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }

          function callbackAjaxRecuperaractividad(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      var modelocombo = document.miForm.CACTIVI;
                      objDom.borrarOpcionesDeCombo(modelocombo);
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                          var elementos = doc.getElementsByTagName("element");
                          var modelocombo = document.miForm.CACTIVI;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "<axis:alt f="
                          axisctr999" c="
                          CACTIVI" lit="103481"/>", modelocombo, 0);
                          for (i = 0;i < elementos.length;i++) {
                              var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CACTIVI")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0) : "";
                              var desc = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TTITULO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TTITULO"), 0, 0) : "";
                              objDom.addOpcionACombo(codigo, desc, modelocombo, i + 1);
                          }

                      }
                      if (elementos.length == 0) {
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", modelocombo, 0);
                          var elementos = doc.getElementsByTagName("element");
                          var versioncombo = document.miForm.CACTIVI;
                          objDom.borrarOpcionesDeCombo(versioncombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", versioncombo, 0);
                      }

                  }
              }
              catch (e) {
                  if (isDebugAjaxEnabled == "true")
                      alert(e.name + " " + e.message);
              }
          }

          function callbackAjaxRecuperargarantia(ajaxResponseText) {
              try {
                  var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      var elementos = doc.getElementsByTagName("element");
                      var modelocombo = document.miForm.CGARANT;
                      objDom.borrarOpcionesDeCombo(modelocombo);
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                          var elementos = doc.getElementsByTagName("element");
                          var modelocombo = document.miForm.CGARANT;
                          objDom.borrarOpcionesDeCombo(modelocombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "<axis:alt f="
                          axisctr999" c="
                          CGARANT" lit="103481"/>", modelocombo, 0);
                          for (i = 0;i < elementos.length;i++) {
                              var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CGARANT")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CGARANT"), 0, 0) : "";
                              var desc = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TGARANT")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TGARANT"), 0, 0) : "";
                              objDom.addOpcionACombo(codigo, desc, modelocombo, i + 1);
                          }

                      }
                      if (elementos.length == 0) {
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", modelocombo, 0);
                          var elementos = doc.getElementsByTagName("element");
                          var versioncombo = document.miForm.CGARANT;
                          objDom.borrarOpcionesDeCombo(versioncombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "Seleccione", versioncombo, 0);
                      }

                  }
              }
              catch (e) {
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
        <form name="miForm" action="modal_axisctr999.do" method="POST">
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisage010" c="TITULO" lit="9905018"/></c:param>
                <c:param name="titulo"><axis:alt f="axisctr999" c="TITULO" lit="9905018"/></c:param> 
                <c:param name="form">axisctr999</c:param>
            </c:import>
            
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" name="CCODIGO" id="CCODIGO" value="${__formdata.CCODIGO}"/>    
            <input type="hidden" name="CCODIGO_CAMPA" id="CCODIGO" value="${__formdata.CCODIGO_CAMPA}"/>    
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <td align="center">
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axisctr999" c="CRAMO">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr999" c="CRAMO" lit="104477"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr999" c="SPROCUC">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr999" c="SPROCUC" lit="100829"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr999" c="CACTIVI">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr999" c="CACTIVI" lit="103481"/></b>
                                            </td>
                                          </axis:ocultar>
                                          <axis:ocultar f="axisctr999" c="CGARANT">
                                            <td class="titulocaja">
                                              <b><axis:alt f="axisctr999" c="CGARANT" lit="1000183"/></b>
                                            </td>
                                          </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:visible c="CRAMO" f="axisctr999">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CRAMO" name="CRAMO" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisctr999" c="CRAMO" lit="100784"/>"
                                                        onchange="f_llenar_productos(this.value)" >
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr999" c="CRAMO_VALOR" lit="100784"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTRAMOS}" var="item">
                                                        <option value="${item.CRAMO}" <c:if test="${item.CRAMO  == __formdata.CRAMO}">selected</c:if>>
                                                            ${item.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <axis:visible c="SPRODUC" f="axisctr999">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="SPRODUC" name="SPRODUC" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisctr999" c="SPRODUC" lit="100829"/>"
                                                        onchange="f_llenar_actividades(this.value)">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr999" c="SPRODUC_VALOR" lit="100829"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTPRODUCTOS}" var="item">
                                                        <option value="${item.SPRODUC}" <c:if test="${item.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>
                                                            ${item.TTITULO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <axis:visible c="CACTIVI" f="axisctr999">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CACTIVI" name="CACTIVI" 
                                                        size="1" style="width:100%"   
                                                        title="<axis:alt f="axisctr999" c="CACTIVI" lit="103481"/>"
                                                        onchange="f_llenar_garantias(this.value)">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr999" c="CACTIVI_VALOR" lit="103481"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTACTIVIDAD}" var="item">
                                                        <option value="${item.CACTIVI}" <c:if test="${item.CACTIVI  == __formdata.CACTIVI}">selected</c:if>>
                                                            ${item.TTITULO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                            <axis:visible c="CGARANT" f="axisctr999">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CGARANT" name="CGARANT" 
                                                        size="1" style="width:100%"  
                                                        title="<axis:alt f="axisctr999" c="CGARANT" lit="1000183"/>">
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr999" c="CGARANT_VALOR" lit="1000183"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTGARANTIAS}" var="item">
                                                        <option value="${item.CGARANT}" <c:if test="${item.CGARANT  == __formdata.CGARANT}">selected</c:if>>
                                                            ${item.TGARANT}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            </axis:visible>
                                        </tr>                                                     
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisctr999" c="CRAMO" lit="104477"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr999" c="SPRODUC" lit="100829"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr999" c="CACTIVI" lit="103481"/></c:set>
                                    <c:set var="title3"><axis:alt f="axisctr999" c="CGARANT" lit="1000183"/></c:set>
                                    <c:set var="title4"><axis:alt f="axisctr999" c="SELCGARANT" lit="103496"/></c:set>
                                    <div class="seccion displayspaceGrande">
                                        <display:table name="${sessionScope.axisctr999_garantias}" id="productosListId" 
                                            export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                            cellpadding="0" cellspacing="0" requestURI="" >
                                            <%@ include file="../include/displaytag.jsp"%>
                                             <display:column title="${title4}" sortable="true" sortProperty="NCGARANT" headerClass="sortable"  
                                                            media="html" autolink="false" style="width:5%">
                                                <div class="dspIcons"> 
                                                    <input type="checkbox" id="checked_marcar_${productosListId.CGARANT}" 
                                                           name="checked_marcar_${productosListId.CGARANT}" 
                                                           <c:if test="${productosListId.MARCAR == 1}"> checked </c:if>  
                                                           value="" onclick="f_but_marcar(this,'${productosListId.CGARANT}','${productosListId.SPRODUC}')"/>
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisctr999" c="CRAMO">
                                                <display:column title="${title0}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_CAMPANAS.CRAMO"
                                                                style="width:20%">
                                                    <div class="dspText">${productosListId.CRAMO} ${productosListId.TCRAMO}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr999" c="SPRODUC">
                                                <display:column title="${title1}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_CAMPANAS.SPRODUC"
                                                                style="width:20%">
                                                    <div class="dspText">${productosListId.SPRODUC} ${productosListId.TPRODUC}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr999" c="CACTIVI">
                                                <display:column title="${title2}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_CAMPANAS.CACTIVI"
                                                                style="width:20%">
                                                    <div class="dspText">${productosListId.CACTIVI} ${productosListId.TACTIVI}</div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr999" c="CGARANT">
                                                <display:column title="${title3}" sortable="true" 
                                                                headerClass="sortable" media="html" autolink="false" 
                                                                sortProperty="OB_IAX_CAMPANAS.CGARANT"
                                                                style="width:35%">
                                                    <div class="dspText">${productosListId.CGARANT} ${productosListId.TGARANT}</div>
                                                </display:column>
                                            </axis:visible>
                                        </display:table>
                                    </div>
                                </td>
                            </tr>              
                        </table>
                        <div class="separador">&nbsp;</div>
                                                                                              
                    </td>
                </tr>
            </table>
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr999</c:param>
                <c:param name="__botones">cancelar,9000756,9000757,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>