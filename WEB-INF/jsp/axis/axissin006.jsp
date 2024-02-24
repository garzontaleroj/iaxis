<%/* Revision:# 6FGGjEc2VLMNlrpQNOh0AQ== # */%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="movimiento_ult">${fn:length(__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS)-1}</c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axissin006" c="LIT_TITULO" lit="1000231"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            var vctramte = '';

            function f_onload(){
                f_setTRIds();
                var cabcelera = "<%=request.getSession().getAttribute("cabcelera")%>";
                var nsinies = "${__formdata.NSINIES_OUT}";
                var grabat = "${__formdata.GRABAT}";
                var sidepag_out = "${__formdata.SIDEPAG_OUT}";
                var compensado_out = "${__formdata.COMPENSADO_OUT}";//AAC_INI:0033798
                        
                if(!objUtiles.estaVacio(sidepag_out)){
                     alert('<axis:alt f='axissin006' c='LIT_SIDEPAG_OUT' lit='9900971'/>'+sidepag_out);
                     objEstilos.toggleDisplay("tramitaciones", document.getElementById("tramitaciones_parent"));
                     document.getElementById("tramitaciones_parent").focus();
                }
                //AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros VS cartera (bug hermano interno)
                if(!objUtiles.estaVacio(compensado_out)){
                    alert(compensado_out);
                     objEstilos.toggleDisplay("tramitaciones", document.getElementById("tramitaciones_parent"));
                     document.getElementById("tramitaciones_parent").focus();
                }
	       //AAC_FI
            
                f_cargar_propiedades_pantalla();
						 
                <c:if test="${empty __formdata.OB_IAX_SINIESTRO.NSINIES && (empty __formdata.isNew || !__formdata.isNew)}">
                    f_abrir_axissin019();
                    objDom.setDisabledPorId("but_mas_recibos", true);
                    objDom.setValorPorId("indexRecobro_OFI", "");
                    objDom.setValorPorId("indexPago_OFI", "");
                </c:if>

                <c:if test="${!empty __formdata.SSEGURO && empty __formdata.OB_IAX_SINIESTRO.NSINIES}">
                    param = "&SPRODUC="+document.miForm.SPRODUC.value+"&SSEGURO="+objDom.getValorPorId("SSEGURO")+'&CACTIVI='+document.miForm.CACTIVI.value;
                    f_abrir_modal('axissin017',null,param);
                </c:if>                

                if (!objUtiles.estaVacio(nsinies) && nsinies > 0 && !objUtiles.estaVacio(grabat) && grabat == 0)   {
                    alert("<axis:alt f='axissin006' c='LIT_IMP_NSINIES' lit='9001425'/>"+" : "+ nsinies);
                    //Imprimimos el siniestro
                    <c:if test="${__formdata.CMODO == 'ALTA_SINIESTROS'}">
                        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=SINIES");
                    </c:if>
                    //f_but_cancelar();
                }
            
                if(!objUtiles.estaVacio(document.miForm.OK.value) && document.miForm.OK.value == 'OK' && !objUtiles.estaVacio(document.miForm.isNew.value) && document.miForm.isNew.value == 'yes'){
                    VRIESGO = "${__formdata.OB_IAX_SINIESTRO.NRIESGO}";
                    // bug 22108 : seccion + NTRAMIT
                    var seccion = "${seccion}";
                    if(seccion == 'tramitaciones_pagos'){
                        <axis:visible f="axissin006" c="DSP_PAGOS_GAR_GEN">
                            f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NRIESGO='+VRIESGO+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=2&SIDEPAG='+document.miForm.SIDEPAG.value+'&indexPago='+'${__formdata.indexPago}'+'&SECCION=pagos');                    
                        </axis:visible>
                    }
                    if(seccion == 'tramitaciones_recobros')
                       f_abrir_modal('axissin014',null,'&isNew=yes&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NRIESGO='+VRIESGO+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&CTIPPAG=7&SIDEPAG='+document.miForm.SIDEPAGRECOB.value+'&indexRecobro='+'${__formdata.indexRecobro}'+'&SECCION=recobros');  
                }

                objEstilos.toggleDisplay("tramitaciones", document.getElementById("tramitaciones_parent"));

                <c:if test="${subpantalla!=null && subpantalla!='no_disponible' && subpantalla!='null'}">
                    
                    var subpantalla = '${subpantalla}';
                    if(subpantalla!='siniestros' && subpantalla!='tramitaciones'){    
                    	objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla + "_parent"));
                    }

                    document.getElementById('${subpantalla}_parent').focus();
                    document.getElementById('${subpantalla}_parent').blur();
                </c:if>

                <c:if test="${seccion!=null && seccion!='no_disponible' && seccion!='null'}">   
                    var seccion = '${seccion}';  
                    objEstilos.toggleDisplay(seccion, document.getElementById(seccion + "_parent"));
                </c:if>  
              
                var CAGENTE_SEL = "${__formdata.OB_IAX_SINIESTRO.CAGENTE}";
                if (!objUtiles.estaVacio(CAGENTE_SEL)){
                    f_actualizar_agente(CAGENTE_SEL);
                }
            }


            function f_actualizar_agente(CAGENTE_SINI){       
                if (!objUtiles.estaVacio(CAGENTE_SINI)){
                    objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE_SINI, this);
                }
            }


            function callbackAjaxCargarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_SIN", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE_SIN", NOMBREformateado); 
                }
            }


            // bug 0021662
            function f_informe_resumen() {
                var inputs=document.getElementsByTagName("input");
                var NSINIES = document.miForm.NSINIES.value;
                var param = "|NSINIES:"+NSINIES+"|CIDIOMA:|"; 
                var maps = "|520|";
                objUtiles.ejecutarFormulario ("axis_axissin006.do?CMAP=" + maps +"&CPARAMETROS=" + param, "generar_resultados_maps", document.miForm, "_self", objJsMessages.jslit_cargando);
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


            function f_cerrar_axissin014(val){
                if(val == 'cancelar')
                    document.miForm.OK.value ='';
                f_cerrar_modal("axissin014");
            }


            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
            }


            function f_guardarAxissin042(NTRAMTE){
                f_cerrar_modal("axissin042");
                objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }


            function f_cambio_estado(NUEVO_ESTADO){
                
                var NSINIES_AUX = document.miForm.NSINIES.value;
                var CESTSIN_AUX = document.miForm.CESTSIN_AUX.value;
                var TESTSIN_AUX = document.miForm.TESTSIN_AUX.value;
                var CTIPDES_AUX = document.miForm.CTIPDES_AUX.value;
                var CUNITRA_AUX = document.miForm.CUNITRA_AUX.value;
                var CTRAMITAD_AUX = document.miForm.CTRAMITAD_AUX.value;
                var FESTSIN_AUX = document.miForm.FESTSIN_AUX.value;
                var SSEGURO = document.miForm.SSEGURO.value;
                var CESTSIN_PRIMERO = document.miForm.CESTSIN_PRIMERO.value;
                
                param = "&isNew=no&SPRODUC="+document.miForm.SPRODUC.value;
                param = param + "&NSINIES_AUX=" + NSINIES_AUX;
                param = param + "&CESTSIN_AUX=" + CESTSIN_AUX;
                param = param + "&TESTSIN_AUX=" + TESTSIN_AUX;
                param = param + "&CTIPDES_AUX=" + CTIPDES_AUX;
                param = param + "&CUNITRA_AUX=" + CUNITRA_AUX;
                param = param + "&FESTSIN_AUX=" + FESTSIN_AUX;
                param = param + "&NUEVO_ESTADO=" + NUEVO_ESTADO;
                param = param + "&CTRAMITAD_AUX=" + CTRAMITAD_AUX;
                param = param + "&SSEGURO=" + SSEGURO;
                param = param + "&CESTSIN_PRIMERO=" + CESTSIN_PRIMERO;
                
                //Bug 26044 - 02/09/2013 - dlF
                objDom.setValorPorId("NEW_STATUS", NUEVO_ESTADO);
                //--fin 26044 - 02/09/2013 - dlF

                f_abrir_modal('axissin027',null, param);
            }


            function f_but_9001302(){
                 f_cambio_estado('0');
            }


            //Cambiar estaedo a Finalizado = 1
            function f_but_9002021(){
                f_cambio_estado('1');
            }
        

            //Cambiar estado a Anulado = 2
            function f_but_110074(){ 
                f_cambio_estado('2');
            }


            //Cambiar estado a Rechazado = 3
            function f_but_89906261(){
                f_cambio_estado('3');
            }

            //Cambiar estado a Reabierto = 4
            function f_but_9002022(){
                f_cambio_estado('4');
            }


            // bug 0023643 cambiar tramitador
            function f_but_140769(){
                var NSINIES_AUX = document.miForm.NSINIES.value;
                var CESTSIN_AUX = document.miForm.CESTSIN_AUX.value;
                var TESTSIN_AUX = document.miForm.TESTSIN_AUX.value;
                var CTIPDES_AUX = document.miForm.CTIPDES_AUX.value;
                var CUNITRA_AUX = document.miForm.CUNITRA_MOVSIN.value;
                var CTRAMITAD_AUX = document.miForm.CTRAMITAD_MOVSIN.value;
                var FESTSIN_AUX = document.miForm.FESTSIN_AUX.value;
                var SSEGURO = document.miForm.SSEGURO.value;

                param = "&isNew=no&SPRODUC="+document.miForm.SPRODUC.value;
                param = param + "&NSINIES_AUX=" + NSINIES_AUX;
                param = param + "&CESTSIN_AUX=" + CESTSIN_AUX;
                param = param + "&TESTSIN_AUX=" + TESTSIN_AUX;
                param = param + "&CTIPDES_AUX=" + CTIPDES_AUX;
                param = param + "&CUNITRA_AUX=" + CUNITRA_AUX;
                param = param + "&FESTSIN_AUX=" + FESTSIN_AUX;
                param = param + "&NUEVO_ESTADO=" + CESTSIN_AUX;
                param = param + "&CTRAMITAD_AUX=" + CTRAMITAD_AUX;
                param = param + "&SSEGURO=" + SSEGURO;
                                
                f_abrir_modal('axissin056',null, param);               
            }
            
            function f_but_9001358(){
                var NSINIES_AUX = document.miForm.NSINIES.value;
                var SSEGURO = document.miForm.SSEGURO.value;
                var CMODO = document.miForm.CMODO.value;
                /* ---3602 Initial */
                var TTRAMIT = document.miForm.AXISTRAMIT.value;
                param = "&isNew=no&SPRODUC="+document.miForm.SPRODUC.value;
                param = param + "&CMODO="+CMODO;
                param = param + "&NSINIES_AUX=" + NSINIES_AUX;
                param = param + "&SSEGURO=" + SSEGURO;
                param = param + "&TTRAMIT=" + TTRAMIT; /* TRAMIT ADDED for Final of 3602 */          
                f_abrir_modal('axissin064',null, param);                   
            }


            function f_cerrar_axisimprimir(){
                objUtiles.cerrarModal("axisimprimir");
                if(document.miForm.IMP_SIDEPAG.value == 1){
                    objDom.setValorPorId("IMP_SIDEPAG", "");
                }else{
                    f_but_cancelar();
                }
            }

            
            /****************************************************************************************/
            /************************************* MODALES ******************************************/
            /****************************************************************************************/
            
            /************************************ CONSULTA SINIES **********************************/
            function f_abrir_axissin002() {
                objDom.setValorPorId("indexTramitacio", "");
                objDom.setValorPorId("indexReserva", "");
                objDom.setValorPorId("indexPago", "");
                objDom.setValorPorId("indexRecobro", "");
                objUtiles.abrirModal("axissin002MOD","src","modal_axissin002MOD.do?operation=form");
            }


            function f_cerrar_axissin002() {
                objUtiles.cerrarModal("axissin002MOD");
            }  


            function f_aceptar_axissin002(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
               f_cerrar_axissin002();
               objDom.setValorPorId("isNew", "false");
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objDom.setValorPorId("SPRODUC", SPRODUC);
               objDom.setValorPorId("CACTIVI", CACTIVI);
               objUtiles.ejecutarFormulario ("axis_axissin006.do", "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
               objDom.setDisabledPorId("but_mas_recibos", false);
            }


            function f_oberturaSinistre() {
                objUtiles.cerrarModal("axissin002MOD");
                f_abrir_axisctr019();
            }             


            /********************************** CONSULTA POLIZA  **********************************/
            function f_abrir_axisctr019() {
               objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=SINIS");               
            }


            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }


            function f_oberturasini(SSEGURO){
                objDom.setValorPorId("SSEGURO", SSEGURO);

                f_cerrar_axisctr019();
                objDom.setValorPorId("LIMPIAR_DATOS", "true");
                objDom.setValorPorId("isNew", "true");
                objDom.setValorPorId("NSINIES", "");
                objUtiles.ejecutarFormulario ("axis_axissin006.do", "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
                <%--objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);--%>
            }

            
            /*********************************** MAS RECIBOS ****************************************/

            function f_abrir_axissin004() {
                objUtiles.abrirModal("axissin004MOD", "src", "modal_axissin004MOD.do?operation=form&SSEGURO=" + objDom.getValorComponente(document.miForm.SSEGURO));
            }

            
            function f_cerrar_axissin004() {
                objUtiles.cerrarModal("axissin004MOD");
            }  

            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_but_cancelar() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin006", "cancelar", document.miForm, "_self");
            }
            
             // llamada a la pantalla axissin062
            function f_but_9907320() {
                var NSINIES_AUX = document.miForm.NSINIES.value;
                var NTRAMIT = document.miForm.NTRAMIT.value;
                var CESTSIN_AUX = document.miForm.CESTSIN_AUX.value;
                var TESTSIN_AUX = document.miForm.TESTSIN_AUX.value;
                var CTIPDES_AUX = document.miForm.CTIPDES_AUX.value;
                var CUNITRA_AUX = document.miForm.CUNITRA_MOVSIN.value;
                var CTRAMITAD_AUX = document.miForm.CTRAMITAD_MOVSIN.value;
                var FESTSIN_AUX = document.miForm.FESTSIN_AUX.value;
                var SSEGURO = document.miForm.SSEGURO.value;

                param = "&isNew=no&SPRODUC="+document.miForm.SPRODUC.value;
                param = param + "&NSINIES_AUX=" + NSINIES_AUX;
                param = param + "&NTRAMIT=" + NTRAMIT;
                param = param + "&CESTSIN_AUX=" + CESTSIN_AUX;
                param = param + "&TESTSIN_AUX=" + TESTSIN_AUX;
                param = param + "&CTIPDES_AUX=" + CTIPDES_AUX;
                param = param + "&CUNITRA_AUX=" + CUNITRA_AUX;
                param = param + "&FESTSIN_AUX=" + FESTSIN_AUX;
                param = param + "&NUEVO_ESTADO=" + CESTSIN_AUX;
                param = param + "&CTRAMITAD_AUX=" + CTRAMITAD_AUX;
                param = param + "&SSEGURO=" + SSEGURO;
                                
                f_abrir_modal('axissin062',null, param);  
            }
            
            // llamada a consulta poliza '*','CONSPOLIZA','axisctr020'
            function f_but_151477() {
                objUtiles.ejecutarFormulario("axis_axissin006.do", "consultarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            //function f_aceptar_axissin010() {
            //f_cerrar_modal("axissin010");
            //objDom.setValorPorId("isNew", "false");
            //objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            //}

        
            /****************************************************************************************/
            /************************************** DETALLE *****************************************/
            /****************************************************************************************/
            
            function mostrar(nombreCapa){ 
                document.getElementById(nombreCapa).style.visibility="visible"; 
            } 

    
            function ocultar(nombreCapa){ 
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            
            /*****************************************************************************************/
            /************************************* MODALES *******************************************/
            /*****************************************************************************************/
            
            function f_getTramitacion(indexNou, NTRAMIT,CTRAMIT){
               if (document.miForm.indexTramitacio.value != indexNou){
                  document.miForm.indexTramitacio.value = indexNou;
                  document.miForm.NTRAMIT.value = NTRAMIT;
                  document.miForm.CTRAMIT.value = CTRAMIT;
                  document.miForm.subpantalla.value="tramitaciones";
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "recargarRadios", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
                }
            }

            function f_aceptar_axissin070(){
                  f_cerrar_modal("axissin070");
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            } 

            function f_aceptar_axissin017(){
                  f_cerrar_modal("axissin017");
                  objDom.setValorPorId("isNew", "false");
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            } 
            function f_aceptar_axissin068(){
                  f_cerrar_modal("axissin068");
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "cargarJudicial", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            } 
            
            function f_aceptar_axissin065(){
                  f_cerrar_modal("axissin065");
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "cargarFiscal", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            } 

            function f_cancelar_axissin017(){
                  f_cerrar_modal("axissin017");
                  objDom.setValorPorId("isNew", "false");
                  objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }       


            function f_abrir_axissin019() {
                objDom.setValorPorId("indexTramitacio", "");
                objDom.setValorPorId("indexReserva", "");
                objDom.setValorPorId("indexPago", "");
                objDom.setValorPorId("indexRecobro", "");
                objUtiles.abrirModal("axissin019","src","modal_axissin019.do?operation=form&tipo=SINIESTRO");
            }


            function f_cerrar_axissin019() {
                objUtiles.cerrarModal("axissin019");
                f_but_cancelar();
            } 


            function f_aceptar_axissin027(NSINIES) {
           
                objUtiles.cerrarModal("axissin027");

                //Bug 26044 - 02/09/2013 - dlF
                var estado = document.miForm.NEW_STATUS.value;
                var print = '${__formdata.PRINT_RECHAZO_SIN}';

                //Si rechazo y producto imprimible "Carta Rechazo siniestro"
                if ( ! ((print == 1) && (estado == 3)) ){
                	objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin006", "cancelar", document.miForm, "_self");
                }
 
            }
            
            function f_aceptar_axissin062(NSINIES) {
                objUtiles.cerrarModal("axissin062");
                objUtiles.ejecutarFormulario("axis_axissin006.do?NSINIESselected="+NSINIES, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);
            }


            // bug 0023643 cambiar tramitador
            function f_aceptar_axissin056(NSINIES) {
               objUtiles.cerrarModal("axissin056");
               objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+document.miForm.NSINIES.value, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
               objDom.setDisabledPorId("but_mas_recibos", false);
            }
    
    
            function f_aceptar_axissin019(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
               objUtiles.cerrarModal("axissin019");
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objDom.setValorPorId("SPRODUC", SPRODUC);
               objDom.setValorPorId("CACTIVI", CACTIVI);
               document.miForm.NSINIES.value = NSINIES;
               objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+NSINIES, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
               objDom.setDisabledPorId("but_mas_recibos", false);
            }
    
            function f_but_aceptar(){
                objUtiles.ejecutarFormulario ("axis_axissin006.do", "grabarSinistre", document.miForm, "_self", objJsMessages.jslit_cargando);                 
            }
        
            function f_borrar_agenda(IDOBS){
                // Antes de proceder a borrar el registro, pedimos confirmacion
                var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                       objDom.setValorPorId("IDOBS", IDOBS);
                       objUtiles.ejecutarFormulario ("axis_axissin006.do", "borrar_agenda", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }
            
            function f_borrar_tramitacion(NTRAMIT,CTIPTRA){
                // Antes de proceder a borrar el registro, pedimos confirmacion
                var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                       objDom.setValorPorId("NTRAMIT", NTRAMIT);
                       objDom.setValorPorId("CTIPTRA", CTIPTRA);
                       objUtiles.ejecutarFormulario ("axis_axissin006.do", "borrar_tramitacion", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }

            function f_borrar_detallepago(CTIPPAG,CTIPRES,CGARANT,NMOVRES,CSIDEPAG,NORDEN){
                // Antes de proceder a borrar el registro, pedimos confirmacion
                var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    document.miForm.subpantalla.value="tramitaciones"; 
                    objUtiles.ejecutarFormulario ("axis_axissin006.do?CTIPPAG="+CTIPPAG+"&CTIPRES="+CTIPRES+"&CGARANT="+CGARANT+"&NMOVRES="+NMOVRES+"&CSIDEPAG="+CSIDEPAG+"&NORDEN="+NORDEN, "borrar_detallepago", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }            
            
            function f_consulta_persona(){
                var sp = "${__formdata.OB_IAX_SINIESTRO.DEC_SPERSON}";
                var ns = "${__formdata.OB_IAX_SINIESTRO.NSINIES}";
                objUtiles.ejecutarFormulario("axis_axissin006.do?SPERSON_CON="+sp+"&NSINIES_CON="+ns, "consulta_persona", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_aceptar_axisagd002(){
                f_cerrar_modal('axisagd002');
                objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
               
            function f_gestioagenda(IDOBS,CTIPAGD, modificacion){
                NSINIES = "${__formdata.OB_IAX_SINIESTRO.NSINIES}";
                PANTALLA = "axissin006";
                objUtiles.abrirModal("axisagd002", "src", "modal_axisagd002.do?operation=init&IDOBS="+IDOBS+"&CTIPAGD="+CTIPAGD+"&NSINIES="+NSINIES+"&MODIFICACION="+modificacion+"&PANTALLA="+PANTALLA);
            }
            
            //18176 
            function f_agd_gestioagenda(IDAPUNTE,IDAGENDA,CMODO) {          
                param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO;                            
                objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
            }
                    
            function f_agd_gestioagenda_alta(IDAPUNTE,IDAGENDA,CMODO) {          
                param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO+"&CCLAGD=0&TCLAGD="+document.miForm.NSINIES.value+"&TCLAGD_OUT="+document.miForm.NSINIES.value+"&NTRAMIT=0";                                               
                objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=form" + param); 
            }
			
			function f_agd_gestioagenda_alta_tramit(IDAPUNTE,IDAGENDA,CMODO) {          
                param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO+"&CCLAGD=0&TCLAGD="+document.miForm.NSINIES.value+"&TCLAGD_OUT="+document.miForm.NSINIES.value+"&NTRAMIT="+document.miForm.NTRAMIT.value;                                               
                objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=form" + param); 
            }
                    
            function f_cerrar_modal_004(PANTALLA) {
                objUtiles.cerrarModal(PANTALLA);                    
                objUtiles.ejecutarFormulario ("axis_axissin006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            
            function f_cerrar_modal_064(PANTALLA) {
                objUtiles.cerrarModal(PANTALLA);                    
                objUtiles.ejecutarFormulario ("axis_axissin006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
            //18176
        
            /*--DECLARAR--*/
           /*function f_but_9902293(){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO="+document.miForm.SSEGURO.value+"&TIPO=SINIES");
            }*/
        
            function f_but_9902293(){
                     f_cambio_estado('6');
            }
            
            function f_but_9901400(){
                     f_cambio_estado('5');
            }
    
            function f_alta_referencia(){
                var NSINIES = "${__formdata.NSINIES}";
                f_abrir_axissin044(NSINIES);
            }
            
            function f_modificar_ref(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext){
                var url = '&CTIPREF='+CTIPREF+'&TREFEXT='+TREFEXT+'&FREFINI='+FREFINI+'&FREFFIN='+FREFFIN+'&SREFEXT='+srefext;
                objUtiles.abrirModal("axissin044","src","modal_axissin044.do?operation=form"+url);   
                
            }
            function f_abrir_axissin044(NSINIES) {
                objUtiles.abrirModal("axissin044","src","modal_axissin044.do?operation=form&NSINIES="+NSINIES);               
            }
                
            function f_cerrar_axissin044(){
                objUtiles.cerrarModal("axissin044");
            }
            
            function f_aceptar_axissin044(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF){
                f_anyadir_fila(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext,TTIPREF);
                f_cerrar_axissin044();
            }
    
 
            function f_anyadir_fila(CTIPREF,TREFEXT,FREFINI,FREFFIN,srefext, TTIPREF){
                var tbody = objLista.obtenerBodyLista("miListaRef");
                var tr = objLista.obtenerFilasBodyLista("miListaRef", tbody);
                //objLista.borrarFilasDeLista ("miListaRef", "15", '<axis:alt f="axissin032" c="NOREG" lit="1000254"/>');
                objLista.borrarFilaVacia(tbody, tr);
                var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = null;
                if(document.getElementById(srefext)== null){
                    newtr = objLista.crearNuevaFila(rowstyle);
                }else{
                    newtr = document.getElementById(srefext);
                    try{
                        //FIREFOX
                        while(newtr.childNodes.length> 0)
                        {           
                            newtr.removeChild(newtr.childNodes[0]);
                        }
                    }catch(e){alert(e);}
                }
                newtr.id = srefext;
                var newtd = new Array(4);
                var ttd = 0;
                
                <axis:visible f="axissin006" c="TIPOREF">
                    newtd[ttd] = objLista.addNumeroEnLista(TTIPREF);ttd++;
                </axis:visible>
                
                <axis:visible f="axissin006" c="CODIGO">
                    newtd[ttd] = objLista.addNumeroEnLista(TREFEXT);ttd++;
                </axis:visible>
                
                <axis:visible f="axissin006" c="FINI">
                    newtd[ttd] = objLista.addNumeroEnLista(FREFINI);ttd++;
                </axis:visible>
                
                <axis:visible f="axissin006" c="FFIN">
                    newtd[ttd] = objLista.addNumeroEnLista(FREFFIN);ttd++;
                </axis:visible>
                
                <axis:visible f="axissin006" c="MODIFICAR">
                    newtd[ttd] = objLista.addImagenEnLista("javascript:f_modificar_ref('"+ CTIPREF +"','" + TREFEXT +"','"+ FREFINI +"','"+ FREFFIN +"','"+srefext + "');",
                    "0", "<axis:alt f="axissin006" c="EDITAR" lit="100002" />", "<axis:alt f="axissin006" c="EDITAR" lit="100002"/>", "images/lapiz.gif");ttd++;
                </axis:visible>
                
                <axis:visible f="axissin006" c="ELIMINAR">
                    newtd[ttd] = objLista.addImagenEnLista("javascript:f_eliminar_ref('"+ srefext +"');",
                    "0", "<axis:alt f="axissin006" c="EDITAR" lit="100002" />", "<axis:alt f="axissin006" c="EDITAR" lit="100002"/>", "images/delete.gif");ttd++;
                </axis:visible>

                objLista.addNuevaFila(newtd, newtr, tbody); 
        
                objUtiles.ejecutarFormulario("axis_axissin006.do", "grabarPantalla", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }

            var tsrefext = null;
            function f_eliminar_ref(srefext){
            	var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                tsrefext = srefext;
                objAjax.invokeAsyncCGI("axis_axissin006.do", f_callbackajaxEliminarRef, 
                                "operation=ajax_elimnarref&srefext=" +srefext, this, objJsMessages.jslit_cargando);
                }
            }
    
            function f_callbackajaxEliminarRef(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    try{
                        //ie
                        document.getElementById(tsrefext).removeNode(true);        
                    }catch(e){
                        try{
                            //FIREFOX
                            var Node1 = objLista.obtenerBodyLista("miListaRef");
                            var len = Node1.childNodes.length;
                            for(var i = 0; i < len; i++){           
                                if(Node1.childNodes[i].id == tsrefext){
                                    Node1.removeChild(Node1.childNodes[i]);
                                }
                            }
                        }catch(e){}
                    }

                    var Node1 = objLista.obtenerBodyLista("miListaRef");
                    if(Node1.childNodes){
                        var len = Node1.childNodes.length; 
                        if (len == 0){
                            objLista.borrarFilasDeLista ("miListaRef", "15", '<axis:alt f="axissin006" c="NOREG" lit="1000254"/>'); 
                        }
                    }
                }
                //objUtiles.ejecutarFormulario ("axis_axissin006.do?NSINIESselected="+document.miForm.NSINIES.value, "inicializarDatos", document.miForm, "_self", objJsMessages.jslit_cargando);     
                objUtiles.ejecutarFormulario ("axis_axissin006.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }

            function f_setTRIds(){
                var divs = document.getElementsByTagName("a");   
                for (var i = 0; i < divs.length; i++) {   
                    var status = divs[i].getAttribute("srefext");   
                    if (status != null){
                        divs[i].parentNode.id = "td_"+status;
                        divs[i].parentNode.parentNode.id = status;
                    }
                } 
            }
            
            function f_cerrar_axissin049(){
                objUtiles.cerrarModal('axissin049');
            }
            function f_aceptar_axissin049(){
                f_cerrar_axissin049();
                objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axissin051(){
                objUtiles.cerrarModal('axissin051');
            }
            function f_aceptar_axissin051(){
                f_cerrar_axissin051();
                objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            function f_aceptar_axissin057(){
                f_cerrar_modal("axissin057");
                objUtiles.ejecutarFormulario("axis_axissin006.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_consultarAgente(){
             CAGENTE_SIN = objDom.getValorPorId("CAGENTE_SIN");
              objUtiles.ejecutarFormulario("axis_axissin006.do?CAGENTE_SIN="+CAGENTE_SIN, "consultarAgente", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_borrar_doc(nsinies, ntramit, ndocume){
                var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objUtiles.ejecutarFormulario("axis_axissin006.do?NSINIESDEL="+nsinies+"&NTRAMITDEL="+ntramit+"&NDOCUMEDEL="+ndocume, "borrar_sin_trami_doc", document.miForm, "_self", objJsMessages.jslit_cargando);     
                }
            }
        </script>

    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
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
    
        <!-- Modal direcciones -->
        <c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9909838" />
			</c:param>
			<c:param name="nid" value="axissin070" />
		</c:import>
        <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin006" c="MODAL_IMPRIMIR" lit="1000205" /></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="MODAL_AXISSIN002" lit="1000230" /></c:param>
            <c:param name="nid" value="axissin002MOD" />
        </c:import> 
         <!-- 18176 -->
	<!--IAXIS 2134 AABC CAMBIO DE TITULO DE GESTION TAREAS -->  
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisagd004|<axis:alt f="axisctr020" c="MOD_PANT_AXISAGD004" lit="9909021"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="MODAL_AXISSIN004" lit="1000232" /></c:param>
            <c:param name="nid" value="axissin004MOD" />
        </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin006" c="MODAL_AXISCTR019" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin032" c="titulo_axissin044" lit="9902468" /></c:param>
                <c:param name="nid" value="axissin044"></c:param>
            </c:import>
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <!-- AXISSIN007 ALTA/MODIF. TRAMITACIÓN -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin007|<axis:alt f="axissin006" c="TTITULO" lit="9000979"></axis:alt></c:param>
        </c:import>
        <!--AXISSIN008 ALTA/MODIF. LOCALIZACIONES -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin008|<axis:alt f="axissin006" c="MODAL_AXISSIN008" lit="9000980"/></c:param>
        </c:import>
        <!--  ALTA/MODIF. DAÑOS  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin009|<axis:alt f="axissin006" c="MODAL_AXISSIN009" lit="9000981"/></c:param>
        </c:import>
        <!-- AXISSIN010 ALTA RESERVA  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin010|<axis:alt f="axissin006" c="MODAL_AXISSIN010" lit="9000982"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin084|<axis:alt f="axissin006" c="MODAL_axissin084" lit="1000196"/></c:param> 
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin042|<axis:alt f="axissin006" c="MODAL_AXISSIN042" lit="9901988"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin045|<axis:alt f="axissin006" c="MODAL_AXISSIN045" lit="9902550"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin046|<axis:alt f="axissin006" c="MODAL_AXISSIN046" lit="9902550"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin047|<axis:alt f="axissin006" c="MODAL_AXISSIN047" lit="9902550"/></c:param>
        </c:import>
        <!-- AXISSIN011 ALTA/MODIF. DESTINATARIOS -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin011|<axis:alt f="axissin006" c="MODAL_AXISSIN011" lit="9000896"/></c:param>
        </c:import>
        <!-- AXISSIN012 ALTA PAGOS/RECOBROS -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin012|<axis:alt f="axissin006" c="MODAL_AXISSIN_012" lit="9000983"/></c:param>
        </c:import>
        <!-- AXISSIN013 ALTA MOV. PAGO/RECOBRO -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin013|<axis:alt f="axissin006" c="MODAL_AXISSIN013" lit="9000984"/></c:param>
        </c:import>
        <!-- AXISSIN014 ALTA DETALLE PAGO/RECOBRO -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin014|<axis:alt f="axissin006" c="MODAL_AXISSIN014" lit="9000985"/></c:param>
        </c:import>
        <!-- AXISSIN015 ALTA/MODIF. AGENDA TRAMITACIÓN  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin015|<axis:alt f="axissin006" c="MODAL_AXISSIN015" lit="9002155"/></c:param>
        </c:import>
        <!-- AXISSIN015 ALTA/MODIF. JUICIO  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin049|<axis:alt f="axissin006" c="MODAL_AXISSIN049" lit="9902664"/></c:param>
        </c:import>
        <!-- AXISSIN016 ALTA/MODIF. MOVIMIENTOS TRAMITACIÓN  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin016|<axis:alt f="axissin006" c="MODAL_AXISSIN016" lit="9001130"/></c:param>
        </c:import>
        
          <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin083|<axis:alt f="axissin006" c="MODAL_AXISSIN083" lit="89906303"/></c:param>
        </c:import>

        <!-- AXISSIN055 ALTA/MODIF. MOVIMIENTOS TRAMITE bug 22108 -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin055|<axis:alt f="axissin006" c="MODAL_AXISSIN055" lit="9903646"/></c:param>
        </c:import>

        <!-- AXISSIN056 MOVIMIENTO SINIESTRO bug 0023643 -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin056|<axis:alt f="axissin006" c="MODAL_AXISSIN056" lit="9001473"/></c:param>
        </c:import>
        
         <!-- AXISSIN064 MOVIMIENTO SINIESTRO bug 0023643 -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin064|<axis:alt f="axissin006" c="MODAL_AXISSIN064" lit="9001358"/></c:param>
        </c:import>

        <!-- AXISSIN017 DETALLE SINIESTRO  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin017|<axis:alt f="axissin006" c="MODAL_AXISSIN017" lit="9001131"/></c:param>
        </c:import>
        <!-- AXISSIN018 DETALLE DANYOS VEHICULO  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin018|<axis:alt f="axissin006" c="MODAL_AXISSIN018" lit="9001026"/></c:param>
        </c:import>
        <!-- AXISSIN019 DETALLE SINIESTRO  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin019|<axis:alt f="axissin006" c="MODAL_AXISSIN019" lit="9001334"/></c:param>
        </c:import> 
        <!--  AXISSIN009 ALTA/MODIF. DOCUMENTACION  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin026|<axis:alt f="axissin006" c="MODAL_AXISSIN026" lit="9001518"/></c:param>
        </c:import>
        <!-- AXISSIN027 MODIFICACION ESTADO SINIESTRO/TRAMITACION -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin027|<axis:alt f="axissin006" c="MODAL_AXISSIN027" lit="9002026"/></c:param>
        </c:import>
        <!-- DOCUMENTACION PENDIENTE -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin062|<axis:alt f="axissin006" c="MODAL_AXISSIN062" lit="9907321"/></c:param>
        </c:import>
        <!-- AXISSIN039 PERSONAS ASOCIADAS A UN SINIESTRO -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin039|<axis:alt f="axissin006" c="MODAL_AXISSIN039" lit="9901056"/></c:param>
        </c:import>
        <!-- AXISSIN040 PRESTACIONES -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin040|<axis:alt f="axissin006" c="MODAL_AXISSIN040" lit="9900994"/></c:param>
        </c:import>
        
        <!-- AXISSIN040 PRESTACIONES -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin050|<axis:alt f="axissin006" c="MODAL_AXISSIN050" lit="9000982"/></c:param>
        </c:import>
        
         <!-- AXISSIN043 HISTORICO SINIESTRO -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin043|<axis:alt f="axissin006" c="MODAL_AXISSIN043" lit="9902101"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin051|<axis:alt f="axissin006" c="MODAL_AXISSIN051" lit="9903435"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin052|<axis:alt f="axissin006" c="MODAL_AXISSIN052" lit="9903634"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin057|<axis:alt f="axissin006" c="MODAL_AXISSIN057" lit="102299"/></c:param>
        </c:import>

		<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin068|<axis:alt f="axissin068" c="MODAL_AXISSIN068" lit="9909217"/></c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin065|<axis:alt f="axissin065" c="MODAL_AXISSIN068" lit="9909411"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin076|<axis:alt f="axissin006" c="MODAL_AXISSIN076" lit="9909675"/></c:param>
        </c:import>
		
		<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin071|<axis:alt f="axissin006" c="MODAL_AXISSIN071" lit="9909802"/></c:param>
        </c:import>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axissin006" c="LIT_MODALIDAD" lit="100592" /></c:param>
                <c:param name="titulo"><axis:alt f="axissin006" c="LIT_TTITULO" lit="1000231"/></c:param>
                <c:param name="formulario"><axis:alt f="axissin006" c="LIT_TTITULO" lit="1000231"/></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axissin006</c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="MODAL_AXISSIN037" lit="9900943" /></c:param>
            <c:param name="nid" value="axissin037"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="TIT_AXISAGD002" lit="9001247" /></c:param>
            <c:param name="nid" value="axisagd002"></c:param>
        </c:import>
 		<c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="TIT_AXISSIN074" lit="9909378" /></c:param>
            <c:param name="nid" value="axissin074"></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axissin006" c="TIT_AXISSIN075" lit="9000937" /></c:param>
            <c:param name="nid" value="axissin075"></c:param>
        </c:import>  

    <!-- Area de campos  -->

    <!-- Seccion datos Póliza -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       
       <tr>
          <td>
            <!-- Datos póliza -->
            <div class="separador">&nbsp;</div>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin006" c="LIT_DATOS_POLIZA" lit="1000098" /><c:if test="${__formdata.OB_IAX_SINIESTRO.NSINIES != null}" >&nbsp;-&nbsp;${__formdata.OB_IAX_DATPOLIZA.NPOLIZA}</c:if></div>
                <c:import url="axissin006_datospoliza.jsp"/>
            <div class="separador">&nbsp;</div>
            <!-- Datos último recibo -->
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin006" c="LIT_ULTIMO_RECIBO" lit="111635" /></div>
                <c:import url="axissin006_ultimorecibo.jsp"/>
            <!-- Datos siniestros cabecera -->
            <div class="titulo">
            
            <img src="images/flecha.gif"/>
            <b id = "label_LIT_IMG_GO" ><axis:alt f="axissin006" c="LIT_IMG_GO" lit="104929" /> </b>
            <axis:visible f="axissin006" c="BT_BUSCAR_SINI">
            	 <img border="0" src="images/find.gif" onclick="f_abrir_axissin019()" style="cursor:pointer"/>
            </axis:visible>
            <c:if test="${__formdata.OB_IAX_SINIESTRO.NRECLAMO == null}" >&nbsp;-&nbsp;${__formdata.OB_IAX_SINIESTRO.NSINIES}</c:if>
            <c:if test="${__formdata.OB_IAX_SINIESTRO.NRECLAMO != null}" >&nbsp;-&nbsp;${__formdata.OB_IAX_SINIESTRO.NRECLAMO}</c:if>
            </div>
            <axis:visible f="axissin006" c="BT_SIN_NUEVO_DATSIN"><!-- EDICION CABECERA SINIESTRO -->
            <div id="BT_SIN_NUEVO_DATSIN">
                <a href="javascript:f_abrir_modal('axissin017',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&SSEGURO='+objDom.getValorPorId('SSEGURO')+'&CACTIVI='+document.miForm.CACTIVI.value+'&EDICION=1')" ><img border="0" style="float:right;padding-right:10px;" alt="<axis:alt f="axissin006" c="LIT_IMG_BUSCAR" lit="9001521"/>" title="<axis:alt f="axissin006" c="LIT_IMG_BUSCAR" lit="9001521"/>" src="images/lapiz.gif"/></a>
            </div>
             </axis:visible>
            <axis:visible f="axissin006" c="BT_HISSIN_DATSIN"><!-- HISTORICO SINIESTRO -->
           
            <div id="BT_HISSIN_DATSIN">
                <a href="javascript:f_abrir_modal('axissin043',null,'&NSINIES='+document.miForm.NSINIES.value)" ><img border="0" style="float:right;padding-right:10px;" alt="<axis:alt f="axissin006" c="LIT_IMG_HISTORICO" lit="9902101"/>" title="<axis:alt f="axissin006" c="LIT_IMG_HISTORICO" lit="9902101"/>" src="images/informacion.gif"/></a>
            </div>
             </axis:visible>
             
            
      

                    
                <c:import url="axissin006_datossiniestros.jsp"/>
                
                
                <!-- CONTROL FOCUS -->
                     <input type="image" id="siniestros_focus" name="siniestros_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        	 			<!-- CONTROL FOCUS -->
                
          </td>
           
        </tr>
       
                    
                  
                    <!-- **************************************** Inicio Secciones *************************************** -->
                    
                     <!-- ***************************************** Gestion Procesos     *************************************** -->
                    <axis:visible f="axissin006" c="DSP_CARGAPROCESO">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="procesos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('procesos', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_DATOS_PROCESOS" lit="9900748"/></b><!-- Procesos -->
                                    </div>
                                    <axis:visible f="axissin006" c="EDIT_PROCESOS">
                                        <div style="float:right;">
                                            <!--a href="javascript:void(0)"><img border="0" alt="<axis:alt f="axissin006" c="LIT_IMG" lit="100002"/> <axis:alt f="axissin006" c="LIT_IMG" lit="103477"/>" title="<axis:alt f="axissin006" c="LIT_IMG" lit="100002"/> <axis:alt f="axissin006" c="LIT_IMG" lit="103477"/>" src="images/lapiz.gif"/></a-->
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="procesos_children" style="display:none">
                                <td align="left" > 
                                <axis:visible f="axissin006" c="DSP_PROCESOS">
                                    <c:import url="axissin006_procesos.jsp"/>
                                </axis:visible>
                                </td>
                            </tr>
                            <!-- CONTROL FOCUS -->
                            <input type="image" id="procesos_focus" name="procesos_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
                            <!-- CONTROL FOCUS -->
                    </axis:visible>
                    
                    
                    
                    <!-- ***************************************** Movimientos     *************************************** -->
                    
                    <axis:visible f="axissin006" c="DSP_MOVIMIENTOS">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="movimientos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('movimientos', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_DATOS_MOV" lit="9001473"/></b><!-- Movimientos -->
                                        &nbsp;-&nbsp;<c:if test="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.NMOVSIN == 1}">
                                        ${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[movimiento_ult].OB_IAX_SIN_MOVSINIESTRO.TESTSIN}
                                        </c:if>
                                        <c:if test="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.NMOVSIN > 1}">
                                        ${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.TESTSIN} 
                                        </c:if>
                                    </div>
                                    <axis:visible f="axissin006" c="EDIT_MOVIMIENTOS">
                                        <div style="float:right;">
                                            <!--a href="javascript:void(0)"><img border="0" alt="<axis:alt f="axissin006" c="LIT_IMG_SMOV" lit="100002"/> <axis:alt f="axissin006" c="LIT_IMG_EMOV" lit="103477"/>" title="<axis:alt f="axissin006" c="LIT_IMG_SMOMOV" lit="100002"/> <axis:alt f="axissin006" c="LIT_IMG_EMOV" lit="103477"/>" src="images/lapiz.gif"/></a-->
                                        </div>
                                    </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="movimientos_children" style="display:none">
                                <td align="left" >
                                <axis:visible f="axissin006" c="DSP_MOSINIESTROS">
                                    <c:import url="axissin006_movimientos.jsp"/>
                                </axis:visible>
                                </td>
                            </tr>
                            <!-- CONTROL FOCUS -->
                            <input type="image" id="movimientos_focus" name="movimientos_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
                            <!-- CONTROL FOCUS -->
                    </axis:visible>
                    <axis:visible f="axissin006" c="DSP_AGENDA">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="agenda_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('agenda', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_AGENDA" lit="100604"/></b><!-- Agenda -->
                                    </div>

                                        <div style="float:right;" id="BT_SIN_NUEVO_AG">
                                        <axis:visible f="axissin006" c="BT_SIN_NUEVO_AG"> <!-- NUEVA AGENDA SINIESTRO -->
                                            <a href="javascript:f_abrir_modal_agenda('axisagd002',null,'&CMODO=${sessionScope.CMODO}&CTIPAGD=5&NTRAMIT=0&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=agenda&MODIFICACION=0');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="LIT_SIN_ADD_AG" lit="100604"/>" title="<axis:alt f="axissin006" c="LIT_SIN_ADD_AG" lit="100604"/>" src="images/agenda.gif"/></a>
                                        </axis:visible>
                                        </div>
                                        
                                        <div style="float:right;" id="BT_RES_AGD_TAREAS_SIN">
		                                     <axis:visible f="axissin006" c="BT_RES_AGD_TAREAS_SIN">
		                                         <a href="javascript:f_abrir_modal_agenda('axissin076',null,'&NSINIES='+document.miForm.NSINIES.value);">
		                                         <img border="0" alt="<axis:alt f="axissin006" c="RES_AGD_TAREAS_SIN" lit="9909674"/>" title="<axis:alt f="axissin006" c="RES_AGD_TAREAS_SIN" lit="9909674"/>" src="images/nolines_plus.gif"/></a>
		                                     </axis:visible>
		                                </div>
                                    
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="agenda_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axissin006_agenda.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     								<input type="image" id="agenda_focus" name="agenda_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        														<!-- CONTROL FOCUS -->
                                </td>
                            </tr>
                            
                     
                            </axis:visible>
                    <!-- ***************************************** Tramitaciones   *************************************** -->
                            <axis:visible f="axissin006" c="DSP_TRAMITACIONES">
                            	<c:if test="${!empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES || 
                            		(empty __formdata.OB_IAX_SINIESTRO.TRAMITACIONES)}">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="tramitaciones_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('tramitaciones', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_TRAMITACIONES" lit="9000895"></axis:alt></b><!-- Tramitaciones -->
                                    </div>
                                    
                                        <div style="float:right;" id="BT_SIN_NUEVO_TRAM">
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_SECC"> <!-- NUEVA TRAMITACION -->
                                              <a href="javascript:f_abrir_modal('axissin007',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&NTRAMTE='+document.miForm.NTRAMTE.value);"><img border="0" alt="<axis:alt f="axissin006" c="LIT_IMG_ADDMOV" lit="9001519"/>" title="<axis:alt f="axissin006" c="LIT_IMG_ADDMOV" lit="9001519"/>" src="images/new.gif"/></a>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAMITE_SECC">
                                                <img border="0" alt='<axis:alt f="axissin006" c="TRAMITES" lit="9901991"/>'
                                                 title='<axis:alt f="axissin006" c="TRAMITES" lit="9901991"/>' style="cursor:pointer"
                                                 src="images/new.gif" onClick="javascript:f_abrir_modal('axissin042',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&FSINIES='+document.miForm.FSINIES.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value+'&NRIESGO='+document.miForm.NRIESGO.value+'&MODO=nuevo'+'&CTRAMTE=${__formdata.CTRAMTE}');"
                                                 />
                                            </axis:visible>
                                        </div>
                                    
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="tramitaciones_children" style="display:none">
                                <td align="left" >
                                    <%--<c:import url="axissin006_tramitaciones_form.jsp"/>--%>
                                    	 <jsp:include page="axissin006_tramitaciones_form.jsp"/>
                                    <!-- CONTROL FOCUS -->
                                    <input type="image" id="tramitaciones_focus" name="tramitaciones_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
                                    <!-- CONTROL FOCUS -->
                                </td>
                            </tr>
                            
                          </c:if>
                            </axis:visible>
                 	        <!-- ********************* Preguntas ********************* -->
    <c:if test="${!empty sessionScope.axissin_preguntasSiniestro}">
	<axis:visible f="axissin006" c="DSP_PREGUNTAS_TRAMITACION">
        <tr>
            <td class="campocaja">
                <div style="float:left;">
                    <img id="tramitaciones_preguntas_parent" src="images/mes.gif"
                         onclick="objEstilos.toggleDisplay('tramitaciones_preguntas', this)"
                         style="cursor:pointer"/>
                     
                    <b><axis:alt f="axissin006" c="PREGUNTAS" lit="102299"/></b><!-- Preguntas -->
                </div>
                <div style="float:right;" id="LAPIZ_CPREGUN">
                    <axis:visible f="axissin006" c="LAPIZ_CPREGUN">
                            <img border="0" alt='<axis:alt f="axissin006" c="LAPIZ_CPREGUN" lit="102299"/>'
                                 title='<axis:alt f="axissin006" c="LAPIZ_CPREGUN" lit="102299"/>'
                                 src="images/lapiz.gif" onClick="javascript:f_abrir_modal('axissin057',null,'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&NTRAMIT='+document.miForm.NTRAMIT.value+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=tramitaciones_preguntas');"
                                 />
                    </axis:visible>
                </div>
                <div style="clear:both;">
                    <hr class="titulo"></hr>
                </div>
            </td>
        </tr>
        <tr id="tramitaciones_preguntas_children" style="display:none">
            <td align="left">
                <jsp:include page="axissin006_datossiniestros_tramitaciones_preguntas.jsp"/>
            </td>
        </tr>
    </axis:visible>	
 </c:if>	
                    <!-- ***************************************** Reservas     *************************************** -->
                            <axis:visible f="axissin006" c="DSP_RESUM">
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="reservas_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('reservas', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_RESERVES" lit="9001475"/></b><!-- Reserves -->
                                    </div>
                                        <axis:visible f="axissin006" c="ICO_INFORMERESUMEN">
                                            <div style="float:right;">
                                                <!-- bug 0021662 -->
                                                <!--a href="javascript:void(0)"><img border="0" alt="<axis:alt f="axissin006" c="LIT_DSP_RESUM" lit="100604"/>" title="<axis:alt f="axissin006" c="LIT_IMG_ADD" lit="100604"/>" src="images/new.gif"/></a-->
                                                <a href="javascript:f_informe_resumen()"><img border="0" alt="<axis:alt f="axissin006" c="ICO_INFORMERESUMEN" lit="9000569"/>" title="<axis:alt f="axissin006" c="LIT_IMG_ADD" lit="9000569"/>" src="images/filetypes/xls.jpg"/></a>
                                            </div>
                                        </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="reservas_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axissin006_reserva.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     								<input type="image" id="reservas_focus" name="reservas_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        														<!-- CONTROL FOCUS -->
                                </td>
                            </tr>
                            
                            </axis:visible>
                               <c:if test="${__formdata.PERRELACIONADAS == 1}" > 
                    <!-- ***************************************** Personas realcionadas **************************************** -->
                            <axis:visible f="axissin006" c="DSP_PERSONASREL">
                            	<c:if test="${!empty __formdata.OB_IAX_SINIESTRO.PERSONASREL || 
                     		(empty __formdata.OB_IAX_SINIESTRO.PERSONASREL)}">                                 	            	
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="personasrel_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('personasrel', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_PERSONA_REL" lit="9901054"/></b><!-- Personas relacionadas -->
                                    </div>
                                    
                                        <div style="float:right;" id="BT_SIN_NUEVO_PERSONAREL">
                                        <axis:visible f="axissin006" c="BT_SIN_NUEVO_PERSONAREL"> <!-- personas relacionadas -->
                                            <a href="javascript:f_abrir_modal('axissin039',null,'&NTRAMIT='+document.miForm.NTRAMIT.value+'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=personasrel'+'&NTRAMIT9999='+document.miForm.NTRAMIT9999.value);">
                                            <img border="0" alt="<axis:alt f="axissin006" c="LIT_IMG_ADD_PERSONAREL" lit="9901054"/>" title="<axis:alt f="axissin006" c="LIT_IMG_ADD_PERSREL" lit="100604"/>" src="images/new.gif"/></a>
                                        </axis:visible>
                                        </div>
                                    
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="personasrel_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axissin006_personas.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     			<input type="image" id="personasrel_focus" name="personasrel_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        														<!-- CONTROL FOCUS -->
                                </td>
                            </tr>
                            
                          </c:if>
                            </axis:visible>
                          </c:if>
                    <!-- **************************************** Fin personas ****************************************** -->
                    <!-- ***************************************** Agenda         *************************************** -->
                            <%--axis:visible f="axissin006" c="DSP_AGENDA">
                            	<c:if test="${!empty __formdata.OB_IAX_SINIESTRO.AGENDA || 
                     		(empty __formdata.OB_IAX_SINIESTRO.AGENDA)}">                                 	            	
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="agenda_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('agenda', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axissin006" c="LIT_AGENDA" lit="100604"/></b><!-- Agenda -->
                                    </div>
                                    
                                        <div style="float:right;" id="BT_SIN_NUEVO_AG">
                                        <axis:visible f="axissin006" c="BT_SIN_NUEVO_AG"> <!-- NUEVA AGENDA SINIESTRO -->
                                            <a href="javascript:f_abrir_modal('axissin015',null,'&indexTramitacio=0'+'&SSEGURO='+document.miForm.SSEGURO.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&SPRODUC='+document.miForm.SPRODUC.value+'&NSINIES='+document.miForm.NSINIES.value+'&subpantalla_base=agenda');">
                                            <img border="0" alt="<axis:alt f="axissin006" c="LIT_SIN_ADD_AG" lit="100604"/>" title="<axis:alt f="axissin006" c="LIT_SIN_ADD_AG" lit="100604"/>" src="images/new.gif"/></a>
                                        </axis:visible>
                                        </div>
                                    
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                            </tr>
                            <tr id="agenda_children" style="display:none">
                                <td align="left" >
                                    <c:import url="axissin006_agenda.jsp"/>
                                    <!-- CONTROL FOCUS -->
                     								<input type="image" id="agenda_focus" name="agenda_focus" src="images/empty.gif" style="height:0px;width:0px;"/>
        														<!-- CONTROL FOCUS -->
                                </td>
                            </tr>
                            
                          </c:if>
                            </axis:visible--%>
                    <!-- **************************************** Fin Secciones ****************************************** -->
        <axis:visible f="axissin006" c="DSP_INF_REASEG">
            <tr>
                <td class="campocaja">
                    <div style="float:left;">
                        <img id="datos_reaseguro_parent" src="images/mes.gif"
                             onclick="objEstilos.toggleDisplay('datos_reaseguro', this)"
                             style="cursor:pointer"/>
                         
                        <b><axis:alt f="axissin006" c="DATOS_REASEGURO" lit="9906194"/></b><!-- Datos Reaseguro -->
                    </div>
                    <div style="clear:both;">
                        <hr class="titulo"></hr>
                    </div>
                </td>
            </tr>
            <tr id="datos_reaseguro_children" style="display:none">
                <td align="left">
                    <jsp:include page="axissin006_datosreaseguro.jsp"/>
                </td>
            </tr>
        </axis:visible>	
            </table>
<div class="separador">&nbsp;</div>
<c:set var="movimiento_ult">${fn:length(__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS)-1}</c:set>
<table><tr><td><%--** ESTADO SINIESTRO:  ${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CESTSIN} **   ** MOV ULTIMO : ${movimiento_ult+1} --%></td></tr></table>
<!-- Botonera --><%--c:if test="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CESTSIN=='1'}"--%>
<!-- bug 0023643 boto bt_tramitador --> 
<!--IAXIS-2067 AABC cambio de boton rechazado a Objetado-->   
<c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin006</c:param><c:param name="f">axissin006</c:param>
	<c:param name="f">axissin006</c:param>
    <c:param name="__botones">cancelar<axis:visible f="axissin006" c="BT_DOCUMENTOS">,9001358</axis:visible><axis:visible f="axissin006" c="BT_TRAMITADOR">,140769</axis:visible><axis:visible f="axissin006" c="BT_PRESINIESTRO">,9901400</axis:visible><axis:visible f="axissin006" c="BT_DECLARAR">,9902293</axis:visible><axis:visible f="axissin006" c="BT_DOCUM_PENDIENTE">,9907320</axis:visible><axis:visible f="axissin006" c="BT_FINDPOLISSA">,151477</axis:visible><axis:visible f="axissin006" c="BT_REABRIR">,9002022</axis:visible><axis:visible f="axissin006" c="BT_ANULAR">,110074</axis:visible><axis:visible f="axissin006" c="BT_RECHAZAR">,89906261</axis:visible><axis:visible f="axissin006" c="BT_FINALIZAR">,9002021</axis:visible><axis:visible f="axissin006" c="BT_GRAVAR">,aceptar</axis:visible><axis:visible f="axissin006" c="BT_ABRIR">,9001302</axis:visible></c:param>
</c:import>
<!--form name="miForm" action="f_onload()" method="POST"> -->
<form name="miForm" action="axis_axissin006.do" method="POST">
        <input type="hidden" id="operation" name="operation" value="" />
        
        <input type="hidden" name="CCAUSIN" id ="CCAUSIN" value="${__formdata.OB_IAX_SINIESTRO.CCAUSIN}"/>
        <input type="hidden" name="CMOTSIN" id ="CMOTSIN" value="${__formdata.OB_IAX_SINIESTRO.CMOTSIN}"/>
        <input type="hidden" name="FSINIES" id ="FSINIES" value="<fmt:formatDate value='${__formdata.OB_IAX_SINIESTRO.FSINIES}' pattern='dd/MM/yyyy' />"/>
        <input type="hidden" name="SSEGURO" id ="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="SPERSON" id ="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="NDEST" id ="NDEST" value="${__formdata.NDEST}"/>
        <input type="hidden" name="CTIPDES" id ="CTIPDES" value="${__formdata.CTIPDES}"/>
        <input type="hidden" name="NSINIES" id ="NSINIES" value="${__formdata.OB_IAX_SINIESTRO.NSINIES}"/>
        <input type="hidden" name="NRIESGO" id ="NRIESGO" value="${__formdata.OB_IAX_SINIESTRO.NRIESGO}"/>
        <input type="hidden" name="NTRAMIT" id ="NTRAMIT" value="${__formdata.indexTramitacio}"/>
        <input type="hidden" name="NTRAMIT9999" id ="NTRAMIT9999" value="${__formdata.NTRAMIT9999}"/>
        <input type="hidden" name="CTRAMIT" id ="CTRAMIT" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.CTRAMIT}"/>
        <input type="hidden" name="CTIPTRA" id="CTIPTRA"  value="${__formdata.CTIPTRA}"/>
        <input type="hidden" name="NMOVIMI" id ="NMOVIMI" value="${__formdata.OB_IAX_SINIESTRO.NMOVIMI}"/>
        <input type="hidden" name="SIDEPAG" id ="SIDEPAG" value="${__formdata.SIDEPAG}"/>
        <input type="hidden" name="OK" id ="OK" value="${__formdata.OK}"/>
        <input type="hidden" name="SIDEPAGRECOB" id ="SIDEPAGRECOB" value="${__formdata.SIDEPAGRECOB}"/>
        <input type="hidden" name="CMODO" id ="CMODO" value="${sessionScope.CMODO}"/>
        <input type="hidden" name="CEMPRES" id ="CEMPRES" value="${__formdata.OB_IAX_SINIESTRO.CEMPRES}"/>
        <input type="hidden" name="TMOTSIN_AUX" id="TMOTSIN_AUX" value="${__formdata.OB_IAX_SINIESTRO.TMOTSIN}"/>
        <input type="hidden" name="NESTADO" id="NESTADO" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CESTSIN}" />
        
        <input type="hidden" name="IDOBS" id="IDOBS" value="${__formdata.IDOBS}"/>
        <input type="hidden" name="SIDEPAGRECOB_OFI" id ="SIDEPAGRECOB_OFI" value="${__formdata.SIDEPAGRECOB_OFI}"/>
        <input type="hidden" name="SIDEPAG_OFI" id ="SIDEPAG_OFI" value="${__formdata.SIDEPAG_OFI}"/>
        <input type="hidden" name="indexPago_ofi" id="indexPago_ofi" value="${__formdata.indexPago_ofi}"/>
        <input type="hidden" name="indexRecobro_ofi" id="indexRecobro_ofi" value="${__formdata.indexRecobro_ofi}"/>
        <input type="hidden" name="indexDestinatario" id="indexDestinatario" value="${__formdata.indexDestinatario}"/>

        <input type="hidden" name="isNew" id ="isNew" value="${__formdata.isNew}"/>
        <input type="hidden" name="indexPago" id="indexPago"  value="${__formdata.indexPago}"/>
        <input type="hidden" name="indexReserva" id="indexReserva"  value="${__formdata.indexReserva}"/>
        <input type="hidden" name="indexTramitacio" id="indexTramitacio"  value="${__formdata.indexTramitacio}"/>
        <input type="hidden" name="indexGestio" id="indexGestio"  value="${__formdata.indexGestio}"/>
		<input type="hidden" name="SGESTIO" id="SGESTIO"  value="${__formdata.SGESTIO}"/>
        <input type="hidden" name="indexRecobro" id="indexRecobro" value="${__formdata.indexRecobro}"/>
        
        <!-- ini Bug 0022099 -->
        <input type="hidden" name="indexTramite" id="indexTramite" value="${__formdata.indexTramite}"/>
        
        <!-- fin Bug 0022099 -->

        <input type="hidden" name="CPERSREL" id="CPERSREL" value="${__formdata.CPERSREL}"/>


        <input type="hidden" name="CDOMICI" id="CDOMICI" value="${__formdata.CDOMICI}"/>
        <input type="hidden" name="TPAIS" id="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN"  id="TPROVIN" value="${__formdata.TPROVIN}"/>
        <input type="hidden" name="TPOBLAC" id="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        
       
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.OB_IAX_DATPOLIZA.CAGENTE}"/>
        <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}"/> 
        <input type="hidden" name="NPRESTA" id="NPRESTA" value=""/>
        
        <!-- cambio estado siniestro -->
        <!-- Obtener el último número de movimiento -->
        <c:set var="lista_mov" value="${fn:length(__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS)-1}"></c:set>
        <c:set var="num_tramit">${__formdata.indexTramitacio}</c:set>

        <c:if test="${fn:length(__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS)>=0}">
            <input type="hidden" name="lineas_mov" id="lineas_mov" value=" ${lista_mov}"/>
            <input type="hidden" name="lineas_tram" id="lineas_tram" value=" ${num_tramit}"/>
            <input type="hidden" name="CESTSIN" id="CESTSIN" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CESTSIN}"/><!--0:lista_mov-->
             <!-- <input type="hidden" name="CESTTRA" id="CESTTRA" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[num_tramit].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.CESTTRA}"/><!--0:estado lista_mov tramitacion-->
             <input type="hidden" name="CESTTRA" id="CESTTRA" value="${__formdata.CESTTRA_MOV}"/>
            <input type="hidden" name="CESTSIN_PRIMERO" id="CESTSIN_PRIMERO" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[lista_mov].OB_IAX_SIN_MOVSINIESTRO.CESTSIN}"/><!--0:lista_mov-->
            <input type="hidden" name="CESTSIN_AUX" id="CESTSIN_AUX" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CESTSIN}"/><!--0:lista_mov-->
            <input type="hidden" name="TESTSIN_AUX" id="TESTSIN_AUX" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.TESTSIN}"/>
            <input type="hidden" name="FESTSIN_AUX" id="FESTSIN_AUX" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OB_IAX_SINIESTRO.FSINIES}"/>"/>
            <input type="hidden" name="CCAUEST_AUX" id="CCAUEST_AUX" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CCAUEST}"/>
            <input type="hidden" name="CTIPDES_AUX" id="CTIPDES_AUX" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CTIPDES}"/>
            <input type="hidden" name="CUNITRA_AUX" id="CUNITRA_AUX" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[num_tramit].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.CUNITRA}"/>
            <input type="hidden" name="CTRAMITAD_AUX" id="CTRAMITAD_AUX" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[num_tramit].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.CTRAMITAD}"/>
            <input type="hidden" name="NTRAMTE" id="NTRAMTE" value="${__formdata.NTRAMTE}"/>
            <input type="hidden" name="CTRAMTE" id="CTRAMTE" value="${__formdata.CTRAMTE}"/>
             <input type="hidden" name="PERRELACIONADAS" id="PERRELACIONADAS" value="${__formdata.PERRELACIONADAS}"/>
            <input type="hidden" name="IMP_SIDEPAG" id="IMP_SIDEPAG" value="${__formdata.IMP_SIDEPAG}"/>
            <!-- bug 23643 CUNITRA_MOVSIN CTRAMITAD_MOVSIN -->
            <input type="hidden" name="CUNITRA_MOVSIN" id="CUNITRA_MOVSIN" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CUNITRA}"/>
            <input type="hidden" name="CTRAMITAD_MOVSIN" id="CTRAMITAD_MOVSIN" value="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS[0].OB_IAX_SIN_MOVSINIESTRO.CTRAMITAD}"/>
    
            <!--Bug 26044 - 02/09/2013 - dlF -->
            <input type="hidden" name="NEW_STATUS" id="NEW_STATUS" value=""/>
            <!--fin 26044 - 02/09/2013 - dlF -->
        
        </c:if>
       
       <!-- Documentacion -->
         <input type="hidden" name="NDOCUME" id="NDOCUME" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[num_tramit].OB_IAX_SIN_TRAMITACION.DOCUMENTACION[0].NDOCUME}"/>
         
         
        <input type="hidden" name="subpantalla" id="subpantalla" value=""/>
        <input type="hidden" name="seccion" id="seccion" value=""/>

        <input type="hidden" name="CAGENTESINI" id="CAGENTESINI" value="${__formdata.OB_IAX_SINIESTRO.CAGENTE}"/>  
        <input type="hidden" name="TAGENTESINI" id="TAGENTESINI" value="${__formdata.OB_IAX_SINIESTRO.TAGENTE}"/> 
        <input type="hidden" name="VALIDARESERVA" id="VALIDARESERVA" value="${__formdata.VALIDARESERVA}"/>
        
        <!-- Changes for 3602 INITIAL  -->
        
        <c:choose>
        <c:when test="${fn:length(__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS)>1}"> 
        <input type="hidden" name="AXISTRAMIT" id ="AXISTRAMIT" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[1].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}"/>
       	</c:when>
       	
		<c:otherwise>
        <input type="hidden" name="AXISTRAMIT" id ="AXISTRAMIT" value="${__formdata.OB_IAX_SINIESTRO.TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.MOVIMIENTOS[0].OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}"/>
        </c:otherwise>
        </c:choose>
        <!-- Changes for 3602 FINAL  -->
                
</form>

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


