<%/**
*  Fichero: axisrea041.jsp 
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
        <title><axis:alt f="axisrea041" c="TITULO" lit="9906707"/></title>
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
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisnombrepantalla", "cancelar", document.miForm, "_self");
            }        
            
            function f_but_9904040() {
                objUtiles.ejecutarFormulario("axis_axisrea041.do", "limpiar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_buscar() {
                objUtiles.ejecutarFormulario("axis_axisrea041.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_nuevo_axisrea042(MODO) {
                objUtiles.abrirModal("axisrea042", "src", "modal_axisrea042.do?operation=form&MODO="+MODO);  
            }   
            
            function f_cerrar_modal(modal) {      
               objUtiles.cerrarModal(modal);
               objUtiles.ejecutarFormulario("axis_axisrea041.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
               
            }
            
            function f_modif_axisrea042(ID,SCONTRA,NVERSIO,CRAMO) {
                var MODO = "MODIFICAR";
                objUtiles.abrirModal("axisrea042", "src", "modal_axisrea042.do?operation=form&ID="+ID+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&MODO="+MODO+"&CRAMO="+CRAMO);  
            }
            
            function f_borrar_porcen(ID,SCONTRA) {
                objUtiles.ejecutarFormulario("axis_axisrea041.do?ID="+ID, "eliminar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function f_llenar_productos(valor) {
              objAjax.invokeAsyncCGI("axis_axisrea041.do", callbackAjaxRecuperarproductos, "operation=ajax_recuperar_productos&CVALOR=" + valor, this, objJsMessages.jslit_actualizando_registro);
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
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea041" c="SPRODUC" lit="100829"/> -", modelocombo, 0);
                          for (i = 0;i < elementos.length;i++) {
                              var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("SPRODUC")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("SPRODUC"), 0, 0) : "";
                              var desc = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TTITULO")[0]) ? objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TTITULO"), 0, 0) : "";
                              objDom.addOpcionACombo(codigo, desc, modelocombo, i + 1);
                          }

                      }
                      if (elementos.length == 0) {
                          var versioncombo = document.miForm.SPRODUC;
                          objDom.borrarOpcionesDeCombo(versioncombo);
                          objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", "- <axis:alt f="axisrea041" c="SPRODUC" lit="100829"/> -", versioncombo, 0);
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
    <body  onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea041" c="TITULO" lit="9906707"/></c:param>
                <c:param name="titulo"><axis:alt f="axisrea041" c="TITULO" lit="9906707"/></c:param> 
                <c:param name="form">axisrea041</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea042|<axis:alt f="axisrea042" c="LIT_MODAL_AXISREA042" lit="9906707" /></c:param>
            </c:import>
            
            <input type="hidden" name="operation" value=""/> 
            
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                              <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea041" c="SCONTRA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea041" c="SCONTRA" lit="9001894"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea041" c="NVERSIO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea041" c="NVERSIO" lit="9001146"/></b>
                                        </td>
                                        </axis:ocultar>
                                       <axis:ocultar f="axisrea041" c="CTRAMO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea041" c="CTRAMO" lit="9000609"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>  
                                    <tr>
                                          <td class="campocaja">
                                                <input id="SCONTRA" name="SCONTRA" type="text" class="campo campotexto" 
                                                       style="width:90%"
                                                       title=<axis:alt f="axisrea041" c="SCONTRA" lit="9001894" />
                                                       alt=<axis:alt f="axisrea041" c="SCONTRA" lit="9001894"/> 
                                                       value="${__formdata.SCONTRA}"
                                                       <axis:atr f="axisrea041" c="SCONTRA" a="modificable=true&obligatorio=false"/>/>
                                          </td>
                                          <td class="campocaja">
                                                <input id="NVERSIO" name="NVERSIO" type="text" class="campo campotexto" 
                                                       style="width:90%"
                                                       title=<axis:alt f="axisrea041" c="NVERSIO" lit="9001146" />
                                                       alt=<axis:alt f="axisrea041" c="NVERSIO" lit="9001146"/> 
                                                       value="${__formdata.NVERSIO}"
                                                       <axis:atr f="axisrea041" c="NVERSIO" a="modificable=true&obligatorio=false"/>/>
                                          </td>
                                          <td class="campocaja">
                                                <input id="CTRAMO" name="CTRAMO" type="text" class="campo campotexto" 
                                                       style="width:90%"
                                                       title=<axis:alt f="axisrea041" c="CTRAMO" lit="9000609" />
                                                       alt=<axis:alt f="axisrea041" c="CTRAMO" lit="9000609"/> 
                                                       value="${__formdata.CTRAMO}"
                                                       <axis:atr f="axisrea041" c="CTRAMO" a="modificable=true&obligatorio=false"/>/>
                                          </td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea041" c="CRAMO">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea041" c="CRAMO" lit="100784"/></b>
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea041" c="SPRODUC">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea041" c="SPRODUC" lit="9902909"/></b>
                                        </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:visible c="CRAMO" f="axisrea041">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="CRAMO" name="CRAMO" 
                                                        size="1" style="width:90%"   
                                                        title="<axis:alt f="axisrea041" c="CRAMO" lit="100784"/>"
                                                        onchange="f_llenar_productos(this.value)" >
                                                    <option value="null"> - <axis:alt f="axisrea041" c="CRAMO_VALOR" lit="100784"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTRAMOS}" var="item">
                                                        <option value="${item.CRAMO}" <c:if test="${item.CRAMO  == __formdata.CRAMO}">selected</c:if>>
                                                            ${item.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:visible>
                                        <axis:visible c="SPRODUC" f="axisrea041">
                                            <td class="campocaja">
                                                <select class="campowidthselect campo campotexto" id="SPRODUC" name="SPRODUC" 
                                                        size="1" style="width:90%"   
                                                        title="<axis:alt f="axisrea041" c="SPRODUC" lit="100829"/>"
                                                        onchange="f_llenar_actividades(this.value)">
                                                    <option value="null"> - <axis:alt f="axisrea041" c="SPRODUC_VALOR" lit="100829"/> - </option>
                                                    <c:forEach items="${__formdata.LSTVALORES.LSTPRODUCTOS}" var="item">
                                                        <option value="${item.SPRODUC}" <c:if test="${item.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>
                                                            ${item.TTITULO}
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
                            <axis:visible f="axisrea041" c="SCONTRA">
                                <td class="titulocaja" colspan="4">
                                   <div class="titulo">
                                   <img src="images/flecha.gif"/><axis:alt f="axisrea041" c="LIT_LIST_CTTO" lit="9000745"/>
                                   </div>     
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <axis:visible f="axisrea041" c="ALTA_FORMULA">
                                        <a href="javascript:f_nuevo_axisrea042('ALTA')">
                                        <img style="float:right;" border="0" 
                                             alt="<axis:alt f="axisrea041" c="ALT_IMG_NUEVO" lit="9001816"/>" 
                                             title="<axis:alt f="axisrea041" c="ALT_IMG_NUEVO_OS" lit="9001816"/>" 
                                             src="images/new.gif"/>
                                        </a>
                                    </axis:visible>
                                </td>
                            </axis:visible>
                            </tr>
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisrea041" c="NVERSIO" lit="9001146"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisrea041" c="SCONTRA" lit="9001894"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisrea041" c="CTRAMO" lit="9000609"/></c:set>
                                    <c:set var="title3"><axis:alt f="axisrea041" c="CRAMO" lit="100784"/></c:set>
                                    <c:set var="title4"><axis:alt f="axisrea041" c="ID" lit="100785"/></c:set>
                                    <c:set var="title5"><axis:alt f="axisrea041" c="SPRODUC" lit="9902909"/></c:set>
                                    <c:set var="title6"><axis:alt f="axisrea041" c="PORCEN" lit="101467"/></c:set>
                                    <c:set var="title7"><axis:alt f="axisrea041" c="ALT_MODIFICAR" lit="9000552"/></c:set> 
                                    <c:set var="title8"><axis:alt f="axisrea041" c="ALT_BORRAR" lit="9001333"/></c:set> 
                                <div class="seccion displayspaceMaximo">
                                 <display:table name="${__formdata.T_IAX_CTTO_TRAMO_PRODUCTO}" id="cttoTramoProdId" 
                                    export="false" class="dsptgtable" pagesize="-1"  sort="list" 
                                    cellpadding="0" cellspacing="0" requestURI="" >
                                    <%@ include file="../include/displaytag.jsp"%>
                                    
                                         <axis:visible f="axisrea041" c="SCONTRA">
                                            <display:column title="${title1}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.SCONTRA"
                                                            style="width:20%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.SCONTRA} 
                                                                     ${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.DESCCONTRA}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="NVERSIO">
                                            <display:column title="${title0}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.NVERSIO"
                                                            style="width:10%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.NVERSIO}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="CTRAMO">
                                            <display:column title="${title2}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.CTRAMO"
                                                            style="width:20%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.CTRAMO}
                                                                     ${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.DESCTRAMO}</div>
                                            </display:column>   
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="CRAMO">
                                            <display:column title="${title3}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.CRAMO"
                                                            style="width:20%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.CRAMO} 
                                                                     ${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.DESCRAMO}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="SPRODUC">
                                            <display:column title="${title5}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.SPRODUC"
                                                            style="width:20%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.SPRODUC}
                                                                     ${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.DESCPRODUCTO}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="PORCEN">
                                            <display:column title="${title6}" sortable="true" 
                                                            headerClass="sortable" media="html" autolink="false" 
                                                            sortProperty="OB_IAX_CTTO_TRAMO_PRODUCTO.PORCEN"
                                                            style="width:10%">
                                                <div class="dspText">${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.PORCEN}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="BT_EDIT">
                                                <display:column title="${title7}" sortable="true" 
                                                                sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" 
                                                                headerClass="headwidth5 sortable fixed"  
                                                                media="html" autolink="false" 
                                                                style="width:15px">                                    
                                                    <div class="dspIcon"><a href="javascript:f_modif_axisrea042('${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.ID}',
                                                                                                                '${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.SCONTRA}',
                                                                                                                '${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.NVERSIO}',
                                                                                                                '${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.CRAMO}');">
                                                        <img border="0" alt="<axis:alt f="axisrea041" c="ALT_IMG_ISCONTA_DOS" lit="9000552"/>" title="<axis:alt f="axisrea041" c="ALT_ISONTA_LIT_DP" lit="9000552"/>" src="images/lapiz.gif"/></a> 
                                                    </div>
                                                </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisrea041" c="BT_BORRAR">
                                            <display:column title="${title8}" sortable="true" 
                                                            sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" 
                                                            headerClass="headwidth5 sortable fixed"  
                                                            media="html" autolink="false" 
                                                            style="width:100%">                                    
                                                <div class="dspIcon"><a href="javascript:f_borrar_porcen('${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.ID}', 
                                                                                                          '${cttoTramoProdId.OB_IAX_CTTO_TRAMO_PRODUCTO.SCONTRA}');">
                                                    <img border="0" alt="<axis:alt f="axisrea041" c="ALT_IMG_ISCONTA_REL" lit="9001333"/>" title="<axis:alt f="axisrea041" c="ALT_ISONTA_LIT_DR" lit="9001333"/>" src="images/delete.gif"/></a> 
                                                </div>
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
                <c:param name="f">axisrea041</c:param>
                <c:param name="__botones">salir,buscar,9904040</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>