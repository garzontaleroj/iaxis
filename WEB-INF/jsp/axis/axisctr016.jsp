<%/* Revision:# wFMaWU98l7mqmdZ2uN5nmQ== # */%>
<%--
  Fichero: axisctr016.jsp
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
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 100px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
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
            
            function f_recarga(mensaje){
                 document.miForm.MISSATGE.value = mensaje;
                 var objFecha = new JsFecha();
                 
                if (!objUtiles.estaVacio (document.miForm.FANULAC.value)){
                    document.miForm.FANULAC.value = objFecha.formateaFecha(document.miForm.FANULAC.value);
                }
               
                 objUtiles.ejecutarFormulario ("axis_axisctr016.do", "recarg", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_reciboscobon(){
              if (document.getElementById("tdimpextorsion")){
                objDom.setVisibilidadPorId("tdimpextorsion", "visible");
              }
            }
            
            function f_reciboscoboff(){
               if (document.getElementById("tdimpextorsion")){                    
                 objDom.setVisibilidadPorId("tdimpextorsion", "hidden");               
                 document.miForm.IMPEXTORSION.value="";
               }
            }
            
            function f_recibospendon(){
              //objDom.setVisibilidadPorId("recibos_pend_tab", "visible");
              f_recarga();     
              //objDom.setValorPorId("LIMPIAR_DATOS", "true");
              //objUtiles.ejecutarFormulario ("axis_axisctr016.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            
            }
            
            function f_recibospendoff(){
              //objDom.setVisibilidadPorId("recibos_pend_tab", "hidden");
              f_recarga();
              //objDom.setValorPorId("LIMPIAR_DATOS", "true");
              //objUtiles.ejecutarFormulario ("axis_axisctr016.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            
            }
            
            function f_cambiarfecha(){
                objUtiles.ejecutarFormulario ("axis_axisctr016.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            function f_onload(){            

                var missatge = document.miForm.MISSATGE.value;
                f_cargar_propiedades_pantalla(); 

                <c:if test="${empty __formdata['SSEGURO']}" >
                    f_abrir_axisctr019();
                </c:if>
 
                if (!objUtiles.estaVacio (missatge)){
                    objAppMensajes.pintarMensajePantalla(missatge, "info"); 
                    document.miForm.MISSATGE.value = "";
                }  
                var tipoAnulacion="${__formdata['CCAUANULA']}";
                var sproducto="${sessionScope.__pila[0].SPRODUC}";
                var sseguro = "${__formdata['SSEGURO']}";
                var sseguro_baja = "${__formdata['SSEGURO_BAJA']}";
               
                if(tipoAnulacion !=null && tipoAnulacion !=""){
                    f_mostrar_checkAnulacion(sproducto, tipoAnulacion, sseguro, sseguro_baja);
                }
            }
            
            function f_onchange_CTIPANUL() {
                objUtiles.ejecutarFormulario ("axis_axisctr016.do", "tipanul", document.miForm, "_self", objJsMessages.jslit_cargando);                                      
            }
            
            function f_but_salir() {
                //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr016", "cancelar", document.miForm, "_self");
            }   
            
            function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                document.miForm.FANULAC.value = '';
                f_recarga(); 
            }
           
            
            // Anular p�liza
            function f_but_100648() {
                if (objValidador.validaEntrada()) {
                    // objUtiles.ejecutarFormulario ("axis_axisctr016.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);     
                    var SSEGURO   = document.miForm.SSEGURO.value;
                    var SSEGURO_BAJA   = document.miForm.SSEGURO_BAJA.value;
                    var CTIPANUL  = document.miForm.CTIPANUL.value;
                    var CCAUANULA = document.miForm.CCAUANULA.value;
                    var FANULAC   = document.miForm.FANULAC.value;
                    var MOTANULA  = document.miForm.MOTANULA.value;
                    var IMPEXTORSION ;
                    if (document.miForm.IMPEXTORSION){                    
                        IMPEXTORSION = document.miForm.IMPEXTORSION.value;    
                    }
                    var RECEXTRN  = "";
                    var ANULAREC  = "";
                    var APLICA_PENALI  = document.miForm.APLICA_PENALI.value;
                    try{
                      var FANULAC_COR   = document.miForm.FANULAC_COR.value;
                    }catch(e){FANULAC_COR = null;}
                    
                    var inputs=document.getElementsByTagName("input");
                    var recibos="";
               
                    if (CTIPANUL == 4){
                        for(i=0;i<inputs.length;i++) {
                            if (inputs[i].type=="checkbox" && inputs[i].name=="checkboxNRECIBO") {
                                if (inputs[i].checked && inputs[i].name.indexOf("checkboxNRECIBO_"==0)) {
                                    if (!recibos==""){
                                       recibos=recibos+",";
                                    }
                                    recibos=recibos+inputs[i].id.substring(16);
                                }
                            }
                            if (inputs[i].type=="radio" && inputs[i].name=="ANURECCOB") {
                                if (inputs[i].checked && inputs[i].name.indexOf("ANURECCOB"==0)) {
                                    RECEXTRN=inputs[i].value;
                                }
                            }
                            if (inputs[i].type=="radio" && inputs[i].name=="ANURECPEND") {
                                if (inputs[i].checked && inputs[i].name.indexOf("ANURECPEND"==0)) {
                                    ANULAREC=inputs[i].value;
                                }
                            }
                        }
                    }
                    var NPOLIZA= document.miForm.NPOLIZA.value;
                    var NCERTIF = document.miForm.NCERTIF.value;
                    var NCASO_BPM;
                    var NSOLICI_BPM;
                    <axis:ocultar c="DSP_BPM" f="axisctr016" dejarHueco="false">
                        <axis:ocultar c="NCASO_BPM" f="axisctr016" dejarHueco="false"> 
                            NCASO_BPM = document.miForm.NCASO_BPM.value;
                        </axis:ocultar>
                        <axis:ocultar c="NSOLICI_BPM" f="axisctr016" dejarHueco="false">                            
                            if (NCERTIF!=0)NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                        </axis:ocultar>
                    </axis:ocultar>
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callback, 
                        "operation=aceptar&FANULAC_COR="+FANULAC_COR+"&SSEGURO=" + SSEGURO + "&CTIPANUL=" + CTIPANUL + "&CCAUANULA=" + CCAUANULA + "&FANULAC=" + FANULAC + "&MOTANULA=" + MOTANULA +
                        "&APLICA_PENALI=" + APLICA_PENALI +"&RECEXTRN=" + RECEXTRN+"&ANULAREC=" + ANULAREC+"&RECIBOS=" + recibos + "&IMPEXTORSION=" + IMPEXTORSION+"&SSEGURO_BAJA=" + SSEGURO_BAJA+
                        "&NPOLIZA="+NPOLIZA+"&NCERTIF="+NCERTIF+"&NCASO_BPM="+NCASO_BPM+"&NSOLICI_BPM="+NSOLICI_BPM, this, objJsMessages.jslit_anulando_poliza);
                }
            } 
            
            function f_but_9002062() {
                // if (objValidador.validaEntrada()) {
                    var SSEGURO   = document.miForm.SSEGURO.value;
                    var FANULAC   = document.miForm.FANULAC.value;
                    
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callbackCancelar, 
                        "operation=cancelar&SSEGURO=" + SSEGURO + "&FANULAC=" + FANULAC, this, objJsMessages.jslit_cargando);
                // }
            }
            
            // Consultar p�liza
            function f_but_151477() { 
                var SSEGURO = document.miForm.SSEGURO.value;
                if (objUtiles.estaVacio (SSEGURO)) 
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr016.do", "consultar",document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            
            
            // Solicitud de baja
            function f_but_9901672()
            {
                if (objValidador.validaEntrada()) {
                
                 var SSEGURO   = document.miForm.SSEGURO.value;
                    var CTIPANUL  = document.miForm.CTIPANUL.value;
                    var CCAUANULA = document.miForm.CCAUANULA.value;
                    var FANULAC_COR   = document.miForm.FANULAC_COR.value;
                    var MOTANULA  = document.miForm.MOTANULA.value;
                    var TOBSERV  = document.miForm.TOBSERV.value;
                    var RECEXTRN  = "";
                    var ANULAREC  = "";
                    
                    var inputs=document.getElementsByTagName("input");
                    var recibos="";
               
                    if (CTIPANUL == 4){
                        for(i=0;i<inputs.length;i++) {
                            if (inputs[i].type=="checkbox" && inputs[i].name=="checkboxNRECIBO") {
                                if (inputs[i].checked && inputs[i].name.indexOf("checkboxNRECIBO_"==0)) {
                                    if (!recibos==""){
                                       recibos=recibos+",";
                                    }
                                    recibos=recibos+inputs[i].id.substring(16);
                                }
                            }
                            if (inputs[i].type=="radio" && inputs[i].name=="ANURECCOB") {
                                if (inputs[i].checked && inputs[i].name.indexOf("ANURECCOB"==0)) {
                                    RECEXTRN=inputs[i].value;
                                }
                            }
                            if (inputs[i].type=="radio" && inputs[i].name=="ANURECPEND") {
                                if (inputs[i].checked && inputs[i].name.indexOf("ANURECPEND"==0)) {
                                    ANULAREC=inputs[i].value;
                                }
                            }
                        }
                    }
                    
                    document.miForm.SOLIC_CREADA.value = "1";
                                        
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callback_solic, 
                        "operation=solic_baja&SSEGURO=" + SSEGURO + "&CTIPANUL=" + CTIPANUL + "&CCAUANULA=" + CCAUANULA + "&FANULAC_COR=" + FANULAC_COR + "&MOTANULA=" + MOTANULA +
                        "&RECEXTRN=" + RECEXTRN+"&ANULAREC=" + ANULAREC+"&RECIBOS=" + recibos + "&TOBSERV="+TOBSERV, this, objJsMessages.jslit_anulando_poliza);
                    
                    
                }            
            }
            
            function f_cargar_motivos(thiss){
                    <axis:visible c="MOTANULA2" f="axisctr016" >                                      
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callbackAjaxCargarMotivos, "operation=ajax_busqueda_motivos&CCAUANULA=" + thiss, 
                    this, objJsMessages.jslit_cargando);
                    </axis:visible>
            }      

            function f_mostrar_checkAnulacion(param1, param2, param3, param4){ 
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callbackAjaxShowChk, "operation=ajax_m_aplica_penali&NUMPROD=" + param1 + "&CCAUANULA=" + param2 + "&PSSEGURO=" + param3 + "&SSEGURO_BAJA=" + param4, 
                    this, objJsMessages.jslit_cargando);
            } 

            function callbackAjaxShowChk  (ajaxResponseText){
               var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CHKVISIBLE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CHKVISIBLE"), 0, 0); 
                    if(CHKVISIBLE=='1'){
                        document.getElementById("APLICA_PENALI").style.visibility="visible";
                        document.getElementById("APLICA_PENALI").style.display="block";
                        document.getElementById("TD_APLICA_PENALI").style.visibility="visible";
                        document.getElementById("TD_APLICA_PENALI").style.display="block";                                                
                        document.getElementById("C_APLICA_PENALI").style.visibility="visible";
                        document.getElementById("C_APLICA_PENALI").style.display="block";       
                        document.getElementById("C_APLICA_PENALI").style.display="block";       
                        document.getElementById("C_APLICA_PENALI").checked = false;
                    }else{
                        document.getElementById("APLICA_PENALI").style.visibility="hidden";
                        document.getElementById("APLICA_PENALI").style.display="none";   
                        document.getElementById("TD_APLICA_PENALI").style.visibility="hidden";
                        document.getElementById("TD_APLICA_PENALI").style.display="none";    
                    }
                }
                // recarrega scroll pane
               $.reinitialiseScroll(); 
            }

            function callbackAjaxCargarMotivos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CMOTANULA");
                    
                    var CMOTANULACombo = document.miForm.MOTANULA;     
                    objDom.borrarOpcionesDeCombo(CMOTANULACombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt c="TITULO_MOTANULA" f="axisctr016" lit="108341"/> - ', CMOTANULACombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CMOTANULA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMOTANULA"), i, 0);
                            var TMOTANULA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMOTANULA"), i, 0);                                     
                            objDom.addOpcionACombo(TMOTANULA, TMOTANULA, CMOTANULACombo, i+1);
                        }

                }
                // recarrega scroll pane
                $.reinitialiseScroll(); 
            } 

            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            function f_abrir_axisctr019() {
                document.miForm.FANULAC.value = '';
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }    
            
            function f_aceptar_axisctr019 (SSEGURO) {
                f_cerrar_axisctr019();
                objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                objDom.setValorPorId("LIMPIAR_DATOS", "true");
                objUtiles.ejecutarFormulario ("axis_axisctr016.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            function callback (ajaxResponseText) {
                // Recibe la respuesta Ajax de anular
                // Escribe los mensajes de info/error correspondientes,
                // Y deshabilita los botones anular y consultar p�liza.
                // Si la operaci�n se ha realizado con �xito.

                var doc=objAjax.domParse(ajaxResponseText);
                var disableButtons = false;
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){    
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)                    
                    
                    <axis:visible c="BT_ANULAR" f="axisctr016">
                    document.miForm.but_100648.style.visibility = "hidden"; // Deshabilitamos bot�n de anular
                    </axis:visible>
                    <axis:visible c="BUT_CONSULTA" f="axisctr016">
                    document.miForm.but_151477.style.visibility = "hidden"; // Deshabilitamos bot�n de consultar p�liza
                     </axis:visible>
                    var mensaje="";
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);                       
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("MSG_BPM")[0])){
                        mensaje = mensaje + "<BR>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("MSG_BPM"), 0, 0);
                    }
                    if ( !objUtiles.hayValorElementoXml(    doc.getElementsByTagName("OERROR")[0]    ) ) {
                        
                    	var version = document.getElementById("serverid").value;
                    	var pos = parseInt(version.search('/'))+1;
                    	var version2 = version.substr(pos,1);
                    	
        				if(version2 <= 6){
	                    	//Se anyade una llamada a impresiones
	                        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&TIPO=ANULACION&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
        				}else{
        					objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&TIPO=ANULACION&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
        				}
        				
        			}
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
            }            
            
            function callback_solic (ajaxResponseText) {
                
                var doc=objAjax.domParse(ajaxResponseText);
                var disableButtons = false;
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){    
                
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                    document.miForm.but_9901672.style.visibility = "hidden"; // Deshabilitamos bot�n de anular
                                       
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                    } else {
                        var mensaje="";
                    }
                
                    if ( !objUtiles.hayValorElementoXml(    doc.getElementsByTagName("OERROR")[0]    ) ) {
                        //Se anyade una llamada a impresiones                      
                        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO=ANULACION&MENSAJE="+mensaje+"&SEGURO=" + document.miForm.SSEGURO.value);
                    }
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }
 
            function callbackCancelar (ajaxResponseText) {
                // Recibe la respuesta Ajax de anular
                // Escribe los mensajes de info/error correspondientes,
                // Y deshabilita los botones anular y consultar p�liza.
                // Si la operaci�n se ha realizado con �xito.

                var doc=objAjax.domParse(ajaxResponseText);
                var disableButtons = false;
                
                document.miForm.CTIPANUL.value = null;
                document.miForm.CCAUANULA.value = null;
                document.miForm.FANULAC.value = null;

                if (!objAppMensajes.existenErroresEnAplicacion(doc)){    
                    // Verificamos que no se han producido excepciones JAVA ni errores en la peticion PL (en este orden)
                    document.miForm.but_9002062.style.visibility = "hidden"; // Deshabilitamos bot�n de desanular
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                    } else {
                        var mensaje="";
                    }
                }

                f_recarga(mensaje);
                
                // recarrega scroll pane
                $.reinitialiseScroll();
            }
            
            function f_abrir_axisctr213(){
                var NPOLIZA = document.miForm.NPOLIZA.value; 
                var SPRODUC = document.miForm.SPRODUC.value;
                var NCERTIF = document.miForm.NCERTIF.value;
                objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISCTR016&SPRODUCSEL="+SPRODUC+"&NPOLIZASEL="+NPOLIZA+"&NCERTIFSEL="+NCERTIF);
            }
            
            function f_cerrar_axisctr213() {
                objUtiles.cerrarModal("axisctr213");
            }
            
            function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
                objUtiles.cerrarModal("axisctr213");
                <axis:ocultar c="NCASO_BPM" f="NCASO_BPM" dejarHueco="false">
                    document.miForm.NCASO_BPM.value = NCASO_BPM;
                    document.miForm.NNUMCASO.value = NNUMCASO;
                </axis:ocultar>
                <axis:ocultar c="NSOLICI_BPM" f="axisctr016" dejarHueco="false">
                    if (document.miForm.NCERTIF.value!=0) document.miForm.NSOLICI_BPM.value = NSOLICI_BPM;
                </axis:ocultar>
                f_cargar_casobpm();
            }
            
            function f_cargar_casobpm(){
            
                var NCASO_BPM = document.miForm.NCASO_BPM.value;
                var NSOLICI_BPM;                
                var NNUMCASO=null;
                document.miForm.NNUMCASO.value=null;
                document.miForm.TNOMCOM.value = "";
                
                if (!objUtiles.estaVacio(NCASO_BPM)){
                    var NCERTIF = document.miForm.NCERTIF.value;
                    if (NCERTIF !=0){
                       NSOLICI_BPM = document.miForm.NSOLICI_BPM.value;
                       if (objUtiles.estaVacio(NSOLICI_BPM)){
                           document.miForm.NSOLICI_BPM.focus();
                           return;
                        }
                    }
                    objAjax.invokeAsyncCGI("axis_axisctr016.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO=" + NNUMCASO +"&NCASO_BPM="+NCASO_BPM+"&NSOLICI_BPM="+NSOLICI_BPM, this, objJsMessages.jslit_cargando);
                }
            }
            
            function callbackAjaxCargarCasoBPM (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                        objDom.setValorPorId("TNOMCOM", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("TNOMCOM",""); 
                    }
                }
            } 
            
        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="axis_axisctr016.do" method="POST">
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_BUSC" f="axisctr016" lit="1000188"/></c:param>
                <c:param name="nid" value="axisctr019" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr016" lit="9906011"/></c:param>
            </c:import>

            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />
            <input type="hidden" name="ES_DESANULABLE" id="ES_DESANULABLE" value="${ES_DESANULABLE}" />            
            <input type="hidden" name="MISSATGE" id="MISSATGE" value="${__formdata.MISSATGE}" />
            <input type="hidden" name="CSITUAC" id="CSITUAC" value="${CSITUAC}" />
            <input type="hidden" name="SOLIC_CREADA" id="SOLIC_CREADA" value="${__formdata.SOLIC_CREADA}" />
            
            <input type="hidden" name="serverid" id="serverid" value="<%= application.getServerInfo() %>" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"> </c:param>
                <c:param name="titulo"> <axis:alt c="TITULO" f="axisctr016" lit="104298"/></c:param>
                <c:param name="formulario"><axis:alt c="TITULO" f="axisctr016" lit="104298"/></c:param>
                <c:param name="producto"> </c:param>
                <c:param name="form">axisctr016</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo"><axis:alt c="TITULO_BUSC" f="axisctr016" lit="1000188"/>#axisimprimir|<axis:alt c="LIT_IMPRIMIR" f="axisctr016" lit="1000205" />#axisgedox|<axis:alt c="LIT_IMP_GEDOX" f="axisctr016" lit="1000201" />#axisctr023|<axis:alt c="LIT_COBRO_REB" f="axisctr016" lit="1000191" />#axisctr025|<axis:alt c="LIT_DET_MOV" f="axisctr016" lit="140360"/>#axisctr029|<axis:alt c="LIT_DET_ASE" f="axisctr016" lit="1000195"/>#axisctr030|<axis:alt c="LIT_DET_GAR" f="axisctr016" lit="1000196"/>#axisctr039|Suplementos</c:param>
            </c:import>            
<!-- Area de campos  -->
    <input type="hidden" name="SSEGURO" value="${__formdata['SSEGURO']}" />
    <input type="hidden" name="SSEGURO_BAJA" id="SSEGURO_BAJA" value="${__formdata['SSEGURO_BAJA']}" />
    <input type="hidden" name="SPRODUC" value="${__formdata['SPRODUC']}" />
    <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${ __formdata.NNUMCASO}"/>
    <div class="separador">&nbsp;</div>
    
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_DATPOL" f="axisctr016" lit="110853" /></div>
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
                    <td class="titulocaja"><b><axis:alt c="NPOLIZA" f="axisctr016" lit="100624" /></b><img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/></td>
                    <axis:ocultar dejarHueco="false" c="NCERTIF" f="axisctr016">
                        <td class="titulocaja"><b><axis:alt f="axisctr016" c="NCERTIF" lit="101168"></axis:alt></b></td>
                    </axis:ocultar>
                    <td class="titulocaja"><b><axis:alt c="TSITUAC" f="axisctr016" lit="100874" /></b></td>
                    <td class="titulocaja"><b><axis:alt c="TPRODUC" f="axisctr016" lit="100829" /></b></td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="campowidthinput campo campotexto"  name="NPOLIZA" id="NPOLIZA" value="${datpoliza.ONPOLIZA}" readonly="true" style="width:90%"/>
                    </td>
                    <axis:ocultar dejarHueco="false" c="NCERTIF" f="axisctr016">
                        <td><input type="text" class="campowidthinput campo campotexto" name="NCERTIF" id="NCERTIF" value="${datpoliza.ONCERTIF}" readonly="true" style="width:90%"/></td>
                    </axis:ocultar>
                    <td><input type="text" class="campowidthinput campo campotexto"  value="${datpoliza.OTSITUAC}" readonly="true" style="width:90%"/></td>
                    <td colspan="2"><input type="text" class="campowidthinput campo campotexto" style="width:99%" value="${datpoliza.OTPRODUC}" readonly="true" /></td>
                </tr>
                <tr>
                    
                    <td class="titulocaja"><b><axis:alt c="FEFECTO" f="axisctr016" lit="100883" /></b></td>
                    <axis:ocultar dejarHueco="false" c="FVENCIM" f="axisctr016">
                        <td class="titulocaja"><b><axis:alt f="axisctr016" c="FVENCIM" lit="100885"></axis:alt></b></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FRENOVAC" f="axisctr016">
                        <td class="titulocaja"><b><axis:alt f="axisctr016" c="FRENOVAC" lit="800314"></axis:alt></b></td>
                    </axis:ocultar>
                    <!-- FECHA ANULACION -->
                    <axis:ocultar dejarHueco="false" c="FFANULAC" f="axisctr016">
                        <td class="titulocaja">
                            <b><axis:alt c="FFANULAC" f="axisctr016" lit="140214" /></b>
                        </td>
                    </axis:ocultar> 
                </tr>
                <tr>
                    <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.OFEFECTO}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    <axis:ocultar dejarHueco="false" c="FVENCIM" f="axisctr016">
                        <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.OFVENCIM}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FRENOVAC" f="axisctr016">    
                        <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.OFRENOVAC}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FFANULAC" f="axisctr016">
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" id="FFANULAC" name="FFANULAC" size="15"
                            value="<fmt:formatDate value="${datospoliza.FANULAC}" pattern="dd/MM/yyyy"/>" readonly="true" />
                        </td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="TINCIDE" f="axisctr016">    
                        <td class="campocaja" colspan="2" style="color:red;">
                            <b>${datospoliza.TINCIDE}</b>
                        </td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar dejarHueco="false" c="CPOLCIA" f="axisctr016">
                        <td class="titulocaja">
                            <b><axis:alt c="CPOLCIA" f="axisctr016" lit="9001766" /></b>
                        </td>
                    </axis:ocultar>        
                </tr>
                <tr>           
                    <axis:ocultar dejarHueco="false" c="CPOLCIA" f="axisctr016">
                        <td><input type="text" class="campowidthinput campo campotexto"  value="${datospoliza.CPOLCIA}" readonly="true" style="width:90%"/></td>
                    </axis:ocultar>                 
                </tr>
            </table>   
            
            <div class="separador">&nbsp;</div>
            <!-- DisplayTag Tomadores -->
            <c:set var="title1"><axis:alt c="LIT_PRENEDOR" f="axisctr016" lit="1000181" /></c:set>
            <div class="displayspace">
              <display:table name="${tomadores}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
               requestURI="axis_axisctr016.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}</div>
                </display:column>
            </display:table>
            
            </div>
            </div>
            
            <axis:ocultar dejarHueco="false" c="DSP_RECIBOS" f="axisctr016">
            <div class="separador">&nbsp;</div>
                <div class="titulo"><axis:alt f="axisctr016" c="DSP_RECIBOS" lit="1000343"></axis:alt></div>
                <!-- DisplayTag recibos -->
            
                <c:set var="title1"><axis:alt c="NRECIBO" f="axisctr016" lit="100895" /></c:set>
                <c:set var="title7"><axis:alt c="CRECCIA" f="axisctr016" lit="9001763" /></c:set>
                <c:set var="title2"><axis:alt c="FEFECTO" f="axisctr016" lit="100883" /></c:set>
                <c:set var="title3"><axis:alt c="FVENCIM" f="axisctr016" lit="100885" /></c:set>
                <c:set var="title4"><axis:alt c="ICONCEP" f="axisctr016" lit="100563" /></c:set>
                <c:set var="title5"><axis:alt c="TTIPREC" f="axisctr016" lit="102302"/></c:set>
                <c:set var="title6"><axis:alt c="TESTREC" f="axisctr016" lit="100874" /></c:set>
                <div class="displayspace">
                    <display:table name="${recibos}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr016.do?paginar=true">
                    <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title1}" sortProperty="NRECIBO" sortable="true" headerClass="headwidth110 sortable" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${miListaId['NRECIBO']}" pattern="000000000" /></div>
                    </display:column>
                    <axis:visible c="CRECCIA" f="axisctr016">
                        <display:column title="${title7}" sortProperty="CRECCIA" sortable="true" headerClass="headwidth110 sortable" media="html" autolink="false" >
                            <div class="dspText">${miListaId.CRECCIA}</div>
                        </display:column>
                    </axis:visible>
                    <display:column title="${title2}" sortProperty="FEFECTO" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                        <div class="dspText"><fmt:formatDate value="${miListaId['FEFECTO']}" pattern="dd/MM/yy" /></div>
                    </display:column>
                    <display:column title="${title3}" sortProperty="FVENCIM" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                        <div class="dspText"><fmt:formatDate value="${miListaId['FVENCIM']}" pattern="dd/MM/yy" /></div>
                    </display:column>
                    <display:column title="${title4}" sortProperty="ICONCEP" sortable="true" headerClass="headwidth15 sortable" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${miListaId['ICONCEP']}" pattern="${__formatNumberPatterns[CMONPRODINT]}" /></div>
                    </display:column>
                    <display:column title="${title5}" sortProperty="TTIPREC " sortable="true" headerClass="headwidth20 sortable" media="html" autolink="false" >
                         <div class="dspText">${miListaId.TTIPREC}</div>
                    </display:column>
                    <display:column title="${title6}" sortProperty="TESTREC" sortable="true" headerClass="headwidth20 sortable" media="html" autolink="false" >
                        <div <c:if test="${miListaId['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaId['CESTREC']!=0}">class="dspText"</c:if>>${miListaId['TESTREC']}</div>
                    </display:column>
                    </display:table>
                    </div>
        
            </axis:ocultar>
            
            <axis:ocultar dejarHueco="false" c="DSP_SINIESTROS" f="axisctr016">          
                <div class="separador">&nbsp;</div>
                <div class="titulo"><axis:alt f="axisctr016" c="DSP_SINIESTROS" lit="100592"></axis:alt></div>
                <!-- DisplayTag siniestros -->
                <c:set var="title1"><axis:alt c="NSINIES" f="axisctr016" lit="101298" /></c:set>
                <c:set var="title2"><axis:alt c="FSINIES" f="axisctr016" lit="110278" /></c:set>
                <c:set var="title3"><axis:alt c="CESTSIN" f="axisctr016" lit="100874" /></c:set>
                <c:set var="title4"><axis:alt c="TSINIES" f="axisctr016" lit="100588" /></c:set>
                <c:set var="title5"><axis:alt c="NSINCIA" f="axisctr016" lit="9901399" /></c:set>
                <div class="displayspace">
                    <display:table name="${siniestros}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr016.do?paginar=true">
                    <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title1}" sortProperty="NSINIES"  sortable="true" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${miListaId['NSINIES']}" pattern="000000000" /></div>
                    </display:column>                              
                    <axis:visible c="NSINCIA" f="axisctr016">
                        <display:column title="${title5}" sortProperty="NSINCIA"  sortable="true" headerClass="headwidth5 sortable" media="html" autolink="false" >
                              <div class="dspText">${miListaId['NSINCIA']}</div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="FSINIES" f="axisctr016">
                        <display:column title="${title2}" sortProperty="FSINIES" sortable="true" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <div class="dspText"><fmt:formatDate value="${miListaId['FSINIES']}" pattern="dd/MM/yy" /></div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="CESTSIN" f="axisctr016">
                        <display:column title="${title3}" sortProperty="CESTSIN" sortable="true" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <div class="dspText">${miListaId['CESTSIN']}</div>
                        </display:column>
                    </axis:visible>
                    <axis:visible c="TSINIES" f="axisctr016">
                        <display:column title="${title4}" sortProperty="TSINIES" sortable="true" style="width:15%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                            <div class="dspText">${miListaId['TSINIES']}</div>
                        </display:column>
                    </axis:visible>
                  
                    </display:table>
                   
                </div>
            </axis:ocultar>
            
            <!-- INI bpm -->
           
            <axis:ocultar c="DSP_BPM" f="axisctr016" dejarHueco="false">            
                <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisctr016" c="titulo" lit="9906103" />
                </div> 
                <table class="seccion" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table class="area" align="center"> 
                                <tr>
                                    <th style="width:10%;height:0px"></th>
                                    <c:if test="${datpoliza.ONCERTIF != 0}">
                                        <th style="width:10%;height:0px"></th>
                                    </c:if>
                                    <th style="width:5%;height:0px"></th>
                                    <th style="width:75%;height:0px"></th>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr016" c="NCASO_BPM" dejarHueco="false"> 
                                        <td class="titulocaja" id="tit_NCASO_BPM">
                                            <b><axis:alt f="axisctr016" c="NCASO_BPM" lit="9906097" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr016" c="NSOLICI_BPM" dejarHueco="false">
                                        <c:if test="${datpoliza.ONCERTIF != 0}">
                                            <td class="titulocaja" id="tit_NSOLICI_BPM">                                                                                        
                                                <b><axis:alt c="NSOLICI_BPM" f="axisctr016" lit="9906098" /></b>                                            
                                            </td>
                                        </c:if>
                                        <td></td>
                                        <td class="titulocaja" id="tit_TNOMCOM">
                                            <b><axis:alt f="axisctr016" c="TNOMCOM" lit="105940" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr016" c="NCASO_BPM" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" id="NCASO_BPM" name="NCASO_BPM" title="<axis:alt f="axisctr016" c="NCASO_BPM" lit="9906097" />" value="${__formdata.NCASO_BPM}" class="campowidthinput campo campotexto"  formato="entero"
                                                <axis:atr f="axisctr016" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm()" style="width:130px;"/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr016" c="NSOLICI_BPM" dejarHueco="false">
                                        <c:if test="${datpoliza.ONCERTIF != 0}">
                                            <td class="campocaja">
                                                <input type="text" id="NSOLICI_BPM" name="NSOLICI_BPM" title="<axis:alt f="axisctr016" c="NSOLICI_BPM" lit="9906098" />" value="${ __formdata.NSOLICI_BPM}" class="campowidthinput campo campotexto" formato="entero"
                                                    <axis:atr f="axisctr016" c="NSOLICI_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm()" style="width:130px;"/>
                                            </td>
                                        </c:if>
                                        <td>
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                                        </td>
                                        <td class="campocaja">    
                                            <input readonly="true" type="text" name="TNOMCOM" id="TNOMCOM" value="${ __formdata.TNOMCOM}" class="campowidthinput campo campotexto"/>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </axis:ocultar>
            
             <!-- FIN bpm -->            
            
            <axis:ocultar c="DSP_ANULACION" f="axisctr016" dejarHueco="false">
            <div id="DSP_ANULACION">
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_DATOS_ANUL" f="axisctr016" lit="1000460" /></div>
                <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>            
                    <tr>
                        <axis:ocultar c="CTIPANUL" f="axisctr016" dejarHueco="false">
                            <td class="titulocaja"><b><axis:alt c="CTIPANUL" f="axisctr016" lit="152363" /></b></td>
                        </axis:ocultar>
                        <td class="titulocaja" colspan="2"><b><axis:alt c="CCAUANULA" f="axisctr016" lit="1000461" /></b></td>
                        <td class="titulocaja"><b><axis:alt c="FANULAC" f="axisctr016" lit="140214" /></b></td>        
                        <axis:ocultar c="APLICA_PENALI" f="axisctr016" dejarHueco="false">
                         <td  class="titulocaja" id="TD_APLICA_PENALI">
                            <b id="label_APLICA_PENALI"><axis:alt f="axisctr016" c="APLICA_PENALI" lit="9903952"/></b>
                         </td>
                        </axis:ocultar>
                    </tr>          
                    <tr>
                        <axis:visible c="CTIPANUL" f="axisctr016">
                        <td>
                        
                            <select id="CTIPANUL" name="CTIPANUL" size="1" class="campo campotexto" style="width:90%" onchange="if (this.selectedIndex>0) f_onchange_CTIPANUL()" 
                            obligatorio="true" title="<axis:alt c="CTIPANUL" f="axisctr016" lit="152363"/>" <c:if test="${empty __formdata['SSEGURO']}">disabled</c:if>>
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="LIT_SELEC" f="axisctr016" lit="108341"/> - </option>
                                <c:forEach items="${tipanupol}" var="item">
                                    <option value="${item['CATRIBU']}" <c:if test="${__formdata['CTIPANUL']==item['CATRIBU']}">selected</c:if>>${item['TATRIBU']}</option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:visible> 
                        
                        <axis:ocultar c="CCAUANULA" f="axisctr016" dejarHueco="false">
                        <td colspan="2">
                            <select id="CCAUANULA" name="CCAUANULA" size="1" class="campo campotexto" style="width:90%" onchange="f_cargar_motivos(this.value);f_mostrar_checkAnulacion(${sessionScope.__pila[0].SPRODUC}, this.value, ${__formdata['SSEGURO']}, <c:if test="${empty __formdata['SSEGURO_BAJA']}">'NULL'</c:if>${__formdata['SSEGURO_BAJA']});" obligatorio="true" title="<axis:alt c="CCAUANULA" f="axisctr016" lit="1000461"/>"
                            <c:if test="${empty __formdata['SSEGURO']}">disabled</c:if>>
                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="LIT_SELEC" f="axisctr016" lit="108341"/> - </option>
                                <c:forEach items="${causaanulpol}" var="item">
                                    <option value="${item['CCAUANULA']}" <c:if test="${__formdata['CCAUANULA']==item['CCAUANULA']}">selected</c:if>>${item['TCAUANULA']}</option>
                                </c:forEach>
                            </select>
                        </td>
                        </axis:ocultar>
                        <td>
                            
                            <axis:ocultar c="FANULAC" f="axisctr016" dejarHueco="false">
                            
                            <input type="text" class="campowidthinput campo campotexto" style="width:40%" id="FANULAC" name="FANULAC" value="<fmt:formatDate value="${__formdata['FANULAC']}" pattern="dd/MM/yyyy" />" 
                            title="<axis:alt c="FANULAC" f="axisctr016" lit="140214" />"
                            <c:if test="${!empty __formdata['CTIPANUL'] && __formdata['CTIPANUL']==4}">
                                onblur="f_recibospendoff()"
                            </c:if>
                            <c:if test="${__formdata['CTIPANUL']!=4}">
                                readonly="true"
                            </c:if>
                            <axis:atr f="axisctr016" c="FANULAC" a="obligatorio=true&formato=fecha"/>
                            />
                            <c:if test="${!empty __formdata['CTIPANUL'] && __formdata['CTIPANUL']==4}">
                                <a style="vertical-align:middle;"><img id="popup_valFANULAC" border="0" src="images/calendar.gif"/></a>
                                <script type="text/javascript">
                                Calendar.setup({
                                inputField     :    "FANULAC",    
                                ifFormat       :    "%d/%m/%Y",     
                                button         :    "popup_valFANULAC",  
                                singleClick    :    false,
                                firstDay       :    1
                                });
                                </script>
                            </c:if>
                            </axis:ocultar>
                            
                            <axis:ocultar c="FANULAC_COR" f="axisctr016" dejarHueco="false">
                            
                            <input type="text" class="campowidthinput campo campotexto" style="width:40%" id="FANULAC_COR" name="FANULAC_COR" value="<fmt:formatDate value="${__formdata['FANULAC_COR']}" pattern="dd/MM/yyyy" />" 
                            title="<axis:alt c="FANULAC_COR" f="axisctr016" lit="109061" />" <axis:atr f="axisctr016" c="FANULAC_COR" a="obligatorio=true&formato=fecha"/>/>
                                <a style="vertical-align:middle;">
                                <img id="popup_valFANULAC_COR" border="0" src="images/calendar.gif"/></a>
                                <script type="text/javascript">
                                Calendar.setup({
                                inputField     :    "FANULAC_COR",    
                                ifFormat       :    "%d/%m/%Y",     
                                button         :    "popup_valFANULAC_COR",  
                                singleClick    :    true,
                                firstDay       :    1
                                });
                                </script>
                           
                           <c:if test="${!empty __configform.axisctr016__CTIPANUL__visible && __configform.axisctr016__CTIPANUL__visible == false}">
                           <axis:ocultar c="CTIPANUL" f="axisctr016" dejarHueco="false">
                            <select id="CTIPANUL" name="CTIPANUL" size="1" class="campo campotexto" style="width:90%" onchange="if (this.selectedIndex>0) f_onchange_CTIPANUL()" 
                            obligatorio="true" title="<axis:alt c="CTIPANUL" f="axisctr016" lit="152363"/>" <c:if test="${empty __formdata['SSEGURO']}">disabled</c:if>>
                                <c:forEach items="${tipanupol}" var="item">
                                    <option value="${item['CATRIBU']}" <c:if test="${__formdata['CTIPANUL']==item['CATRIBU']}">selected</c:if>>${item['TATRIBU']}</option>
                                </c:forEach>
                            </select>
                        </axis:ocultar>
                           </c:if>
                            
                            </axis:ocultar>
                        </td>
                        <!--
                        <td>
                            <input type="checkbox" class="campowidthinput campo campotexto" name="RECEXTRN" <c:if test="${__formdata['RECEXTRN']==1}">checked</c:if> value="1"/>
                        </td>
                        -->                 
                        <axis:ocultar c="APLICA_PENALI" f="axisctr016" dejarHueco="false">
                            <td class="titulocaja" align="left" id="APLICA_PENALI">                                                                               
                            <!--b id="label_APLICA_PENALI"><axis:alt f="axisctr016" c="APLICA_PENALI" lit="9903952"/></b-->   
                            
                              <input type="checkbox" id="C_APLICA_PENALI" name="APLICA_PENALI" <axis:atr f="axisper016" c="APLICA_PENALI" a="modificable=true&isInputText=false"/> 
                                      <c:if test="${empty __formdata.APLICA_PENALI}">value="0"</c:if> <c:if test="${!empty __formdata.APLICA_PENALI}">value="${__formdata.APLICA_PENALI}"</c:if>  <c:if test="${__formdata.APLICA_PENALI == 1 || empty __formdata.APLICA_PENALI}">checked</c:if> onclick="this.checked ? this.value = 1 : this.value = 0"/>
                            </td> 
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <td colspan="5" class="titulocaja"><b><axis:alt c="MOTANULA" f="axisctr016" lit="103218" /></b></td>                        
                    </tr>                    
                    <tr>
                        
                        <axis:visible c="MOTANULA1" f="axisctr016">
                        <td colspan="5"><textarea name="MOTANULA" id="MOTANULA" rows="2" cols="50"  <axis:atr f="axisctr016" c="MOTANULA1" a="obligatorio=false"/> class="campo campotexto" title="<axis:alt c="MOTANULA" f="axisctr016" lit="103218" />">${__formdata['MOTANULA']}</textarea></td>
                        </axis:visible>
                        
                        <axis:visible c="MOTANULA2" f="axisctr016" >
                        <td colspan="2">
                          <select title="<axis:alt c="MOTANULA" f="axisctr016" lit="103218"/>" name = "MOTANULA" style="width:95%;" id ="MOTANULA" size="1" 
                                class="campowidthselect campo campotexto">
                                <option value = null> - <axis:alt c="TITULO_MOTANULA" f="axisctr016" lit="108341"/> - </option>
                                <c:forEach var="motivos" items="${sessionScope.axisctr016_comboMotivos}">
                                    <option value = "${motivos.TMOTANULA}"
                                        <c:if test="${motivos.CMOTANULA == __formdata.CMOTANULA}">selected</c:if>>
                                        ${motivos.TMOTANULA}                            
                                    </option>
                                </c:forEach>
                          </select>
                        </td>
                        </axis:visible>
                        
                    </tr>
                    
                    <tr>
                        <axis:ocultar c="TOBSERV" f="axisctr016" dejarHueco="false">
                        <td colspan="5" class="titulocaja"><b><axis:alt c="TOBSERV" f="axisctr016" lit="101162" /></b></td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="TOBSERV" f="axisctr016" dejarHueco="false">
                        <td colspan="5"><textarea name="TOBSERV" rows="2" cols="50" class="campo campotexto">${__formdata['TOBSERV']}</textarea></td>
                         </axis:ocultar>
                    </tr>
                </table>
                </div>
            </axis:ocultar>
            <axis:ocultar c="DSP_RECIBOS" f="axisctr016" dejarHueco="false">
                <c:if test="${!empty __formdata['CTIPANUL'] && __formdata['CTIPANUL']==4}">
                    <table>
                       <tr>
                           <c:if test="${!empty recibos_pend}"> 
                               <td class="titulocaja" style="width:15%">
                                    <b><axis:alt c="ANURECPEND" f="axisctr016" lit="9001631" /></b>                                
                               </td>
                               
                               <td class="titulocaja" align="left">
                                    <axis:visible c="ANURECPEND_1" f="axisctr016">
                                        <b><axis:alt c="ANURECPEND_1" f="axisctr016" lit="101778" /></b>
                                        <input value="1" type="radio" id="ANURECPEND" <axis:atr f="axisctr016" c="ANURECPEND_1" a="modificable=false&obligatorio=false&isInputText=false"/> name="ANURECPEND" <c:if test="${__formdata.ANURECPEND == '1' || empty __formdata.ANURECPEND}">checked</c:if> onclick="f_recibospendon()"/>
                                    </axis:visible>                                        
                                    <axis:visible c="ANURECPEND_0" f="axisctr016">
                                        <b><axis:alt c="ANURECPEND_0" f="axisctr016" lit="101779" /></b>
                                        <input value="0" type="radio" id="ANURECPEND" <axis:atr f="axisctr016" c="ANURECPEND_0" a="modificable=false&obligatorio=false&isInputText=false"/> name="ANURECPEND" <c:if test="${__formdata.ANURECPEND == '0'}">checked</c:if> onclick="f_recibospendoff()"/>
                                    </axis:visible>                                        
                               </td>
                           </c:if>
                       </tr>
                      </table>

                                <div id="recibos_pend_tab">
                                <c:if test="${!empty recibos_pend}"> 
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"><axis:alt f="axisctr016" c="DSP_RECIBOS_PEND" lit="9001635"></axis:alt></div>
                                <!-- DisplayTag recibos pendientes -->
                            
                                <c:set var="title1"><axis:alt c="NRECIBO" f="axisctr016" lit="100895" /></c:set>
                                <c:set var="title2"><axis:alt c="FEFECTO" f="axisctr016" lit="100883" /></c:set>
                                <c:set var="title3"><axis:alt c="FVENCIM" f="axisctr016" lit="100885" /></c:set>
                                <c:set var="title4"><axis:alt c="ITOTALR" f="axisctr016" lit="100563" /></c:set>
                                <c:set var="title5"><axis:alt c="TTIPREC" f="axisctr016" lit="102302"/></c:set>
                                <c:set var="title6"><axis:alt c="TAGENTE" f="axisctr016" lit="100584" /></c:set>
                                <div class="displayspace">
                                    <display:table name="${recibos_pend}" id="recibos_pend" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr016.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                        <axis:visible c="ANURECPEND_MARCADO" f="axisctr016">
                                        <display:column title="" sortProperty="MARCADO" headerClass="sortable" media="html" style="width:5%"  autolink="false" >
                                            
                                            <div class="dspIcons">
                                                    <input type="checkbox" id="checkboxNRECIBO_${recibos_pend['NRECIBO']}" name="checkboxNRECIBO"
                                                    value="${recibos_pend['NRECIBO']}"
                                                    <axis:atr f="axisctr016" c="checkboxNRECIBO" a="modificable=false&obligatorio=false&isInputText=false"/>
                                                    onclick=""
                                                    <c:if test="${__formdata.ANURECPEND == '0'}">
                                                        disabled="disabled" 
                                                    </c:if>
                                                    <c:if test="${__formdata.ANURECPEND == '1' || empty (__formdata.ANURECPEND)}">
                                                        <c:if test="${recibos_pend['MARCADO'] == '1'}"> checked="checked"</c:if>
                                                        <c:if test="${recibos_pend['MARCADO'] == '0'}"> checked="false"</c:if>
                                                    </c:if> 
                                                    />
                                            </div>
                                            <!--<div class="dspNumber"><fmt:formatNumber value="${miListaId['NRECIBO']}" pattern="000000000" /></div> -->
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title1}" sortProperty="NRECIBO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${recibos_pend['NRECIBO']}" pattern="000000000" /></div>
                                        </display:column>
                                        <display:column title="${title2}" sortProperty="FEFECTO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspText"><fmt:formatDate value="${recibos_pend['FEFECTO']}" pattern="dd/MM/yy" /></div>
                                        </display:column>
                                        <display:column title="${title3}" sortProperty="FVENCIM" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspText"><fmt:formatDate value="${recibos_pend['FVENCIM']}" pattern="dd/MM/yy" /></div>
                                        </display:column>
                                        <display:column title="${title4}" sortProperty="ITOTALR" sortable="true" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${recibos_pend['ITOTALR']}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" /></div>
                                        </display:column>
                                        <display:column title="${title5}" sortProperty="TTIPREC " sortable="true" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                             <div class="dspText">${recibos_pend.TTIPREC}</div>
                                        </display:column>
                                        <display:column title="${title6}" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:40%" autolink="false" >
                                             <div class="dspText">${recibos_pend.TAGENTE}</div>
                                        </display:column>
                                    </display:table>
                                    </div>
                          
                                </c:if>
                                </div>
                                
                     <table>
                       <tr>
                           <c:if test="${!empty recibos_cob}"> 
                           <td class="titulocaja" style="width:15%">
                                <b><axis:alt c="ANURECCOB" f="axisctr016" lit="9905666" /></b>
                           </td>
                               <td class="titulocaja" style="width:10%">
                                <axis:visible c="ANURECCOB_1" f="axisctr016">
                                    <b><axis:alt c="ANURECCOB_1" f="axisctr016" lit="101778" /></b>
                                    <input value="1" type="radio" id="ANURECCOB" <axis:atr f="axisctr016" c="ANURECCOB_1" a="modificable=false&obligatorio=false&isInputText=false"/> name="ANURECCOB" <c:if test="${__formdata.ANURECCOB == '1' || __configform.axisctr016__ANURECCOB__valordefecto == 1}">checked</c:if> onclick="f_reciboscobon()"/>
                                </axis:visible>                              
                                <axis:visible c="ANURECCOB_0" f="axisctr016">
                                    <b><axis:alt c="ANURECCOB_0" f="axisctr016" lit="101779" /></b>
                                    <input value="0" type="radio" id="ANURECCOB" <axis:atr f="axisctr016" c="ANURECCOB_0" a="modificable=false&obligatorio=false&isInputText=false"/> name="ANURECCOB" <c:if test="${__formdata.ANURECCOB == '0' || __configform.axisctr016__ANURECCOB__valordefecto == 0}">checked</c:if> onclick="f_reciboscoboff()"/>
                                </axis:visible>        
                           </td>
                               <c:choose>
                               <c:when test="${datospoliza.CTIPCOA==8}"> 
                                   <td class="titulocaja" id="tdimpextorsion">                                    
                                        <b><axis:alt c="IMPEXTORSION" f="axisctr016" lit="9901107" /><b>
                                        <input type="text" formato="decimal" name="IMPEXTORSION" id="IMPEXTORSION" class="campowidthinput campo campotexto" style="width:10%" title="<axis:alt  c="CIMPEXTORSION" f="axisadm016" lit="9901107"/>" <c:if test="${ __configform.axisctr016__ANURECCOB__valordefecto == 0}">disabled</c:if>/>
                                   </td>
                               </c:when>
                               <c:otherwise>
                                    <td class="titulocaja"></td>
                               </c:otherwise>
                               </c:choose>
                           </c:if>
                       </tr>
                      </table>  
                      
                                <div id="recibos_cob_tab">
                                <c:if test="${!empty recibos_cob}"> 
                                <div class="separador">&nbsp;</div>
                                <div class="titulo"><axis:alt f="axisctr016" c="DSP_RECIBOS_COB" lit="9905667"></axis:alt></div>
                                <!-- DisplayTag recibos cobrados -->
                            
                                <c:set var="title1"><axis:alt c="NRECIBO" f="axisctr016" lit="100895" /></c:set>
                                <c:set var="title2"><axis:alt c="FEFECTO" f="axisctr016" lit="100883" /></c:set>
                                <c:set var="title3"><axis:alt c="FVENCIM" f="axisctr016" lit="100885" /></c:set>
                                <c:set var="title4"><axis:alt c="ITOTALR" f="axisctr016" lit="100563" /></c:set>
                                <c:set var="title5"><axis:alt c="TTIPREC" f="axisctr016" lit="102302"/></c:set>
                                <c:set var="title6"><axis:alt c="TAGENTE" f="axisctr016" lit="100584" /></c:set>
                                <div class="displayspace">
                                     <display:table name="${recibos_cob}" id="recibos_cob" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr016.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                        <display:column title="${title1}" sortProperty="NRECIBO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${recibos_cob['NRECIBO']}" pattern="000000000" /></div>
                                        </display:column>
                                        <display:column title="${title2}" sortProperty="FEFECTO" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspText"><fmt:formatDate value="${recibos_cob['FEFECTO']}" pattern="dd/MM/yy" /></div>
                                        </display:column>
                                        <display:column title="${title3}" sortProperty="FVENCIM" headerClass="sortable" media="html" style="width:10%" autolink="false" >
                                            <div class="dspText"><fmt:formatDate value="${recibos_cob['FVENCIM']}" pattern="dd/MM/yy" /></div>
                                        </display:column>
                                        <display:column title="${title4}" sortProperty="ITOTALR" sortable="true" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${recibos_cob['ITOTALR']}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" /></div>
                                        </display:column>
                                        <display:column title="${title5}" sortProperty="TTIPREC " sortable="true" headerClass="sortable" style="width:15%" media="html" autolink="false" >
                                             <div class="dspText">${recibos_cob.TTIPREC}</div>
                                        </display:column>
                                        <display:column title="${title6}" sortProperty="TAGENTE" headerClass="sortable" media="html" style="width:40%" autolink="false" >
                                             <div class="dspText">${recibos_cob.TAGENTE}</div>
                                        </display:column>
                                    </display:table>
                         
                                </div>
                                </c:if>
                            </div>
                    </c:if>
                    </axis:ocultar>
              </td>
            </tr>
        </table>
    
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr016</c:param>        
            <c:param name="__botones">salir<axis:visible c="BUT_CONSULTA" f="axisctr016">,151477</axis:visible><axis:visible c="BT_ANULAR" f="axisctr016">,100648</axis:visible><axis:visible c="BT_DESANULAR" f="axisctr016">,9002062</axis:visible><axis:visible c="BT_SOLBAJA" f="axisctr016">,9901672</axis:visible>
            </c:param>
            
            
            
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>