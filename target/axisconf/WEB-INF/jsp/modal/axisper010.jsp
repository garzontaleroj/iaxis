
<%
	/* Revision:# F3Ml4FRgAAqrpNAUQQzKJQ== # */
%>
<%-- 
*  Fichero: axisper0010.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<%-- Especial per controlar els scroll amb iPad --%>
<link type="text/css" href="styles/jquery.jscrollpane.css"
	rel="stylesheet"
	media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
<style type="text/css" id="page-css">
</style>
<%-- FI Especial per controlar els scroll amb iPad --%>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
    
    <!-- 34989/209710  -->
    
    var nav4 = window.Event ? true : false;
	function ValidNum(evt) {
	    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
	    	var key = nav4 ? evt.which : evt.keyCode;
		    return (key <= 13 || (key >= 48 && key <= 57));
	}
	
    function soloLetrasNumeros(e){
	       key = e.keyCode || e.which;
	       tecla = String.fromCharCode(key).toLowerCase();
	       letras = " ÃƒÂ¡ÃƒÂ©ÃƒÂ­ÃƒÂ³ÃƒÂºabcdefghijklmnÃƒÂ±opqrstuvwxyz1234567890";
	       especiales = "8-37-39-46";
	
	       tecla_especial = false
	       for(var i in especiales){
	            if(key == especiales[i]){
	                tecla_especial = true;
	                break;
	            }
	        }
	
	        if(letras.indexOf(tecla)==-1 && !tecla_especial){
	            return false;
	        }
	 }
    
    function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
        if (objUtiles.estaVacio(optionalQueryString))                
            optionalQueryString = "";
        
        if (noXButton) 
            objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

        objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
    }
    
    
 // INI CP0014M_SYS_PERS_Val y CP0015M_SYS_PERS_Val - AP - 18/12/2018 -- Se adiciona la funcin f_onlynumber
	function f_onlynumber(t) {
		if (t.value.match(/[^A-Za-z0-9]/g)) {
			alert("<axis:alt f='axisper008' c='ERRORNUM' lit='9907933'/>");
			t.value = t.value.replace(/[^A-Za-z0-9]/g, '');
		}
	}
	// FIN CP0014M_SYS_PERS_Val y CP0015M_SYS_PERS_Val - AP - 18/12/2018 -- Se adiciona la funcin f_onlynumber
    
    
    function setDefaultEstadoPersona() {
            var x = document.getElementById("CESTPER");
            if (x) {
		for (i=0; i<x.length; i++) {
                    if (x.options[i].value == "6") {   // Valid is default
			x.selectedIndex = i;
                    }
		}
            }
        }    
    

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function ocultar_fila(id){
            fila = document.getElementById(id);
            if (fila!= null){
                fila.style.display = "none";
            }
        }
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
         formdataPAIS = '${__formdata.CPAIS}';
         
         formdataNAC = '${__formdata.CNACIONALIDAD}';
         //Si ya existe el sperson, es consulta y ocultamos la nacionalidad
         if (!objUtiles.estaVacio(document.miForm.SPERSON.value)){
            ocultar_fila("CNACIONALIDAD_1");
            ocultar_fila("CNACIONALIDAD_2");
            ocultar_fila("CNACIONALIDAD_3");
            ocultar_fila("CNACIONALIDAD_4");
         }
         
         

        
         
         
         
     
         // Al recargar la pantalla se deben proteger los campos
         <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" >
            if(document.miForm.CTIPPERcerca){
              if (!objUtiles.estaVacio(document.miForm.CTIPPERcerca))
                document.miForm.CTIPPERcerca.readonly=true;
              if (!objUtiles.estaVacio(document.miForm.CTIPIDEcerca))
                document.miForm.CTIPIDEcerca.readonly=true;
                
                objDom.setVisibilidadPorId("find", "hidden");
                
               <c:if test="${empty __formdata.CTIPPERcerca || __formdata.CTIPPERcerca != 2}">
                 if (!objUtiles.estaVacio(document.miForm.FNACIMIcerca)){
                    document.miForm.FNACIMIcerca.readonly=true;
                    objDom.setVisibilidadPorId("popup_calendario_FNACIMIcerca", "hidden");
                }
                if (!objUtiles.estaVacio(document.miForm.CSEXPERcerca))
                    document.miForm.CSEXPERcerca.readonly=true;
                if (!objUtiles.estaVacio(document.miForm.NNUMIDEcerca))
                    document.miForm.NNUMIDEcerca.readonly=true;
                
               </c:if>
             }
       </c:if>
       try{
             if (!objUtiles.estaVacio(formdataPAIS)){
                    if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                        objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                    }
             
             }
             else{
            	 formdataPAIS = objDom.getValorPorId("CPAIS");
            	 if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                     objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                 }
             }
         }catch(e){}
            
            
            if (!objUtiles.estaVacio(formdataNAC)){
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataNAC))){
                    objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + f_buscar_TPAIS(formdataNAC)+"</b>");
                }
           }
            
            var PSPERSONOUT = "${requestScope.PSPERSONOUT}"; 
            var PCAGENTEOUT = "${requestScope.PCAGENTEOUT}"; 
			
            if (!objUtiles.estaVacio(PSPERSONOUT))				
                parent.f_aceptar_axisper010( PSPERSONOUT,PCAGENTEOUT);
                
                f_cargar_propiedades_pantalla();
                
          //BUG ini 24780
          <axis:visible c="SWRUT" f="axisper010">    
             var CTIPIDE=objDom.getValorPorId("CTIPIDE");
             var NNUMIDE=f_stripInvalidChars(objDom.getValorPorId("NNUMIDE"));
             var hayMensaje = (document.getElementById("mensajes_div").style.visibility=='visible');
             //alert("Calculo DV :: "+CTIPIDE + " - "+NNUMIDE + " - " +hayMensaje);
             if ((CTIPIDE == 33 || CTIPIDE == 36 || CTIPIDE == 37) && !objUtiles.estaVacio(CTIPIDE) && !hayMensaje){   // INI 08/11/2018 CP0211M_SYS_PERS_val, CP0212M_SYS_PERS_val, CP0213M_SYS_PERS_val AP
            	 //document.miForm.SWRUT = 1;
            	 document.getElementById("SWRUT").value = "1";
            	 miForm.SWRUT.disabled=true;
                 var qs="operation=ajax_getdigito";
                 NNUMIDE = (CTIPIDE==37 ? NNUMIDE.substring(0, (NNUMIDE.length-1)) : NNUMIDE);
                 qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                 objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
            }    // FIN 08/11/2018 CP0211M_SYS_PERS_val, CP0212M_SYS_PERS_val, CP0213M_SYS_PERS_val AP
             if ((CTIPIDE == 41 || CTIPIDE == 42) && !objUtiles.estaVacio(CTIPIDE) && !hayMensaje){
                        var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                   }
            //Tarjeta de Identidad => 34
            //Registro Civil => 35
            if(CTIPIDE == 34 || CTIPIDE == 35){
            	objDom.setValorPorId("CCIIU","81");
            	f_onchange_CIIU();
            }
            
            </axis:visible>
           //BUG FIN 24780
         
             //BUG INI 32649
              <axis:visible c="SWRUT_COLM" f="axisper010">   
           objDom.setValorPorId("SWRUT","1");   
            var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
             objDom.setValorPorId("TDIGITOIDE_COLM",TDIGITOIDE);   
              var SWRUT=objDom.getValorPorId("SWRUT");
              var SWRUT_COLM=objDom.getValorPorId("SWRUT_COLM");
             objDom.setValorPorId("SWRUT_COLM",SWRUT);    
               var CTIPIDE=objDom.getValorPorId("CTIPIDE");
             var NNUMIDE=f_stripInvalidChars(objDom.getValorPorId("NNUMIDE"));
             var hayMensaje = (document.getElementById("mensajes_div").style.visibility=='visible');  
             if ((CTIPIDE == 36) && !objUtiles.estaVacio(CTIPIDE) && !hayMensaje && SWRUT_COLM ==1 ){     // INI 08/11/2018 CP0211M_SYS_PERS_val, CP0212M_SYS_PERS_val, CP0213M_SYS_PERS_val AP
            	 document.getElementById("SWRUT").value = "1";
            	 miForm.SWRUT.disabled=true;
                 var qs="operation=ajax_getdigito";
                 qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                 objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
            } 	// FIN 08/11/2018 CP0211M_SYS_PERS_val, CP0212M_SYS_PERS_val, CP0213M_SYS_PERS_val AP
             if ((CTIPIDE == 41 || CTIPIDE == 42) && !objUtiles.estaVacio(CTIPIDE) && !hayMensaje && SWRUT_COLM ==1 ){
                        var qs="operation=ajax_getdigito";
                        qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                        objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
                   }
            objDom.setValorPorId("SWRUT","1"); 
            </axis:visible>
            //BUG FIN 32649
            //setDefaultEstadoPersona(); // 34989/209710
            
            /* IAXIS-13881 : Cambios de facturacion electronica : start*/   
            document.miForm.FISCALES_ADQUIRIENTE.readOnly = true;
            /* IAXIS-13881 : Cambios de facturacion electronica : end*/   
        }
        
        function f_stripInvalidChars( str ){
        	var out = '';
	        	if(str!=null){
	                str =str.toUpperCase() + '';
	        	
	                var rgx = /^[\060-\071]|[\101-\132]|[\141-\172]$/i;
	                
	                for( var i = 0; i < str.length; i++ ){
	                    if( rgx.test( str.charAt(i) ) ){
	                        out += str.charAt(i);
	                    }
	                }
	        	}
             return out;
         }              
        
        // Inicio IAXIS-4832(11) 09/09/2019
        // Se identa la función y se reorganizan las sentencias condicionales a fin de bloquear el guardado de la persona
        // si el email se ingresa en un formato incorrecto. Por otro lado, se agrega la función f_onblur_email para quitar
        // los espacios en blanco inválidos para el email.
        function f_but_aceptar() {
        	f_scroll_top();        	
        	f_onchange_CIIU();
            if (objValidador.validaEntrada()) {
            	disableScroll();
            	var isModif = document.miForm.SPERSON.value; // NUll is true , other value is false
            	//alert("Is Modification: "+objUtiles.estaVacio(isModif));
            	if(!objUtiles.estaVacio(isModif)){
            		
            		var ctipper = document.miForm.CTIPPER.value;
            		 
            		 try {
            			 document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;
            		 } catch (e) {
            			 
            		 }
                     
            		 f_habilitar_campos();
                     objUtiles.ejecutarFormulario("modal_axisper010.do?CPAISnomodi="+document.miForm.CPAIS.value, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);	
                    
            	}else{
            		/* IAXIS-13881 : Cambios de facturacion electronica : start*/   
            		if((!correoValido($("#EMAIL").val())) /*|| (!correoValido($("#CORREO_FACT_ELECT").val()))*/
            		  )
            			/* IAXIS-13881 : Cambios de facturacion electronica : end*/               			
            		{
            			alert("Ingrese un correo valido.");
            		} else {
            			var ctipper = document.miForm.CTIPPER.value;
            			
            			try { 
            				document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;
                    	} catch (e) {
                    		
                    	}
                    	
                    	f_habilitar_campos();
                    	objUtiles.ejecutarFormulario("modal_axisper010.do?CPAISnomodi="+document.miForm.CPAIS.value, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando); 
            		}
                }
            }
        }
        
        function f_onblur_email(EMAIL){
        	objDom.setValorPorId("EMAIL",EMAIL.replace(/\s/g,''));
        }
        // Fin IAXIS-4832(11) 09/09/2019
        
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId)){
                                    objDom.setDisabledPorId(selectId,false);
                                }
                         }                    
                     }catch(e){}
                }
                
            }
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                     try{
                         if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                             if(checkboxs[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(checkboxsId))
                                    objDom.setDisabledPorId(checkboxsId,false);
                         }
                     }catch(e){}
                     }
                }
            }
        }
        
        
        <%-- Inici BFP 28/12/2011 bug: 20678 --%>
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            <%--if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                }
            }--%>
            if (entrada.value != ''){
                if((entrada.value.length == 8) || (entrada.value.length == 10)){
                    entrada.value = jDate.formateaFecha(entrada.value);
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                        entrada.value = "";
                    }
                }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                    entrada.value = "";
                }
            }
            
        }
        <%-- Fi BFP 28/12/2011 bug: 20678 --%>
       
	 function f_buscar_TPAIS(CPAIS) {
                <%if (((java.util.Map) request.getAttribute("__formdata")) != null) {
				java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
				if (((java.util.Map) formdata.get("listValores")) != null) {
					java.util.Map lista = (java.util.Map) formdata.get("listValores");
					if (((java.util.ArrayList) lista.get("lstPaises")) != null) {
						java.util.ArrayList paises = (java.util.ArrayList) lista.get("lstPaises");
						for (int i = 0; i < paises.size(); i++) {
							java.util.HashMap paisHash = (java.util.HashMap) paises.get(i);%>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}
					}
				}
			}%> 
        }
        
        function f_but_cancelar() {
        isNew ='${__formdata.isNew}';
        parent.f_cerrar_axisper010(isNew);
        }        
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';   <!-- * LCF * __formdata.TIDENTI -->
            if (TIDENTI != "<%=Integer.MIN_VALUE%>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en funciÃƒÂ³n de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_onchange_CTIPPERcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPERcerca}';
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en funciÃƒÂ³n de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
            
         //BUG 32649 ini 
         function f_onchange_TDIGITOIDE_COLM(TDIGITOIDE_COLM) {
             var TDIGITOIDE=objDom.getValorPorId("TDIGITOIDE");
			 if (document.getElementById("TDIGITOIDE_COLM") != null ){
                document.getElementById("TDIGITOIDE_COLM").value =	 TDIGITOIDE_COLM.toUpperCase();
               }
            if ( TDIGITOIDE != TDIGITOIDE_COLM.toUpperCase() ) {
                 alert("<axis:alt f="axisper010" c="ALER_ERR" lit="9903982"/>"); //digito de control incorreco
                  document.getElementById("TDIGITOIDE_COLM").focus();
                  objDom.setValorPorId("TDIGITOIDE_COLM","");
                document.miForm.TDIGITOIDE_COLM.focus();
             }
        }
           //BUG 32649 fin 
      /*  function f_onchange_CTIPIDEcerca(CTIPIDE) {
            formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            if (CTIPIDE != "<%=Integer.MIN_VALUE%>" && CTIPIDE != formdataCTIPIDEcerca ) {
                // Recargar formulario para esconder/mostrar campos en funciÃƒÂ³n de TIDENTI
                    try{
                    objDom.setValorPorId("NNUMIDEcerca", "");
                    objDom.setValorPorId("NNUMIDE", "");
                    }catch(e){}
                
                objUtiles.ejecutarFormulario("modal_axisper010.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        } */
        
         function f_onchange_CTIPIDEcerca(CTIPIDE) {
            formdataCTIPIDEcerca = '${__formdata.CTIPIDEcerca}';
            
            if (CTIPIDE != formdataCTIPIDEcerca ) {
               var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxnumideCerca, qs, this, objJsMessages.jslit_cargando);   
            }
            
			//POST-35
            if (CTIPIDE==36){
            	document.getElementById('TAPELLIcerca').style.visibility = "visible";
            	document.getElementById('TAPELLIcercaT').style.visibility = "visible";
            }            
            else{
            	document.getElementById('TAPELLIcerca').style.visibility = "hidden";
            	document.getElementById('TAPELLIcercaT').style.visibility = "hidden";
            }            
	        //POST-35
              
        }        

        function callbackajaxnumideCerca (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PNNUMIDE_OUT")[0])) {
                    objDom.setValorPorId("NNUMIDEcerca", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNNUMIDE_OUT"), 0, 0));
                     document.miForm.NNUMIDEcerca.readOnly = true;
                  }else{
                      document.miForm.NNUMIDEcerca.readOnly = false;
                      document.miForm.NNUMIDEcerca.className = "campowidthinput campo campotexto"; 
                      objDom.setValorPorId("NNUMIDEcerca",'');
                      
                  }
                    revisarEstilos();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
       
    
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        function f_onchange_CPAIS() {
            var CPAIS_RESIDENCIA=objDom.getValorPorId("CPAIS");
            
            if (!objUtiles.estaVacio(CPAIS_RESIDENCIA)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_RESIDENCIA";
                qs=qs+"&CPAIS_RESIDENCIA="+CPAIS_RESIDENCIA
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "");
            //    limpiaCampos("CPAIS");
            }
        }        

        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                    
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                           // limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                limpiaCampos("CPAIS_RESIDENCIA");
                                }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                    
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
        	/* IAXIS-13881 : Cambios de facturacion electronica : start*/
        	f_scroll_top();
        	/* IAXIS-13881 : Cambios de facturacion electronica : end*/
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
             }
             
             if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
            }
             
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
       function f_cargarPersona(){
        if (objValidador.validaEntrada()) {
        objUtiles.ejecutarFormulario("modal_axisper010.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);   
        
        }
       }
       
       function f_onChange(){
	        /* if (objValidador.validaEntrada()) {
	            f_habilitar_campos();
	          //objUtiles.ejecutarFormulario("modal_axisper010.do?CPAISnomodi="+document.miForm.CPAIS.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
	        } */
       }
        
          function f_personaDuplicada() {
               <axis:visible c="DUPLICADANIF" f="axisper010">
                 var op="operation=ajax_duplicada";
                 var qs="";
                if (objValidador.validaEntrada()) {
                 if (!objUtiles.estaVacio(document.miForm.CTIPPERcerca) && document.miForm.CTIPPERcerca.value > 0)
                    qs=qs+"&CTIPPERcerca="+document.miForm.CTIPPERcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CSEXPERcerca) && document.miForm.CSEXPERcerca.value > 0)
                    qs=qs+"&CSEXPERcerca="+document.miForm.CSEXPERcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CAGENTEcerca) && document.miForm.CAGENTEcerca.value > 0) 
                    qs=qs+"&CAGENTEcerca="+document.miForm.CAGENTEcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.FNACIMIcerca) && !objUtiles.estaVacio(document.miForm.FNACIMIcerca.value) ) 
                    qs=qs+"&FNACIMIcerca="+document.miForm.FNACIMIcerca.value;
                 if (!objUtiles.estaVacio(document.miForm.CTIPIDEcerca) && document.miForm.CTIPIDEcerca.value > 0) 
                    qs=qs+"&CTIPIDEcerca="+document.miForm.CTIPIDEcerca.value;
                
                 //if (!objUtiles.estaVacio(document.miForm.NNUMIDEcerca) && document.miForm.NNUMIDEcerca.value != 0) 
                    qs=qs+"&NNUMIDEcerca="+document.miForm.NNUMIDEcerca.value;
    
                        if (!objUtiles.estaVacio(qs)) {
                            qs = op+qs;
                            objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxduplicado, qs, this)
                        }else{
                            objUtiles.ejecutarFormulario("modal_axisper010.do", "busqueda_persona", document.miForm, "_self", objJsMessages.jslit_cargando);  
                            
                           
                        }
                    }
                    
            </axis:visible>
            <axis:visible c="CARGARPERSONA" f="axisper010">
                f_cargarPersona();
          
            </axis:visible>

        }        

        function callbackajaxduplicado (ajaxResponseText){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  var duplicado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PDUPLICADA"), 0, 0);
                   if (duplicado>0) {
                           objUtiles.abrirModal("axisper024","src","modal_axisper024.do?operation=form&NNUMIDE="+document.miForm.NNUMIDEcerca.value+"&CTIPIDE="+document.miForm.CTIPIDEcerca.value);
                   }else{
                        f_cargarPersona();
                   }
                }
            } catch (e) {
              if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        function f_aceptar_axisper024(SPERSON,CAGENTE,duplicat){
        	objUtiles.cerrarModal("axisper024");
        	document.miForm.PDUPLICADO.value=duplicat;
        	var CDOMICI = null; // IAXIS-4832(1) 04/09/2019
        	if (!objUtiles.estaVacio(SPERSON)){
        		document.miForm.CAGENTE_DUP.value=CAGENTE;
        		// Inicio IAXIS-4832(1) 04/09/2019 
        		//objUtiles.ejecutarFormulario("modal_axisper010.do?CAGENTEDUP="+CAGENTE+"&SPERSONDUP="+SPERSON, "getPersona", document.miForm, "_self", objJsMessages.jslit_cargando);
                objUtiles.ejecutarFormulario("modal_axisper012.do?&SPERSON="+SPERSON+"&CDOMICI=" + CDOMICI +"&CAGENTE="+document.miForm.CAGENTE_DUP.value+"&CDUP=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                // Fin IAXIS-4832(1) 04/09/2019
            }else{
            	f_cargarPersona();
            }
                        
        }
        
        
        function f_get_nnumide() {
            var CTIPIDE=objDom.getValorPorId("CTIPIDE");
            
                var qs="operation=ajax_getnnumide";
                qs=qs+"&CTIPIDE="+CTIPIDE;
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxnumide, qs, this, objJsMessages.jslit_cargando);   
           
              
        }        

        function callbackajaxnumide (ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PNNUMIDE_OUT")[0])) {
                    objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNNUMIDE_OUT"), 0, 0));
                     document.miForm.NNUMIDE.readOnly = true;
                   
                      document.miForm.TDIGITO_COLM.readOnly = true;
                  }else{
                    //  document.miForm.NNUMIDE.readOnly = false;
                     // document.miForm.NNUMIDE.className = "campowidthinput campo campotexto"; 
                      objDom.setValorPorId("NNUMIDE",document.miForm.NNUMIDEcerca.value);
                      document.miForm.TDIGITO_COLM.readOnly = false;
                  }
                    revisarEstilos();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
        
         function f_onclickCheckbox(thiss) {
                thiss.value =  (thiss.checked)?1:0;
                
                if (thiss.value  == 1 ){
                    var CTIPIDE=objDom.getValorPorId("CTIPIDE");
                    var NNUMIDE=objDom.getValorPorId("NNUMIDE");
                   // alert("CTIPIDE ::"+CTIPIDE);
                    var qs="operation=ajax_getdigito";
                    qs=qs+"&CTIPIDE="+CTIPIDE+"&NNUMIDE="+NNUMIDE;
                    objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxdigito, qs, this, objJsMessages.jslit_cargando);   
               }else {
                objDom.setValorPorId("TDIGITOIDE",'');
               }
            }
        
        function callbackajaxdigito (ajaxResponseText){
            try{ 
              
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 
                  if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0])) {
                 
                  
                    objDom.setValorPorId("TDIGITOIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0));
                  }else{
                      objDom.setValorPorId("TDIGITOIDE",'');
                      
                  }
                  f_cargar_propiedades_pantalla();
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_onchange_CNACIONALIDAD() {
            var CNACIONALIDAD=objDom.getValorPorId("CNACIONALIDAD");
            
            if (!objUtiles.estaVacio(CNACIONALIDAD)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_NACIONALIDAD";
                qs=qs+"&CPAIS_NACIONALIDAD="+CNACIONALIDAD
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CNACIONALIDAD", "");
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "");
                limpiaCampos("CNACIONALIDAD");
            }                
        }

        function f_abrir_axisciiu001(CODIGO, LITERAL){
           	/* IAXIS-13881 : Cambios de facturacion electronica : start*/
        	f_scroll_top();
    		/* IAXIS-13881 : Cambios de facturacion electronica : end*/ 
            objUtiles.abrirModal("axisciiu001", "src", "modal_axisciiu001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
       }
        
        
        function f_aceptar_axisciiu001(CODIGO, TEXTO){
            f_cerrar_axisciiu001();
            if (!objUtiles.estaVacio(TEXTO)){
                objDom.setValorPorId("CCIIU", CODIGO);
                objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + TEXTO + "</b>");
             }
         } 
        
        function f_cerrar_axisciiu001() {
            objUtiles.cerrarModal("axisciiu001");
        }  
        
        function f_onchange_CIIU() {
            var CCIIU=objDom.getValorPorId("CCIIU");
            if (!objUtiles.estaVacio(CCIIU)){
                var qs="operation=ajax_ciiu";
                qs=qs+"&CCIIU="+CCIIU;
                var origen = 'CCIIU';
                objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxciiu, qs, this, null, origen);
            } 
        }
        
        function callbackajaxciiu (ajaxResponseText,origen){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCIIU")[0])) {                    	
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CCIIU", "");
                            objDom.setValorHTMLPorId("TCCIIU_span", "<b></b>");                           
                        }else{
                            objDom.setValorPorId("CCIIU", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCIIU"), 0, 0));                          
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCIIU")[0])){
                                objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCIIU"), 0, 0) + "</b>");
                            }
                        }
                    }else{
                    	objDom.setValorPorId("CCIIU", "");
                        objDom.setValorHTMLPorId("TCCIIU_span", "<b></b>");
                    }
                    }else{
                    	objDom.setValorPorId("CCIIU", "");
                        objDom.setValorHTMLPorId("TCCIIU_span", "<b></b>");
                    }
            }catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
    /**
    Funciones migradas de la axisper005
    **/    
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisper005.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
    
        function callbackAjaxOnblurCPOSTAL(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
					var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    
                    if (ban == 2){
                        objUtiles.abrirModal("axisper041", "src", "modal_axisper041.do?operation=form&CPOSTAL=" + document.getElementById("CPOSTAL").value);
                    }
                    else
                    {
				
                    // PaÃ®Â³ï¿½
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS_DIRECCION", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        if(document.miForm.sinProvincias.value != 1)
                             objDom.setVisibilidadPorId("findPoblacion", "visible");
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";
                    }
                    
                    // 34989/209710 - Autopoblar el campo TNOMVIA.
                    // Poner en el campo "Street name" lo mismo que se estÃ¡Â¡Â£olocando dinÃ¢Â®Â©camente
                    // en el campo TPOBLAC_span.  Esto se debe realizar solo si el parÃ¢Â®Â¥tro
                    // pautocalle es 1.
                    
                    // PoblaciÃ³Â®ï¿½Å                     
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PAUTOCALLE")[0]) ) {
                            if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PAUTOCALLE"), 0, 0) == 1){
                                document.getElementById("TNOMVIA").value =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0);
                            }
                        }
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";
                        document.getElementById("TNOMVIA").value = "";
                    }
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                //$.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }
        
        function f_abrir_axisper042 () {
            f_scroll_top();
	objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
}
   
        function f_scroll_top() {
            window.scrollTo(0,0);
        }
        
        
      
        function f_aceptar_axisper042(CPOSTAL){
    		f_cerrar_modal("axisper042");
    		objDom.setValorPorId("CPOSTAL", CPOSTAL);
    		document.miForm.CPOSTAL.focus();            
    	}
        
        
        function correoValido(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
      } 

        function selectFlag(valor, origen) {
            
            idFlag = eval("document.miForm." + origen + ".options[valor].id");
            textFlag = eval("document.miForm." + origen + ".options[valor].text");
            if (!objUtiles.estaVacio(idFlag)){
                document.getElementById('flagPais' + origen).src = "images/flagiso/" + idFlag + ".png";
                document.getElementById("TFLAG_span" + origen).innerHTML = "<b>" + textFlag + "</b>";
            }
            else{
                document.getElementById('flagPais'+ origen).src = "images/flagiso/_unknown.png";
                document.getElementById("TFLAG_span" + origen).innerHTML = "";
            }
        } 
        
        /* Disable Scroll to person */
        
var keys = {37: 1, 38: 1, 39: 1, 40: 1};

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;  
}

function preventDefaultForScrollKeys(e) {
    if (keys[e.keyCode]) {
        preventDefault(e);
        return false;
    }
}

function disableScroll() {
  if (window.addEventListener) // older FF
      window.addEventListener('DOMMouseScroll', preventDefault, false);
  window.onwheel = preventDefault; // modern standard
  window.onmousewheel = document.onmousewheel = preventDefault; // older browsers, IE
  window.ontouchmove  = preventDefault; // mobile
  document.onkeydown  = preventDefaultForScrollKeys;
 
}

function enableScroll() {
    if (window.removeEventListener)
        window.removeEventListener('DOMMouseScroll', preventDefault, false);
    window.onmousewheel = document.onmousewheel = null; 
    window.onwheel = null; 
    window.ontouchmove = null;  
    document.onkeydown = null;  
}

/* IAXIS-13881 : Cambios de facturacion electronica : start*/
/* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES : INI*/
function f_cir037(t) 
{
	document.miForm.CCIR037.value=t;
}
/* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES : FIN*/
function f_onlynumber_FE(t) 
{
	if (t.value.match(/[^A-Za-z0-9]/g)) 
	{
		alert("<axis:alt f='axisper010' c='ERRORNUM' lit='9907933'/>");
		t.value = t.value.replace(/[^A-Za-z0-9]/g, '');
	}	
	else
	{		
		if (!objUtiles.estaVacio(t.value)){		
			var qs="operation=ajax_validate_nit_proveedor";
		    qs=qs+"&NIT_PROVEEDOR="+t.value;
		    objAjax.invokeAsyncCGI("modal_axisper010.do", callbackajaxvalidate_nit_proveedor, qs, this, objJsMessages.jslit_cargando);
		}	 			
	}	
}

function callbackajaxvalidate_nit_proveedor(ajaxResponseText){
	 try
	 { 		
        var doc = objAjax.domParse(ajaxResponseText);                
        if (objAppMensajes.existenErroresEnAplicacion(doc)) 
        {        	        
        	alert("<axis:alt f='axisper010' c='ERRORNUM' lit='9902749'/>");          	
        	objDom.setValorPorId("NIT_PROVEEDOR", "");
        	objDom.setVisibilidadPorId("mensajes_div", "hidden");   
        	objDom.setVisibilidadPorId("mensajes_table", "hidden"); 
    		document.miForm.NIT_PROVEEDOR.focus();          
        }  	        	
    }
	catch (e) 
	{
       if (isDebugAjaxEnabled == "true")
        alert (e.name + " " + e.message);
    }
}
	
function f_abrir_axisfiscales_adquiriente001(CODIGO, LITERAL){
	f_scroll_top();
	document.miForm.FISCALES_ADQUIRIENTE.readOnly = true;
   objUtiles.abrirModal("axisfiscales_adquiriente001", "src", "modal_axisfiscales_adquiriente001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
}

function f_aceptar_axisfiscales_adquiriente001(CODIGO, TEXTO){
       f_cerrar_axisfiscales_adquiriente001();   
       objDom.setValorPorId("FISCALES_ADQUIRIENTE", CODIGO);       
       document.miForm.FISCALES_ADQUIRIENTE.readOnly = true;
       objDom.setValorHTMLPorId("TFISCALES_ADQUIRIENTE_span", "<b>" + TEXTO + "</b>");    
} 

function f_cerrar_axisfiscales_adquiriente001() {
   objUtiles.cerrarModal("axisfiscales_adquiriente001");
}  

function f_onblur_email_FS(CORREO_FACT_ELECT){
	objDom.setValorPorId("CORREO_FACT_ELECT",CORREO_FACT_ELECT.replace(/\s/g,''));
}

/* IAXIS-13881 : Cambios de facturacion electronica : end*/           

/* Cambio para IAXIS-15339 : Start */ 
function f_crear_con_cifin(CTIPIDE, NNUMIDE, TAPELLI)//POST 35
{
	objUtiles.ejecutarFormulario("modal_axisper010.do", "crearPersonaConCIFIN", document.miForm, "_self", objJsMessages.jslit_cargando);  
}
/* Cambio para IAXIS-15339 : End */
       
        
    </script>
</head>
<body onload="f_onload()">
	<div id="wrapper" class="wrapper">
		<c:import url="../include/precargador_ajax.jsp">
			<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisciiu001|axisciiu001</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisprf016|<axis:alt
					f="xisper010" c="MODAL_AXISPRF016" lit="101278" />
			</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper042|<axis:alt
					c="axisper042_TITULO" f="axisper042" lit="9002274" />
			</c:param>
		</c:import>

	<!-- IAXIS-13881 : Cambios de facturacion electronica : start -->
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisfiscales_adquiriente001|<axis:alt
					c="axisfiscales_adquiriente001_TITULO" f="axisfiscales_adquiriente001" lit="89908051" />
			</c:param>
		</c:import>
	<!-- IAXIS-13881 : Cambios de facturacion electronica : end -->
	
		<!--********** CALENDARIO ************************* -->
		<!-- Hoja de estilo del Calendario -->
		<link rel="stylesheet" type="text/css" media="all"
			href="styles/calendar-green.css" title="green" />
		<!-- Script principal del calendario -->
		<script type="text/javascript" src="scripts/calendar.js"></script>
		<!-- Idioma del calendario, en funciÃƒÂ³n del Locale -->
		<script type="text/javascript"
			src="scripts/calendar-${sessionScope.__locale}.js"></script>
		<!-- Setup del calendario -->
		<script type="text/javascript" src="scripts/calendar-setup.js"></script>
		<!--*********************************** -->
		<form name="miForm" action="" method="POST">
			<input type="hidden" name="operation" value="busqueda_persona" /> <input
				type="hidden" name="faceptar" value="${__formdata.faceptar}" />
			<%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
			<input type="hidden" name="isNew" value="${__formdata.isNew}" /> <input
				type="hidden" name="SPERSON" id="SPERSON"
				value="${__formdata.SPERSON}" /> <input type="hidden"
				name="CMUTUALISTA" value="${__formdata.CMUTUALISTA}" /> <input
				type="hidden" name="NORDIDE" value="${__formdata.NORDIDE}" /> <input
				type="hidden" name="TPAIS" value="${__formdata.TPAIS}" /> 
				<input type="hidden" name="CCIR037" value="${__formdata.CCIR037}" /> <!--TASK 15419 MPC CIRCULAR 037 -->
				<input
				type="hidden" name="SNIP_OB" value="${__formdata.SNIP_OB}" /> <input
				type="hidden" name="CAGENTE_INI" value="${__formdata.CAGENTE_INI}" />
			<input type="hidden" name="CAGENTE_DUP" id="CAGENTE_DUP"
				value="${__formdata.CAGENTE_DUP}" /> <input type="hidden"
				name="PDUPLICADO" id="PDUPLICADO" value="${__formdata.PDUPLICADO}" />
			<input type="hidden" name="SWPUBLIHIDE" id="SWPUBLIHIDE"
				value="${__formdata.SWPUBLI}" /> <input type="hidden"
				name="MENSWARNINFO" id="MENSWARNINFO"
				value="${__formdata.MENSWARNINFO}" /> <input type="hidden"
				name="SFINANCI" value="${__formdata.SFINANCI}" /> <input
				type="hidden" name="sinProvincias" id="sinProvincias"
				value="${__formdata.sin_provincias}" /> 
				
			<c:import url="../include/titulo_nt.jsp">
				<c:param name="formulario">
					<axis:alt f="axisper010" c="TIT_FORM" lit="110275" />
				</c:param>
				<c:param name="producto">
					<axis:alt f="axisper010" c="TIT_FORM" lit="110275" />
				</c:param>
				<c:param name="form">axisper010</c:param>
			</c:import>
			<c:import url="../include/modal_estandar.jsp">
				<c:param name="titulo">
					<axis:alt f="axisper010" c="TIT_AXISPER024" lit="9901871" />
				</c:param>
				<c:param name="nid" value="axisper024" />
			</c:import>
			<!-- Area de campos  -->
			<table id="tabla1" class="mainModalDimensions base" align="center"
				cellpadding="0" cellspacing="0">

				<c:if test="${__formdata.isNew}">
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" /> <b><axis:alt f="axisper010"
										c="TIT_BUSCADOR" lit="1000235" /></b>

							</div>
							<table class="seccion">
								<tr>
									<th style="width: 5%; height: 0px"></th>
									<th style="width: 18%; height: 0px"></th>
									<th style="width: 18%; height: 0px"></th>
									<th style="width: 18%; height: 0px"></th>
									<th style="width: 18%; height: 0px"></th>
									<th style="width: 18%; height: 0px"></th>
									<th style="width: 5%; height: 0px"></th>
								</tr>
								<axis:ocultar c="CAGENTEcerca" f="axisper010">
									<tr>
										<td>&nbsp;</td>
										<td class="titulocaja" colspan="2"><b><axis:alt
													f="axisper010" c="CAGENTE_BUSQUEDA" lit="100584" /></b></td>
									</tr>
								</axis:ocultar>
								<axis:ocultar c="CAGENTEcerca" f="axisper010">
									<tr>
										<td>&nbsp;</td>
										<td class="campocaja" colspan="2"><select
											name="CAGENTEcerca" id="CAGENTEcerca"
											<axis:atr f="axisper010" c="CAGENTEcerca" a="modificable=true&obligatorio=true&isInputText=false"/>
											class="campowidthselect campo campotexto"
											style="width: 100%;"
											title="<axis:alt f="axisper010" c="CAGENTE_BUSQUEDA" lit="100584"/>">&nbsp;
												<option value="<%=Integer.MIN_VALUE%>">-
													<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
												</option>
												<c:forEach var="element"
													items="${__formdata.listValores.lstAgentes}">
													<option value="${element.CODI}"
														<c:if test="${element.CODI == __formdata.CAGENTE_INI || element.CODI == __formdata.CAGENTEcerca}"> selected </c:if> />
                                                ${element.NOMBRE} 
                                            </option>
												</c:forEach>
										</select></td>
									</tr>
								</axis:ocultar>
								<tr>
									<td>&nbsp;</td>
									<axis:ocultar c="CTIPPERcerca" f="axisper010"
										dejarHueco="false">
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="CTIPPERcerca" lit="102844" /></b></td>
									</axis:ocultar>
									<axis:ocultar c="CTIPIDEcerca" f="axisper010"
										dejarHueco="false">
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="CTIPIDEcerca" lit="109774" /></b></td>
									</axis:ocultar>
									<axis:ocultar c="NNUMIDEcerca" f="axisper010"
										dejarHueco="false">
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="NNUMIDEcerca" lit="105330" /></b></td>
									</axis:ocultar>
									<!-- POST-35 CJAD  -->			
									<axis:ocultar c="TAPELLIcerca" f="axisper010"
										dejarHueco="false">
										<td class="titulocaja" style="visibility: hidden;" id="TAPELLIcercaT"><b><axis:alt f="axisper010"
													c="TAPELLIcerca" lit="108243" /></b></td>
									</axis:ocultar>
									<!-- POST-35 CJAD  -->

									<c:if
										test="${empty __formdata.CTIPPERcerca || __formdata.CTIPPERcerca != 2}">
										<axis:ocultar c="CSEXPERcerca" f="axisper010"
											dejarHueco="false">
											<td class="titulocaja" id="td_CSEXPERcerca"><b><axis:alt
														f="axisper010" c="CSEXPERcerca" lit="100962" /></b></td>
										</axis:ocultar>
										<axis:ocultar c="FNACIMIcerca" f="axisper010"
											dejarHueco="false">
											<td class="titulocaja" id="tit_FNACIMIcerca"><b
												id="label_FNACIMIcerca"><axis:alt f="axisper010"
														c="FNACIMIcerca" lit="1000064" /></b></td>
										</axis:ocultar>
									</c:if>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<axis:ocultar c="CTIPPERcerca" f="axisper010"
										dejarHueco="false">
										<td class="campocaja"><select name="CTIPPERcerca"
											id="CTIPPERcerca" size="1"
											class="campowidthselect campo campotexto" style="width: 90%;"
											title="<axis:alt f="axisper010" c="CTIPPERcerca" lit="102844"/>"
											onchange="f_onchange_CTIPPERcerca(this.value)"
											<axis:atr f="axisper010" c="CTIPPERcerca" a="modificable=true&obligatorio=true&isInputText=false"/>
											<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper010" c="CTIPPERcerca" a="modificable=false&isInputText=false"/> </c:if>>&nbsp;
												<option value="<%=Integer.MIN_VALUE%>">-
													<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
												</option>
												<c:forEach var="element"
													items="${__formdata.listValores.tipPerson}">
													<option value="${element.CATRIBU}"
														<c:if test="${element.CATRIBU == __formdata.CTIPPERcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
												</c:forEach>
										</select></td>
									</axis:ocultar>
									<axis:ocultar c="CTIPIDEcerca" f="axisper010"
										dejarHueco="false">
										<td class="campocaja"><select name="CTIPIDEcerca"
											id="CTIPIDEcerca"
											onchange="f_onchange_CTIPIDEcerca(this.value)"
											<axis:atr f="axisper010" c="CTIPIDEcerca" a="isInputText=false&obligatorio=true&isInputText=false"/>
											<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper010" c="CTIPIDEcerca" a="modificable=false&isInputText=false"/> </c:if>
											size="1"
											title="<axis:alt f="axisper010" c="CTIPIDEcerca" lit="109774"/>"
											class="campowidthselect campo campotexto"
											<axis:atr f="axisper010" c="CTIPIDEcerca" a="modificable=true&obligatorio=true"/>
											style="width: 100%;">&nbsp;
												<option value="<%=Integer.MIN_VALUE%>">-
													<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
												</option>
												<c:forEach var="element"
													items="${__formdata.listValores.tipDocum}">
													<option value="${element.CATRIBU}"
														<c:if test="${element.CATRIBU == __formdata.CTIPIDEcerca}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
												</c:forEach>
										</select></td>
									</axis:ocultar>
									<!-- CP0013M_SYS_PERS_Val - ACL - 30/10/2018 -- Se adiciona maxlength para el campo NNUMIDEcerca -->
									<!-- CP0036M_SYS_PERS - ACL - 30/11/2018 -- Se modifica maxlength para mÃƒÂ¡ximo 15-->
									<!-- GLPI-36944 JFLJ - 30/11/2018 -- Se modifica maxlength en 16 para tipo doc 42 -->
									<td class="campocaja"><input type="text" maxlength="16"
										<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=false"/> </c:if>
										class="campowidthinput campo campotexto" size="16"
										value="${__formdata.NNUMIDEcerca}"
										<axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=true&obligatorio=true"/>
										title="<axis:alt f="axisper010" c="NNUMIDEcerca" lit="105330"/>"
										name="NNUMIDEcerca" id="NNUMIDEcerca"
										onkeyup="f_onlynumber(this)"
										style="width: 70%;; text-transform: uppercase;"
										<c:if test="${empty __formdata.isNew}"> <axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=false"/> </c:if>
										<c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 0}" > <axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=false"/> </c:if>
										<axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=true&obligatorio=true"/>
										<c:if test="${empty __formdata.isNew}"> readonly </c:if>
										<c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 99}" > <axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=false"/> </c:if>
										<axis:atr f="axisper010" c="NNUMIDEcerca" a="modificable=true&obligatorio=true"/> />



									</td>
									
									<!-- POST-35 CJAD  -->
									<td class="campocaja"><input type="text" maxlength="16"
										<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=false"/> </c:if>
										class="campowidthinput campo campotexto" size="16"
										value="${__formdata.TAPELLIcerca}"
										<axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=true"/>
										title="<axis:alt f="axisper010" c="TAPELLIcerca" lit="105330"/>"
										name="TAPELLIcerca" id="TAPELLIcerca"
										style="width: 70%; text-transform: uppercase; visibility: hidden;"
										<c:if test="${empty __formdata.isNew}"> <axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=false"/> </c:if>
										<c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 0}" > <axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=false"/> </c:if>
										<axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=true"/>
										<c:if test="${empty __formdata.isNew}"> readonly </c:if>
										<c:if test="${!empty __formdata.CTIPIDEcerca && __formdata.CTIPIDEcerca == 99}" > <axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=false"/> </c:if>
										<axis:atr f="axisper010" c="TAPELLIcerca" a="modificable=true"/> />
									</td>
									<!-- POST-35 CJAD  -->
									
									<c:if
										test="${empty __formdata.CTIPPERcerca || __formdata.CTIPPERcerca != 2}">
										<axis:ocultar c="CSEXPERcerca" f="axisper010"
											dejarHueco="false">
											<td class="campocaja"><select name="CSEXPERcerca"
												<c:if test="${(!empty sessionScope.resultats || sessionScope.resultats) && empty __formdata.INVALID}"> <axis:atr f="axisper010" c="CSEXPERcerca" a="modificable=false&isInputText=false"/></c:if>
												id="CSEXPERcerca" size="1"
												class="campowidthselect campo campotexto"
												style="width: 65%;"
												title="<axis:alt f="axisper010" c="CSEXPERcerca" lit="100962"/>"
												<axis:atr f="axisper010" c="CSEXPERcerca" a="isInputText=false&obligatorio=true"/>>&nbsp;
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
													</option>
													<c:forEach var="element"
														items="${__formdata.listValores.tipSexo}">
														<option value="${element.CATRIBU}"
															<c:if test="${element.CATRIBU == __formdata.CSEXPERcerca}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
										<axis:ocultar c="FNACIMIcerca" f="axisper010"
											dejarHueco="false">
											<!-- 28/12/2011
                                    afegim onblur="javascript:f_formatdate(this,'')"
                                    bug: 20678
                                    BFP
                              -->
											<td class="campocaja" id="td_FNACIMIcerca"><input
												onblur="javascript:f_formatdate(this,'')" type="text"
												<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper010" c="FNACIMIcerca" a="modificable=false"/> </c:if>
												class="campowidthinput campo campotexto" size="10"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMIcerca}"/>"
												name="FNACIMIcerca" id="FNACIMIcerca" style="width: 65%;"
												<axis:atr f="axisper010" c="FNACIMIcerca" a="modificable=true&formato=fecha&obligatorio=true"/>
												title="<axis:alt f="axisper010" c="FNACIMIcerca" lit="1000064"/>" />
												<a style="vertical-align: middle;"><img
													id="popup_calendario_FNACIMIcerca"
													alt="<axis:alt f="axisper010" c="FNACIMIcerca" lit="1000064"/>"
													title="<axis:alt f="axisper010" c="FNACIMIcerca" lit="1000064" />"
													src="images/calendar.gif" /></a></td>
										</axis:ocultar>
									</c:if>
									<td class="campocaja"><img id="find" name="find"
										border="0" src="images/find.gif"
										onclick="f_personaDuplicada()" style="cursor: pointer" /></td>
										
								<!--  Cambio para IAXIS-15339 : Start --> 
								<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">		
									<c:if test="${ !empty __formdata.CTIPIDEcerca && ( __formdata.CTIPIDEcerca == 33 || __formdata.CTIPIDEcerca == 34 
																					|| __formdata.CTIPIDEcerca == 35 || __formdata.CTIPIDEcerca == 36 
																					|| __formdata.CTIPIDEcerca == 37 || __formdata.CTIPIDEcerca == 40 )}">
									<axis:visible f="axisper010" c="BUSCAR_CIFIN">	<!-- POST-134 --> 
										<td>
										<input type="button" class="boton" id="BUSCAR_CIFIN"
													style="width: 150px" value="Crear con Proveedor"
													onclick="javascript:f_crear_con_cifin('${__formdata.CTIPIDEcerca}',
																					      '${__formdata.NNUMIDEcerca}',
																					      '${__formdata.TAPELLIcerca}');"> <!--  POST 35 -->
										</td>	
									</axis:visible><!-- POST-134 --> 
									</c:if>                								   		
								</c:if>
								<!--  Cambio para IAXIS-15339 : End --> 
								</tr>


							</table>


						</td>
					</tr>
				</c:if>

				<!-- Init Despliegue demÃ¢Â³Â campos para la persona si no esta duplicada -->
				<c:if
					test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">
					<tr>
						<td>
							<%-- Init Datos persona --%>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" /> <b><axis:alt f="axisper010"
										c="DATOS_PERSONA" lit="110275" /></b>
							</div> <c:import url="axisper010_datos_persona.jsp" />
						</td>
					</tr>
					<%-- End Datos persona --%>				
						
					
					<c:if test="${empty __formdata.SPERSON}"> <!-- ValidaciÃƒÂ³n para cuando se editan los datos bÃƒÂ¡sicos -->  
					<%-- Init Contactos --%>
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="CONTACTOS" lit="101025" />
							</div> <c:import url="axisper010_contacto_persona.jsp" />
						</td>
					</tr>
					<%-- End Contactos --%>

					<%-- Init Direcciones --%>
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="DIRECCIONS" lit="105889" />
							</div> <c:import url="axisper010_direccion_persona.jsp" />
						</td>
					</tr>
					<%-- End Direcciones --%>
					<%-- Init Nacionalidades  --%>
					<c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> 
						<tr>
							<td>
								<div class="separador">&nbsp;</div>
								<div class="titulo">
									<img src="images/flecha.gif" />
									<axis:alt f="axisper010" c="NACIONALIDAD" lit="1000304" />
								</div> <c:import url="axisper010_nacionalidades_persona.jsp" />
							</td>
						</tr>

					</c:if>
					<%-- End Nacionalidades  --%>
					<%-- Init Indicadores --%>

					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="REGFISCAL" lit="9902257" />
							</div> <c:import url="axisper010_indicaret_persona.jsp" />

						</td>
					</tr>
					<%-- End Indicadores --%>				
					
					<%-- Init Regimen Fiscal --%>
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="MODAL_AXISPRF0161" lit="101278" />
							</div> 

							<c:import url="axisper010_reg_fiscal_persona.jsp" />
						
						</td>
					</tr>
					
					
				
					<%-- End Regimen Fiscal --%>

					<%-- IAXIS-13881 : Cambios de facturacion electronica : start --%>
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="facturacion_electronica" lit="89908046" />
							</div> 

							<c:import url="axisper010_fact_electronica_persona.jsp" />
						
						</td>
					</tr>
													
					<%-- IAXIS-13881 : Cambios de facturacion electronica : end --%>
					<%-- IAXIS-15419 : CIRCULAR 037 MODIFICACIONES : INI --%>
					<tr>
						<td>
							<div class="separador">&nbsp;</div>
							<div class="titulo">
								<img src="images/flecha.gif" />
								<axis:alt f="axisper010" c="Propiedades" lit="9001817" />
							</div> 
							 <c:import url="axisper010_prop_per_parpersonas.jsp" />
						</td>
					</tr>
					<%-- IAXIS-15419 : CIRCULAR 037 MODIFICACIONES : FIN --%>
					
					</c:if>
				</c:if>
				<!--End Despliegue demÃ¢Â³Â campos para la persona si no esta duplicada -->
			</table>



			<div class="separador">&nbsp;</div>
			<div class="separador">&nbsp;</div>
			<div class="separador">&nbsp;</div>
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper010</c:param>
				<c:param name="__botones">cancelar<c:if
						test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>
				</c:param>
			</c:import>
		</form>
		<script type="text/javascript">
         <%-- <c:if test="${__formdata.isNew && empty __formdata.FNACIMIcerca || empty __formdata.FNACIMI}"> --%>
       <%--    <c:if test="${(empty __formdata.CTIPPER || __formdata.CTIPPER != 2)}"> TIDENTI == 2: Persona JurÃƒÂ­dica --%>
       
           Calendar.setup({
                inputField     :    "FNACIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FNACIMIcerca",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNACIMIcerca", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField  :   "FDEFUNC",
                ifFormat    :   "%d/%m/%Y",
                button      :   "btt_FDEFUNC",
                singleClick :   true,
                firstDay    :   1
            });
             Calendar.setup({
                inputField     :    "FJUBILA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FJUBILA", 
                singleClick    :    true,
                firstDay       :    1
            });
             Calendar.setup({
                 inputField     :    "FEFECTO",
                 ifFormat       :    "%d/%m/%Y",
                 button         :    "icon_FEFECTO",
                 singleClick    :    true,
                 firstDay       :    1,
                 /* For IAXIS-4728 -- PK -- 09/07/2019 */
                 dateStatusFunc :    function (date) {
                     var now = new Date();
                     if(date.getFullYear()	<	now.getFullYear()) { return true; }
                     if(date.getFullYear()	==	now.getFullYear()) { if(date.getMonth() < now.getMonth()) { return true; } }
                     if(date.getMonth()		==	now.getMonth()) { if(date.getDate() < now.getDate()) { return true; } }
                 }
             	/* For IAXIS-4728 -- PK -- 09/07/2019 */
             });
         <%-- </c:if>  --%>
        </script>


		<c:import url="../include/mensajes.jsp" />
	</div>
</body>
<c:if
	test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
	<script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisper010');
      </script>
</c:if>
</html>
