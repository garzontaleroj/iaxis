<%/* Revision:# Xd9vOsU+Dbc7FWeBsiSq7Q== # */%>
<%/**
*  Fichero: axisctr024.jsp
*  Pantalla de Emisión o continuación de modificaciones de Suplementos.
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>  
*
*  Fecha: 15/02/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisctr024" c="titulo" lit="1000192"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>   
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <!-- BUG CONF-186 - 22/08/2016 - HRE -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr024" c="TITULO_DET" lit="9909311" /></c:param>
            <c:param name="nid" value="axisper046" />
        </c:import>
        <!-- BUG CONF-186 - 22/08/2016 - HRE -->
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            var but_emitir_clicked=false;
            
            function f_onload() {
            var REVISARINSPECCION  = "${__formdata.REVISARINSPECCION}";
               <c:choose>
                   <c:when test="${MODIF_PROP == true}"> 
                       <c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO}">
                            <axis:visible c="BT_EMITIR" f="axisctr024">
                                if (objDom.esVisible("but_emitir")) {
                                    objDom.setVisibilidadPorId("but_emitir", "hidden");
                                }
                            </axis:visible>
							//INICIO CONF-172
                            <axis:visible c="BT_GUARDAR_SUPLEMENTO" f="axisctr024">
                             objDom.setVisibilidadPorId("BT_GUARDAR_SUPLEMENTO", "hidden");
                        	</axis:visible>//FIN CONF-172
                            <axis:visible c="BT_CONTINUAR" f="axisctr024">
                                objDom.setVisibilidadPorId("but_continuar", "hidden");
                            </axis:visible>
                            <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                objDom.setVisibilidadPorId("but_aceptar", "visible");
                            </axis:visible>
                            <c:if test="${!empty PTPSUS}"> 
                                <c:if test="${!empty PCESTPOL && PCESTPOL == 1}">
                                    objEstilos.toggleDisplay("DSP_PSU", document.getElementById("DSP_PSU_parent"));
                                </c:if>
                            </c:if>
                            
                            
                        </c:if>
                          <c:if test="${empty __formdata.T_IAX_DETMOVSEGURO}">
                            <axis:visible c="BT_EMITIR" f="axisctr024">
                            try{
                                 objDom.setVisibilidadPorId("but_emitir", "visible");
                                 }catch(e){}
                            </axis:visible>
                            <axis:visible c="BT_CONTINUAR" f="axisctr024">
                            if (objDom.esVisible("but_continuar")) 
                                objDom.setVisibilidadPorId("but_continuar", "hidden");
                            </axis:visible>
                            <axis:visible c="BT_ACEPTAR" f="axisctr024">
                            if (objDom.esVisible("but_aceptar")) 
                                objDom.setVisibilidadPorId("but_aceptar", "hidden");
                            </axis:visible>
                            <c:if test="${!empty PTPSUS}"> 
                                <c:if test="${!empty PCESTPOL && PCESTPOL == 1}">
                                    objEstilos.toggleDisplay("DSP_PSU", document.getElementById("DSP_PSU_parent"));
                                </c:if>
                            </c:if>
                              <c:if test="${!empty PCESTPOL && PCESTPOL == 1 || (!empty __formdata.CINSPREQ && __formdata.CINSPREQ == 0 )}">
                                    <axis:visible c="BT_EMITIR" f="axisctr024">
                                        if (objDom.esVisible("but_emitir")) {
                                            objDom.setVisibilidadPorId("but_emitir", "hidden");
                                        }
                                    </axis:visible>
                                    <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                        objDom.setVisibilidadPorId("but_aceptar", "visible");
                                    </axis:visible>
                                </c:if>
                            
                                     <c:if test="${!empty __formdata.REVISARINSPECCION}">
                                     	<axis:visible c="BT_EMITIR" f="axisctr024">
                                        if (objDom.esVisible("but_emitir")) {
                                            objDom.setVisibilidadPorId("but_emitir", "hidden");
                                        }
                                    </axis:visible>
                                    <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                        objDom.setVisibilidadPorId("but_aceptar", "visible");
                                    </axis:visible>
									<axis:visible c="BT_GUARDAR" f="axisctr024">
                                	objDom.setVisibilidadPorId("but_guardar","hidden");
                               	</axis:visible>
                                     
                                     </c:if>
                            
                            
                        </c:if>
                   </c:when>
                   <c:otherwise>
                       <c:if test="${empty mvtretencion_sup && empty PTPSUS}"> /* Si está vacio habilitamos botón emitir*/
                           <c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO}">
                                <axis:visible c="BT_EMITIR" f="axisctr024">
                                	if (document.miForm.ES_COL_ADMIN.value==0) {
                                        objDom.setVisibilidadPorId("but_emitir","visible");
                                    }
                                	if (document.miForm.ES_COL_ADMIN.value==1) {
                                        objDom.setVisibilidadPorId("but_aceptar","visible");
                                    }
                                </axis:visible>
                               	<axis:visible c="BT_ACEPTAR" f="axisctr024">
                                	if (document.miForm.ES_COL_ADMIN.value==0) {
                                        objDom.setVisibilidadPorId("but_aceptar", "hidden");
                                    }
                                </axis:visible>
                                <axis:visible c="BT_GUARDAR" f="axisctr024">
                                	objDom.setVisibilidadPorId("but_guardar","visible");
                               	</axis:visible>
                            </c:if>                        
                       </c:if>
                       <c:if test="${!empty mvtretencion_sup}"> 
                          <c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO}">
                       			<axis:visible c="BT_EMITIR" f="axisctr024">
                                    if (objDom.esVisible("but_emitir")) {
                                        objDom.setVisibilidadPorId("but_emitir", "hidden");
                                    }
                                </axis:visible>
                            	<axis:visible c="BT_ACEPTAR" f="axisctr024">
                            		objDom.setVisibilidadPorId("but_aceptar", "visible");
                            	</axis:visible>	
                            	<axis:visible c="BT_GUARDAR" f="axisctr024">
                                	objDom.setVisibilidadPorId("but_guardar","visible");
                               	</axis:visible>
                          </c:if>
                       </c:if> 
                        <c:if test="${!empty PTPSUS}"> 
                            <c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO}">
                                <axis:visible c="BT_EMITIR" f="axisctr024">
                                    if (document.miForm.ES_COL_ADMIN==0) {
                                        objDom.setVisibilidadPorId("but_emitir","visible");
                                    }
                                    if (document.miForm.ES_COL_ADMIN.value==1) {
                                        objDom.setVisibilidadPorId("but_aceptar","visible");
                                    }
                               	</axis:visible>

                            	<axis:visible c="BT_ACEPTAR" f="axisctr024">
                                    if (document.miForm.ES_COL_ADMIN.value==0) {
                                        objDom.setVisibilidadPorId("but_aceptar", "hidden");
                                    }
                               	</axis:visible>

                                <c:if test="${!empty PCESTPOL && PCESTPOL == 1 || (!empty __formdata.CINSPREQ && __formdata.CINSPREQ == 1 )}">
                                <c:choose>
                                 <c:when test="${!empty __formdata.CRESULTR && (__formdata.CINSPREQ == 1 && (__formdata.CRESULTR == 0 || __formdata.CRESULTR == 1 )) }">
                                    
                                    <axis:visible f="axisctr024" c="DSP_INSPECCION_RIESGO" >
                                    objEstilos.toggleDisplay("DSP_INSPECCION_RIESGO", document.getElementById("DSP_INSPECCION_RIESGO_parent"));
                                    </axis:visible>
                                      <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                        objDom.setVisibilidadPorId("but_aceptar", "hidden");
                                    </axis:visible>
									<axis:visible c="BT_GUARDAR" f="axisctr024">
                                	objDom.setVisibilidadPorId("but_guardar","hidden");
									</axis:visible>
                                    </c:when>
                                    <c:otherwise>
                                    <axis:visible c="BT_EMITIR" f="axisctr024">
                                        if (objDom.esVisible("but_emitir")) {
                                            objDom.setVisibilidadPorId("but_emitir", "hidden");
                                        }
                                    </axis:visible>
                                    <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                        objDom.setVisibilidadPorId("but_aceptar", "visible");
                                    </axis:visible>
									<axis:visible c="BT_GUARDAR" f="axisctr024">
                                	objDom.setVisibilidadPorId("but_guardar","hidden");
                               	</axis:visible>
                                    objEstilos.toggleDisplay("DSP_PSU", document.getElementById("DSP_PSU_parent"));
                                    </c:otherwise>
                                    </c:choose>
                              
                                
                                </c:if>
                            </c:if>
                        </c:if> 
                        
                         <c:if test="${empty PTPSUS && !empty __formdata.CINSPREQ && __formdata.CINSPREQ == 1 && !empty __formdata.CRESULTR && (__formdata.CRESULTR == 5) }">
                                
                                    <axis:visible c="BT_EMITIR" f="axisctr024">
                                        if (objDom.esVisible("but_emitir")) {
                                            objDom.setVisibilidadPorId("but_emitir", "hidden");
                                        }
                                    </axis:visible>
                                   
                                    <axis:visible c="BT_ACEPTAR" f="axisctr024">
                                        objDom.setVisibilidadPorId("but_aceptar", "visible");
                                    </axis:visible>
                                       <axis:visible f="axisctr024" c="DSP_INSPECCION_RIESGO" >
                                    objEstilos.toggleDisplay("DSP_INSPECCION_RIESGO", document.getElementById("DSP_INSPECCION_RIESGO_parent"));
                                    </axis:visible>
                               
                                </c:if>
                   </c:otherwise>
               </c:choose>
               <c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO}"> 
                    objEstilos.toggleDisplay("datossuplementos", document.getElementById("datossuplementos_parent"));
               </c:if>
               
               
               <c:if test="${HAB_BOTONDIFERIR == 0 && BOTONDIFERIR == 1}">
                    <axis:visible c="BT_DIFERIR" f="axisctr024">
                        objDom.setDisabledPorId("but_9001507","false");
                    </axis:visible>	
               </c:if>
               
               f_cargar_propiedades_pantalla();
            }
            
            function f_but_salir() {
                <c:choose>
                    <c:when test="${MODIF_PROP == true}"> 
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024&MODIF_PROP=true", "cancelar", document.miForm, "_self");
                    </c:when>
                    <c:otherwise>
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024&limpiarTemporales=true", "cancelar", document.miForm, "_self");  // CJMR IAXIS-5428 2019/12/06
                    </c:otherwise>
                </c:choose>
            }

            //ecg20111006 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible
            function LOCAL_showHideLoader(localid,  valorTexto, visualizar){
                try {
                    var loader="LOCAL"+localid+"ajaxLoader"
                    var content="LOCAL"+localid+"ajaxContent"
                    var text="LOCAL"+localid+"ajaxText"
                    document.getElementById("LOCAL"+localid+"ajax4ie").style.display=visualizar;
                    document.getElementById(loader).style.display=visualizar;
                    document.getElementById(content).style.display=visualizar;
                    document.getElementById(text).innerHTML= valorTexto;
                }
                catch(excep) {
                    alert(excep)
                }
            }

            function LOCAL_invokeAsyncCGI(strURL, callback, qs, self, ajaxTexto, optionalCallBackParam) {
                try{
                    // Muestra la precarga ajax
                    if(!objUtiles.estaVacio(ajaxTexto)) {
                        LOCAL_showHideLoader("01",  ajaxTexto, "inline");
                    }
                    // Recodificar la QueryString
                    qs = objAjax.tratarEncodingQs(qs);
                    var xmlHttpReq = false;
                    if (window.XMLHttpRequest) { // Mozilla
                        self.xmlHttpReq = new XMLHttpRequest();
                    }
                    else if (window.ActiveXObject) { //IE
                        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    if (strURL.indexOf("?")>=0) {
                        self.xmlHttpReq.open('POST', strURL+"&"+qs, true);
                    }
                    else {
                        self.xmlHttpReq.open('POST', strURL+"?"+qs, true);
                    }
                    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    self.xmlHttpReq.onreadystatechange = function() {
                        if (self.xmlHttpReq != null && self.xmlHttpReq.readyState == 4) {
                            if (!objUtiles.estaVacio(callback)) callback(self.xmlHttpReq.responseText, optionalCallBackParam);
                            //Esconde la precarga ajax (el setTimeOut es para que sea apreciable mientras no estamos en producción)
                            //if( !objUtiles.estaVacio(ajaxTexto)) LOCAL_showHideLoader("01", "", "none");
                        }
                    }
                    self.xmlHttpReq.send(null);
                }catch(e){
                    LOCAL_showHideLoader("01",  "", "none");
                }
            }
            var operacio = "";	    
            
            function f_but_continuar() {
                operacio = "continuar";
                objAjax.invokeAsyncCGI("axis_axisctr024.do?PCESTPOL=${PCESTPOL}&CINSPREQ=${__formdata.CINSPREQ}", callbackValDocRequeridaContinuar,
                        "operation=ajax_valdocrequerida",
                        this, objJsMessages.jslit_cargando);
            }           
            
            function callbackValDocRequeridaContinuar(ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
                //if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var  TIPERROR = 0;
                    var CERROR = 0;
                    var TERROR = "";
					<axis:visible c="NO_VAL_REQ" f="axisctr024">
					  <axis:visible c="DOC_REQUERIDA" f="axisctr024">
                            <c:if test="${ !empty docu_requerida && empty requestScope.__mensajes.m__clave }">
                    try{ 
                        TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                        CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                        TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                    } catch (e) {
                        TIPERROR = 0;
                    }
					</c:if>
					</axis:visible>
                  </axis:visible>
                    var CINSPREQ="";
                    var PCESTPOL="";
                    try{ 
                        CINSPREQ = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CINSPREQ"), 0, 0);
                        PCESTPOL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCESTPOL"), 0, 0);
                    } catch (e) { }
                    if (TIPERROR == 0){
                        objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024&limpiarTemporales=false&PCESTPOL="+PCESTPOL+"&CINSPREQ="+CINSPREQ, "cancelar", document.miForm, "_self");
                    }else if (TIPERROR == 2){
                        //Avis
                        var confirma=confirm(TERROR);
                        if (confirma) {
                            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024&limpiarTemporales=false&PCESTPOL="+PCESTPOL+"&CINSPREQ="+CINSPREQ, "cancelar", document.miForm, "_self");
                        }
                    }else{
                        objAppMensajes.existenErroresEnAplicacion(doc);
                    }
                //}
                $.reinitialiseScroll();
            }            
                        
            function f_but_emitir() {
                operacio = "emitir";
                
                if (but_emitir_clicked) {
                    //se ignora, no se hace nada
                }
                else {
                   but_emitir_clicked=true;
                    var o=document.miForm.but_emitir; //hacer el boton invisible
                    o.style.visibility="hidden"; //hacer el boton invisible
                    //Validem si hi ha documentació requerida necessaria
                        objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackValDocRequerida,
                        "operation=ajax_valdocrequerida",
                        this, objJsMessages.jslit_cargando);
               }
            } 
            
            //INI 18351: LCOL003 - Documentación requerida en contratación y suplementos 
            function callbackValDocRequerida(ajaxResponseText){
                var doc = objAjax.domParse(ajaxResponseText);
				
                //if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var  TIPERROR = 0;
                    var CERROR = 0;
                    var TERROR = "";
					<axis:visible c="NO_VAL_REQ" f="axisctr024">
					  <axis:visible c="DOC_REQUERIDA" f="axisctr024">
                            <c:if test="${ !empty docu_requerida && empty requestScope.__mensajes.m__clave }">
                    try{ 
                        TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                        CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                        TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                    } catch (e) {
                        TIPERROR = 0;
                    }
					</c:if>
					</axis:visible>
					</axis:visible>
                    if (TIPERROR == 0){
                        //objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                        //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
                        /*LOCAL_invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, 
		                        "operation=emitirPropuesta",
		                        this, objJsMessages.jslit_cargando);*/
                         objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSup, objJsMessages.jslit_cargando);

                    }else if (TIPERROR == 2){
                        //Avis
                        var confirma=confirm(TERROR);
                        if (confirma) {
                            //objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
		                    //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
		                    		/*LOCAL_invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, 
		                        "operation=emitirPropuesta",
		                        this, objJsMessages.jslit_cargando);*/
                             objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSup, objJsMessages.jslit_cargando);
                        }
                    }else{
                        objAppMensajes.existenErroresEnAplicacion(doc);
                    }
                //}
            }
            //FI 18351: LCOL003 - Documentación requerida en contratación y suplementos 
            
            function callbacPregPropagaSup(p) {
                
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirmaPropaga=confirm(mensajes);
                       if (confirmaPropaga) {
                          LOCAL_invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=1", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                       }else{
                          LOCAL_invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=0", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                       }
                    }else{
                        LOCAL_invokeAsyncCGI("axis_axisctr024.do", callbackEmitir, "operation=emitirPropuesta", this, objJsMessages.jslit_cargando);
                    }
                }  else{alert ("hay errores");}
                $.reinitialiseScroll();
            }
            
            /* Added for BACK (anterior) button (IAXIS-4321) PK-16/06/2019 Start */
            function f_but_anterior() {
                objUtiles.ejecutarFormulario("axis_axisctr024.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            /* Added for BACK (anterior) button (IAXIS-4321) PK-16/06/2019 End */
            
            function f_but_aceptar(){
                operacio="aceptar";
                objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackValDocRequeridaAceptar, 
                            "operation=ajax_valdocrequerida",
                            this, objJsMessages.jslit_cargando);
            } 
            
            function callbackValDocRequeridaAceptar(ajaxResponseText){
				// INI - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
            	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "Cargando...", "inline");
            	// FIN - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
                var doc = objAjax.domParse(ajaxResponseText);
				CRESULTR = '';
				<axis:visible f="axisctr024" c="DSP_INSPECCION_RIESGO" >
                   <axis:visible c="CRESULTR" f="axisctr024">
				   try{
                   CRESULTR = document.miForm.CRESULTR.value
				   }catch(e){}
                   </axis:visible>
				 </axis:visible>
                var  TIPERROR = 0;
                var CERROR = 0;
                var TERROR = "";
				<axis:visible c="NO_VAL_REQ" f="axisctr024">
				  <axis:visible c="DOC_REQUERIDA" f="axisctr024">
                            <c:if test="${ !empty docu_requerida && empty requestScope.__mensajes.m__clave }">
                try{ 
                    TIPERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0);
                    CERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0);
                    TERROR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0);
                } catch (e) {
                    TIPERROR = 0;
                }
				</c:if>
				</axis:visible>
				</axis:visible>
                /*TIPERROR = 0;*/
                if (TIPERROR == 0){
                    <c:choose>
                        <c:when test="${MODIF_PROP == true}"> 
                            /*objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSupAceptarModifProp, objJsMessages.jslit_cargando);*/
                            objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptarModifProp, 
                                    "operation=aceptar_modif_prop&CRESULTR="+CRESULTR,
                                    this,  objJsMessages.jslit_cargando, false);
                        </c:when>
                        <c:otherwise>
                            /*objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSupAceptar, objJsMessages.jslit_cargando);*/
                            objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptar, 
                                    "operation=aceptar",
                                    this,  objJsMessages.jslit_cargando, false);
                        </c:otherwise>
                    </c:choose>                        
                }else if (TIPERROR == 2){
                    //Avis
                    var confirma=confirm(TERROR);
                    if (confirma) {
                        <c:choose>
                            <c:when test="${MODIF_PROP == true}"> 
                                /*objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSupAceptarModifProp, objJsMessages.jslit_cargando);*/
                            objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptarModifProp, 
                                    "operation=aceptar_modif_prop",
                                    this,  objJsMessages.jslit_cargando, false);
                            </c:when>
                            <c:otherwise>
                               /* objAjax.invokeAsyncCGI_JSON("axis_axisctr024.do?operation=preguntaProgagaSupl", callbacPregPropagaSupAceptar, objJsMessages.jslit_cargando);*/
                            objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptar, 
                                    "operation=aceptar",
                                    this,  objJsMessages.jslit_cargando, false);
                            </c:otherwise>
                        </c:choose>
                    }
                }else{
                    objAppMensajes.existenErroresEnAplicacion(doc);
                }
                $.reinitialiseScroll();
            }            
            
            function callbacPregPropagaSupAceptarModifProp(p){
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirmaPropaga=confirm(mensajes);
                       if (confirmaPropaga) {
                          objAjax.invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=1", callbackAceptarModifProp, 
                                    "operation=aceptar_modif_prop",
                                    this,  objJsMessages.jslit_cargando, false);
                       }else{
                          objAjax.invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=1", callbackAceptarModifProp, 
                                    "operation=aceptar_modif_prop?PCPROPAGASUPL=0",
                                    this,  objJsMessages.jslit_cargando, false);
                       }
                    }else{
                        objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptarModifProp, 
                                    "operation=aceptar_modif_prop",
                                    this,  objJsMessages.jslit_cargando, false);
                    }
                }  else{alert ("hay errores");}
            }
            
            function callbacPregPropagaSupAceptar(p){
                // INI - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
            	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "Cargando...", "inline");
            	// FIN - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.OTEXTO;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                       var confirmaPropaga=confirm(mensajes);
                       if (confirmaPropaga) {
                          objAjax.invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=1", callbackAceptar, 
                                    "operation=aceptar",
                                    this,  objJsMessages.jslit_cargando, false);
                       }else{
                          objAjax.invokeAsyncCGI("axis_axisctr024.do?PCPROPAGASUPL=0", callbackAceptar, 
                                    "operation=aceptar",
                                    this,  objJsMessages.jslit_cargando, false);
                       }
                    }else{
                        objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptar, 
                                    "operation=aceptar",
                                    this,  objJsMessages.jslit_cargando, false);
                    }
                }  else{alert ("hay errores");}
            }
            
            function f_but_guardar(){
            	operacio="guardar";
                objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackAceptar, 
                                "operation=guardar_prop",
                                this,  objJsMessages.jslit_cargando, false);
            }
            
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024", "cancelar", document.miForm, "_self"); //  CJMR IAXIS-5428 2019/12/06
                f_but_salir();    // CJMR IAXIS-5428 2019/12/06
            }

            /****************************************************************************************/
            /******************************* MODAL DETALLLE PSU *****************************************/
            /****************************************************************************************/
           
            function f_abrir_axispsu004 () {           
                var NOVISIBLE = document.getElementById("NOVISIBLE").value;                
                objUtiles.abrirModal("axispsu004", "src", "modal_axispsu004.do?operation=form&NOVISIBLE"+NOVISIBLE+"&PTABLAS=EST");
            }
            
            function f_cerrar_axispsu004() {
                objUtiles.cerrarModal("axispsu004");
            }    
                  
                     
             function f_abrir_axispsu003(SSEGURO,NMOVIMI,NRIESGO,CCONTROL,NOCURRE,CGARANT) {                      
                var param = '&SSEGURO='+SSEGURO+'&NMOVIMI='+NMOVIMI+'&NRIESGO='+NRIESGO+'&CCONTROL='+CCONTROL+'&NOCURRE='+NOCURRE+'&CGARANT='+CGARANT+'&PTABLAS=EST'+'&MODO=1&ORIGEN=AXISCTR024';            
                objUtiles.abrirModal("axispsu003", "src", "modal_axispsu003.do?operation=form"+param);
            } 
            
            function f_cerrar_axispsu003() {
                objUtiles.cerrarModal("axispsu003");
            }    
            
            /****************************************************************************************/
            /******************************* MODAL DIFERIR *****************************************/
            /****************************************************************************************/
            
            function f_but_9001507(){
               objDom.setVisibilidadPorId("but_cerrar_modal_axisctr077", "hidden");
               objUtiles.abrirModal("axisctr077", "src", "modal_axisctr077.do?operation=form",700,425); 
            }
            
            function f_cerrar_axisctr077(){
                objUtiles.cerrarModal("axisctr077");
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function callbackEmitir(ajaxResponseText) {

								//ecg20120113 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible
								LOCAL_showHideLoader("01", "", "none");
            
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   var hayError = 0;
                   if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("hayError")[0])){
                     hayError = objDom.getValorNodoDelComponente(doc.getElementsByTagName("hayError"), 0, 0);
                   }
                  
                  if (hayError != 1){
                    // Si todo ha ido bien, desactivar botones.
                    if ( document.miForm.but_continuar != undefined){
                        objDom.setVisibilidadPorId("but_continuar", "hidden");
                    }
                    objDom.setVisibilidadPorId("but_emitir", "hidden");
                    //recogemos mensaje con el número de poliza y lo enviamos a
                    //impresion Axisimprimir
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                            var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                        
                        }else{
                            var mensaje="";
                        }

                        //Se anyade una llamada a impresiones
                        
                        if(version_tomcat <= 6){
                        	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                        }else{
                        	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                        }
                        
                        } 
                    else{
                        objDom.setDisabledPorId("but_emitir","true");
                        if ( document.miForm.but_continuar != undefined){
                            objDom.setDisabledPorId("but_continuar","true");
                        }
                    }
                } 
                $.reinitialiseScroll();
            }
            
            function callbackAceptar (ajaxResponseText) {
				// INI - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
            	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "Cargando...", "inline");
            	// FIN - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
                 // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // Si todo ha ido bien, desactivar botones.
                    <axis:visible c="BT_CONTINUAR" f="axisctr024">
                    if ( document.miForm.but_continuar != undefined){
                        objDom.setVisibilidadPorId("but_continuar", "hidden");
                    }
                    </axis:visible>
                    <axis:visible c="BT_ACEPTAR" f="axisctr024">
                        objDom.setVisibilidadPorId("but_aceptar", "hidden");
                    </axis:visible>
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                            
                            }else{
                                var mensaje="";
                            }
		            //Se anyade una llamada a impresiones
		            //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0)+"&TIPO=SUPLEMENTO");   
		            
		            if(version_tomcat <= 6){
		            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));   
		            }else{
		            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));   
		            }    
            
            } 
				// INI - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
            	objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "Cargando...", "none");
            	// FIN - ML - 5013 - EVITAR DAR VARIOS CLIC A ACEPTAR
                $.reinitialiseScroll();
            }
            
            function callbackAceptarModifProp (ajaxResponseText) {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                
                    f_but_continuar();
                    // Es decir -> objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr024&limpiarTemporales=false", "cancelar", document.miForm, "_self");
                }
                $.reinitialiseScroll();
            }
            
        function f_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
            objUtiles.ejecutarFormulario ("axis_axisctr024.do", "form", document.miForm, "_self" , objJsMessages.jslit_cargando);
        }
                
        function f_solo_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
        }
        
        function f_abrir_axisctr173(){
            objUtiles.abrirModal("axisctr173", "src", "modal_axisctr173.do?operation=form&origen=axisctr024&ctrnmov=1");
        }
        
        function f_consultar_inspecciones(CTIPMAT, CMATRIC){
            objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&CTIPMAT="+CTIPMAT+"&CMATRIC="+CMATRIC);
        }
        
        function f_consultar_inspeccion(orden, inspeccion){ 
            objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&SORDEN="+orden+"&NINSPECCION="+inspeccion);
        }
        
        function f_cerrar_axisins001() {
            objUtiles.cerrarModal("axisins001");
        } 
        function f_abrir_axisper046(personMarca, cmarca) {            
            objUtiles.abrirModal("axisper046", "src", "modal_axisper046.do?operation=init&SPERSON="+personMarca+'&CMARCA='+cmarca);                        
        }
        
        function f_salir_axisper046() {
                objUtiles.cerrarModal("axisper046");
        }  

        //INICIO CONF-172
        function f_but_1000081(){
        	
        	 operacio="guardar_supl";
             objAjax.invokeAsyncCGI("axis_axisctr024.do", callbackValDocRequeridaAceptar, 
                         "operation=ajax_valdocrequerida",
                         this, objJsMessages.jslit_cargando);
         
        
        }//FIN CONF-172
        
        
        <%-->FI Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos<--%>
        </script>
    </head>
    <body  onload="f_onload()">
    <!-- ecg20120114 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible -->
    <iframe id="LOCAL01ajax4ie" class="precarga_fija" src="" style="top:0px;left:0px;z-index:100;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');" frameborder="0"></iframe>
    <div id="LOCAL01ajaxLoader" class="precarga_fija" style="z-index:101;display:none;width:100%;height:100%;background-color:#ffffff;filter:alpha(opacity=75);-moz-opacity:.75;opacity:.75;">&nbsp;</div>
    <div id="LOCAL01ajaxContent" class="precarga_fija" style="z-index:102;display:none;width:300px;height:100px;margin:10% 0 0 36%;background-color:#ededed;border:4px solid #000000;">
    <div style="float:left;padding:8% 0 0 10px;"><img border="0" src="images/ajax-loader.gif"/></div>
    <div style="float:left;padding:8% 0 0 10px;width:200px;height:50px;"><span id="LOCAL01ajaxText" style="font-size:14px;color:#000000;font-weight:bold;">&nbsp;</span></div>
    <div style="clear:both;">&nbsp;</div>
    </div>    
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr024" c="titulo" lit="9001543" /></c:param>
            <c:param name="nid" value="axisctr077" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr024" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="nid" value="axisctr173" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axis" c="INSPECCIONES" lit="9905244"/></c:param> 
                <c:param name="nid" value="axisins001" />
        </c:import>
        
        <form name="miForm" action="" method="POST" >
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="NOVISIBLE" id="NOVISIBLE" value="${__formdata.NOVISIBLE}"/>
            <input type="hidden" name="ES_COL_ADMIN" id="ES_COL_ADMIN" value="${__formdata.ES_COL_ADMIN}"/>
            <input type="hidden" name="ES_CERTIF_CERO" id="ES_CERTIF_CERO" value="${__formdata.ES_CERTIF_CERO}"/>
            <input type="hidden" name="CACCION" id="CACCION" value="${__formdata['CACCION']}"/>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispsu004|<axis:alt f="axisctr024" c="PSU004" lit="9002255" /></c:param>
            </c:import>
              <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispsu003|<axis:alt f="axisctr024" c="PSU003" lit="9002255" /></c:param>
            </c:import>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad">
                    <axis:visible f="axisctr024" c="ETIQ_PANTALLA">
                        <axis:alt f="axisctr024" c="ETIQ_PANTALLA" lit="104752"></axis:alt>
                    </axis:visible>
                    <axis:visible f="axisctr024" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
                    </axis:visible>
                </c:param>
                <c:param name="formulario"><axis:alt f="axisctr024" c="formulario" lit="1000192" /></c:param>
                <c:param name="form">axisctr024</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr024" c="nid" lit="1000205" />|true</c:param>
            </c:import>           
            <!-- Área de campos  -->
            <div class="separador">&nbsp;</div>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            
                <tr>
                    <td>
                          <table class="seccion">
                            <tr>
                                <td align="left">
                        <table class="area" align="center">
                             <%-->INI Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos<--%>
                            <axis:visible c="DOC_REQUERIDA" f="axisctr024">
                            <c:if test="${ !empty docu_requerida && empty requestScope.__mensajes.m__clave }">
                                <tr>
                                    <td class="campocaja">
                                        <img src="images/mes.gif" id="DSP_DOCU_REQUERIDA_parent" onclick="objEstilos.toggleDisplay('DSP_DOCU_REQUERIDA', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axisctr024" c="DOCU_REQUERIDA" lit="9901998"/></b> 
                                        <axis:visible c="BT_EDITAR_DOC_REQUERIDA" f="axisctr024">
                                        <div style="float:right;" id="BT_EDITAR_DOC_REQUERIDA" name="BT_EDITAR_DOC_REQUERIDA">
                                            <a href="javascript:f_abrir_axisctr173()">
                                              <img border="0"
                                                   alt="<axis:alt f='axisctr024' c='LIT39' lit='9901998'/>"
                                                   title="<axis:alt f='axisctr024' c='LIT40' lit='9901998'/>"
                                                   src="images/lapiz.gif"/>
                                            </a>
                                        </div>
                                        </axis:visible>
                                        <hr class="titulo">
                                        
                                        
                                        
                                    </td>
                                </tr>
                                <tr id="DSP_DOCU_REQUERIDA_children" style="display:">
                                    <td align="left">
                                        <div class="displayspace">
                                        
                                        
                                         <c:set var="title0"><axis:alt f="axisctr024" c="DESCRIPCION" lit="100588"/></c:set>
                                         <c:set var="title1"><axis:alt f="axisctr024" c="OBLIGATORIO" lit="112347"/></c:set>
                                         <c:set var="title2"><axis:alt f="axisctr024" c="ADJUNTADO" lit="9901999"/></c:set>
                                         
                                          <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                          requestURI="axis_axisctr024.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                               <%@ include file="../include/displaytag.jsp"%>
                                               <axis:visible c="TDESCRIP" f="axisctr024">
                                               <display:column title="${title0}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                   <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                                               </display:column>
                                              </axis:visible>
                                               <display:column title="${title1}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE" headerClass="sortable"  media="html" autolink="false" >
                                                   <div class="dspText">
                                                            <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                                            id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                            <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                                             disabled="disabled" />
                                                        </div>
                                                    
                                               </display:column>
                                               <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                                                       <div class="dspText">
                                                            <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                                            id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                            <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                            onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}')" disabled="disabled" />
                                                        </div>
                                               </display:column>                                                    
                                          </display:table>
                                          
                                       </div>
                                    </td>
                                </tr>
                            </c:if>
                            </axis:visible>
                         <%-->FIN  Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos <--%>

            <!-- BUG CONF-186 - 22/08/2016 - HRE -->
            <c:if test="${!empty MARCAS}">
                 <tr>
                    <td class="campocaja" >
                        <img id="DSP_MARCAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MARCAS', this)" style="cursor:pointer"/> 
                         <b><axis:alt f="axisctr009" c="DSP_MARCAS" lit="9909288"></axis:alt></b> 
                        <hr class="titulo">
                    </td>
                 </tr>
                <tr id="DSP_MARCAS_children"  style="display:none">
                    <td class="campocaja" >
                        <div class="displayspace">
                             <c:set var="title0"><axis:alt f="axisctr009" c="AREA" lit="9909317" /></c:set>
                             <c:set var="title1"><axis:alt f="axisctr009" c="CODMARCA" lit="109155" /></c:set>                               
                             <c:set var="title2"><axis:alt f="axisctr009" c="DESCRIPCION" lit="101761" /></c:set>
                             <c:set var="title3"><axis:alt f="axisctr009" c="PERSONA" lit="111523" /></c:set>
                             <c:set var="title4"><axis:alt f="axisctr009" c="ROL" lit="9901939" /></c:set>
                             <c:set var="title5"><axis:alt f="axisctr009" c="TIPO" lit="9901195" /></c:set>                         
                             <c:set var="title6"><axis:alt f="axisctr009" c="ACCION" lit="9000844" /></c:set>
                             <c:set var="title7"><axis:alt f="axisctr009" c="DETALLE" lit="1000113" /></c:set>
                             
                             <display:table name="${MARCAS}" id="MARCAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>                         
                               
                               
                               <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.AREA}</div>
                               </display:column>
                               
                               <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.CMARCA}</div>
                               </display:column>
                               
                               <axis:visible f="axisctr009" c="TAUTREC">   
                               <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.DESCRIPCION}</div>
                               </display:column>
                               </axis:visible>
                              
                               <display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.PERSONA} </div>
                               </display:column>
                               
                               <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.ROL} </div>
                               </display:column>
                               
                               
                               <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.TIPO} </div>
                               </display:column>
                               
                               <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${MARCAS.ACCION}</div>
                               </display:column>
                               
                               <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr024" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                    style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axisper046('${MARCAS.SPERSON}', '${MARCAS.CMARCA}')" title="<axis:alt f='axisctr024' c='INFO' lit='1000113'/>"/>
                                    
                                    
                                    </div>
                               </display:column>                           
                            </display:table>
                        </div>
                    </td>
                </tr>
            </c:if>
            <!-- BUG CONF-186 - 22/08/2016 - HRE -->
                        
            <c:if test="${!empty PTPSUS}">
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_PSU_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PSU', this)" style="cursor:pointer"/> 
                         <b><axis:alt f="axisctr024" c="DSP_PSU" lit="9002255"></axis:alt></b> ${PTESTPOL} ${TNIVELBPM}
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_PSU_children"  style="display:none">
                    <td class="campocaja" >              
                        <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr024" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr024" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="axisctr024" c="TAUTREC" lit="9900977" /></c:set>
                         <c:set var="title5"><axis:alt f="axisctr024" c="TRIESGO" lit="100649" />&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="TGARANT" lit="110994" /></c:set>                       
                         <c:set var="title6"><axis:alt f="axisctr024" c="TNIVELR" lit="9900978" /></c:set>
                         <c:set var="title7"><axis:alt f="axisctr024" c="INFO" lit="1000113" /></c:set>
                       
                       <display:table name="${PTPSUS}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr024.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>
                               <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                               </display:column>
                               
                               <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                  <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                               </display:column>
                               
                               <axis:visible f="axisctr024" c="TAUTREC">   
                               <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                               </display:column>
                               </axis:visible>
                               
                               <%--display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.FAUTREC}</div>
                               </display:column>
                               
                               <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TUSUNOM}</div>
                               </display:column--%>
                               
                               <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                               </display:column>
                               
                               <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                               </display:column>
                               
                               <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr024" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                    style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.CAREA}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr024' c='INFO' lit='1000113'/>"/>
                                    </div>
                               </display:column>                           
                            </display:table>
                            </div> 

                        <div class="separador" style="align:right">&nbsp;</div>
                        
                    </td>
                  </tr>
             </c:if>

                 <%--Fin PSU--%>
                <c:if test="${! empty mvtretencion_sup}">
                            <tr>
                                <td class="campocaja" >
                                       <img id="mvtretencion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('mvtretencion', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axisctr024" c="DSP_MVT_RETEN" lit="1000297" /></b>&nbsp;&nbsp;
                                    <hr class="titulo">
                                </td>
                            </tr>
                            <!--  INICIO SECCION CAMPOS **********************************************************  -->
                            <tr id="mvtretencion_children" style="display:">
                                <td align="left" >
                                                <table class="seccion">
                                                    <tr>
                                                        <td class="campocaja">
                                                           <c:set var="title0"><axis:alt f="axisctr024" c="TMOTRET" lit="1000297" /></c:set>
                                                           <c:set var="title1"><axis:alt f="axisctr024" c="FRETEN" lit="1000148" /></c:set>
                                                           <c:set var="title2"><axis:alt f="axisctr024" c="CUSURET" lit="100894" /></c:set>
                                                           <c:set var="title3"><axis:alt f="axisctr024" c="FREVRET" lit="105403" /></c:set>
                                                           <c:set var="title4"><axis:alt f="axisctr024" c="CUSUREF" lit="105404" /></c:set>
                                                           <c:set var="title5"><axis:alt f="axisctr024" c="TRIESGO" lit="100649" /></c:set>
                                                           <c:set var="title6"><axis:alt f="axisctr024" c="TRESULTA" lit="1000345" /></c:set>
                                   
                                                                                                                          
                                                            <div class="displayspace">
                                                            <display:table name="${mvtretencion_sup}" id="mov" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                     requestURI="axis_axisctr025.do?paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                    <display:column title="${title0}" sortable="false" sortProperty="TMOTRET" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">${mov.OB_IAX_POLMVTRETEN.TMOTRET}</div>
                                                                    </display:column>
                                                                    <display:column title="${title1}" sortable="false" sortProperty="FRETEN" headerClass="sortable"  media="html" autolink="false" >
                                                                     <div class="dspText"><fmt:formatDate value='${mov.OB_IAX_POLMVTRETEN.FRETEN}' pattern='dd/MM/yyyy'/></div>
                                                                    </display:column>
                                                                    <display:column title="${title2}" sortable="false" sortProperty="CUSURET" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">${mov.OB_IAX_POLMVTRETEN.CUSURET}</div>
                                                                    </display:column>
                                                                    <display:column title="${title3}" sortable="false" sortProperty="FREVRET" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText"><fmt:formatDate value='${mov.OB_IAX_POLMVTRETEN.FREVRET}' pattern='dd/MM/yyyy'/></div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="false" sortProperty="CUSUREF" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">${mov.OB_IAX_POLMVTRETEN.CUSUREF}</div>
                                                                    </display:column>
                                                                    <display:column title="${title5}" sortable="false" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">${mov.OB_IAX_POLMVTRETEN.TRIESGO}</div>
                                                                    </display:column>
                                                                    <display:column title="${title6}" sortable="false" sortProperty="TRESULTA" headerClass="sortable"  media="html" autolink="false" >
                                                                        <div class="dspText">${mov.OB_IAX_POLMVTRETEN.TRESULTA}</div>
                                                                    </display:column>                                                                    
                                                                 </display:table>
                                                                 
                                                            </div>
                                                        </td>
                                                    </tr>
                                            </table>
                            </td>
                        </tr>
                </c:if>
                
                
                
<%---------------Inspección de riesgo--------------%>
<axis:visible f="axisctr024" c="DSP_INSPECCION_RIESGO" >
        <%--c:if test="${!empty INSPECCION_RIESGO}"--%>
                
                <tr>
                    <td class="campocaja" >                        
                        <img id="DSP_INSPECCION_RIESGO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_INSPECCION_RIESGO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="DSP_INSPECCION_RIESGO" lit="9905241"/></b>
                        <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_inspecciones('${INSPECCION_RIESGO[0].CTIPMAT}', '${INSPECCION_RIESGO[0].CMATRIC}');" style="cursor:pointer" align="right"/>
                        <hr class="titulo"></hr>
                    </td>
                </tr>                
                
                <tr id="DSP_INSPECCION_RIESGO_children" style="display:none"> 
                  <td>
                  <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                        <axis:visible c="CINSPREQ" f="${pantalla}">
                               <td class="titulocaja"> 
                               <b><axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/></b><br>
                               </td>
                               </axis:visible>
                                <axis:visible c="CRESULTR" f="${pantalla}">
                                <td class="titulocaja"> 
                                <b><axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/></b><br>
                               </td>
                               </axis:visible>
                   </tr>
                   <tr>
                    <td class="campocaja">                        
                        <axis:ocultar c="CINSPREQ" f="axisctr024" dejarHueco="false">
                            <select name = "CINSPREQ" id ="CINSPREQ" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr024" c="CINSPREQ" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr024" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec1}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CINSPREQ ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>
                        </axis:ocultar> 
                        </td>
                          <td class="campocaja" >  
                       
                        <axis:ocultar c="CRESULTR" f="axisctr024" dejarHueco="false">
                            <select name = "CRESULTR" id ="CRESULTR" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr024" c="CRESULTR" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr024" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec2}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CRESULTR ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>            
                        </axis:ocultar>
                        </td>
                        </tr>
                        <tr>
                        <td class="campocaja" colspan="4">
                        
                         <div class="displayspace">
                            <c:set var="title0"><axis:alt f="axisctr024" c="CNORDEN" lit="9905245" /></c:set>
                            <c:set var="title1"><axis:alt f="axisctr024" c="CNINSPECCION" lit="9905246" /></c:set>                               
                            <c:set var="title2"><axis:alt f="axisctr024" c="FSOLICITUD" lit="9905247" /></c:set>
                            <c:set var="title3"><axis:alt f="axisctr024" c="TESTADOORDEN" lit="9905248" /></c:set>                         
                            <c:set var="title4"><axis:alt f="axisctr024" c="TCLASE" lit="9905249" /></c:set>
                            <c:set var="title5"><axis:alt f="axisctr024" c="FVTOORDEN" lit="9905250" /></c:set>
                            <c:set var="title6"><axis:alt f="axisctr024" c="FINSPECCION" lit="9905251" /></c:set>
                            <c:set var="title7"><axis:alt f="axisctr024" c="TESTADOINSPECCION" lit="9905252" /></c:set>
                             
                             <display:table name="${INSPECCION_RIESGO}" id="INSPECCION_RIESGO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>
                               
                               <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.SORDEN}</div>
                               </display:column>
                               
                               <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.NINSPECCION}</div>
                               </display:column>
                               
                               <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                               </display:column>                           
                               
                               <display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOORDEN}</div>
                               </display:column>                         
                               
                               <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TCLASE}</div>
                               </display:column>
                               
                               <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FVTORDEN}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FINSPECCION}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title7}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOINSPECCION}</div>
                               </display:column>
                               
                               <c:if test="${!empty INSPECCION_RIESGO.NINSPECCION}" > 
                                   <display:column headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                       <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr024" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px" onclick="javascript:f_consultar_inspeccion(${INSPECCION_RIESGO.SORDEN}, ${INSPECCION_RIESGO.NINSPECCION})"
                                       style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='axisctr024' c='INFO' lit='1000113'/>"/>
                                       </div>
                                   </display:column>
                               </c:if>
                           </display:table>
                        </div>
                    </td>
                    </tr>
                    </table>
                    </td>
                    </tr>
                    
                
                
    <%--/c:if--%>
</axis:visible>
<%------------- Fi Inspección de riesgo ------------------%>

<!--'Número de caso BPM' y 'Número de solicitud BPM'-->
<axis:ocultar c="DSP_BPM" f="axisctr024" dejarHueco="false">
        <div class="separador">&nbsp;</div>
        <tr>
            <td class="campocaja" >
                <div class="separador">&nbsp;</div>
                   <img id="bpm_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('bpm', this)" style="cursor:pointer"/> 
                <b><axis:alt f="axisctr024" c="titulo" lit="9906103" /></b>&nbsp;&nbsp;
                <hr class="titulo">
            </td>
        </tr>
        <tr id="bpm_children" style="display:none"><td align="left" colspan="2">
            <table style="width:320px;">
                <tr>
                    <axis:ocultar f="axisctr024" c="NCASO_BPM" dejarHueco="false">                                
                        <td class="titulocaja">
                            <b><axis:alt f="axisctr024" c="NCASO_BPM" lit="9906097" /></b>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr024" c="NSOLICI_BPM" dejarHueco="false">                                
                        <td class="titulocaja">
                            <b><axis:alt f="axisctr024" c="NSOLICI_BPM" lit="9906098" /></b>
                        </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar f="axisctr024" c="NCASO_BPM" dejarHueco="false">                                
                        <td class="titulocaja">
                            <input type="text" class="campowidthinput campo campotexto" id="NCASO_BPM" name="NCASO_BPM" style="width:130px;" 
                            value="${__formdata.caso_bpm.NCASO_BPM}" readonly="true" />
                        </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr024" c="NSOLICI_BPM" dejarHueco="false">                                
                        <td class="titulocaja">
                            <input type="text" class="campowidthinput campo campotexto" id="NSOLICI_BPM" name="NSOLICI_BPM" style="width:130px;" 
                            value="${__formdata.caso_bpm.NSOLICI_BPM}" readonly="true" />
                        </td>
                    </axis:ocultar>
                </tr>
            </table>
        </td></tr>
</axis:ocultar>
<!--fin BPM-->
                <div class="separador">&nbsp;</div>
                            <tr>
                            
                                <td class="campocaja" >
                                <div class="separador">&nbsp;</div>
                                       <img id="datossuplementos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datossuplementos', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axisctr024" c="datossuplementos" lit="1000192" /></b>&nbsp;&nbsp;
                                    <hr class="titulo">
                                </td>
                            </tr>
                            
                            <!--  INICIO SECCION CAMPOS **********************************************************  -->
                            <tr id="datossuplementos_children" style="display:none">
                                <td align="left" >
                                 <b>
                                    <axis:visible c="FSUPLEM" f="axisctr024">
                                        <axis:alt f="axisctr024" c="FSUPLEM" lit="1000149"></axis:alt> <fmt:formatDate value="${__formdata.T_IAX_DETMOVSEGURO[0].OB_IAX_DETMOVSEGURO.FSUPLEM}" pattern="dd/MM/yyyy"/>
                                    </axis:visible>
                                 </b>
                               <table class="seccion">
                             
                                <div class="separador">&nbsp;</div>
                                <tr>
                                    <td class="campocaja">
                                        <c:set var="title0"><axis:alt f="axisctr024" c="TVALORA" lit="100892" /></c:set>
                                        <c:set var="title1"><axis:alt f="axisctr024" c="TVALORD" lit="151274" /></c:set>
                                        <div class="displayspace">
                                        
                                            <display:table name="${__formdata.T_IAX_DETMOVSEGURO}" id="T_IAX_DETMOVSEGURO" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                 requestURI="axis_axisctr025.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TVALORA}</div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="false" sortProperty="idClausula" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${T_IAX_DETMOVSEGURO.OB_IAX_DETMOVSEGURO.TVALORD}</div>
                                                </display:column>
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
             </table>
            <div class="separador">&nbsp;</div>
            <!-- Added for BACK (anterior) button (IAXIS-4321) PK-16/06/2019 -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr024</c:param>
                <c:param name="__botones">salir<c:if test="${!empty __formdata.T_IAX_DETMOVSEGURO || !empty __formdata.REVISARINSPECCION}"><axis:visible c="BT_GUARDAR_SUPLEMENTO" f="axisctr024">,1000081</axis:visible><axis:visible c="BT_ACEPTAR" f="axisctr024">,aceptar</axis:visible><axis:visible f="axisctr024" c="BT_ANT">,anterior</axis:visible><c:if test="${__formdata.ES_COL_ADMIN==0}"><c:if test="${!(__formdata.CACCION ==1 || __formdata.CACCION ==2)  && __formdata.FACT_ELECTRONICA==0}"><axis:visible c="BT_EMITIR" f="axisctr024">,emitir</axis:visible></c:if></c:if><axis:visible c="BT_CONTINUAR" f="axisctr024">,continuar</axis:visible><axis:visible c="BT_DIFERIR" f="axisctr024"><c:if test="${BOTONDIFERIR == 1}">,9001507</c:if></axis:visible><c:if test="${ __formdata.CACCION !=2}"><axis:visible c="BT_GUARDAR" f="axisctr024">,guardar</axis:visible></c:if></c:if></c:param>            
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
