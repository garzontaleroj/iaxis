<%-- 
*  Fichero: axisrea035.jsp
*  Alta/Mod. Asociación de fórmulas a Contratos
*  Fecha: 12/08/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

         function f_onload_axisrea035() {
            var grabaOk = '${__formdata.grabaOK}';
            var mantenimiento = '${__formdata.mantenimiento}';
             //(grabaOk==1 || grabaOk=='1')
            if((mantenimiento == 0 || mantenimiento=='0') && (grabaOk==1 || grabaOk=='1')){
                parent.f_cerrar_axisrea035($('#CCODIGO').val());
            }else{
                f_cargar_propiedades_pantalla();
            }
            
            
            <c:if test="${__formdata.mantenimiento != 0 && empty __formdata.CCODIGO }">  
                    f_abrir_axisrea034();
            </c:if>
         }
         
               
         function f_but_aceptar() {
            if (objValidador.validaEntrada()) { 
                    f_grabar_datos();
            }
         }
        
         function f_but_cancelar() { 
               //objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea035", "cancelar", document.miForm, "_self");
               var mantenimiento = "${__formdata.mantenimiento}";
               if(mantenimiento == 0){
                   
                     
                     //si es nuevo, borramos todo y nos vamos por el callback
                     if($('#modifRepos').val()=='0'){
                        objAjax.invokeAsyncCGI("axis_axisrea035.do", callbackAjaxCancelar, "operation=delete_reposiciones&CCODIGO=" + $('#CCODIGO').val(), this, objJsMessages.jslit_cargando, false);
                     }else{
                         //Si editamos
                        parent.f_cerrar_axisrea035($('#CCODIGO').val());
                     }
               }else{
                    objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea035", "cancelar", document.miForm, "_self");
               }
              
         }    
         
         function callbackAjaxCancelar(){
            parent.f_cerrar_axisrea035();
         }
        
         function f_actualitza_plocal()
         {      
                f_cargar_propiedades_pantalla();
                var CTRAMO = objDom.getValorPorId("CTRAMO");   
         }
         
         function f_actualiza_number(CAMPON){                                             
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroCero(objDom.getValorPorId(CAMPON),true));
         }       
         
         /* ************************************   *********************************** */
         /* *********************************************************************************************** */
         
         function f_grabar_datos() {

         objUtiles.ejecutarFormulario("axis_axisrea035.do", "guardar", document.miForm, "_self");
        }        
            
        
         
         /* ************************************ MODAL 034 ***************************************/
        function f_abrir_axisrea034() {
                objUtiles.abrirModal("axisrea034", "src", "modal_axisrea034.do?operation=form");  
        }
            
        function f_cerrar_axisrea034(CCODIGO,MODO,SCONTRA,NVERSIO) {
                objUtiles.cerrarModal('axisrea034');
                document.miForm.CCODIGO.value=CCODIGO;
                document.miForm.MODO.value=MODO;
                
                $('#SCONTRA').val(SCONTRA);
                $('#NVERSIO').val(NVERSIO);
                objUtiles.ejecutarFormulario("axis_axisrea035.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                
        }   
   
        function f_cancelar_axisrea034(){
                objUtiles.cerrarModal('axisrea034');
        }
       
        /* ************************************ MODAL 036 ***************************************/
        function f_abrir_axisrea036(MODO) {
             if (objValidador.validaEntrada()) {
               objUtiles.abrirModal("axisrea036", "src", "modal_axisrea036.do?operation=form&MODO="+MODO+"&CCODIGO="+document.miForm.CCODIGO.value+"&DESCRIPCION="+document.miForm.DESCRIPCION.value+"&CTRAMO="+$('#CTRAMO').val()+"&SCONTRA="+$('#SCONTRA').val()+"&NVERSIO="+$('#NVERSIO').val()+"&deletedRepos="+$('#deletedRepos').val());  
             }
        }
        
        function f_modificar_axisrea036(CCODIGO,NORDEN,MODO,CAPACIDAD,TASA) {
            if (objValidador.validaEntrada()) {
                DESCRIPCION = document.miForm.DESCRIPCION.value;
               objUtiles.abrirModal("axisrea036", "src", "modal_axisrea036.do?operation=form&MODO="+MODO+"&CCODIGO="+CCODIGO+"&ORDEN="+NORDEN+"&DESCRIPCION="+DESCRIPCION+"&CAPACIDAD="+CAPACIDAD+"&TASA="+TASA+"&deletedRepos="+$('#deletedRepos').val());  
            }   
        }
        
        function f_cerrar_axisrea036(codigo,deletedRepos) {
                objUtiles.cerrarModal('axisrea036');
                $('#CCODIGO').val(codigo);
                $('#deletedRepos').val(deletedRepos);
                objUtiles.ejecutarFormulario("axis_axisrea035.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }   
        
        function f_aceptar_axisrea036() {
               f_cerrar_axisrea036();   
               //objUtiles.ejecutarFormulario("modal_axisrea035.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_delete_axisrea036(CCODIGO,NORDEN) {  
                
                document.miForm.CCODIGO_DEL.value = CCODIGO;
                document.miForm.NORDEN_DEL.value = NORDEN;
                if(confirm("<axis:alt f='axisrea035' c='CONFIRM_TRAMO' lit='1000167'/>")){
                    
                    //Ahora no eliminamos, simplemente filtramos
                   var deletedRepos = $('#deletedRepos');
                   if(objUtiles.estaVacio(deletedRepos.val())){
                        deletedRepos.val(NORDEN);
                   }else{
                        deletedRepos.val(deletedRepos.val()+','+NORDEN);
                   }
                    objUtiles.ejecutarFormulario("axis_axisrea035.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                    //objUtiles.ejecutarFormulario("modal_axisrea035.do", "borrar_detalle_reposicion", document.miForm, "_self", objJsMessages.jslit_cargando);
                  }
         }

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea035()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <!--form name="axisrea031Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea035.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" name="mantenimiento" id="mantenimiento" value="${__formdata.mantenimiento}"/>
        <input type="hidden" name="CCODIGO_DEL" id="CCODIGO_DEL" value="${__formdata.CCODIGO}"/>
        <input type="hidden" name="NORDEN_DEL" id="NORDEN_DEL" value="${__formdata.NORDEN}"/>
        <input type="hidden" name="CTRAMO" id="CTRAMO" value="${__formdata.CTRAMO}"/>
        <input type="hidden" name="NVERSIO" id="NVERSIO" value="${__formdata.NVERSIO}"/>
         <input type="hidden" name="SCONTRA" id="SCONTRA" value="${__formdata.SCONTRA}"/>
        <input type="hidden" name="deletedRepos" id="deletedRepos" value="${__formdata.deletedRepos}"/>
        <input type="hidden" name="modifRepos" id="modifRepos" value="${__formdata.modifRepos}"/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea035" c="LIT_NOMBRE_PANTALLA" lit="9902275" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea035" c="ALT_NOMBRE_PANTALLA" lit="9902275" /></c:param>
            <c:param name="form">axisrea035</c:param>
        </c:import>
        <!-- Pantallas modales -->
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea034|<axis:alt f="axisrea035" c="LIT_MODAL_AXISREA034" lit="9902193" /></c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea036|<axis:alt f="axisrea035" c="LIT_MODAL_AXISREA036_1" lit="9000570" />&nbsp;<axis:alt f="axisrea035" c="LIT_MODAL_AXISREA036_2" lit="9902193" /></c:param>
        </c:import>
        <!-- Area de campos  -->
         <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                <div class="titulo"><img src="images/flecha.gif"/>&nbsp;<axis:alt f="axisrea027" c="LIT_BUSC_AGRUP" lit="9902275"/>&nbsp;&nbsp;<c:if test="${__formdata.mantenimiento == 1}"><img border="0" onclick="f_abrir_axisrea034();" alt="<axis:alt f="axisrea035" c="ALT_IMG_NUEVO_DET" lit="9001816"/>" title="<axis:alt f="axisrea035" c="ALT_IMG_NUEVO_DET" lit="9001816"/>" src="images/find.gif"/></c:if></div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion">
                    <tr>
                      <td>
                
                
                
                <!-- TRAMOS -->
                        <table class="area">

                                                <tr>
                                                        <th style="width:33%;height:0px"></th>                                            
                                                        <th style="width:33%;height:0px"></th>
                                                        <th style="width:33%;height:0px"></th>
                                           
                                                </tr>
                                                <tr>
                                                         <axis:ocultar f="axisrea035" c="NREPOSICION" dejarHueco="false"><!-- Nº REPOSICION -->
                                                            <td class="titulocaja" colspan="1"><b id="label_NREPOSICION"><axis:alt f="axisrea035" c="LIT_NREPOSICION" lit="9902289"/></b></td>
                                                         </axis:ocultar>
                                                         <axis:ocultar f="axisrea035" c="DESCRIPCION" dejarHueco="false"><!-- DESCRIPCION -->
                                                            <td class="titulocaja" colspan="2"><b id="label_DESCRIPCION"><axis:alt f="axisrea035" c="LIT_DESCRIPCION" lit="100588"/></b></td>
                                                         </axis:ocultar>
                                                        
                                                </tr>
                                                <tr>
                                                              <axis:ocultar f="axisrea035" c="CCODIGO" dejarHueco="false">
                                                                   <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                        <input type="text" class="campo campotexto"  id="CCODIGO" name="CCODIGO" style="width:80%"
                                                                        value="${__formdata.POBJ_REPOSICION.CCODIGO}"  <axis:atr f="axisrea035" c="CCODIGO" a="modificable=false"/>/>
                                                                   </td>
                                                              </axis:ocultar>
                                                               <axis:ocultar f="axisrea035" c="DESCRIPCION" dejarHueco="false">
                                                                   <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                        <input type="text" class="campo campotexto"  obligatorio="true" id="DESCRIPCION" name="DESCRIPCION" style="width:90%"
                                                                        value="${__formdata.POBJ_REPOSICION.TDESCRIPCION}" <axis:atr f="axisrea035" c="DESCRIPCION" a="modificable=true"/>/>
                                                                   </td>
                                                              </axis:ocultar>
                                                </tr>
                                                 <tr>
                                                         <axis:ocultar f="axisrea035" c="SCONTRA" dejarHueco="false"><!-- Nº REPOSICION -->
                                                            <td class="titulocaja" colspan="1"><b id="label_CONTRAT"><axis:alt f="axisrea035" c="LIT_CONTRAT" lit="101945"/></b></td>
                                                         </axis:ocultar>

                                                         <axis:ocultar f="axisrea035" c="NVERSIO" dejarHueco="false"><!-- DESCRIPCION -->
                                                            <td class="titulocaja" colspan="2"><b id="label_NVERSIO"><axis:alt f="axisrea035" c="LIT_NVERSIO" lit="9001146"/></b></td>
                                                         </axis:ocultar>
                                                       
                                                </tr>
                                                <tr>
                                                              <axis:ocultar f="axisrea035" c="SCONTRA" dejarHueco="false">
                                                                   <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                        <select name="SCONTRA" id="SCONTRA" size="1" disabled  class="campowidthselect campo campotexto"  
                                                                        <axis:atr f="axisrea035" c="SCONTRA" a="modificable=false"/>  
                                                                       
                                                                            title="<axis:alt f='axisrea037' c='SCONTRA' lit='101945'/>">                               
                                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea035" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
                                                                                    <c:forEach var="element" items="${__formdata.listaContrato}">
                                                                                        <option value = "${element.SCONTRA}" 
                                                                                        <c:if test="${element.SCONTRA == __formdata.SCONTRA}"> selected </c:if> >
                                                                                         ${element.SCONTRA} - ${element.TDESCRIPCION} 
                                                                                        </option>
                                                                                    </c:forEach>
                                                                            </select> 
                                                                   </td>
                                                              </axis:ocultar>
                                                               <axis:ocultar f="axisrea035" c="NVERSIO" dejarHueco="false">
                                                                   <td class="campocaja" colspan="1"> <!-- CODIGO -->
                                                                       <select name="NVERSIO" id="NVERSIO" size="1" disabled
                                                                        class="campowidthselect campo campotexto"  
                                                                        <axis:atr f="axisrea035" c="NVERSIO" a="modificable=false"/>  
                                                                        style="width:90%;"
                                                                            title="<axis:alt f='axisrea035' c='NVERSIO' lit='9001146'/>">                               
                                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea035" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>                                                                                
                                                                                <c:forEach var="element" items="${__formdata.listaVersion}">
                                                                                    <option value = "${element.NVERSIO}" 
                                                                                    <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                                                     ${element.NVERSIO} - ${element.TCONTRA} 
                                                                                    </option>
                                                                                </c:forEach>
                                                                                <c:if test="${!empty __formdata.newNVERSIO}">
                                                                                    <option value = "${__formdata.newNVERSIO}" selected>${__formdata.newNVERSIO}</option>
                                                                                </c:if>
                                                                            </select> 
                                                                   </td>
                                                              </axis:ocultar>
                                                </tr>
                                                <tr>
                                                        <td colspan="3">
                                                        <!-- **************************** PRIMERA LISTA *****************************-->
                                                        <table class="area" align="left"> <!-- Detalle Reposiciones -->
                                                            
                                                            <tr>
                                                            <td>
                                                                <c:if test="${__formdata.mantenimiento == 0}">
                                                                    <axis:visible f="axisrea035" c="ALTA_REP">
                                                                                   <a href="javascript:f_abrir_axisrea036('ALTA_MOD')"><img style="float:right;" border="0" alt="<axis:alt f="axisrea031" c="ALT_IMG_NUEVO_DESC" lit="9000422"/>" title="<axis:alt f="axisrea031" c="ALT_IMG_NUEVO_OP" lit="9002223"/>" src="images/new.gif"/></a>
                                                                    </axis:visible>
                                                                </c:if>
                                                            </td>
                                                       
                                                            </tr>
                                                        
                                                            <tr>
                                                              <td>
                                                                <c:set var="title1"><axis:alt f="axisrea035" c="ALT_TRAMO" lit="9902289"/></c:set>  <%-- Nº Reposición --%>
                                                                <c:set var="title2"><axis:alt f="axisrea035" c="ALT_NRODEN" lit="500102"/></c:set>   <%-- Orden --%>
                                                                <c:set var="title3"><axis:alt f="axisrea035" c="ALT_BORDERO" lit="9000602"/></c:set>   <%-- Capacidad --%>
                                                                <c:set var="title4"><axis:alt f="axisrea035" c="ALT_IMPTRAMO" lit="9902290"/></c:set>   <%-- %Tasa --%>
                                                                <c:if test="${__formdata.mantenimiento == 0}">
                                                                    <c:set var="title5"><axis:alt f="axisrea035" c="ALT_BORRAR" lit="9001333"/></c:set>   <%-- Borrar --%>
                                                                    <c:set var="title6"><axis:alt f="axisrea035" c="ALT_MODIF" lit="9000552"/></c:set>   <%-- Modificar --%>
                                                                </c:if>
                                                                <div class="displayspace" id="dt_tramos">
                                                                  <display:table name="${__formdata.POBJ_REPOSICION.CDETALLE}" id="T_IAX_DET_REPOS" export="false" class="dsptgtable" 
                                                                  pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                  requestURI="modal_axisrea035.do?operation=form&paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                                                                       
                                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REPOSICIONES_DET.ORDEN" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText">${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.NORDEN}</div>
                                                                    </display:column>
                                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REPOSICIONES_DET.CAPACIDAD" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText"><fmt:formatNumber pattern='##.##' value='${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.ICAPACIDAD}' /></div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_REPOSICIONES_DET.TASA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                                                      <div class="dspText"><fmt:formatNumber type='number' maxFractionDigits='10' minFractionDigits= '2' value='${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.PTASA}' /></div>
                                                                    </display:column>
                                                                   
                                                                   <c:if test="${__formdata.mantenimiento == 0}">
                                                                        <display:column title="${title6}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspIcon"><a href="javascript:f_modificar_axisrea036('${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.CCODIGO}','${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.NORDEN}','MOD','${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.ICAPACIDAD}','<fmt:formatNumber type='number' maxFractionDigits='10' minFractionDigits= '2' value='${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.PTASA}' />');"><img border="0" alt="<axis:alt f="axisrea035" c="ALT_IMG_ISCONTA_DET" lit="9000552"/>" title="<axis:alt f="axisrea035" c="ALT_ISONTA_LIT_DET" lit="9000552"/>" src="images/lapiz.gif"/></a> </div>
                                                                        </display:column>
                                                                        <display:column title="${title5}" sortable="true"  headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                                          <div class="dspIcon"><a href="javascript:f_delete_axisrea036('${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.CCODIGO}','${T_IAX_DET_REPOS.OB_IAX_REPOSICIONES_DET.NORDEN}');"><img border="0" alt="<axis:alt f="axisrea035" c="ALT_IMG_ISCONTA" lit="9001333"/>" title="<axis:alt f="axisrea035" c="ALT_ISONTA_LIT" lit="9001333"/>" src="images/delete.gif"/></a> </div>
                                                                        </display:column>
                                                                    </c:if>

                                                                  </display:table>                                                                                                    
                                                                </div>  
                                                              </td>
                                                            </tr>
                                                        </table>
                                                        </td>
                                                   </tr>
                                              
                                                  
            
                            </table>
                            
                         </td>
                    </tr>
                  </table>  <!-- Fin de table seccion -->         
                            
               </td>
            </tr>
        </table> <!-- FIN TABLA BASE -->
        <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:if test="${__formdata.mantenimiento == 1}">
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea035</c:param><c:param name="f">axisrea035</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
        </c:if>
                
        <c:if test="${__formdata.mantenimiento == 0}">
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea035</c:param><c:param name="f">axisrea035</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </c:if>
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
    
   </body>
</html>