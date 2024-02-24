<%/*
*  Fichero: axisadm098.jsp
*  
*  Fecha: 24/11/2015
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
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
        <title>
            <axis:alt f="axisadm098" c="LIT_CONS_REC" lit="9908587"/>
        </title>
        <%-- CONSULTA DE RECIBOS--%>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
        <c:import url="../include/carga_framework_js.jsp"/>
        <script type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/

          /****************************************************************************************/

          function f_onload() {
              f_cargar_propiedades_pantalla();
              var flagsalir="${__formdata.FLAGSALIR}";
              if(flagsalir=="OPEN" || objUtiles.estaVacio(flagsalir)){
                   f_abrir_modal("axisadm097",true);
                   document.getElementById("FLAGSALIR").value="CLOSE";
               }
          }
          
         function f_buscarTransferencias(VCAGENTE){
            if (!objUtiles.estaVacio(VCAGENTE)){
                f_cerrar_modal("axisadm097")
                objDom.setValorPorId("CAGENTE",VCAGENTE);
                objUtiles.ejecutarFormulario ("axis_axisadm098.do", "buscarTransferencias", document.miForm, "_self", objJsMessages.jslit_cargando);
            }else{
            alert(objJsMessages.jslit_buscador_agentes_vacio)
            }
          }
          
          function f_abrir_axisadm097(){
            objUtiles.abrirModal("axisadm097","src","modal_axisadm097.do?operation=init&PARAMS=");
          }
          function f_seleccionar_transferencia(PSCLAVE){
            objDom.setValorPorId("SCLAVE",PSCLAVE);
          }

          function f_but_cancelar() {
             if (!objUtiles.estaVacio(document.getElementById("SCLAVE").value)){
                objUtiles.ejecutarFormulario ("axis_axisadm098.do", "cancelarTransferencia", document.miForm, "_self", objJsMessages.jslit_cargando);
             }else {
                alert("<axis:alt f="axisadm098" c="MENSAJE1" lit="9908594"/>");
             }
          }
          
          function f_but_9001576(){ // desbloquear
            if (!objUtiles.estaVacio(document.getElementById("SCLAVE").value)){ 
                objUtiles.ejecutarFormulario ("axis_axisadm098.do", "desbloquearTransferencia", document.miForm, "_self", objJsMessages.jslit_cargando);
            }else {
                alert("<axis:alt f="axisadm098" c="MENSAJE1" lit="9908594"/>");
             }
          }

          function f_but_salir() {
              // Borrar parámetros de session en servidor
              objAjax.invokeAsyncCGI("axis_axisadm002.do", callbackCancelar, "operation=salir", this);
          }

          function callbackCancelar() {
              var isModal = "${__formdata.isModal}";
              if (objUtiles.estaVacio(isModal) || isModal == 0) {
                  objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisadm002", "cancelar", document.miForm, "_self");
              }
              else {
                  if (isModal == 1) {
                      parent.f_cerrar_axisadm002();
                  }
              }
          }
          
      /****************************************************************************************/
     /************************************** MODAL *******************************************/
    /****************************************************************************************/
         function f_abrir_modal(cual, noXButton, optionalQueryString) {
            var SSEGURO = document.miForm.SSEGURO.value;
            if (noXButton)
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
				objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form");        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            //objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea045", "cancelar", document.miForm, "_self");
        }

          /****************************************************************************************/
          /************************************** MODAL *******************************************/

          /****************************************************************************************/

          function f_abrir_modal(cual, noXButton, optionalQueryString) {
              if (objUtiles.estaVacio(optionalQueryString))
                  optionalQueryString = "";

              if (noXButton)
                  objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
              objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");
              objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);
          }

          function f_cerrar_modal(cual) {
              objUtiles.cerrarModal(cual);
          }
          /************   Funciones informacion Otros   *****************/
          function ocultar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
          } 

            function mostrar(nombreCapa,nombreDIV){
                objUtiles.scrollPoll(nombreCapa,nombreDIV);
            } 

            function mostrarContent(contentFrame,NRECIBO,NSINIES,SIDEPAG,NREEMB,NFACT,NRENTAS,ITASA) {
                var cad = "";
                var layer = document.getElementById(contentFrame);
            
                cad += '                                                                        <!-- INICIO SECCION -->\n';
                cad += '                                                                        <table class="area" align="center">\n';
                cad += '                                                                             <tr>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                                <th style="width:25%;height:0px"></th>\n';
                cad += '                                                                             </tr>\n';
                if (NRECIBO != '') {
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                <%-- Rebut --%>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NRECIBO" lit="100895"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- Rebut --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NRECIBO + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                             </tr>\n';
                }
                if (NSINIES != '' || SIDEPAG != '') {
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                                <%-- Sinistre --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NSINIES" lit="101298"/></b>\n';
                    cad += '                                                                                </td>   \n';
                    cad += '                                                                                 <%--Pagament --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="SIDEPAG" lit="103463"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                        </tr>\n';
                    cad += '                                                                        <tr>\n';
                    cad += '                                                                             <%-- NSINIES --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NSINIES + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- SIDEPAG --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO3" name="CAMPO3" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + SIDEPAG + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                        </tr>\n';
                }
                if (NRENTAS != '') {
                    cad += '                                                                            <tr> \n';                                                                           
                    cad += '                                                                                <%-- Rendes --%>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NRENTAS" lit="109005"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- NRENTA --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO4" name="CAMPO4" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NRENTAS + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                }
                if (NREEMB != '' || NFACT != '') {
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NREEMB" lit="9000433"/></b>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                <%-- nfact --%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" >\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NFACT" lit="9000469"/></b>\n';
                    cad += '                                                                                </td>  \n';
                    cad += '                                                                                 <%-- linea--%>\n';
                    cad += '                                                                                 <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">\n';
                    cad += '                                                                                    <b><axis:alt f="axisadm039" c="NLINEA" lit="9001727"/></b>\n';
                    cad += '                                                                                </td> \n';
                    cad += '                                                                            </tr>\n';
                    cad += '                                                                            <tr>\n';
                    cad += '                                                                                 <%-- NREEMB --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NREEMB + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                                 <%-- nfact --%>\n';
                    cad += '                                                                                <td class="campocaja" style="background-color:white;border-right-width: 0px;">\n';
                    cad += '                                                                                    <input type="text" class="campo campotexto" id="CAMPO2" name="CAMPO2" size="15" style="width:90%"\n';
                    cad += '                                                                                    value="' + NFACT + '" readonly="readonly"/>\n';
                    cad += '                                                                                </td>\n';
                    cad += '                                                                            </tr>\n';
                }
                cad += '                                                                            </table> \n';
                
                layer.innerHTML = cad;
            }
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
         
        <form name="miForm" action="" method="POST">
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axisadm098" c="TITULO" lit="9908587"/>
                </c:param>
                <%-- CONSULTA DE TRANSFERENCIAS--%>
                <c:param name="formulario">
                    <axis:alt f="axisadm098" c="FORMULARIO" lit="9908587"/>
                </c:param>
                <%-- CONSULTA DE TRANSFERENCIAS--%>
                <c:param name="form">axisadm098</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisadm097</c:param>
            </c:import>
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="FLAGSALIR" id="FLAGSALIR" value="${__formdata.FLAGSALIR}"/>
            <input type="hidden" name="SCLAVE" id="SCLAVE" value="${__formdata.SCLAVE}"/>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">                
                <tr>
                    <td class="campocaja" colspan="5">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisadm039" c="TRANSF" lit="9908589"/>
                             
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisadm097()"
                                 style="cursor:pointer"/>
                        </div>
                        <c:set var="title0">
                            <axis:alt f="axisadm098" c="PPRODUCTO" lit="100829"/>/<axis:alt f="axisadm098" c="PAGENTE" lit="100584"/>
                        </c:set>
                         
                        <c:set var="title1">
                            <axis:alt f="axisadm098" c="NPOLIZA" lit="100836"/>
                        </c:set>
                         
                        <c:set var="title2">
                            <axis:alt f="axisadm098" c="TCONCEPTE" lit="9000715"/>
                        </c:set>
                         
                        <c:set var="title3">
                            <axis:alt f="axisadm098" c="FABONO" lit="9001861"/>
                        </c:set>
                         
                        <c:set var="title4">
                            <axis:alt f="axisadm098" c="PAGENTE" lit="100584"/>
                        </c:set>
                         
                        <c:set var="title5">
                            <axis:alt f="axisadm098" c="CABONO" lit="9001849"/>
                        </c:set>
                         
                        <c:set var="title6">
                            <axis:alt f="axisadm098" c="IIMPORT" lit="100563"/>
                        </c:set>
                         
                        <c:set var="title7">
                            <axis:alt f="axisadm098" c="OTROS" lit="1000310"/>
                        </c:set>
                         
                        <% int contador = 0;%>
                        <div class="displayspaceGrande" id="TRANSF">
                            <display:table name="${__formdata.transferenciasRetenidas}" id="miListaId" style="width:98%;"
                                           export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0"
                                           cellspacing="0" requestURI="axis_axisadm098.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable"
                                                                title=""
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspIcons">
                                                        <!--input value="${miListaPolizas['NPOLIZA']}/${miListaPolizas['NCERTIF']}/${miListaPolizas.NSINIES}" -->
                                                        <input type="radio" onclick="f_seleccionar_transferencia(${miListaId['SCLAVE']});"
                                                               id="btnradiotransferencia"
                                                               name="btnradiotransferencia"/>
                                                    </div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" 
                                                sortProperty="TTITULO" headerClass="sortable fixed" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        ${miListaId['TTITULO']}
                                    </div>
                                </display:column>
                                <display:column title="${title1}" sortable="true"
                                                sortProperty="NPOLIZA" headerClass="sortable fixed" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        ${miListaId['NPOLIZA']}
                                    </div>
                                </display:column>
                                <display:column title="${title3}" sortable="true"
                                                sortProperty="FABONO" headerClass="sortable fixed" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FABONO}"/>
                                    </div>
                                </display:column>
                                <display:column title="${title5}" sortable="true"
                                                sortProperty="CABONO" headerClass="sortable fixed" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        <axis:masc f="axisadm098" c="CABONO" value="${miListaId.CABONO}"/>
                                    </div>
                                </display:column>
                                <display:column title="${title6}" sortable="true"
                                                sortProperty="IIMPORT" headerClass="sortable fixed" media="html"
                                                autolink="false">
                                    <div class="dspText">
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}"
                                                          value="${miListaId.IIMPORT}"/>
                                    </div>
                                </display:column>                                                              
                                <axis:visible f="axisadm098" c="OTROS">
                                    <display:column title="${title7}" sortable="false"
                                                    headerClass="sortable fixed" media="html" autolink="false">
                                        <div class="dspIcons">
                                            <a href="javascript:void(0)"
                                               onmouseout="ocultar('SECCION_B${miListaId['SCLAVE']}');"
                                               onmouseover="javascript:mostrar('SECCION_B${miListaId['SCLAVE']}','TRANSF');mostrarContent('SECCION_B${miListaId['SCLAVE']}', '${miListaId['NRECIBO']}', '${miListaId['NSINIES']}', '${miListaId['SIDEPAG']}', '${miListaId['NREEMB']}', '${miListaId['NFACT']}', '${miListaId['NRENTAS']}', '${miListaId['ITASA']}');">
                                                <img border="0"
                                                     alt='&lt;axis:alt f="axisadm098" c="INFO" lit="100002"/>'
                                                     title="${title7}" src="images/informacion.gif" width="11px"
                                                     height="11px" style="cursor:pointer;"/></a>
                                        </div>
                                    </display:column>
                                </axis:visible>
                                <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                <display:column class="seccion_informacion">
                                  <div id="SECCION_B${miListaId['SCLAVE']}" class="seccion_informacion"></div>
                                </display:column>
                                <%contador++;%>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisadm098</c:param>
                <c:param name="__botones">
                    salir,cancelar,9001576 
                </c:param>
            </c:import>
        </form>
         
        <c:import url="../include/mensajes.jsp"/>
    </body>
</html>