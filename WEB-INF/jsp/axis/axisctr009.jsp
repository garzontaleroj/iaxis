<%/* Revision:# Ii6PSyJKH9x+2IuhWWGZ6A== # */%>
<%
/**
*  Fichero: axisctr009.jsp
*  
*  Novena pantalla del flujo de trabajo "Contratación Vida Riesgo".
*  Título: Resumen
*  Muestra el resumen del contracto realizado a lo largo del flujo.
*  Se muestran Datos del contrato, Tomador, Asegurados, Beneficiarios y
*  Cláusulas, cada apartado con su desglose.
*
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr009" c="TITULO" lit="108502"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!-- BUG CONF-186 - 22/08/2016 - HRE -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr009" c="TITULO_DET" lit="9909311" /></c:param>
            <c:param name="nid" value="axisper046" />
        </c:import>
        <!-- BUG CONF-186 - 22/08/2016 - HRE -->
        
        <style type="text/css">
         div.fixedHeaderTable {
             position: relative;
             height: 100px;
             overflow-y: auto;
             overflow-x: hidden; 

         }
         
         div.fixedHeaderTable tbody {
             height: auto;
             position:relative;
         }

         div.fixedHeaderTable table {
            height: auto;
            border-width: thin;
            border-style: solid;
            border-color: #E6E6E6;
         }
         
         /* IE */
         div.fixedHeaderTable {
             *position: relative;
             *height: 100px;
             *overflow-y: auto;
             *overflow-x: hidden;
         }
         
         div.fixedHeaderTable tbody {
             *height: auto;
             *position:relative;
        }  
         
         div.fixedHeaderTable table {
            *height: auto;
            *border-width: thin;
            *border-style: solid;
            *border-color: #E6E6E6;  
         }
        </style>
        
        <script type="text/javascript">

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
            
        function toggleDisplay2 (ths, objeto, img_mes, img_menys) {
         
            var pimg_mes="images/mes.gif";
            var pimg_menys="images/menys.gif";
            
            if (img_mes!=undefined || img_mes!=null) pimg_mes=img_mes;
            if (img_menys!=undefined || img_menys!=null) pimg_menys=img_menys;
            
	   			  var thisChildrenId=ths+"_children";
            if (document.getElementById(thisChildrenId)!=null){
                var actualDisplayValue=document.getElementById(thisChildrenId).style.display;
            }
                
            var resto = document.getElementsByTagName("tr");
		
            for (i=0; i < resto.length; i++) {            
                if(resto[i].getAttribute("tipo")=='cont'){
                     resto[i].style.display="none";
                }
            }

            if (actualDisplayValue=="none"){ 
                  actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
                  var imagen =	document.getElementById("img_"+ths);
                  
                  if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_menys;//"images/menys.gif";
            }else{ 
                actualDisplayValue="none";
                var imagen =	document.getElementById("img_"+ths);
                 
                if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_mes;//"images/mes.gif";
            }
            if (document.getElementById(thisChildrenId)!=null){
                document.getElementById(thisChildrenId).style.display=actualDisplayValue;
            }
        }   
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
            
            function f_onload(){
        	
        	
        	
            	f_cargar_propiedades_pantalla();
            	
				try{ 
					document.miForm.NESCENA.value = "${__formdata.NESCENA}";
					f_actualiza_evoluprov("${__formdata.SSEGURO}","${__formdata.NESCENA}","EST");
				} catch (e) {
					null;
				}
				
                objDom.setVisibilidadPorId("but_100001", "hidden");

                <c:if test="${__formdata.ES_COL_ADMIN==0 || __formdata.ES_CERTIF_CERO==0}">
                    objDom.setVisibilidadPorId("but_aceptar", "hidden");
                </c:if>
                
                // Lo siguiente va con scriptlets JSP en vez de JSTL 
                // con el motivo de no entorpecer la sintaxis del JS siguiente.
                PCESTPOL = "${PCESTPOL}";
               
                <c:if test="${!empty mvtretencion || (!empty PCESTPOL && PCESTPOL == 1) || (!empty __formdata.CINSPREQ && __formdata.CINSPREQ == 1 && !empty __formdata.CRESULTR && __formdata.CRESULTR != 1) }">
                    // document.miForm.imgreten.onclick()
                    <c:if test="${(!empty __formdata.CINSPREQ && __formdata.CINSPREQ eq '1')}">

                    objEstilos.toggleDisplay("DSP_INSPECCION_RIESGO", document.getElementById("DSP_INSPECCION_RIESGO_parent"));
                    
                    </c:if>
                    <axis:visible f="axisctr009" c="BT_GUARDAR">
                        objDom.setVisibilidadPorId("but_guardar", "hidden");
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">
                        objDom.setVisibilidadPorId("but_9901555", "hidden");
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_CONTRATAR">
                        if (objDom.esVisible("but_contratar")) {
                            objDom.setVisibilidadPorId("but_contratar", "hidden");
                        }
  					</axis:visible>                    
                    objDom.setVisibilidadPorId("but_aceptar", "visible");
                    <c:if test="${!empty mvtretencion}" >
                        objEstilos.toggleDisplay("DSP_MVTRETENCION", document.getElementById("DSP_MVTRETENCION_parent"));
                    </c:if>
                    <c:if test="${!empty PCESTPOL && PCESTPOL == 1}" >
                        objEstilos.toggleDisplay("DSP_PSU", document.getElementById("DSP_PSU_parent"));
                        <axis:visible f="axisctr009" c="BT_GUARDAR">
                            objDom.setVisibilidadPorId("but_guardar", "visible");
                        </axis:visible>
                    </c:if>
                </c:if>
                <c:if test="${!empty PERMITE_EMITIR && PERMITE_EMITIR == 1}">     
                    objDom.setVisibilidadPorId("but_aceptar", "visible");
                    <axis:visible f="axisctr009" c="BT_CONTRATAR">
                        if (objDom.esVisible("but_contratar")) {
                            objDom.setVisibilidadPorId("but_contratar", "hidden");
                        }
                    </axis:visible>     
                </c:if>
                
               
                
                // Desplegar siempre documentación
                <% if ( request.getAttribute("__formdata") != null &&
                        ((java.util.Map) request.getAttribute("__formdata")).get("T_IAX_DOCUMENTACION") != null) { %>
                    objEstilos.toggleDisplay("DSP_DOCUMENTACION", document.getElementById("DSP_DOCUMENTACION_parent"));
                <% } %>                

                // Desplegar la tabla que estábamos ordenando
                <% if (request.getAttribute("tabla_ordenada") != null) { %>
                    var tabla_ordenada = '<%=request.getAttribute("tabla_ordenada")%>';
                    if (tabla_ordenada == 'clausulasesp' || tabla_ordenada == 'clausulasprod')
                        objEstilos.toggleDisplay("DSP_CLAUSULAS", document.getElementById("DSP_CLAUSULAS_parent"));
                    else
                        objEstilos.toggleDisplay(tabla_ordenada, document.getElementById(tabla_ordenada + "_parent"));
                <% } %>
                
                <c:if test="${__formdata.MODALFORM eq  'axisctr173'}">
                    if (document.getElementById('DSP_DOCU_REQUERIDA_children')!= null){
                        objEstilos.toggleDisplay("DSP_DOCU_REQUERIDA", document.getElementById("DSP_DOCU_REQUERIDA_parent"));
                    }
                </c:if>
               
                var togglesdefecto =  f_cargar_propiedades_pantalla('axisctr009');//Función que nos carga todas las propiedades de pantalla
		<axis:visible f="axisctr009" c="BTIMPREDOC">
                    f_habilita_botones();
                </axis:visible>
                
            }
        
            
            function f_but_anterior() {
                objUtiles.ejecutarFormulario("axis_axisctr009.do","anterior",document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_but_siguiente() {
                alert ("No implementado!");
            }
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr009", "cancelar", document.miForm, "_self");
            }        
            function f_but_documentacion() {
                alert ("No implementado!");
            }
            
            var operacio = "";
            
            function f_but_aceptar(){
                operacio = "aceptar";
                //Validem si hi ha documentació requerida necessaria
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackValDocRequerida, 
                        "operation=ajax_valdocrequerida",
                        this, objJsMessages.jslit_cargando);
            }
            
            function f_but_guardar() {
				//INI-16055
                operacio = "guardar";
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackValDocRequerida, 
                        "operation=ajax_valdocrequerida",
                        this, objJsMessages.jslit_cargando);
                
                // Lo que hacia inicialmente. Ahora al guardar si doc pendiente se
                // quedará con motivo de retención 20. Pero eso lo controlaremos
                // en PL.
                //objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackGuardarEmitir, 
                //"operation=guardar",
                //this, objJsMessages.jslit_guardando_poliza);
				//FIN-16055
            }

            function callbackValDocRequerida(ajaxResponseText){

                //alert(ajaxResponseText);

                var confirma = false;
                var doc = objAjax.domParse(ajaxResponseText);
                var  TIPERROR = 0;
                var CERROR = 0;
                var TERROR = "";
                try{ 

                    TIPERROR = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIPERROR")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPERROR"), 0, 0) : "0";
                    CERROR   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CERROR")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CERROR"), 0, 0) : "0";
                    TERROR   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TERROR")[0]) ? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), 0, 0) : "";

                } catch (e) {
                    TIPERROR = 0;
                }

                if (TIPERROR == 0){
                    confirma  = true;
                }else if (TIPERROR == 2){
                    //Avis
                    confirma=confirm(TERROR);
                }else{
                    objAppMensajes.existenErroresEnAplicacion(doc);
                }

                if (confirma) {
                    if (operacio == "aceptar"){
                        //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
                    	LOCAL_invokeAsyncCGI("axis_axisctr009.do", callbackGuardarEmitir, "operation=aceptar", this, objJsMessages.jslit_emitiendo_poliza);

                    }else if(operacio == "guardar"){
                        //ecg20120113 Bug/nota 20671/103711 evitar multiple pulsacion del boton de Aceptar, ha de ser igual como "contratar"
                    	LOCAL_invokeAsyncCGI("axis_axisctr009.do", callbackGuardarEmitir, "operation=guardar", this, objJsMessages.jslit_guardando_poliza);

                    }else if(operacio == "contratar"){
                    	//ecg20111006 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible
                    	LOCAL_invokeAsyncCGI("axis_axisctr009.do", callbackGuardarEmitir, "operation=contratar", this, objJsMessages.jslit_emitiendo_poliza);

                    }
                }
            }
            
           function f_but_9901555(){
                CSITUAC = "${datos_poliza.CSITUAC}";
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackGuardarEmitir, 
                                        "operation=enviarCorreo&CSITUAC="+CSITUAC,
                                         this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');
            }
            
            
            /* function f_but_9901555() {
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackEnviarCorreo, 
                        "operation=enviarCorreo",
                        this, objJsMessages.jslit_cargando);
            }*/
            
            function f_but_contratar() {
            	if (operacio != "contratar") { //ecg20110930, bug/nota 19633/93765 Patch AXIS3103 ignorar clicks consecutivos al boton de contratar
                operacio = "contratar"; 
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackValDocRequerida, 
                        "operation=ajax_valdocrequerida",
                        this, objJsMessages.jslit_cargando);
            	}
            }
            
            function f_get_reten(MENSAJE) {
                objAjax.invokeAsyncCGI("axis_axisctr009.do?MENSAJE="+MENSAJE, callbackGetReten, 
                        "operation=getreten",
                        this, objJsMessages.jslit_emitiendo_poliza);
            }
            
            function f_seleccionar_documentacion (obj, NVERSION, CMOTMOV, CTIPDOC) {
                // Recuperamos a partir del obj (el checkbox) el CDOCUMENT y CSELEC
                var CDOCUMENT = obj.value;
                var CSELEC = obj.checked ? 1 : 0;
                
                // Inicializar params para el Callback
                var CALLBACK_PARAMS = new Array();
                CALLBACK_PARAMS[0] = CDOCUMENT;
                CALLBACK_PARAMS[1] = CSELEC;
                CALLBACK_PARAMS[2] = CTIPDOC;
                                
                objAjax.invokeAsyncCGI("axis_axisctr009.do", callbackSeleccionarDocumentacion, 
                        "operation=seleccionar_documentacion&CDOCUMENT=" + CDOCUMENT + "&CSELEC=" + CSELEC + "&NVERSION=" + NVERSION + "&CMOTMOV=" + CMOTMOV,
                        this, objJsMessages.jslit_cargando, CALLBACK_PARAMS);
            }
            
            function f_ordenar(campo, tabla, outerMap) {
                    <% request.setAttribute(axis.util.Constantes.FORMDATA, request.getAttribute(axis.util.Constantes.FORMDATA)); %>
                    objUtiles.ejecutarFormulario ("axis_axisctr009.do?ordenar=true&campo=" + campo + "&tabla=" + tabla + "&outerMap=" + outerMap, "form", document.miForm, "_self");         
            }
            
            function f_getRiesgo (NRIESGO) {
                document.miForm.NRIESGO.value = NRIESGO;
                objUtiles.ejecutarFormulario ("axis_axisctr009.do?", "form", document.miForm, "_self", objJsMessages.jslit_cargando);         
            }


            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            // Modal Detalle Riesgo Asegurado ACTR029
            function f_abrir_axisctr029 (NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr029';
                objUtiles.abrirModal("axisctr029", "src", "modal_axisctr029.do?operation=form&NRIESGO=" + NRIESGO);
            }
            
            function f_cerrar_axisctr029() {
                objUtiles.cerrarModal("axisctr029");
            } 
            
            // Modal Importes Garantías ACTR030
            
            function f_abrir_axisctr030 (CGARANT, NRIESGO, NDETGAR) {
                document.getElementById('MODALFORM').value= 'axisctr030';
                objUtiles.abrirModal("axisctr030", "src", "modal_axisctr030.do?operation=form&CGARANT=" + CGARANT + "&NRIESGO=" + NRIESGO+"&NDETGAR="+NDETGAR+"&SSEGURO="+objDom.getValorPorId("SSEGURO_EST"));
            } 
            
            /*
            function f_abrir_axisctr030 (CGARANT, NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr030';
                objUtiles.abrirModal("axisctr030", "src", "modal_axisctr030.do?operation=form&CGARANT=" + CGARANT + "&NRIESGO=" + NRIESGO);
            }
            */
            
            function f_cerrar_axisctr030() {
                objUtiles.cerrarModal("axisctr030");
            }    
            
            // Imprimir
            function f_but_100001() { 
                document.getElementById('MODALFORM').value= 'axisimprimir';
                objDom.setValorPorId("ES_IMP_MODAL", "SALIR");
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO=" + 
                    objDom.getValorComponente(document.miForm.OSSEGURO));
            }
            
            
            function f_but_ONLINE() { 
                objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden"); 
                document.getElementById('MODALFORM').value= 'axisctr049';
                objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form");
            }
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                if (document.getElementById('ES_IMP_MODAL').value == 'FORM'){                    
                    objDom.setValorPorId("ES_IMP_DOCREQ", "S");
                    f_habilita_botones();  
                }
                else{
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr009", "cancelar", document.miForm, "_self");
                }
            }
            function f_cancelaraxisctr049(){
                objUtiles.cerrarModal("axisctr049");
                objUtiles.ejecutarFormulario ("axis_axisctr009.do", "form", document.miForm, "_self");
            }
            
            function f_cerrar_axisctr049() {
                objUtiles.cerrarModal("axisctr049");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr049", "cancelar", document.miForm, "_self");
         
            }
            
            function f_abrir_axisctr042 (NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr042';
                objUtiles.abrirModal("axisctr042", "src", "modal_axisctr042.do?operation=form&origen=axisctr009&NRIESGO=" + NRIESGO);
            }
            
            function f_cerrar_axisctr042() {
                objUtiles.cerrarModal("axisctr042");
            } 
            
            function f_abrir_axisctr043 (NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr043';
                objUtiles.abrirModal("axisctr043", "src", "modal_axisctr043.do?operation=form&origen=axisctr009&NRIESGO=" + NRIESGO+"&CMODO=CONSULTA");
            }
            
            function f_cerrar_axisctr043() {
                objUtiles.cerrarModal("axisctr043");
            } 
            // INI BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS
            function f_abrir_axisctr044 (NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr044';
                objUtiles.abrirModal("axisctr044", "src", "modal_axisctr044.do?operation=form&origen=axisctr009&NRIESGO=" + NRIESGO+"&CMODO=CONSULTA");
            }
            function f_cerrar_axisctr044() {
                 objUtiles.cerrarModal("axisctr044");
             }
            // FIN BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function callbackEnviarCorreo (ajaxResponseText){
                try{ 
                    var doc = objAjax.domParse(ajaxResponseText);
                     if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("ONPOLIZA")[0]) &&
                            objUtiles.hayValorElementoXml(doc.getElementsByTagName("OSSEGURO")[0])) {  
                            disableButtons = true;
                            objDom.setValorComponente(document.miForm.ONPOLIZA, objDom.getValorNodoDelComponente(doc.getElementsByTagName("ONPOLIZA"), 0, 0));  
                            objDom.setValorComponente(document.miForm.OSSEGURO, objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));  
                            
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                                var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                                    objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden"); 
                                    document.getElementById('MODALFORM').value= 'axisctr049';
                                    objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form&MENSAJE="+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                                    // f_get_reten(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                                }
                            }else{
                                var mensaje="";
                            }
                                                        
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                                var mensaje="";
                            }else{
                                //Se anyade una llamada a impresiones
                                document.getElementById('MODALFORM').value= 'axisimprimir';
                                objDom.setValorPorId("MENSAJE_PARA_AXISIMPRIMIR", mensaje);
                                objDom.setValorPorId("ES_IMP_MODAL", "SALIR"); 
                                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE=MENSAJE_EN_PARENT&SEGURO=" + 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                            }
                        }
                    
                    var visibility = disableButtons ? "visible" : "hidden";
                    <axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">
                        objDom.setVisibilidadPorId("but_9901500", visibility);
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_GUARDAR">
                        objDom.setVisibilidadPorId("but_guardar", visibility);
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_CONTRATAR">
                        if (document.miForm.ES_COL_ADMIN.value==0 || document.miForm.ES_CERTIF_CERO.value==0) {
                            if (visibility!="hidden" || objDom.esVisible("but_contratar")) { 
                                objDom.setVisibilidadPorId("but_contratar", visibility);
                            }
                        }
                    </axis:visible>
                      
                    objDom.setVisibilidadPorId("but_anterior", visibility);
                    objDom.setVisibilidadPorId("but_aceptar", visibility);
                    
                    // Botón de imprimir
                    //var visibilityImprimir = disableButtons ? "visible" : "hidden";
                    //objDom.setVisibilidadPorId("but_100001", visibilityImprimir);
                    
                }else{ //Si hay errores, dejar el botón de salir activo
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc); 
                    <axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">
                        objDom.setVisibilidadPorId("but_9901500",  "hidden");
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_GUARDAR">
                        objDom.setVisibilidadPorId("but_guardar", "hidden");
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_CONTRATAR">
                        if (objDom.esVisible("but_contratar")) {
                            objDom.setVisibilidadPorId("but_contratar", "hidden");
                        }
                    </axis:visible>
                    objDom.setVisibilidadPorId("but_anterior", "hidden");
                    objDom.setVisibilidadPorId("but_aceptar", "hidden");
                    objDom.setVisibilidadPorId("but_100001", "hidden");   
                }
                } catch (e) {
                   if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            function f_actualiza_evoluprov(PSSEGURO,PNESCENA,PTABLA){
             try{
               objAjax.invokeAsyncCGI("axis_axisctr009.do", 
               callbackAjaxActualizaEvoluProv, "operation=actualiza_evoluprov&PSSEGURO=" + PSSEGURO + "&PTABLA=" + PTABLA + "&PNESCENA=" +  PNESCENA,  this);
             } catch (e) {
               if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
             }              
            }
			
            function callbackAjaxActualizaEvoluProv(ajaxResponseText){
              try {
                 var doc = objAjax.domParse(ajaxResponseText);
                 if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                    var table = document.getElementById("evoluprovmatseg");
                    var tbody = table.getElementsByTagName("tbody")[0];
                    var tr = tbody.getElementsByTagName("tr");
					var vacio = 0;
                    objLista.borrarFilasDeLista ("evoluprovmatseg", "7",  '<axis:alt f="axisctr009" c="MENSA2" lit="1000254"/>');
                    for (var i = 0; i < objDom.numeroDeTags(doc, "NANYO") ; i++) {
                       var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                       var newtr = objLista.crearNuevaFila(rowstyle);
                       var newtd = new Array(7);
 
			 var valdat = 0;   
             <axis:visible f="axisctr009" c="NANYO">			 
                         newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NANYO"), i, 0));
                         valdat = 1;
             </axis:visible>						 
			 <axis:visible f="axisctr009" c="FPROVMAT">
                         newtd[1] = objLista.addTextoEnLista(objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROVMAT"), i, 0)));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr009" c="IPROVMAT">
                         newtd[2] = objLista.addNumeroEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPROVMAT"), i, 0), true));
			 valdat = 1;
             </axis:visible>
             <axis:visible f="axisctr009" c="PRESCATE">			 
                         newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRESCATE"), i, 0));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr009" c="PINTTEC">
                         newtd[4] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINTTEC"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr009" c="IVALRES">
                         newtd[5] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALRES"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr009" c="IPRIMA">
                         newtd[6] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIMA"), i, 0), true));                        
			 valdat = 1;
			 </axis:visible>
					   
			 if ( valdat == 1 ) {
			    objLista.borrarFilaVacia(tbody, tr);
                            objLista.addNuevaFila(newtd, newtr, tbody);
		            vacio = 1;
			 }	 
                    }
					
		    if ( vacio == 0 ) 
		       objLista.borrarFilasDeLista ("evoluprovmatseg", "7", '<axis:alt f="axisctr009" c="MENSA2" lit="1000254"/>');
                    }
              
                } catch (e) {
                   if (isDebugAjaxEnabled == "true")
                      alert (e.name + " " + e.message);
                }               
            }
            
            function callbackGuardarEmitir (ajaxResponseText) {
            	
                // Recibe la respuesta Ajax de guardar/contratar,
                // Escribe los mensajes de info/error correspondientes,
                // Y deshabilita los botones guardar, contratar y anterior 
                // Si la operación se ha realizado con éxito.
								
                //ecg20111006 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible
                LOCAL_showHideLoader("01", "", "none");
                
                

                var doc = objAjax.domParse(ajaxResponseText);
                var disableButtons = false;
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("ONPOLIZA")[0]) && objUtiles.hayValorElementoXml(doc.getElementsByTagName("OSSEGURO")[0])) {  
                        disableButtons = true;
                        objDom.setValorComponente(document.miForm.ONPOLIZA, objDom.getValorNodoDelComponente(doc.getElementsByTagName("ONPOLIZA"), 0, 0));  
                        objDom.setValorComponente(document.miForm.OSSEGURO, objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));  
                        
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                            var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                               objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden"); 
                               document.getElementById('MODALFORM').value= 'axisctr049';
                               objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form&MENSAJE="+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                            }
                        }else{
                            var mensaje="";
                        }
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                             var mensaje="";
                        }else{
                             //Se anyade una llamada a impresiones
                             document.getElementById('MODALFORM').value= 'axisimprimir';
                             objDom.setValorPorId("ES_IMP_MODAL", "SALIR");
                             
                         	
             				if(version_tomcat <= 6){
                             objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=impresion_doc&MENSAJE="+ mensaje +"&SEGURO=" + 
                            						objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0)+"&dt="+<%=new java.util.Date().getTime()%>);
             				}
             				else{
             					objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=impresion_doc&MENSAJE="+ encodeURI(mensaje) +"&SEGURO=" + 
                                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0)+"&dt="+<%=new java.util.Date().getTime()%>);
             				}
                        }
                    }
                    var visibility = disableButtons ? "hidden" : "visible";
                    <axis:visible f="axisctr009" c="BT_GUARDAR">
                        objDom.setVisibilidadPorId("but_guardar", visibility);
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_CONTRATAR">
                        if (document.miForm.ES_COL_ADMIN.value==0 || document.miForm.ES_CERTIF_CERO.value==0) {
                            if (visibility!="hidden" || objDom.esVisible("but_contratar")) { 
                                objDom.setVisibilidadPorId("but_contratar", visibility);
                            }
                        }
                    </axis:visible>
                    <axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">
                        objDom.setVisibilidadPorId("but_9901555", visibility);
                    </axis:visible>
                    objDom.setVisibilidadPorId("but_anterior", visibility);
                    objDom.setVisibilidadPorId("but_aceptar", visibility);
                    
                    // Botón de imprimir
                    //var visibilityImprimir = disableButtons ? "visible" : "hidden";
                    //objDom.setVisibilidadPorId("but_100001", visibilityImprimir);
                    
                }else{ //Si hay errores, dejar el botón de salir activo
                var operationOK = objAppMensajes.existenErroresEnAplicacion(doc); 
                <axis:visible f="axisctr009" c="BT_GUARDAR">
                    objDom.setVisibilidadPorId("but_guardar", "hidden");
                </axis:visible>
                <axis:visible f="axisctr009" c="BT_CONTRATAR">
                    if (objDom.esVisible("but_contratar")) {
                        objDom.setVisibilidadPorId("but_contratar", "hidden");
                    }
                </axis:visible>
                <axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">
                    objDom.setVisibilidadPorId("but_9901555", "hidden");
                 </axis:visible>
                objDom.setVisibilidadPorId("but_anterior", "hidden");
                objDom.setVisibilidadPorId("but_aceptar", "hidden");
                objDom.setVisibilidadPorId("but_100001", "hidden");
                }
            }
            
            function callbackGetReten (ajaxResponseText) {

                var doc = objAjax.domParse(ajaxResponseText);

                // Comprobar errores
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRET")[0])){
                    if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRET"), 0, 0) == 4){
                        objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden"); 
                        document.getElementById('MODALFORM').value= 'axisctr049';
                        objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form&MENSAJE="+objDom.getValorNodoDelComponente(doc.getElementsByTagName("MENSAJE"), 0, 0));
                    }
                    
                    }
                }
            }
            
            
            function callbackSeleccionarDocumentacion (ajaxResponseText, CALLBACK_PARAMS) {
                var doc = objAjax.domParse(ajaxResponseText);
                
                // Comprobar errores
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var CDOCUMENT = CALLBACK_PARAMS [0];
                    var CSELEC    = CALLBACK_PARAMS [1];
                    var CTIPDOC   = CALLBACK_PARAMS [2];
                    
                    // Recuperar la posición del CDOCUMENT clickado
                    var posicion = objLista.buscarFilaEnLista("T_IAX_DOCUMENTACION", CDOCUMENT);                    
                    // Establecer su clase de estilo en función de si CTIPDOC = 1 y CSELEC != 1
                    var styleClass = (CTIPDOC == 1 && CSELEC !=1 ? "dspTextAviso" : "dspText");
                                        
                    // Modificar su class dinámicamente por DOM                                        
                    var tableM = document.getElementById("T_IAX_DOCUMENTACION");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");                    
                    objLista.modificarClassDeLista(trM[posicion], 1, styleClass);
                }
            }
            // Modal Detalle Riesgo Asegurado ATUOS ACTR148
            function f_abrir_axisctrautos (NRIESGO) {
                document.getElementById('MODALFORM').value= 'axisctr148';
                objUtiles.abrirModal("axisctr148", "src", "axis_axisctr148.do?operation=form&origen=axisctr009&NRIESGO=" + NRIESGO);
            }
            function f_cerrar_axisctr148()         {
            objUtiles.cerrarModal("axisctr148");
            }   
            
            function f_recargar_cuadro_amortizacion(contador){                
                objDom.setValorPorId("NCONTADOR", contador);
                objUtiles.ejecutarFormulario("axis_axisctr009.do", "consultarCuadros", document.miForm, "_self", objJsMessages.jslit_cargando);                 
            }    
	        function f_abrir_axisctr163 (idGarantia) {
	       // objDom.setValorPorId("CGARANT", idGarantia);
               document.getElementById('MODALFORM').value= 'axisctr163';
	        objUtiles.abrirModal("axisctr163", "src", "modal_axisctr163.do?operation=form&origen=axisctr009&CGARANT=" + idGarantia);
	    		}
	    		
	    		function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        <%-->INI Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos<--%>
        function f_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
            objUtiles.ejecutarFormulario ("axis_axisctr009.do", "form", document.miForm, "_self" , objJsMessages.jslit_cargando);
        }
        
        function f_solo_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
        }           
        
        function f_abrir_axisctr173(){
            document.getElementById('MODALFORM').value= 'axisctr173';
            objUtiles.abrirModal("axisctr173", "src", "modal_axisctr173.do?operation=form&origen=axisctr009");
        }  
        
        <%-->FI Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos<--%>
        function getMensajeParaAxisimprimir(){
            return objDom.getValorPorId("MENSAJE_PARA_AXISIMPRIMIR");
            
        }
                
        function f_abrir_axisper046(personMarca, cmarca) {            
            objUtiles.abrirModal("axisper046", "src", "modal_axisper046.do?operation=init&SPERSON="+personMarca+'&CMARCA='+cmarca);                        
        }
        
          function f_abrir_axispsu003(SSEGURO,NMOVIMI,NRIESGO,CCONTROL,NOCURRE,CGARANT) {          
            
            var param = '&SSEGURO='+SSEGURO+'&NMOVIMI='+NMOVIMI+'&NRIESGO='+NRIESGO+'&CCONTROL='+CCONTROL+'&NOCURRE='+NOCURRE+'&CGARANT='+CGARANT+'&PTABLAS=EST'+'&MODO=1';
            
                objUtiles.abrirModal("axispsu003", "src", "modal_axispsu003.do?operation=form"+param);
            } 
            
            //PSU
             function f_abrir_axispsu004 () {           
                var NOVISIBLE = document.getElementById("NOVISIBLE").value;                
                objUtiles.abrirModal("axispsu004", "src", "modal_axispsu004.do?operation=form&NOVISIBLE"+NOVISIBLE+"&PTABLAS=EST");
            }
            
            function f_cerrar_axispsu004() {
                objUtiles.cerrarModal("axispsu004");
            }    
            
            function f_cerrar_axispsu003() {
                objUtiles.cerrarModal("axispsu003");
            }    
            
            function f_salir_axisper046() {
                objUtiles.cerrarModal("axisper046");
            }  
            
            function f_abrir_riedireccion(NRIESGO){
            
                var geo = '${__formdata.GEODIRECCION}';
                if (geo == 1){
                    document.getElementById('MODALFORM').value= 'axisdir002';
                    f_abrir_modal("axisdir002", false, "&NRIESGO=" + NRIESGO + "&MODO=CONSULTA");
                }    
                else
                    f_abrir_axisctr042(NRIESGO); 
            }
        
            function f_cancelar_axisdir002(MODO){
                f_cerrar_modal('axisdir002');
            }
            
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);   
            }
            function f_abrir_188(cpregun,tpregun,tipo) {
             //objUtiles.abrirModal("axisctr188", "src", "modal_axisctr188.do?operation=form&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1");
             objUtiles.abrirModal("axisctr218", "src", "modal_axisctr218.do?operation=form&ORIGEN=AXISCTR009&CTABLA=EST&CPREGUN=" + cpregun+"&TPREGUN="+tpregun+"&TIPO_PREGUNTA="+tipo+"&CONSULTA=1&NRIESGO="+objDom.getValorPorId("NRIESGO"));
             }      
             // Bug 0027955/0152240 - JSV (17/09/2013) => Añadimos parametro a  f_abrir_axisctr074 
               function f_abrir_axisctr074(ctipo,CTIPVISGRUP){
                  objUtiles.abrirModal("axisctr074", "src", "modal_axisctr074.do?operation=form&CTIPVISGRUP="+CTIPVISGRUP+"&CTIPO="+ctipo);
    
    }
    
     function f_cerrar_axisctr074() {
        objUtiles.cerrarModal("axisctr074");
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
    
    function f_but_docalta(){
        objDom.setValorPorId("ES_IMP_MODAL", "FORM");
        if(objDom.getValorPorId("SSEGURO_OUT") != ""){
             objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO=" + objDom.getValorComponente(document.miForm.SSEGURO_OUT) +"&TIPO=IMPRIMEPROP");

        }
        else{
             objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&SEGURO=" + objDom.getValorComponente(document.miForm.SSEGURO) +"&TIPO=IMPRIMEPROP");

        }
    }
    
    function f_habilita_botones(){
        if (objDom.getValorPorId("ES_IMP_DOCREQ") == 'S'){
            document.getElementById('but_guardar').disabled = false;        
            document.getElementById('but_contratar').disabled = false; 
        }            
        else{
            document.getElementById('but_guardar').disabled = true;        
            document.getElementById('but_contratar').disabled = true; 
        }            
    }    
    // INI-CONF-209-ASDQ
	    function f_convpesos(){
			objUtiles.abrirModal("axisctr222","src","modal_axisctr222.do?operation=form");
	    }

	    function f_cerrar_Axisctr222() {
	        objUtiles.cerrarModal("axisctr222");
	    }
    // FIN-CONF-209-ASDQ    
    </script>
    </head>
    <!-- 
    <%=request.getRemoteAddr() %>
    -->
    <body onload="f_onload()">
        <!-- ecg20111006 con el ajax de la documentacion requerida se perdio el "emitiendo". Se tenian que duplicar las funcinoes para hacerlo volver visible -->
        <iframe id="LOCAL01ajax4ie" class="precarga_fija" src="" style="top:0px;left:0px;z-index:100;display:none;width:100%;height:100%;filter:progid:DXImageTransform.Microsoft.Chroma(Color='#ffffff');" frameborder="0"></iframe>
        <div id="LOCAL01ajaxLoader" class="ajaxLoaderStyle">&nbsp;</div>
        <div id="LOCAL01ajaxContent" class="ajaxContentStyle">
          <div class="ajaxImageStyle"><img border="0" src="images/ajax-loader.gif"/></div>
        <div class="ajaxDivText"><span id="LOCAL01ajaxText" class="ajaxTextStyle">&nbsp;</span></div>
        <div class="ajaxContentEspacio">&nbsp;</div>
        </div>    
    	
          <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>  
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="ONPOLIZA" id="ONPOLIZA" value="${__formdata['ONPOLIZA']}" />
            <input type="hidden" name="OSSEGURO" id="OSSEGURO" value="${__formdata['OSSEGURO']}" />
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata['SSEGURO']}" />
            <input type="hidden" name="NMOVIMI" id="NMOVIMI" value="${__formdata.NMOVIMI}" />
            <input type="hidden" name="NCONTADOR" id="NCONTADOR" value="${__formdata.NCONTADOR}"/>        
            <input type="hidden" name="MODALFORM" id="MODALFORM" value="${__formdata.MODALFORM}"/> 
            <input type="hidden" name="NOVISIBLE" id="NOVISIBLE" value="${__formdata.NOVISIBLE}"/>
            <input type="hidden" name="ES_COL_ADMIN" id="ES_COL_ADMIN" value="${__formdata.ES_COL_ADMIN}"/>
            <input type="hidden" name="ES_CERTIF_CERO" id="ES_CERTIF_CERO" value="${__formdata.ES_CERTIF_CERO}"/>
            <input type="hidden" name="ES_IMP_DOCREQ" id="ES_IMP_DOCREQ" value="${__formdata.ES_IMP_DOCREQ}"/>
            <input type="hidden" name="ES_IMP_MODAL" id="ES_IMP_MODAL" value="${__formdata.ES_IMP_MODAL}"/>
	    <input type="hidden" name="GESTION_IR" id="GESTION_IR" value="${GESTION_IR}"/>
	    <input type="hidden" name="SSEGURO_OUT" id="SSEGURO_OUT" value="${__formdata['SSEGURO_OUT']}" />
	    <input type="hidden" name="SSEGURO_EST" id="SSEGURO_EST" value="${__formdata['SSEGURO_EST']}" />
            <input type="hidden" name="CACCION" id="CACCION" value="${__formdata['CACCION']}" />
			<input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
            
            <textarea style="display:none" name="MENSAJE_PARA_AXISIMPRIMIR" id="MENSAJE_PARA_AXISIMPRIMIR">${__formdata.MENSAJE_PARA_AXISIMPRIMIR}</textarea>        
            <c:import url="../include/titulo_nt.jsp">
                    <c:param name="modalidad"><axis:alt f="axisctr009" c="MODALIDAD" lit="101110" />
                    <axis:visible f="axisctr009" c="NPOLIZA_COLEC"> 
                      <axis:alt f="axisctr009" c="TITULO_FORM" lit="101779"/> 
                      <axis:alt f="axisctr009" c="TITULO_FORM" lit="102707"/> ${__formdata.NPOLIZA}
                    </axis:visible>
                    <axis:visible f="axisctr009" c="NPOLIZA"> 
                      <axis:alt f="axisctr009" c="TITULO_FORM" lit="101779"/> 
                      <axis:alt f="axisctr009" c="TITULO_FORM" lit="101273"/> ${__formdata.NPOLIZA}
                    </axis:visible>
                    </c:param>
                    <c:param name="titulo"></c:param>
                    <c:param name="formulario"><axis:alt f="axisctr009" c="TITULO" lit="108502" /></c:param>
                    <c:param name="form">axisctr009</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr009" c="TITULO_IMPRIMIR" lit="1000205" />|true#axisctr029|<axis:alt f="axisctr009" c="TITULO_DET_ASE" lit="1000195" />#axisctr148|<axis:alt f="axisctr009" c="TITULO_DET_ASE" lit="1000195" />#axisctr030|<axis:alt f="axisctr009" c="TITULO_DET_GAR" lit="1000196"/>#axispsu003|<axis:alt f="axisctr009" c="PSU003" lit="9002255" />#axisctr049|<axis:alt f="axisctr009" c="TITULO_COBRO" lit="9000604"/>|XoN</c:param>
            </c:import>
	    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr009" c="TITULO_DET" lit="9901369" /></c:param>
        				<c:param name="nid" value="axisctr188" />
    				</c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr009" c="TITULO_DET" lit="9901369" /></c:param>
        				<c:param name="nid" value="axisctr218" />
    				</c:import>            


 <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr009" c="TIT_FRANQ" lit="1000113" /></c:param>
        <c:param name="nid" value="axisctr074" />
    </c:import>
                                    
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr009" c="TITULO_DESGLOSE" lit="180183" /></c:param>
                <c:param name="nid" value="axisctr163" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr009" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="nid" value="axisctr173" />
            </c:import>  
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr042|<axis:alt f="axisctr009" c="MOD_PANT_AXISCTR042" lit="9000420"/>#axisctr043|<axis:alt f="axisctr009" c="MOD_PANT_AXISCTR043" lit="9000471"/></c:param>
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdir002" c="LIT_9000416" lit="9000416" /></c:param>
                <c:param name="nid" value="axisdir002" />
            </c:import>
             <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axis" c="INSPECCIONES" lit="9905244"/></c:param> 
                <c:param name="nid" value="axisins001" />
            </c:import>
            <!-- INI-CONF-209-ASDQ  -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr222" c="TITULO_DET" lit="89905651" /></c:param>
                <c:param name="nid" value="axisctr222" />
            </c:import>
            <!-- FIN-CONF-209-ASDQ  --> 
            <!-- INI BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS-->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper004" c="TITULO_DET" lit="9000417" /></c:param>
                <c:param name="nid" value="axisctr044" />
            </c:import>
            <!-- FIN BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS--> 			
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <!-- De datos póliza a tomadores -->        
                <c:import url="axisctr009_a.jsp"/>
                <!-- De riesgos hasta Beneficiarios -->
                <c:import url="axisctr009_b.jsp"/>
                <!-- De Clausulas hasta el final -->
                <c:import url="axisctr009_c.jsp"/>                
            </table>    
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr009</c:param>
                <%--c:param name="__botones">cancelar,guardar,imprimir,documentacion,anterior,contratar</c:param--%>
                <c:param name="__botones">salir,anterior<axis:visible f="axisctr009" c="BT_ENVIAR_CORREO">,9901555</axis:visible><c:if test="${ __formdata.CACCION !=2}"><axis:visible f="axisctr009" c="BT_GUARDAR">,guardar</axis:visible></c:if><c:if test="${(__formdata.ES_COL_ADMIN==0 || __formdata.ES_CERTIF_CERO==0) && __formdata.PERMITEEMITIR==0}"><c:if test="${!(__formdata.CACCION ==1 || __formdata.CACCION ==2)  && __formdata.FACT_ELECTRONICA==0}"><axis:visible f="axisctr009" c="BT_CONTRATAR">,contratar</axis:visible></c:if></c:if><c:if test="${__formdata.PERMITEEMITIR==0}">,aceptar</c:if>,100001</c:param>
                
                
            
            
            </c:import>

        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
