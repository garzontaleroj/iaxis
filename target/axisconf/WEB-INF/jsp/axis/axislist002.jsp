<%/* Revision:# pknaqepCk6g5iZQA71dTbg== # */%>
<%--
      NOMBRE:    axislist002.jsp
      Fecha: 04/01/2011
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla de Listados generica
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        04/01/2011   XPL                1. Creación de la pantalla. bug 17179: AGA003 - Modificación de listados de administración (filtro por fmovdia)
      
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                
                
                var filtro = "${__formdata.FILTRO}";
                if (!objUtiles.estaVacio(filtro))      
                    objDom.setValorPorId("FILTRO",filtro);
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                
            var primerCheck  = "${__formdata['asegurado']}";            
            if(primerCheck==""){            
                var tomador = document.getElementById("tomador");
                f_checkea_persona(1);
                //tomador.checked=true;
                }
            else
                 f_checkea_persona(2);
                 
            
                
            }
 	    			
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
          
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist002", "cancelar", document.miForm, "_self");
            }
           
           
             function f_but_109006() {
                if (objValidador.validaEntrada()){
                  var params = f_get_params();
                 objUtiles.ejecutarFormulario("axis_axislist002.do?PPARAMS="+params, "ejecutar", document.miForm, "_self", '<axis:alt f="axislist002" c="MSG_CARGAR" lit="9901019"/>');   
                }
               
               }
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
             /*******************************************
                  Formateo FECHA SI MAP 505
             ********************************************/
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                    calcula_ultimodia();
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt f="axislist002" c="VAL_FECHA" lit="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
             
               function f_dias(mes,anno) {
                        switch (mes) {
                                case '01' : case '03' : case '05' : case '07' : case '08' : case '10' : case '12' : return 31;
                                    case '02' : return (anno % 4 == 0) ? 29 : 28;
                          }
                            return 30;  
                 }
   
                function calcula_ultimodia() {
                         /* cogemos valores */
                     var fechaini=document.miForm.FDESDE.value;
                         if ( fechaini.length == 10)
                           {
                             mes = fechaini.substring(3,5);
                            anno = fechaini.substring(6,fechaini.length);
                         if(document.miForm.CPREVIO.value=='1'&& document.miForm.CLISTADO.value=='505' && document.miForm.CEMPRES.value==12){
                                dia = f_dias(mes,anno);
                                document.miForm.FHASTA.value = (dia+"/"+mes+"/"+anno);
                                document.miForm.FHASTA.disabled=true;
                          
                              }else if(document.miForm.CPREVIO.value!='1')
                              {
                                    document.miForm.FHASTA.disabled=false;
                              }
                           
                         }
              
                }
             //etm ini bug 24776
         function f_cargar_DATOSPERSONA() {  
            var nnumide = objDom.getValorPorId("NNUMIDE");
            var tnombre = objDom.getValorPorId("TNOMBRE");
            if(nnumide!="" || tnombre!=""){
                var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
                objAjax.invokeAsyncCGI("axis_axislist002.do", callbackCargarDatosPersona, "operation=ajax_cargarDatosPersona" + params, this, objJsMessages.jslit_cargando);
            }
        }
         function f_seleccionar_persona(SPERSON, TNOMBRE,NNUMIDE) {
        
            var radioSPERSON = document.miForm.radioSPERSON;
           
            // Marcar/desmarcar radiobuttons
            if (objUtiles.estaVacio(radioSPERSON.length))
                radioSPERSON.checked = true;
            else {
                for (var i = 0; i < radioSPERSON.length; i++) 
                    radioSPERSON[i].checked = (radioSPERSON[i].value == SPERSON);
            }
            
            objDom.setValorPorId("SPERSON", SPERSON);
            objDom.setValorPorId("TNOMBRE", TNOMBRE);            
            objDom.setValorPorId("NNUMIDE", NNUMIDE);   
        }
        
        function f_borrar_campos() {
        
            objDom.setValorPorId("NNUMIDE", "");
             objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
           // f_cargar_DATOSPERSONA();
            document.getElementById("NNUMIDE").focus();
        }
        function f_checkea_persona(tipo){
			try{
				 if (tipo == 1)
					{
					document.getElementById("tomador").checked=true;
					document.getElementById("asegurado").checked=false;
					document.getElementById("beneficiario").checked=false;
					}
				 else if (tipo == 2) 
					{
					document.getElementById("tomador").checked=false;
					document.getElementById("asegurado").checked=true;
					document.getElementById("beneficiario").checked=false;
					}
				 else if (tipo == 3) 
					{
					document.getElementById("tomador").checked=false;
					document.getElementById("asegurado").checked=false;
					document.getElementById("beneficiario").checked=true;
					}
			

				objDom.setValorPorId("TIPO_PERS",tipo);
             }catch(e){}  
        }
             //etm fin bug 24776
             /**********************************/

            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
             }
             
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
             function f_formatear(thiss){
                 thiss.value = validarNumeros(thiss.value);
             }
             
              
               
         function f_get_params(){
            var inputs = document.getElementsByTagName("input");
            
            var params = "";
            for(var i=0;i<inputs.length;i++){
                if(inputs[i].attributes.length>0) {
                    var inputId = inputs[i].getAttribute("id");
                    
                   if(inputs[i].getAttribute("type") != "button" 
                     && (!objUtiles.estaVacio(inputs[i].getAttribute("paramMap")) && inputs[i].getAttribute("paramMap") == "true")){
                      if (objDom.esVisible(inputId)){
                         if (objUtiles.estaVacio(objDom.getValorPorId(inputId))
                        || (!objUtiles.estaVacio(objDom.getValorPorId(inputId)) &&
                            objDom.getValorPorId(inputId) < 0 ) ){
                                params = params+"|"+inputId+":";
                        }else{
                            valor = objDom.getValorPorId(inputId);
                                if (inputs[i].getAttribute('formato') == 'fecha')
                                    valor = formateaFechaToString(valor);
                            
                                if (inputs[i].getAttribute('type') == 'radio'){
                                    if (objDom.getComponenteMarcado(inputs[i])){
                                         params = params+"|"+inputId+":"+valor;                        
                                    }
                                 }else
                                    params = params+"|"+inputId+":"+valor;                        
                        }
                      }
                    }         
                }
            }
                    
            var selects = document.getElementsByTagName("select");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                    var selectId = selects[i].getAttribute("id");
                     if (objDom.esVisible(selectId) ){
                     if(selects[i].getAttribute("type") != "button"
                     && (!objUtiles.estaVacio(selects[i].getAttribute("paramMap")) && selects[i].getAttribute("paramMap") == "true")){
                        if ( objUtiles.estaVacio(objDom.getValorPorId(selectId))
                        || (!objUtiles.estaVacio(objDom.getValorPorId(selectId)) &&
                            objDom.getValorPorId(selectId) < 0 ) ){
                           params = params+"|"+selectId+":";
                        }else{
                             params = params+"|"+selectId+":"+objDom.getValorPorId(selectId);
                        }
                        
                    }    
                 }
                }
            }
            
            return params+"|";
        }
        
        function formateaFechaToString (entrada){
		var enValue = entrada;
		var utiles = new JsUtiles();
		// Convertimos separadores a / , si tiene
		var splitValue = utiles.replaceAll(utiles.replaceAll(enValue,'-','/'),'.','/').split('/');//enValue.replace('-','/').replace('.','/').split('/');
		var dia, mes, any;
		if (splitValue.length == 3) {
		    // dd/mm/yyyy o dd/mm/yy
			dia = splitValue[0];
		 	mes = splitValue[1];
			any = splitValue[2];		
		}
		else{
			// ddmmyyyy o dd/mm/yy
			dia = enValue.substring(0,2);
			mes = enValue.substring(2,4);
			any = enValue.substring(4,enValue.length);
		}
		
		if (dia < 10 && dia.length == 1)
			// Ex. Dia = 5
			dia = "0" + dia;
			
		if (mes < 10 && mes.length == 1)
			// Ex. Mes = 5
			mes = "0" + mes;
                	
		if (any.length != 4)
			// Ex. Any = 02
			// Ex. Any = 98
			if (any > 50) 
				// Ex. Any = 98 --> 1998
				any = parseInt(any,10) + 1900;
			else
				// Ex. Any = 02 --> 2002
				any = parseInt(any,10) + 2000;
		return (dia + "" + mes + "" + any);
	}
        
         function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
            }
                    
            function f_imprimir_fitxer(cont){                    
                
                pfitxer = document.getElementById('SORTIDA_'+cont).value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");        
                
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist002.jsp",600,200);
            }  
            
	// BUG 25623 - 140029 -JOAN Desde aqui
        function f_abrir_axisper021() {
            // joan
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS&CONDICION=PERAGE");
        }

        function f_cerrar_modalespersona(modal){
            // joan
            objUtiles.cerrarModal(modal);
        } 

      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        // joan
        //alert("Em aceptar persona: "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP+" modal:"+modal);
        
        objUtiles.cerrarModal("axisper021");
            
        document.miForm.PERAGE_SPERSON.value = SPERSON;
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("axis_axislist002.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }

        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            // joan
            try{
               //alert(ajaxResponseText+"*************");
                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var NNUMIDE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE    = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                     
                     //alert("joan_395 "+NNUMIDE+" "+NOMBRE+" " + APELLIDO1 +" "+ APELLIDO2);
                      
                     objDom.setValorPorId("PERAGE_CODI", NNUMIDE);
                     objDom.setValorPorId("PERAGE_TEXT", NOMBRE + ' '+ APELLIDO1 + ' '+ APELLIDO2);
                }          
             
            }catch(e){}
            }    
      		// BUG 25623 - 140029 -JOAN FIN --%>
        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
        }
        
        function f_actualizar_personaagente(){
            // joan
            objDom.setValorPorId("PERAGE_SPERSON",""); 
            objDom.setValorPorId("PERAGE_CODI",""); 
            objDom.setValorPorId("PERAGE_TEXT",""); 
        }
        function callbackAjaxCargarAgente(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                    objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                }else{
                    objDom.setValorPorId("NOMBRE_TEXT",""); 
                    objDom.setValorPorId("CAGENTE_TEXT","");
                    objDom.setValorPorId("CAGENTE","");
                }
            }
        }
            
        function callbackAjaxCambiarAgente(ajaxResponseText){
        
        try{
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
            }
            }catch(e){}
        }     
        
        function f_cargar(){
                    f_limpiar();
                    <c:forEach var="listados" items="${LISTADOS}">
                        var llistat = "${listados.CMAP}";
            
                        if (llistat == document.miForm.CLISTADO.value){
                        
                        GENERA_REPORT = "${listados.GENERA_REPORT}";
                        document.miForm.GENERA_REPORT.value = GENERA_REPORT;
                        }
                    </c:forEach>
                    
                    f_cargar_propiedades_pantalla();
                    ocultarFila();
        }

        function f_limpiar(){
         try{
                    var tbody = objLista.obtenerBodyLista("OBFICHERO");
                    var tr = objLista.obtenerFilasBodyLista("OBFICHERO", tbody);                  
                    objLista.borrarFilasDeLista ("OBFICHERO", "10", "<axis:alt f='axislist002' c='SNV_DSP' lit='1000254'/>");
                    var div_errors = document.getElementById("mensajes_div");
                    var tableM = document.getElementById("mensajes_table");
                    var tbody = null;
                    var trM = null;
                    div_errors.style.visibility = "hidden";
                    tableM.style.visibility = "hidden";
                    tbody = tableM.getElementsByTagName("tbody")[0];
                    trM = tableM.getElementsByTagName("tr");
                    objAppMensajes.vaciarMensajes(tbody, trM);
          }catch(e){}
        }
        function f_marcar(valor){
            objDom.setValorPorId("FILTRO",valor);
        }
        
        function f_marcar2(campo,valor){
            objDom.setValorPorId(campo,valor);
        }
        
        
        function f_cargar_combos(thiss){
        
         if (objDom.esVisible("CAGRPRO"))
            objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombos, "operation=ajax_cargaragrupaciones&CCOMPANI=" + thiss, this, objJsMessages.jslit_cargando,thiss);
            else{
            	//BUG 14757 MPC INI 10/03/2021 Se adiciona condicion.
             if (!objDom.esVisible("CCOMPANI2")){
            	//BUG 14757 MPC FIN 10/03/2021 Se adiciona condicion.
             objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CCOMPANI=" + thiss, this, objJsMessages.jslit_cargando,thiss);
             } //BUG 14757 MPC 10/03/2021 Se adiciona condicion.
             
            }
    
        
        }
        
        
        function f_cargar_ramos(thiss){
            var CCOMPANI = null;
             if (objDom.esVisible("CCOMPANI") &&!objUtiles.estaVacio(objDom.getValorPorId("CCOMPANI")) ){
                CCOMPANI = objDom.getValorPorId("CCOMPANI");
             }
             objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CAGRPRO=" + thiss+"&CCOMPANI="+CCOMPANI, this, objJsMessages.jslit_cargando,CCOMPANI);
        }
        
        function f_cargar_productos(thiss){
                var CCOMPANI = null;
             if (objDom.esVisible("CCOMPANI") &&!objUtiles.estaVacio(objDom.getValorPorId("CCOMPANI")) ){
                CCOMPANI = objDom.getValorPorId("CCOMPANI");
             }
        objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosProductos, "operation=ajax_cargarProductos&CCOMPANI=" + CCOMPANI+"&CRAMO="+thiss, this, objJsMessages.jslit_cargando);  
        }
        //etm bug 24776 ini
        
         function f_cargar_motivos(thiss){
            objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosMotivos, "operation=ajax_cargarMotivos&CCAUSIN="+thiss, this, objJsMessages.jslit_cargando);  
        }
        //etm bug 24776 fin
       
        // BUG 21838 - 20120530 -JLTS Desde aqui
        function f_cargar_tramitadores(thiss){
                
        objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosTramitadores, "operation=ajax_cargarTramitadores&CTRAMITPAD="+thiss, this, objJsMessages.jslit_cargando);  
        }

        function f_cargar_poblaciones(thiss){
                
        objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosPoblaciones, "operation=ajax_cargarPoblaciones&CPROVIN="+thiss, this, objJsMessages.jslit_cargando);  
        }
        // BUG 21838 - 20120530 -JLTS Hasta aqui
        
         function callbackAjaxCargarCombos(ajaxResponseText,CCOMPANI){
        
           var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CAGRPRO");
                    
                    var CAGRPROcombo = document.miForm.CAGRPRO;     
                    objDom.borrarOpcionesDeCombo(CAGRPROcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', CAGRPROcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CAGRPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAGRPRO"), i, 0);
                            var TAGRPRO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAGRPRO"), i, 0);                                     
                            objDom.addOpcionACombo(CAGRPRO, TAGRPRO, CAGRPROcombo, i+1);
                        }
                        
                 objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarRamos, "operation=ajax_cargarRamos&CCOMPANI=" + CCOMPANI, this, objJsMessages.jslit_cargando,CCOMPANI);
                }
        }  
        
         function callbackAjaxCargarRamos(ajaxResponseText,CCOMPANI){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CRAMO");
                    
                    var CRAMOcombo = document.miForm.CRAMO;     
                    objDom.borrarOpcionesDeCombo(CRAMOcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', CRAMOcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, CRAMOcombo, i+1);
                        }
                        
                     objAjax.invokeAsyncCGI("axis_axislist002.do", callbackAjaxCargarCombosProductos, "operation=ajax_cargarProductos&CCOMPANI=" + CCOMPANI, this, objJsMessages.jslit_cargando);  
                }
        }
  
        
        function callbackAjaxCargarCombosProductos(ajaxResponseText){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCcombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', SPRODUCcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TTITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TTITULO, SPRODUCcombo, i+1);
                        }
                        
                    
                }
        }
        
        //ETM 24776 INI
           function callbackAjaxCargarCombosMotivos(ajaxResponseText){
           // alert(ajaxResponseText);
            var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CMOTSIN");
                    var CMOTSINcombo = document.miForm.CMOTSIN;     
                    objDom.borrarOpcionesDeCombo(CMOTSINcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', CMOTSINcombo, 0);
                       for (var i = 0; i < elementos.length; i++) {
                            var CMOTSIN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMOTSIN"), i, 0);
                            var TMOTSIN = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMOTSIN"), i, 0);
                            objDom.addOpcionACombo(CMOTSIN, TMOTSIN, CMOTSINcombo, i+1);
                        }
                        
                    
                }
        }
        
        //cargar personas
        function callbackCargarDatosPersona(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            // Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
            // para poder añadir una nueva fila
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbodyadded = objLista.obtenerBodyLista("DATOSPERSONA");
                var tradded = objLista.obtenerFilasBodyLista("DATOSPERSONA", tbodyadded);
                var primerSPERSON = null;
                var primerTEXTO   = null;
                var primerNNUMIDE = null;
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axislist002' c='DATOSPERSONA' lit='1000254'/>");
                
                if (objDom.existeTag(doc, "CODI"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbodyadded, tradded);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "CODI") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    
                    var SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), i, 0);
                    var VALOR   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO     = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);
                  //  TEXTO = objUtiles.replaceAll(TEXTO, "'", "\'");
                     TEXTO=TEXTO.replace(/'/g, "\\'");
                    var jsFuncion = "javascript:f_seleccionar_persona('" + SPERSON + "', '" + TEXTO + "', '" + VALOR + "')";
                    
                    newtd[0] = objLista.addRadioButtonEnLista("radioSPERSON", SPERSON, jsFuncion);             
                    
                    if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                        primerSPERSON = SPERSON;
                        primerTEXTO   = TEXTO;
                        primerNNUMIDE   = VALOR;
                    }
                        
                    newtd[1] = objLista.addTextoEnLista(VALOR, jsFuncion);
                    newtd[2] = objLista.addTextoEnLista(TEXTO, jsFuncion);
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
                
                // Seleccionar el primero si sólo hay uno
                
                if (!objUtiles.estaVacio(primerSPERSON) && objDom.numeroDeTags(doc, "CODI") == 1)
                    f_seleccionar_persona(primerSPERSON, primerTEXTO,primerNNUMIDE);
                                                        
            } // Fi if
        }
        
        //ETM 24776 FIN
        // BUG 21838 - 20120530 -JLTS Desde aqui
        function callbackAjaxCargarCombosTramitadores(ajaxResponseText){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CTRAMITAD");
                    
                    var CTRAMITADcombo = document.miForm.CTRAMITAD;     
                    objDom.borrarOpcionesDeCombo(CTRAMITADcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', CTRAMITADcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CTRAMITAD = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTRAMITAD"), i, 0);
                            var TTRAMITAD = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTRAMITAD"), i, 0);                                     
                            objDom.addOpcionACombo(CTRAMITAD, TTRAMITAD, CTRAMITADcombo, i+1);
                        }
                }
        }
        
        function callbackAjaxCargarCombosPoblaciones(ajaxResponseText){
        
             var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("VALOR");
                    
                    var CPOBLACcombo = document.miForm.CPOBLAC;     
                    objDom.borrarOpcionesDeCombo(CPOBLACcombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - ', CPOBLACcombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                            var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);                                     
                            objDom.addOpcionACombo(VALOR, TEXTO, CPOBLACcombo, i+1);
                        }
                }
        }
        // BUG 21838 - 20120530 -JLTS Hasta aqui
        
   
            function ocultarFila() {
              tab=document.getElementById('DSP_FILTRO');
              var ele= tab.getElementsByTagName('tr');
              var cont = 0;
              var haytd = 0;
                  for (i=0; i<ele.length;  i++) {
                      cont = 0;
                      haytd =0;
                      var eletd = ele[i].getElementsByTagName('td');
                         for (j=0; j<eletd.length; j++) {
                            haytd = 1;
                             try{
                                if (!objUtiles.estaHidden(eletd[j].id)){
                                    cont++;
                                }
                            }catch(e){}
                         }
                     
                      if (cont == 0 && haytd == 1){
                        ele[i].style.display = 'none';
                      }else{
                          if (cont > 0 && haytd == 1){
                               ele[i].style.display = '';
                          }
                      }
                  }
            }
        
        </script>
    </head>
    <body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axislist002" c="TIT_AXISIMPRIMIR" lit="1000205" />|true</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axislist002" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
    </c:import>

    <%-- BUG 25623 - 140029 -JOAN Desde aqui --%>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axislist002" c="TIT_AXISPER021" lit="1000235"/></c:param>
            <c:param name="nid">axisper021</c:param> 
    </c:import> 
        <%-- BUG 25623 - 140029 -FIN --%>
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axislist002" c="TITULO_FORM" lit="9000745"/></b></c:param>    
            <c:param name="formulario"> <b><axis:alt f="axislist002" c="TITULO_FORM" lit="9000745"/></b></c:param> 
            <c:param name="form">axislist002</c:param>
        </c:import> 

        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" paramMap="true"  value="${__formdata.tipo}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" paramMap="true"  value="${__formdata.TRAMO}"/>                
        <input type="hidden" id="CIDIOMA" name="CIDIOMA" paramMap="true"  value="${__formdata.CIDIOMA}"/>       
        <input type="hidden" name="CAGENTE" id="CAGENTE" paramMap="true"  value="${axisctr_agente.CODI}"/>        
        <input type="hidden" name="GENERA_REPORT" id="GENERA_REPORT" paramMap="true"  value="${__formdata.GENERA_REPORT}"/>        
        
        <input type="hidden" id="FACULTATIVO" name="FACULTATIVO" paramMap="true"  value="${__formdata.FACULTATIVO}"/>                
        <input type="hidden" id="CUMUL" name="CUMUL" paramMap="true"  value="${__formdata.CUMUL}"/> 
        <input type="hidden" id="CPREVIO" name="CPREVIO" paramMap="true"  value="${__formdata.CPREVIO}"/> 
        <input type="hidden" id="CDETALL" name="CDETALL" paramMap="true"  value="${__formdata.CDETALL}"/> 
        <input type="hidden" id="CTIPREP" name="CTIPREP" paramMap="true"  value="${__formdata.CTIPREP}"/> 
        <input type="hidden" name="SPERSON" id="SPERSON"  paramMap="true"  value="${__formdata.SPERSON}"/>
        <input type="hidden" id="TIPO_PERS" name="TIPO_PERS"  paramMap="true" value="${__formdata.TIPO_PERS}"/>
            <%-- BUG 25623 - 140029 -JOAN Desde aqui --%>
        <input type="hidden" name="PERAGE_SPERSON" id="PERAGE_SPERSON" paramMap="true"  value="${__formdata.PERAGE_SPERSON}"/>
        <input type="hidden" name="DESCPREG4010" id="DESCPREG4010" paramMap="true"  value="${__formdata.DESCPREG4010}"/>
		<input type="hidden" name="DESCPREG9108" id="DESCPREG9108" paramMap="true"  value="${__formdata.DESCPREG9108}"/>
        
        <input type="hidden" id="USU_CCOMPANI" name="USU_CCOMPANI" paramMap="true"  value="${__formdata.USU_CCOMPANI}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                <table class="area"  align="center">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:60%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b id="label_CLISTADO"><axis:alt f="axislist002" c="CLISTADO" lit="9000745"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <select name = "CLISTADO" paramMap="true" id="CLISTADO"   size="1" onchange="f_cargar()" 
                                                class="campowidthselect campo campotexto" title="<axis:alt f="axislist002" c="CLISTADO" lit="9000745"/>"
                                                <axis:atr f="axislist002" c="CLISTADO" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <option value = ""> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="listados" items="${LISTADOS}">
                                                    <option value = "${listados.CMAP}"
                                                    <c:if test="${(!empty __formdata.CLISTADO)&& listados.CMAP == __formdata.CLISTADO}"> selected </c:if>>
                                                    ${listados.TLITERA}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td></td><td></td>
                                        <%-- Inici BUG 27699/149537 - RCL - Execució en proces batch --%>
                                        <axis:ocultar f="axislist002" c="CBATCH" dejarHueco="false"> 
                                            <td class="campocaja" style="text-align: right;">
                                                <input type="checkbox" id="CBATCH" name="CBATCH" onclick="f_actualizar_check(this)"  value="0"  />
                                                <b id="label_CBATCH"><axis:alt f="axislist002" c="CBATCH" lit="9905809"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <%-- Fi BUG 27699/149537 - RCL - Execució en proces batch --%>
                                    </tr>
                                </table>
                                    
                              
                                
                                <table class="area" id="DSP_FILTRO" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="6" id="TITULO_FILTRO">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axislist002" c="TIT_PARAMS" lit="1000178"/> </b>
                                            </div>
                                            <div class="separador">&nbsp;</div>
                                         </td>
                                    </tr>
                                    <tr style="height:0px">
                                        <axis:visible f="axislist002" c="CEMPRES">
                                        <td class="titulocaja" id="tit_CEMPRES" colspan="2">
                                            <b label="label_CEMPRES"><axis:alt f="axislist002" c="CEMPRES" lit="101619" /></b> <!--empresa-->
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CESTREC">
                                        <td class="titulocaja" id="tit_CESTREC" >
                                            <b label="label_CEMPRES"><axis:alt f="axislist002" c="CESTREC" lit="1000553"/></b><!--estado recibo-->
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CTIPREC">
                                        <td class="titulocaja" id="tit_CTIPREC">
                                            <b label="label_CTIPREC"><axis:alt f="axislist002" c="CTIPREC" lit="102302" /></b><!--tipo de recibo-->
                                        </td>
                                         </axis:visible>                                         
                                        <!-- AAC_INI-CONF_OUTSOURCING-20160906 -->
                                        <axis:ocultar f="axisadm018" c="CGESCAR"  >
                                            <td class="titulocaja" id="tit_CGESCAR" >
                                                <b id="label_CGESCAR"><axis:alt f="axisadm018" c="label_CGESCAR" lit="9909564" /></b>
                                            </td>
                                        </axis:ocultar>
										<!-- AAC_FI-CONF_OUTSOURCING-20160906 -->                                           
                                         <axis:visible f="axislist002" c="CCUENTA">  
                                            <td class="titulocaja" id="tit_CCUENTA">
                                                <b id="label_CCUENTA"><axis:alt f="axislist002" c="CCUENTA" lit="104999" /></b>
                                            </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="NPOLIZA">  
                                            <td class="titulocaja" id="tit_NPOLIZA">
                                                <b id="label_NPOLIZA"><axis:alt f="axislist002" c="NPOLIZA" lit="100624" /></b>
                                            </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="NRECIBO">  
                                            <td class="titulocaja" id="tit_NRECIBO">
                                                <b id="label_NRECIBO"><axis:alt f="axislist002" c="NRECIBO" lit="9902913" /></b>
                                            </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="NSINIES">  
                                            <td class="titulocaja" id="tit_NSINIES">
                                                <b id="label_NSINIES"><axis:alt f="axislist002" c="NSINIES" lit="800279" /></b>
                                            </td>
                                         </axis:visible>      
                                    </tr>
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="CEMPRES">
                                        <td class="campocaja" colspan="2" id="td_CEMPRES">                                            
                                            <select name = "CEMPRES" id="CEMPRES" paramMap="true"   size="1" onchange=""
                                                class="campowidthinput campo campotexto"   title="<axis:alt f="axislist002" c="CEMPRES" lit="101619"/>"
                                                <axis:atr f="axislist002" c="CEMPRES" a="modificable=true&isInputText=true&obligatorio=true"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="empresas" items="${__formdata.listValores.EMPRESAS}">
                                                    <option value = "${empresas.CEMPRES}"
                                                    <c:if test="${(!empty __formdata.CEMPRES)&& empresas.CEMPRES == __formdata.CEMPRES}"> selected </c:if>>
                                                    ${empresas.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                        <axis:visible f="axislist002" c="CESTREC">
                                        <td class="campocaja" id="td_CESTREC">
                                            <select name = "CESTREC" id ="CESTREC"  paramMap="true"  
                                             title="<axis:alt f="axislist002" c="CESTREC" lit="1000553"/>"
                                            size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="estrecs" items="${__formdata.listValores.ESTRECS}">
                                                    <option value = "${estrecs.CATRIBU}"
                                                        <c:if test="${estrecs.CATRIBU == __formdata.CESTREC}">selected</c:if>>
                                                        ${estrecs.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CTIPREC">             
                                        <td class="campocaja" id="td_CTIPREC">
                                            <select name = "CTIPREC" id ="CTIPREC" paramMap="true"
                                            title="<axis:alt f="axislist002" c="CTIPREC" lit="102302"/>"
                                            size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="tiprecs" items="${__formdata.listValores.TIPRECS}">
                                                    <option value = "${tiprecs.CATRIBU}"
                                                        <c:if test="${tiprecs.CATRIBU == __formdata.CTIPREC}">selected</c:if>>
                                                        ${tiprecs.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                        <!-- AAC_INI-CONF_OUTSOURCING-20160906 -->
                                        <axis:ocultar f="axisadm018" c="CGESCAR" > 
                                            <td class="campocaja" id="td_CGESCAR"> 
                                                <select name = "CGESCAR" id ="CGESCAR" style="width:90%" onchange="f_modif_cgescar(this.value)"
                                                    class="campowidthselect campo campotexto" <axis:atr f="axisadm018" c="CGESCAR" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                    alt="<axis:alt f='axisadm018' c='CGESCAR' lit='9909564' />" title="<axis:alt f='axisadm018' c='CGESCAR' lit='1000348' />">
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm018" c="BLANCO" lit="1000348"/> - </option>
                                                    <c:forEach var="lcgescar" items="${__formdata.listValores.lcgescar}" varStatus="cont">
                                                        <option value = "${lcgescar.CATRIBU}">
                                                            ${lcgescar.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>                                        
                                        <!-- AAC_FI-CONF_OUTSOURCING-20160906 -->
                                        <axis:visible f="axislist002" c="CCUENTA">  
                                        <td class="campocaja" id="td_CCUENTA">
                                            <input paramMap="true" type="text" name="CCUENTA" id="CCUENTA" style="width:60%;" 
                                            title="<axis:alt f="axislist002" c="CCUENTA" lit="104999"/>"
                                            class="campowidthinput campo campotexto" 
                                            value="${__formdata.CCUENTA}"
                                            <axis:atr f="axisctr002" c="CCUENTA" a="modificable=true"/> />
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="NPOLIZA">  
                                        <td class="campocaja" id="td_NPOLIZA">
                                            <input paramMap="true" type="text" name="NPOLIZA" id="NPOLIZA" style="width:60%;" 
                                            title="<axis:alt f="axislist002" c="NPOLIZA" lit="100624"/>"
                                            class="campowidthinput campo campotexto" 
                                            value="${__formdata.NPOLIZA}"
                                            <axis:atr f="axisctr002" c="NPOLIZA" a="modificable=true"/> />
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="NRECIBO">  
                                        <td class="campocaja" id="td_NRECIBO">
                                            <input paramMap="true" type="text" name="NRECIBO" id="NRECIBO" style="width:60%;" 
                                            title="<axis:alt f="axislist002" c="NRECIBO" lit="9902913"/>"
                                            class="campowidthinput campo campotexto" 
                                            value="${__formdata.NRECIBO}"
                                            <axis:atr f="axisctr002" c="NRECIBO" a="modificable=true"/> />
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="NSINIES">  
                                        <td class="campocaja" id="td_NSINIES">
                                            <input paramMap="true" type="text" name="NSINIES" id="NSINIES" style="width:60%;" 
                                            title="<axis:alt f="axislist002" c="NSINIES" lit="800279"/>"
                                            class="campowidthinput campo campotexto" 
                                            value="${__formdata.NSINIES}"
                                            <axis:atr f="axisctr002" c="NSINIES" a="modificable=true"/> />
                                        </td>
                                        </axis:visible>
                                    </tr>
                                     <tr style="height:0px">
                                        <axis:visible f="axislist002" c="CCOMPANI">
                                            <td class="titulocaja" id="tit_CCOMPANI">
                                                <b id="label_CCOMPANI"><axis:alt f="axislist002" c="CCOMPANI" lit="9901223"/></b>
                                            </td>
                                        </axis:visible>
                                         <axis:visible f="axislist002" c="CCOMPANI2">
                                            <td class="titulocaja" id="tit_CCOMPANI2">
                                                <b id="label_CCOMPANI2"><axis:alt f="axislist002" c="CCOMPANI2" lit="9901223"/></b>
                                            </td>
                                        </axis:visible>
                                          <axis:visible f="axislist002" c="CCOMPALCOL">
                                            <td class="titulocaja" id="tit_CCOMPALCOL">
                                                <b id="label_CCOMPALCOL"><axis:alt f="axislist002" c="CCOMPALCOL" lit="9901223"/></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CAGRPRO">
                                        <td class="titulocaja" id="tit_CAGRPRO">
                                            <b id="label_CAGRPRO"><axis:alt f="axislist002" c="CAGRPRO" lit="111471" /></b>
                                        </td>
                                        </axis:visible>

                                        <axis:visible f="axislist002" c="CRAMO">
                                        <td class="titulocaja" id="tit_CRAMO">
                                            <b id="label_CRAMO"><axis:alt f="axislist002" c="CRAMO" lit="100784"/></b>
                                        </td>
                                     </axis:visible>
                                        <axis:visible f="axislist002" c="SPRODUC">
                                        <td class="titulocaja" id="tit_SPRODUC">
                                            <b id="label_SPRODUC"><axis:alt f="axislist002" c="SPRODUC" lit="100829" /></b>
                                        </td>
                                        </axis:visible>
                                 </tr>
                                    <tr style="height:0px">
                                        <axis:visible f="axislist002" c="CCOMPANI">
                                            <td class="campocaja" id="td_CCOMPANI">                                        
                                                    <select name="CCOMPANI"  id="CCOMPANI"  size="1" paramMap="true"
                                                    onchange="f_cargar_combos(this.value)" class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CCOMPANI" a="obligatorio=false"/>
                                                     title="<axis:alt f="axislist002" c="CCOMPANI" lit="9901223"/>">&nbsp;                                        
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="CCOMPANI" lit="9901223"/> - </option>
                                                    <c:forEach var="cias" items="${__formdata.listValores.lstCIAS}" varStatus="status">
                                                        <option value = "${cias.CCOMPANI}"  <c:if test="${__formdata.CCOMPANI==cias.CCOMPANI}" >selected</c:if>  >
                                                            ${cias.TCOMPANI}
                                                        </option>
                                                    </c:forEach>                                         
                                                   </select>
                                                </td>  
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CCOMPANI2">
                                            <td class="campocaja" id="td_CCOMPANI2">                                        
                                                    <select name="CCOMPANI2"  id="CCOMPANI2"  size="1" paramMap="true"
                                                    onchange="f_cargar_combos(this.value)" class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CCOMPANI2" a="obligatorio=false"/>
                                                     title="<axis:alt f="axislist002" c="CCOMPANI2" lit="9901223"/>">&nbsp;                                        
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="CCOMPANI2" lit="9901223"/> - </option>
                                                    <c:forEach var="cias" items="${__formdata.listValores.lstCIAS}" varStatus="status">
                                                        <option value = "${cias.CCOMPANI}"  <c:if test="${__formdata.CCOMPANI2==cias.CCOMPANI}" >selected</c:if>  >
                                                            ${cias.TCOMPANI}
                                                        </option>
                                                    </c:forEach>                                         
                                                   </select>
                                                </td>  
                                        </axis:visible>
                                         <axis:visible f="axislist002" c="CCOMPALCOL">
                                            <td class="campocaja" id="td_CCOMPALCOL">                                        
                                                    <select name="CCOMPALCOL"  id="CCOMPALCOL"  size="1" paramMap="true" 
                                                    onchange="f_cargar_combos(this.value)" class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CCOMPALCOL"  a="obligatorio=false"/>
                                                     title="<axis:alt f="axislist002" c="CCOMPALCOL" lit="9901223"/>">&nbsp;                                        
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="CCOMPALCOL" lit="9901223"/> - </option>
                                                    <c:forEach var="cias" items="${__formdata.listValores.lstCIASLCOL}" varStatus="status">
                                                        <option value = "${cias.CCOMPANI}"  <c:if test="${__formdata.CCOMPANI==cias.CCOMPANI}" >selected</c:if>  >
                                                            ${cias.TCOMPANI}
                                                        </option>
                                                    </c:forEach>                                         
                                                   </select>
                                                </td>  
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CAGRPRO">
                                        <td class="campocaja" id="td_CAGRPRO">
                                            <select name = "CAGRPRO" id="CAGRPRO"   size="1" onchange="f_cargar_ramos(this.value)" paramMap="true"
												title="<axis:alt f="axislist002" c="CAGRPRO" lit="111471"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CAGRPRO" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <option value = ""> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="agrupaciones" items="${__formdata.listValores.AGRUPACIONES}">
                                                    <option value = "${agrupaciones.CAGRPRO}"
                                                    <c:if test="${agrupaciones.CAGRPRO == __formdata.CAGRPRO}"> selected </c:if>>
                                                    ${agrupaciones.TAGRPRO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="CRAMO">
                                        <td class="campocaja" id="td_CRAMO">
                                            <select name = "CRAMO" id ="CRAMO" paramMap="true"   size="1" onchange="f_cargar_productos(this.value)" 
                                            class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CRAMO" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="ramos" items="${__formdata.listValores.ramos}">
                                                    <option value = "${ramos.CRAMO}"
                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                        ${ramos.TRAMO}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                           <axis:visible f="axislist002" c="SPRODUC">            
                                        <td class="campocaja" colspan="2" id ="td_SPRODUC" >
                                            <select name = "SPRODUC" id ="SPRODUC" size="1" paramMap="true" style="width:60%;" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341" /> - </option>
                                                <c:forEach items="${__formdata.listValores.productos}" var="item">
                                                    <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                        
                                        <axis:visible f="axislist002" c="RADIO_FECHAS">  
                                        <td class="titulocaja" id="TD_RADIO_FECHAS" rowspan="2">
                                               <div id="RADIO_FILTRO_EFEC">                                               
                                               <input type="radio" id="FILTRO" paramMap="true" name="FILTRO" value="0" 
                                               <axis:atr f="axislist002" c="FILTRO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar(0)"
                                               <c:if test="${__formdata.FILTRO == '0' || empty __formdata.FILTRO}">checked</c:if>/>
                                              <b id="label_FILTRO_EFEC"><axis:alt f="axislist002" c="FILTRO_EFEC" lit="100883" /></b>
                                              </div>
                                              
                                              <div id="RADIO_FILTRO_MOV">                                               
                                              <br>
                                              
                                                <input type="radio" id="FILTRO" paramMap="true" name="FILTRO" value="1" 
                                                onclick="f_marcar(1)" 
                                               <axis:atr f="axislist002" c="FILTRO"  a="modificable=true&isInputText=false"/>
                                               <c:if test="${__formdata.FILTRO == '1'}">checked</c:if>/>
                                                      <b id="label_FILTRO_MOV"><axis:alt f="axislist002" c="FILTRO_MOV" lit="101006" /></b>                                                                                                      
                                               </div>
                                               
                                               <div id="RADIO_FILTRO_CONT">                                   
                                               <br>
                                                <input type="radio" id="FILTRO" paramMap="true" name="FILTRO" value="2" 
                                                onclick="f_marcar(2)"
                                               <axis:atr f="axislist002" c="FILTRO"  a="modificable=true&isInputText=false"/>
                                               <c:if test="${__formdata.FILTRO == '2'}">checked</c:if>/>
                                               <b id="label_FILTRO_CONT"><axis:alt f="axislist002" c="FILTRO_CONT" lit="9901778" /></b>
                                               </div>
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="FDESDE">  
                                        <td class="titulocaja" id="tit_FDESDE">
                                             <b id="label_FDESDE"><axis:alt f="axislist002" c="FDESDE" lit="9000526"/></b>
                                        </td>
                                        </axis:visible>
                                         <axis:visible f="axislist002" c="FHASTA">  
                                        <td class="titulocaja" id="tit_FHASTA" >
                                            <b id="label_FHASTA"><axis:alt f="axislist002" c="FHASTA" lit="9000527" /></b>
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="SPROCESCONTA"> 
                                        <td class="titulocaja" id="tit_SPROCESCONTA" > 
                                            <b id="label_SPROCESCONTA"><axis:alt f="axislist002" c="SPROCESCONTA" lit="9000493"></axis:alt></b>
                                        </td>
                                        </axis:visible>
                                        <!--<axis:visible f="axislist002" c="NRECIBO">  
                                            <td class="titulocaja" id="tit_NRECIBO">
                                                <b id="label_NRECIBO"><axis:alt f="axislist002" c="NRECIBO" lit="9902913" /></b>
                                            </td>
                                         </axis:visible>                                        -->
                                        <axis:visible f="axislist002" c="CAGENTE"> 
                                        <td class="titulocaja" colspan="2" id="tit_CAGENTE" >
                                            <b id="label_CAGENTE"><axis:alt f="axislist002" c="CAGENTE" lit="100584"></axis:alt></b>
                                        </td>
                                        </axis:visible>
                                         <axis:visible f="axislist002" c="CVINCU"> 
                                            <td class="titulocaja" id="tit_CVINCU">
                                               <b id="label_CVINCU"><axis:alt f="axislist002" c="CVINCU" lit="1000474" /></b>
                                            </td>
                                        </axis:visible>
                                        <%-- BUG 25623 - 140029 -JOAN Desde aqui --%>
                                        <axis:visible f="axislist002" c="PERAGE_TIT"> 
                                        <td class="titulocaja" colspan="2" id="PERAGE_TIT" > 
                                            <b id="PERAGE_TIT"><axis:alt f="axislist002" c="PERAGE_TIT" lit="111523"></axis:alt></b>
                                        </td>
                                        </axis:visible>
                                        <%-- BUG 25623 - 140029 -JOAN Desde aqui --%>                                        
                                    </tr>
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="FDESDE"> 
                                        <td class="campocaja" id="td_FDESDE">
                                        
                                            <input type="text" paramMap="true"  formato="fecha" 
                                            title="<axis:alt f="axislist002" c="FDESDE" lit="9000526"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axislist002" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=true"/>
                                                   name="FDESDE" id="FDESDE"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FDESDE" lit="108341"/>" title="<axis:alt f="axislist002" c="IMG_FDESDE" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="FHASTA">
                                        <td class="campocaja" id="td_FHASTA">
                                            <input type="text"  paramMap="true" onchange="f_formatdate(this);"  
                                             title="<axis:alt f="axislist002" c="FHASTA" lit="9000527"/>"
                                             <axis:atr f="axislist002" c="FHASTA" a="modificable=true&formato=fecha&obligatorio=true"/>
                                              name="FHASTA" id="FHASTA" style="width:70%;"   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FHASTA}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FHASTA" lit="100883"/>" title="<axis:alt f="axislist002" c="IMG_FHASTA" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        </axis:visible>
                                         <axis:visible f="axislist002" c="SPROCESCONTA">  
                                           <td class="campocaja" id="td_SPROCESCONTA">
                                              <input paramMap="true" type="text" name="SPROCESCONTA" id="SPROCESCONTA" 
                                              title="<axis:alt f="axislist002" c="SPROCESCONTA" lit="9000493"/>"
                                              class="campowidthinput campo campotexto" 
                                              value="${__formdata.SPROCESCONTA}"
                                              <axis:atr f="axisctr002" c="SPROCESCONTA" a="modificable=true"/> />
                                           </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="CAGENTE">
                                       
                                            <td class="campocaja" colspan="2" id="td_CAGENTE">
                                           
                                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" style="width:15%;" 
                                                    title="<axis:alt f="axislist002" c="CAGENTE_TEXT" lit="100584"/>"
                                                    value="${axisctr_agente.CODI}" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true"/> onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" id="icon_CAGENTE" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <input readonly="true" type="text" style="width:70%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}" class="campowidthinput campo campotexto"/>
                                              
                                                </td>
                                                </axis:visible>
                                             <axis:visible f="axislist002" c="CVINCU">
                                               <td class="campocaja"  id="td_CVINCU" >
                                               
                                                    <select name = "CVINCU" id="CVINCU"  paramMap="true"   size="1" onchange="" style="width:50%;"
                                                    class="campowidthselect campo campotexto" 
                                                    title="<axis:alt f="axislist002" c="CVINCU" lit="1000474"/>"
                                                    <axis:atr f="axislist002" c="CVINCU" a="modificable=true&isInputText=false"/> >
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                    <option value="1"
                                                        <c:if test="${!empty __formdata.CVINCU  && __formdata.CVINCU == '1'}"> selected </c:if>>
                                                        <axis:alt f="axislist002" c="SI" lit="101778"/></option>
                                                    <option value="0"
                                                        <c:if test="${!empty __formdata.CVINCU  && __formdata.CVINCU == '0'}"> selected </c:if>>
                                                        <axis:alt f="axislist002" c="NO" lit="101779"/></option>
                                                    </select>
                                                 </td>
                                              </axis:visible>
                                            <%-- BUG 25623 - 140029 -FAC Desde aqui --%>
                                           <axis:visible f="axislist002" c="PERAGE_DES">
                                            <td class="campocaja" colspan="2" id="td_PERAGE_DES">
                                                    <input type="text" name="PERAGE_CODI" id="PERAGE_CODI" style="width:15%;" 
                                                    title="<axis:alt f="axislist002" c="PERAGE_CODI" lit="111523"/>"
                                                    value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axisctr001" c="PERAGE_CODI" a="modificable=true"/> onchange="f_actualizar_personaagente()" />
                                                    <img border="0" src="images/find.gif" id="PERAGE_icon" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <input readonly="true" type="text" style="width:70%;" name="PERAGE_TEXT" id="PERAGE_TEXT" value="${__formdata.TDESCRI}" class="campowidthinput campo campotexto"/>
                                                </td>
                                           </axis:visible>                                          
					   <%-- BUG 25623 - 140029 -FAC fin  --%>
                                    </tr>
                                    <%-- BUG 21838 - 20120530 -JLTS Desde aqui --%>
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="FSININI">  
                                        <td class="titulocaja" id="tit_FSININI">
                                          <b id="label_FSININI"><axis:alt f="axislist002" c="FSININI" lit="9903716"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="FSINFIN">  
                                         <td class="titulocaja" id="tit_FSINFIN" >
                                           <b id="label_FSINFIN"><axis:alt f="axislist002" c="FSINFIN" lit="9903717" /></b>
                                         </td>
                                      </axis:visible> 
                                      <axis:visible f="axislist002" c="FNOTIINI">  
                                        <td class="titulocaja" id="tit_FNOTIINI">
                                          <b id="label_FNOTIINI"><axis:alt f="axislist002" c="FNOTIINI" lit="9903719"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="FNOTIFIN">  
                                        <td class="titulocaja" id="tit_FNOTIFIN" >
                                          <b id="label_FNOTIFIN"><axis:alt f="axislist002" c="FNOTIFIN" lit="9903721" /></b>
                                        </td>
                                      </axis:visible>

                                    </tr>
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="FSININI"> 
                                          <td class="campocaja" id="td_FSININI">
                                        
                                            <input type="text" paramMap="true"  formato="fecha" 
                                            title="<axis:alt f="axislist002" c="FSININI" lit="9903716"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axislist002" c="FSININI" a="modificable=true&isInputText=false&obligatorio=false"/>
                                                   name="FSININI" id="FSININI"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSININI}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FSININI" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FSININI" lit="108341"/>" title="<axis:alt f="axislist002" c="IMG_FSININI" lit="108341" />" src="images/calendar.gif"/></a>
                                          </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="FSINFIN">
                                        <td class="campocaja" id="td_FSINFIN">
                                          <input type="text"  paramMap="true" onchange="f_formatdate(this);"  
                                             title="<axis:alt f="axislist002" c="FSINFIN" lit="9903717"/>"
                                             <axis:atr f="axislist002" c="FSINFIN" a="modificable=true&formato=fecha&obligatorio=false"/>
                                              name="FSINFIN" id="FSINFIN" style="width:70%;"   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSINFIN}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FSINFIN" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FSINFIN" lit="100883"/>" title="<axis:alt f="axislist002" c="IMG_FSINFIN" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:visible>

                                      <axis:visible f="axislist002" c="FNOTIINI"> 
                                        <td class="campocaja" id="td_FNOTIINI">
                                          <input type="text" paramMap="true"  formato="fecha" 
                                            title="<axis:alt f="axislist002" c="FNOTIINI" lit="9903719"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axislist002" c="FNOTIINI" a="modificable=true&isInputText=false&obligatorio=false"/>
                                                   name="FNOTIINI" id="FNOTIINI"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNOTIINI}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FNOTIINI" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FNOTIINI" lit="108341"/>" title="<axis:alt f="axislist002" c="IMG_FNOTIINI" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:visible>
                                     
                                      <axis:visible f="axislist002" c="FNOTIFIN">
                                        <td class="campocaja" id="td_FNOTIFIN">
                                           <input type="text"  paramMap="true" onchange="f_formatdate(this);"  
                                             title="<axis:alt f="axislist002" c="FNOTIFIN" lit="9903721"/>"
                                             <axis:atr f="axislist002" c="FNOTIFIN" a="modificable=true&formato=fecha&obligatorio=false"/>
                                              name="FNOTIFIN" id="FNOTIFIN" style="width:70%;"   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNOTIFIN}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FNOTIFIN" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FNOTIFIN" lit="100883"/>" title="<axis:alt f="axislist002" c="IMG_FNOTIFIN" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="FCONTINI">  
                                        <td class="titulocaja" id="tit_FCONTINI">
                                          <b id="label_FCONTINI"><axis:alt f="axislist002" c="FCONTINI" lit="9903722"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="FCONTFIN">  
                                        <td class="titulocaja" id="tit_FCONTFIN" >
                                          <b id="label_FCONTFIN"><axis:alt f="axislist002" c="FCONTFIN" lit="9901130" /></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CUSUARI">
                                        <td class="titulocaja" id="tit_CUSUARI">
                                            <b id="label_CUSUARI"><axis:alt f="axislist002" c="CUSUARI" lit="100894"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CTRAMITPAD">
                                        <td class="titulocaja" id="tit_CTRAMITPAD">
                                            <b id="label_CTRAMITPAD"><axis:alt f="axislist002" c="CTRAMITPAD" lit="9000900"/></b>
                                        </td>
                                      </axis:visible>
                                     <axis:visible f="axislist002" c="CTRAMITAD">
                                        <td class="titulocaja" id="tit_CTRAMITAD">
                                            <b id="label_CTRAMITAD"><axis:alt f="axislist002" c="CTRAMITAD" lit="140769"/></b>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="FCONTINI"> 
                                        <td class="campocaja" id="td_FCONTINI">
                                          <input type="text" paramMap="true"  formato="fecha" 
                                            title="<axis:alt f="axislist002" c="FCONTINI" lit="9903722"/>"
                                            onchange="f_formatdate(this);" <axis:atr f="axislist002" c="FCONTINI" a="modificable=true&isInputText=false&obligatorio=false"/>
                                                   name="FCONTINI" id="FCONTINI"  style="width:70%;"  value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTINI}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FCONTINI" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FCONTINI" lit="108341"/>" title="<axis:alt f="axislist002" c="IMG_FCONTINI" lit="108341" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:visible>
                                     
                                      <axis:visible f="axislist002" c="FCONTFIN">
                                        <td class="campocaja" id="td_FCONTFIN">
                                          <input type="text"  paramMap="true" onchange="f_formatdate(this);"  
                                             title="<axis:alt f="axislist002" c="FCONTFIN" lit="9901130"/>"
                                             <axis:atr f="axislist002" c="FCONTFIN" a="modificable=true&formato=fecha&obligatorio=false"/>
                                              name="FCONTFIN" id="FCONTFIN" style="width:70%;"   value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTFIN}"/>"  class="campowidthinput campo campotexto"/>
                                            <a id="icon_FCONTFIN" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axislist002" c="IMG_FCONTFIN" lit="100883"/>" title="<axis:alt f="axislist002" c="IMG_FCONTFIN" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CUSUARI">
                                        <td class="campocaja" id="td_CUSUARI">
                                            <select name = "CUSUARI" id="CUSUARI" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="td_CUSUARI" lit="100894"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CUSUARI" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="usuarios" items="${__formdata.listValores.usuarios}">
                                                    <option value = "${usuarios.CUSER}"
                                                    <c:if test="${(!empty __formdata.CUSUARI)&& __formdata.CUSUARI == __formdata.usuarios.CUSER}"> selected </c:if>>
                                                    ${usuarios.CUSER}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CTRAMITPAD">
                                        <td class="campocaja" id="td_CTRAMITPAD">
                                            <select name = "CTRAMITPAD" id="CTRAMITPAD" paramMap="true"    size="1" onchange="f_cargar_tramitadores(this.value)"
                                                title="<axis:alt f="axislist002" c="td_CTRAMITPAD" lit="9000900"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTRAMITPAD" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="unidadTramitadores" items="${__formdata.listValores.unidadTramitadores}">
                                                    <option value = "${unidadTramitadores.CTRAMITAD}"
                                                    <c:if test="${(!empty __formdata.CTRAMITPAD)&& __formdata.CTRAMITPAD == __formdata.unidadTramitadores.CTRAMITAD}"> selected </c:if>>
                                                    ${unidadTramitadores.TTRAMITAD}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CTRAMITAD">
                                        <td class="campocaja" id="td_CTRAMITAD">
                                            <select name = "CTRAMITAD" id="CTRAMITAD" paramMap="true"    size="1" 
                                                title="<axis:alt f="axislist002" c="td_CTRAMITAD" lit="140769"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTRAMITAD" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                            </select>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="CCAUSIN">
                                        <td class="titulocaja" id="tit_CCAUSIN">
                                            <b id="label_CCAUSIN"><axis:alt f="axislist002" c="CCAUSIN" lit="100852"/></b>
                                        </td>
                                       </axis:visible>
                                     <axis:visible f="axislist002" c="CMOTSIN">
                                        <td class="titulocaja" id="tit_CMOTSIN">
                                            <b id="label_CMOTSIN"><axis:alt f="axislist002" c="CMOTSIN" lit="109651"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CTRAMIT">
                                        <td class="titulocaja" id="tit_CTRAMIT">
                                            <b id="label_CTRAMIT"><axis:alt f="axislist002" c="CCAUSIN" lit="9903527"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="SPROFES">
                                        <td class="titulocaja" id="tit_SPROFES">
                                            <b id="label_SPROFES"><axis:alt f="axislist002" c="SPROFES" lit="102075"/></b>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CPROVIN">
                                        <td class="titulocaja" id="tit_CPROVIN">
                                            <b id="label_CPROVIN"><axis:alt f="axislist002" c="CPROVIN" lit="9902610"/></b>
                                        </td>
                                      </axis:visible>
	
                                      <axis:visible f="axislist002" c="CPOBLAC">
                                        <td class="titulocaja" id="tit_CPOBLAC">
                                            <b id="label_CPOBLAC"><axis:alt f="axislist002" c="CPOBLAC" lit="9903660"/></b>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="CCAUSIN">
                                        <td class="campocaja" id="td_CCAUSIN">
                                            <select name = "CCAUSIN" id="CCAUSIN" paramMap="true"    size="1"  onchange="f_cargar_motivos(this.value)" 
                                                title="<axis:alt f="axislist002" c="td_CCAUSIN" lit="100852"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CCAUSIN" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="usuarios" items="${__formdata.listValores.causasSiniestros}">
                                                    <option value = "${usuarios.CCAUSIN}"
                                                    <c:if test="${(!empty __formdata.CCAUSIN)&& __formdata.CCAUSIN == __formdata.usuarios.CCAUSIN}"> selected </c:if>>
                                                    ${usuarios.TCAUSIN}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CMOTSIN">
                                        <td class="campocaja" id="td_CMOTSIN">
                                            <select name = "CMOTSIN" id="CMOTSIN" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="td_CMOTSIN" lit="109651"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CMOTSIN" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="motivo" items="${__formdata.listValores.motivosSiniestros}">
                                                    <option value = "${motivo.CMOTSIN}"
                                                    <c:if test="${(!empty __formdata.CMOTSIN)&& __formdata.CMOTSIN == __formdata.motivo.CMOTSIN}"> selected </c:if>>
                                                    ${motivo.TMOTSIN}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CTRAMIT">
                                        <td class="campocaja" id="td_CTRAMIT">
                                            <select name = "CTRAMIT" id="CTRAMIT" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="td_CTRAMIT" lit="100852"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTRAMIT" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="asistencia" items="${__formdata.listValores.asistencia}">
                                                    <option value = "${asistencia.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTRAMIT)&& __formdata.CTRAMIT == __formdata.asistencia.CATRIBU}"> selected </c:if>>
                                                    ${asistencia.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="SPROFES">
                                        <td class="campocaja" id="td_SPROFES">
                                            <select name = "SPROFES" id="SPROFES" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="td_SPROFES" lit="102075"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="SPROFES" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="profesionales" items="${__formdata.listValores.profesionales}">
                                                    <option value = "${profesionales.SPROFES}"
                                                    <c:if test="${(!empty __formdata.SPROFES)&& __formdata.SPROFES == __formdata.asistencia.SPROFES}"> selected </c:if>>
                                                    ${profesionales.NOMBRE}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CPROVIN">
                                        <td class="campocaja" id="td_CPROVIN">
                                            <select name = "CPROVIN" id="CPROVIN" paramMap="true"    size="1" onchange="f_cargar_poblaciones(this.value)"
                                                title="<axis:alt f="axislist002" c="td_CPROVIN" lit="9902610"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CPROVIN" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="provincias" items="${__formdata.listValores.provincias}">
                                                    <option value = "${provincias.VALOR}"
                                                    <c:if test="${(!empty __formdata.CPROVIN)&& __formdata.CPROVIN == __formdata.provincias.VALOR}"> selected </c:if>>
                                                    ${provincias.TEXTO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                      <axis:visible f="axislist002" c="CPOBLAC">
                                        <td class="campocaja" id="td_CPOBLAC">
                                            <select name = "CPOBLAC" id="CPOBLAC" paramMap="true"    size="1" 
                                                title="<axis:alt f="axislist002" c="td_CPOBLAC" lit="9903660"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CPOBLAC" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="poblaciones" items="${__formdata.listValores.poblaciones}">
                                                    <option value = "${poblaciones.VALOR}"
                                                    <c:if test="${(!empty __formdata.CPOBLAC)&& __formdata.CPOBLAC == __formdata.provincias.VALOR}"> selected </c:if>>
                                                    ${poblaciones.TEXTO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <%-- BUG 21838 - 20120530 -JLTS Hasta aqui --%>
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="CESTADO">
                                        <td class="titulocaja" id="tit_CESTADO">
                                            <b id="label_CESTADO"><axis:alt f="axislist002" c="CESTADO" lit="9901776"/></b>
                                        </td>
                                      </axis:visible>
                                      
                                       <axis:visible f="axislist002" c="CESTSIN">
                                        <td class="titulocaja" id="tit_CESTSIN">
                                            <b id="label_CESTSIN"><axis:alt f="axislist002" c="CESTSIN" lit="112259"/></b>
                                        </td>
                                      </axis:visible>
                                       <axis:visible f="axislist002" c="CESTPAG">
                                        <td class="titulocaja" id="tit_CESTPAG">
                                            <b id="label_CESTPAG"><axis:alt f="axislist002" c="CESTPAG" lit="9001326"/></b>
                                        </td>
                                      </axis:visible>
                                      
                                       <axis:visible f="axislist002" c="VMODALI">
                                        <td class="titulocaja" id="tit_VMODALI">
                                            <b id="label_VMODALI "><axis:alt f="axislist002" c="VMODALI" lit="100943"/></b>
                                        </td>
                                      </axis:visible>  
                                      
                                      <!-- INI IAXI BUG 7632 AABG: Label para Tipos de Reaseguro -->  
                                      <axis:visible f="axislist002" c="VTIPREAS">
                                        <td class="titulocaja" id="tit_VTIPREAS">
                                            <b id="label_VTIPREAS "><axis:alt f="axislist002" c="VTIPREAS" lit="9902612"/></b>
                                        </td>
                                      </axis:visible>
                                      <!-- FIN IAXI BUG 7632 AABG: Label para Tipos de Reaseguro --> 
                                      
                                       <axis:visible f="axislist002" c="CTIPSIN">
                                        <td class="titulocaja" id="tit_CTIPSIN">
                                            <b id="label_CTIPSIN"><axis:alt f="axislist002" c="CTIPSIN" lit="9001326"/></b>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="CESTADO">
                                        <td class="campocaja" id="td_CESTADO">
                                            <select name = "CESTADO" id="CESTADO" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CESTADO" lit="9901776"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CESTADO" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="estados" items="${__formdata.listValores.ESTADOS}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& estados.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${estados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                     <axis:visible f="axislist002" c="CESTSIN">
                                        <td class="campocaja" id="td_CESTSIN">
                                            <select name = "CESTSIN" id="CESTSIN" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CESTSIN" lit="112259"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CESTSIN" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="estados" items="${__formdata.listValores.estadosSiniestro}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CESTSIN)&& __formdata.CESTSIN == __formdata.estados.CATRIBU}"> selected </c:if>>
                                                    ${estados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                         <axis:visible f="axislist002" c="CESTPAG">
                                        <td class="campocaja" id="td_CESTPAG">
                                            <select name = "CESTPAG" id="CESTPAG" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CESTPAG" lit="9001326"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CESTPAG" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="estados" items="${__formdata.listValores.estadosPago}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CESTPAG) && __formdata.CESTPAG == __formdata.estados.CATRIBU}"> selected </c:if>>
                                                    ${estados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                         
                                         <axis:visible f="axislist002" c="VMODALI">
                                        <td class="campocaja" id="td_VMODALI">
                                            <select name = "VMODALI" id="VMODALI" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="VMODALI" lit="100943"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="VMODALI" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <c:forEach var="modalis" items="${__formdata.listValores.MODALIS}">
                                                    <option value = "${modalis.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& modalis.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${modalis.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                         
                                         <!-- INI IAXI BUG 7632 AABG: Combo para Tipos de Reaseguro -->  
                                         <axis:visible f="axislist002" c="VTIPREAS">
	                                        <td class="campocaja" id="td_VTIPREAS">
	                                            <select name = "VTIPREAS" id="VTIPREAS" paramMap="true"    size="1" onchange=""
	                                                title="<axis:alt f="axislist002" c="VTIPREAS" lit="9902612"/>"
	                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="VTIPREAS" a="modificable=true&obligatorio=false&isInputText=false"/> >
	                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm018" c="BLANCO" lit="1000348"/> - </option>
	                                                <c:forEach var="tipReaseglis" items="${__formdata.listValores.TIPREASEGLIS}">
	                                                    <option value = "${tipReaseglis.CATRIBU}"
	                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& tipReaseglis.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
	                                                    ${tipReaseglis.TATRIBU}</option>
	                                                </c:forEach>
	                                            </select>
	                                        </td>
                                         </axis:visible>
                                         <!-- FIN IAXI BUG 7632 AABG: Combo para Tipos de Reaseguro -->  
                                         
                                         <axis:visible f="axislist002" c="CTIPSIN">
                                        <td class="campocaja" id="td_CTIPSIN">
                                            <select name = "CTIPSIN" id="CTIPSIN" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPSIN" lit="9001326"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTIPSIN" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <c:forEach var="tipsins" items="${__formdata.listValores.TIPSINS}">
                                                    <option value = "${tipsins.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& tipsins.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${tipsins.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                    </tr>
                                    
                                    <tr style="height:0px">
                                      <axis:visible f="axislist002" c="CMES">
                                        <td class="titulocaja" id="tit_CMES">
                                            <b id="label_CMES"><axis:alt f="axislist002" c="CMES" lit="9000495"/></b>
                                        </td>
                                      </axis:visible>
                                     <axis:visible f="axislist002" c="CANYO">
                                        <td class="titulocaja" id="tit_CANYO">
                                            <b id="label_CANYO"><axis:alt f="axislist002" c="CANYO" lit="101606"/></b>
                                        </td>
                                      </axis:visible>   
                                     <axis:visible f="axislist002" c="CINTTEC">
                                        <td class="titulocaja" id="tit_CINTTEC">
                                            <b id="label_CINTTEC"><axis:alt f="axislist002" c="CINTTEC" lit="107049"/></b>
                                        </td>
                                      </axis:visible>
                                     <axis:visible f="axislist002" c="RDPREVIO">
                                        <td class="titulocaja" id="tit_RDPREVIO">
                                            <b id="label_RDPREVIO"><axis:alt f="axislist002" c="RDPREVIO" lit="9000632"/></b>
                                        </td>
                                      </axis:visible>
                                       <axis:visible f="axislist002" c="RDDETALLE">
                                        <td class="titulocaja" id="tit_RDDETALLE">
                                            <b id="label_RDDETALLE"><axis:alt f="axislist002" c="RDDETALLE" lit="9904381"/></b>
                                        </td>
                                      </axis:visible>
                                     <axis:visible f="axislist002" c="CTIPREA">
                                        <td class="titulocaja" id="tit_CTIPREA">
                                            <b id="label_CTIPREA"><axis:alt f="axislist002" c="CTIPREA" lit="9902261"/></b>
                                        </td>
                                      </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                     <axis:visible f="axislist002" c="CMES">
                                        <td class="campocaja" id="td_CMES">
                                            <select name = "CMES" id="CMES" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CMES" lit="9000495"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CMES" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="estados" items="${__formdata.listValores.MESES}">
                                                    <option value = "${estados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& estados.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${estados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                         
                                        <axis:visible f="axislist002" c="CANYO">  
                                        <td class="campocaja" id="td_CANYO">
                                        <input type="text" name="CANYO" id="CANYO" style="width:20%;" paramMap="true"
                                                    title="<axis:alt f="axislist002" c="CANYO" lit="101606"/>"
                                                    value="" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axislist002" c="CANYO" a="modificable=true&obligatorio=true"/>  />
                                        </td>                
                                      </axis:visible> 
                                      
                                        <axis:visible f="axislist002" c="CINTTEC">  
                                        <td class="campocaja" id="td_CINTTEC">
                                        <input type="text" name="CINTTEC" id="CINTTEC" style="width:20%;" paramMap="true"
                                                    title="<axis:alt f="axislist002" c="CINTTEC" lit="107049"/>"
                                                    value="" class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axislist002" c="CINTTEC" a="modificable=true&obligatorio=true"/>  />
                                        </td>                
                                      </axis:visible> 
                                      
                                        <axis:visible f="axislist002" c="RDPREVIO">  
                                        <td class="campocaja" id="td_RDPREVIO">
                                        <div id="RADIO_FILTRO_NO">                                               
                                               <input type="radio" id="RDPREVIO" paramMap="true" name="RDPREVIO" value="0" 
                                               <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar2('CPREVIO','0');calcula_ultimodia();"
                                               <c:if test="${__formdata.CPREVIO == '0'}">checked</c:if>/>
                                              <b id="label_FILTRO_NO"><axis:alt f="axislist002" c="FILTRO_NO" lit="101779" /></b>
                                            </div>
                                            <div id="RADIO_FILTRO_SI">                                               
                                              <input type="radio" id="RDPREVIO" paramMap="true" name="RDPREVIO" value="1" 
                                                       onclick="f_marcar2('CPREVIO','1');calcula_ultimodia();" 
                                                        <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                        <c:if test="${__formdata.CPREVIO == '1'}">checked</c:if>/>
                                                        <b id="label_FILTRO_SI"><axis:alt f="axislist002" c="FILTRO_SI" lit="9902445" /></b>                                                                                                      
                                            </div>
                                        </td>                
                                      </axis:visible> 
                                     <!-- BUG 22376 INI !-->
                                    <axis:visible f="axislist002" c="RDDETALLE">  
                                        <td class="campocaja" id="td_RDDETALLE">
                                        <div id="RADIO_FILTRO_NO">                                               
                                               <input type="radio" id="RDDETALLE" paramMap="true" name="RDDETALLE" value="0" 
                                               <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar2('CDETALL','0');calcula_ultimodia();"
                                               <c:if test="${__formdata.CDETALL == '0'}">checked</c:if>/>
                                              <b id="label_FILTRO_NO"><axis:alt f="axislist002" c="FILTRO_NO" lit="101779" /></b>
                                            </div>
                                            <div id="RADIO_FILTRO_SI">                                               
                                              <input type="radio" id="RDDETALLE" paramMap="true" name="RDDETALLE" value="1" 
                                                       onclick="f_marcar2('CDETALL','1');calcula_ultimodia();" 
                                                        <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                        <c:if test="${__formdata.CDETALL == '1'}">checked</c:if>/>
                                                        <b id="label_FILTRO_SI"><axis:alt f="axislist002" c="FILTRO_SI" lit="9902445" /></b>                                                                                                      
                                            </div>
                                        </td>                
                                      </axis:visible> 
                                
                                     <!-- BUG 22376 FIN !-->
                                        <axis:visible f="axislist002" c="CTIPREA">  
                                        <td class="campocaja" id="td_CTIPREA">
                                            <select name = "CTIPREA" id="CTIPREA" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPREA" lit="9902261"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTIPREA" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <c:forEach var="tipreas" items="${__formdata.listValores.TIPREAS}">
                                                    <option value = "${tipreas.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.ESTADOS.CATRIBU)&& tipreas.CATRIBU == __formdata.ESTADOS.CATRIBU}"> selected </c:if>>
                                                    ${tipreas.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>                
                                      </axis:visible> 
                                    </tr>
                                    
                                    <tr style="height:0px">
                                    <axis:visible f="axislist002" c="CCOBBAN">                                   
                                        <td class="titulocaja" id="tit_CCOBBAN" >
                                            <b label="label_CCOBBAN"><axis:alt f="axislist002" c="CCOBBAN" lit="100879" /></b> 
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                       
                                       <axis:visible f="axislist002" c="CCOBBAN">
                                        <td class="campocaja" id="td_CCOBBAN" >
                                            <select name = "CCOBBAN" id="CCOBBAN" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CCOBBAN" lit="100879"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CCOBBAN" a="modificable=true&obligatorio=true&isInputText=false"/> >
                                                <c:forEach var="ccobbans" items="${__formdata.listValores.lstCOBBAN}">
                                                    <option value = "${ccobbans.CCOBBAN}"
                                                    <c:if test="${ccobbans.CCOBBAN == __formdata.CCOBBAN}">selected</c:if>>
                                                        ${ccobbans.DESCRIPCION}</option>
                                                </c:forEach>                                                                                                                                            
                                            </select>
                                        </td>
                                        </axis:visible>
                                        
                                    </tr>
                                    <tr style="height:0px">
                                       
                                       <axis:visible f="axislist002" c="RADIO_FACULTATIVO">
                                        <td class="titulocaja" id="TIT_RADIO_FACULTATIVO" >
                                            <b label="label_FACULTATIVO"><axis:alt f="axislist002" c="TD_RADIO_FACULTATIVO" lit="9001930" /></b> 
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axislist002" c="RADIO_CUMULO">
                                        <td class="titulocaja" id="TIT_RADIO_CUMULO" >
                                            <b label="label_CEMPRES"><axis:alt f="axislist002" c="TD_RADIO_CUMULO" lit="104181"/></b>
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr style="height:0px">
                                    <axis:visible f="axislist002" c="RADIO_FACULTATIVO">  
                                        <td class="titulocaja" id="TD_RADIO_FACULTATIVO" rowspan="2">
                                            <div id="RADIO_FILTRO_IMP">                                               
                                               <input type="radio" id="RDFACULTATIVO" paramMap="true" name="RDFACULTATIVO" value="1" 
                                               <axis:atr f="axislist002" c="FILTRO_FACULTATIVO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar2('FACULTATIVO',1)"
                                               <c:if test="${__formdata.RDFACULTATIVO == '1' || empty __formdata.RDFACULTATIVO}">checked</c:if>/>
                                              <b id="label_FILTRO_FACULTATIVO"><axis:alt f="axislist002" c="FILTRO_IMP" lit="9902482" /></b>
                                            </div>
                                            <div id="RADIO_FILTRO_COMP">                                               
                                              <input type="radio" id="RDFACULTATIVO" paramMap="true" name="RDFACULTATIVO" value="2" 
                                                       onclick="f_marcar2('FACULTATIVO',2)" 
                                                        <axis:atr f="axislist002" c="FILTRO_FACULTATIVO"  a="modificable=true&isInputText=false"/>
                                                        <c:if test="${__formdata.RDFACULTATIVO == '2'}">checked</c:if>/>
                                                        <b id="label_FILTRO_COMP"><axis:alt f="axislist002" c="FILTRO_COMP" lit="9902483" /></b>                                                                                                      
                                            </div>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axislist002" c="RADIO_CUMULO">  
                                        <td class="titulocaja" id="TD_RADIO_CUMULO" rowspan="2">
                                            <div id="RADIO_FILTRO_NO">                                               
                                               <input type="radio" id="RDCUMUL" paramMap="true" name="RDCUMUL" value="0" 
                                               <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar2('CUMUL',0)"
                                               <c:if test="${__formdata.CUMUL == '0' || empty __formdata.CUMUL}">checked</c:if>/>
                                              <b id="label_FILTRO_NO"><axis:alt f="axislist002" c="FILTRO_NO" lit="101779" /></b>
                                            </div>
                                            <div id="RADIO_FILTRO_SI">                                               
                                              <input type="radio" id="RDCUMUL" paramMap="true" name="RDCUMUL" value="1" 
                                                       onclick="f_marcar2('CUMUL',1)" 
                                                        <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                        <c:if test="${__formdata.RDCUMUL == '1'}">checked</c:if>/>
                                                        <b id="label_FILTRO_SI"><axis:alt f="axislist002" c="FILTRO_SI" lit="9902445" /></b>                                                                                                      
                                            </div>
                                        </td>
                                    </axis:visible>
                                    </tr>
                                 
                                     <%-- BUG 22376 -  ini --%>
                                    <tr style="height:0px">
                                          <axis:visible f="axislist002" c="RDTIPREP"><%---tipo REPORT--%>
                                            <td class="titulocaja" id="tit_RDTIPREP">
                                                <b id="label_RDTIPREP"><axis:alt f="axislist002" c="RDTIPREP" lit="9904393"/></b>
                                            </td>
                                          </axis:visible>
                                          
                                         <axis:visible f="axislist002" c="CTIPCTR"><%---tipo de reaseguros--%>
                                            <td class="titulocaja" id="tit_CTIPCTR">
                                                <b id="label_CTIPCTR"><axis:alt f="axislist002" c="CTIPCTR" lit="9902612"/></b>
                                            </td>
                                          </axis:visible>
                                          
                                           <axis:visible f="axislist002" c="CTIPCTA"><%---tipo de cuenta--%>
                                            <td class="titulocaja" id="tit_CTIPCTA">
                                                <b id="label_CTIPCTA"><axis:alt f="axislist002" c="CTIPCTA" lit="9903153"/></b>
                                            </td>
                                          </axis:visible>
                                         
                                        <axis:visible f="axislist002" c="CCIAREA"><%---Reassegurador/broker--%>
                                            <td class="titulocaja" id="tit_CCIAREA">
                                                <b id="label_CCIAREA"><axis:alt f="axislist002" c="CCIAREA" lit="9904391"/></b>
                                            </td>
                                          </axis:visible>
                                         <axis:visible f="axislist002" c="CMONEDA">
                                            <td class="titulocaja" id="tit_CMONEDA">
                                                <b id="label_CMONEDA"><axis:alt f="axislist002" c="CMONEDA" lit="108645"/></b>
                                            </td>
                                        </axis:visible>
                                        <%-- bug 0026430 --%>
                                        <axis:visible f="axislist002" c="BROKER">
                                            <td class="titulocaja" id="tit_BROKER">
                                                <b id="label_BROKER"><axis:alt f="axislist002" c="BROKER" lit="9000752"/></b>
                                            </td>
                                        </axis:visible>
                                        
                                       
                                    </tr>
                                   <tr style="height:0px">
                                        <axis:visible f="axislist002" c="RDTIPREP">  
                                        <td class="campocaja" id="td_RDTIPREP">
                                        <div id="RADIO_FILTRO_PENDIENTES">                                               
                                               <input type="radio" id="RDTIPREP" paramMap="true" name="RDTIPREP" value="0" 
                                               <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                onclick="f_marcar2('CTIPREP','0');calcula_ultimodia();"
                                               <c:if test="${__formdata.CTIPREP == '0'}">checked</c:if>/>
                                              <b id="label_FILTRO_PENDIENTES"><axis:alt f="axislist002" c="FILTRO_PENDIENTES" lit="101718" /></b>
                                            </div>
                                            <div id="RADIO_FILTRO_PAGADOS">                                               
                                              <input type="radio" id="RDTIPREP" paramMap="true" name="RDTIPREP" value="1" 
                                                       onclick="f_marcar2('CTIPREP','1');calcula_ultimodia();" 
                                                        <axis:atr f="axislist002" c="FILTRO_CUMULO"  a="modificable=true&isInputText=false"/>
                                                        <c:if test="${__formdata.CTIPREP == '1'}">checked</c:if>/>
                                                        <b id="label_FILTRO_PAGADOS"><axis:alt f="axislist002" c="FILTRO_PAGADOS" lit="107870" /></b>                                                                                                      
                                            </div>
                                        </td>                
                                      </axis:visible> 
                                      
                                     <axis:visible f="axislist002" c="CTIPCTR">
                                        <td class="campocaja" id="td_CTIPCTR">
                                            <select name = "CTIPCTR" id="CTIPCTR" paramMap="true"   size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPCTR" lit="9902612"/>"
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CTIPCTR" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="tipocontra" items="${__formdata.listValores.TIPCONTR}">
                                                    <option value = "${tipocontra.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPCONTR.CATRIBU)&& tipocontra.CATRIBU == __formdata.TIPCONTR.CATRIBU}"> selected </c:if>>
                                                    ${tipocontra.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                     <axis:visible f="axislist002" c="CTIPCTA">
                                        <td class="campocaja" id="td_CTIPCTA">
                                            <select name = "CTIPCTA" id="CTIPCTA" paramMap="true"    size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPCTA" lit="9903153"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CTIPCTA" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="tipocuenta" items="${__formdata.listValores.TIPCUENTA}">
                                                    <option value = "${tipocuenta.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPCUENTA.CATRIBU)&& tipocuenta.CATRIBU == __formdata.TIPCUENTA.CATRIBU}"> selected </c:if>>
                                                    ${tipocuenta.TATRIBU}</option>
                                                </c:forEach>
                                             </select>
                                        </td>
                                         </axis:visible>
                                     <axis:visible f="axislist002" c="CCIAREA">
                                        <td class="campocaja" id="td_CCIAREA">
                                            <select name = "CCIAREA" id="CCIAREA" paramMap="true"    size="1" onchange="f_cargar_combos(this.value)" 
                                                title="<axis:alt f="axislist002" c="CCIAREA" lit="9904391"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="CCIAREA" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="reasegbrok" items="${__formdata.listValores.REASEG_BROK}">
                                                    <option value = "${reasegbrok.CCOMPANI}"
                                                    <c:if test="${(!empty __formdata.REASEG_BROK.CCOMPANI)&& reasegbrok.CCOMPANI == __formdata.REASEG_BROK.CCOMPANI}"> selected </c:if>>
                                                    ${reasegbrok.TCOMPANI}</option>
                                                </c:forEach>
                                             </select>
                                        </td>
                                         </axis:visible>
                                         
                                      <axis:visible f="axislist002" c="CMONEDA">
                                         <td class="campocaja" id="td_CMONEDA">     
                                     <select name="CMONEDA" id="CMONEDA" paramMap="true"  size="1" class="campowidthselect campo campotexto" style="width:62.5%;"                               
                                         title="<axis:alt f="axislist002" c="BROKER" lit="108645"/>" >                                       
                                        <option value=""> - <axis:alt f="axislist002" c="ALT_CMONEDA_SEL" lit="108645"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaMonedas}">
                                                <option value = "${element.CMONEDA}" 
                                                <c:if test="${element.CMONEDA == __formdata.CMONEDA}"> selected </c:if> />
                                                               ${element.TMONEDA} 
                                                </option>
                                            </c:forEach>
                                        </select>   
                                       </td>
                                         </axis:visible>     
                                        <%-- bug 0026430 --%>
                                     <axis:visible f="axislist002" c="BROKER">
                                        <td class="campocaja" id="td_BROKER">
                                            <select name = "BROKER" id="BROKER" paramMap="true"    size="1" onchange="f_cargar_combos(this.value)" 
                                                title="<axis:alt f="axislist002" c="BROKER" lit="9000752"/>"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axislist002" c="BROKER" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="varbroker" items="${__formdata.listValores.lstBROKER}">
                                                    <option value = "${varbroker.CCOMPANI}"
                                                    <%-- bug Francisco chacon --%>
                                                     <c:if test="${varbroker.CCOMPANI == __formdata.BROKER}"> selected </c:if>>
                                                    ${varbroker.TCOMPANI}</option>
                                                </c:forEach>
                                             </select>
                                        </td>
                                         </axis:visible>
                                                                         
                                             
                                </tr>
                                <%-- segunda parte--%>
                                <tr style="height:0px">
                                        <axis:visible f="axislist002" c="SUCURSAL">   
                                             <td  class = "titulocaja" id="tit_SUCURSAL" colspan="2">
                                               <b id="label_SUCURSAL"><axis:alt f="axislist002" c="SUCURSAL" lit="9002202" /></b>
                                             </td>
                                           </axis:visible>  
										  <axis:visible f="axislist002" c="CTIPDES">   
                                             <td  class = "titulocaja" id="tit_CTIPDES" colspan="2">
                                               <b id="label_CTIPDES"><axis:alt f="axislist002" c="CTIPDES" lit="9906386" /></b>
                                             </td>
                                           </axis:visible>  
                                          <axis:visible f="axislist002" c="CTIPOLIST"><%---tipos de listados cosaseguro map 541--%>
                                            <td class="titulocaja" id="tit_CTIPOLIST">
                                                <b id="label_CTIPOLIST"><axis:alt f="axislist002" c="CTIPOLIST" lit="103337"/></b>
                                            </td>
                                          </axis:visible>
                                          
                                         <axis:visible f="axislist002" c="CTIPOLST"><%---tipos de listados cosaseguro map 542--%>
                                            <td class="titulocaja" id="tit_CTIPOLST">
                                                <b id="label_CTIPOLST"><axis:alt f="axislist002" c="CTIPOLST" lit="103337"/></b>
                                            </td>
                                          </axis:visible>
                                </tr>
                                 <tr style="height:0px">
                                       <axis:visible f="axislist002" c="SUCURSAL" >   
                                             <td  class="campocaja" id="td_SUCURSAL" colspan="2">
                                               <select name= "SUCURSAL" id ="SUCURSAL"  paramMap="true" size="1" onchange="" style="width:100%"
                                               title="<axis:alt f="axislist002" c="SUCURSAL" lit="9002202"/>"
                                               class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="SUCURSAL" a="modificable=true&isInputText=false"/> >
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axislist002" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.listValores.LSTASUC}" var="item">
                                                         <option value = "${item.CAGENTE}"
                                                        <c:if test="${item.CAGENTE == __formdata.SUCURSAL}"> selected </c:if>>                                                        
                                                        ${item.TAGENTE}</option>
                                                    </c:forEach>
                                                </select>  
                                             </td>
                                    </axis:visible>
                                    <axis:visible f="axislist002" c="CTIPDES" >   
                                             <td  class="campocaja" id="td_CTIPDES" colspan="2">
                                               <select name= "CTIPDES" id ="CTIPDES"  paramMap="true" size="1" onchange="" style="width:100%"
                                               title="<axis:alt f="axislist002" c="CTIPDES" lit="9002202"/>"
                                               class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CTIPDES" a="modificable=true&isInputText=false"/> >
                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axislist002" c="SELECTED" lit="1000348"/> - </option>
                                                    <c:forEach items="${__formdata.listValores.LSTCTIPDES}" var="item">
                                                         <option value = "${item.CATRIBU}"
                                                        <c:if test="${item.CATRIBU == __formdata.CTIPDES}"> selected </c:if>>                                                        
                                                        ${item.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>  
                                             </td>
                                    </axis:visible>
                                     <axis:visible f="axislist002" c="CTIPOLIST">
                                        <td class="campocaja" id="td_CTIPOLIST">
                                            <select name = "CTIPOLIST" id="CTIPOLIST" paramMap="true"   size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPOLIST" lit="103337"/>" 
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CTIPOLIST" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="tipolistados" items="${__formdata.listValores.TIPOLISTADO}">
                                                    <option value = "${tipolistados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPOLISTADO.CATRIBU)&& tipolistados.CATRIBU == __formdata.TIPOLISTADO.CATRIBU}"> selected </c:if>>
                                                    ${tipolistados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                         </axis:visible>
                                      
                                     <axis:visible f="axislist002" c="CTIPOLST">
                                        <td class="campocaja" id="td_CTIPOLST">
                                            <select name = "CTIPOLST" id="CTIPOLST" paramMap="true"   size="1" onchange=""
                                                title="<axis:alt f="axislist002" c="CTIPOLST" lit="103337"/>"
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CTIPOLST" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="tipolista" items="${__formdata.listValores.TIPOLIST}">
                                                    <option value = "${tipolista.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPOLIST.CATRIBU)&& tipolista.CATRIBU == __formdata.TIPOLIST.CATRIBU}"> selected </c:if>>
                                                    ${tipolista.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     </axis:visible>
                                </tr>
                                <tr style="height:0px">
                                    <axis:visible f="axislist002" c="PREG4010">
                                        <td  class = "titulocaja" id="tit_PREG4010">
                                           <b id="label_PREG4010">${__formdata.DESCPREG4010}</b>
                                        </td>
                                    </axis:visible>
									<axis:visible f="axislist002" c="PREG9108">
                                        <td  class = "titulocaja" id="tit_PREG9108">
                                           <b id="label_PREG9108">${__formdata.DESCPREG9108}</b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axislist002" c="CSITUAC">
                                        <td  class = "titulocaja" id="tit_CSITUAC">
                                           <b id="label_CSITUAC"><axis:alt f="axislist002" c="CSITUAC" lit="100874"/></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr style="height:0px">
                                    <axis:visible f="axislist002" c="PREG4010">
                                        <td class="campocaja" id="td_PREG4010">
                                            <select name = "PREG4010" id="PREG4010" paramMap="true"   size="1" onchange=""
                                                title="${__formdata.DESCPREG4010}"
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="PREG4010" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="listaResp4010" items="${__formdata.listValores.LSTPREG4010}">
                                                    <option value = "${listaResp4010.CATRIBU}"
                                                    <c:if test="${ listaResp4010.CATRIBU == __formdata.PREG4010}"> selected </c:if>>
                                                    ${listaResp4010.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     </axis:visible>
									 <axis:visible f="axislist002" c="PREG9108">
                                        <td class="campocaja" id="td_PREG9108">
                                            <select name = "PREG9108" id="PREG9108" paramMap="true"   size="1" onchange=""
                                                title="${__formdata.DESCPREG9108}"
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="PREG9108" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="listaResp9108" items="${__formdata.listValores.LSTPREG9108}">
                                                    <option value = "${listaResp9108.CATRIBU}"
                                                    <c:if test="${ listaResp9108.CATRIBU == __formdata.PREG9108}"> selected </c:if>>
                                                    ${listaResp9108.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     </axis:visible>
                                      <axis:visible f="axislist002" c="CSITUAC">
                                        <td class="campocaja" id="td_CSITUAC">
                                            <select name = "CSITUAC" id="CSITUAC" paramMap="true"   size="1" onchange=""
                                                title="${__formdata.CSITUAC}"
                                                class="campowidthselect campo campotexto" <axis:atr f="axislist002" c="CSITUAC" a="modificable=true&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist002" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach var="listaRespCSITUAC" items="${__formdata.listValores.LSTCSITUAC}">
                                                    <option value = "${listaRespCSITUAC.CATRIBU}"
                                                    <c:if test="${ listaRespCSITUAC.CATRIBU == __formdata.CSITUAC}"> selected </c:if>>
                                                    ${listaRespCSITUAC.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     </axis:visible> 
                                </tr>
                                <%-- segudna parte fin--%>
                                <%-- BUG 22376 -  fin --%>
            
                                
                            </table>
                             <%--BUG 24776 --INI mainTableDimensions base--%>
               <tr>
                
                <axis:visible f="axislist002" c="TIPOPER">
                  
                <td id="TIPOPER">
                    <div class="separador">&nbsp;</div>
                    <table  class="area" id="DSP_TIPOPER"  align="center">
                    
                        <tr>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:16.6%;height:0%;"/>
                            <th style="width:8.6%;height:0%;"/>
                            <th style="width:8.4%;height:0%;"/>
                        </tr>
                        
                        <tr style="height:0px">
                        <%--101027 TOMADORES--%>
                       <axis:ocultar f="axislist002" c="NNUMIDE" dejarHueco="false">
                            <td class="titulocaja" id="tit_NNUMIDE">
                                <b><axis:alt f="axislist002" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axislist002" c="TNOMBRE" dejarHueco="false">
                            <td class="titulocaja"  id="tit_TNOMBRE" colspan="3">
                                <b><axis:alt f="axislist002" c="TNOMBRE" lit="1000560"/> <axis:alt f="axislist002" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axislist002" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja" id="tit_TIPOPER">
                                <b><axis:alt f="axislist002" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja0" id="tit_tomador">
                                <input type="radio" id="tomador" name="tomador"  onclick="f_checkea_persona(1)"                                
                                <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/> 
                              </td>
                            </axis:ocultar>
                         </tr>
                            
                         <tr style="height:0px">  <%--BODY--%>
                            <axis:ocultar f="axislist002" c="NNUMIDE" dejarHueco="false">
                            <td class="campocaja" id="td_NNUMIDE">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axislist002" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                title="<axis:alt f="axislist002" c="NNUMIDE2" lit="1000559"/>" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axislist002" c="TNOMBRE" dejarHueco="false">
                            <td class="campocaja" id="td_TNOMBRE" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                <axis:atr f="axislist002" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axislist002" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja" id="tit_TIPOPER">
                                <b><axis:alt f="axislist002" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                            </td>
                                       
                            <td class="titulocaja" id="td_asegurado">
                                <input type="radio" id="asegurado" name="asegurado" onclick="f_checkea_persona(2)"
                                <c:if test="${__formdata['asegurado'] == 'on'}">checked</c:if>/>
                            </td>
                            </axis:ocultar>
                            
                
                         </tr>
                         <tr>
                          <axis:ocultar f="axislist002" c="beneficiario" dejarHueco="false" >    
                         <td class="titulocaja"  colspan = "4"> 
                          <axis:ocultar f="axislist002" c="beneficiario" dejarHueco="false" >    
                            <td class="titulocaja" id="tit_beneficiario" >
                                <b><axis:alt f="axislist002" c="beneficiario" lit="9001911"/></b> <%-- beneficiario --%>
                            </td>                 
                             <td class="titulocaja" id="td_beneficiario">
                                <input type="radio" id="beneficiario" name="beneficiario" onclick="f_checkea_persona(3)"                               
                                <c:if test="${__formdata['beneficiario'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                            </axis:ocultar>
                        </td>
                         </axis:ocultar>
                         
                        </tr>
                        <!-- AAC_INI-CONF_OUTSOURCING-20160906 -->
										<tr>
										<td colspan="3">
											<table>
											<tr>
											<td colspan="2">
												<table>
													<tr>
														<td><axis:ocultar f="axisadm018" c="CMADUREZ">
																<td class="titulocaja" id="tit_CMADUREZ"><b
																	id="label_CMADUREZ"><axis:alt f="axisadm018"
																			c="label_CMADUREZ" lit="9909657" /></b></td>
															</axis:ocultar></td>
															<td/>
															<td/>
															<td/>
													</tr>
													<tr>
														<td><axis:visible f="axislist002" c="CMADDESDE">
																<td class="titulocaja" id="tit_CVALORPRIMA" align="right"><b
																	id="label_CVALORPRIMA"><axis:alt f="axisadm018"
																			c="label_CVALORPRIMA" lit="101836" />
																		<td class="campocaja" id="td_CMADDESDE"><input
																			type="text" paramMap="true" formato="fecha"
																			title="<axis:alt f="axislist002" c="CMADDESDE" lit="9000526"/>"
																			onchange="f_formatdate(this);"
																			<axis:atr f="axislist002" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=false"/>
																			name="CMADDESDE" id="CMADDESDE" style="width: 30%;"
																			value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>"
																			class="campowidthinput campo campotexto" /> <a
																			id="icon_FDESDE" style="vertical-align: middle;">
																				<img
																				alt="<axis:alt f="axislist002" c="IMG_FDESDE" lit="108341"/>"
																				title="<axis:alt f="axislist002" c="IMG_FDESDE" lit="108341" />"
																				src="images/calendar.gif" />
																		</a></td>
															</axis:visible> <axis:visible f="axislist002" c="CMADHASTA">
																<td class="titulocaja" id="tit_CVALORPRIMA" align="right"><b
																	id="label_CVALORPRIMA"><axis:alt f="axisadm018"
																			c="label_CVALORPRIMA" lit="101837" />
																		<td class="campocaja" id="td_CMADHASTA"><input
																			type="text" paramMap="true" formato="fecha"
																			title="<axis:alt f="axislist002" c="CMADHASTA" lit="9000526"/>"
																			onchange="f_formatdate(this);"
																			<axis:atr f="axislist002" c="FDESDE" a="modificable=true&isInputText=false&obligatorio=false"/>
																			name="CMADHASTA" id="CMADHASTA" style="width: 30%;"
																			value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>"
																			class="campowidthinput campo campotexto" /> <a
																			id="icon_FHASTA" style="vertical-align: middle;">
																				<img
																				alt="<axis:alt f="axislist002" c="IMG_FHASTA" lit="108341"/>"
																				title="<axis:alt f="axislist002" c="IMG_FHASTA" lit="108341" />"
																				src="images/calendar.gif" />
																		</a></td>
															</axis:visible></td>
															<td/><td/>
													</tr>
												</table>
											</td>
											<td colspan="2">
												<table>
													<tr>
														<td><axis:ocultar f="axisadm018" c="CVALORPRIMA">
																<td class="titulocaja" id="tit_CVALORPRIMA"><b
																	id="label_CVALORPRIMA"><axis:alt f="axisadm018"
																			c="label_CVALORPRIMA" lit="9909658" /></b></td>
															</axis:ocultar></td>
															<td/>
															<td/>
															<td/>
													</tr>
													<tr>
														<td><axis:visible f="axislist002" c="CPRIDESDE">
																<td class="titulocaja" id="tit_CVALORPRIMA" align="right"><b
																	id="label_CVALORPRIMA"><axis:alt f="axisadm018"
																			c="label_CVALORPRIMA" lit="101836" />
																		<td class="campocaja" id="td_CPRIDESDE"><input
																			type="text" name="CPRIDESDE" id="CPRIDESDE"
																			style="width: 20%;" paramMap="true"
																			title="<axis:alt f="axislist002" c="CPRIDESDE" lit="107049"/>"
																			value="" class="campowidthinput campo campotexto"
																			<axis:atr f="axislist002" c="CPRIDESDE" a="modificable=true&obligatorio=false"/> />
																	</td>
															</axis:visible> <axis:visible f="axislist002" c="CPRIHASTA">
																<td class="titulocaja" id="tit_CVALORPRIMA" align="right"><b
																	id="label_CVALORPRIMA"><axis:alt f="axisadm018"
																			c="label_CVALORPRIMA" lit="101837" />
																		<td class="campocaja" id="td_CPRIHASTA"><input
																			type="text" name="CPRIHASTA" id="CPRIHASTA"
																			style="width: 20%;" paramMap="true"
																			title="<axis:alt f="axislist002" c="CPRIHASTA" lit="107049"/>"
																			value="" class="campowidthinput campo campotexto"
																			<axis:atr f="axislist002" c="CPRIHASTA" a="modificable=true&obligatorio=false"/> />
																	</td>
															</axis:visible></td>
															<td/>
															<td/>
													</tr>
												</table>
											</td>
											</tr>
											</table>
											 </td>
											<tr>
										</tr>
										<!-- AAC_FI-CONF_OUTSOURCING-20160906 --> 
                         <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <axis:ocultar f="axislist002" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axislist002" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                </axis:ocultar>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <axis:ocultar f="axislist002" c="BT_BUSCAR_PER" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axislist002" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                </axis:ocultar>
                                <div class="separador">&nbsp;</div>
                            </td>
                            
                          
                          
                        </tr>
                    <%--probando--%>
                         <axis:ocultar f="axislist002" c="DSP_DATPERSON" dejarHueco="false"> 
                        <tr>
                            <td class="campocaja" id="datosper" colspan="5">
                                <c:set var="title1"><axis:alt f="axislist002" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                <c:set var="title2"><axis:alt f="axislist002" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                <div class="seccion displayspace">
                                    <display:table name="${sessionScope.DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="axis_axislist002.do?paginar=true" style="width:99.9%">
                                    <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input value="${DATOSPERSONA.SPERSON}" type="radio" id="radioSPERSON" name="radioSPERSON"/>
                                            </div>
                                        </display:column>
                                        <%--display:column title="${title1}" sortable="true" sortProperty="SPERSON" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.SPERSON}</div>
                                        </display:column--%>
                                        <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.NNUMIDE}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText"></div>
                                        </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr> 
                      </axis:ocultar>     
                       </table>
                </td>
         </axis:visible>
            </tr>
                         
                <%--BUG 24776 --FIN--%>    
                              
                          <c:if test="${!empty __formdata.LIST_FICHEROS}">
                                
                               
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                    </tr>    
                                    <tr>
                                        <td colspan="7">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axislist002" c="TIT_FITX" lit="9901019"/> </b>
                                            </div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero" colspan="3">
                                        <%int cont = 0;%>
                                         <c:set var="title0"><axis:alt f="axislist002" c="FICHERO" lit="1000574"/>  </c:set>
                                          <div class="seccion displayspace">
                                              <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axislist002.do?paginar=true" style="width:99.9%">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <c:set var="i"><%=cont%></c:set>
                                            <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                               <a href="javascript:f_imprimir_fitxer('${i}')"> ${OBFICHERO.OB_IAX_IMPRESION.FICHERO}</a>
                                               <input type="hidden" 
                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                   class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                                   value="${OBFICHERO.OB_IAX_IMPRESION.FICHERO}"/>                                     
                                            </display:column>   
                                            <% cont ++ ;%>
                                            </display:table>
                                            </div>
                        
                                          </td> 
                                    </tr>
                                </table>
                                </c:if>
                            
                            </td>
                        </tr>                              
                    </table>
                </td>
            </tr>                                
        </table>

    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FDESDE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FDESDE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FHASTA", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <%-- BUG 21838 - 20120530 -JLTS Desde aqui --%>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FSININI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FSININI", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FSINFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FSINFIN", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FNOTIINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FNOTIINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FNOTIFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FNOTIFIN", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FCONTINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FCONTINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FCONTFIN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FCONTFIN", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    <%-- BUG 21838 - 20120530 -JLTS Hasta aqui --%>
    </form>    

<c:import url="../include/botonera_nt.jsp"><c:param name="f">axislist002</c:param>
   <c:param name="f">axislist002</c:param>
    <c:param name="__botones">salir,109006</c:param> 
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


