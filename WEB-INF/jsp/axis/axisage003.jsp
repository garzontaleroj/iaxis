 
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>

    <c:import url="../include/carga_framework_js.jsp" />    

    <script type="text/javascript">
        function f_actualizar_tnombre() {
          document.getElementById("TNOMBRE").style.visibility = "visible";
          document.getElementById("TNOMBRE").style.display = "inherit";
        }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage003", "cancelar", document.miForm, "_self");                   
        }
        
        function f_but_aceptar() {
            
            if (objValidador.validaEntrada())                
            {
              	<axis:visible f="axisage003" c="COBLCCC">
            	  	document.miForm.COBLCCC.value = document.getElementById("COBLCCC").checked ? 1: 0;
            	  </axis:visible>
                 
                  //bug_27949 funcion para tratar los checkbox
                  f_guardar_clasesNegocio();

                objUtiles.ejecutarFormulario ("axis_axisage003.do?COBLCCC="+document.miForm.COBLCCC.value , "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);                   
            }
                        
        }
        
        function f_but_buscar() {
            f_abrir_modal('axisper021', true, 
                "&modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE=" + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_but_buscar_age() {
            f_abrir_modal('axisage006',true);
        }
        
        function f_but_102177() {
            f_abrir_modal('axisage028', true, 
                "&modal_axisage028.do?operation=form&CAGENTE=" + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_but_9905728() {
            f_abrir_modal('axisage033', true, 
                "&modal_axisage033.do?operation=form&MODO=GENERAL&CAGENTE=" + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_cerrar_axisage028() {                
            f_cerrar_modal("axisage028");
            //f_but_salir();
        }
        
        function f_cerrar_axisage033() {                
            f_cerrar_modal("axisage033");
            //f_but_salir();
        }
        
        
        function f_axisage006_nuevo(){
            objUtiles.cerrarModal("axisage006");
            document.miForm.isNew.value = true;
            document.miForm.grabarOK.value = false;
            document.miForm.isEdit.value = false;
            document.miForm.CODAGENTEAUT.value = 1;
	    document.miForm.isBusca.value = false;
	    document.miForm.CAGENTE.value = '';			      
            objUtiles.ejecutarFormulario("axis_axisage003.do?RESETFORM=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axisage006(CAGENTE, TAGENTE) {
            objUtiles.cerrarModal("axisage006");           
            document.miForm.CAGENTE.value = CAGENTE;
            document.miForm.grabarOK.value = false;
            document.miForm.isEdit.value = true;          
            document.miForm.isNew.value = true;
            document.miForm.isBusca.value = true;
            objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                        
        }
        
        function f_cerrar_axisage006() {    
            document.miForm.isBusca.value = true;
            f_cerrar_modal("axisage006");
            //f_but_salir();
        }
        
        
        function f_onload() {
            var CAGENTE = "${__formdata.CAGENTE}";
            var CMODO = "${__formdata.CMODO}";
            var isNew = "${__formdata.isNew}";
            //INI 4855
        	if (objUtiles.estaVacio(CAGENTE) && ( !objUtiles.estaVacio(CMODO) && (CMODO == "CONSULTA_RED" || CMODO == "MODIFICACION_RED" || CMODO == "CONSULTA") ) ) {
        		if (${__formdata.isNew != "true"} && ${__formdata.isBusca != "true"}) f_abrir_modal('axisage006', true);
        	}  
            //FIN 4855
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            f_cargar_propiedades_pantalla(); 
            if (${__formdata.isEdit == "true"} && ${__formdata.grabarOK == "true"} && !hayErrores){            
                alert("<axis:alt f='axisage003' c='ALERT' lit='1000405' />");
                
                document.miForm.grabarOK.value = false;
                document.miForm.isEdit.value = true;
                
                objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            else {
                if (${empty __formdata.SPERSON}) {
                    // Si slo hay un domicilio, marcarlo
                    var CDOMICI = document.getElementById("CDOMICI");
                    if (!objUtiles.estaVacio(CDOMICI) && CDOMICI.options.length == 2) 
                        CDOMICI[1].selected = "1";
                        
                    // Si slo hay una cuenta, marcarla
                    var CBANCAR = document.getElementById("CBANCAR");
                    if (!objUtiles.estaVacio(CBANCAR) && CBANCAR.options.length == 2) 
                        CBANCAR[1].selected = "1";
                }
            }

            //ecg http://mantis.srvcsi.com/view.php?id=23733#c123529
            if (document.referrer.indexOf("main.do")>=0) { objSeccion.seccionPorAbrirCookieBorrar("axisage003");}
            objSeccion.abrirSeccionesPorAbrir("axisage003");
            if (document.referrer.indexOf("main.do")>=0) { objSeccion.posicionPorColorcarCookieBorrar("axisage003");}
            objSeccion.colocarPosicionPorColocar("axisage003");
            objSeccion.posicionPorColorcarCookieBorrar("axisage003");
            f_actualizar_tnombre();

            
        }
        
        function f_actualizar_redcomercial(CEMPRES) {
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objAjax.invokeAsyncCGI("axis_axisage003.do", 
                callbackAjaxActualizarRedcomercial, "operation=actualizar_redcomercial&CEMPRES=" + CEMPRES + 
                "&CAGENTE=" + objDom.getValorPorId("CAGENTE"),  this);
        }
        
        function f_check(check){
            check.value = check.checked ? 1 : 0;
        }
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            // Recargamos form axisage003 para reflejar las posibles modificaciones hechas en el modal
            document.miForm.grabarOK.value = false;
            document.miForm.isEdit.value = true;
            objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_recargar(ctipage){
        
            <c:if test="${__formdata.isEdit!=true}">
            if(document.miForm.CAGENTE){
                document.miForm.CAGENTE.value="";
            }
            </c:if>
             
            f_cargar_propiedades_pantalla(); 
        
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            if(!isEdit)
               document.miForm.CACTIVO.value="";
            objAjax.invokeAsyncCGI("axis_axisage003.do", callbackAjaxCargarEstados, "operation=ajax_busqueda_estados&CTIPAGE="+ctipage+"&CACTIVO="+document.miForm.CACTIVO.value, this, objJsMessages.jslit_cargando);
            f_actualizar_tnombre();
          
        }
        

        
        function callbackAjaxCargarEstados (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CATRIBU");
                    var CACTIVOCombo = document.miForm.CACTIVO;     
                    objDom.borrarOpcionesDeCombo(CACTIVOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage003" c="CACTIVO" lit="108341"/> - ', CACTIVOCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                            var TATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                            objDom.addOpcionACombo(CATRIBU, TATRIBU, CACTIVOCombo, i+1);
                            
                            var isEdit   = ${isEdit == true};
                            if(!isEdit && CATRIBU == 1)
                                CACTIVOCombo[i+1].selected ="1";
                        }
                } 
        } 
        
        
        
        function f_cerrar_modalespersona(modal) {
            objUtiles.cerrarModal(modal);
        } 
        
        function f_cerrar_axisper022() {
            f_cerrar_modalespersona("axisper022");
        }
        
        function f_nova_persona(){
            f_cerrar_modalespersona("axisper021");
            f_abrir_modal('axisper022', true, 
                "&modal_axisper022.do?operation=init&MODO_SWPUBLI=PERSONAS_PUBLICAS&CAGENTE=" + objDom.getValorPorId("CAGENTE"));
        }

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_abrir_axisage004() {
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK' lit='9000846'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK' lit='9000846'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            
            f_abrir_modal('axisage004', true, 
                '&CAGENTE=' + objDom.getValorPorId("CAGENTE"));
        }

        function f_abrir_axisage005() {
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            var contratoOK = ${__formdata.contratoOK == true};
            var fbaja =  document.miForm.FBAJAGE.value;
            // var domicilio =  document.miForm.CDOMICI.value;  //TCS-7 21/02/2019 AP //IAXIS-2415 27/02/2019
            
            if (!objUtiles.estaVacio(fbaja)) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK' lit='9904277'/>";
                }/*else if (objUtiles.estaVacio(domicilio)){ //IAXIS-2415 27/02/2019
            	mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK' lit='9905958'/>"; //TCS-7 21/02/2019 AP
            }*/else if (!isEdit && !grabarOK) { //IAXIS-2415 27/02/2019
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }
            // JLTS bug 23869 quitar la obligatoriedad 09/10/2012 --%>
            // FAC bug 23476 Colocar la obligatoriedad 15/10/2013 --%>
            else if (!contratoOK){
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK3' lit='9903193'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
			
			if (objValidador.validaEntrada()) { //IAXIS-2415 27/02/2019
            	f_abrir_modal('axisage005', true, 
                    '&CAGENTE=' + objDom.getValorPorId("CAGENTE") + '&CEMPRES=' + objDom.getValorPorId("CEMPRES") +'&CDOMICIAGE=' + objDom.getValorPorId("CDOMICI"));  //TCS-7 21/02/2019 AP //IAXIS-2415 27/02/2019
			} //IAXIS-2415 27/02/2019		
        }
          
        function f_aceptar_persona(SPERSON, CAGENTE,SNIP, modal){
            f_cerrar_modalespersona(modal);
            objDom.setValorPorId("grabarOK", false);
            objDom.setValorPorId("SPERSON", SPERSON);
            // objDom.setValorPorId("CAGENTE", CAGENTE);
            objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_modales_axisage004_axisage005(cual) {
            objUtiles.cerrarModal(cual);
            // Recargamos form axisage003 para reflejar las posibles modificaciones hechas en el modal
            objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisper014(SPERSON) {
            /*objDom.setVisibilidadPorId("but_cerrar_modal_axisper014", "hidden");*/
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+SPERSON); 
        }
    
        function f_cerrar_axisper014 () {
            objUtiles.cerrarModal("axisper014"); 
        }    
    
        function f_aceptar_axisper014 (SPERSON) {
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario("axis_axisage003.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }  

        /****************************************************************************************/
        /************************************ CALLBACKS AJAX ************************************/
        /****************************************************************************************/

        function callbackAjaxActualizarRedcomercial(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                
                    var tableM = document.getElementById("HISTORICO");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    objLista.borrarFilasDeLista ("HISTORICO", "6", "<axis:alt f='axisage003' c='MENSANOREG' lit='1000254' />");
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_REDCOMERCIAL") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a aadir a la nueva fila del displayTag
                        var newtd = new Array(6);
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var FMOVINI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVINI")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVINI"), i, 0) : "");
                        if (FMOVINI != "") 
                            FMOVINI = objUtiles.formateaTimeStamp(FMOVINI);
                        newtd[0] = objLista.addTextoEnLista(FMOVINI);
                        
                        var FMOVFIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FMOVFIN")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FMOVFIN"), i, 0) : "");
                        if (FMOVFIN != "") 
                            FMOVFIN = objUtiles.formateaTimeStamp(FMOVFIN);
                        newtd[1] = objLista.addTextoEnLista(FMOVFIN);
                        
                        var TCTIPAGE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCTIPAGE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCTIPAGE"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(TCTIPAGE);
                        
                        var TPADRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPADRE")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPADRE"), i, 0) : "");
                        newtd[3] = objLista.addTextoEnLista(TPADRE);

                        var CPERVISIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPERVISIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPERVISIO"), i, 0) : "");
                        var TPERVISIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPERVISIO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERVISIO"), i, 0) : "");
                        newtd[4] = objLista.addTextoEnLista(CPERVISIO + " " + TPERVISIO);

                        var TPERNIVEL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPERNIVEL")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERNIVEL"), i, 0) : "");
                        newtd[5] = objLista.addTextoEnLista(TPERNIVEL);
                        
                        // Aadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                
                    } // Fi for
                }
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }
        
        /****************************************************************************************/
        /************************************* SALTOS DE FLUJO **********************************/
        /****************************************************************************************/
        
        function f_but_modificacion_persona() {
            objUtiles.ejecutarFormulario("axis_axisage003.do", "modificacion_persona", document.miForm, "_self", objJsMessages.jslit_cargando);                        
        }

        function f_buscacodigo(){
            objUtiles.ejecutarFormulario("axis_axisage003.do", "busca_codagente", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisctr014() {
            objDom.setValorPorId("modAGE", "CAGEDEP");
            f_abrir_modal("axisctr014", true,"&CONDICION=CTIPAGE_3");
            
        }
        
        function f_abrir_axisctr014k() {
            objDom.setValorPorId("modAGE", "CAGECLAVE");
            f_abrir_modal("axisctr014", true,"&CONDICION=CTIPAGE_4");
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
    
        function f_aceptar_axisctr014 (CAGENTE){
            f_cerrar_axisctr014();
            if(objDom.getValorPorId("modAGE")=="CAGEDEP"){
                objDom.setValorPorId("CAGEDEP", CAGENTE);            
                f_actualizar_agentek(CAGENTE);
            }
            if(objDom.getValorPorId("modAGE")=="CAGECLAVE"){
                objDom.setValorPorId("CAGECLAVE", CAGENTE);            
                f_actualizar_agente(CAGENTE);
            }
        }
        
        function f_actualizar_agente(CAGENTE) {
                if ((CAGENTE==null)||(CAGENTE=="")){
                    objDom.setValorPorId("CAGECLAVE","");
                    objDom.setValorPorId("TAGECLAVE","");
                }else{
                    objAjax.invokeAsyncCGI("axis_axisage003.do", callbackAjaxActualizarAgente, 
                    "operation=actualizar_agente&CAGEDEP=" + CAGENTE+"&TIPO=CTIPAGE_4", this, objJsMessages.jslit_cargando);
                }
        }
        
        function callbackAjaxActualizarAgente(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            objDom.setValorPorId("TAGECLAVE", "");
            objDom.setValorPorId("CAGECLAVE", "");
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]))
                        objDom.setValorPorId("CAGECLAVE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])){
                        objDom.setValorPorId("TAGECLAVE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                    }
                } else {
                    objDom.setValorPorId("TAGECLAVE", "");
                    objDom.setValorPorId("CAGECLAVE", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            if (objUtiles.estaVacio(objDom.getValorPorId("CAGECLAVE"))) {
                var mensajesAlert = "<axis:alt f='axisage003' c='MENSAAGE' lit='101378'/>";
                alert(mensajesAlert);
            }
        }
        
        function f_actualizar_agentek(CAGENTE) {
                if (objUtiles.estaVacio(CAGENTE)) {
                    objDom.setValorPorId("CAGEDEP", "");
                    objDom.setValorPorId("TAGEDEP", "");
                }else{
                    objAjax.invokeAsyncCGI("axis_axisage003.do", callbackAjaxActualizarAgentek, 
                        "operation=actualizar_agente&CAGEDEP=" + CAGENTE+"&TIPO=CTIPAGE_3", this, objJsMessages.jslit_cargando);
                }
        }
        
        function callbackAjaxActualizarAgentek(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            objDom.setValorPorId("CAGEDEP", "");
            objDom.setValorPorId("TAGEDEP", "");
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]))
                        objDom.setValorPorId("CAGEDEP", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0]))
                        objDom.setValorPorId("TAGEDEP", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                } else {
                    objDom.setValorPorId("CAGEDEP", "");
                    objDom.setValorPorId("TAGEDEP", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            if (objUtiles.estaVacio(objDom.getValorPorId("CAGEDEP"))) {
                var mensajesAlert = "<axis:alt f='axisage003' c='MENSAAGE' lit='101378'/>";
                alert(mensajesAlert);
            }

        }
        
        function f_abrir_axisage014() {
           var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            f_abrir_modal('axisage014', true, 
                '&PARCAGENTE=' + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_delete_prodpart(cagente,sproduc,cactivi){
            if (confirm ('<axis:alt f="axisage003" c="PREGUNTA" lit="9902587"/>'))
                objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+cagente+"&PSPRODUC="+sproduc+"&PCACTIVI="+cactivi, "delete_prodpart", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisage015() {
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }

            f_abrir_modal('axisage015', true, 
                '&EDIT=NEW&PARCAGENTE=' + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_edit_soporte(cagente,finivig) {
            f_abrir_modal('axisage015', true, 
                '&EDIT=EDIT&PARCAGENTE='+cagente+'&PARFINIVIG='+finivig);
        }
        
        function f_delete_soporte(cagente,finivig){
            if (confirm ('<axis:alt f="axisage003" c="PREGUNTA" lit="9902587"/>'))
                objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+cagente+"&PFINIVIG="+finivig, "delete_soporte", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisage016(ctipo,ccomind) {//BFP bug 20999 afegim ccomind 26/01/2012
            f_abrir_modal('axisage016', true, 
                '&PARCAGENTE=' + objDom.getValorPorId("CAGENTE")+"&CTIPO="+ctipo+"&CCOMIND="+ccomind);
        }
        
        function f_abrir_axisage017() {
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            
            f_abrir_modal('axisage017', true, 
                '&EDIT=NEW&PARCAGENTE=' + objDom.getValorPorId("CAGENTE"));
        }
        
        function f_edit_sub(cagente,sproduc,cactivi) {
            f_abrir_modal('axisage017', true, 
                '&EDIT=EDIT&PARCAGENTE='+cagente+'&PARSPRODUC='+sproduc+"&PARCACTIVI="+cactivi);
        }
        
        function f_delete_sub(cagente,sproduc,cactivi){
            if (confirm ('<axis:alt f="axisage003" c="PREGUNTA" lit="9902587"/>'))
                objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+cagente+"&PSPRODUC="+sproduc+"&PCACTIVI="+cactivi, "delete_subvencion", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_cofermercan(){
              document.miForm.COFERMERCAN.value = document.getElementById("COFERMERCAN").checked ? "1" : "0";
        }
        
        /* codi original substituit per Johnny
        function f_onchange_CPOBLAC() {
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("axis_axisage003.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }*/
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPOBLAC="+CPOBLAC;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                objAjax.invokeAsyncCGI("axis_axisage003.do", callbackajaxdireccion, qs, this);
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPOBLAC");
            }
        }
        /* codi original substituit per Johnny
        function f_onchange_CPROVIN() {
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("axis_axisage003.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }*/
        
        function f_onchange_CPROVIN() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                objAjax.invokeAsyncCGI("axis_axisage003.do", callbackajaxdireccion, qs, this);
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                //limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
                 //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objJsMessages.jslit_codigo_provincia_incorrecto +"</b>");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                            objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        function f_actualizar_dates(valor){
            if (valor == 1){
                objDom.setValorPorId("FINIVIGCOM", "");
            }
            if (valor == 2){
                objDom.setValorPorId("FFINVIGSOBRECOM", "");
                objDom.setValorPorId("FINIVIGSOBRECOM", "");
            }
            <%-- Inici BFP bug 20999 25/01/2012 Comisin Indirecta --%>
            if (valor == 3){
             objDom.setValorPorId("FINIVIGCOM_INDIRECT","");
             }  
            <%-- Fi BFP bug 20999 25/01/2012 Comisin Indirecta --%>
           f_cargar_propiedades_pantalla(); 
           f_actualizar_tnombre();
           
        }
        
         function f_actualizar_dates_desc(){  
            objDom.setValorPorId("FINIVIGDESC", "");
            objDom.setValorPorId("FFINVIGDESC", "");
            f_cargar_propiedades_pantalla(); 
            f_actualizar_tnombre(); 
           
        }
        
       function f_traspasar_sub(){
            
            var NPLANPAGO = objDom.getValorPorId("NPLANPAGO");
            var cagente = objDom.getValorPorId("CAGENTE"); 
            
            if(objUtiles.estaVacio(NPLANPAGO))
                alert("<axis:alt f="axisage003" c="NPLANPAGO" lit="9902547"/>"+" "+"<axis:alt f="axisage003" c="NPLANPAGO" lit="1000165"/>");
            else{
                document.miForm.grabarOK.value = false;
                document.miForm.isEdit.value = true;
                objUtiles.ejecutarFormulario("axis_axisage003.do", "consolidar_sub", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_abrir_axisage020(NORDEN){
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
        
            objUtiles.abrirModal("axisage020", "src", "modal_axisage020.do?operation=form&CAGENTE="+document.miForm.CAGENTE.value+"&NORDEN="+NORDEN);
        }
        
        function f_cerrar_axisage020() {
            objUtiles.cerrarModal("axisage020");
        }
        
        function f_del_contacto(NORDEN){
            objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+document.miForm.CAGENTE.value+"&NORDEN="+NORDEN, "delete_contacto", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisage024(CTIPENTIDADASEG){
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
        
            objUtiles.abrirModal("axisage024", "src", "modal_axisage024.do?operation=init&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPENTIDADASEG="+CTIPENTIDADASEG);
        }
        
        function f_cerrar_axisage024() {
            objUtiles.cerrarModal("axisage024");
        }
        
        function f_del_entidadaseg(CTIPENTIDADASEG){
            var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+document.miForm.CAGENTE.value+"&PCTIPENTIDADASEG="+CTIPENTIDADASEG, "delete_entidadaseg", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
        
         function f_abrir_axisage026(CTIPBANCO){
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
        
            objUtiles.abrirModal("axisage026", "src", "modal_axisage026.do?operation=init&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPBANCO="+CTIPBANCO);
        }
        
        function f_cerrar_axisage026() {
            objUtiles.cerrarModal("axisage026");
        }
        
        function f_del_banco(CTIPBANCO){
            var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                     objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+document.miForm.CAGENTE.value+"&PCTIPBANCO="+CTIPBANCO, "delete_banco", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
        
        function f_abrir_axisage025(CTIPASOCIACION, NUMCOLEGIADO){
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
       
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            
            if (NUMCOLEGIADO == undefined)
            {              
                NUMCOLEGIADO = null;
            }           
            
        
            objUtiles.abrirModal("axisage025", "src", "modal_axisage025.do?operation=init&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPASOCIACION="+CTIPASOCIACION+"&NUMCOLEGIADO="+NUMCOLEGIADO);
        }
        
        function f_cerrar_axisage025() {
            objUtiles.cerrarModal("axisage025");
        }
        
        function f_del_asociacion(CTIPASOCIACION){
            var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+document.miForm.CAGENTE.value+"&PCTIPASOCIACION="+CTIPASOCIACION, "delete_asociacion", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
        
        function f_abrir_axisage027(NORDREFERENCIA, TREFERENCIA){
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
       
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            
            if (NORDREFERENCIA == undefined)
            {              
                NORDREFERENCIA = null;
            }           
            
            if (TREFERENCIA == undefined)
            {              
                TREFERENCIA = null;
            }           
            
        
            objUtiles.abrirModal("axisage027", "src", "modal_axisage027.do?operation=init&CAGENTE="+document.miForm.CAGENTE.value+"&NORDREFERENCIA="+NORDREFERENCIA+"&TREFERENCIA="+TREFERENCIA);
        }
        
        function f_cerrar_axisage027() {
            objUtiles.cerrarModal("axisage027");
        }
        
        function f_del_referencia(NORDREFERENCIA){
            var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                      objUtiles.ejecutarFormulario("axis_axisage003.do?PCAGENTE="+document.miForm.CAGENTE.value+"&PNORDREFERENCIA="+NORDREFERENCIA, "delete_referencia", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
        
        
        function f_but_1000615() { 
        
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            
            var agente = objDom.getValorPorId("CAGENTE");
            f_abrir_modal("axisage021", true, "&CAGENTE="+agente);
        }
        
        function f_modifdocum(IDDOCGEDOX){
            var agente = objDom.getValorPorId("CAGENTE");
            f_abrir_modal("axisage021", true, "&CAGENTE="+agente+"&IDDOCGEDOX="+IDDOCGEDOX);
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_aceptar_axisage021(){
            f_cerrar_modal("axisage021");
        }
        
        function f_abrir_axisage022() {
            var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            var selectedAgente = objDom.getValorPorId("CAGENTE");
            objUtiles.abrirModal("axisage022", "src", "modal_axisage022.do?operation=init&AXISMPRXXX=axisage022&CAGENTE="+selectedAgente);            
        }
        function f_aceptar_axisage022(selectedAgente){
            f_cerrar_modal("axisage022");
        }
        function f_cancelar_axisage022(){
            objUtiles.cerrarModal("axisage022");
        }
        
       function actualitzarCheckbox(obj){
         objDom.setValorPorId(obj.id, ((objDom.getComponenteMarcado(obj))? "1" : "0" ));
        }
                
         /* *******************************************  AXISAGE023 ************************************************* */
        
        function f_abrir_axisage023(NORDEN){
          var mensajesAlert = "";
            var grabarOK = ${__formdata.grabarOK == true};
            var isEdit   = ${__formdata.isEdit == true};
            
            if (!isEdit && !grabarOK) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>\n";
            }else if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE"))) {
                mensajesAlert += "<axis:alt f='axisage003' c='MENSAOK2' lit='9902726'/>";
            }

            if (!objUtiles.estaVacio(mensajesAlert)) {
                alert(mensajesAlert);
                return;
            }
            objUtiles.abrirModal("axisage023", "src", "modal_axisage023.do?operation=form&CAGENTE="+document.miForm.CAGENTE.value+"&NORDEN="+NORDEN);
        }
        
        function f_cerrar_axisage023() {
            objUtiles.cerrarModal("axisage023");
        }
        
        
        function f_borrar(CODIGO,FFIN){
              objUtiles.ejecutarFormulario("axis_axisage003.do?CODIGO="+CODIGO+"&FFIN="+FFIN, "delete_actor", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
          function f_abrir_axiscomi007(tipo){
                //alert(CCOMISI);
                var CCOMISI = '';
                if (tipo == 1)
                	CCOMISI = document.miForm.CCOMISI.value;
                    else if(tipo == 2)
                        CCOMISI = document.miForm.CCOMISI_INDIRECT.value;
                            else if(tipo == 3)
                                CCOMISI = document.miForm.CSOBRECOMISI.value;


					  if (objUtiles.estaVacio(CCOMISI)) {
					  	 	var mensajesAlert = "<axis:alt f='axisage003' c='MENSAKO' lit='9000848'/>";
                alert(mensajesAlert);
                return;
            }                     

                                
                                
              objUtiles.abrirModal("axiscomi007", "src", "modal_axiscomi007.do?operation=form&CCOMISI="+CCOMISI+"&CONSULTA=1");
            }
            
              function f_cerrar_axiscomi007(){  
                objUtiles.cerrarModal("axiscomi007");
            }
            
            function f_aceptar_axiscomi007(){  
                objUtiles.cerrarModal("axiscomi007");
            }
            
         function f_abrir_axisdesc007(){
                //alert(CDESC);
                
                  var CDESC = document.miForm.CDESC.value;
                  
                  
            if (objUtiles.estaVacio(CDESC)) {
					  	 	var mensajesAlert = "<axis:alt f='axisage003' c='MENSAKO' lit='9000848'/>";
                alert(mensajesAlert);
                return;
            }                     

                objUtiles.abrirModal("axisdesc007", "src", "modal_axisdesc007.do?operation=form&CDESC="+CDESC+"&CONSULTA=1");
            }
            
      
                        
                        
            function f_cerrar_axisdesc007(){  
                objUtiles.cerrarModal("axisdesc007");
            }    
            
               function f_aceptar_axisdesc007(){  
                objUtiles.cerrarModal("axisdesc007");
            }   
            
            //bug_27949 funcion para tratar los checkbox
            function f_guardar_clasesNegocio()
            {
								var grupo = document.forms[0].radioCATRIBU;
								var resul="";
								if (grupo != null )
								{
								   for (i = 0; lcheck = grupo[i]; i++) {
									   if (grupo[i].checked){
										    resul=resul+"1|"
								    	}
									  else{
										   resul=resul+"0|"}
							      	}
						        miForm.CCLANEG.value=resul.substring(0,resul.length-1);
						     }
        }
        
        function f_but_parametros(){
               
        }
        
        function f_cambia_activo(){
        	f_cargar_propiedades_pantalla();
        }
            
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="axis_axisage003.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage003" c="TITPANT" lit="102077"/></c:param>     <%--Mantenimiento de agentes --%>
            <c:param name="formulario"><axis:alt f="axisage003" c="TITPANT" lit="102077"/></c:param> <%--Mantenimiento de agentes --%>
            <c:param name="form">axisage003</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage003" c="TIT_007" lit="9908495" /></c:param>
            <c:param name="nid" value="axisage033" />
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage003" c="TIT_007" lit="9901311" /></c:param>
            <c:param name="nid" value="axiscomi007" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage006|<axis:alt f="axisage003" c="LIT_MOD_006" lit="9000713"/><%-- Bsqueda de Agentes --%></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage004|<axis:alt f="axisage003" c="MANTAGE" lit="9000709"/><%-- Mantenimiento de contratos de agente --%>#axisage005|<axis:alt f="axisage003" c="MANTCOMER" lit="9000712"/><%-- Mantenimiento red comercial --%>#axisper021|<axis:alt f="axisage003" c="BUSPERS" lit="1000065"/><%-- Buscador de personas --%>|#axisper022|<axis:alt f="axisage003" c="ALTPERS" lit="1000214"/><%-- Alta rpida de personas --%></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr014|<axis:alt f="axisage003" c="TIT_AXISCTR014" lit="1000234"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage014|<axis:alt f="axisage003" c="TIT_AXISAGE014" lit="9902555"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage015|<axis:alt f="axisage003" c="TIT_AXISAGE015" lit="9902556"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage016|<axis:alt f="axisage003" c="TIT_AXISAGE016" lit="9902558"/></c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage017|<axis:alt f="axisage003" c="TIT_AXISAGE017" lit="9902557"/></c:param>
        </c:import>
                <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage003" c="TIT_007" lit="9903508" /></c:param>
            <c:param name="nid" value="axisdesc007" />
        </c:import>
          <!-- bfp bug 21524 ini -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage023|axisage023</c:param>
        </c:import>
        <!-- bfp bug 21524 fi  -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage020|axisage020</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage021|axisage021</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage022|axisage022</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage024|axisage024</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage025|axisage025</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage026|axisage026</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage027|axisage027</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage006|<axis:alt f="axisage003" c="LIT_MOD_006" lit="9000713"/><%-- Bsqueda de Agentes --%></c:param>
        </c:import>  
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage003" c="LIT_1000216" lit="1000216" /></c:param>
            <c:param name="nid" value="axisper014" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisage028|axisage028</c:param>
        </c:import>
        

        
        <input type="hidden" name="operation" value=""/>        
        <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>        
        <input type="hidden" name="isBusca" id="isBusca" value="${__formdata.isBusca}"/>
        <input type="hidden" name="isEdit" id="isEdit" value="${__formdata.isEdit}"/>
        <input type="hidden" name="grabarOK" id="grabarOK" value="${__formdata.grabarOK}"/>     
        <%-- Campos que no estn en pantalla, pero que necesitaremos para grabar --%>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${!empty __formdata.SPERSON ? __formdata.SPERSON : __formdata.SPERSON}"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        <%-- CAGENTE_PERSONA necesario para saltar a AXISPER009 --%>
        <input type="hidden" name="CAGENTE_PERSONA" id="CAGENTE_PERSONA" value="${__formdata.CAGENTE_PERSONA}"/> 
        <input type="hidden" name="CODAGENTEAUT" id="CODAGENTEAUT" value="${__formdata.CODAGENTEAUT}"/>
        <input type="hidden" name="modAGE" id="modAGE" value="${__formdata.modAGE}"/>
        <input type="hidden" name="CTIPPER" id="CTIPPER" value="${__formdata.CTIPPER}"/>
        <input type="hidden" name="CCLANEG" id="CCLANEG" value="" />
        <c:set var="modoModificable" value="${true}"/>

        <table class="mainTableDimensions seccion base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>                    
                    <table class="area" align="center">                    
                        <tr>
			<%--  TCS_1569B - ACL - 01/02/2019 - Se ajusta width--%>  
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                        </tr>   
                        <tr>
                             <%-- Tipo agente --%>
                             <axis:ocultar f="axisage003" c="CTIPAGE" dejarHueco="false">
                            <td class="titulocaja" id="tit_CTIPAGE" >
                                <b><axis:alt f="axisage003" c="CTIPAGE" lit="9000519"/></b>
                            </td>
                            </axis:ocultar>
                            
                            <%-- Cdigo agente --%>
                            <axis:ocultar f="axisage003" c="CAGENTE" dejarHueco="false">
                            <td class="titulocaja" id="tit_CAGENTE" >
                                <b><axis:alt f="axisage003" c="CAGENTE" lit="9000531"/></b>      
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisage003" c="CTIPMED" dejarHueco="false">
                             <td class="titulocaja" id="tit_CTIPMED">
                                <b><axis:alt f="axisage003" c="CTIPMED" lit="9903395"></axis:alt></b>
                            </td>
                            </axis:ocultar>
                             <%-- TALIAS --%>
                            <axis:ocultar f="axisage003" c="TALIAS" dejarHueco="false">
                                <td class="titulocaja" id="tit_TALIAS" >
                                    <b><axis:alt f="axisage003" c="TALIAS" lit="9902438"/> </b>  
                                </td> 
                            </axis:ocultar>
							<%--  TCS_1 - ACL - 16/01/2019  --%>
							<%-- CLAVEINTER --%>
                            <axis:ocultar f="axisage003" c="CLAVEINTER" dejarHueco="false">
                                <td class="titulocaja" id="tit_CLAVEINTER" >
                                    <b><axis:alt f="axisage003" c="CLAVEINTER" lit="89906213"/> </b>  
                                </td> 
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- Tipo agente --%>
                            <axis:ocultar f="axisage003" c="CTIPAGE" dejarHueco="false">
                            <td class="campocaja" id="td_CTIPAGE" >
                                <select name="CTIPAGE" id="CTIPAGE" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                title="<axis:alt f="axisage003" c="CTIPAGE" lit="9000519"/>" alt="<axis:alt f="axisage003" c="CTIPAGE" lit="9000519"/>"
                                 onchange="f_recargar(this.value);" <axis:atr f="axisage003" c="CTIPAGE" a="obligatorio=true&isInputText=false"/>
                                 >
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPAGE == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                                <axis:ocultar f="axisage003" c="FINDCTIPAGE" dejarHueco="false">
                                <img border="0" src="images/find.gif" onclick="f_abrir_modal('axisage006', true)" style="cursor:pointer" id="icon_CERCAGEN"
                                    alt="<axis:alt f="axisage003" c="CERCAGEN" lit="9000713"/>" title="<axis:alt f="axisage003" c="CERCAGEN" lit="9000713"/>"/>  
                                </axis:ocultar>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisage003" c="CAGENTE" dejarHueco="false">
                            <td class="campocaja" id="td_CAGENTE" >
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${!empty __formdata.CAGENTE ? __formdata.CAGENTE : __formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" 
                                style="width:50%;" title="<axis:alt f="axisage003" c="CAGENTE" lit="9000531"/>" 
                                <c:if test="${__formdata.isEdit == 'true' || __formdata.CODAGENTEAUT == '1'}">readonly="readonly"</c:if>
                                <c:if test="${__formdata.isEdit != 'true' || __formdata.CODAGENTEAUT == '1'}">obligatorio="true"</c:if>
                                <axis:atr f="axisage003" c="CAGENTE" a="obligatorio=false"/>/>
                                <axis:ocultar f="axisage003" c="FINDCERCAGEN" dejarHueco="false">
                                <c:if test="${__formdata.isEdit != 'true' || __formdata.CODAGENTEAUT == '1'}">
                                    <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" id="icon_CERCAGEN"
                                    alt="<axis:alt f="axisage003" c="CERCAGEN" lit="9000713"/>" title="<axis:alt f="axisage003" c="CERCAGEN" lit="9000713"/>"/>                                
                                </c:if>
                                </axis:ocultar>
                              
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CTIPMED" dejarHueco="false">
                            <td class="campocaja"  id="td_CTIPMED" >
                                <select name="CTIPMED" id="CTIPMED" size="1" class="campowidthselect campo campotexto"
                                 <axis:atr f="axisage003" c="CTIPMED" a="obligatorio=false&isInputText=false"/> 
                                 	title="<axis:alt f="axisage003" c="CTIPMED" lit="9903395"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPMED}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPMED == element.CATRIBU}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CTIPMED == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU}  
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                             <%-- TALIAS --%>
                            <axis:ocultar f="axisage003" c="TALIAS" dejarHueco="false">
                                <td class="campocaja" id="td_TALIAS" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.TALIAS}" name="TALIAS" id="TALIAS" 
                                    style="width:78%;" title="<axis:alt f="axisage003" c="TALIAS" lit="9902438"/>"
                                    <axis:atr f="axisage003" c="TALIAS" a="obligatorio=false"/>/>
                                </td>  
                            </axis:ocultar>
							<%--  TCS_1 - ACL - 16/01/2019  --%>
							<%-- CLAVEINTER --%>
                            <axis:ocultar f="axisage003" c="CLAVEINTER" dejarHueco="false">
                                <td class="campocaja" id="td_CLAVEINTER" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.CLAVEINTER}" name="CLAVEINTER" id="CLAVEINTER" 
                                    style="width:78%;" title="<axis:alt f="axisage003" c="CLAVEINTER" lit="89906213"/>"
                                    <axis:atr f="axisage003" c="CLAVEINTER" a="obligatorio=false"/>/>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                             <%-- NIF --%>
                             <axis:ocultar f="axisage003" c="NNUMNIF" dejarHueco="false">
                             <td class="titulocaja" id="tit_NNUMNIF"  colspan="1">
                                <b><axis:alt f="axisage003" c="NNUMNIF" lit="9000760"></axis:alt></b>
                            </td>
                            </axis:ocultar> 
                            <axis:ocultar f="axisage003" c="NNUMNIF" dejarHueco="false">
                              <td class="titulocaja" id="tit_TNOMFISCAL"  colspan="1">
                                <b><axis:alt f="axisage003" c="TNOMFISCAL" lit="9910199"></axis:alt></b>
                              </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CDOMICI" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="tit_CDOMICI" >
                                <b><axis:alt f="axisage003" c="CDOMICI" lit="101078"/> </b>  
                            </td>                 
                            </axis:ocultar>
                            
							<axis:ocultar f="axisage003" c="CSUC_FAC" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="tit_CSUC_FAC" >
                                <b><axis:alt f="axisage003" c="CSUC_FAC" lit="89908083"/> </b>  
                            </td>                 
                            </axis:ocultar>  
							 
                            
                        </tr>
                         <tr>
                            <axis:ocultar f="axisage003" c="NNUMNIF" dejarHueco="false">
                            <td class="campocaja" id="td_NNUMNIF" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.NNIF}" name="NNIF" id="NNIF"                                 
                                style="width:40%;" title="<axis:alt f="axisage003" c="NNIF" lit="105904"/>" 
                                <axis:atr f="axisage003" c="NNUMNIF" a="modificable=false"/>/>
                                <c:if test="${!empty __formdata.SPERSON || !empty __formdata.SPERSON}">
                                    <axis:ocultar f="axisage003" c="MODIFPERS" dejarHueco="false">
                                    <img border="0" src="images/lapiz.gif" onclick="f_but_modificacion_persona()" style="cursor:pointer" id="icon_MODIFPERS"  
                                    alt="<axis:alt f="axisage003" c="MODIFPERS" lit="9001830"/>" title="<axis:alt f="axisage003" c="MODIFPERS" lit="9001830"/>"/>      
                                    </axis:ocultar>
                                </c:if>
                            </td>
                            </axis:ocultar>     
                            <axis:ocultar f="axisage003" c="NNUMNIF" dejarHueco="false">
                               <td class="campocaja" id="TNOMBRE" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto campodisabled" size="55" 
                                value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                style="width:78%;" title="<axis:alt f="axisage003" c="TNOMFISCAL" lit="9910199"/>" 
                                <axis:atr f="axisage003" c="TNOMBRE" a="modificable=false"/>/>
                               </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CDOMICI" dejarHueco="false">
                            <td class="campocaja" colspan="1" id="td_DOMIC" >
                                <select name="CDOMICI" id="CDOMICI" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                 <axis:atr f="axisage003" c="CDOMICI" a="obligatorio=true&isInputText=false"/> <%--  IAXIS-2415 27/02/2019  --%> 
                                 	title="<axis:alt f="axisage003" c="CDOMICI" lit="101078"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTDOMIPERSON}">
                                        <option value = "${element.CDOMICI}"
                                        <c:if test="${__formdata.CDOMICI == element.CDOMICI}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CDOMICI == element.CDOMICI}"> selected = "selected"</c:if>>
                                            ${element.TDOMICI} - ${element.CPOSTAL} - ${element.TPOBLAC}    
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
							
							<axis:ocultar f="axisage003" c="CSUC_FAC" dejarHueco="false">
                            <td class="campocaja" colspan="1" id="td_SUC_FAC" >
                                <select name="CSUC_FAC" id="CSUC_FAC" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                 <axis:atr f="axisage003" c="CSUC_FAC" a="obligatorio=true&isInputText=false"/>
                                 	title="<axis:alt f="axisage003" c="CSUC_FAC" lit="89908083"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTSUCURSALES}">
                                        <option value = "${element.CAGENTE}"
                                        <c:if test="${__formdata.CSUC_FAC == element.CAGENTE}"> selected = "selected"</c:if>>
                                            ${element.TAPELLI1} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                                                      
                        </tr>
                        <tr>
                             <%-- NIF --%>
                             
                               <axis:ocultar f="axisage003" c="FNACIMI" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="FNACIMI" >
                                <b id="label_FNACIMI"><axis:alt f="axisage003" c="FNACIMI" lit="1000064"/> </b>  
                            </td>                 
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisage003" c="TIDIOMA_AGENTE" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="tit_TIDIOMA_AGENTE" >
                                <b><axis:alt f="axisage003" c="TIDIOMA_AGENTE" lit="1000246"/> </b>  
                            </td>                 
                            </axis:ocultar>
                            
                             
                             <axis:ocultar f="axisage003" c="TNOMCOM" dejarHueco="false">
                             <td class="titulocaja" id="tit_TNOMCOM" colspan="1" >
                                <b><axis:alt f="axisage003" c="TNOMCOM" lit="9903471"></axis:alt></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CDOMCOM" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_CDOMCOM" >
                                <b><axis:alt f="axisage003" c="CDOMCOM" lit="9903472"/> </b>  
                            </td>                 
                            </axis:ocultar>
                            
                            <%-- POST-71 BJHB/PAY-TCS 16-06-2022 INICIO --%>
                            <axis:ocultar f="axisage003" c="CSUC_CAU" dejarHueco="false">
	                            <td class="titulocaja" colspan="1" id="tit_CSUC_CAU" >
	                                <b><axis:alt f="axisage003" c="CSUC_CAU" lit="89908175"/> </b>  
	                            </td>                 
                            </axis:ocultar>
                            <%-- POST-71 BJHB/PAY-TCS 16-06-2022 FIN --%>
                        </tr>
                         <tr>
                           <axis:ocultar f="axisage003" c="FNACIMI" dejarHueco="false">
                            <td class="campocaja" id="td_FNACIMI" colspan="1">                            
                             <input type="text" class="campowidthinput campo campotexto" size="15" readonly 
                             style="width:40%;" name="FECHA_NACIMI" id="FECHA_NACIMI"                                
                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FNACIMI}'/>"                                                                                                                        
                                <axis:atr f="axisage003" c="FNACIMI" a="formato=fecha"/>    
                                title="<axis:alt f='axisage003' c='FNACIMI' lit='1000064'/>" />                                                       
                            </td>
                            </axis:ocultar>
                         
                         <axis:ocultar f="axisage003" c="TIDIOMA_AGENTE" dejarHueco="false">
                            <td class="campocaja" id="td_TIDIOMA_AGENTE" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.TIDIOMA_AGENTE}" name="TIDIOMA_AGENTE" id="TIDIOMA_AGENTE" 
                                style="width:68%;" title="<axis:alt f="axisage003" c="TIDIOMA_AGENTE" lit="1000246"/>"/>                                                  
                            </td>
                            </axis:ocultar>
                         
                            <axis:ocultar f="axisage003" c="TNOMCOM" dejarHueco="false">
                            <td class="campocaja" id="td_TNOMCOM" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                value="${__formdata.TNOMCOM}" name="TNOMCOM" id="TNOMCOM" 
                                style="width:93%;" title="<axis:alt f="axisage003" c="TNOMCOM" lit="9903471"/>" 
                                <axis:atr f="axisage003" c="TNOMCOM" a="obligatorio=false"/>/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CDOMCOM" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CDOMCOM" >
                                <select name="CDOMCOM" id="CDOMCOM" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                 <axis:atr f="axisage003" c="CDOMCOM" a="obligatorio=false&isInputText=false"/> 
                                 	title="<axis:alt f="axisage003" c="CDOMCOM" lit="9903472"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTDOMIPERSON}">
                                        <option value = "${element.CDOMICI}"
                                        <c:if test="${__formdata.CDOMCOM == element.CDOMICI}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CDOMCOM == element.CDOMICI}"> selected = "selected"</c:if>>
                                            ${element.TDOMICI} - ${element.CPOSTAL} - ${element.TPOBLAC}    
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                            <%-- POST-71 BJHB/PAY-TCS 16-06-2022 INICIO --%>
                            <axis:ocultar f="axisage003" c="CSUC_CAU" dejarHueco="false">
                            <td class="campocaja" colspan="1" id="td_CSUC_CAU" >
                                <select name="CSUC_CAU" id="CSUC_CAU" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                 <axis:atr f="axisage003" c="CSUC_CAU" a="obligatorio=true&isInputText=false"/>
                                 	title="<axis:alt f="axisage003" c="CSUC_CAU" lit="89908083"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTSUCURSALES}">
                                        <option value = "${element.CAGENTE}"
                                        <c:if test="${__formdata.CSUC_CAU == element.CAGENTE}"> selected = "selected"</c:if>>
                                            ${element.TAPELLI1} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <%-- POST-71 BJHB/PAY-TCS 16-06-2022 FIN --%>
                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CACTIVO" dejarHueco="false">
                                <td class="titulocaja"  id="tit_CACTIVO" >
                                    <b><axis:alt f="axisage003" c="CACTIVO" lit="100587"/> </b>  
                                </td>  
                            </axis:ocultar>
                            <td></td>                       
                            <axis:ocultar f="axisage003" c="CTIPRETRIB" dejarHueco="false">
                            <td class="titulocaja"  id="tit_CTIPRETRIB" >
                                <b><axis:alt f="axisage003" c="CTIPRETRIB" lit="9903474"/> </b>  
                            </td>  
                            </axis:ocultar>
                           
                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CACTIVO" dejarHueco="false">
                            <td class="campocaja"  id="td_CACTIVO" >
                                <select name="CACTIVO" id="CACTIVO" onchange="f_cambia_activo()" size="1" class="campowidthselect campo campotexto" 
                                <axis:atr f="axisage003" c="CACTIVO" a="obligatorio=true&isInputText=false"/>
                                title="<axis:alt f="axisage003" c="CACTIVO" lit="100587"/>" alt="<axis:alt f="axisage003" c="CACTIVO" lit="100587"/>">&nbsp;
                                    <c:if test="${modoModificable && __formdata.isEdit == 'true'}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADOAGENTE}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.isEdit != 'true' || empty __formdata.CACTIVO}">
                                            <c:if test="${1 == element.CATRIBU}"> selected = "selected"</c:if> 
                                        </c:if>
                                        <c:if test="${__formdata.isEdit == 'true' || !empty __formdata.CACTIVO}">
                                            <c:if test="${__formdata.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if>                                                
                                            <c:if test="${__formdata.CACTIVO == element.CATRIBU}"> selected = "selected"</c:if>                                                                                            
                                        </c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                                

                            </td>
                            </axis:ocultar>
                            <td></td>
                            <axis:ocultar f="axisage003" c="CTIPRETRIB" dejarHueco="false">
                            <td class="campocaja"  id="td_CTIPRETRIB" >
                                <select name="CTIPRETRIB" id="CTIPRETRIB" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                	 title="<axis:alt f="axisage003" c="CTIPRETRIB" lit="9903474"/>" 
                                <axis:atr f="axisage003" c="CTIPRETRIB" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPRETRIB}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CTIPRETRIB == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        
                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="AGRUPADOR" dejarHueco="false">
                            <td class="titulocaja"  id="tit_AGRUPADOR" >
                                <b><axis:alt f="axisage003" c="AGRUPADOR" lit="9903475"/> </b>  
                            </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="AGRUPADOR" dejarHueco="false">
                                <td class="campocaja" id="td_AGRUPADOR" colspan="2">
                                <select name="AGRUPADOR" id="AGRUPADOR" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                	title="<axis:alt f="axisage003" c="AGRUPADOR" lit="9903475"/>" 
                                <axis:atr f="axisage003" c="AGRUPADOR" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGRUPADOR}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.AGRUPADOR == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CACTIVIDAD" dejarHueco="false">
                            <td class="titulocaja"  id="tit_CACTIVIDAD" >
                                <b><axis:alt f="axisage003" c="CACTIVIDAD" lit="9903476"/> </b>  
                            </td>  
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="NCOLEGI" dejarHueco="false">
                            <td class="titulocaja"  id="tit_NCOLEGI" >
                                <b><axis:alt f="axisage003" c="NCOLEGI" lit="9000534"/> </b>
                            </td>             
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisage003" c="CBLOQUEO" dejarHueco="false">
                            <td class="titulocaja"  id="tit_CBLOQUEO" >
                                <b><axis:alt f="axisage003" c="CBLOQUEO" lit="9903479"/> </b>
                            </td>             
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CACTIVIDAD" dejarHueco="false">
                            <td class="campocaja"  id="td_CACTIVIDAD" >
                                <select name="CACTIVIDAD" id="CACTIVIDAD" size="1" class="campowidthselect campo campotexto"
                                		title="<axis:alt f="axisage003" c="CACTIVIDAD" lit="9903476"/>" 
                                <axis:atr f="axisage003" c="CACTIVIDAD" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCACTPRINCIPAL}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CACTIVIDAD == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="NCOLEGI" dejarHueco="false">
                            <td class="campocaja"  id="td_NCOLEGI" >
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="${!empty __formdata.NCOLEGI ? __formdata.NCOLEGI : __formdata.NCOLEGI}" name="NCOLEGI" id="NCOLEGI"
                                title="<axis:alt f='axisage003' c='NCOLEGI' lit='9000534'/>"
                                <axis:atr f="axisage003" c="NCOLEGI" a="obligatorio=false"/> <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CBLOQUEO" dejarHueco="false">
                            <td class="campocaja"  id="td_CBLOQUEO" >
                                <select name="CBLOQUEO" id="CBLOQUEO" size="1" class="campowidthselect campo campotexto"
                                		title="<axis:alt f="axisage003" c="CBLOQUEO" lit="9903479"/>" 
                                <axis:atr f="axisage003" c="CBLOQUEO" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCBLOQUEO}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CBLOQUEO == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                         <axis:visible c="TAGENTE_DELEGACIO" f="axisage003">
                            <td class="titulocaja"  id="tit_TAGENTE_DELEGACIO">
                                <b id="label_TAGENTE_DELEGACIO"><axis:alt f="axisage003" c="TAGENTE_DELEGACIO" lit="1000561"/></b>   
                            </td>
                            </axis:visible>
                            <axis:visible c="TAGENTE_EJCOMERCIAL" f="axisage003">
                            <td class="titulocaja"  id="tit_TAGENTE_EJCOMERCIAL">
                                <b id="label_TAGENTE_EJCOMERCIAL"><axis:alt f="axisage003" c="TAGENTE_EJCOMERCIAL" lit="9903913"/></b>   
                            </td>
                            </axis:visible>
                            <axis:visible c="FBAJAGE" f="axisage003">
                            <td class="titulocaja"  id="tit_FBAJAGE">
                                <b id="label_FBAJAGE"><axis:alt f="axisage003" c="FBAJAGE" lit="9001510"/></b>   
                            </td>
                            </axis:visible>
                            <axis:ocultar f="axisage003" c="CMOTBAJA" dejarHueco="false">
                            <td class="titulocaja"  id="tit_CMOTBAJA" >
                                <b><axis:alt f="axisage003" c="CMOTBAJA" lit="9903478"/></b>   
                            </td>
                            </axis:ocultar>
                            
                        </tr>
                        <tr>
                         <axis:visible c="TAGENTE_DELEGACIO" f="axisage003" >
                        <td class="campocaja"  id="td_TAGENTE_DELEGACIO" >
                            
                                  <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.TAGENTE_DELEGACIO}" name="TAGENTE_DELEGACIO" id="TAGENTE_DELEGACIO" 
                                style="width:95%;" title="<axis:alt f="axisage003" c="TAGENTE_DELEGACIO" lit="1000561"/>"/>                                    
                           </td>
                           </axis:visible>
                           <axis:visible c="TAGENTE_EJCOMERCIAL" f="axisage003" >
                            <td class="campocaja"  id="td_TAGENTE_EJCOMERCIAL" >
                               <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.TAGENTE_EJCOMERCIAL}" name="TAGENTE_EJCOMERCIAL" id="TAGENTE_EJCOMERCIAL" 
                                style="width:95%;" title="<axis:alt f="axisage003" c="TAGENTE_EJCOMERCIAL" lit="9903913"/>"/>                                    
                           </td>
                           </axis:visible>
                            <axis:ocultar f="axisage003" c="FBAJAGE" dejarHueco="false">
                                <td class="campocaja" id="td_FBAJAGE" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FBAJAGE}"/>"  <axis:atr f="axisage003" c="FBAJAGE" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FBAJAGE}"> value="${__formdata.FBAJAGE}"</c:if>
                                    name="FBAJAGE" id="FBAJAGE"
                                    title="<axis:alt f='axisage003' c='FBAJAGE' lit='9001510'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FBAJAGE" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FBAJAGE" alt="<axis:alt f="axisage003" c="FBAJAGE" lit="9001510"/>" title="<axis:alt f="axisage003" c="FBAJAGE" lit="9001510" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="CMOTBAJA" dejarHueco="false">
                            <td class="campocaja"  id="td_CMOTBAJA" >
                                <select name="CMOTBAJA" id="CMOTBAJA" size="1" class="campowidthselect campo campotexto" style="width:85%;"
                                	title="<axis:alt f="axisage003" c="CMOTBAJA" lit="9903478"/>"
                                <axis:atr f="axisage003" c="CMOTBAJA" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCMOTBAJA}">
                                    <option value = "${element.CATRIBU}"
                                         <c:if test="${__formdata.CMOTBAJA == element.CATRIBU}"> selected = "selected"</c:if>>
                                        ${element.TATRIBU}
                                    </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CBANCAR_FIN" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="tit_CBANCAR_FIN" >
                                    <b><axis:alt f="axisage003" c="CBANCAR_FIN" lit="100965"/></b>   
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="COBLCCC" dejarHueco="false">
                                <td class="titulocaja" id="tit_COBLCCC" >
                                    <b><axis:alt f="axisage003" c="COBLCCC" lit="9904217"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                        
                            <axis:ocultar f="axisage003" c="CBANCAR_FIN" dejarHueco="false">
                                <td class="campocaja" colspan="2" id="td_CBANCAR_FIN" >
                                    <axis:encryptflag f="axisage003" c="CBANCAR_FIN" />
                                    <select name="CBANCAR_FIN" id="CBANCAR_FIN" size="1" class="campowidthselect campo campotexto" 
                                            style="width:79%;" title="<axis:alt f="axisage003" c="CBANCAR_FIN" lit="100965"/>"
                                            <axis:atr f="axisage003" c="CBANCAR_FIN" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                            <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                            <c:forEach var="element" items="${__formdata.CCC}">
                                                <option value = "<axis:encrypt f="axisage003" c="CBANCAR_FIN" value="${element.OB_IAX_CCC.CBANCAR}" />@@${element.OB_IAX_CCC.CTIPBAN}" 
                                                    <c:if test="${__formdata.CBANCAR_FIN == element.OB_IAX_CCC.CBANCAR ||__formdata.CBANCAR == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                                    <axis:masc f="axisage003" c="CBANCAR_FIN" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />                                               
                                                </option>
                                            </c:forEach>
                                    </select>
                                    <axis:ocultar f="axisage003" c="MODIFCBANC" dejarHueco="false">
                                        <img border="0" src="images/lapiz.gif" onclick="f_abrir_axisper014(${__formdata.SPERSON})" style="cursor:pointer" 
                                            alt="<axis:alt f="axisage003" c="MODIFCBANC" lit="100965"/>" title="<axis:alt f="axisage003" c="MODIFCBANC" lit="100965"/>"/>      
                                    </axis:ocultar>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="COBLCCC" dejarHueco="false">
                                <td class="campocaja"  id="td_COBLCCC" >
                                      <%--input type="checkbox" name="COBLCCC" id="COBLCCC" onclick="actualitzarCheckbox(this)"
                                            title="<axis:alt f="axisage003" c="COBLCCC" lit="9904217"/>"   
                                            <c:if test="${empty __formdata.COBLCCC ||  __formdata.COBLCCC == 1}">checked</c:if> value="${__formdata.COBLCCC}"  
                                            <axis:atr f="axisage003" c="COBLCCC" a="modificable=true&isInputText=false"/>/--%>
                                            	<c:set var="miCOBLCCC">xxx${__formdata.COBLCCC}</c:set>
																			
                                      <input type="checkbox" name="COBLCCC" id="COBLCCC" onclick="actualitzarCheckbox(this)" 
                                            title="<axis:alt f="axisage003" c="COBLCCC" lit="9904217"/>"   
                                             value="${__formdata.COBLCCC}"  
                                             <c:if test="${miCOBLCCC=='xxx1' || miCOBLCCC=='xxx'}">checked</c:if>
                                            <axis:atr f="axisage003" c="COBLCCC" a="modificable=true&isInputText=false"/>/> 
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- Comisin --%>
                            <axis:ocultar f="axisage003" c="CCOMISI" dejarHueco="false">
                                <td class="titulocaja"  colspan = "2" id="tit_CCOMISI" >
                                    <b><axis:alt f="axisage003" c="CCOMISI" lit="101509"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage003" c="FINIVIGCOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGCOM" >
                                    <b><axis:alt f="axisage003" c="FINIVIGCOM" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            
                            <%-- FFINVIGCOM --%>
                            <%--axis:ocultar f="axisage003" c="FFINVIGCOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FFINVIGCOM" >
                                    <b><axis:alt f="axisage003" c="FFINVIGCOM" lit="9000717"/> </b>  
                                </td> 
                            </axis:ocultar--%>
                        </tr>

                        <tr>
                            <%-- Comisin --%>
                            <axis:ocultar f="axisage003" c="CCOMISI" dejarHueco="false">
                                <td class="campocaja"  colspan = "2" id="td_CCOMISI" >
                                    <select name="CCOMISI" id="CCOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;"  onchange="f_actualizar_dates(1);"
                                    title="<axis:alt f="axisage003" c="CCOMISI" lit="101509"/>" alt="<axis:alt f="axisage003" c="CCOMISI" lit="101509"/>"
                                    <axis:atr f="axisage003" c="CCOMISI" a="obligatorio=true&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGECOMISION}">
                                            <option value = "${element.CCOMISI}"
                                            <c:if test="${__formdata.CCOMISI == element.CCOMISI}"> selected = "selected"</c:if>>
                                                ${element.TCOMISI} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <axis:ocultar f="axisage003" c="BTN_HISCOMISI" dejarHueco="false">
                                    <c:if test="${__formdata.isEdit == 'true'}">
                                    <img id="BTN_HISCOMISI" alt="<axis:alt f="axisage003" c="icon_CCOMISI" lit="9902558"/>"
                                         title="<axis:alt f="axisage003" c="BTN_HISCOMISI" lit="9902558" />" src="images/informacion.gif"
                                         onclick="f_abrir_axisage016(1,0)" style="cursor:pointer" />
                                    </c:if>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisage003" c="BTN_DETCOMISI" dejarHueco="false">
                                   
                                  		   <img id="BTN_DETCCOMISI" alt="<axis:alt f="axisage003" c="icon_DETCCOMISI" lit="1000113"/>"
                                         title="<axis:alt f="axisage003" c="icon_DETCCOMISI" lit="1000113" />" src="images/mas.gif"
                                         onclick="f_abrir_axiscomi007(1)" style="cursor:pointer" />
                                    
                                     </axis:ocultar>     
                                    
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage003" c="FINIVIGCOM" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGCOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGCOM}"/>"  <axis:atr f="axisage003" c="FINIVIGCOM" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FINIVIGCOM}"> value="${__formdata.FINIVIGCOM}"</c:if>
                                    name="FINIVIGCOM" id="FINIVIGCOM"
                                    title="<axis:alt f="axisage003" c="CCOMISI" lit="101509"/> - <axis:alt f='axisage003' c='FINIVIGCOM' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FINIVIGCOM" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FINIVIGCOM" alt="<axis:alt f="axisage003" c="FINIVIGCOM" lit="9000716"/>" title="<axis:alt f="axisage003" c="FINIVIGCOM" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            
                             <%--axis:ocultar f="axisage003" c="FFINVIGCOM" dejarHueco="false">
                                <td class="campocaja" id="td_FFINVIGCOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIGCOM}"/>"  <axis:atr f="axisage003" c="FFINVIGCOM" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FFINVIGCOM}"> value="${__formdata.FFINVIGCOM}"</c:if>
                                    name="FFINVIGCOM" id="FFINVIGCOM"
                                    title="<axis:alt f='axisage003' c='FFINVIGCOM' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FFINVIGCOM" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FFINVIGCOM" alt="<axis:alt f="axisage003" c="FFINVIGCOM" lit="9000716"/>" title="<axis:alt f="axisage003" c="FFINVIGCOM" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar--%>
                        </tr>
                        
                        <%-- Inici BFP bug 20999 25/01/2012 Comisin Indirecta --%>
                        <axis:ocultar f="axisage003" c="BLOC_COMISIO_INDIRECTA" dejarHueco="false">
                        <tr>
                            <axis:ocultar f="axisage003" c="CCOMISI_INDIRECT" dejarHueco="false">
                                <td class="titulocaja"  colspan = "2" id="tit_CCOMISI_INDIRECT" >
                                    <b><axis:alt f="axisage003" c="CCOMISI_INDIRECT" lit="9902599"/></b>   
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="FINIVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGCOM_INDIRECT" >
                                    <b><axis:alt f="axisage003" c="FINIVIGCOM_INDIRECT" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            
                              <%--axis:ocultar f="axisage003" c="FFINVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="titulocaja" id="tit_FFINVIGCOM_INDIRECT" >
                                    <b><axis:alt f="axisage003" c="FFINVIGCOM_INDIRECT" lit="9000717"/> </b>  
                                </td> 
                            </axis:ocultar--%>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CCOMISI_INDIRECT" dejarHueco="false">
                                <td class="campocaja"  colspan = "2" id="td_CCOMISI_INDIRECT" >
                                    <select name="CCOMISI_INDIRECT" id="CCOMISI_INDIRECT" size="1" class="campowidthselect campo campotexto" style="width:79%;" onchange="f_actualizar_dates(3);"
                                    title="<axis:alt f="axisage003" c="CCOMISI_INDIRECT" lit="9902599"/>" alt="<axis:alt f="axisage003" c="CCOMISI_INDIRECT" lit="101509"/>"
                                    <axis:atr f="axisage003" c="CCOMISI_INDIRECT" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGECOMISION}">
                                            <option value = "${element.CCOMISI}"
                                            <c:if test="${__formdata.CCOMISI_INDIRECT == element.CCOMISI}"> selected = "selected"</c:if> >
                                                ${element.TCOMISI} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <axis:ocultar f="axisage003" c="BTN_HISCOMISI_INDIRECT" dejarHueco="false">
                                    <c:if test="${__formdata.isEdit == 'true'}">
                                    <img id="BTN_HISCOMISI_INDIRECT" alt="<axis:alt f="axisage003" c="icon_CCOMISI_INDIRECT" lit="9902558"/>"
                                         title="<axis:alt f="axisage003" c="BTN_HISCOMISI_INDIRECT" lit="9902558" />" src="images/informacion.gif"
                                         onclick="f_abrir_axisage016(1,1)" style="cursor:pointer" />
                                    </c:if>
                                    </axis:ocultar>
                                      <axis:ocultar f="axisage003" c="BTN_DETCOMISI_INDIRECT" dejarHueco="false">
                                   
                                      <img id="BTN_DETCOMISI_INDIRECT" alt="<axis:alt f="axisage003" c="icon_DETCOMISI_INDIRECT" lit="1000113"/>"
                                         title="<axis:alt f="axisage003" c="BTN_DETCOMISI_INDIRECT" lit="1000113" />" src="images/mas.gif"
                                         onclick="f_abrir_axiscomi007(2)" style="cursor:pointer" />
                                       </axis:ocultar>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="FINIVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGCOM_INDIRECT" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGCOM_INDIRECT}"/>"  <axis:atr f="axisage003" c="FINIVIGCOM_INDIRECT" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FINIVIGCOM_INDIRECT}"> value="${__formdata.FINIVIGCOM_INDIRECT}"</c:if>
                                    name="FINIVIGCOM_INDIRECT" id="FINIVIGCOM_INDIRECT"
                                    title="<axis:alt f="axisage003" c="CCOMISI_INDIRECT" lit="9902599"/> - <axis:alt f='axisage003' c='FINIVIGCOM_INDIRECT' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FINIVIGCOM_INDIRECT" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img 
                                    id="icon_FINIVIGCOM_INDIRECT" alt="<axis:alt f="axisage003" c="FINIVIGCOM_INDIRECT" lit="9000716"/>" title="<axis:alt f="axisage003" c="FINIVIGCOM_INDIRECT" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                             <%--axis:ocultar f="axisage003" c="FFINVIGCOM_INDIRECT" dejarHueco="false">
                                <td class="campocaja" id="td_FFINVIGCOM_INDIRECT" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIGCOM_INDIRECT}"/>"  <axis:atr f="axisage003" c="FFINVIGCOM_INDIRECT" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FFINVIGCOM_INDIRECT}"> value="${__formdata.FFINVIGCOM_INDIRECT}"</c:if>
                                    name="FFINVIGCOM_INDIRECT" id="FFINVIGCOM_INDIRECT"
                                    title="<axis:alt f='axisage003' c='FFINVIGCOM_INDIRECT' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FFINVIGCOM_INDIRECT" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img 
                                    id="icon_FFINVIGCOM_INDIRECT" alt="<axis:alt f="axisage003" c="FFINVIGCOM_INDIRECT" lit="9000716"/>" title="<axis:alt f="axisage003" c="FFINVIGCOM_INDIRECT" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar--%>
                        </tr>
                        </axis:ocultar>
                        <%-- Fi BFP bug 20999 25/01/2012 Comisin Indirecta --%>
                        <tr>
                            <%-- CSOBRECOMISI --%>
                            <axis:ocultar f="axisage003" c="CSOBRECOMISI" dejarHueco="false">
                                <td class="titulocaja" colspan = "2" id="tit_CSOBRECOMISI" >
                                    <b><axis:alt f="axisage003" c="CSOBRECOMISI" lit="9901178"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGSOBRECOM --%>
                            <axis:ocultar f="axisage003" c="FINIVIGSOBRECOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGSOBRECOM" >
                                    <b><axis:alt f="axisage003" c="FINIVIGSOBRECOM" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            <%-- FFINVIGSOBRECOM --%>
                            <axis:ocultar f="axisage003" c="FFINVIGSOBRECOM" dejarHueco="false">
                                <td class="titulocaja" id="tit_FFINVIGSOBRECOM" >
                                    <b><axis:alt f="axisage003" c="FFINVIGSOBRECOM" lit="9000717"/> </b>  
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- CSOBRECOMISI--%>
                            <axis:ocultar f="axisage003" c="CSOBRECOMISI" dejarHueco="false"> 
                                <td class="campocaja"  colspan = "2" id="td_CSOBRECOMISI" >
                                    <select name="CSOBRECOMISI" id="CSOBRECOMISI" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                    <axis:atr f="axisage003" c="CSOBRECOMISI" a="obligatorio=false&isInputText=false"/> onchange="f_actualizar_dates(2);"
                                    	title="<axis:alt f='axisage003' c='CSOBRECOMISI' lit='9901178'/>">
                                        <c:if test="${modoModificable}"><option value=""> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGESOBRECOMISION}">
                                            <option value = "${element.CCOMISI}"
                                            <c:if test="${__formdata.CSOBRECOMISI == element.CCOMISI}"> selected = "selected"</c:if> >
                                                ${element.TCOMISI}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <axis:ocultar f="axisage003" c="BTN_HISSOBRECOMISI" dejarHueco="false">
                                     <c:if test="${__formdata.isEdit == 'true'}">
                                     <img id="icon_CSOBRECOMISI" alt="<axis:alt f="axisage003" c="icon_CSOBRECOMISI" lit="9901178"/>"
                                         title="<axis:alt f="axisage003" c="icon_CSOBRECOMISI" lit="9901178" />" src="images/informacion.gif"
                                         onclick="f_abrir_axisage016(2,0)" style="cursor:pointer" />
                                    </c:if>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisage003" c="BTN_DETSOBRECOMISI" dejarHueco="false">
                                   
                                      <img id="BTN_DETSOBRECOMISI" alt="<axis:alt f="axisage003" c="icon_CCOMISI_DETSOBRECOMISI" lit="1000113"/>"
                                         title="<axis:alt f="axisage003" c="BTN_DETSOBRECOMISI" lit="1000113" />" src="images/mas.gif"
                                         onclick="f_abrir_axiscomi007(3)" style="cursor:pointer" />
                                     </axis:ocultar>
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGSOBRECOM --%>
                            <axis:ocultar f="axisage003" c="FINIVIGSOBRECOM" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGSOBRECOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" name="FINIVIGSOBRECOM" id="FINIVIGSOBRECOM" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGSOBRECOM}"/>" 
                                    <c:if test="${!empty __formdata.FINIVIGSOBRECOM}"> value="${__formdata.FINIVIGSOBRECOM}"</c:if>
                                     <axis:atr f="axisage003" c="FINIVIGSOBRECOM" a="formato=fecha&obligatorio=false"/>
                                    title="<axis:alt f='axisage003' c='CSOBRECOMISI' lit='9901178'/> - <axis:alt f='axisage003' c='FINIVIGSOBRECOM' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img id="icon_FINIVIGSOBRECOM" alt="<axis:alt f="axisage003" c="FINIVIGSOBRECOM" lit="9000716"/>" title="<axis:alt f="axisage003" c="FINIVIGSOBRECOM" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            <%-- FFINVIGSOBRECOM --%>
                            <axis:ocultar f="axisage003" c="FFINVIGSOBRECOM" dejarHueco="false">
                                <td class="campocaja" id="td_FFINVIGSOBRECOM" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" name="FFINVIGSOBRECOM" id="FFINVIGSOBRECOM"
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIGSOBRECOM}"/>" 
                                    <c:if test="${!empty __formdata.FFINVIGSOBRECOM}"> value="${__formdata.FFINVIGSOBRECOM}"</c:if>
                                     <axis:atr f="axisage003" c="FFINVIGSOBRECOM" a="formato=fecha&obligatorio=false"/>
                                    title="<axis:alt f="axisage003" c="CSOBRECOMISI" lit="9901178"/> - <axis:alt f='axisage003' c='CSOBRECOMISI' lit='9901178'/> - <axis:alt f='axisage003' c='FFINVIGSOBRECOM' lit='9000717'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FFINVIGSOBRECOM" alt="<axis:alt f="axisage003" c="FFINVIGSOBRECOM" lit="9000717"/>" title="<axis:alt f="axisage003" c="FFINVIGSOBRECOM" lit="9000717" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- Comisin --%>
                            <axis:ocultar f="axisage003" c="CDESC" dejarHueco="false">
                                <td class="titulocaja"  colspan = "2" id="tit_CDESC" >
                                    <b><axis:alt f="axisage003" c="CDESC" lit="9903807"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage003" c="FINIVIGDESC" dejarHueco="false">
                                <td class="titulocaja" id="tit_FINIVIGDESC" >
                                    <b><axis:alt f="axisage003" c="FINIVIGDESC" lit="9000716"/> </b>  
                                </td> 
                            </axis:ocultar>
                            
                            <%-- FINIVIGCOM --%>
                            <axis:ocultar f="axisage003" c="FFINVIGDESC" dejarHueco="false">
                                <td class="titulocaja" id="tit_FFINVIGDESC" >
                                    <b><axis:alt f="axisage003" c="FFINVIGDESC" lit="9000717"/> </b>  
                                </td> 
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- Descuento --%>
                            <axis:ocultar f="axisage003" c="CDESC" dejarHueco="false">
                                <td class="campocaja"  colspan = "2" id="td_CDESC" >
                                    <select name="CDESC" id="CDESC" size="1" class="campowidthselect campo campotexto" style="width:79%;"  onchange="f_actualizar_dates_desc();"
                                    title="<axis:alt f="axisage003" c="CDESC" lit="9903807"/>" alt="<axis:alt f="axisage003" c="CDESC" lit="9903807"/>"
                                    <axis:atr f="axisage003" c="CDESC" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTAGEDESCUENTO}">
                                            <option value = "${element.CDESC}"
                                            <c:if test="${__formdata.CDESC == element.CDESC}"> selected = "selected"</c:if>>
                                                ${element.TDESC} 
                                            </option>
                                        </c:forEach>
                                    </select>   
                                          <axis:ocultar f="axisage003" c="BTN_DETDESC" dejarHueco="false">
                                                                
                                      <img id="BTN_DETDESC" alt="<axis:alt f="axisage003" c="icon_DETDESC" lit="1000113"/>"
                                         title="<axis:alt f="axisage003" c="BTN_DETDESC" lit="1000113" />" src="images/mas.gif"
                                         onclick="f_abrir_axisdesc007()" style="cursor:pointer" />
                                          </axis:ocultar> 
                                </td>
                            </axis:ocultar> 
                            <%-- FINIVIGDESC --%>
                            <axis:ocultar f="axisage003" c="FINIVIGDESC" dejarHueco="false">
                                <td class="campocaja" id="td_FINIVIGDESC" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIGDESC}"/>"  <axis:atr f="axisage003" c="FINIVIGDESC" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FINIVIGDESC}"> value="${__formdata.FINIVIGDESC}"</c:if>
                                    name="FINIVIGDESC" id="FINIVIGDESC"
                                    title="<axis:alt f='axisage003' c='FINIVIGDESC' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FINIVIGDESC" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FINIVIGDESC" alt="<axis:alt f="axisage003" c="FINIVIGDESC" lit="9000716"/>" title="<axis:alt f="axisage003" c="FINIVIGDESC" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            
                              <%-- FFINVIGDESC --%>
                            <axis:ocultar f="axisage003" c="FFINVIGDESC" dejarHueco="false">
                                <td class="campocaja" id="td_FFINVIGDESC" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIGDESC}"/>"  <axis:atr f="axisage003" c="FFINVIGDESC" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FFINVIGDESC}"> value="${__formdata.FFINVIGDESC}"</c:if>
                                    name="FFINVIGDESC" id="FFINVIGDESC"
                                    title="<axis:alt f='axisage003' c='FFINVIGDESC' lit='9000716'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FFINVIGDESC" a="obligatorio=false"/>/>
                                    <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FFINVIGDESC" alt="<axis:alt f="axisage003" c="FFINVIGDESC" lit="9000716"/>" title="<axis:alt f="axisage003" c="FFINVIGDESC" lit="9000716" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            
                        </tr>
                        
                        <tr>
                            <axis:ocultar f="axisage003" c="CTIPIVA" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_CTIPIVA" >
                                <b><axis:alt f="axisage003" c="CTIPIVA" lit="101340"/></b>   
                            </td>
                             </axis:ocultar>
                             <axis:ocultar f="axisage003" c="CRETENC" dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_CRETENC" >
                                <b><axis:alt f="axisage003" c="CRETENC" lit="101714"/> </b>  
                            </td>                 
                            </axis:ocultar>
                            
                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CTIPIVA" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CTIPIVA" >
                                <select name="CTIPIVA" id="CTIPIVA" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                <axis:atr f="axisage003" c="CTIPIVA" a="obligatorio=true&isInputText=false"/> 
                                title="<axis:alt f="axisage003" c="CTIPIVA" lit="101340"/>" alt="<axis:alt f="axisage003" c="CTIPIVA" lit="101340"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOIVA}">
                                        <option value = "${element.CTIPIVA}"
                                        <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CTIPIVA == element.CTIPIVA}"> selected = "selected"</c:if>>
                                            ${element.TTIPIVA} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            
                            
                            
                            <axis:ocultar f="axisage003" c="CRETENC" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CRETENC" >
                             <c:if test="${__configform.axisage003__CRETENC_FIN__visible!='true'}">
                                <select name="CRETENC" id="CRETENC" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                <axis:atr f="axisage003" c="CRETENC" a="obligatorio=true&isInputText=false"/> 
                                title="<axis:alt f="axisage003" c="CRETENC" lit="101714"/>" alt="<axis:alt f="axisage003" c="CRETENC" lit="101714"/>">&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRETENCION}">
                                        <option value = "${element.CRETENC}"
                                        <c:if test="${__formdata.CRETENC == element.CRETENC}"> selected = "selected"</c:if> 
                                        <c:if test="${__formdata.CRETENC == element.CRETENC}"> selected = "selected"</c:if>>
                                            ${element.TTIPRET} 
                                        </option>
                                    </c:forEach>
                                </select>
                            	</c:if>
                            </td>
                            </axis:ocultar>
                        </tr>
			<%--  TCS_1569B - ACL - 01/02/2019 - Se agregan los campos de impuestos --%> 
                        <tr>
                            <axis:ocultar f="axisage003" c="CDESCRIIVA" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="tit_CDESCRIIVA" >
                                <b><axis:alt f="axisage003" c="CDESCRIIVA" lit="9903552"/></b>   
                            </td>
                             </axis:ocultar>
                             <axis:ocultar f="axisage003" c="DESCRICRETENC" dejarHueco="false">
                             <td class="titulocaja" colspan="1" id="tit_DESCRICRETENC" >
                                <b><axis:alt f="axisage003" c="DESCRICRETENC" lit="9901180"/> </b>
                            </td>                 
                            </axis:ocultar>   
                            <axis:ocultar f="axisage003" c="DESCRIFUENTE" dejarHueco="false">
                            <td class="titulocaja" colspan="1" id="tit_DESCRIFUENTE" >
                                <b><axis:alt f="axisage003" c="DESCRIFUENTE" lit="9909383"/></b>   
                            </td>
                             </axis:ocultar>  
                        </tr>
                        
                        <tr>                            
                            <axis:ocultar f="axisage003" c="CDESCRIIVA" dejarHueco="false">
                            <td class="campocaja" id="td_CDESCRIIVA" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.CDESCRIIVA}" name="CDESCRIIVA" id="CDESCRIIVA" 
                                style="width:100%;" title="<axis:alt f="axisage003" c="CDESCRIIVA" lit="9903552"/>"/>                                                  
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="DESCRICRETENC" dejarHueco="false">
                            <td class="campocaja" id="td_DESCRICRETENC" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.DESCRICRETENC}" name="DESCRICRETENC" id="DESCRICRETENC" 
                                style="width:100%;" title="<axis:alt f="axisage003" c="DESCRICRETENC" lit="9909383"/>"/>                                                  
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="DESCRIFUENTE" dejarHueco="false">
                            <td class="campocaja" id="td_DESCRIFUENTE" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" readonly
                                value="${__formdata.DESCRIFUENTE}" name="DESCRIFUENTE" id="DESCRIFUENTE" 
                                style="width:100%;" title="<axis:alt f="axisage003" c="DESCRIFUENTE" lit="9901180"/>"/>                                                  
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisage003" c="CBANCAR" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_CBANCAR" >
                                <b><axis:alt f="axisage003" c="CBANCAR" lit="100965"/></b>   
                            </td>
                            </axis:ocultar>
                            
			    <%-- BUG 27949 Aadir campo Cuenta Gestin --%>
                            <axis:ocultar f="axisage003" c="CBANGES" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_CBANGES" >
                                <b><axis:alt f="axisage003" c="CBANGES" lit="9906324"/></b>   
                            </td>
                            </axis:ocultar>
                        
                         <%-- Nivel Liquidacin --%>
                            <axis:ocultar f="axisage003" c="CTIPAGE_LIQUIDA" dejarHueco="false">
                            <td class="titulocaja" id="tit_CTIPAGE_LIQUIDA" >
                                <b><axis:alt f="axisage003" c="CTIPAGE_LIQUIDA" lit="9906774"/></b>
                            </td>
                            </axis:ocultar></tr>
                       <tr>
                        <axis:ocultar f="axisage003" c="CBANCAR" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CBANCAR" >
                                <axis:encryptflag f="axisage003" c="CBANCAR" />
                                <select name="CBANCAR" id="CBANCAR" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                	title="<axis:alt f="axisage003" c="CBANCAR" lit="100965"/>" 
                                <axis:atr f="axisage003" c="CBANCAR" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                    <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                    <c:forEach var="element" items="${__formdata.CCC}">
                                        <option value = "<axis:encrypt f="axisage003" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCAR}" />@@${element.OB_IAX_CCC.CTIPBAN}" 
                                        <c:if test="${__formdata.CBANCAR == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                            <axis:masc f="axisage003" c="CBANCAR" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />                                               
                                        </option>
                                    </c:forEach>
                                </select>
                                <axis:ocultar f="axisage003" c="MODIFCBANC" dejarHueco="false">
                                    <img border="0" src="images/lapiz.gif" onclick="f_abrir_axisper014(${__formdata.SPERSON})" style="cursor:pointer" id="icon_MODIFCBANC"
                                    alt="<axis:alt f="axisage003" c="MODIFCBANC" lit="100965"/>" title="<axis:alt f="axisage003" c="MODIFCBANC" lit="100965"/>"/>      
                                </axis:ocultar>
                                
                            </td>
                            <%-- Nivel Liquidacin --%>
                            <axis:ocultar f="axisage003" c="CTIPAGE_LIQUIDA" dejarHueco="false">
                            <td class="campocaja" id="td_CTIPAGE_LIQUIDA" >
                                <select name="CTIPAGE_LIQUIDA" id="CTIPAGE_LIQUIDA" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                title="<axis:alt f="axisage003" c="CTIPAGE_LIQUIDA" lit="9906774"/>" alt="<axis:alt f="axisage003" c="CTIPAGE_LIQUIDA" lit="9906774"/>"
                                 onchange="f_recargar(this.value);" <axis:atr f="axisage003" c="CTIPAGE_LIQUIDA" a="obligatorio=true&isInputText=false"/>
                                 >
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option>
                                   <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPAGE_LIQUIDA == element.CATRIBU}"> selected = "selected"</c:if>>
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            </axis:ocultar>
                            
			    <%-- BUG 27949 Aadir campos Cuenta Gestin, Fecha Ult. Visita Compaa y Fecha Ult. Auditora --%>
                            <axis:ocultar f="axisage003" c="CBANGES" dejarHueco="false">
                            <td class="campocaja" colspan="2" id="td_CBANGES" >
                                <axis:encryptflag f="axisage003" c="CBANGES" />
                                <select name="CBANGES" id="CBANGES" size="1" class="campowidthselect campo campotexto" style="width:90%;" 
                                <axis:atr f="axisage003" c="CBANGES" a="obligatorio=false&isInputText=false"/>
                                title="<axis:alt f="axisage003" c="CBANGES" lit="9906324"/>" alt="<axis:alt f="axisage003" c="CBANGES" lit="9906324"/>">&nbsp;
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="CBANGES" lit="108341"/> - </option>
                                    <c:forEach var="element" items="${__formdata.CCCG}">
                                        <option value = "<axis:encrypt f="axisage003" c="CBANGES" value="${element.OB_IAX_CCC.CBANCAR}" />@@${element.OB_IAX_CCC.CTIPBAN}" 
                                        <c:if test="${__formdata.CBANGES == element.OB_IAX_CCC.CBANCAR}"> selected = "selected"</c:if>>
                                            <axis:masc f="axisage003" c="CBANGES" value="${element.OB_IAX_CCC.CBANCARFORMAT}" />                                               
                                        </option>
                                    </c:forEach>
                                </select>
                                 <axis:ocultar f="axisage003" c="MODIFCGESTION" dejarHueco="false">
                                    <img border="0" src="images/lapiz.gif" onclick="f_abrir_axisper014(${__formdata.SPERSON})" style="cursor:pointer" id="icon_MODIFCGESTION"
                                    alt="<axis:alt f="axisage003" c="MODIFCGESTION" lit="9906324"/>" title="<axis:alt f="axisage003" c="MODIFCGESTION" lit="9906324"/>"/>      
                                </axis:ocultar>
                            </td>
                            
                            </axis:ocultar>
        
                        </tr>
			
                        <tr>
                            <axis:ocultar f="axisage003" c="FULTREV" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_FULTVISITA" >
                                <b><axis:alt f="axisage003" c="FULTREV" lit="9906325"/></b>   
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisage003" c="FULTCKC" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="tit_FULAUDITORIA" >
                                <b><axis:alt f="axisage003" c="FULTCKC" lit="9906326"/></b>   
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                        <axis:ocultar f="axisage003" c="FULTREV" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="td_FULTREV" >
                                 <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FULTREV}"/>"  <axis:atr f="axisage003" c="FULTREV" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FULTREV}"> value="${__formdata.FULTREV}"</c:if>
                                    name="FULTREV" id="FULTREV"
                                    title="<axis:alt f='axisage003' c='FULTREV' lit='9906325'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FULTREV" a="obligatorio=false"/>/>
                                     <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FULTREV" alt="<axis:alt f="axisage003" c="FULTREV" lit="9906325"/>" title="<axis:alt f="axisage003" c="FULTREV" lit="9906325" />" src="images/calendar.gif"/></a></c:if>  
                            </td>
                            </axis:ocultar> 
                            
                        <axis:ocultar f="axisage003" c="FULTCKC" dejarHueco="false">
                            <td class="titulocaja" colspan="2" id="td_FULTCKC" >
                                 <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FULTCKC}"/>"  <axis:atr f="axisage003" c="FULTCKC" a="formato=fecha&modificable=true&obligatorio=false"/>
                                    <c:if test="${!empty __formdata.FULTCKC}"> value="${__formdata.FULTCKC}"</c:if>
                                    name="FULTCKC" id="FULTCKC"
                                    title="<axis:alt f='axisage003' c='FULTCKC' lit='9906326'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                    <axis:atr f="axisage003" c="FULTCKC" a="obligatorio=false"/>/>
                                     <c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FULTCKC" alt="<axis:alt f="axisage003" c="FULTCKC" lit="9906326"/>" title="<axis:alt f="axisage003" c="FULTCKC" lit="9906326" />" src="images/calendar.gif"/></a></c:if>   
                            </td>
                            </axis:ocultar> 
                       
                        </tr>

                       
                       <c:import url="axisage003_b.jsp"/>
                       <c:import url="axisage003_c.jsp"/>
 
 
 
 
