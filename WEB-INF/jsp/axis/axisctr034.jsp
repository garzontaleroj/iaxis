<%/* Revision:# /b7ZVRAhf+OYizrL8W+74Q== # */%>
<%/*
*  Fichero: axisctr034.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
*
*  Fecha: 14/10/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
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
    <title><axis:alt f="axisctr034" c="GESTIONPROPUESTA" lit="101877"/></title> <%-- GESTIÓN PROPUESTAS RETENIDAS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
   
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            // MENSAJES: ${requestScope.__mensajes}
           
            var hayMensajes    = ${!empty requestScope.__mensajes.m__clave};
            
            //Ocultem els grids per millorear l'efecte visual
             
            var COBJASE = "${__formdata.COBJASE}";            
            document.getElementById("COBJASE").value= COBJASE;
               
            f_ocultar_botones();
            
            <axis:visible f="axisctr034" c="DSP_PSU">
               var gridPSU = document.getElementById("gridPSU");               
               if (${empty sessionScope.PRETEN_T_IAX_POLIZASRETEN} && !hayMensajes){
                    gridPSU.style.display = "none";                    
                }else{                                  
                    gridPSU.style.display = "block";                   
                }
            </axis:visible>           
            
            <axis:visible f="axisctr034" c="DSP_RET">
            var gridMRET = document.getElementById("gridMRET");                        
            gridMRET.style.display = "none";          
            </axis:visible>
            if ((${empty sessionScope.PRETEN_T_IAX_POLIZASRETEN} && 
            !hayMensajes)  )
                f_abrir_modal("axisctr033");    
            else {
                /* Marcar primero si no hay ninguno seleccionado */
                if (objUtiles.estaVacio(objDom.getValorPorId("SSEGURO"))) {
                    var radioSSEGURO = document.getElementsByName("radioSSEGURO")[0];
                   if (!objUtiles.estaVacio(radioSSEGURO)) {
                    radioSSEGURO.checked = true;
                    radioSSEGURO.onclick();
                  }
                }
            <axis:visible f="axisctr034" c="DSP_RET">    
                var dtPolizasOffset = "${requestScope.dtPolizasOffset}";
    
                if (!objUtiles.estaVacio(dtPolizasOffset)) 
                    document.getElementById("dt_polizas").scrollTop = parseInt(dtPolizasOffset);
                                
                setInterval("f_actualizar_dtOffset()", 10);
                </axis:visible>
            }
            
            var OK_POL="";
            <c:if test="${OK_POL=='OK'}">
             var OK_POL="OK";
             </c:if>
            
           // alert("ok pol"+OK_POL);
            
            if(OK_POL=="OK"){
            
                //var SSEGURO = objDom.getValorPorId("SSEGURO");
		//alert('sseguro'+SSEGURO);
		
                //Bug 38217-220860 - 18/04/2016 
                var SSEGURO = "${SSEGURO_IMP}";
                
                var mensaje = "${requestScope.MENSAJES}";
               //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc_tipo&TIPO=RECHAZOPROP&SEGURO=" + SSEGURO+"&MENSAJE="+mensaje);
                
               
                if(version_tomcat <= 6){ 
                   	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&SEGURO=" + SSEGURO+"&MENSAJE="+mensaje);
                   }else{
                   		objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&SEGURO=" + SSEGURO+"&MENSAJE="+encodeURI(mensaje));
                   	}
                
                
                
                //Fin Bug 38217-220860 - 18/04/2016 
            }
            
            //Mostramos/Escondemos el boton de editar segun valor CSITUAC
            try {
                f_but_editar_visibility(CSITUAC_marcado);
                // bug 0024832
                f_but_rechazartodo_visibility(CSITUAC_marcado);
            }
            catch(Exception) {
            }
            f_cargar_propiedades_pantalla();
        }
       function f_abrir_axispsu003(SSEGURO,NMOVIMI,NRIESGO,CCONTROL,NOCURRE,CGARANT) {          
        
        var param = '&SSEGURO='+SSEGURO+'&NMOVIMI='+NMOVIMI+'&NRIESGO='+NRIESGO+'&CCONTROL='+CCONTROL+'&NOCURRE='+NOCURRE+'&CGARANT='+CGARANT+'&PTABLAS=POL';
        
            objUtiles.abrirModal("axispsu003", "src", "modal_axispsu003.do?operation=form"+param);
        } 
        
        function f_cerrar_axispsu003() {
            objUtiles.cerrarModal("axispsu003");
        }    
        
        function f_but_salir() {
            if($("#PMODO").val()=="AUTORIZA_MASIVO")
            {
                objUtiles.ejecutarFormulario("axis_axisctr209.do",
                    "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            else
                objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackAjaxSalir, "operation=salir",  this);
        }
        
        function f_but_buscar() {
            f_abrir_modal("axisctr033");
        }
        
        function f_but_1000183() {
            if (f_tengo_permisos()){
            if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_SOBREPRIMA&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                }
            }
            }
        }

        function f_but_9908805() {
            if (f_tengo_permisos()){
                if (objUtiles.estaVacio(document.miForm.SSEGURO))
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");
                    if (typeof hayChecked == 'boolean') 
                        alert(objJsMessages.jslit_selecciona_registro);
                    else {     
                        objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_CONTRAGARAN&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                        "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                    }
                }
              }
         }
        
       function f_but_100009() {
       if (f_tengo_permisos()){
          if (objUtiles.estaVacio(document.miForm.NPOLIZA))
                alert(objJsMessages.jslit_selecciona_registro);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                   objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackValDocRequerida, 
                        "operation=ajax_valdocrequerida&SSEGURO="+document.getElementById('SSEGURO').value+"&NMOVIMI="+document.getElementById('NMOVIMI').value,
                        this, objJsMessages.jslit_cargando);
                }
            }
    			document.getElementById("ECRT035").value = "AUTORIZA";
            }
            
       }
       
       function f_but_9001037() {
            if (f_tengo_permisos()){
            if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_DATOS_AUTO&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                }
            }
            }
        }
        
        function f_but_9001186() {
            if (f_tengo_permisos()){
            if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_CONDUCTOR_AUTO&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                }
            }
            }
        }
       
       
       function callbackValDocRequerida(ajaxResponseText){
                var confirma = false;
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                    var VRETURN = "";
                    try{ 
                        VRETURN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    } catch (e) {
                        VRETURN = 0;
                    }
                    if (VRETURN == 0){
                        confirma  = true;
                    }else{
                        objAppMensajes.pintarMensajePantalla("<axis:alt f='axisctr034' c='ERRORRE' lit='9902267'/>", "error"); 
                    }
                if (confirma) {
                 <axis:visible f="axisctr034" c="DSP_PSU">
                 
                 objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackHayControles, 
                        "operation=ajax_haycontrolesmanuales&SSEGURO="+document.getElementById('SSEGURO').value,
                        this, objJsMessages.jslit_cargando);
                        
                 </axis:visible>
                <axis:visible f="axisctr034" c="DSP_RET">
                    f_abrir_modallittlemodal('axisctr035');
                </axis:visible>
                }
                // recarrega scroll pane
                $.reinitialiseScroll(); 
            }
            
             function callbackHayControles(ajaxResponseText){
                var confirma = false;
             //   alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) 
                    f_abrir_modallittlemodal('axisctr035');
                // recarrega scroll pane
                $.reinitialiseScroll(); 
            }
            
            function callbackHayControles2(ajaxResponseText){
                var confirma = false;
             //   alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                  if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) 
                   f_abrir_modallittlemodal('axisctr036');
                // recarrega scroll pane
                $.reinitialiseScroll(); 
            }
            
             
            
       
        
       function f_but_9000546() {
       if (f_tengo_permisos())
          f_abrir_modallittlemodal('axisctr037')
       }
       
       function f_but_9902670(){
        if(f_tengo_permisos())
            f_abrir_modallittlemodal('axisctr037')
       }
       
        function f_but_9000545() {
        if (f_tengo_permisos())
        
         <axis:visible f="axisctr034" c="DSP_PSU">
                 
                 objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackHayControles2, 
                        "operation=ajax_haycontrolesmanuales&SSEGURO="+document.getElementById('SSEGURO').value,
                        this, objJsMessages.jslit_cargando);
                        
                 </axis:visible>
                <axis:visible f="axisctr034" c="DSP_RET">
                    f_abrir_modallittlemodal('axisctr036');
                </axis:visible>
        
          
       }       
       
       function f_but_9902513() { // cuadro
       if (f_tengo_permisos()){
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO))) {
                    alert(objJsMessages.jslit_selecciona_una_poliza);
                    
                }else{
                    //alert(objDom.getValorComponente(document.miForm.NUM_FILA));                         
                    objUtiles.ejecutarFormulario("axis_axisctr034.do", "cuadro", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
                }
            }
              
        function f_but_1000439() {
        
        	if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "consultar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
        }
        
        function f_but_101791() {
        if (f_tengo_permisos()){
            if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_CLAUSULAS&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                }
            }
            }
        }
        
        function f_but_editar() { // Editar
					if (f_tengo_permisos()){
            //Recuperar del valor del SPRODUC a la hora de emitir
            if (objUtiles.estaVacio(document.miForm.SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_EDITAR&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
                    "editar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                }
            }
         }
        }

        function f_but_editar_visibility(CSITUAC) {
            <axis:visible f="axisctr034" c="BT_EDITAR">
		            if (CSITUAC=='4') objDom.setVisibilidadPorId("but_editar", "visible");
		            else objDom.setVisibilidadPorId("but_editar", "hidden"); 
            </axis:visible>
        }
        
        // bug 0024832
        function f_but_rechazartodo_visibility(CSITUAC) {
            // alert("f_but_rechazartodo_visibility CSITUAC="+CSITUAC);
            <axis:visible f="axisctr034" c="DSP_PSU">
		            if (CSITUAC=='17') {
                                objDom.setVisibilidadPorId("but_9000545", "hidden"); 
                            } else {
                                objDom.setVisibilidadPorId("but_9000545", "visible"); 
                            }
            </axis:visible>
        }

        function f_selecccionar_poliza(NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC_CSITUAC_CRETENI) {
            // var NPOLIZA = objUtiles.utilSplit(NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC, "/")[0];
            document.getElementById("radioSSEGURO_" + NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC_CSITUAC_CRETENI).checked = true;
            
            f_actualizar_motivos(NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC_CSITUAC_CRETENI);
        }
        
        function f_actualizar_motivos(NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC_CSITUAC_CRETENI) {
            var splitted = objUtiles.utilSplit(NPOLIZA_SSEGURO_NMOVIMI_NSUPLEM_SPRODUC_CSITUAC_CRETENI, "/");
            var NPOLIZA = splitted[0];
            var SSEGURO = splitted[1];
            var NMOVIMI = splitted[2];
            var NSUPLEM = splitted[3];
            var SPRODUC = splitted[4];
            var CSITUAC = splitted[5];
            var CRETENI = splitted[6];
            
            objDom.setValorPorId("NPOLIZA", NPOLIZA);
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objDom.setValorPorId("NMOVIMI", NMOVIMI);
            objDom.setValorPorId("NSUPLEM", NSUPLEM);
            objDom.setValorPorId("SPRODUC", SPRODUC);
            objDom.setValorPorId("CSITUAC", CSITUAC);
            objDom.setValorPorId("CRETENI", CRETENI);
            objAjax.invokeAsyncCGI("axis_axisctr034.do", 
                callbackAjaxCargarMotivos, "operation=cargarMotivos&NPOLIZA=" + NPOLIZA + "&SSEGURO=" + SSEGURO  
                + "&NMOVIMI=" + NMOVIMI + "&NSUPLEM=" + NSUPLEM + "&SPRODUC=" + SPRODUC,  this,objJsMessages.jslit_cargando);
            
            
            
          
            
            

            //Mostramos/Escondemos el boton de editar segun valor CSITUAC
            f_but_editar_visibility(CSITUAC);
            // bug 0024832
            f_but_rechazartodo_visibility(CSITUAC);

        }
        
        var currentOffset;
        
        function f_actualizar_dtOffset() {            
            /* Función para mantener entre submits el scroll de la primera tabla (dt_polizas) */
            /* No further documentation */
            var newOffset = document.getElementById("dt_polizas").scrollTop;                                    
            
            var linksDt = new Array(2);
            linksDt[0] = objLista.obtenerFilasHeadLista("T_IAX_POLIZASRETEN");
            linksDt[1] = objLista.obtenerFilasHeadLista("T_IAX_POLMVTRETEN");    
            
            for (var i = 0; i < linksDt.length; i++) {
                for (var j = 0; j < linksDt[i].length; j++) {
                    
                    if (!objUtiles.estaVacio(linksDt[i][j].className) && linksDt[i][j].className.indexOf("gridsortable") != -1 ) {
                        var ahead = linksDt[i][j].getElementsByTagName("a");
                        if (!objUtiles.estaVacio(ahead[0])) {                        
                            
                            var currentHref = ahead[0].href;                        
                            var indice = ahead[0].href.indexOf ("dtPolizasOffset");
                            
                            if (indice > -1)  
                                // Ya existía un offset en la QueryString
                                ahead[0].href = objUtiles.replaceAll(currentHref, "&dtPolizasOffset=" + currentOffset, "&dtPolizasOffset=" + newOffset);                                    
                            else  
                                // No existía offset                      
                                ahead[0].href = currentHref + "&dtPolizasOffset=" + newOffset;
                        }
                    }
                }
            }            
            currentOffset = newOffset;
        }
        
        
        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/
        function omplirGridPSU(ajaxResponseText){        
 
        <axis:visible f="axisctr034" c="DSP_PSU">
          var doc = objAjax.domParse(ajaxResponseText);              

          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
            //Preparem texte TESTPOL
              
            var capa = document.getElementById("label_TESTPOL");

            var P_TESTPOL = "";
            var P_CESTPOL = "";
            var PCNIVELBPM = "";
            var PTNIVELBPM = "";
            var permiteModificar = "";

            try {
                P_TESTPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTESTPOL")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTESTPOL"), 0, 0) : "");
            } catch (e) {
            }
            
            try {
                P_CESTPOL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCESTPOL")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCESTPOL"), 0, 0) : ""); 
            } catch (e) {
            }
            
            try {
                PCNIVELBPM = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PCNIVELBPM")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PCNIVELBPM"), 0, 0) : "");
            } catch (e) {
            }
            
            try {
                PTNIVELBPM = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNIVELBPM")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNIVELBPM"), 0, 0) : "");
            } catch (e) {
            }
            
            try {
                permiteModificar = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("permiteModificar")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("permiteModificar"), 0, 0) : "");
            } catch (e) {
            }
            
            objDom.setValorPorId ("CESTPOL_PSU", P_CESTPOL);
            objDom.setValorPorId ("TESTPOL_PSU", P_TESTPOL);
            
            objDom.setValorPorId ("TNIVELBPM_PSU", PTNIVELBPM);
            objDom.setValorPorId ("CNIVELBPM_PSU", PCNIVELBPM);
            objDom.setValorPorId ("permiteModificar", permiteModificar);

           
            var texto = '  '+P_TESTPOL+  ' ' + PTNIVELBPM;
            
              capa.innerHTML = texto;
          
          
            var tableM = document.getElementById("T_IAX_PSU");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");            
            objLista.borrarFilasDeLista ("T_IAX_PSU", "7", "<axis:alt f='axisctr034' c='BORRAR' lit='1000254' />");
            for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU") ; i++) {
                // Como hay resultados, borramos la fila vacia
                if (i==0) 
                    objLista.borrarFilaVacia(tbodyM, trM);
                // Obtenemos el estilo para la fila que insertaremos
                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = objLista.crearNuevaFila(rowstyle);
                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                var newtd = new Array(7);
                //TCONTROL,FMOVIMI,TAUTREC,FAUTREC,TUSUNOM(NO HI ES),TRIESGO,TNIVELR
                //CCONTROL está repetit
                //TUSUNOM(NO HI ES)
                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                var SSEGURO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "");
                var NRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRIESGO"), i, 0) : "");
                var NMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
                var TCONTROL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCONTROL"), i, 0) : "");
                var CCONTROL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCONTROL"), i, 0) : "");
                var NOCURRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOCURRE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOCURRE"), i, 0) : "");
                
                var TAUTREC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAUTREC"), i, 0) : "");
                var TNIVELR= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNIVELR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNIVELR"), i, 0) : "");                  
                var FMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVIMI"), i, 0) : "");
                if (FMOVIMI != "") 
                    FMOVIMI = objUtiles.formateaTimeStamp(FMOVIMI);                    
                var FAUTREC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FAUTREC"), i, 0) : "");
                if (FAUTREC != "") 
                    FAUTREC = objUtiles.formateaTimeStamp(FAUTREC);               
                var TRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "");               
                //TODO: De momento no llega en la lista de valores desde PL
                var TUSUNOM = "";                
                var CCRITICO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCRITICO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCRITICO"), i, 0) : "");
                 var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0) : "");                
                var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");                
               
               
                //Cargamos los valores del registro de la tabla
                newtd[0] = objLista.addTextoEnLista(TCONTROL);
                newtd[1] = objLista.addTextoEnLista(FMOVIMI);
                newtd[2] = objLista.addTextoEnLista(TAUTREC);
              /*  newtd[3] = objLista.addTextoEnLista(FAUTREC);
                newtd[4] = objLista.addTextoEnLista(TUSUNOM);
                */
                
                //newtd[3] = objLista.addTextoEnLista(TRIESGO);
                 if (TGARANT!="")
                    newtd[3] = objLista.addTextoEnLista(TRIESGO+" - "+TGARANT);
                else
                    newtd[3] = objLista.addTextoEnLista(TRIESGO);
                    
                newtd[4] = objLista.addTextoEnLista(TNIVELR);
                <axis:visible f="axisctr034" c="CCRITICO">
                newtd[5] =objLista.addCheckBoxEnLista("CCRITICO_"+i, CCRITICO, "");
                </axis:visible>
                <axis:visible f="axisctr034" c="MASDETALL" >
                newtd[6] = objLista.addImagenEnLista("javascript:f_abrir_axispsu003("+ SSEGURO + "," + NMOVIMI + "," + NRIESGO +"," + CCONTROL +"," + NOCURRE +"," + CGARANT +");",                                               
                            "0", "", "", "images/mas.gif");  
                </axis:visible>
                
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                <axis:visible f="axisctr034" c="CCRITICO">
                if (document.getElementById("CCRITICO_"+i).value==1){                    
                  document.getElementById("CCRITICO_"+i).checked="true";
                  document.getElementById("CCRITICO_"+i).style.backgroundColor ="#FF0000";                  
                }
                document.getElementById("CCRITICO_"+i).disabled="true";
                </axis:visible>
        
            } // Fi for
            }
    </axis:visible>    
        
        }
        
        
    function omplirGridInspeccionRiesgo(ajaxResponseText){        
 //alert(ajaxResponseText);
        <axis:visible f="axisctr034" c="DSP_INSPECCION_RIESGO">
          var doc = objAjax.domParse(ajaxResponseText);              

          if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
          
            //seleccionar opcion combos
            if (objDom.numeroDeTags(doc, "CINSPREQ")>0){
               var CINSPREQ= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CINSPREQ")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CINSPREQ"), 0, 0) : "");                  
               
               var combo = document.getElementById("CINSPREQ");
               seleccionarOpcionCombo(CINSPREQ, combo);
            }
            if (objDom.numeroDeTags(doc, "CRESULTR")>0){
               var CRESULTR= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CRESULTR")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRESULTR"), 0, 0) : "");                  
               combo = document.getElementById("CRESULTR");
               seleccionarOpcionCombo(CRESULTR, combo);        
            }
            
            var tableM = document.getElementById("INSPECCION_RIESGO");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");
            objLista.borrarFilasDeLista ("INSPECCION_RIESGO", "9", "<axis:alt f='axisctr034' c='BORRAR' lit='1000254' />");
            for (var i = 0; i < objDom.numeroDeTags(doc, "INSPECCION_RIESGO") ; i++) {
                // Como hay resultados, borramos la fila vacia
                if (i==0) 
                    objLista.borrarFilaVacia(tbodyM, trM);
                // Obtenemos el estilo para la fila que insertaremos
                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                // Creamos una nueva fila vacia y le damos el estilo obtenido
                var newtr = objLista.crearNuevaFila(rowstyle);
                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                       
                var newtd = new Array(9);          
                //SORDEN,NINSPECCION,FSOLICITUD,CESTADORDEN,CCLASE,FVTORDEN,FALTA,CESTADOINSPEC
                
                // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                var SORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SORDEN"), i, 0) : "");                    
                var NINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINSPECCION"), i, 0) : "");
                var FSOLICITUD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FSOLICITUD")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FSOLICITUD"), i, 0) : "");
                if (FSOLICITUD != "") FSOLICITUD = objUtiles.formateaTimeStamp2(FSOLICITUD);
                var TESTADOORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADOORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADOORDEN"), i, 0) : "");
                var TCLASE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCLASE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCLASE"), i, 0) : "");
                var FVTORDEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FVTORDEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FVTORDEN"), i, 0) : "");
                if (FVTORDEN != "") FVTORDEN = objUtiles.formateaTimeStamp2(FVTORDEN);  
                var FINSPECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINSPECCION"), i, 0) : "");
                if (FINSPECCION != "") FINSPECCION = objUtiles.formateaTimeStamp2(FINSPECCION);  
                var TESTADOINSPECCION= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADOINSPECCION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADOINSPECCION"), i, 0) : "");                  
                      
                document.getElementById("CMATRIC").value = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CMATRIC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMATRIC"), i, 0) : "");                  
                document.getElementById("CTIPMAT").value = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPMAT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPMAT"), i, 0) : "");
                   
                //Cargamos los valores del registro de la tabla                
                newtd[0] = objLista.addTextoEnLista(SORDEN);                
                newtd[1] = objLista.addTextoEnLista(NINSPECCION);
                newtd[2] = objLista.addTextoEnLista(FSOLICITUD);
                newtd[3] = objLista.addTextoEnLista(TESTADOORDEN);
                newtd[4] = objLista.addTextoEnLista(TCLASE);
                newtd[5] = objLista.addTextoEnLista(FVTORDEN);
                newtd[6] = objLista.addTextoEnLista(FINSPECCION);
                newtd[7] = objLista.addTextoEnLista(TESTADOINSPECCION);
                       
                if (! objUtiles.estaVacio(NINSPECCION)){
                    newtd[8] = objLista.addImagenEnLista("javascript:f_consultar_inspeccion("+SORDEN+","+NINSPECCION+" )",                                               
                                "0", "", "", "images/mas.gif");
                }else{
                     newtd[8] = objLista.addTextoEnLista("");
                }
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbodyM);
                
            } // Fi for
            }
    </axis:visible>
        }
        
        function seleccionarOpcionCombo(elemento, combo) {      
      
           var cantidad = combo.length;
           for (i = 0; i < cantidad; i++) {
              if (combo[i].value == elemento) {
                 combo[i].selected = true;
              }   
           }      
        }         

        function callbackAjaxSalir (dummy) {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr034", "cancelar", document.miForm, "_self");
        }
        
        function callbackAjaxCargarMotivos (ajaxResponseText) {
            try {
               var doc = objAjax.domParse(ajaxResponseText);
               var tipoGrid = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIPODATOS")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPODATOS"), 0, 0) : "");
               objDom.setValorPorId ("TIPODATOS", tipoGrid);
               var COBJASE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("COBJASE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0) : "");
               document.getElementById("COBJASE").value= COBJASE;
               
               
               objLista.borrarFilasDeLista ("lstPsuRetenidas", "9", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
               objLista.borrarFilasDeLista ("lstPsuControl", "8", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
             
               if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {	
   	            		var tableM = document.getElementById("lstPsuRetenidas");
   	                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
   	                    var trM = tbodyM.getElementsByTagName("tr");
   	                    
   	                    
   	                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU_RETENIDAS") ; i++) {
   	                    	
   	                    	console.log(doc);
   	                    	
   	                    	if(i==0) objLista.borrarFilaVacia(tbodyM, trM);

                               //Obtenemos el estilo para la fila que insertaremos
                               var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                               //Creamos una nueva fila vacia y le damos el estilo obtenido
                               var newtr = objLista.crearNuevaFila(rowstyle);
                               //Creamos un array de columnas a aÃ±adir a la nueva fila del displayTag
                               var newtd = new Array(8);
                         
                               var tmotret1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HFFECAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HFFECAUT"), i, 0) : "");
                               var tmotret2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HNVERSION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HNVERSION"), i, 0) : "");
                               var tmotret3 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HCUSUAUT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HCUSUAUT"), i, 0) : "");
                               var tmotret4 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HTESTPOL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HTESTPOL"), i, 0) : "");
                               var tmotret5 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HTSUBESTADO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HTSUBESTADO"), i, 0) : "");
                               var tmotret6 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HOBSERV")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HOBSERV"), i, 0) : "");
                               
                               var seguro = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HSSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HSSEGURO"), i, 0) : "");
                               var movimiento = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("HNMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("HNMOVIMI"), i, 0) : "");
                              
                               var tmotret7 = (' ');
                               
                              
                               if(i == objDom.numeroDeTags(doc, "OB_IAX_PSU_RETENIDAS") - 1){
                               
                               tmotret5 = tmotret5 +''+'<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu017('+
                       		seguro+','+tmotret2+','+movimiento+')" />';
                       		
                               tmotret7 = ('<img border="0"	src="images/lapiz.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu018('+
                               		seguro+','+tmotret2+','+movimiento+')" />');
                               
                               }
                               
                               var tmotret8 = ('<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu015('+
                               		seguro+','+tmotret2+','+movimiento+')" />');
                               
                               if(tmotret1 != "")
                               	tmotret1 = objUtiles.formateaTimeStamp(tmotret1);
                               
           
                               newtd[0] = objLista.addRadioButtonEnLista("radioNMOVIMI", "radiobutton" , 'javascript:f_cargar_lstPsuControl('+seguro+','+tmotret2+','+movimiento+');');
                               newtd[1] = objLista.addTextoEnLista(tmotret1);
                               newtd[2] = objLista.addTextoEnLista(tmotret2);
                               newtd[3] = objLista.addTextoEnLista(tmotret3);
                               newtd[4] = objLista.addTextoEnLista(tmotret4);
                               //IAXIS-5125
                               <axis:visible f="axisctr034" c="BT_INFO_RETENIDAS" >
                               	newtd[5] = objLista.addTextoEnLista(tmotret5);
                               </axis:visible>
                        	   newtd[6] = objLista.addTextoEnLista(tmotret6);
                               <axis:visible f="axisctr034" c="BT_EDIT_RETENIDAS" >
                               	newtd[7] = objLista.addTextoEnLista(tmotret7);
                               </axis:visible>
                               <axis:visible f="axisctr034" c="BT_INFO_RETENIDAS_2" >
                               	newtd[8] = objLista.addTextoEnLista(tmotret8);
                               </axis:visible>
                               //IAXIS-5125
                               objLista.addNuevaFila(newtd, newtr, tbodyM);

        
   	                    }
   	                
               		
               		 }	
               
               
               
               
               
               
               
               
               f_ocultar_botones();                    
               
             <axis:visible f="axisctr034" c="DSP_INSPECCION_RIESGO">               
               var gridInspeccionRiesgo = document.getElementById("gridInspeccionRiesgo");               
               if ( COBJASE!=5){                    
                    gridInspeccionRiesgo.style.display = "none";
               }else{                    
                   gridInspeccionRiesgo.style.display = "block";
                   var combo = document.getElementById("CINSPREQ");
                   seleccionarOpcionCombo("<%= Integer.MIN_VALUE %>", combo);
                   combo = document.getElementById("CRESULTR");
                   seleccionarOpcionCombo("<%= Integer.MIN_VALUE %>", combo); 
                   omplirGridInspeccionRiesgo(ajaxResponseText);
                }
               </axis:visible>
               if(tipoGrid=="PSU"){    
                   <axis:visible f="axisctr034" c="DSP_PSU">                       
                       omplirGridPSU(ajaxResponseText);
                   </axis:visible>                   
               }else{        
               <axis:visible f="axisctr034" c="DSP_RET">
                   <axis:visible f="axisctr034" c="DSP_PSU">
                   //Amagem el grid PSU
                    var gridPSU = document.getElementById("gridPSU");                        
                    gridPSU.style.display = "none";
                    </axis:visible>
                    //Mostrem el grid Mot. ret.
                    var gridMRET = document.getElementById("gridMRET");                        
                    gridMRET.style.display = "block";
                    if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                    var tableM = document.getElementById("T_IAX_POLMVTRETEN");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    objLista.borrarFilasDeLista ("T_IAX_POLMVTRETEN", "4", "<axis:alt f='axisctr034' c='POLMVTRETEN' lit='1000254' />");
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "TMOTRET") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(5);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var SSEGURO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "");
                        var NRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRIESGO"), i, 0) : "");
                        var NMOVIMI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
                        var CMOTRET = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CMOTRET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMOTRET"), i, 0) : "");
                        var CESTGEST= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTGEST")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTGEST"), i, 0) : "");                        
                        var TMOTRET = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMOTRET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMOTRET"), i, 0) : "");
                        var NMOTRET= ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOTRET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOTRET"), i, 0) : "");
                        var CAPLTOD= 0;
                        newtd[0] = objLista.addTextoEnLista(TMOTRET);
                        
                        var TESTGEST = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTGEST")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTGEST"), i, 0) : "");
                        newtd[1] = objLista.addTextoEnLista(TESTGEST);
                        
                        var CUSURET = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CUSURET")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSURET"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(CUSURET);
                        
                        var FRETEN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FRETEN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FRETEN"), i, 0) : "");
                        if (FRETEN != "") 
                            FRETEN = objUtiles.formateaTimeStamp(FRETEN);
                        newtd[3] = objLista.addTextoEnLista(FRETEN);
                        
                        var TRIESGO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "");
                        newtd[4] = objLista.addTextoEnLista(TRIESGO);
                                                
                        
                        <axis:visible c="BT_BUSCAR_CESTGEST" f="axisctr034">
                        newtd[5] = objLista.addImagenEnLista("javascript:f_abrir_modal('axisctr099',null,'&SSEGURO="+ SSEGURO +"&NRIESGO="+ NRIESGO +"&NMOVIMI="+ NMOVIMI +"&CMOTRET="+ CMOTRET +"&NMOTRET="+ NMOTRET +"&CESTGEST="+ CESTGEST +"&CAPLTOD=" + CAPLTOD +"');",                                               
                                    "0", "", "", "images/lapiz.gif");                        
                        </axis:visible>                                                    
                        
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                    } // Fi for
                        } //Fi if error
                        </axis:visible>
                }//Fi else decisión tipo grid
                
                
            
                
                
                 f_cargar_propiedades_pantalla();
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } // recarrega scroll pane
                $.reinitialiseScroll(); 
        }
        
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
         function f_abrir_axispsu004 () {           
                var NOVISIBLE = document.getElementById("NOVISIBLE").value;                
                var SSEGURO = document.getElementById("SSEGURO").value;                
                
                objUtiles.abrirModal("axispsu004", "src", "modal_axispsu004.do?operation=form&NOVISIBLE"+NOVISIBLE+"&PTABLAS=POL&SSEGURO="+SSEGURO);
            }
            
            function f_cerrar_axispsu004() {
                objUtiles.cerrarModal("axispsu004");
            }    
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");                    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_abrir_modallittlemodal(modal) {
            if (objUtiles.estaVacio(document.miForm.NPOLIZA))
                alert(objJsMessages.jslit_selecciona_registro);
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

                if (typeof hayChecked == 'boolean') 
                    alert(objJsMessages.jslit_selecciona_registro);
                else {
                   objUtiles.abrirModal(modal,"src","modal_" + modal + ".do?operation=form",900,550);   
                }
            }
         }        
      
        function f_cerrar_modal(cual) {
        		if (cual == 'axisctr036' ){
        		try{
        			objUtiles.ejecutarFormulario("axis_axisctr034.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        		}catch(e){}
        	}
            objUtiles.cerrarModal(cual);
        }             
        
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (objUtiles.estaVacio(params)) {  
                params = "";
               }
            if (cual == "axisctr033") {
                objUtiles.ejecutarFormulario("axis_axisctr034.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);                
            } 
            else
            if (cual == "axisctr099"){                            
                f_actualizar_motivos(document.miForm.NPOLIZA.value+'/'+document.miForm.SSEGURO.value+'/'+document.miForm.NMOVIMI.value+'/'+document.miForm.NSUPLEM.value+'/'+document.miForm.SPRODUC.value+'/'+document.miForm.CSITUAC.value);
            }
            else
            if (cual == "axispsu003"){                            
                objUtiles.ejecutarFormulario("axis_axisctr034.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            else
            if (cual == "axisctr035") {
            var dato  = document.getElementById("ECRT035").value;
                if (dato == "EMITIR") {
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CAUTREC=1", "autorizarEmitir", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                   objUtiles.ejecutarFormulario("axis_axisctr034.do" + params, "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);  
                }           
            }
          
            else{
                // Los demás modales, recargan de BD
                objUtiles.ejecutarFormulario("axis_axisctr034.do" + params, "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            
        }
        
        var vSSEGURO173 = '';
        
        function f_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
            objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackAjaxGuardar, "operation=ajax_guardar&SSEGURO="+vSSEGURO173, this, objJsMessages.jslit_cargando);
        }
        
        function f_solo_cerrar_axisctr173(){
            objUtiles.cerrarModal("axisctr173");
        }        
        
        function f_abrir_axisctr173(SSEGURO,SPRODUC){
            vSSEGURO173 = SSEGURO;
            objUtiles.abrirModal("axisctr173", "src", "modal_axisctr173.do?operation=retenida&origen=axisctr034&SSEGURO="+SSEGURO+"&SPRODUC="+SPRODUC);
        } 
        
        
        function callbackAjaxGuardar(ajaxResponseText){
            //alert(ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            if (objAppMensajes.existenErroresEnAplicacion(doc, false)) {
            
            }// recarrega scroll pane
                $.reinitialiseScroll(); 
        }
        
        
       function f_but_9902702(){
       if (f_tengo_permisos()){
                    objUtiles.ejecutarFormulario("axis_axisctr034.do?CAUTREC=1",
                                "autorizarTodo", document.miForm, "_self", objJsMessages.jslit_cargando); 
            }
        }       
       
       function emitir(){
        objUtiles.ejecutarFormulario("axis_axisctr034.do?CAUTREC=1", "autorizarEmitir", document.miForm, "_self", objJsMessages.jslit_cargando);
       }
       
       
       function f_but_9902703(){
       if (f_tengo_permisos()){
         objUtiles.ejecutarFormulario("axis_axisctr034.do?CAUTREC=2",
                    "rechazarTodo", document.miForm, "_self", objJsMessages.jslit_cargando); 
                    }
       }
       
       function f_but_emitir() { // Emitir
         if (f_tengo_permisos()){
                f_abrir_modallittlemodal('axisctr035');
  
            document.getElementById("ECRT035").value = "EMITIR";
           
        }

           /* alert('emitir');
                if (objUtiles.estaVacio (objDom.getValorComponente(document.miForm.SSEGURO)) || 
                        objUtiles.estaVacio (objDom.getValorComponente(document.miForm.NMOVIMI)))
                        alert(objJsMessages.jslit_selecciona_una_poliza);
                else
                    //objUtiles.ejecutarFormulario("axis_axisctr034.do", "emitir_propuesta", document.miForm, "_self", objJsMessages.jslit_cargando);
                    objAjax.invokeAsyncCGI("axis_axisctr034.do", callbackGuardarEmitir, "operation=emitir_propuesta&SSEGURO="+objDom.getValorComponente(document.miForm.SSEGURO)+"&NMOVIMI="+objDom.getValorComponente(document.miForm.NMOVIMI), this, objJsMessages.jslit_emitiendo_poliza);*/
            }
            
              function callbackGuardarEmitir (ajaxResponseText) {
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                var disableButtons = false;
            
             if (!objAppMensajes.existenErroresEnAplicacion(doc)){     //Se ha producido un error informativo         
            
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OSSEGURO")[0]) ) {  
                                            
                              var sseguro = objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0);
                            
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                            var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                               objDom.setVisibilidadPorId("but_cerrar_modal_axisctr049", "hidden"); 
                               objUtiles.abrirModal("axisctr049","src","modal_axisctr049.do?operation=form&SSEGURO="+sseguro+"&MENSAJE="+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                               // f_get_reten(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0));
                            }
                            //alert(mensaje);
                            }else{
                            var mensaje="";
                            }
                            
                            
                             if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("OMOTRETEN")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("OMOTRETEN"), 0, 0) == 1){
                             var mensaje="";
                             }else{
                             //Se anyade una llamada a impresiones
                            
                            if(version_tomcat <= 6){  
                            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+mensaje+"&SEGURO=" + 
                                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));

                        	}
                        	else{
                        		objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + 
                                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
                        	}
                             
                             }

                }           
              }
                // recarrega scroll pane
                $.reinitialiseScroll(); 
            }
            
            
            function f_cerrar_axisimprimir(){
            	 objUtiles.cerrarModal('axisimprimir');
            }
        
        
        function f_tengo_permisos(){
        <axis:visible f="axisctr034" c="DSP_PSU">
        var permiteModificar = document.miForm.permiteModificar.value;
        
        var CESTPOL_PSU = document.miForm.CESTPOL_PSU.value;
        try{
          if (!objUtiles.estaVacio(CESTPOL_PSU ))     {
            
            if (permiteModificar == 1) {
                return true;
            }else{
                 alert('<axis:alt f="axisctr034" c="VAL_PERMISOS" lit="109905" />');
                return false;
            }
          
          }else{
          
            return true;
          
          }
            }catch(e){return true;}
          
        </axis:visible>
        return true;
        }
        
        
        function f_but_9905409(){
         if (f_tengo_permisos())
           objUtiles.ejecutarFormulario("axis_axisctr034.do" , "autorizarTodoMenosInspeccion", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9905410(){
		 if (f_tengo_permisos())
           objUtiles.ejecutarFormulario("axis_axisctr034.do?ACCION=INSPECCION" , "inspeccionRiesgo", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9905411(){
		 if (f_tengo_permisos())
           objUtiles.ejecutarFormulario("axis_axisctr034.do?ACCION=REVISARINSPECCION" , "inspeccionRiesgo", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_consultar_inspecciones(){
            var CTIPMAT = document.getElementById("CTIPMAT").value;
            var CMATRIC = document.getElementById("CMATRIC").value;
            objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&CTIPMAT="+CTIPMAT+"&CMATRIC="+CMATRIC);
        }
        
        function f_consultar_inspeccion(orden, inspeccion){            
            objUtiles.abrirModal("axisins001", "src", "modal_axisins001.do?operation=form&SORDEN="+orden+"&NINSPECCION="+inspeccion);
        }
        
        function f_cerrar_axisins001() {
            objUtiles.cerrarModal("axisins001");
        }
        
        function f_ocultar_botones(){
           
           var COBJASE = document.getElementById("COBJASE").value;
           var bvehiculos = document.getElementById("but_9001037");
           var bconductos = document.getElementById("but_9001186");
           //vehiculos (cobjase=5) 
           if (COBJASE!=5){
               if (bvehiculos != null) bvehiculos.style.display = 'none';
               if (bconductos != null) bconductos.style.display = 'none';
                 <axis:visible f="axisctr034" c="DSP_INSPECCION_RIESGO">       
                try{
                    var gridInspeccionRiesgo = document.getElementById("gridInspeccionRiesgo");              
                    gridInspeccionRiesgo.style.display = "none";
                }catch(e){}
                </axis:visible>
           }else{
               if (bvehiculos != null) bvehiculos.style.display = 'inline-block';
               if (bconductos != null) bconductos.style.display = 'inline-block';
           }
            
           ////////////////////////////////////////////////
           CRETENI = document.getElementById("CRETENI").value;
           var bautnoinsp = document.getElementById("but_9905409");
           var binsprisc = document.getElementById("but_9905410");
           var brevinsprisc = document.getElementById("but_9905411");
           var bautorizar = document.getElementById("but_100009");
           var brechazar = document.getElementById("but_9000545");
           
           if (CRETENI >= 7 && CRETENI <= 16){
           
               if (binsprisc != null) binsprisc.style.display = 'none';
               if (bautorizar != null) bautorizar.style.display = 'none';
			   
               if (brechazar != null && CRETENI != 13) brechazar.style.display = 'none';
           
               if (CRETENI!=13){
                   if (bautnoinsp != null) bautnoinsp.style.display = 'none';
                     
                   if (CRETENI ==  8 || CRETENI ==  11 || 
                       CRETENI ==  8 || CRETENI ==  12 ||
                       CRETENI ==  15 || CRETENI ==  16){
                        
                        if (brevinsprisc != null) brevinsprisc.style.display = '';
                   
                   }else{
                        if (brevinsprisc != null) brevinsprisc.style.display = 'none';
                   }
               }else{
                    if (bautnoinsp != null) bautnoinsp.style.display = ''; 
                    if (brevinsprisc != null) brevinsprisc.style.display = 'none';
               }
            
            }else{
                if (bautorizar != null) bautorizar.style.display = '';
                if (brechazar != null) brechazar.style.display = '';
                if (bautnoinsp != null) bautnoinsp.style.display = 'none';
                if (COBJASE!=5){
                    if (binsprisc != null) binsprisc.style.display = 'none';
                }else{                    
                    if (binsprisc != null) binsprisc.style.display = '';
                }
                if (brevinsprisc != null) brevinsprisc.style.display = 'none';
            }
		}		
        function f_but_9908440() {
			if (f_tengo_permisos()){
				if (objUtiles.estaVacio(document.miForm.SSEGURO))
					alert(objJsMessages.jslit_selecciona_registro);
				else {
					var hayChecked = objUtiles.f_GuardaCasillasChecked ("radioSSEGURO");

					if (typeof hayChecked == 'boolean') 
						alert(objJsMessages.jslit_selecciona_registro);
					else {
						objUtiles.ejecutarFormulario("axis_axisctr034.do?CCAMPO=BT_MEDICAL_EVIDENCES&dtPolizasOffset="  + document.getElementById("dt_polizas").scrollTop,
						"modificar", document.miForm, "_self", objJsMessages.jslit_cargando);        
					}
				}
            }
			
        }
        
        function f_cargar_lstPsuControl(seguro,tmotret2,movimiento){
        	
        	
       	 var SSEGURO = seguro;
            var NMOVIMI = movimiento;
            var NRIESGO = null;
            var NVERSION = tmotret2;
       	
       	
       	objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarControlSeg, "operation=psucontrolseg_ajax&SSEGURO="+SSEGURO+"&NMOVIMI="+NMOVIMI+"&NRIESGO="+NRIESGO+"&NVERSION="+NVERSION, this, objJsMessages.jslit_cargando);
       
       }
        
        function f_axispsu016(sseguro,nversion,nmovimi){
        	
        	
        	
        	
        	
        	objUtiles.abrirModal("axispsu016", "src", "modal_axispsu016.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
        			             "&NMOVIMIS="+nmovimi);
        	
        	
        } 
        
        function f_cerrar_axispsu016() {
            objUtiles.cerrarModal("axispsu016");
        } 
        
        
		function f_axispsu015(sseguro,nversion,nmovimi){
   
        	objUtiles.abrirModal("axispsu015", "src", "modal_axispsu015.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
        			             "&NMOVIMIS="+nmovimi);
	
        } 
        
        function f_cerrar_axispsu015() {
            objUtiles.cerrarModal("axispsu015");
        } 
     
		            
		function f_axispsu017(sseguro,nversion,nmovimi){
			
		 
		    	objUtiles.abrirModal("axispsu017", "src", "modal_axispsu017.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
		         			             "&NMOVIMIS="+nmovimi);            	
		 } 
        
        function f_cerrar_axispsu017() {
            objUtiles.cerrarModal("axispsu017");
        } 
        
        function f_axispsu018(sseguro,nversion,nmovimi){
	    	objUtiles.abrirModal("axispsu018", "src", "modal_axispsu018.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
	         			             "&NMOVIMIS="+nmovimi);            	
		 } 
        
        function f_cerrar_axispsu018() {
            objUtiles.cerrarModal("axispsu018");
        } 
        
        function f_cargar_lstPsuControl(seguro,tmotret2,movimiento){
        	
        	
       	 var SSEGURO = seguro;
            var NMOVIMI = movimiento;
            var NRIESGO = null;
            var NVERSION = tmotret2;
       	
       	
       	objAjax.invokeAsyncCGI("axis_axisctr018.do", callbackAjaxCargarControlSeg, "operation=psucontrolseg_ajax&SSEGURO="+SSEGURO+"&NMOVIMI="+NMOVIMI+"&NRIESGO="+NRIESGO+"&NVERSION="+NVERSION, this, objJsMessages.jslit_cargando);
       
       }
        
        function callbackAjaxCargarControlSeg(ajaxResponseText) {
            //alert(ajaxResponseText);
             var doc = objAjax.domParse(ajaxResponseText);
             
             console.log("entro");
             console.log(doc);
             
             objLista.borrarFilasDeLista ("lstPsuControl", "6", "<axis:alt f='axisctr018' c='ERR_REGS' lit='1000254' />");
             
             if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {	
 	            		var tableM = document.getElementById("lstPsuControl");
 	                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
 	                    var trM = tbodyM.getElementsByTagName("tr");
 	                    
 	                    
 	                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_PSU") ; i++) {
 	                    	
 	                    	if(i==0) objLista.borrarFilaVacia(tbodyM, trM);

                             //Obtenemos el estilo para la fila que insertaremos
                             var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                             //Creamos una nueva fila vacia y le damos el estilo obtenido
                             var newtr = objLista.crearNuevaFila(rowstyle);
                             //Creamos un array de columnas a aÃ±adir a la nueva fila del displayTag
                             var newtd = new Array(7);
                       
                             var tmotretCont1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCONTROL"), i, 0) : "");
                             var tmotretCont2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NVERSION")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NVERSION"), i, 0) : "");
                             var tmotretCont3 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FAUTREC"), i, 0) : "");
                             var tmotretCont4 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAUTREC")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAUTREC"), i, 0) : "");
                             
                             var riesgo = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "");
                             var garantia = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGARANT")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0) : "");
                             
                             var tmotretCont5 = riesgo+' - '+ garantia;
                             var tmotretCont6 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("OBSERV")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("OBSERV"), i, 0) : "");
                             var tmotretCont7 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNIVELR")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNIVELR"), i, 0) : "");
                             
                             
                             var seguro = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "");
                             var movimiento = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NMOVIMI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMOVIMI"), i, 0) : "");
                             var control = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCONTROL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCONTROL"), i, 0) : "");
                            
                             
                             var tmotretCont8 = ('<img border="0"	src="images/informacion.gif" width="12px" height="12px" style="cursor: pointer;" onClick="javascript:f_axispsu016('+
                             		seguro+','+tmotretCont2+','+movimiento+')" />');
                             
                             if(tmotretCont3 != "")
                             	tmotretCont3 = objUtiles.formateaTimeStamp(tmotretCont3);
                             
         
                             newtd[0] = objLista.addTextoEnLista(tmotretCont1);
                             newtd[1] = objLista.addTextoEnLista(tmotretCont2);
                             newtd[2] = objLista.addTextoEnLista(tmotretCont3);
                             newtd[3] = objLista.addTextoEnLista(tmotretCont4);
                             newtd[4] = objLista.addTextoEnLista(tmotretCont5);
                             newtd[5] = objLista.addTextoEnLista(tmotretCont6);
                             newtd[6] = objLista.addTextoEnLista(tmotretCont7);
                             //IAXIS-5125
                             <axis:visible f="axisctr034" c="BT_INFO_PSU_CONTROL" >
                             	newtd[7] = objLista.addTextoEnLista(tmotretCont8);
                             </axis:visible>
                             //IAXIS-5125
                             objLista.addNuevaFila(newtd, newtr, tbodyM);

      
 	                    }
 	                
             		
             		 }	
             
             
        }
       
		
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr034" c="GESTIONPROPUESTA" lit="101877"/></c:param>     <%-- Gestión de propuestas retenidas --%>
                <c:param name="formulario"><axis:alt f="axisctr034" c="GESTIONPROPUESTA" lit="101877"/></c:param> <%-- Gestión de propuestas retenidas --%>
                <c:param name="form">axisctr034</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispsu004|<axis:alt f="axisctr034" c="PSU004" lit="9002255" /></c:param>
            </c:import>
            
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axispsu003|<axis:alt f="axisctr034" c="PSU003" lit="9002255" /></c:param>
            </c:import> 
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisctr033|<axis:alt f="axisctr034" c="TITULO035" lit="9000538"/>#axisctr035|<axis:alt f="axisctr034" c="TITULO036" lit="9000547"/>#axisctr036|<axis:alt f="axisctr034" c="TITULOA038" lit="9000548"/>#axisctr037|<axis:alt f="axisctr034" c="TITULO099" lit="9000549"/>#axisctr099|<axis:alt f="axisctr034" c="TITULO037" lit="9002156"/>
            </c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr009" c="DOCU_REQUERIDA" lit="9901998"/></c:param>
                <c:param name="nid" value="axisctr173" />
            </c:import>  
            
              <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU004" lit="9909207" /></c:param>
                <c:param name="nid" value="axispsu015" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu016" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu017" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr020" c="PSU005" lit="9909208" /></c:param>
                <c:param name="nid" value="axispsu018" />
            </c:import>
           
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr034" c="IMPRIMIR" lit="1000205" /></c:param>
                <c:param name="nid" value="axisimprimir" />
                <c:param name="botonCerrar" value="true"/>
        </c:import>
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axis" c="INSPECCIONES" lit="9905244"/></c:param> 
            <c:param name="nid" value="axisins001" />
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${sessionScope.PRETEN_NPOLIZA}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${sessionScope.PRETEN_SSEGURO}"/>
        <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${sessionScope.PRETEN_NMOVIMI}"/>
        <input type="hidden" id="NSUPLEM" name="NSUPLEM" value="${sessionScope.PRETEN_NSUPLEM}"/>
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${sessionScope.PRETEN_SPRODUC}"/>
        <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/>
        <input type="hidden" id="CRETENI" name="CRETENI" value="${__formdata.CRETENI}"/>
        <input type="hidden" id="CESTPOL_PSU" name="CESTPOL_PSU" value="${__formdata.CESTPOL_PSU}"/>
        <input type="hidden" id="TESTPOL_PSU" name="TESTPOL_PSU" value="${__formdata.TESTPOL_PSU}"/>
        <input type="hidden" id="TNIVELBPM_PSU" name="TNIVELBPM_PSU" value="${__formdata.TNIVELBPM_PSU}"/>
        <input type="hidden" id="CNIVELBPM_PSU" name="CNIVELBPM_PSU" value="${__formdata.CNIVELBPM_PSU}"/>
        <input type="hidden" id="permiteModificar" name="permiteModificar" value="${__formdata.permiteModificar}"/>
        <input type="hidden" id="OK_POL" name="OK_POL" value="${__formdata.OK_POL}"/>
        <input type="hidden" id="SSEGURO_IMP" name="SSEGURO_IMP" value="${__formdata.SSEGURO_IMP}"/>
        <input type="hidden" id="CMATRIC" name="CMATRIC"/>
        <input type="hidden" id="CTIPMAT" name="CTIPMAT"/>
        <input type="hidden" id="PMODO" name="PMODO" value="${sessionScope.PMODO}"/>
        <input type="hidden" id="ECRT035" name="ECRT035"/>
        
        <input type="hidden" id="TIPODATOS" name="TIPODATOS" value="${__formdata.TIPODATOS}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisctr034" c="ICOLITERAL" lit="104925"/> <img border="0" src="images/find.gif" onclick="f_abrir_modal('axisctr033')" style="cursor:pointer"/></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisctr034" c="SOLICITUD" lit="109528"/></c:set>   <%-- Solicitud --%>
                                <c:set var="title8"><axis:alt f="axisctr034" c="POLIZA" lit="100836"/></c:set>   <%-- Póliza --%>                                 
                                <c:set var="title1"><axis:alt f="axisctr034" c="PRODUCTO" lit="100829" /></c:set>  <%-- Producto --%>              
                                <c:set var="title2"><axis:alt f="axisctr034" c="FALTA" lit="9000437"/></c:set>  <%-- F. Alta --%>
                                <c:set var="title3"><axis:alt f="axisctr034" c="FCANCEL" lit="9902670"/></c:set>  <%-- F. Cancel.9000808 --%>
                                <c:set var="title4"><axis:alt f="axisctr034" c="NIF" lit="105904"/></c:set>   <%-- NIF --%>
                                <c:set var="title5"><axis:alt f="axisctr034" c="TOMADOR" lit="101027"/></c:set>   <%-- Tomador --%>
                                <c:set var="title6"><axis:alt f="axisctr034" c="SITUACION" lit="100874"/></c:set>   <%-- Situación --%>             
                                <c:set var="title7"><axis:alt f="axisctr034" c="RETENCION" lit="101714"/></c:set>   <%-- Retención --%>   
                                <c:set var="title10"><axis:alt f="axisctr034" c="USUARIO" lit="100894"/></c:set>   <%-- Usuario --%>
                                <%-- IAXIS-14656  -JLTS -14/01/2021 Se incluye la SUCURSAL --%> 
                                <c:set var="title11"><axis:alt f="axisctr034" c="SUCURSAL" lit="9002202"/></c:set>   <%-- Sucursal --%>
                                
                                <c:set var="title9"><axis:alt f="axisctr034" c="DOCREQUERIDA" lit="9902268"/></c:set>            
                                
                                <div id="dt_polizas" class="seccion displayspaceMaximo">
                                    <display:table name="${sessionScope.PRETEN_T_IAX_POLIZASRETEN}" id="T_IAX_POLIZASRETEN" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr034.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="radio" id="radioSSEGURO_${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NPOLIZA}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NMOVIMI}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NSUPLEM}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SPRODUC}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CSITUAC}" name="radioSSEGURO"  
                                                value="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NPOLIZA}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NMOVIMI}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NSUPLEM}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SPRODUC}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CSITUAC}/${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CRETENI}" 
                                                onclick="f_actualizar_motivos(this.value)"
                                                <c:if test="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO == sessionScope.PRETEN_SSEGURO}"> checked="checked"</c:if>/>
                                                <c:if test="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO == sessionScope.PRETEN_SSEGURO}">
                                                    <script language="Javascript">
                                                        var CSITUAC_marcado="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CSITUAC}";
                                                    </script>
                                                </c:if>
                                            </div>
                                        </display:column>
                                        <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NPOLIZA}
                                            </div>
                                        </display:column>
                                        <c:if test="${requestScope.NPOLIZAENEMISION == 0}">
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NSOLICI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NSOLICI}
                                                </div>
                                            </display:column>
                                        </c:if>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TROTULO" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TROTULO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.FMOVIMI}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.FCANCEL" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.FCANCEL}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.NNUMIDE" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.NNUMIDE}                                           
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TOMADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TOMADOR}                                           
                                            </div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TSITUAC" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TSITUAC}                                           
                                            </div>  
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TRETENI}                                           
                                            </div>
                                        </display:column>
                                        <axis:visible c="CUSUMOV" f="axisctr034">
                                        <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.CUSUMOV}                                           
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <%-- IAXIS-14656  -JLTS -14/01/2021 Se incluye la TSUCURSAL--%>
                                        <axis:visible c="TSUCURSAL" f="axisctr034">
                                        <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TSUCURSAL" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.TSUCURSAL}                                           
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr034" c="DOCREQUERIDA">
                                         <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_POLIZASRETEN.TRETENI" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <c:if test="${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.DOCREQ == 1}">
                                                    <div class="dspIcons"><img border="0" src="images/lapiz.gif" width="15px" height="15px" title="<axis:alt f="axisctr034" c="DOCREQUERIDA" lit="9901356" />"
                                                    style="cursor:pointer;" onclick="javascript:f_abrir_axisctr173('${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SSEGURO}','${T_IAX_POLIZASRETEN.OB_IAX_POLIZASRETEN.SPRODUC}');"/></div>                               
                                                </c:if>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>                                                        
                                </div>
                                
                                <div class="separador">&nbsp;</div>
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">
                                        </td>
                                        <td align="center">  
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>                                        
                                        <td align="center">
                                        </td>
                                        <td align="center">
                                        </td>
                                    </tr>
                                </table>
                                
<%-------Secció PSU---------------%>
<axis:visible f="axisctr034" c="DSP_PSU">
<div id="gridPSU">

            <table class="area" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr034" c="DSP_PSU" lit="9002255" />
                  <span id="label_TESTPOL" class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">   
                  &nbsp; ${__formdata.TESTPOL_PSU} ${__formdata.TNIVELBPM_PSU}
                  </span>                
                </div>
                
                <div class="displayspace">
                           <c:set var="title0"><axis:alt f="axisctr034" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr034" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="axisctr034" c="TAUTREC" lit="9900977" /></c:set>
                        <c:set var="title5"><axis:alt f="axisctr034" c="TRIESGO" lit="9906106" /></c:set>                         
                        <c:set var="title6"><axis:alt f="axisctr034" c="TNIVELR" lit="9900978" /></c:set>
                        <c:set var="title7"><axis:alt f="axisctr034" c="INFO" lit="1000113" /></c:set>
                        <c:set var="title8"><axis:alt f="axisctr034" c="CCRITICO" lit="9905109" /></c:set>                         
                         
                         
                         <display:table name="${sessionScope.PRETEN_T_IAX_PSU}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr034.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                           </display:column>
                           
                           <axis:visible f="axisctr034" c="TAUTREC">   
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
                           
                           <axis:visible f="axisctr034" c="CCRITICO">
                               <display:column title="${title8}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText" >
                                   <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${T_IAX_PSU.OB_IAX_PSU.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${T_IAX_PSU.OB_IAX_PSU.CCRITICO}"
                                   <axis:atr f="axisctr034" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                                   </div>
                               </display:column>
                           </axis:visible>
                     
                     <axis:visible f="axisctr034" c="MASDETALL" >
                            <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr034" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.CAREA}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr034' c='INFO' lit='1000113'/>"/>
                                </div>
                           </display:column>   
                      </axis:visible>
                        </display:table>
                    </div>        
                    <div class="separador" style="align:right">&nbsp;</div>                      
                </td>                
               </tr>
               
              </table>
             </div>    
        <div class="separador">&nbsp;</div>   
    
</axis:visible>
<%------Fi secció PSU-------------------%>

 <axis:visible f="${pantalla}" c="DSP_PSU_RETENIDAS_HIST">
<div id="gridPSU_OBSERV">
<table class="area" align="center" cellpadding="0" cellspacing="0">

	<tr>
		<td class="campocaja"><img id="DSP_PSU_RETENIDAS_HIST_parent"
			src="images/mes.gif"
			onclick="objEstilos.toggleDisplay('DSP_PSU_RETENIDAS_HIST', this)"
			style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
					c="DSP_PSU_RETENIDAS_HIST " lit="9903021" /></b>
			<hr class="titulo"></hr></td>
	</tr>
	<tr id="DSP_PSU_RETENIDAS_HIST_children" style="display: none">
	
	<c:set var="title14">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909285" />
	</c:set>
	<c:set var="title15">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
	</c:set>
	<c:set var="title16">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100894" />
	</c:set>
	<c:set var="title17">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
	</c:set>
	<c:set var="title18">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909287" />
	</c:set>
	<c:set var="title19">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
	</c:set>
	<c:set var="title20">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
	</c:set>
	

		<td class="campocaja"><display:table
				name="${__formdata.P_TPSU_RETEN_HIST}" id="lstPsuRetenidas"
				export="false" class="dsptgtable" pagesize="-1" sort="list"
				cellpadding="0" cellspacing="0"
				requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
				<%@ include file="../include/displaytag.jsp"%>

					<display:column title="" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<input
							onClick=""
							value="" type="radio" id="radioNMOVIMI"
							name="radioNMOVIMI" />

					</display:column>
				

				
					<display:column title="${title14}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"><fmt:formatDate value="${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.FFECAUT}" pattern="dd/MM/yyyy" /></div>
						
					</display:column>
				

				
					<display:column title="${title15}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}</div>
					</display:column>
				

				
					<display:column title="${title16}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.CUSUAUT}</div>
					</display:column>
				

				
					<display:column title="${title17}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.TESTPOL}</div>
					</display:column>
                    <!--INI IAXIS-5125-->
				    <axis:visible f="axisctr034" c="BT_INFO_RETENIDAS">
    					<display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 fixed sortable" media="html" autolink="false">
    						<div class="dspIcons">
    						${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.TSUBESTADO}
    							<img border="0"
    								src="images/informacion.gif" width="12px" height="12px"
    								style="cursor: pointer;"
    								onClick="javascript:f_axispsu017('${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.SSEGURO}','${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}',
    								'${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NMOVIMI}')" />
    						</div>
    						
    					</display:column>
				    </axis:visible>
				    <!--FIN IAXIS-5125-->			
				    
					<display:column title="${title19}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.OBSERV}</div>
					</display:column>
					<!--INI IAXIS-5125-->
					<axis:visible f="axisctr034" c="BT_EDIT_RETENIDAS">
    					<display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 fixed sortable" media="html" autolink="false">    						
    						<div class="dspIcons">
    							<img border="0"
    								src="images/lapiz.gif" width="12px" height="12px"
    								style="cursor: pointer;"
    								onClick="javascript:f_axispsu018('${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.SSEGURO}','${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}',
    								'${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NMOVIMI}')" />
    						</div>
    						
    					</display:column>
				    </axis:visible>
				    
                    <axis:visible f="axisctr034" c="BT_INFO_RETENIDAS_2">
    					<display:column title="${title20}" sortable="true" sortProperty="" headerClass="headwidth5 fixed sortable" media="html" autolink="false">
    						<div class="dspIcons">
    							<img border="0"
    								src="images/informacion.gif" width="12px" height="12px"
    								style="cursor: pointer;"
    								onClick="javascript:f_axispsu015('${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.SSEGURO}','${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}',
    								'${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NMOVIMI}')" />
    						</div>
    					</display:column>
                    </axis:visible>
				    <!--FIN IAXIS-5125-->

			</display:table></td>
	</tr>
</table>	
	</div>
</axis:visible>

<axis:visible f="${pantalla}" c="DSP_PSUCONTROLSEG_HIST">


<c:set var="title24">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900975" />
	</c:set>
	<c:set var="title25">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
	</c:set>
	<c:set var="title26">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900976" />
	</c:set>
	<c:set var="title27">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
	</c:set>

	<c:set var="title29">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9906106" />
	</c:set>
	<c:set var="title30">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
	</c:set>
	<c:set var="title31">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900978" />
	</c:set>
	<c:set var="title32">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
	</c:set>





<div id="gridPSU_OBSERV">

<table class="area" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="campocaja"><img id="DSP_PSUCONTROLSEG_HIST_parent"
			src="images/mes.gif"
			onclick="objEstilos.toggleDisplay('DSP_PSUCONTROLSEG_HIST', this)"
			style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
					c="DSP_PSUCONTROLSEG_HIST" lit="9904548" /></b>
			<hr class="titulo"></hr></td>
	</tr>
	<tr id="DSP_PSUCONTROLSEG_HIST_children" style="display: none">


		<td class="campocaja">
		<display:table
				name="${__formdata.P_TPSUCONTRSEG_HIST}" id="lstPsuControl"
				export="false" class="dsptgtable" pagesize="-1" sort="list"
				cellpadding="0" cellspacing="0"
				requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
				<%@ include file="../include/displaytag.jsp"%>

				
				    <display:column title="${title24}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TCONTROL}</div>
					</display:column>
				
					<display:column title="${title25}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.NVERSION}</div>
					</display:column>
							
					<display:column title="${title26}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText"><fmt:formatDate value="${lstPsuControl.OB_IAX_PSU.FAUTREC}" pattern="dd/MM/yyyy" /></div>
					</display:column>
					
					<display:column title="${title27}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TAUTREC}</div>
					</display:column>
					
					
					<display:column title="${title29}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TRIESGO} "-" ${lstPsuControl.OB_IAX_PSU.TGARANT} </div>
					</display:column>
					
					<display:column title="${title30}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.OBSERV}</div>
					</display:column>
					
					<display:column title="${title31}" sortable="true"
						sortProperty="CMOVIMI" headerClass="sortable" media="html"
						autolink="false" style="white-space:nowrap; width:15px">
						<div class="dspText">${lstPsuControl.OB_IAX_PSU.TNIVELR}</div>
					</display:column>
					<!--INI IAXIS-5125-->
				    <axis:visible f="axisctr034" c="BT_INFO_PSU_CONTROL">
    					<display:column title="${title32}" sortable="true" sortProperty="" headerClass="headwidth5 fixed sortable" media="html" autolink="false">
    						<div class="dspIcons">
    							<img border="0"
    								src="images/informacion.gif" width="12px" height="12px"
    								style="cursor: pointer;"
    								onClick="javascript:f_axispsu016('${lstPsuControl.OB_IAX_PSU.SSEGURO}','${lstPsuControl.OB_IAX_PSU.NVERSION}',
    								'${lstPsuControl.OB_IAX_PSU.NMOVIMI}','${lstPsuControl.OB_IAX_PSU.CCONTROL}')" />
    						</div>
    					</display:column>
				    </axis:visible>
                    <!--FIN IAXIS-5125-->
			</display:table></td>
	</tr>
	
</table>	
</div>
</axis:visible>

         
<%------Inspección de riesgo------------%>
<axis:visible f="axisctr034" c="DSP_INSPECCION_RIESGO">
    
    <div id="gridInspeccionRiesgo">            
            <table class="area" align="center" cellpadding="0" cellspacing="0" >            
                <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                <tr><td colspan="4">                    
                <div class="separador" style="align:right">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr034" c="DSP_INSPECCION_RIESGO" lit="9905241" />
   <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_inspecciones();" style="cursor:pointer" align="right"/>
                </div>                    
                </td></tr>
                 
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
                        <axis:ocultar c="CINSPREQ" f="axisctr034" dejarHueco="false">
                            <select name = "CINSPREQ" id ="CINSPREQ" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr034" c="CINSPREQ" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr034" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec1}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${CINSPREQ ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>
                        </axis:ocultar> 
                        </td>
                          <td class="campocaja" >  
                       
                        <axis:ocultar c="CRESULTR" f="axisctr034" dejarHueco="false">
                            <select name = "CRESULTR" id ="CRESULTR" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr034" c="CRESULTR" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr034" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec2}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${CRESULTR ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>            
                        </axis:ocultar>
                        </td>
                        </tr>                 
            </table>
            <div class="separador" style="align:right">&nbsp;</div>
            <table class="area" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr034" c="DSP_INSPECCION_RIESGO" lit="9905244" />
                </div>                    
                 <div class="displayspace">
                        <c:set var="title0"><axis:alt f="axisctr034" c="CNORDEN" lit="9905245" /></c:set>
                        <c:set var="title1"><axis:alt f="axisctr034" c="CNINSPECCION" lit="9905246" /></c:set>                               
                        <c:set var="title2"><axis:alt f="axisctr034" c="FSOLICITUD" lit="9905247" /></c:set>
                        <c:set var="title3"><axis:alt f="axisctr034" c="TESTADOORDEN" lit="9905248" /></c:set>                         
                        <c:set var="title4"><axis:alt f="axisctr034" c="TCLASE" lit="9905249" /></c:set>
                        <c:set var="title5"><axis:alt f="axisctr034" c="FVTOORDEN" lit="9905250" /></c:set>
                        <c:set var="title6"><axis:alt f="axisctr034" c="FINSPECCION" lit="9905251" /></c:set>
                        <c:set var="title7"><axis:alt f="axisctr034" c="TESTADOINSPECCION" lit="9905252" /></c:set>
                        <c:set var="title8"><axis:alt f="${pantalla}" c="MES" lit="1000113" /></c:set>
                        
                         <display:table name="${INSPECCION_RIESGO}" id="INSPECCION_RIESGO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr034.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                           
                           <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${INSPECCION_RIESGO.SORDEN}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${INSPECCION_RIESGO.NINSPECCION}</div>
                           </display:column>
                           
                           <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                           </display:column>                           
                           
                           <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${INSPECCION_RIESGO.TESTADOORDEN}</div>
                           </display:column>                         
                           
                           <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${INSPECCION_RIESGO.TCLASE}</div>
                           </display:column>
                           
                           <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FVTORDEN}" pattern="dd/MM/yyyy"/></div>
                           </display:column>
                           
                           <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FINSPECCION}" pattern="dd/MM/yyyy"/></div>
                           </display:column>
                           
                           <display:column title="${title7}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${INSPECCION_RIESGO.TESTADOINSPECCION}</div>
                           </display:column>                           
                            
                           <display:column title="${title8}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                               <c:if test="${!empty INSPECCION_RIESGO.NINSPECCION}" > 
                                   <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr034" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                   style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='axisctr034' c='INFO' lit='1000113'/>"/>
                                   </div>
                               </c:if>
                           </display:column>
                       </display:table>
                    </div>       
                    <div class="separador" style="align:right">&nbsp;</div>                      
                </td>
               </tr>
              </table>             
             </div>    
    <div class="separador">&nbsp;</div>
    
</axis:visible>
<%-------------Fi Inspección de riesgo-----------------%>
<axis:visible f="axisctr034" c="DSP_RET">

<div id="gridMRET">
                                <table class="area" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr034" c="MOTIVOS" lit="1000297" /></div>
                                            
                                            <div class="seccion displayspace">
                                                <c:set var="title0"><axis:alt f="axisctr034" c="MOTRETEN" lit="9000540"/></c:set>  <%-- Motivo retención --%>
                                                <c:set var="title1"><axis:alt f="axisctr034" c="ESTGESTION" lit="9002157"/></c:set>  <%-- Estado gestión --%>
                                                <c:set var="title2"><axis:alt f="axisctr034" c="USUARIO" lit="9000541"/></c:set>  <%-- Usuario retención --%>                                                
                                                <c:set var="title3"><axis:alt f="axisctr034" c="FRETEN" lit="9000542"/></c:set>  <%-- F. Retención --%>
                                                <c:set var="title4"><axis:alt f="axisctr034" c="RIESGO" lit="100649"/></c:set>   <%-- Riesgo --%>
                                                <c:set var="title5"></c:set>  
                                                <display:table name="${sessionScope.PRETEN_T_IAX_POLMVTRETEN}" id="T_IAX_POLMVTRETEN" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr034.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.TMOTRET" style="width:25%" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.TMOTRET}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.TESTGEST" style="width:15%"  headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.TESTGEST}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.CUSURET" style="width:15%"  headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.CUSURET}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.FRETEN" style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value='${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.FRETEN}' pattern='dd/MM/yyyy'/>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_POLMVTRETEN.TRIESGO" style="width:20%" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.TRIESGO}                                           
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" style="width:5%" headerClass="sortable fixed" media="html" autolink="false">
                                                        <div class="dspIcons"><img border="0" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:f_abrir_modal('axisctr099',null,'&SSEGURO=' + ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.SSEGURO} + '&NRIESGO=' + ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.NRIESGO} +'&NMOVIMI=' + ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.NMOVIMI} + '&CMOTRET=' + ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.CMOTRET} + '&NMOTRET=' + ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.NMOTRET} +'&CESTGEST='+ ${T_IAX_POLMVTRETEN.OB_IAX_POLMVTRETEN.CESTGEST} + '&CAPLTOD=0' );"/></div>
                                                    </display:column> 
                                                </display:table>                                                     
                                            </div>
                                            <div class="separador">&nbsp;</div>                                            
                                        </td>
                                    </tr>
                                </table>
                               </div>
                               </axis:visible>
                            </td>
                        </tr>
                        
                    </table>
                </td>     
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr034</c:param>
            <%--c:param name="__botones">salir<axis:visible f="axisctr034" c="BT_AUTTOT">,9902702</axis:visible><axis:visible f="axisctr034" c="BT_RECHTOT">,9902703</axis:visible>,100009,9000545,9000546,1000183,101791,1000439<axis:visible f="axisctr034" c="BT_EDITAR">,editar</axis:visible><axis:visible c="BT_CUADRO" f="axisctr034">,9902513</axis:visible><axis:visible c="BT_EMITIR" f="axisctr034">,emitir</axis:visible></c:param--%> 
            <%--bug 0024832 c:param name="__botones">salir<c:if test="${!empty sessionScope.PRETEN_T_IAX_POLIZASRETEN}">,100009,9000545<axis:visible c="BT_9000546" f="axisctr034">,9902670</axis:visible>,1000183,101791,1000439<axis:visible f="axisctr034" c="BT_EDITAR">,editar</axis:visible><axis:visible c="BT_CUADRO" f="axisctr034">,9902513</axis:visible></c:if></c:param--%>  
             <c:param name="__botones">salir<c:if test="${!empty sessionScope.PRETEN_T_IAX_POLIZASRETEN}"><axis:visible c="BT_100009" f="axisctr034">,100009</axis:visible>,<axis:visible c="BT_9000545" f="axisctr034">,9000545</axis:visible>,<axis:visible c="BT_9000546" f="axisctr034">,9902670</axis:visible><axis:visible c="BT_1000183" f="axisctr034">,1000183</axis:visible><axis:visible f="axisctr034" c="BT_101791">,101791</axis:visible><axis:visible f="axisctr034" c="MODIF_PROP_422">,9001037</axis:visible><axis:visible f="axisctr034" c="MODIF_PROP_426 ">,9001186</axis:visible><axis:visible f="axisctr034" c="BT_1000439">,1000439</axis:visible><axis:visible f="axisctr034" c="BT_EDITAR">,editar</axis:visible><axis:visible c="BT_CUADRO" f="axisctr034">,9902513</axis:visible><axis:visible c="BT_AUTNOINSP" f="axisctr034">,9905409:150</axis:visible><axis:visible c="BT_INSPECRISC" f="axisctr034">,9905410</axis:visible><axis:visible c="BT_REVINSPEC" f="axisctr034">,9905411</axis:visible><axis:visible f="axisctr034" c="MODIF_PROP_970">,9908440</axis:visible><axis:visible c="BT_EMITIR" f="axisctr034">,emitir</axis:visible></c:if></c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>