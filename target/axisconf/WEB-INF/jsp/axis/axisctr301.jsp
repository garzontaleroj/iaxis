<%--
  Fichero: axisctr301.jsp
  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>

  Fecha: 29/11/2007
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>  
        <c:import url="../include/carga_framework_js.jsp" />
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 100px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en funci�n del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script type="text/javascript" src="scripts/jsFecha.js"></script>
        <!--*********************************** -->
        <script type="text/javascript">
        
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            function f_onload(){            

                var missatge = document.miForm.MISSATGE.value;
                f_cargar_propiedades_pantalla(); 
                                
                <c:if test="${empty __formdata['SSEGURO'] || empty datos_poliza}" >
                    f_abrir_axisctr019();
                </c:if>
               
 
                if (!objUtiles.estaVacio (missatge)){
                    objAppMensajes.pintarMensajePantalla(missatge, "info"); 
                    document.miForm.MISSATGE.value = "";
                }                 
                
            }
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
				
				if (objUtiles.estaVacio(optionalQueryString))                
     			   optionalQueryString = "";
        
  		  objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
   
}
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr301", "cancelar", document.miForm, "_self");
            }   
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                var sseguro = "${__formdata['SSEGURO']}";
                f_aceptar_axisctr019(sseguro); 
          }
            
            function f_but_109006() {
            	var sseguro = "${__formdata['SSEGURO']}";            	
            	if(sseguro!=''){
            	 objAjax.invokeAsyncCGI("axis_axisctr301.do", callbackAceptar, 
                         "operation=ejecutar"+ "&SSEGURO="+document.miForm.SSEGURO.value,
                         this, objJsMessages.jslit_cargando);
            	}else{
            	f_abrir_axisctr019();            		
            	}
            
            } 
            
            function callbackAceptar (ajaxResponseText) {
                             
                var doc = objAjax.domParse(ajaxResponseText);
               if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                                   
            	   objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=BUREAU");      
           
           } 
               $.reinitialiseScroll();
           }
            
            
            
            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
           function f_abrir_axisctr019() {
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }   
            
        function f_aceptar_axisctr019 (SSEGURO) {
                f_cerrar_axisctr019();
                objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                objDom.setValorPorId("LIMPIAR_DATOS", "true");
                objUtiles.ejecutarFormulario ("axis_axisctr301.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
              function f_abrir_axisfileupload(NSUPLEM, NMOVIMI,FBUREAU) { 
             objDom.setValorComponente(document.miForm.NSUPLEM, NSUPLEM);
             objDom.setValorComponente(document.miForm.NMOVIMI, NMOVIMI);
             objDom.setValorComponente(document.miForm.FBUREAU, FBUREAU);
            
               f_abrir_modal("axisfileupload", true, "&FBUREAU=${__formdata.FBUREAU}&NMOVIMI=1&ORIGEN=GENERICO");
            }
            
            function f_cerrar_modal(){            
                objUtiles.cerrarModal("axisfileupload");
            }
            
           function f_aceptar_axisfileupload(IDDOCGEDOX){
        	  
           		objDom.setValorComponente(document.miForm.IDDOCGEDOX, IDDOCGEDOX);
                f_cerrar_modal();
                objUtiles.ejecutarFormulario ("axis_axisctr301.do", "cargarDocumento", document.miForm, "_self", objJsMessages.jslit_cargando);     
         
            }
           function f_anular(NSUPLEM,FBUREAU, NMOVIMI){
           objDom.setValorComponente(document.miForm.NSUPLEM, NSUPLEM);
           objDom.setValorComponente(document.miForm.FBUREAU, FBUREAU);
           objDom.setValorComponente(document.miForm.NMOVIMI, NMOVIMI);
           
           objUtiles.ejecutarFormulario("axis_axisctr301.do", "anular", document.miForm, "_self", objJsMessages.jslit_cargando);   
           }
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="axis_axisctr301.do" method="POST">
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_BUSC" f="axisctr301" lit="1000188"/></c:param>
                <c:param name="nid" value="axisctr019" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisfileupload|<axis:alt f="axisctr301" c="TITULOFILEUPLOAD" lit="1000614"/></c:param>
            </c:import>
            
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />       
            <input type="hidden" name="MISSATGE" id="MISSATGE" value="${__formdata.MISSATGE}" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"> </c:param>
                <c:param name="titulo"> <axis:alt c="TITULO" f="axisctr301" lit="9908937"/></c:param>
                <c:param name="formulario"><axis:alt c="TITULO" f="axisctr301" lit="9908937"/></c:param>
                <c:param name="producto"> </c:param>
                <c:param name="form">axisctr301</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo"><axis:alt c="TITULO_BUSC" f="axisctr301" lit="1000188"/>#axisimprimir|<axis:alt c="LIT_IMPRIMIR" f="axisctr301" lit="1000205" />#axisgedox|<axis:alt c="LIT_IMP_GEDOX" f="axisctr301" lit="1000201" />#axisctr023|<axis:alt c="LIT_COBRO_REB" f="axisctr301" lit="1000191" />#axisctr025|<axis:alt c="LIT_DET_MOV" f="axisctr301" lit="140360"/>#axisctr029|<axis:alt c="LIT_DET_ASE" f="axisctr301" lit="1000195"/>#axisctr030|<axis:alt c="LIT_DET_GAR" f="axisctr301" lit="1000196"/>#axisctr039|Suplementos</c:param>
            </c:import>     
          
<!-- Area de campos  -->
    <input type="hidden" name="FBUREAU" value="${__formdata['FBUREAU']}" />
    <input type="hidden" name="SSEGURO" value="${__formdata['SSEGURO']}" />    
    <input type="hidden" name="IDDOCGEDOX" value="${__formdata['IDDOCGEDOX']}" />
    <input type="hidden" name="NMOVIMI" value="${__formdata['NMOVIMI']}" />
    <input type="hidden" name="VALIDA" value="${__formdata['VALIDA']}" />
    <input type="hidden" name="NSUPLEM" value="${__formdata['NSUPLEM']}" />    
    
    
    <div class="separador">&nbsp;</div>
    
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_DATPOL" f="axisctr301" lit="110853" /></div>
            <!--campos-->
            <table class="seccion">
                <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
               </tr>
                <tr>
                    <td class="titulocaja"><b><axis:alt c="NPOLIZA" f="axisctr301" lit="100624" /></b><img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/></td>
                        <td >
												
														<axis:ocultar f="axisctr301" c="NCERTIF" dejarHueco="false">
															<!-- Numero de CERTIF -->
															<td class="titulocaja"><b id="label_NCERTIF"><axis:alt
																		f="axisctr301" c="NCERTIF" lit="101168" /></b></td>
														</axis:ocultar>
													
											</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="campowidthinput campo campotexto"  name="NPOLIZA" id="NPOLIZA" value="${datos_poliza.NPOLIZA}" readonly="true"/>
                    </td>
                    <td><axis:ocultar f="axisctr301" c="NCERTIF" dejarHueco="false">
																<td class="campocaja">
																	<!-- Numero de certificado --> <input type="text"
																	class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF"
																	value="${datos_poliza.NCERTIF}" readonly="true" />

																</td>
															</axis:ocultar></td>
													
											</td>
                </tr>
              
            </table>   
            
            <div class="separador">&nbsp;</div>
            <!-- DisplayTag Tomadores -->
            <c:set var="title1"><axis:alt c="LIT_PRENEDOR" f="axisctr301" lit="1000181" /></c:set>
           
            </div>
            <axis:ocultar dejarHueco="false" c="DSP_FICHA" f="axisctr301">          
                <div class="separador">&nbsp;</div>
                <div class="titulo"><axis:alt f="axisctr301" c="DSP_FICHA" lit="9908937"></axis:alt></div>
                <!-- DisplayTag siniestros -->
                <c:set var="title1"><axis:alt c="SFBUREAU" f="axisctr301" lit="9908937" /></c:set>
                <c:set var="title2"><axis:alt c="CSUPLEM" f="axisctr301" lit="9001641" /></c:set>
                <c:set var="title3"><axis:alt c="TTIPO" f="axisctr301" lit="9908934" /></c:set>
                <c:set var="title4"><axis:alt c="FIMPRESO" f="axisctr301" lit="9001211" /></c:set>
                <c:set var="title5"><axis:alt c="TFILE_ADJ" f="axisctr301" lit="9908935" /></c:set>
                <c:set var="title6"><axis:alt c="CANULADO" f="axisctr301" lit="801695" /></c:set>
                <c:set var="title7"><axis:alt c="BT_ADJUNT" f="axisctr301" lit="9908936" /></c:set>
                <div class="displayspace">
                    <display:table name="${ficha_bureau}" id="miListaId" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr301.do?paginar=true">
                    <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title1}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${miListaId['SFBUREAU']}"/></div>
                    </display:column>                              
                    <axis:visible c="NSUPLEM" f="axisctr301">
                        <display:column title="${title2}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                              <div class="dspText">${miListaId['NSUPLEM']}</div>
                        </display:column>
                    </axis:visible>
                    
                    <axis:visible c="NMOVIMI" f="axisctr301">
                        <display:column title="${title2}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                              <div class="dspText">${miListaId['NMOVIMI']}</div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="TTIPO" f="axisctr301">
                        <display:column title="${title3}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <div class="dspText">${miListaId['CTIPO']}</div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="FIMPRESO" f="axisctr301">
                        <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <div class="dspText">${miListaId['FALTA']}</div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="TFILE_ADJ" f="axisctr301">
                        <display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspText"><a href="javascript:f_ver_doc('${miListaId['IDDOC_ADJ']}')">${miListaId['FICHERO']}</a></div>
                         </display:column>
                    </axis:visible>
                    <axis:visible c="CANULADO" f="axisctr301">
                         <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons">
                                            <input type="checkbox"  name = "CANULADO" id = "CANULADO" value="${miListaId['CANULADA']}" onclick="f_anular(${miListaId['NSUPLEM']}, ${miListaId['SFBUREAU']}, ${miListaId['NMOVIMI']})"
                                            <c:if test="${miListaId['CANULADA']  == 1}">checked </c:if>></div>
                                            
                                </display:column>
                    </axis:visible>
                    
                     <axis:visible f="axisctr020" c="BT_ADJUNT"> 
                                                        <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                               <a href="javascript:f_abrir_axisfileupload(${miListaId['NSUPLEM']},${miListaId['NMOVIMI']},${miListaId['SFBUREAU']})"><img  border="0" alt="<axis:alt f="${pantalla}" c="FILE" lit="1000615"/>" title="<axis:alt f="${pantalla}" c="FILE" lit="1000615"/>" src="images/gdocumental.gif"/></a>
                                                            </div>
                                                        </display:column>  
                                                        </axis:visible>
                    </display:table>
                   
                </div>
            </axis:ocultar>
              </td>
            </tr>
        </table>
    
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr301</c:param>        
            <c:param name="__botones">salir<axis:visible c="BT_EJECUTAR" f="axisctr301">,109006</axis:visible>
            </c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>