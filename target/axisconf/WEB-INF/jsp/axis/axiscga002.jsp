<%/* Revision:# Np2zskX3lJiyio77nth+Sw== # */%>

<%
	/*
	*  Fichero: axiscga002.jsp
	*  Fecha: 03/02/2009
	*/
%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<html>
<head>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />

<!--********** CALENDARIO ************************* -->
<!-- Hoja de estilo del Calendario -->
<link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en funcin del Locale -->
<script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
<!-- Setup del calendario -->
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->

<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/*****************************************************************************************/

	function f_onload() {
		<c:if test="${__formdata.CMODO != 'CONSULTA'}"> 
		Calendar.setup({
			inputField : "FCREA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCREA",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FEXPEDIC",
			ifFormat : "%d/%m/%Y",
			button : "icon_FEXPEDIC",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FVENCIMI",
			ifFormat : "%d/%m/%Y",
			button : "icon_FVENCIMI",
			singleClick : true,
			firstDay : 1
		});
			
		// 		<!--   08-03-2019 IAXIS-2489 -->
		Calendar.setup({
			inputField : "MODELO",
			ifFormat : "%d/%m/%Y",
			button : "icon_MODELO",
			singleClick : true,
			firstDay : 1
		});
// 		<!--   08-03-2019 IAXIS-2489 -->
		
		Calendar.setup({
			inputField : "FVENCIMI1",
			ifFormat : "%d/%m/%Y",
			button : "icon_FVENCIMI1",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FVENCIMI2",
			ifFormat : "%d/%m/%Y",
			button : "icon_FVENCIMI2",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FESCRITURA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FESCRITURA",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FCERTLIB",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCERTLIB",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FINIPAG",
			ifFormat : "%d/%m/%Y",
			button : "icon_FINIPAG",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FFINPAG",
			ifFormat : "%d/%m/%Y",
			button : "icon_FFINPAG",
			singleClick : true,
			firstDay : 1
		});
		</c:if>
		var personIdAjax="${__formdata.SPERSON}";
		if(personIdAjax>0){			
			document.miForm.NNUMIDE.value = "${__formdata.NNUMIDE}";
			document.miForm.TNOMBRE.value = "${__formdata.NOMBRE}";
		}
		f_cargar_propiedades_pantalla();
		
		//	 	Inicio  08-03-2019 IAXIS-3053
 //               $('#but_aceptar').hide();
		//	 	Fin  08-03-2019 IAXIS-3053		
				
 		// TCS_823 - ACL - 04/03/2019 Se agrega condiciones para cargar los datos de Fideicomitente
        		var clase = objDom.getValorPorId("CCLASE");
        		   if (clase == 100) {
        	        		objDom.setValorPorId("SPERFIDE", objDom.getValorPorId("NNUMIDE"));
        	        		objDom.setValorPorId("NOMBREFIDE", objDom.getValorPorId("TNOMBRE"));
        		   } 
        		   
//        		 	Inicio  21-03-2019 IAXIS-3053
						//alert("${__formdata.CMODOP}");
        			if("${__formdata.CMODOP}" == 'CONSULTA' || "${__formdata.CMODOP}" == 'GENERAL'){
        				 $('#CTIPO').prop("disabled","true");
        				 $('#CCLASE').prop("disabled","true"); 
        				 $('#CAREA').prop("disabled","true"); 
        			}

        	        //	 	Fin  21-03-2019 IAXIS-3053
	}
        
		
        
	// TCS_823 - ACL - 04/03/2019 Se modifica la funcion para cargar los datos de Fideicomitente
	function cargar_pantalla_por_clase() {
		f_cargar_propiedades_pantalla();
		var clase = objDom.getValorPorId("CCLASE");
		   if (clase == 100) {
	        		objDom.setValorPorId("SPERFIDE", objDom.getValorPorId("NNUMIDE"));
	        		objDom.setValorPorId("NOMBREFIDE",objDom.getValorPorId("TNOMBRE"));
		   }  	
	}
		

	function isNumberKey(evt)
	   {
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }
	
	function f_but_aceptar() {
		try{
			 if (objValidador.validaEntrada()) {
				objUtiles.ejecutarFormulario("modal_axiscga002.do?btnAceptar=1", "aceptar",
						document.miForm, "_self", objJsMessages.jslit_cargando);			
			 }
		}catch(e){
            if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
        }
	}

	function f_but_cancelar() {
		
	    var nradica = "${__formdata.NRADICA_BUSQ}";
	    
	    if(nradica == ""){
			var nradica = "${__formdata.NRADICA}";
		}
	    
		//alert("nradica:"+nradica);
		
		
		
		parent.f_but_cerrar_axiscga002(nradica);
		/*objUtiles.ejecutarFormulario("axis_axiscga002.do", "cancelar",
				document.miForm, "_self", objJsMessages.jslit_cargando);*/
	}
	function f_but_salir() {
		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscga002", "cancelar", document.miForm, "_self");
	}
	
	
	function f_cerrar_modalespersona(modal) {
		objUtiles.cerrarModal(modal);
	}

	function f_abrir_axisper021_codeudor() {
		objDom.setValorPorId("PERSONA_CODEUDOR","1");
		var SSEGURO = "${__formdata.SSEGURO}";
		var CAGENTE = "${__formdata.CAGENTE}";
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="
						+ CAGENTE + "&SSEGURO=" + SSEGURO+"&faceptar=f_aceptar_codeudor_axisper021&ORIGEN=AXISCGA002");		
	}

	function f_abrir_axisper021_perfide(){
		objDom.setValorPorId("PERSONA_CODEUDOR","2");
		var SSEGURO = "${__formdata.SSEGURO}";
		var CAGENTE = "${__formdata.CAGENTE}";
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="
						+ CAGENTE + "&SSEGURO=" + SSEGURO+"&faceptar=f_aceptar_codeudor_axisper021&ORIGEN=AXISCGA002");	
	}
	function callbackajaxGetPersona(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);
		//alert(ajaxResponseText);
		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

			document.miForm.NNUMIDE.value = '';
			document.miForm.TNOMBRE.value = '';
			document.miForm.SPERSON.value = '';

			var TNOMBRE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TNOMBRE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TNOMBRE"), 0, 0) : "");

			var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI1")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI1"), 0, 0) : "");

			var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI2")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI2"), 0, 0) : "");

			var CTIPIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("CTIPIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("CTIPIDE"), 0, 0) : "");

			var NNUMIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("NNUMIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("NNUMIDE"), 0, 0) : "");

			var SPERSON = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("SPERSON")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("SPERSON"), 0, 0) : "");

			document.miForm.NNUMIDE_CODEUDORES.value = NNUMIDE;
			document.miForm.TNOMBRE_CODEUDORES.value = TAPELLI1 + "" + TAPELLI2
					+ " ," + TNOMBRE;

			objDom.setValorPorId("SPERSON_CODEUDORES", SPERSON);

		}
	}

	function callbackajaxGetPersonaFede(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);
		//alert(ajaxResponseText);
		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

		
			var TNOMBRE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TNOMBRE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TNOMBRE"), 0, 0) : "");

			var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI1")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI1"), 0, 0) : "");

			var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI2")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI2"), 0, 0) : "");
		

			document.miForm.NOMBREFIDE.value = TAPELLI1 + "" + TAPELLI2
					+ " ," + TNOMBRE;
		

		}
	}
	function f_abrir_axisper021_persona() {	
		objDom.setValorPorId("PERSONA_CODEUDOR","0")	
		var SSEGURO = "${__formdata.SSEGURO}";
		var CAGENTE = "${__formdata.CAGENTE}";
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="
						+ CAGENTE + "&SSEGURO=" + SSEGURO+"&faceptar=f_aceptar_persona_axisper021&ORIGEN=AXISCGA002");
	}
	function f_cerrar_axisper021() {
		objUtiles.cerrarModal("axisper021");
<%session.removeAttribute("faceptar");%>
	}
	function f_onchange_axiscga002() {
        var CPOBLACPAG=objDom.getValorPorId("CPOBLACPAG");
        var CPROVINPAG=objDom.getValorPorId("CPROVINPAG");
        
        if (!objUtiles.estaVacio(CPOBLACPAG)){
            var qs="operation=ajax_poblacion";
            qs=qs+"&op="+"CPOBLACPAG";
            qs=qs+"&CPOBLACPAG="+CPOBLACPAG;
            qs=qs+"&CPROVINPAG="+CPROVINPAG;
            qs=qs+"&dt="+(new Date().getTime());
            var origen = 'CPOBLACPAG';
            objAjax.invokeAsyncCGI("modal_axiscga002.do", callbackajaxpoblacion, qs, this, null, origen)
        } else {
            objDom.setValorPorId("CPOBLACPAG", "");
            objDom.setValorHTMLPorId("TCPOBLACPAG_span", "");
            limpiaCampos("CPOBLACPAG");
        }
    }
	
	function f_onchange_partes() {
        var CPOBLACPAR=objDom.getValorPorId("CPOBLACPAR");
        var CPROVINPAR=objDom.getValorPorId("CPROVINPAR");
        
       if (!objUtiles.estaVacio(CPOBLACPAR)){
            var qs="operation=ajax_poblacion";
            qs=qs+"&op="+"CPOBLACPAR";
            qs=qs+"&CPOBLACPAR="+CPOBLACPAR;
            qs=qs+"&CPROVINPAR="+CPROVINPAR;
            qs=qs+"&dt="+(new Date().getTime());
            var origen = 'CPOBLACPAR';
            objAjax.invokeAsyncCGI("modal_axiscga002.do", callbackajaxpoblacion, qs, this, null, origen)
        } else {
            objDom.setValorPorId("CPOBLACPAR", "");
            objDom.setValorHTMLPorId("TCPOBLACPAR_span", "");
            limpiaCampos("CPOBLACPAR");
        }
    }
	
	function f_onchange_firma() {
        var CPOBLACFIR=objDom.getValorPorId("CPOBLACFIR");
        var CPROVINFIR=objDom.getValorPorId("CPROVINFIR");
        
        if (!objUtiles.estaVacio(CPOBLACFIR)){
            var qs="operation=ajax_poblacion";
            qs=qs+"&op="+"CPOBLACFIR";
            qs=qs+"&CPOBLACFIR="+CPOBLACFIR;
            qs=qs+"&CPROVINFIR="+CPROVINFIR;
            qs=qs+"&dt="+(new Date().getTime());
            var origen = 'CPOBLACFIR';
            objAjax.invokeAsyncCGI("modal_axiscga002.do", callbackajaxpoblacion, qs, this, null, origen)
        } else {
            objDom.setValorPorId("CPOBLACFIR", "");
            objDom.setValorHTMLPorId("TCPOBLACFIR_span", "");
            limpiaCampos("CPOBLACFIR");
        }
    }
    function limpiaCampos (CAMPO){
         if(objUtiles.utilEquals(CAMPO, "CPOBLACPAG")){
                //Limpio población
                objDom.setValorPorId("CPOBLACPAG", "");
                objDom.setValorHTMLPorId("TCPOBLACPAG_span", "");
        }
         if(objUtiles.utilEquals(CAMPO, "CPOBLACPAR") ||
                 objUtiles.utilEquals(CAMPO, "CPROVINPAR")){
                     //Limpio población
                     objDom.setValorPorId("CPOBLACPAR", "");
                     objDom.setValorHTMLPorId("TCPOBLACPAR_span", "");
             }
         if(objUtiles.utilEquals(CAMPO, "CPOBLACFIR") ||
                 objUtiles.utilEquals(CAMPO, "CPROVINFIR")){
                     //Limpio población
                     objDom.setValorPorId("CPOBLACFIR", "");
                     objDom.setValorHTMLPorId("TCPOBLACFIR_span", "");
             }
    }
    
    function callbackajaxpoblacion (ajaxResponseText,origen){
        try{ 

            var doc = objAjax.domParse(ajaxResponseText);
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLACPAG")[0])) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                        objDom.setValorPorId("CPOBLACPAG", "");
                        objDom.setValorHTMLPorId("TCPOBLACPAG_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                    }else{
                        objDom.setValorPorId("CPOBLACPAG", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLACPAG"), 0, 0));
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCPOBLACPAG")[0]))
                            objDom.setValorHTMLPorId("TCPOBLACPAG_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCPOBLACPAG"), 0, 0) + "</b>");
                    }
                }
                
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLACPAR")[0])) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                        objDom.setValorPorId("CPOBLACPAR", "");
                        objDom.setValorHTMLPorId("TCPOBLACPAR_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                    }else{
                        objDom.setValorPorId("CPOBLACPAR", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLACPAR"), 0, 0));
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCPOBLACPAR")[0]))
                            objDom.setValorHTMLPorId("TCPOBLACPAR_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCPOBLACPAR"), 0, 0) + "</b>");
                    }
                }
                
                if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLACFIR")[0])) {
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                        objDom.setValorPorId("CPOBLACFIR", "");
                        objDom.setValorHTMLPorId("TCPOBLACFIR_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                    }else{
                        objDom.setValorPorId("CPOBLACFIR", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLACFIR"), 0, 0));
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCPOBLACFIR")[0]))
                            objDom.setValorHTMLPorId("TCPOBLACFIR_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCPOBLACFIR"), 0, 0) + "</b>");
                    }
                }
            }else{
                //Si ha habido errores en la recepción de algún cambio limpiaremos los que dependen de él
                if(origen == 'CPROVINPAG'){
                        limpiaCampos("CPROVINPAG");
                        objDom.setVisibilidadPorId("findPoblacionPag", "hidden");// 20/03/2019 IAXIS-3243
                }
                if(origen == 'CPROVINPAR'){
                        limpiaCampos("CPROVINPAR");
                        objDom.setVisibilidadPorId("findPartes", "hidden");
                }
                if(origen == 'CPROVINFIR'){
                        limpiaCampos("CPROVINFIR");
                        objDom.setVisibilidadPorId("findFirma", "hidden");
                }
                
                if(origen == 'CPOBLACPAG'){
                        objDom.setValorHTMLPorId("TCPOBLACPAG_span", "");
                }
                if(origen == 'CPOBLACPAR'){
                        objDom.setValorHTMLPorId("TCPOBLACPAR_span", "");
                }
                if(origen == 'CPOBLACFIR'){
                        objDom.setValorHTMLPorId("TCPOBLACFIR_span", "");
                }
            
            }
        } catch (e) {
           if (isDebugAjaxEnabled == "true")
            alert (e.name + " " + e.message);
        }
    }	

	//
	/*
	f_cerrar_modalespersona(modal);

		// alert("Em cerrar persona2 "+CAGENTE);
		var porigen = 'INT';
		if (modal == 'axisper022')
			porigen = 'NUEVO';

		document.axiscga001Form.SPERSON.value = SPERSON;
		
		document.axiscga001Form.ORIGEN.value = porigen;
		document.axiscga001Form.SNIP.value = SNIP;
		document.axiscga001Form.CAGENTE_VISIO.value = CAGENTE;

		if (!objUtiles.estaVacio(SPERSON)) {
			objAjax.invokeAsyncCGI("modal_axiscga001.do?SPERSON_REL=" + SPERSON
					+ "&CAGENTE1=" + CAGENTE, callbackAjaxActualitzaPersona,
					"operation=ajax_actualizar_persona", this,
					objJsMessages.jslit_cargando);
		}*/

		//
	function f_aceptar_persona(selectedPerson, CAGENTE, SNIP, modal) {
		try {
			$("#CAGENTE").val(CAGENTE);
			var porigen = 'INT';
			f_cerrar_modalespersona(modal);
			if(objDom.getValorPorId("PERSONA_CODEUDOR")=="0"){				
				objDom.setValorPorId("SPERSON", selectedPerson);
	
				objAjax.invokeAsyncCGI("modal_axiscga002.do",
						callbackajaxGetPersona,
						"operation=ajax_get_persona&SPERSON_REL=" + selectedPerson
						+ "&CAGENTE1=" + CAGENTE,
						this, objJsMessages.jslit_actualizando_registro);
			}

			if(objDom.getValorPorId("PERSONA_CODEUDOR")=="1"){
				objDom.setValorPorId("SPERSON_CODEUDORES", selectedPerson);
				objUtiles.ejecutarFormulario("modal_axiscga002.do", "ins_codeu",
						document.miForm, "_self", objJsMessages.jslit_cargando);
				// objAjax.invokeAsyncCGI("axis_axiscga002.do", callbackajaxGetPersona, 
				// "operation=ajax_get_persona&SPERSON=" + selectedPerson , this, objJsMessages.jslit_actualizando_registro);
			}

			if(objDom.getValorPorId("PERSONA_CODEUDOR")=="2"){
				objDom.setValorPorId("SPERFIDE", selectedPerson);	

				objAjax.invokeAsyncCGI("modal_axiscga002.do",
						callbackajaxGetPersonaFede,
						"operation=ajax_get_persona&SPERSON_REL=" + selectedPerson
						+ "&CAGENTE1=" + CAGENTE,
						this, objJsMessages.jslit_actualizando_registro);
							
			}

		} catch (e) {
			if (isDebugAjaxEnabled == "true")
				alert(e.name + " " + e.message);
		}
	}

	function callbackajaxGetPersona(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);
		//alert(ajaxResponseText);
		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

			document.miForm.NNUMIDE.value = '';
			document.miForm.TNOMBRE.value = '';
			document.miForm.SPERSON.value = '';

			var TNOMBRE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TNOMBRE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TNOMBRE"), 0, 0) : "");

			var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI1")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI1"), 0, 0) : "");

			var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI2")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI2"), 0, 0) : "");

			var CTIPIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("CTIPIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("CTIPIDE"), 0, 0) : "");

			var NNUMIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("NNUMIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("NNUMIDE"), 0, 0) : "");

			var SPERSON = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("SPERSON")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("SPERSON"), 0, 0) : "");

			document.miForm.NNUMIDE.value = NNUMIDE;
			document.miForm.TNOMBRE.value = TAPELLI1 + "" + TAPELLI2 + " ,"
					+ TNOMBRE;

			objDom.setValorPorId("SPERSON", SPERSON);

		}
	}

	function f_abrir_axiscga003() {
		var varSCONTGAR = objDom.getValorPorId("SCONTGAR");
		var varNMOVIMI = objDom.getValorPorId("NMOVIMI");

		objUtiles.abrirModal("axiscga003", "src",
				"modal_axiscga003.do?operation=form" + "&SCONTGAR="
						+ varSCONTGAR + "&NMOVIMI=" + varNMOVIMI);
	}

	function f_cerrar_axiscga003() {
        
		objUtiles.cerrarModal("axiscga003");
	}

	function f_aceptar_axiscga003() {
                $('#but_aceptar').hide();
		var varSCONTGAR = objDom.getValorPorId("SCONTGAR");
		var varNMOVIMI = objDom.getValorPorId("NMOVIMI");
		objUtiles.cerrarModal("axiscga003");
		objUtiles.ejecutarFormulario("modal_axiscga002.do", "form",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA,
			CODIGO_CONDICION) {
		objUtiles.abrirModal("axiscom001", "src",
				"modal_axiscom001.do?operation=form&CODIGO_LITERAL="
						+ CODIGO_LITERAL + "&CODIGO_CONSULTA="
						+ CODIGO_CONSULTA + "&CODIGO_CONDICION="
						+ CODIGO_CONDICION);
	}

	function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA,
			CODIGO_CONDICION, CODIGO_CP) {
		objUtiles.abrirModal("axiscom001", "src",
				"modal_axiscom001.do?operation=form&CODIGO_LITERAL="
						+ CODIGO_LITERAL + "&CODIGO_CONSULTA="
						+ CODIGO_CONSULTA + "&CODIGO_CONDICION="
						+ CODIGO_CONDICION + "&TIPO=DATE&CODIGO_CP="
						+ CODIGO_CP);
	}

	function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA, CPROVIN) {
		if (CODIGO_CONSULTA == "LISTA_POBLACION_GARAN1"){
			var SSEGURO = "${__formdata.TCPOBLACPAG}";
			objDom.setValorPorId("CPOBLACPAG", CODIGO);
			objDom.setValorPorId("CPROVINPAG", CPROVIN);
			objDom.setValorPorId("TCPOBLACPAG", TEXTO);
		}
		if (CODIGO_CONSULTA == "LISTA_POBLACION_GARAN2"){
			objDom.setValorPorId("CPOBLACPAR", CODIGO);
			objDom.setValorPorId("CPROVINPAR", CPROVIN);
			objDom.setValorPorId("TCPOBLACPAR", TEXTO);
		}
		if (CODIGO_CONSULTA == "LISTA_POBLACION_GARAN3"){
			objDom.setValorPorId("CPOBLACFIR", CODIGO);
			objDom.setValorPorId("CPROVINFIR", CPROVIN);
			objDom.setValorPorId("TCPOBLACFIR", TEXTO);
		}

		if (CODIGO_CONSULTA == "LISTA_PAIS") {
			objDom.setValorPorId("CPAIS", CODIGO);
			objDom.setVisibilidadPorId("findProvincia", "visible");
			objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
			//                limpiaCampos("CPAIS");
			//                f_limpiar_valores_reteica();
		} else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
			objDom.setValorPorId("CPROVIN", CODIGO);
			objDom.setVisibilidadPorId("findPoblacion", "visible");
			objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
			//                limpiaCampos("CPROVIN");
			//                f_limpiar_valores_reteica();
		} else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
			objDom.setValorPorId("CPOBLAC", CODIGO);
			objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
			//                f_limpiar_valores_reteica();
			q = "?TPAIS=" + $("#TPAIS_span b").html() + "&TPROVIN="
					+ $("#TPROVIN_span b").html() + "&TPOBLAC="
					+ $("#TPOBLAC_span b").html();
			//                objUtiles.ejecutarFormulario("axis_axisimp010.do"+q, "form", document.${nombrePantalla}Form, "ftrabajo", objJsMessages.jslit_cargando);
		}
		f_cerrar_axiscom001();
	}

	function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
	}

	function f_nuevo_codeudor() {
            $('#but_aceptar').hide();
            objUtiles.ejecutarFormulario("modal_axiscga002.do", "ins_codeu", document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_eliminar_codeudores(SPERSON) {
		var __SPERSON=SPERSON;
		var __SCONTGAR=objDom.getValorPorId("SCONTGAR");
		var __NMOVIMI=objDom.getValorPorId("NMOVIMI");
		
		console.log("modal_axiscga002.do?SPERSON=" + __SPERSON + "&SCONTGAR=" + __SCONTGAR + "&NMOVIMI="+ __NMOVIMI);

			

		objUtiles.ejecutarFormulario("modal_axiscga002.do?__SPERSON=" + __SPERSON + "&__SCONTGAR=" + __SCONTGAR + "&__NMOVIMI="+ __NMOVIMI, "del_codeu",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	
	
	
	// TCS_827 - ACL - 27/02/2019 Se modifica el llamado a la pantalla de la axisctr019 a la axiscga004
	function f_abrir_axiscga004() {
		objUtiles.abrirModal("axiscga004", "src",
				"modal_axiscga004.do?operation=form");
	}

	function f_cerrar_axiscga004() {
		objUtiles.cerrarModal("axiscga004");
	}

	function f_aceptar_axiscga004(SSEGURO) {
		f_cerrar_axiscga004();
                $('#but_aceptar').hide();
		//            objDom.setValorComponente(document.miForm.NNUMPOL_ASO, SSEGURO);
		//objDom.setValorPorId("LIMPIAR_DATOS", "true");
		//objDom.setValorPorId("SSEGPOL", SSEGURO);
		objUtiles.ejecutarFormulario("modal_axiscga002.do?SSEGPOL2=" + SSEGURO,
				"ins_pol", document.miForm, "_self",
				objJsMessages.jslit_cargando);
	}

	function f_onchange_tipoc(CTIPO) {
		document.miForm.CTIPO.value=CTIPO;
        objUtiles.ejecutarFormulario("modal_axiscga002.do", "detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
       } 
	   
// 	Inicio  06-03-2019 IAXIS-3053
	function f_onchange_area(CAREA) {
			var tipo = $('#CTIPO').val();
			var clase = $('#CCLASE').val();
			
			//alert("tipo: "+tipo+", clase: "+clase);
	
		if(CAREA != 1 && (tipo != 1 || clase != 1)){
			document.miForm.CTIPO.value=1;
	        objUtiles.ejecutarFormulario("modal_axiscga002.do", "detalle", document.miForm, "_self", objJsMessages.jslit_cargando);
		}
	}
// 	Inicio  06-03-2019 IAXIS-3053

	function f_asociar_segur() {
		objUtiles.ejecutarFormulario("modal_axiscga002.do", "ins_pol",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	 /* function f_imprimir_fitxer(pfitxer){
		if(pfitxer!=null){
			objAjax.invokeAsyncCGI_JSON("modal_axiscga002.do?operation=descargar_reporte&SCONTGARIMP="+pfitxer, callBack_miajaxjson, "<axis:alt f='axiscga002' c='MSG_CARGAR' lit='9905686'/>")
		}
	} 

	function callBack_miajaxjson(p) {
        
        objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");

        //hay que actualizar la lista de resulotados xxx
        var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
        odiv_OBFICHERO.innerHTML="";
        var div_OBFICHEROcontenido="";
        div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";

        if (p.JSON2.LIST_FICHEROS!=null) {
        	div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxerv()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"fileAbsolutePath"+"\" id=\"fileAbsolutePath"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
            odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
            f_imprimir_fitxerv();
            
        }
    }       
	
	function f_imprimir_fitxerv(){		
		var pfitxer = document.getElementById('fileAbsolutePath').value;
	      var str2 = pfitxer.replace(/barrainvertida/gi, "\\");    
	      
	    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist003.jsp",600,200);
	}       
    function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");   
    }
    */
	
	/****************************************************************************************/
    /************************************** MODAL *******************************************/
    /****************************************************************************************/
    // INI - TCS_19 - ACL - 08/03/2019. 
    function f_but_contg() {
	var SCONTGAR = "${__formdata.SCONTGAR}";
        // Inicio IAXIS-3004 DFR - 21/03/2019
    	var vcarea        = objDom.getValorPorId("CAREA");
    	var vctipoctgar   = objDom.getValorPorId("CTIPO");
	    var vcclase       = objDom.getValorPorId("CCLASE");
	    var vcestado      = objDom.getValorPorId("CESTADO");
	    var vctipo = null;

	    //Pagarés Área Técnica
	    if (vcarea == 1 && vctipoctgar == 1) {
	    	if (vcclase == 1 ){
	    		if (vcestado == 1){
	    			vctipo = "CONF_PAGARE_ABIERTO";
	    		}else if (vcestado == 2){
	    			vctipo = "CONF_PAGARE_CERRADO";
	    		}
		    }
	    	if (vcclase == 2){
		    	vctipo = "CONF_PAGARE_CERRADO";
		    }
	    	if (vcclase == 4){
		    	vctipo = "CONF_CARTA_COMPROMI";
		    } //IAXIS-3140 CASA MATRIZ 26/03/2019 AP
			if (vcclase == 3 ){
				if (vcestado == 1) {
					vctipo = "MATRIZ_ABIERTO";
				}else if (vcestado == 2){				
					vctipo = "MATRIZ_CERRADO";
				}
			}
		}
	    // Pagaré Área Comercial
	    if (vcarea == 2){
			vctipo = "PAGARE_COMERCIAL";
	    }
		// Pagaré Área Cartera	
		if (vcarea == 3){
			vctipo = "PAGARE_CARTERA";
		}	
		// Pagaré Área Recobors	
		if (vcarea == 4){
			vctipo = "PAGARE_RECOBROS";
		}
	    
	    if (vctipo != null){
	    	console.debug("Area "+vcarea+" Tipo "+vctipoctgar+" Clase "+vcclase+" Estado "+vcestado+" Doc "+vctipo);
	    	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?&operation=impresion_personas&SPERSON="+SCONTGAR+"&TIPO="+vctipo);	    	
	    	
	    } else {
	    	alert("No existen plantillas asociadas");
	    }
        // Fin IAXIS-3004 DFR - 21/03/2019
    }
     // Inicio IAXIS-3004 DFR - 21/03/2019   
    //function f_but_contg1() {
    <%--objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagare&SCONTGAR="+SCONTGAR+"&CTIPO=PAGARE_RECOBROS"); --%>
    //}
    //function f_but_contg2() {
    <%--objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_pagare&SCONTGAR="+SCONTGAR+"&CTIPO=PAGARE_CARTERA"); --%>
    //     }
    // Fin IAXIS-3004 DFR - 21/03/2019
    function f_cerrar_axisimprimir() {
        objUtiles.cerrarModal("axisimprimir");  
    }
    // FIN - TCS_19 - ACL - 08/03/2019.
	
	
    function f_nova_persona(){
        var CAGENTE = "${__formdata.CAGENTE}";
        objUtiles.cerrarModal("axisper021");
        objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+CAGENTE);  
    }
    
    function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
    }
    
	function f_cerrar_modal(pantalla){
        objUtiles.cerrarModal(pantalla);
    }
	
    function f_abrir_axisper023() {        
        var CAGENTE = $("#CAGENTE").val()
        var SPERSON = $("#SPERSON").val()
        
        if (!objUtiles.estaVacio(SPERSON)){
            objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX=axisper023&SPERSON="+SPERSON+"&CAGENTE="+CAGENTE);            
        }
    }
    
    function f_aceptar_axisper023(){
        objUtiles.cerrarModal("axisper023");
    }    
      
</script>
</head>
<body onload="f_onload()">
	<div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_022" f="axiscga002" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper022"/>
        </c:import>      

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga002" c="TIT_AXISPER001" lit="102068" />
		</c:param>
		<c:param name="nid" value="axiscom001" />
	</c:import>
    <%--  TCS_827 - ACL - 27/02/2019 Se modifica el llamado a la pantalla de la axisctr019 a la axiscga004  --%>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga002" c="MDL_AXISCGA004" lit="1000188" />
		</c:param>
		<c:param name="nid" value="axiscga004" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga002" c="DOCU_REQUERIDA" lit="9901998" />
		</c:param>
		<c:param name="nid" value="axiscga003" />
	</c:import>


	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
                <axis:alt f="axiscga002" c="MODPER023" lit="9001817"/>
            </c:param>
            <c:param name="nid" value="axisper023"/>
        </c:import>        
	<c:import url="../include/modal_estandar.jsp">
	    <c:param name="titulo">
	         <axis:alt f="axiscga002" c="TITULOIMPRIMIR" lit="1000205" />
	    </c:param>
	    <c:param name="nid" value="axisimprimir"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">
<input type="hidden" name="PERSONA_CODEUDOR" id="PERSONA_CODEUDOR"
			value="">
			 		

		<input type="hidden" name="operation" value="" /> 
		<c:if test="${__formdata.TOMADOR_SPERSONX==null}">
			<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}">
		</c:if>
		<c:if test="${__formdata.TOMADOR_SPERSONX!=null}">
			<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.TOMADOR_SPERSONX}">
		</c:if>
                
                <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}">
		 
		
		<input type="hidden" name="SPERSON_CODEUDORES" id="SPERSON_CODEUDORES"
			value="${__formdata.SPERSON_CODEUDORES}"> <input type="hidden" name="NNUMPOL_ASO" id="NNUMPOL_ASO"
			value="${__formdata.NNUMPOL_ASO}"> <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
		<input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" /> <input type="hidden"
			name="SCONTGAR" id="SCONTGAR" value="${__formdata.SCONTGAR}" /> <input type="hidden" name="NMOVIMI"
			id="NMOVIMI" value="${__formdata.NMOVIMI}" />
			<input type="hidden" name="SSEGUROPRODUCCION" id="SSEGUROPRODUCCION" value="${__formdata.SSEGUROPRODUCCION}" />

			<input type="hidden" id="TOMADOR_SPERSONX" name="TOMADOR_SPERSONX" value="${__formdata.TOMADOR_SPERSONX}" />
			<input type="hidden" id="TOMADOR_NNUMIDEX" name="TOMADOR_NNUMIDEX" value="${__formdata.TOMADOR_NNUMIDEX}" />
			<input type="hidden" id="TOMADOR_TNOMBRE1X" name="TOMADOR_TNOMBRE1X" value="${__formdata.TOMADOR_TNOMBRE1X}" />
			<input type="hidden" id="TOMADOR_TAPELLI1X" name="TOMADOR_TAPELLI1X" value="${__formdata.TOMADOR_TAPELLI1X}" />
			<input type="hidden" id="TCPOBLACPAG" name="TCPOBLACPAG" value="${__formdata.TCPOBLACPAG}" />
			<input type="hidden" id="TCPOBLACPAR" name="TCPOBLACPAR" value="${__formdata.TCPOBLACPAR}" />
			<input type="hidden" id="TCPOBLACFIR" name="TCPOBLACFIR" value="${__formdata.TCPOBLACFIR}" />
			<input type="hidden" id="CPROVINPAG" name="CPROVINPAG" value="${__formdata.CPROVINPAG}" />  <%--TCS 309 08/03/2019 AP --%>
			<input type="hidden" id="CPROVINPAR" name="CPROVINPAR" value="${__formdata.CPROVINPAR}" />	<%--TCS 309 08/03/2019 AP --%>
			<input type="hidden" id="CPROVINFIR" name="CPROVINFIR" value="${__formdata.CPROVINFIR}" />	<%--TCS 309 08/03/2019 AP --%>		
                        <input type="hidden" name="OPMODO" id="OPMODO" value="${__formdata.OPMODO}" />
			
			<input type="hidden" name="NRADICA_BUSQ" id="NRADICA_BUSQ" value="${__formdata.NRADICA_BUSQ}" />
			<input type="hidden" name="CMODOP" id="CMODOP" value="${__formdata.CMODOP}" />
			

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisadm001" c="TITULO" lit="9908805" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisadm001" c="TITULO" lit="9908805" />
			</c:param>
			<c:param name="form">axiscga002</c:param>
		</c:import>



		<table class="area" align="center">
			<tr>
				<td id="td_LIT_9908807" class="campocaja"><img id="DS_9908807_parent" src="images/menys.gif"
					onclick="objEstilos.toggleDisplay('DS_9908807', this)" style="cursor: pointer" /> <b> <axis:alt f="axiscga002"
							c="LIT_9908807" lit="9908807" /> 
		<!-- Ini TCS_19 - ACL - 08/03/2019 -->
<!--<a href="javascript:f_imprimir_fitxer(${__formdata.SCONTGAR})"> <img border="0" alt="<axis:alt f="axiscga002" c="PRINT" lit="100001"/>"   title="<axis:alt f="axiscga002" c="PRINT" lit="100001"/>" src="images/print.gif"/></a> -->
				</b>
					<div style="clear: both;">
						<hr class="titulo"></hr>
					</div>
			<!-- Inicio IAXIS-3004 DFR - 21/03/2019 -->
				<!--<div style="float: right;"> -->
				<!--<img border="0" onclick="javascript:f_but_contg2()" -->
				<%--alt="<axis:alt f="axiscga002" c="DOCPER" lit="89906067"/>" --%>
				<%--title="<axis:alt f="axiscga002" c="DOCPER" lit="89906067"/>" --%>
				<!--src="images/print.gif" /> -->
				<!--</div> -->
				<!--<div style="float: right;"> -->
				<!--<img border="0" onclick="javascript:f_but_contg01()" -->
				<%--alt="<axis:alt f="axiscga002" c="DOCPER" lit="89906066"/>" --%>
				<%--title="<axis:alt f="axiscga002" c="DOCPER" lit="89906066"/>" --%>
				<!--src="images/print.gif" /> -->
				<!--</div> -->
				<!--<div style="float: right;"> -->
				<!--<img border="0" onclick="javascript:f_but_contg()" -->
				<%--alt="<axis:alt f="axiscga002" c="DOCPER" lit="89906065"/>" --%>
				<%--title="<axis:alt f="axiscga002" c="DOCPER" lit="89906065"/>" --%>
				<!--src="images/print.gif" /> -->
				<!--</div> -->
			
			<c:if test="${sessionScope.ACEPTAR == 1 || __formdata.CMODO == 'CONSULTA'}">
			  <div style="float: right;">
			    <img border="0" onclick="javascript:f_but_contg()"
				alt="<axis:alt f="axiscga002" c="DOCPER" lit="100001"/>"
				title="<axis:alt f="axiscga002" c="DOCPER" lit="100001"/>"
				src="images/print.gif" />
			  </div>
			</c:if>
          <!-- Fin IAXIS-3004 DFR - 21/03/2019 -->
								
					</td>
			</tr>
			<tr id="DS_9908807_children" style="display: yes">
				<td>
					<table class="seccion" style="width: 50%;">
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NNUMIDE">
								<td id="td_NNUMIDE" class="titulocaja"><b><axis:alt f="axiscga002" c="NNUMIDE" lit="9904434"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TNOMBRE">
								<td id="td_TNOMBRE" class="titulocaja"><b><axis:alt f="axiscga002" c="TNOMBRE" lit="105940"></axis:alt></b></td>
							</axis:ocultar>                                                       
						</tr>
						<tr>
						
						<%-- TCS_823 - ACL- 07/03/2019 - Se agrega condicin para no mostrar el lapiz en modo diferente a nuevo--%>
						<c:if test="${__formdata.TOMADOR_SPERSONX==null}">
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NNUMIDE">
									<!-- TODO C -->
									<td class="campocaja"><input type="text" name="NNUMIDE" id="NNUMIDE"
										value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto"
										style="width: 90%;" onkeypress="return false;"
										<axis:atr f="axiscga002" c="NNUMIDE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="NNUMIDE" lit="9904434" />"
										title="<axis:alt f="axiscga002" c="NNUMIDE" lit="9904434" />" /> 
										<c:if test="${__formdata.CMODO != 'CONSULTA' && __formdata.NRADICA==null}">
											<img border="0" src="images/find.gif"
											onclick="f_abrir_axisper021_persona()" style="cursor: pointer">
										</c:if>
										</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axiscga002" c="TNOMBRE">
									<!-- TODO C -->
									<td class="campocaja"><input type="text" name="TNOMBRE" id="TNOMBRE" value="${__formdata.TNOMBRE}"
										class="campowidthinput campo campotexto" style="width: 90%;" readonly="readonly"
										<axis:atr f="axiscga002" c="TNOMBRE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="TNOMBRE" lit="105940" />"
										title="<axis:alt f="axiscga002" c="TNOMBRE" lit="105940" />" /></td>
								</axis:ocultar>
						</c:if>
						<c:if test="${__formdata.TOMADOR_SPERSONX!=null}">
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NNUMIDE">
									<!-- TODO C -->
									<td class="campocaja"><input type="text" name="NNUMIDE" id="NNUMIDE"
										value="${__formdata.TOMADOR_NNUMIDEX}" class="campowidthinput campo campotexto"
										style="width: 90%;" onkeypress="return false;"
										<axis:atr f="axiscga002" c="NNUMIDE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="NNUMIDE" lit="9904434" />"
										title="<axis:alt f="axiscga002" c="NNUMIDE" lit="9904434" />" />										
										</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axiscga002" c="TNOMBRE">
									<!-- TODO C -->
									<td class="campocaja"><input type="text" name="TNOMBRE" id="TNOMBRE" value="${__formdata.TOMADOR_TNOMBRE1X} ${__formdata.TOMADOR_TAPELLI1X}"
										class="campowidthinput campo campotexto" style="width: 90%;" readonly="readonly"
										<axis:atr f="axiscga002" c="TNOMBRE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="TNOMBRE" lit="105940" />"
										title="<axis:alt f="axiscga002" c="TNOMBRE" lit="105940" />" /></td>
								</axis:ocultar>
						</c:if>
                                                
                                                <axis:ocultar dejarHueco="false" f="axiscga002" c="DETPER">
                                                    <td style="float:right;">
                                                        <img alt="Editar propiedades" title="Editar propiedades" src="images/lapiz.gif" 
                                                            onclick="f_abrir_axisper023()" border="0" style="cursor: pointer">
                                                    </td>                                                         
                                                </axis:ocultar>                                                
							
						</tr>
					</table>
				</td>
			</tr>
		</table>




		<table class="area" align="center">
			<tr>
				<td id="td_LIT_9908808" class="campocaja"><img id="DS_9908808_parent" src="images/menys.gif"
					onclick="objEstilos.toggleDisplay('DS_9908808', this)" style="cursor: pointer" /> <b> <axis:alt f="axiscga002"
							c="LIT_9908808" lit="9908808" />
				</b>
					<div style="clear: both;">
						<hr class="titulo"></hr>
					</div></td>
			</tr>
			<tr id="DS_9908808_children" style="display: yes">
				<td>
					<table class="seccion">
					
<!-- 				Inicio  06-03-2019 IAXIS-3053 -->
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CAREA">
								<td id="td_CAREA" class="titulocaja"><b><axis:alt f="axiscga002" c="CAREA" lit="89906238"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CAREA">
								<td id="td_CAREA"><select title="<axis:alt f='axiscga002' c='CAREA' lit='89906238' />" onchange="f_onchange_area(this.value); f_cargar_propiedades_pantalla();"
									alt="<axis:alt f='axiscga002' c='CAREA' lit='89906238' />" name="CAREA" id="CAREA" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CAREA" a="isInputText=false&modificable=true&obligatorio=true"/>>
										<%/*<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>*/%>
										<c:forEach var="area" items="${requestScope.LS_AREA_CONTRAGARANTIA}">
											<option value="${area.CATRIBU}"
												<c:if test="${area.CATRIBU == __formdata.CAREA}">selected</c:if>>${area.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
						</tr>
<!-- 				Fin  06-03-2019 IAXIS-3053 -->
					
					
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTIPO">
								<td id="td_CTIPO" class="titulocaja"><b><axis:alt f="axiscga002" c="CTIPO" lit="9908809"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CCLASE">
								<td id="td_CCLASE" class="titulocaja"><b><axis:alt f="axiscga002" c="CCLASE" lit="9908810"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CMONEDA">
								<td id="td_CMONEDA" class="titulocaja"><b><axis:alt f="axiscga002" c="CMONEDA" lit="9908811"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IVALOR">
								<td id="td_IVALOR" class="titulocaja"><b><axis:alt f="axiscga002" c="IVALOR" lit="101159"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDESCRIPCION">
								<td id="td_TDESCRIPCION" class="titulocaja"><b><axis:alt f="axiscga002" c="TDESCRIPCION" lit="100588"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr> 
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTIPO">
								<td id="td_CTIPO"><select title="<axis:alt f='axiscga002' c='CTIPO' lit='9908809' />" onchange="f_onchange_tipoc(this.value)"
									alt="<axis:alt f='axiscga002' c='CTIPO' lit='9908809' />" name="CTIPO" id="CTIPO" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CTIPO" a="isInputText=false&modificable=true"/>>
										<%/*<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>*/%>
										<c:forEach var="tipo" items="${requestScope.LS_TIPO_CONTRAGARANTIA}">
											<option value="${tipo.CATRIBU}"
												<c:if test="${tipo.CATRIBU == __formdata.CTIPO}">selected</c:if>>${tipo.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
								
								<axis:ocultar dejarHueco="false" f="axiscga002" c="CCLASE">
								<td id="td_CCLASE"><select title="<axis:alt f='axiscga002' c='CCLASE' lit='9908810' />"
									alt="<axis:alt f='axiscga002' c='CCLASE' lit='9908810' />" name="CCLASE" id="CCLASE" size="1"
									onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CCLASE" a="isInputText=false&modificable=true"/>>
										<%/*<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>*/%>
										<c:forEach var="clase" items="${requestScope.LS_CLASE_CONTRAGARANTIA}">
											<option value="${clase.CATRIBU}"
												<c:if test="${clase.CATRIBU == __formdata.CCLASE}">selected</c:if>>${clase.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							
							
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CMONEDA">
								<td id="td_CMONEDA"><select title="<axis:alt f='axiscga002' c='CMONEDA' lit='9908811' />"
									alt="<axis:alt f='axiscga002' c='CMONEDA' lit='9908811' />" name="CMONEDA" id="CMONEDA" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CMONEDA" a="isInputText=false&modificable=true&obligatorio=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="moneda" items="${requestScope.LS_MONEDAS}">
											<option value="${moneda.CMONEDA}"
												<c:if test="${moneda.CMONEDA == __formdata.CMONEDA}">selected</c:if>>${moneda.TMONEDA}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IVALOR">
								<!-- TODO C -->
								<td id="td_IVALOR" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IVALOR" id="IVALOR"
                                                                        value ="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.IVALOR}"/>"
                                                                        class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IVALOR" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="IVALOR" lit="101159" />"
									title="<axis:alt f="axiscga002" c="IVALOR" lit="101159" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDESCRIPCION">
								<!-- TODO C -->
								<td id="td_TDESCRIPCION" class="campocaja"><input type="text" name="TDESCRIPCION" id="TDESCRIPCION"
									value="${__formdata.TDESCRIPCION}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TDESCRIPCION" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TDESCRIPCION" lit="100588" />"
									title="<axis:alt f="axiscga002" c="TDESCRIPCION" lit="100588" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
						
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI">
								<td id="td_FVENCIMI" class="titulocaja"><b><axis:alt f="axiscga002" c="FVENCIMI" lit="100885"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NEMPRESA">
								<td id="td_NEMPRESA" class="titulocaja"><b><axis:alt f="axiscga002" c="NEMPRESA" lit="101619"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NRADICA">
								<td id="td_NRADICA" class="titulocaja"><b><axis:alt f="axiscga002" c="NRADICA" lit="9908812"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FCREA">
								<td id="td_FCREA" class="titulocaja"><b><axis:alt f="axiscga002" c="FCREA" lit="9908813"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="DOCUMENTO">
								<td id="td_DOCUMENTO" class="titulocaja"><b><axis:alt f="axiscga002" c="DOCUMENTO" lit="9904434"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI">
								<td id="td_FVENCIMI"><input type="text" name="FVENCIMI" id="FVENCIMI" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVENCIMI}"/>"
									title="<axis:alt f='axiscga002' c='FVENCIMI' lit='100885'/>"
									alt="<axis:alt f='axiscga002' c='FVENCIMI' lit='100885'/>"
									<axis:atr f="axiscga002" c="FVENCIMI" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
									<img id="icon_FVENCIMI"
										alt="<axis:alt f="axiscga002" c="FVENCIMI" lit="100885"/>"
										title="<axis:alt f="axiscga002" c="FVENCIMI" lit="100885" />" src="images/calendar.gif" />
										</c:if>
										
								</a></td>
							</axis:ocultar>
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NEMPRESA">
								<!-- TODO C -->
								<td id="td_NEMPRESA" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NEMPRESA" id="NEMPRESA" value="${__formdata.NEMPRESA}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NEMPRESA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NEMPRESA" lit="101619" />"
									title="<axis:alt f="axiscga002" c="NEMPRESA" lit="101619" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NRADICA">
								<!-- TODO C -->
								<td id="td_NRADICA" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NRADICA" id="NRADICA" value="${__formdata.NRADICA}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NRADICA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NRADICA" lit="9908812" />"
									title="<axis:alt f="axiscga002" c="NRADICA" lit="9908812" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FCREA">
								<td id="td_FCREA">
                                                                <jsp:useBean id="today_FCREA" class="java.util.Date" /> 
                                                                <c:set var="FCREA"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCREA}"/></c:set>
                                                                <input type="text" name="FCREA" id="FCREA" size="15" class="campo campotexto" style="width: 70%;"
                                                                        value="${FCREA}<c:if test="${empty FCREA}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FCREA}"/></c:if>"
									title="<axis:alt f='axiscga002' c='FCREA' lit='9908813'/>"
									alt="<axis:alt f='axiscga002' c='FCREA' lit='9908813'/>"
									<axis:atr f="axiscga002" c="FCREA" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
									<img id="icon_FCREA"
										alt="<axis:alt f="axiscga002" c="FCREA" lit="9908813"/>"
										title="<axis:alt f="axiscga002" c="FCREA" lit="9908813" />" src="images/calendar.gif" />
										</c:if>
								</a></td>
							</axis:ocultar>
							<%-- TCS_823 - ACL- 04/03/2019 - Se quita obligatoriedad del campo --%>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="DOCUMENTO">
								<!-- TODO C -->
								<td id="td_DOCUMENTO" class="campocaja"><input type="text" name="DOCUMENTO" id="DOCUMENTO" value="${__formdata.DOCUMENTO}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="DOCUMENTO" a="modificable=true&obligatorio=false"/>  
									alt="<axis:alt f="axiscga002" c="DOCUMENTO" lit="9904434" />"
									title="<axis:alt f="axiscga002" c="DOCUMENTO" lit="9904434" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
						
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTENEDOR">
								<td id="td_CTENEDOR" class="titulocaja"><b><axis:alt f="axiscga002" c="CTENEDOR" lit="89906063"></axis:alt></b></td> <!--  08-03-2019 IAXIS-3053 -->
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TOBSTEN">
								<td id="td_TOBSTEN" class="titulocaja"><b><axis:alt f="axiscga002" c="TOBSTEN" lit="9908814"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CESTADO">
								<td id="td_CESTADO" class="titulocaja"><b><axis:alt f="axiscga002" c="CESTADO" lit="9908815"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CORIGEN">
								<td id="td_CORIGEN" class="titulocaja"><b><axis:alt f="axiscga002" c="CORIGEN" lit="9908816"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TCAUSA">
								<td id="td_TCAUSA" class="titulocaja"><b><axis:alt f="axiscga002" c="TCAUSA" lit="9908817"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
						<%--  TCS_818 - ACL - 20/02/2019 - Se aade el proceso onchange --%>	
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTENEDOR">
								<!--  08-03-2019 IAXIS-2489 -->
								<td id="td_CTENEDOR"><select title="<axis:alt f='axiscga002' c='CTENEDOR' lit='89906063' />" 
								alt="<axis:alt f='axiscga002' c='CTENEDOR' lit='89906063' />" name="CTENEDOR" id="CTENEDOR" size="1"
									onchange="document.miForm.CORIGEN.value='';f_cargar_propiedades_pantalla();"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CTENEDOR" a="isInputText=false&modificable=true&obligatorio=true"/>>
						   <!--  08-03-2019 IAXIS-2489 -->	
									
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="tenedor" items="${requestScope.LS_TENEDOR}">
											<option value="${tenedor.CATRIBU}"
												<c:if test="${tenedor.CATRIBU == __formdata.CTENEDOR}">selected</c:if>>${tenedor.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TOBSTEN">
								<!-- TODO C -->
								<td id="td_TOBSTEN" class="campocaja"><input type="text" name="TOBSTEN" id="TOBSTEN" value="${__formdata.TOBSTEN}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TOBSTEN" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TOBSTEN" lit="9908814" />"
									title="<axis:alt f="axiscga002" c="TOBSTEN" lit="9908814" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CESTADO">
								<td id="td_CESTADO"><select title="<axis:alt f='axiscga002' c='CESTADO' lit='9908815' />"
									alt="<axis:alt f='axiscga002' c='CESTADO' lit='9908815' />" name="CESTADO" id="CESTADO" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CESTADO" a="isInputText=false&modificable=true&obligatorio=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="estado" items="${requestScope.LS_ESTADO_CONTRAGARANTIA}">
											<option value="${estado.CATRIBU}"
												<c:if test="${estado.CATRIBU == __formdata.CESTADO}">selected</c:if>>${estado.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<%--  TCS_818 - ACL - 20/02/2019 - Se quita el proceso onchange --%>	
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CORIGEN">
								<td id="td_CORIGEN"><select title="<axis:alt f='axiscga002' c='CORIGEN' lit='9908816' />"
                                                                     <%--   onchange="f_cargar_propiedades_pantalla()"   --%>
									alt="<axis:alt f='axiscga002' c='CORIGEN' lit='9908816' />" name="CORIGEN" id="CORIGEN" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CORIGEN" a="isInputText=false&modificable=true&obligatorio=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="origen" items="${requestScope.LS_ORIGEN_CONTRAGARANTIA}">
											<option value="${origen.CATRIBU}"
												<c:if test="${origen.CATRIBU == __formdata.CORIGEN}">selected</c:if>>${origen.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TCAUSA">
								<!-- TODO C -->
								<td id="td_TCAUSA" class="campocaja"><input type="text" name="TCAUSA" id="TCAUSA" value="${__formdata.TCAUSA}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TCAUSA" a="modificable=true&obligatorio=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TCAUSA" lit="9908817" />"
									title="<axis:alt f="axiscga002" c="TCAUSA" lit="9908817" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TAUXILIA">
								<td id="td_TAUXILIA" class="titulocaja"><b><axis:alt f="axiscga002" c="TAUXILIA" lit="89906064"></axis:alt></b></td><!--  08-03-2019 IAXIS-3053 -->
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TAUXILIA">
								<!-- TODO C -->
								<td id="td_TAUXILIA" class="campocaja"><input type="text" name="TAUXILIA" id="TAUXILIA" value="${__formdata.TAUXILIA}"
									class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TAUXILIA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TAUXILIA" lit="89906064" />" title="<axis:alt f="axiscga002" c="TAUXILIA" lit="89906064" />" /></td><!--  08-03-2019 IAXIS-3053 -->
							</axis:ocultar>
						</tr>
					</table>
				</td>
			</tr>
		</table>



		<table class="area" align="center">
			<tr>
				<td id="td_LIT_9908820" class="campocaja"><img id="DS_9908820_parent" src="images/menys.gif"
					onclick="objEstilos.toggleDisplay('DS_9908820', this)" style="cursor: pointer" /> <b> <axis:alt f="axiscga002"
							c="LIT_9908820" lit="9908820" />
				</b>
					<div style="clear: both;">
						<hr class="titulo"></hr>
					</div></td>
			</tr>
			<tr id="DS_9908820_children" style="display: yes">
				<td>
					<table class="seccion">
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NSINIES">
								<td id="td_NSINIES" class="titulocaja"><b><axis:alt f="axiscga002" c="NSINIES" lit="100585"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TEXPAGARE">
								<td id="td_TEXPAGARE" class="titulocaja"><b><axis:alt f="axiscga002" c="TEXPAGARE" lit="89906245"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
						      <axis:ocultar dejarHueco="false" f="axiscga002" c="NSINIES">
									<!-- TODO C -->
									<td id="td_NSINIES" class="campocaja"><input type="text" name="NSINIES" id="NSINIES"
										value="${__formdata.NSINIES}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axiscga002" c="NSINIES" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="NSINIES" lit="100585" />"
										title="<axis:alt f="axiscga002" c="NSINIES" lit="100585" />" /></td>
							</axis:ocultar>  
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TEXPAGARE">
									<!-- TODO C -->
									<td id="td_TEXPAGARE" class="campocaja"><input type="text" name="TEXPAGARE" id="TEXPAGARE"
										value="${__formdata.TEXPAGARE}" class="campowidthinput campo campotexto" style="width: 250%;"
										<axis:atr f="axiscga002" c="TEXPAGARE" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axiscga002" c="TEXPAGARE" lit="89906245" />"
										title="<axis:alt f="axiscga002" c="TEXPAGARE" lit="89906245" />" /></td>
							</axis:ocultar> 
						</tr>
						<tr>
							<axis:ocultar f="axiscga002" c="FEXPEDIC" dejarHueco="false">
								<td id="td_FEXPEDIC" class="titulocaja"><b><axis:alt f="axiscga002" c="FEXPEDIC" lit="9908822"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TEXIDEN">
								<td id="td_TEXIDEN" class="titulocaja"><b><axis:alt f="axiscga002" c="TEXIDEN" lit="89906246"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CBANCO">
								<td id="td_CBANCO" class="titulocaja"><b><axis:alt f="axiscga002" c="CBANCO" lit="9908823"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="SPERFIDE">
								<td id="td_SPERFIDE" class="titulocaja"><b><axis:alt f="axiscga002" c="SPERFIDE" lit="9908824"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NOMBREFIDE">
								<td id="td_NOMBREFIDE" class="titulocaja"><b><axis:alt f="axiscga002" c="NOMBREFIDE" lit="105940"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TSUCURSAL">
								<td id="td_TSUCURSAL" class="titulocaja"><b><axis:alt f="axiscga002" c="TSUCURSAL" lit="9908825"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTERES">
								<td id="td_IINTERES" class="titulocaja"><b><axis:alt f="axiscga002" c="IINTERES" lit="9908826"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar  f="axiscga002" c="FEXPEDIC" dejarHueco="false">
								<td id="td_FEXPEDIC"><input type="text" name="FEXPEDIC" id="FEXPEDIC" size="15" class="campo campotexto" style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEXPEDIC}"/>"
									title="<axis:alt f='axiscga002' c='FEXPEDIC' lit='9908822'/>"
									alt="<axis:alt f='axiscga002' c='FEXPEDIC' lit='9908822'/>"
									<axis:atr f="axiscga002" c="FEXPEDIC" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FEXPEDIC"
										alt="<axis:alt f="axiscga002" c="FEXPEDIC" lit="9908822"/>"
										title="<axis:alt f="axiscga002" c="FEXPEDIC" lit="9908822" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TEXIDEN">
									<!-- TODO C -->
									<td id="td_TEXIDEN" class="campocaja"><input type="text" name="TEXIDEN" id="TEXIDEN"
										value="${__formdata.TEXIDEN}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axiscga002" c="TEXIDEN" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axiscga002" c="TEXIDEN" lit="89906071" />"
										title="<axis:alt f="axiscga002" c="TEXIDEN" lit="89906071" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CBANCO">
								<td id="td_CBANCO"><select title="<axis:alt f='axiscga002' c='CBANCO' lit='9908823' />"
									alt="<axis:alt f='axiscga002' c='CBANCO' lit='9908823' />" name="CBANCO" id="CBANCO" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CBANCO" a="isInputText=false&modificable=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="banco" items="${requestScope.LS_BANCOS}">
											<option value="${banco.CBANCO}"
												<c:if test="${banco.CBANCO == __formdata.CBANCO}">selected</c:if>>${banco.TBANCO}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="SPERFIDE">
								<!-- TODO C -->
								<td id="td_SPERFIDE" class="campocaja"><input type="text" name="SPERFIDE" id="SPERFIDE" readonly="readonly"
									value="${__formdata.SPERFIDE}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="SPERFIDE" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="SPERFIDE" lit="9908824" />"
									title="<axis:alt f="axiscga002" c="SPERFIDE" lit="9908824" />" />
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
									<img border="0" src="images/find.gif" onclick="f_abrir_axisper021_perfide()" style="cursor: pointer">
									</c:if>
									</td>
									
									
							</axis:ocultar>
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NOMBREFIDE">
								<!-- TODO C -->
								<td id="td_NOMBREFIDE" class="campocaja"><input type="text" name="NOMBREFIDE" id="NOMBREFIDE" readonly="readonly"
									value="${__formdata.NOMBREFIDE}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NOMBREFIDE" a="formato=entero&modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NOMBREFIDE" lit="105940" />"
									title="<axis:alt f="axiscga002" c="NOMBREFIDE" lit="105940" />" />
									
									</td>
									
							<%-- TCS_823 - ACL - 26/02/2019 se quita la obligatoriedad de algunos campos:
							     TSUCURSAL, IINTERES, FVENCIMI1, IASEGURA, CPROVIN, CPOBLAC --%>		
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TSUCURSAL">
								<!-- TODO C -->
								<td id="td_TSUCURSAL" class="campocaja"><input type="text" name="TSUCURSAL" id="TSUCURSAL"
									value="${__formdata.TSUCURSAL}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TSUCURSAL" a="modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="TSUCURSAL" lit="9908825" />"
									title="<axis:alt f="axiscga002" c="TSUCURSAL" lit="9908825" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTERES">
								<!-- TODO C -->
								<td id="td_IINTERES" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IINTERES" id="IINTERES"
									value="${__formdata.IINTERES}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IINTERES" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="IINTERES" lit="9908826" />"
									title="<axis:alt f="axiscga002" c="IINTERES" lit="9908826" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLAZO">
								<td id="td_NPLAZO" class="titulocaja"><b><axis:alt f="axiscga002" c="NPLAZO" lit="9908829"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI1">
								<td id="td_FVENCIMI1" class="titulocaja"><b><axis:alt f="axiscga002" c="FVENCIMI1" lit="9908827"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI2">
								<td id="td_FVENCIMI2" class="titulocaja"><b><axis:alt f="axiscga002" c="FVENCIMI2" lit="9908828"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IASEGURA">
								<td id="td_IASEGURA" class="titulocaja"><b><axis:alt f="axiscga002" c="IASEGURA" lit="9908830"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLAZO">
								<!-- TODO C -->
								<td id="td_NPLAZO" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NPLAZO" id="NPLAZO"
									value="${__formdata.NPLAZO}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NPLAZO" a="formato=entero&modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NPLAZO" lit="9908829" />"
									title="<axis:alt f="axiscga002" c="NPLAZO" lit="9908829" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI1">
								<td id="td_FVENCIMI1"><input type="text" name="FVENCIMI1" id="FVENCIMI1" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVENCIMI1}"/>"
									title="<axis:alt f='axiscga002' c='FVENCIMI1' lit='9908827'/>"
									alt="<axis:alt f='axiscga002' c='FVENCIMI1' lit='9908827'/>"
									<axis:atr f="axiscga002" c="FVENCIMI1" a="formato=fecha&modificable=true&obligatorio=false"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FVENCIMI1"
										alt="<axis:alt f="axiscga002" c="FVENCIMI1" lit="9908827"/>"
										title="<axis:alt f="axiscga002" c="FVENCIMI1" lit="9908827" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FVENCIMI2">
								<td id="td_FVENCIMI2"><input type="text" name="FVENCIMI2" id="FVENCIMI2" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVENCIMI2}"/>"
									title="<axis:alt f='axiscga002' c='FVENCIMI2' lit='9908828'/>"
									alt="<axis:alt f='axiscga002' c='FVENCIMI2' lit='9908828'/>"
									<axis:atr f="axiscga002" c="FVENCIMI2" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FVENCIMI2"
										alt="<axis:alt f="axiscga002" c="FVENCIMI2" lit="9908828"/>"
										title="<axis:alt f="axiscga002" c="FVENCIMI2" lit="9908828" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IASEGURA">
								<!-- TODO C -->
								<td id="td_IASEGURA"class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IASEGURA" id="IASEGURA"
									value="${__formdata.IASEGURA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IASEGURA" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="IASEGURA" lit="9908830" />"
									title="<axis:alt f="axiscga002" c="IASEGURA" lit="9908830" />" /></td>
							</axis:ocultar>
						</tr>
						<!--  TCS_319 - ACL - 14-03-2019 -->
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="PORCENTAJE">
								<td id="td_PORCENTAJE" class="titulocaja"><b><axis:alt f="axiscga002" c="PORCENTAJE" lit="89906068"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FOBLIG">
								<td id="td_FOBLIG" class="titulocaja"><b><axis:alt f="axiscga002" c="FOBLIG" lit="89906069"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CCUENTA">
								<td id="td_CCUENTA" class="titulocaja"><b><axis:alt f="axiscga002" c="CCUENTA" lit="89906070"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NCUENTA">
								<td id="td_NCUENTA" class="titulocaja"><b><axis:alt f="axiscga002" c="NCUENTA" lit="89906071"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="PORCENTAJE">
									<!-- TODO C -->
									<td id="td_PORCENTAJE" class="campocaja"><input type="text" name="PORCENTAJE" id="PORCENTAJE"
										value="${__formdata.PORCENTAJE}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axiscga002" c="PORCENTAJE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="PORCENTAJE" lit="89906068" />"
										title="<axis:alt f="axiscga002" c="PORCENTAJE" lit="89906068" />" /></td>
							</axis:ocultar>  

							<axis:ocultar dejarHueco="false" f="axiscga002" c="FOBLIG">
									<!-- TODO C -->
									<td id="td_FOBLIG" class="campocaja"><input type="text" name="FOBLIG" id="FOBLIG"
										value="${__formdata.FOBLIG}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axiscga002" c="FOBLIG" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="FOBLIG" lit="89906069" />"
										title="<axis:alt f="axiscga002" c="FOBLIG" lit="89906069" />" /></td>
							</axis:ocultar>	
						<axis:ocultar dejarHueco="false" f="axiscga002" c="CCUENTA">
								<td id="td_CCUENTA"><select title="<axis:alt f='axiscga002' c='CCUENTA' lit='89906070' />"
									alt="<axis:alt f='axiscga002' c='CCUENTA' lit='89906070' />" name="CCUENTA" id="CCUENTA" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CCUENTA" a="isInputText=false&modificable=true&obligatorio=false"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="estado" items="${requestScope.LS_CLASE_CUENTA}">
											<option value="${estado.CATRIBU}"
												<c:if test="${estado.CATRIBU == __formdata.CCUENTA}">selected</c:if>>${estado.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NCUENTA">
									<!-- TODO C -->
									<td id="td_NCUENTA" class="campocaja"><input type="text" name="NCUENTA" id="NCUENTA"
										value="${__formdata.NCUENTA}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axiscga002" c="NCUENTA" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axiscga002" c="NCUENTA" lit="89906071" />"
										title="<axis:alt f="axiscga002" c="NCUENTA" lit="89906071" />" /></td>
							</axis:ocultar> 
						</tr>	
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTCAP">
								<td id="td_IINTCAP" class="titulocaja"><b><axis:alt f="axiscga002" c="IINTCAP" lit="9908831"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NNUMESCR">
								<td id="td_NNUMESCR" class="titulocaja"><b><axis:alt f="axiscga002" c="NNUMESCR" lit="9908832"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NOTARIA">
								<td id="td_NOTARIA" class="titulocaja"><b><axis:alt f="axiscga002" c="NOTARIA" lit="89908131"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="MATRICULA">
								<td id="td_MATRICULA" class="titulocaja"><b><axis:alt f="axiscga002" c="MATRICULA" lit="89908132"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FESCRITURA">
								<td id="td_FESCRITURA" class="titulocaja"><b><axis:alt f="axiscga002" c="FESCRITURA" lit="9908833"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDESCRIPCION_CLASE">
								<td id="td_TDESCRIPCION_CLASE" class="titulocaja"><b><axis:alt f="axiscga002" c="TDESCRIPCION_CLASE" lit="9908834"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPAIS">
								<td id="td_CPAIS" class="titulocaja"><b><axis:alt f="axiscga002" c="CPAIS" lit="9908821"></axis:alt></b></td>
							</axis:ocultar>
							<%-- TCS_826 - ACL - 25/02/2019 Se agregan los campos TITCDT y NITTIT --%>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TITCDT">
								<td id="td_TITCDT" class="titulocaja"><b><axis:alt f="axiscga002" c="TITCDT" lit="89906184"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NITTIT">
								<td id="td_NITTIT" class="titulocaja"><b><axis:alt f="axiscga002" c="NITTIT" lit="89906185"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr> <%--TCS 309 08/03/2019 AP --%>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IVALOR2">
								<td id="td_IVALOR2" class="titulocaja"><b><axis:alt f="axiscga002" c="IVALOR2" lit="9905283"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTERES2">
								<td id="td_IINTERES2" class="titulocaja"><b><axis:alt f="axiscga002" c="IINTERES2" lit="9908826"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TASA">
								<td id="td_TASA" class="titulocaja"><b><axis:alt f="axiscga002" c="TASA" lit="9902290"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IVA">
								<td id="td_IVA" class="titulocaja"><b><axis:alt f="axiscga002" c="IVA" lit="9001321"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACPAG">
								<td id="td_CPOBLACPAG" class="titulocaja"><b><axis:alt f="axiscga002" c="CPOBLACPAG" lit="89906239"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr> 
						<axis:ocultar dejarHueco="false" f="axiscga002" c="IVALOR2">
								<td id="td_IVALOR2"class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IVALOR2" id="IVALOR2"
									value="${__formdata.IVALOR}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IVALOR2" a="formato=entero&modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="IVALOR2" lit="9905283" />"
									title="<axis:alt f="axiscga002" c="IVALOR2" lit="9905283" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTERES2">
								<td id="td_IINTERES2" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IINTERES2" id="IINTERES2"
									value="${__formdata.IINTERES}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IINTERES2" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="IINTERES2" lit="9908826" />"
									title="<axis:alt f="axiscga002" c="IINTERES2" lit="9908826" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TASA">
								<td id="td_TASA"class="campocaja"><input type="text" name="TASA" id="TASA"
									value="${__formdata.TASA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TASA" a="modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="TASA" lit="9902290" />"
									title="<axis:alt f="axiscga002" c="TASA" lit="9902290" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IVA">
								<td id="td_IVA"class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IVA" id="IVA"
									value="${__formdata.IVA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IVA" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="IVA" lit="9001321" />"
									title="<axis:alt f="axiscga002" c="IVA" lit="9001321" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACPAG">
							<td id="td_CPOBLACPAG" class="campocaja">  <!--  20/03/2019 IAXIS-3243    --> 
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLACPAG}" name="CPOBLACPAG" id="CPOBLACPAG" onchange="f_onchange_axiscga002()" style="width:18%;"
                                       title="<axis:alt f="axiscga002" c="CPOBLACPAG" lit="100817"/>" onkeypress="return isNumberKey(event);"
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
                                       <axis:atr f="axisper012" c="CPOBLACPAG" a="modificable=false&obligatorio=true"/></c:if>/>
                                <img id="findPoblacionPag" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_GARAN1', document.miForm.CPOBLACPAG.value)"/>  <!--  20/03/2019 IAXIS-3243    -->         
                                <span id="TCPOBLACPAG_span"><b>${__formdata.TCPOBLACPAG}</b></span>
                            </td>
							</axis:ocultar>
							</tr>
							<tr>  
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLAZO2">
								<td id="td_NPLAZO2" class="titulocaja"><b><axis:alt f="axiscga002" c="NPLAZO2" lit="9907242"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FINIPAG">
								<td id="td_FINIPAG" class="titulocaja"><b><axis:alt f="axiscga002" c="FINIPAG" lit="9901648"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FFINPAG">
								<td id="td_FFINPAG" class="titulocaja"><b><axis:alt f="axiscga002" c="FFINPAG" lit="9901649"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACPAR">
								<td id="td_CPOBLACPAR" class="titulocaja"><b><axis:alt f="axiscga002" c="CPOBLACPAR" lit="89906240"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACFIR">
								<td id="td_CPOBLACFIR" class="titulocaja"><b><axis:alt f="axiscga002" c="CPOBLACFIR" lit="89906062"></axis:alt></b></td>
							</axis:ocultar>
						</tr> <%--ALEJANDRA --%>
							<tr> 
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLAZO2">
								<td id="td_NPLAZO2" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NPLAZO2" id="NPLAZO2"
									value="${__formdata.NPLAZO}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NPLAZO2" a="formato=entero&modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NPLAZO2" lit="9908829" />"
									title="<axis:alt f="axiscga002" c="NPLAZO2" lit="9908829" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FINIPAG">
								<td id="td_FINIPAG"><input type="text" name="FINIPAG" id="FINIPAG" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIPAG}"/>"
									title="<axis:alt f='axiscga002' c='FINIPAG' lit='9901648'/>"
									alt="<axis:alt f='axiscga002' c='FINIPAG' lit='9901648'/>"
									<axis:atr f="axiscga002" c="FINIPAG" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FINIPAG"
										alt="<axis:alt f="axiscga002" c="FINIPAG" lit="9901648"/>"
										title="<axis:alt f="axiscga002" c="FINIPAG" lit="9901648" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FFINPAG">
								<td id="td_FFINPAG"><input type="text" name="FFINPAG" id="FFINPAG" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINPAG}"/>"
									title="<axis:alt f='axiscga002' c='FFINPAG' lit='9901649'/>"
									alt="<axis:alt f='axiscga002' c='FFINPAG' lit='9901649'/>"
									<axis:atr f="axiscga002" c="FFINPAG" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FFINPAG"
										alt="<axis:alt f="axiscga002" c="FFINPAG" lit="9901649"/>"
										title="<axis:alt f="axiscga002" c="FFINPAG" lit="9901649" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACPAR">
							<td id="td_CPOBLACPAR"  class="campocaja"><!--  20/03/2019 IAXIS-3243    -->
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLACPAR}" name="CPOBLACPAR" id="CPOBLACPAR" onchange="f_onchange_partes()" style="width:18%;"
                                       title="<axis:alt f="axiscga002" c="CPOBLACPAR" lit="100817"/>" onkeypress="return isNumberKey(event);" 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
                                       <axis:atr f="axisper012" c="CPOBLACPAR" a="modificable=false&obligatorio=true"/></c:if>/>
                                <img id="findPartes" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_GARAN2', document.miForm.CPOBLACPAR.value)"/>              
                                <span id="TCPOBLACPAR_span"><b>${__formdata.TCPOBLACPAR}</b></span>
                            </td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLACFIR">
							<td id="td_CPOBLACFIR" class="campocaja"><!--  20/03/2019 IAXIS-3243    -->
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLACFIR}" name="CPOBLACFIR" id="CPOBLACFIR" onchange="f_onchange_firma()" style="width:18%;"
                                       title="<axis:alt f="axiscga002" c="CPOBLACFIR" lit="100817"/>" onkeypress="return isNumberKey(event);" 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
                                       <axis:atr f="axisper012" c="CPOBLACFIR" a="modificable=false&obligatorio=true"/></c:if>/>
                               <img id="findFirma" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_GARAN3', document.miForm.CPOBLACFIR.value)"/>              
                               <span id="TCPOBLACFIR_span"><b>${__formdata.TCPOBLACFIR}</b></span>
                            </td>
							</axis:ocultar>
						</tr> <%--TCS 309 08/03/2019 AP --%>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="IINTCAP">
								<!-- TODO C -->
								<td id="td_IINTCAP" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="IINTCAP" id="IINTCAP"
									value="${__formdata.IINTCAP}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="IINTCAP" a="formato=entero&modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="IINTCAP" lit="9908831" />"
									title="<axis:alt f="axiscga002" c="IINTCAP" lit="9908831" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NNUMESCR">
								<!-- TODO C -->
								<td id="td_NNUMESCR" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NNUMESCR" id="NNUMESCR"
									value="${__formdata.NNUMESCR}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NNUMESCR" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NNUMESCR" lit="9908832" />"
									title="<axis:alt f="axiscga002" c="NNUMESCR" lit="9908832" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NOTARIA">
								<!-- TODO C -->
								<td id="td_NOTARIA" class="campocaja"><input type="text" name="NOTARIA" id="NOTARIA"
									value="${__formdata.NOTARIA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NOTARIA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NOTARIA" lit="89908131" />"
									title="<axis:alt f="axiscga002" c="NOTARIA" lit="89908131" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="MATRICULA">
								<!-- TODO C -->
								<td id="td_MATRICULA" class="campocaja"><input type="text" name="MATRICULA" id="MATRICULA"
									value="${__formdata.MATRICULA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="MATRICULA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="MATRICULA" lit="89908132" />"
									title="<axis:alt f="axiscga002" c="MATRICULA" lit="89908132" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FESCRITURA">
								<td id="td_FESCRITURA"><input type="text" name="FESCRITURA" id="FESCRITURA" size="15" class="campo campotexto"
									style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FESCRITURA}"/>"
									title="<axis:alt f='axiscga002' c='FESCRITURA' lit='9908833'/>"
									alt="<axis:alt f='axiscga002' c='FESCRITURA' lit='9908833'/>"
									<axis:atr f="axiscga002" c="FESCRITURA" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FESCRITURA"
										alt="<axis:alt f="axiscga002" c="FESCRITURA" lit="9908833"/>"
										title="<axis:alt f="axiscga002" c="FESCRITURA" lit="9908833" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<%-- TCS_823 - ACL - 04/03/2019 Se elimina la condicion de formato de campo --%>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDESCRIPCION_CLASE">
								<!-- TODO C -->
								<td id="td_TDESCRIPCION_CLASE" class="campocaja"><input type="text" name="TDESCRIPCION_CLASE" id="TDESCRIPCION_CLASE"
									value="${__formdata.TDESCRIPCION_CLASE}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TDESCRIPCION_CLASE" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TDESCRIPCION_CLASE" lit="9908834" />"
									title="<axis:alt f="axiscga002" c="TDESCRIPCION_CLASE" lit="9908834" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPAIS">
								<!-- TODO C -->
								<%-- TCS_823 - ACL - 04/03/2019 Se elimina la obligatoriedad del campo --%>
								<td id="td_CPAIS" class="campocaja"><input type="text" name="CPAIS" id="CPAIS" value="${__formdata.CPAIS}"
									readonly="readonly" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="CPAIS" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="CPAIS" lit="9908821" />"
									title="<axis:alt f="axiscga002" c="CPAIS" lit="9908821" />" /> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
										<img id="findPaisResidencia" border="0"
										src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor: pointer" /> 
									</c:if>
									<span
									id="TPAIS_span"><b>${__formdata.TPAIS} </b></span></td>
							</axis:ocultar>
							<%-- TCS_826 - ACL - 25/02/2019 Se agregan los campos TITCDT y NITTIT --%>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TITCDT">
								<!-- TODO C -->
								<td id="td_TITCDT" class="campocaja"><input type="text" name="TITCDT" id="TITCDT"
									value="${__formdata.TITCDT}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TITCDT" a="modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="TITCDT" lit="89906184" />"
									title="<axis:alt f="axiscga002" c="TITCDT" lit="89906184" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NITTIT">
								<!-- TODO C -->
								<td id="td_NITTIT" class="campocaja"><input onkeypress="return isNumberKey(event)" type="text" name="NITTIT" id="NITTIT"
									value="${__formdata.NITTIT}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NITTIT" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="NITTIT" lit="89906185" />"
									title="<axis:alt f="axiscga002" c="NITTIT" lit="89906185" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPROVIN">
								<td id="td_CPROVIN" class="titulocaja"><b id="td_CPROVIN"><axis:alt f="axiscga002" c="CPROVIN" lit="100756"></axis:alt></b></td><!--  08-03-2019 IAXIS-3053 -->
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLAC">
								<td id="td_CPOBLAC" class="titulocaja"><b><axis:alt f="axiscga002" c="CPOBLAC" lit="9903396"></axis:alt></b></td><!--  08-03-2019 IAXIS-3053 -->
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDIRECCION">
								<td id="td_TDIRECCION" class="titulocaja"><b><axis:alt f="axiscga002" c="TDIRECCION" lit="9908836"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FCERTLIB">
								<td id="td_FCERTLIB" class="titulocaja"><b><axis:alt f="axiscga002" c="FCERTLIB" lit="9908837"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CMARCA">
								<td id="td_CMARCA" class="titulocaja"><b><axis:alt f="axiscga002" c="CMARCA" lit="9908838"></axis:alt></b></td>
							</axis:ocultar>
							
							<!--  08-03-2019 IAXIS-3053 -->
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="MODELO">
								<td id="td_MODELO" class="titulocaja"><b><axis:alt f="axiscga002" c="MODELO" lit="108515"></axis:alt></b></td>
							</axis:ocultar>
							
							<!--  08-03-2019 IAXIS-3053 -->
						</tr>
						<tr>
						<!-- INICIO 08-03-2019 IAXIS-3053 -->
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPROVIN"> 
								<!-- TODO C -->
								<td id="td_CPROVIN" class="campocaja"><input type="text" name="CPROVIN" id="CPROVIN"
									value="${__formdata.CPROVIN}" readonly="readonly" class="campowidthinput campo campotexto"
									style="width: 90%;"
									<axis:atr f="axiscga002" c="CPROVIN" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="CPROVIN" lit="100756" />"
									title="<axis:alt f="axiscga002" c="CPROVIN" lit="100756" />" /> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
									<img id="findProvincia"
										style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0"
										src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)" />
									</c:if>
									<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span></td>
							</axis:ocultar> 
							
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CPOBLAC">
								<!-- TODO C -->
								<td id="td_CPOBLAC" class="campocaja"><input type="text" name="CPOBLAC" id="CPOBLAC"
									value="${__formdata.CPOBLAC}" readonly="readonly" class="campowidthinput campo campotexto"
									style="width: 90%;"
									<axis:atr f="axiscga002" c="CPOBLAC" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axiscga002" c="CPOBLAC" lit="9903396" />"
									title="<axis:alt f="axiscga002" c="CPOBLAC" lit="9903396" />" /> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
										<img id="findPoblacion"
										style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0"
										src="images/find.gif"
										onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, null)" /> 
									</c:if>
										<span
										id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span></td>
							</axis:ocultar>
							
						<!-- FIN  08-03-2019 IAXIS-3053 -->
							
							<axis:ocultar dejarHueco="false" f="axiscga002" c="TDIRECCION">
								<!-- TODO C -->
								<td id="td_TDIRECCION" class="campocaja"><input type="text" name="TDIRECCION" id="TDIRECCION"
									value="${__formdata.TDIRECCION}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="TDIRECCION" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="TDIRECCION" lit="9908836" />"
									title="<axis:alt f="axiscga002" c="TDIRECCION" lit="9908836" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="FCERTLIB">
								<td id="td_FCERTLIB"><input type="text" name="FCERTLIB" id="FCERTLIB" size="15" class="campo campotexto" style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCERTLIB}"/>"
									title="<axis:alt f='axiscga002' c='FCERTLIB' lit='9908837'/>"
									alt="<axis:alt f='axiscga002' c='FCERTLIB' lit='9908837'/>"
									<axis:atr f="axiscga002" c="FCERTLIB" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}"><img id="icon_FCERTLIB"
										alt="<axis:alt f="axiscga002" c="FCERTLIB" lit="9908837"/>"
										title="<axis:alt f="axiscga002" c="FCERTLIB" lit="9908837" />" src="images/calendar.gif" /></c:if>
								</a></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CMARCA">
								<td id="td_CMARCA"><select title="<axis:alt f='axiscga002' c='CMARCA' lit='9908838' />"
									alt="<axis:alt f='axiscga002' c='CMARCA' lit='9908838' />" name="CMARCA" id="CMARCA" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CMARCA" a="isInputText=false&modificable=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="marca" items="${requestScope.LS_MARCA_VEHICULO}">
											<option value="${marca.CATRIBU}"
												<c:if test="${marca.CATRIBU == __formdata.CMARCA}">selected</c:if>>${marca.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							
							<!--   08-03-2019 IAXIS-3053 -->
							<axis:ocultar dejarHueco="false" f="axiscga002" c="MODELO">
								<td id="td_MODELO"><input type="text" name="MODELO" id="MODELO" size="15" class="campo campotexto" style="width: 70%;"
									value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.MODELO}"/>" title="<axis:alt f='axiscga002' c='MODELO' lit='108515'/>"
									alt="<axis:alt f='axiscga002' c='MODELO' lit='108515'/>"
									<axis:atr f="axiscga002" c="MODELO" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
									style="vertical-align: middle;"> 
									<c:if test="${__formdata.CMODO != 'CONSULTA'}">
									<img id="icon_MODELO"
										alt="<axis:alt f="axiscga002" c="MODELO" lit="108515"/>" title="<axis:alt f='axiscga002' c='MODELO' lit='108515' />" src="images/calendar.gif" />
										</c:if>
										
								</a></td>
							</axis:ocultar>
							<!--   08-03-2019 IAXIS-3053 -->
							
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTIPOV">
								<td id="td_CTIPOV" class="titulocaja"><b><axis:alt f="axiscga002" c="CTIPOV" lit="9908839"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NMOTOR">
								<td id="td_NMOTOR" class="titulocaja"><b><axis:alt f="axiscga002" c="NMOTOR" lit="9908840"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLACA">
								<td id="td_NPLACA" class="titulocaja"><b><axis:alt f="axiscga002" c="NPLACA" lit="9908841"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NCOLOR">
								<td id="td_NCOLOR" class="titulocaja"><b><axis:alt f="axiscga002" c="NCOLOR" lit="9908842"></axis:alt></b></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NSERIE">
								<td id="td_NSERIE" class="titulocaja"><b><axis:alt f="axiscga002" c="NSERIE" lit="9908843"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CTIPOV">
								<td id="td_CTIPOV"><select title="<axis:alt f='axiscga002' c='CTIPOV' lit='9908839' />"
									alt="<axis:alt f='axiscga002' c='CTIPOV' lit='9908839' />" name="CTIPOV" id="CTIPOV" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CTIPOV" a="isInputText=false&modificable=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="tipo" items="${requestScope.LS_TIPO_SERVICIO_VEHICULO}">
											<option value="${tipo.CATRIBU}"
												<c:if test="${tipo.CATRIBU == __formdata.CTIPOV}">selected</c:if>>${tipo.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NMOTOR">
								<!-- TODO C -->
								<td id="td_NMOTOR" class="campocaja"><input type="text" name="NMOTOR" id="NMOTOR"
									value="${__formdata.NMOTOR}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NMOTOR" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NMOTOR" lit="9908840" />"
									title="<axis:alt f="axiscga002" c="NMOTOR" lit="9908840" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NPLACA">
								<!-- TODO C -->
								<td id="td_NPLACA" class="campocaja"><input type="text" name="NPLACA" id="NPLACA"
									value="${__formdata.NPLACA}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NPLACA" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NPLACA" lit="9908841" />"
									title="<axis:alt f="axiscga002" c="NPLACA" lit="9908841" />" /></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NCOLOR">
								<!-- TODO C -->
								<td id="td_NCOLOR"><select title="<axis:alt f='axiscga002' c='NCOLOR' lit='9908842' />"
									alt="<axis:alt f='axiscga002' c='NCOLOR' lit='9908842' />" name="NCOLOR" id="NCOLOR" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="NCOLOR" a="isInputText=false&modificable=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<c:forEach var="origen" items="${requestScope.LS_COLOR_VEHICULO}">
											<option value="${origen.CATRIBU}"
												<c:if test="${origen.CATRIBU == __formdata.NCOLOR}">selected</c:if>>${origen.TATRIBU}</option>
										</c:forEach>
								</select></td>
							</axis:ocultar>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="NSERIE">
								<!-- TODO C -->
								<td id="td_NSERIE" class="campocaja"><input type="text" name="NSERIE" id="NSERIE"
									value="${__formdata.NSERIE}" class="campowidthinput campo campotexto" style="width: 90%;"
									<axis:atr f="axiscga002" c="NSERIE" a="modificable=true&obligatorio=true"/>
									alt="<axis:alt f="axiscga002" c="NSERIE" lit="9908843" />"
									title="<axis:alt f="axiscga002" c="NSERIE" lit="9908843" />" /></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CASEGURA">
								<td id="td_CASEGURA" class="titulocaja"><b><axis:alt f="axiscga002" c="CASEGURA" lit="9908844"></axis:alt></b></td>
							</axis:ocultar>
						</tr>
						<tr>
							<axis:ocultar dejarHueco="false" f="axiscga002" c="CASEGURA">
								<td id="td_CASEGURA"><select title="<axis:alt f='axiscga002' c='CASEGURA' lit='9908844' />"
									alt="<axis:alt f='axiscga002' c='CASEGURA' lit='9908844' />" name="CASEGURA" id="CASEGURA" size="1"
									class="campowidthselect campo campotexto_ob"
									<axis:atr f="axiscga002" c="CASEGURA" a="isInputText=false&modificable=true"/>>
										<option value="null">-
											<axis:alt f="axiscga002" c="BLANCO" lit="1000348" /> -
										</option>
										<!--   13-03-2019 -->
										<c:forEach var="asegura" items="${requestScope.LS_ASEGURADORA}">
											<option value="${asegura.CCOMPANI}"
												<c:if test="${asegura.CCOMPANI == __formdata.CASEGURA}">selected</c:if>>${asegura.TCOMPANI}</option>
										</c:forEach>
										<!--   13-03-2019 -->
								</select></td>
							</axis:ocultar>
						</tr>				
			    	</table>
				</td>
			</tr>
		</table>

		<c:if test="${__formdata.SCONTGAR!=null && __formdata.NMOVIMI!=null}">

		<%-- TCS_823 - ACL (CJM)- 28/02/2019 Se agrega nombre a la seccin --%>		
			<axis:ocultar dejarHueco="false" f="axiscga002" c="TB_CODEUDORES">
			<table id="TB_CODEUDORES" class="area" align="center">

				<tr>
					<td id="td_LIT_9908850" class="campocaja"><img id="DST_9908850_parent" src="images/menys.gif"
						onclick="objEstilos.toggleDisplay('DST_9908850', this)" style="cursor: pointer" /> <b> <axis:alt
								f="axiscga002" c="LIT_9908850" lit="9908850" />
					</b>
						<div style="clear: both;">
							<hr class="titulo"></hr>
						</div></td>
				</tr>
				<tr id="DST_9908850_children" style="display: yes">
					<td>
						<table class="seccion">
							<tr>
								<td><c:set var="title0">
										<axis:alt f="axiscga002" c="CTIPIDE" lit="9904433" />
									</c:set> <c:set var="title1">
										<axis:alt f="axiscga002" c="NNUMIDE" lit="9904434" />
									</c:set> <c:set var="title2">
										<axis:alt f="axiscga002" c="TNOMBRE" lit="9907629" />
									</c:set> <c:set var="title3">
										<axis:alt f="axiscga002" c="DELETE" lit="1000127" />
									</c:set>
									<div class="seccion displayspaceGrande" style="width: 98%">
										<div style="float: right">
											<axis:ocultar dejarHueco="false" f="axiscga002" c="BT_NEWCOD">
											
											<!-- 			inicio  11-03-2019 IAXIS-3053 -->
												
											 	<c:if test="${__formdata.CMODO != 'CONSULTA'}">
												<img id="new" border="0" src="images/new.gif"
													<axis:atr f="axiscga002" c="TNOMBRE_CODEUDORES" a="isInputText=false&modificable=true"/>
													title="<axis:alt f="axiscga002" c="TNOMBRE_CODEUDORES" lit="1000428"/>"
													alt="<axis:alt f="axiscga002" c="TNOMBRE_CODEUDORES" lit="1000428"/>"
													onclick="f_abrir_axisper021_codeudor()" style="cursor: pointer" />
													
												</c:if>
												
											<!-- 				fin  11-03-2019 IAXIS-3053 -->
											</axis:ocultar>
										</div>

										<display:table name="${__formdata.CODEUDORES}" id="TB_CODEUDORES" export="false" class="dsptgtable"
											pagesize="-1" defaultsort="2" defaultorder="ascending" requestURI="modal_axiscga002.do?paginar=true"
											sort="list" cellpadding="0" cellspacing="0">
											<%@ include file="../include/displaytag.jsp"%>
											<display:column title="${title0}" sortable="true" sortProperty="CTIPIDE" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORES.CTIPIDE}</div>
											</display:column>
											<display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORES.NNUMIDE}</div>
											</display:column>
											<display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORES.NOMBRE}</div>
											</display:column>										
											
											<!-- 			inicio  11-03-2019 IAXIS-3053 -->
											
											<c:if test="${__formdata.CMODO != 'CONSULTA'}">
											
											<display:column title="${title3}" sortable="false" sortProperty="DELETE" headerClass="sortable" media="html"
												autolink="false">
												<a href="javascript:void(0)" onclick="f_eliminar_codeudores('${TB_CODEUDORES.SPERSON}')"> <img
													border="0" alt='<axis:alt f="axiscga002" c="DELETE" lit="1000127"/>'
													title='<axis:alt f="axiscga002" c="DELETE" lit="1000127"/>' src="images/delete.gif" />
												</a>
											</display:column>
											
											</c:if>
											
											<!-- 				fin  11-03-2019 IAXIS-3053 -->
											
										</display:table>
									</div></td>


							</tr>
						</table>
					</td>
				</tr>
			</table>
			</axis:ocultar>
		</c:if>
		<c:if test="${(__formdata.SCONTGAR!=null && __formdata.NMOVIMI!=null ) && __formdata.SSEGUROPRODUCCION==null}">

			<table class="area" align="center">
				<tr>
					<td class="campocaja"><img id="DST_9908851_parent" src="images/menys.gif"
						onclick="objEstilos.toggleDisplay('DST_9908851', this)" style="cursor: pointer" /> <b> <axis:alt
								f="axiscga002" c="LIT_9908851" lit="9908851" />
					</b>
						<div style="clear: both;">
							<hr class="titulo"></hr>
						</div></td>
				</tr>
				<tr id="DST_9908851_children" style="display: yes">
					<td>
						<table class="seccion">
							<tr>
								<td><c:set var="title0">
										<axis:alt f="axiscga002" c="NNUMPOL" lit="100624" />
									</c:set> <c:set var="title1">
										<axis:alt f="axiscga002" c="NSOLICIT" lit="9000875" />
									</c:set> <c:set var="title2">
										<axis:alt f="axiscga002" c="TPRODUCT" lit="1000307" />
									</c:set> <c:set var="title3">
										<axis:alt f="axiscga002" c="CSITUAC" lit="100874" />
									</c:set> <c:set var="title4">
										<axis:alt f="axiscga002" c="CUSUARIO" lit="9905522" />
									</c:set>
									<div class="seccion displayspaceGrande" style="width: 98%">
										<%-- TCS_827 - ACL - 27/02/2019 Se ajusta el llamado para f_abrir_axiscga004 --%>
										<div style="float: right">
										
										<!-- 			inicio  11-03-2019 IAXIS-3053 -->
										
										<c:if test="${__formdata.CMODO != 'CONSULTA'}">
											<img id="new" border="0" src="images/new.gif"
												title="<axis:alt f="axiscga002" c="NNUMPOL_ASO" lit="1000428"/>"
												alt="<axis:alt f="axiscga002" c="NNUMPOL_ASO" lit="1000428"/>" onclick="f_abrir_axiscga004()"
												style="cursor: pointer" />
												
										</c:if>
												
										<!-- 				fin  11-03-2019 IAXIS-3053 -->	
										
										</div>


										<display:table name="${__formdata.ASOCIACION_POLIZA}" id="TB_CODEUDORESASOCIACION_POLIZA" export="false"
											class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
											requestURI="modal_axiscga002.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
											<%@ include file="../include/displaytag.jsp"%>
											<display:column title="${title0}" sortable="true" sortProperty="NNUMPOL" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZA.NPOLIZA}</div>
											</display:column>
											<display:column title="${title1}" sortable="true" sortProperty="NSOLICIT" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZA.NSOLICI}</div>
											</display:column>
											<display:column title="${title2}" sortable="true" sortProperty="TPRODUCT" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZA.PLAN}</div>
											</display:column>
											<display:column title="${title3}" sortable="true" sortProperty="CSITUAC" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZA.SITUACION}</div>
											</display:column>
											<display:column title="${title4}" sortable="true" sortProperty="CUSUARIO" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZA.USUARIO}</div>
											</display:column>
										</display:table>
									</div></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

		</c:if>
		<c:if test="${__formdata.SCONTGAR!=null && __formdata.NMOVIMI!=null}">


			<table class="area" align="center">
				<tr>
					<td class="campocaja"><img id="DST_100913_parent" src="images/menys.gif"
						onclick="objEstilos.toggleDisplay('DST_100913', this)" style="cursor: pointer" /> <b> <axis:alt
								f="axiscga002" c="LIT_100913" lit="100913" />
					</b>
						<div style="clear: both;">
							<hr class="titulo"></hr>
						</div></td>
				</tr>
				<tr id="DST_100913_children" style="display: yes">
					<td>
						<table class="seccion">
							<tr>
								<td><c:set var="title0">
										<axis:alt f="axiscga002" c="FCREA" lit="9908813" />
									</c:set> <c:set var="title1">
										<axis:alt f="axiscga002" c="CUSUARIO" lit="9905522" />
									</c:set> <c:set var="title2">
										<axis:alt f="axiscga002" c="TSUCURSAL" lit="9002202" />
									</c:set> <c:set var="title3">
										<axis:alt f="axiscga002" c="CSITUAC" lit="100874" />
									</c:set> <c:set var="title4">
										<axis:alt f="axiscga002" c="CTENEDOR" lit="89906063" /><!--  08-03-2019 IAXIS-3053 -->
									</c:set> <c:set var="title5">
										<axis:alt f="axiscga002" c="CESTADO" lit="101510" />
									</c:set>
									<div class="seccion displayspaceGrande" style="width: 98%">
										<display:table name="${__formdata.MOVIMIENTOS}" id="TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS" export="false"
											class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
											requestURI="modal_axiscga002.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
											<%@ include file="../include/displaytag.jsp"%>

											<display:column title="${title0}" sortable="true" sortProperty="FCREA" headerClass="sortable" media="html"
												autolink="false">
												<fmt:formatDate pattern="dd/MM/yyyy" value="${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.FALTA}" />
											</display:column>
											<display:column title="${title1}" sortable="true" sortProperty="CUSUARIO" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.CUSUALT}</div>
											</display:column>
											<display:column title="${title2}" sortable="true" sortProperty="TSUCURSAL" headerClass="sortable"
												media="html" autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.TSUCURSAL}</div>
											</display:column>
											<display:column title="${title3}" sortable="true" sortProperty="CSITUAC" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.SITUACION}</div>
											</display:column>
											<display:column title="${title4}" sortable="true" sortProperty="CTENEDOR" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.TTENEDOR}</div>
											</display:column>
											<display:column title="${title5}" sortable="true" sortProperty="CESTADO" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOS.TESTADO}</div>
											</display:column>
										</display:table>
									</div></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${__formdata.SCONTGAR!=null && __formdata.NMOVIMI!=null}">
			<table class="area" align="center">
				<tr>
					<td class="campocaja"><img id="DST_9001358_parent" src="images/menys.gif"
						onclick="objEstilos.toggleDisplay('DST_9001358', this)" style="cursor: pointer" /> <b> <axis:alt
								f="axiscga002" c="LIT_9001358" lit="9001358" />
					</b>
						<div style="clear: both;">
							<hr class="titulo"></hr>
						</div></td>
				</tr>
				<tr id="DST_9001358_children" style="display: yes">
					<td>
						<table class="seccion">
							<tr>
								<td><c:set var="title0">
										<axis:alt f="axiscga002" c="TDESCRIPCION" lit="100588" />
									</c:set> <c:set var="title1">
										<axis:alt f="axiscga002" c="TNOMBRE" lit="105940" />
									</c:set> <c:set var="title2">
										<axis:alt f="axiscga002" c="FALTA" lit="9908845" />
									</c:set> <c:set var="title3">
										<axis:alt f="axiscga002" c="TOBSERVA" lit="101162" />
									</c:set> <c:set var="title4">
										<axis:alt f="axiscga002" c="FCADUCIDA" lit="9001356" />
									</c:set> <c:set var="title5">
										<axis:alt f="axiscga002" c="EDITAR" lit="9901356" />
									</c:set>
									<div class="seccion displayspaceGrande" style="width: 98%">
										<div style="float: right">
										
											<!-- 			inicio  11-03-2019 IAXIS-3053 -->
												
										<c:if test="${__formdata.CMODO != 'CONSULTA'}">
											<img id="new" border="0" src="images/new.gif" title="<axis:alt f="axiscga002" c="DOC" lit="1000428"/>"
												alt="<axis:alt f="axiscga002" c="DOC" lit="1000428"/>" onclick="f_abrir_axiscga003()"
												style="cursor: pointer" />
										</c:if>
												
										<!-- 				fin  11-03-2019 IAXIS-3053 -->
										
										</div>
										<display:table name="${__formdata.DOCUMENTOS}" id="TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS"
											export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
											requestURI="modal_axiscga002.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
											<%@ include file="../include/displaytag.jsp"%>



											<display:column title="${title0}" sortable="true" sortProperty="TDESCRIPCION" headerClass="sortable"
												media="html" autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.DESCRIPCION}</div>
											</display:column>
											<display:column title="${title1}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText" onclick="f_ver_doc('${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.IDDOCGDX}');"><a hrefx="#">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.NOMBRE}</a></div>
											</display:column>
											<display:column title="${title2}" sortable="true" sortProperty="FALTA" headerClass="sortable" media="html"
												autolink="false">
												<fmt:formatDate pattern="dd/MM/yyyy" value="${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.FALTA}" />
											</display:column>
											<display:column title="${title3}" sortable="true" sortProperty="TOBSERVA" headerClass="sortable" media="html"
												autolink="false">
												<div class="dspText">${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.TOBSERV}</div>
											</display:column>
											<display:column title="${title4}" sortable="true" sortProperty="FCADUCIDA" headerClass="sortable"
												media="html" autolink="false">
												<fmt:formatDate pattern="dd/MM/yyyy" value="${TB_CODEUDORESASOCIACION_POLIZAMOVIMIENTOSDOCUMENTOS.FCADUCI}" />
											</display:column>


										</display:table>
									</div></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</c:if>

		<div class="separador">&nbsp;</div>
		
		<c:if test="${__formdata.CONTRA_DET_POLIZA==null}">
			<c:if test="${__formdata.CMODO != 'CONSULTA'}">
				<c:import url="../include/botonera_nt.jsp">
					<c:param name="f">axiscga002</c:param>
					<c:param name="f">axiscga002</c:param>
					<c:param name="__botones">cancelar,aceptar</c:param>
				</c:import>
			</c:if>
			<c:if test="${__formdata.CMODO == 'CONSULTA'}">
				<c:import url="../include/botonera_nt.jsp">
					<c:param name="f">axiscga002</c:param>				
					<c:param name="__botones">cancelar</c:param>
				</c:import>
			</c:if>
		</c:if>
		<c:if test="${__formdata.CONTRA_DET_POLIZA!=null}">
				<c:import url="../include/botonera_nt.jsp">
					<c:param name="f">axiscga002</c:param>				
					<c:param name="__botones">salir</c:param>
				</c:import>
		</c:if>
	</form>
	<c:import url="../include/mensajes.jsp" />
	<!-- ACTUALIZADO 03/04/2017-->
</body>
</html>
