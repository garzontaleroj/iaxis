<%/* Revision:# rHMTnKoq42bKGh6BNWgiug== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="linea_trami" value="${__formdata.indexTramitacio}"/>
<!-- ${LINEATRAM} -->
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title>
            <axis:alt f="axissin014" c="LIT_DETALLE" lit="1000113"/>
            <axis:alt f="axissin014" c="LIT_PAGOS" lit="109479"/>
            /
            <axis:alt f="axissin014" c="LIT_RECOB" lit="9000897"/>
        </title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css"></link>
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
        <c:import url="../include/carga_framework_js.jsp"/>
        <script type="text/javascript">
        function f_onload() { 
            var val1 = "<%=request.getAttribute("OK")%>"; 
            var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
            var seccion = "${__formdata.SECCION}";
            var ERROR_IMPUESTOS = "${__formdata.ERROR_IMPUESTOS}";
            
            if (val1=="OK"){
                parent.f_aceptar_axissin014(NSINIES,"tramitaciones",seccion); //TODO: Dato EJ. para volver a la pantalla
                parent.f_cerrar_axissin014('aceptar');
            }

            // bug 0024826 
            if (val1 == "!OK"){
                // Para que muestre los avisos/errores
                f_cargar_propiedades_pantalla();
                f_actualizarImporte(null,0);
            } else {
                // Caso normal
                var CGARANT = "${__formdata.CGARANT}";
    
                try{
                    if (!objUtiles.estaVacio(CGARANT)){
                        objDom.setVisibilidadPorId("CCONPAG_TD", "visible");
                        objDom.setVisibilidadPorId("CCONPAG_TD2", "visible");
                        document.getElementById("CCONPAG_TD").style.display ="block";
                        document.getElementById("CCONPAG_TD2").style.display ="block";
                    }else{
                        objDom.setVisibilidadPorId("CCONPAG_TD", "hidden");
                        objDom.setVisibilidadPorId("CCONPAG_TD2", "hidden");
                        document.getElementById("CCONPAG_TD").style.display ="none";
                        document.getElementById("CCONPAG_TD2").style.display ="none";
                    }
    
                }catch(e){}
            
              
                
                f_cargar_propiedades_pantalla();
                if (ERROR_IMPUESTOS!=1){
                    f_actualizarImporte();
                }
                if (ERROR_IMPUESTOS==1){
                    $("#but_aceptar").attr("disabled", "disabled");
                }
            }

       }
        
        function f_but_aceptar(){
        
          //  reformatearImportes();
            f_guarda_impuestos();
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioRES");
            
            if(typeof hayChecked == 'boolean') {
                 alert("<axis:alt f="axissin014" c="NOCHECK" lit="9903746"/>");
            }else{
                 var NMOVRES = objUtiles.utilSplit(hayChecked, "|")[0]; // NMOVRES
                 var FRESINI = objUtiles.utilSplit(hayChecked, "|")[6]; // FRESINI
                 var FRESFIN = objUtiles.utilSplit(hayChecked, "|")[7]; // FRESFIN
                 var CCONPAG = "${__formdata.PAGO.CCONPAG}";
                 if ($("#IMPUESTOS_SAP").val()==1&&
                     $("#CTIPDES").val()==53){
                     var PIVA = $("#PIVA_SAP_NPORCENT").val();
                     var PRETENC = $("#PRETENC_SAP_NPORCENT").val();
                     var PRETEIVA = $("#PRETEIVA_SAP_NPORCENT").val();
                     var PRETEICA = $("#PRETEICA_SAP_NPORCENT").val();
                     var PIPOCONSUMO = $("#PIPOCONSUMO_SAP_NPORCENT").val();
                     if (objValidador.validaEntrada()&& f_valida_importes()) {   
                      objUtiles.ejecutarFormulario ("modal_axissin014.do?NMOVFILA="+NMOVRES+
                                                                        "&FPERINI="+FRESINI+
                                                                        "&FPERFIN="+FRESFIN+
                                                                        "&CCONPAG="+CCONPAG+
                                                                        "&PIVA="+PIVA+
                                                                        "&PRETENC="+PRETENC+
                                                                        "&PRETEIVA="+PRETEIVA+
                                                                        "&PRETEICA="+PRETEICA+
                                                                        "&PIPOCONSUMO="+PIPOCONSUMO, 
                      "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                     }
                 }else{
                     if (objValidador.validaEntrada()&& f_valida_importes()) {   
                          objUtiles.ejecutarFormulario ("modal_axissin014.do?NMOVFILA="+NMOVRES+
                                                                            "&FPERINI="+FRESINI+
                                                                            "&FPERFIN="+FRESFIN+
                                                                            "&CCONPAG="+CCONPAG, 
                          "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                     }
                 }
            }
           
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_axissin014('cancelar');
        }

        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
            
        function f_getReserva_inicial(NMOVRES_VAL,IVALCTUAL_VAL,CGARANT_VAL,CTIPRES_VAL,IRESERVA_VAL,CMONRES_VAL,FRESINI_VAL,FRESFIN_VAL){
        var param = '';
        
            var radioRES = document.getElementsByName("radioRES")[0];
            radioRES.checked = true;
            //radioRES.onclick();
          
            var NMOVRES = NMOVRES_VAL;
            var IVALCTUAL = IVALCTUAL_VAL;
            var CGARANT = CGARANT_VAL;
            var CTIPRES = CTIPRES_VAL;
            var IRESERVA = IRESERVA_VAL;
            var CMONRES = CMONRES_VAL;
			var FRESINI = '';
			if (!objUtiles.estaVacio(FRESINI_VAL)){
				var FRESINI = objUtiles.formateaTimeStamp2(FRESINI_VAL);
			}
			var FRESFIN = '';
			if (!objUtiles.estaVacio(FRESFIN_VAL)){
				var FRESFIN = objUtiles.formateaTimeStamp2(FRESFIN_VAL);
			}//var ISINRET = IRESERVA_VAL;
           
            var SSEGURO = document.miForm.SSEGURO.value;
            var NRIESGO = parent.document.miForm.NRIESGO.value;
          
            objDom.setValorPorId("CGARANT", CGARANT);
            objDom.setValorPorId("NMOVRES", NMOVRES);
            objDom.setValorPorId("CTIPRES", CTIPRES);
            objDom.setValorPorId("CMONRES", CMONRES);
            
            f_cargar_propiedades_pantalla();
            f_actualizarImporte(null, 0);
            objDom.setValorPorId("FPERINI",FRESINI);
            objDom.setValorPorId("FPERFIN",FRESFIN); 
            objDom.setValorPorId("FPERINI_AUX",FRESINI);
            objDom.setValorPorId("FPERFIN_AUX",FRESFIN); 
            //objDom.setValorPorId("ISINRET",ISINRET);
            
            document.miForm.CGARANT.value=CGARANT;
            document.miForm.NMOVRES.value=NMOVRES;
            document.miForm.CTIPRES.value=CTIPRES;
            document.miForm.CMONRES.value=CMONRES;
                        
           // objDom.setValorPorId("IVALACTUAL", objNumero.reFormateaNumero(IRESERVA,true));
            objDom.setValorPorId("IVALACTUAL", IRESERVA);
        
            param = param +'?NMOVRES='+NMOVRES_VAL;
            param = param +'&IVALCTUAL='+IVALCTUAL_VAL;
            param = param +'&CGARANT='+CGARANT_VAL;
            param = param +'&CTIPRES='+CTIPRES;
            param = param +'&SSEGURO='+SSEGURO;
            param = param +'&NRIESGO='+NRIESGO;
            param = param +'&CMONRES='+CMONRES;
            

            
           /*  param = param +'&IVALACTUAL'+ objNumero.reFormateaNumero(IRESERVA,true);
            
            objDom.setValorPorId("IVALACTUAL",  objNumero.reFormateaNumero(IRESERVA,true));

            objDom.setValorPorId("IVALCTUALobj",  objNumero.reFormateaNumero(IRESERVA,true));
            */
            
             param = param +'&IVALACTUAL'+ IRESERVA;
            
            objDom.setValorPorId("IVALACTUAL",  IRESERVA);

            objDom.setValorPorId("IVALCTUALobj", IRESERVA);
            
             try{
          
            
            if (!objUtiles.estaVacio(CGARANT_VAL)){
             		objDom.setVisibilidadPorId("CCONPAG_TD", "visible");
            	objDom.setVisibilidadPorId("CCONPAG_TD2", "visible");
            	document.getElementById("CCONPAG_TD").style.display ="block";
            	 document.getElementById("CCONPAG_TD2").style.display ="block";
            	
            }else{
            	objDom.setVisibilidadPorId("CCONPAG_TD", "hidden");
            	objDom.setVisibilidadPorId("CCONPAG_TD2", "hidden");
            	 document.getElementById("CCONPAG_TD").style.display ="none";
            	 document.getElementById("CCONPAG_TD2").style.display ="none";
            
            }
          }catch(e){}
            
            
            objAjax.invokeAsyncCGI("modal_axissin014.do"+param, callbackAjax_Reserva_Inicial, "operation=ajax_reserva_inicial", this, objJsMessages.jslit_cargando);
        }
        
       
        
        
        
        function callbackAjax_Reserva_Inicial (ajaxResponseText) {
                    try{
                        var doc = objAjax.domParse(ajaxResponseText);
                                        
                        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                             
                             objDom.setValorPorId("IFRANQ", objDom.getValorNodoDelComponente(doc.getElementsByTagName("IFRANQ"), 0, 0));
                             var NUMERO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IFRANQ"), 0, 0);
                             objDom.setValorPorId("IFRANQnomodif", objNumero.formateaNumeroCero(NUMERO, true));
                              
                        }   
                                         
                    }catch(e){
                    }
        }    

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        function f_getReserva(thiss, CTIPGAS){
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioRES");
            if(typeof hayChecked == 'boolean') {
               alert("<axis:alt f="axissin014" c="NOCHECK" lit="9903746"/>");
              
            }else{
                var NMOVRES = objUtiles.utilSplit(hayChecked, "|")[0]; // NMOVRES
                var IVALCTUAL = objUtiles.utilSplit(hayChecked, "|")[1]; // IVALCTUAL
                var CGARANT = objUtiles.utilSplit(hayChecked, "|")[2]; // CGARANT
                var CTIPRES = objUtiles.utilSplit(hayChecked, "|")[3]; // CTIPRES
                var CTIPGAS = CTIPGAS;
				var IRESERVA = objUtiles.utilSplit(hayChecked, "|")[4]; // IRESERVA
                var CMONRES = objUtiles.utilSplit(hayChecked, "|")[5]; // IRESERVA
                var FRESINI = objUtiles.utilSplit(hayChecked, "|")[6]; // FRESINI
                var FRESFIN = objUtiles.utilSplit(hayChecked, "|")[7]; // FRESFIN
                var IPAGO = objUtiles.utilSplit(hayChecked, "|")[8]; // IPAGO
                var IRECOBRO = objUtiles.utilSplit(hayChecked, "|")[9]; // IRECOBRO
                var ITOTIMP = objUtiles.utilSplit(hayChecked, "|")[10]; // ITOTIMP
                var ITOTRET = objUtiles.utilSplit(hayChecked, "|")[11]; // ITOTRET
                //var ISINRET = objUtiles.utilSplit(hayChecked, "|")[4];
                
                objDom.setValorPorId("CGARANT", CGARANT);
                f_cargar_propiedades_pantalla();
                f_actualizarImporte(null, 0);
                objDom.setValorPorId("NMOVRES", NMOVRES);
                objDom.setValorPorId("CTIPRES", CTIPRES);
                objDom.setValorPorId("CMONRES", CMONRES);
                objDom.setValorPorId("CTIPGAS", CTIPGAS);
                objDom.setValorPorId("FPERINI",FRESINI);
                objDom.setValorPorId("FPERFIN",FRESFIN);
                objDom.setValorPorId("FPERINI_AUX",FRESINI);
                objDom.setValorPorId("FPERFIN_AUX",FRESFIN); 
                //objDom.setValorPorId("ISINRET",ISINRET);
                
                document.miForm.CGARANT.value=CGARANT;
                document.miForm.NMOVRES.value=NMOVRES;
                document.miForm.CTIPRES.value=CTIPRES;
				document.miForm.CTIPGAS.value=CTIPGAS;
			    document.miForm.CMONRES.value=CMONRES;
                
                document.miForm.ITOTIMP.value=ITOTIMP;
                document.miForm.ITOTRET.value=ITOTRET;
                 
                objDom.setValorPorId("IVALACTUAL",IRESERVA);
                var PASIGNA = "${__formdata.PAGO.DESTINATARI.PASIGNA}";
                
                if (!objUtiles.estaVacio(PASIGNA) && 
                     parseFloat(PASIGNA) > 0 &&
                     parseFloat(PASIGNA) != 100){
                    
					var IRESERVA_calc = parseFloat(objNumero.quitarSeparadorMiles(IRESERVA));
					
					if (!objUtiles.estaVacio(IPAGO) && 
						parseFloat(IPAGO) >= 0){
						var IPAGO_calc = parseFloat(objNumero.quitarSeparadorMiles(IPAGO));
					}else{
						var IPAGO_calc = 0;
					}
                    
					if (!objUtiles.estaVacio(IRECOBRO) && 
						parseFloat(IRECOBRO) >= 0){
						var IRECOBRO_calc = parseFloat(objNumero.quitarSeparadorMiles(IRECOBRO));
					}else{
						var IRECOBRO_calc = 0;
					}
                    
					var PASIGNA_calc = parseFloat(PASIGNA);
                    
					if (IRESERVA_calc > 0){
						var RESERVA_TOTAL = IRESERVA_calc + IPAGO_calc - IRECOBRO_calc; 
					}else{
						var RESERVA_TOTAL = IRESERVA_calc;
					}
                    
                    var IVALACTUAL = ( RESERVA_TOTAL * PASIGNA_calc ) / 100;
					IVALACTUAL = Math.round(IVALACTUAL);
					
					if (IVALACTUAL == (IRESERVA_calc + 1) ){
						IVALACTUAL = IRESERVA_calc;
					}
                    objDom.setValorPorId("IVALCTUALobj",  IVALACTUAL);
                }else{
                    objDom.setValorPorId("IVALCTUALobj",  IRESERVA);
                }
                
                document.miForm.IVALACTUAL.value=IRESERVA;
                //document.miForm.IVALCTUALobj.value=IRESERVA;
                
            }
        f_guarda_impuestos();
        objUtiles.ejecutarFormulario ("modal_axissin014.do", "cargarFranquicia", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function replaceAll( text, busca, reemplaza ){
          while (text.toString().indexOf(busca) != -1)
              text = text.toString().replace(busca,reemplaza);
          return text;
        }
        
        function f_recargar(thiss){
           // reformatearImportes();
              //  limpiarCampos(thiss.id);
            f_guarda_impuestos();
            objUtiles.ejecutarFormulario ("modal_axissin014.do", "cargarFranquicia", document.miForm, "_self", objJsMessages.jslit_cargando);        


        }

        function callbackAjax_Actualitza_Imports (ajaxResponseText) {
            //try{
            
            
                var doc = objAjax.domParse(ajaxResponseText);

        
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
          
                var IMPORTE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPORTE"), 0, 0);
                var IIVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IIVA"), 0, 0);
                var PIVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("POIVA"), 0, 0);
                var PICA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("POICA"), 0, 0);
		var IICA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IICA"), 0, 0);
                var IRETENC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IRETENC"), 0, 0);
                var PRETENC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PORETENC"), 0, 0);
                var INETA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("INETA"), 0, 0);
                var PRETEIVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PORETEIVA"), 0, 0);
		var IRETEIVA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IRETEIVA"), 0, 0);
                var IRETEICA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IRETEICA"), 0, 0);
                var PRETEICA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PORETEICA"), 0, 0);                
                var IIPOCONSUMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIIPOCONSUMO"), 0, 0);
                var ISINRETPAG = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PISINRETPAG"), 0, 0);
                var INETAPAG = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINETAPAG"), 0, 0);
                var IFRANQ = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIFRANQ"), 0, 0);
           var PVALORCONVERTIDO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PVALORCONVERTIDO"),0,0);//Pfeiffer tarea 3481 12/06/2019
          
                objDom.setValorPorId("IMPORTE", objNumero.formateaNumeroCero(IMPORTE, true));
                objDom.setValorPorId("IIVA", objNumero.formateaNumeroCero(IIVA, true));
                if (PIVA >0){
                    objDom.setValorPorId("PIVA", objNumero.formateaNumeroCero(PIVA, true));
                }
				objDom.setValorPorId("IICA", objNumero.formateaNumeroCero(IICA, true));
                if (PICA>0){
                    objDom.setValorPorId("PICA", objNumero.formateaNumeroCero(PICA, true));
                }
				objDom.setValorPorId("IRETENC",objNumero.formateaNumeroCero(IRETENC, true) );
                if (PRETENC>0){
                    objDom.setValorPorId("PRETENC",objNumero.formateaNumeroCero(PRETENC, true) );
                }
				objDom.setValorPorId("INETA", objNumero.formateaNumeroCero(INETA, true));
                objDom.setValorPorId("IRETEIVA", objNumero.formateaNumeroCero(IRETEIVA, true));
                if (PRETEIVA>0){
                    objDom.setValorPorId("PRETEIVA", objNumero.formateaNumeroCero(PRETEIVA, true));
                }
				objDom.setValorPorId("IRETEICA", objNumero.formateaNumeroCero(IRETEICA, true));
                if (PRETEICA>0){
                    objDom.setValorPorId("PRETEICA", objNumero.formateaNumeroCero(PRETEICA, true));
                }
                
                if (IIPOCONSUMO>0){
                    objDom.setValorPorId("IIPOCONSUMO", objNumero.formateaNumeroCero(IIPOCONSUMO, true));
                }
                
                if (ISINRETPAG>0){
                    objDom.setValorPorId("ISINRETPAG", objNumero.formateaNumeroCero(ISINRETPAG, true));
                }
                
                if (INETAPAG>0){
                    objDom.setValorPorId("INETAPAG", objNumero.formateaNumeroCero(INETAPAG, true));
                }
                
                if (IFRANQ >= 0){
                    objDom.setValorPorId("IFRANQ", objNumero.formateaNumeroCero(IFRANQ, true));
					objDom.setValorPorId("IFRANQnomodif", objNumero.formateaNumeroCero(IFRANQ, true));
                }  

				//Pfeiffer tarea 3481 12/06/2019 inicio
                if (PVALORCONVERTIDO>0){
                	//se hay valor convertido retornado, actualiza lo campo de importe y processa este nuevo valor
                	PVALORCONVERTIDO = objNumero.formateaNumeroCero(PVALORCONVERTIDO, true);
					var ISINRET = objDom.getValorPorId("ISINRET");
					
					if( ISINRET!=PVALORCONVERTIDO){
						objDom.setValorPorId("ISINRET", PVALORCONVERTIDO);
	                    document.getElementById("ISINRET").onchange();
					}
                    
                }
              //Pfeiffer tarea 3481 12/06/2019 fim
                
            }   
                    if (!objUtiles.estaVacio("${__formdata.MENSAJES_MANTENER}")){
                        
                           <c:forEach var="element" items="${__formdata.MENSAJES_MANTENER}">
                               <c:if test="${element.OB_IAX_MENSAJES.TIPERROR == 1}">
                                 objAppMensajes.pintarMensajePantalla("${element.OB_IAX_MENSAJES.TERROR}", "error"); 
                               </c:if>
                               <c:if test="${element.OB_IAX_MENSAJES.TIPERROR == 2}">
                               objAppMensajes.pintarMensajePantalla("${element.OB_IAX_MENSAJES.TERROR}", "info"); 
                               </c:if>
                           </c:forEach>
                    
                    }
        
            //reformatearImportes();
     
            //}catch(e){}
            
            
                   <%--   var val1 = "<%=request.getAttribute("OK")%>"; 
                    var ERROR_IMPUESTOS = "${__formdata.ERROR_IMPUESTOS}";
                    
                    

                    // bug 0024826 
                    if (val1 == "!OK"){
                    	
                    }else{
                    <c:if test="${!empty __formdata.RESERVAS && fn:length(__formdata.RESERVAS) == 1 && empty OK}">
                    if (ERROR_IMPUESTOS!=1){
                        f_getReserva_inicial('${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}','<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.IVALACTUAL}"/>','${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.CGARANT}','${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}','<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/>','${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.CMONRES}','${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.FRESINI}','${__formdata.RESERVAS[0].OB_IAX_SIN_TRAMI_RESERVA.FRESFIN}');
                    }
               </c:if>
        			} --%>
        }  

		//Pfeiffer tarea 3481 12/06/2019 inicio
		function f_focusImporte(thiss){
			//on focus, remove valor del campo valorpesos
			document.getElementById("VALORPESOS").value = null;
		}
// 		Pfeiffer tarea 3481 fim


      
        function f_actualizarImporte(thiss , CCALIMP){
        
        f_guarda_impuestos();
        
        var ISINRET = objDom.getValorPorId("ISINRET");
        var param = '';
      
         if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'ISINRET')){
            ISINRET = validarNumeros(thiss.value);
            if (objUtiles.estaVacio(ISINRET))
                return;
             else
               f_formatear(thiss);
        }
        param = param +'?ISINRET='+ISINRET;
		
		      	//Pfeiffer tarea 3481 12/06/2019 inicio
        var VALORPESOS = objDom.getValorPorId("VALORPESOS");
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'VALORPESOS')){
        	VALORPESOS =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(VALORPESOS))
                return;
                else
              f_formatear(thiss);
        }
        param = param +'&VALORPESOS='+VALORPESOS;
      //Pfeiffer tarea 3481 12/06/2019 fim
		
		//INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
        var IFRANQ = objDom.getValorPorId("IFRANQnomodif");
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IFRANQ')){
        	IFRANQ =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(IFRANQ))
                return;
                else
              f_formatear(thiss);
        }
        param = param +'&IFRANQ='+IFRANQ;			
		//FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
		
        var IRESRCM = objDom.getValorPorId("IRESRCM");
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IRESRCM')){
            IRESRCM =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(IRESRCM))
                return;
                else
              f_formatear(thiss);
        }
        param = param +'&IRCMBRUT='+IRESRCM;
        var IRESRED = objDom.getValorPorId("IRESRED");
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IRESRED')){
            IRESRED =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(IRESRED))return;
            else
              f_formatear(thiss);
        }
        param = param +'&IREDUCCION='+IRESRED;
        var ISUPLID = objDom.getValorPorId("ISUPLID");
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'ISUPLID')){
            ISUPLID =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(ISUPLID))return;
            else
              f_formatear(thiss);
        }
        param = param +'&ISUPLID='+ISUPLID;
        var PRETENC = objDom.getValorPorId("PRETENC");
        if ($("#IMPUESTOS_SAP").val()==1&&
            $("#CTIPDES").val()==53){
             PRETENC = $("#PRETENC_SAP_NPORCENT").val();
        }
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PRETENC')){
            PRETENC =  validarNumeros(thiss.value);
            if (objUtiles.estaVacio(PRETENC))return;
            else
              f_formatear(thiss);
        } 
        param = param +'&PRETENC='+PRETENC;
        var PIVA = objDom.getValorPorId("PIVA");
        if ($("#IMPUESTOS_SAP").val()==1&&
            $("#CTIPDES").val()==53){
             PIVA = $("#PIVA_SAP_NPORCENT").val();
        }
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PIVA')){
            PIVA =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(PIVA)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&PIVA='+PIVA;
        
        var PICA = objDom.getValorPorId("PICA");
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PICA')){
            PICA =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(PICA)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&PICA='+PICA;
        
        var PRETEIVA = objDom.getValorPorId("PRETEIVA");
        if ($("#IMPUESTOS_SAP").val()==1&&
            $("#CTIPDES").val()==53){
             var PRETEIVA = $("#PRETEIVA_SAP_NPORCENT").val();
        }
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PRETEIVA')){
            PRETEIVA =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(PRETEIVA)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&PRETEIVA='+PRETEIVA;
        
        var PRETEICA = objDom.getValorPorId("PRETEICA");
        if ($("#IMPUESTOS_SAP").val()==1&&
            $("#CTIPDES").val()==53){
             var PRETEICA = $("#PRETEICA_SAP_NPORCENT").val();
        }
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PRETEICA')){
            PRETEICA =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(PRETEICA)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&PRETEICA='+PRETEICA;
        
        var IOTROSGAS = objDom.getValorPorId("IOTROSGAS");
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IOTROSGAS')){
            IOTROSGAS =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(IOTROSGAS)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&IOTROSGAS='+IOTROSGAS;
        
        var IBASEIPOC = objDom.getValorPorId("IBASEIPOC");
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IBASEIPOC')){
            IBASEIPOC =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(IBASEIPOC)) return;
             else
              f_formatear(thiss);
        }
        param = param +'&IBASEIPOC='+IBASEIPOC;
        
        var PIPOCONSUMO = objDom.getValorPorId("PIPOCONSUMO");
        
        if ($("#IMPUESTOS_SAP").val()==1&&
            $("#CTIPDES").val()==53){
             PIPOCONSUMO = $("#PIPOCONSUMO_SAP_NPORCENT").val();
        }
        
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PIPOCONSUMO')){
            PIPOCONSUMO =  validarNumeros(thiss.value);
             if (objUtiles.estaVacio(PIPOCONSUMO)) return;
             else
              f_formatear(thiss);
        }
        var CTIPRES = objDom.getValorPorId("CTIPRES");
        debugger;
        var CGARANT = objDom.getValorPorId("CGARANT");
        param = param +'&CGARANT='+CGARANT;
        param = param +'&CTIPRES='+CTIPRES;
        param = param +'&PIPOCONSUMO='+PIPOCONSUMO;
        
		
        param = param +'&CCALIMP='+CCALIMP;
        param = param +'&SIDEPAG='+$("#SIDEPAG").val();
        var SPERSON = "${__formdata.PAGO.DESTINATARI.PERSONA.SPERSON}";
        param = param +'&SPERSON='+SPERSON;
        param = param +'&FORDPAG='+$("#FORDPAG").val();
        var CCONPAG = "${__formdata.PAGO.CCONPAG}";
        param = param +'&CCONCEP='+CCONPAG;
        param = param +'&CAGENTE='+$("#CAGENTE").val(); 
        param = param +'&CTIPGAS='+$("#CTIPGAS").val();
		var CMONRES = objDom.getValorPorId("CMONRES");
        param = param +'&CMONRES='+$("#CMONRES").val();
        
        
        
        objAjax.invokeAsyncCGI("modal_axissin014.do"+param, callbackAjax_Actualitza_Imports, "operation=ajax_actualitza_imports", this, objJsMessages.jslit_cargando);
        }

      

        /*
        function reformatearImportes(){
               
             <axis:visible f="axissin014" c="ISINRET">
                objDom.setValorPorId("ISINRET",valorFormateadoCampoNumerico(objDom.getValorPorId("ISINRET"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="ISUPLID">
                objDom.setValorPorId("ISUPLID",valorFormateadoCampoNumerico(objDom.getValorPorId("ISUPLID"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IMPORTE">
                objDom.setValorPorId("IMPORTE", valorFormateadoCampoNumerico(objDom.getValorPorId("IMPORTE"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="PRETENC">
                objDom.setValorPorId("PRETENC",valorFormateadoCampoNumerico(objDom.getValorPorId("PRETENC"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IRETENC">
                objDom.setValorPorId("IRETENC", valorFormateadoCampoNumerico(objDom.getValorPorId("IRETENC"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="PIVA"> 
                objDom.setValorPorId("PIVA", valorFormateadoCampoNumerico(objDom.getValorPorId("PIVA"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IIVA"> 
                objDom.setValorPorId("IIVA", valorFormateadoCampoNumerico(objDom.getValorPorId("IIVA"),true,false));
             </axis:visible>
             
            <axis:visible f="axissin014" c="PICA"> 
                objDom.setValorPorId("PICA", valorFormateadoCampoNumerico(objDom.getValorPorId("PICA"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IICA"> 
                objDom.setValorPorId("IICA", valorFormateadoCampoNumerico(objDom.getValorPorId("IICA"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="PRETIVA">
                objDom.setValorPorId("PRETIVA",valorFormateadoCampoNumerico(objDom.getValorPorId("PRETIVA"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="PRETICA">
                objDom.setValorPorId("PRETICA",valorFormateadoCampoNumerico(objDom.getValorPorId("PRETICA"),true,false));
             </axis:visible>
             
             
             
             <axis:visible f="axissin014" c="INETA">
                objDom.setValorPorId("INETA",valorFormateadoCampoNumerico(objDom.getValorPorId("INETA"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IVALACTUAL">
                objDom.setValorPorId("IVALCTUALobj",valorFormateadoCampoNumerico(objDom.getValorPorId("IVALCTUALobj"),true,false));
                objDom.setValorPorId("IVALACTUAL",valorFormateadoCampoNumerico(objDom.getValorPorId("IVALACTUAL"),true,false));
             </axis:visible>
             <axis:visible f="axissin014" c="IFRANQ">
                objDom.setValorPorId("IFRANQnomodif",valorFormateadoCampoNumerico(objDom.getValorPorId("IFRANQnomodif"),true,false));
                objDom.setValorPorId("IFRANQ",valorFormateadoCampoNumerico(objDom.getValorPorId("IFRANQ"),true,false));     
             </axis:visible>
             <axis:visible f="axissin014" c="IRCMBRUT">
                objDom.setValorPorId("IRESRCM",valorFormateadoCampoNumerico(objDom.getValorPorId("IRESRCM"),true,false));     
             </axis:visible>
             <axis:visible f="axissin014" c="IREDUCCION">
                objDom.setValorPorId("IRESRED",valorFormateadoCampoNumerico(objDom.getValorPorId("IRESRED"),true,false));     
             </axis:visible>
        }*/
         /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                 if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                     if(objNumero.validaNumero(IMPORT, true)){
                         return this.formateaNumeroCero(IMPORT, true);
                     }
                     else{
                         return   '';
                     }
                 }
                 else return IMPORTE;
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
			
	function f_valida_importes(){
        if (!objUtiles.estaVacio($("#ISINRET").val())){
            var ISINRET = objValidador.valorFormateadoCampoNumerico($("#ISINRET").val(), true, true);
            if (objUtiles.estaVacio(ISINRET)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#IRESRCM").val())){
            var IRESRCM = objValidador.valorFormateadoCampoNumerico($("#IRESRCM").val(), true, true);
            if (objUtiles.estaVacio(IRESRCM)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#IRESRED").val())){
            var IRESRED = objValidador.valorFormateadoCampoNumerico($("#IRESRED").val(), true, true);
            if (objUtiles.estaVacio(IRESRED)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#ISUPLID").val())){
            var ISUPLID = objValidador.valorFormateadoCampoNumerico($("#ISUPLID").val(), true, true);
            if (objUtiles.estaVacio(ISUPLID)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#PRETENC").val())){
            var PRETENC = objValidador.valorFormateadoCampoNumerico($("#PRETENC").val(), true, true);
            if (objUtiles.estaVacio(PRETENC)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#PIVA").val())){
            var PIVA = objValidador.valorFormateadoCampoNumerico($("#PIVA").val(), true, true);
            if (objUtiles.estaVacio(PIVA)){
                return false;
            }
        } 
        if (!objUtiles.estaVacio($("#PICA").val())){
            var PICA = objValidador.valorFormateadoCampoNumerico($("#PICA").val(), true, true);
            if (objUtiles.estaVacio(PICA)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#PRETEIVA").val())){
            var PRETEIVA = objValidador.valorFormateadoCampoNumerico($("#PRETEIVA").val(), true, true);
            if (objUtiles.estaVacio(PRETEIVA)){
                return false;
            }
        }
        if (!objUtiles.estaVacio($("#PRETEICA").val())){
            var PRETEICA = objValidador.valorFormateadoCampoNumerico($("#PRETEICA").val(), true, true);
            if (objUtiles.estaVacio(PRETEICA)){
                return false;
            }
        } 
        return true;
    }
    
    function f_recarga_reteica(){
        f_guarda_impuestos();
        objUtiles.ejecutarFormulario ("modal_axissin014.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
    }
    
    function f_guarda_impuestos(){
        var NPORCENT;
        var CTIPIND;
        if (!objUtiles.estaVacio($("#PRETENC_SAP").val())){ 
            NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETENC_SAP").val(), "|")[0]); // NPORCENT
            CTIPIND = objUtiles.utilSplit($("#PRETENC_SAP").val(), "|")[1]; // CTIPIND
            $("#PRETENC_CTIPIND").val(CTIPIND);
            $("#PRETENC_SAP_NPORCENT").val(NPORCENT);
            //$("#PRETENC_SAP").val(" ");
        }
        if (!objUtiles.estaVacio($("#PIVA_SAP").val())){ 
            NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PIVA_SAP").val(), "|")[0]); // NPORCENT
            CTIPIND = objUtiles.utilSplit($("#PIVA_SAP").val(), "|")[1]; // CTIPIND   
            $("#PIVA_CTIPIND").val(CTIPIND);
            $("#PIVA_SAP_NPORCENT").val(NPORCENT);
            //$("#PIVA_SAP").val(" ");
        }
        if (!objUtiles.estaVacio($("#PRETEIVA_SAP").val())){ 
            NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETEIVA_SAP").val(), "|")[0]); // NPORCENT
            CTIPIND = objUtiles.utilSplit($("#PRETEIVA_SAP").val(), "|")[1]; // CTIPIND   
            $("#PRETEIVA_CTIPIND").val(CTIPIND);
            $("#PRETEIVA_SAP_NPORCENT").val(NPORCENT);
            //$("#PRETEIVA_SAP").val(" ");
        }
        if (!objUtiles.estaVacio($("#PRETEICA_SAP").val())){ 
            NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PRETEICA_SAP").val(), "|")[0]); // NPORCENT
            CTIPIND = objUtiles.utilSplit($("#PRETEICA_SAP").val(), "|")[1]; // CTIPIND   
            $("#PRETEICA_CTIPIND").val(CTIPIND);
            $("#PRETEICA_SAP_NPORCENT").val(NPORCENT);
            //("#PRETEICA_SAP").val(" ");
        }
        
        if (!objUtiles.estaVacio($("#PIPOCONSUMO_SAP").val())){ 
            NPORCENT = objNumero.cambiarSeparadorMilesPorDecimales(objUtiles.utilSplit($("#PIPOCONSUMO_SAP").val(), "|")[0]); // NPORCENT
            CTIPIND = objUtiles.utilSplit($("#PIPOCONSUMO_SAP").val(), "|")[1]; // CTIPIND   
            $("#PIPOCONSUMO_CTIPIND").val(CTIPIND);
            $("#PIPOCONSUMO_SAP_NPORCENT").val(NPORCENT);
        }
    }
        
    </script>
    </head>
    <body onload="javascript:f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <form name="miForm" action="modal_axissin014.do" method="POST">
        
            <input type="hidden" name="operation" id="operation" value="guardar"/>
            <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
            <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
            <input type="hidden" name="SIDEPAG" id="SIDEPAG" value="${__formdata.SIDEPAG}"/>
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="indexTramitacio" id="indexTramitacio" value="${__formdata.indexTramitacio}"/>
            <input type="hidden" name="SSEGURO" id="SSEGURO"  value="${__formdata.SSEGURO}"/>
            <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="CTIPPAG" id="CTIPPAG" value="${__formdata.CTIPPAG}"/>
            <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" name="CTIPRES" id="CTIPRES" value="${__formdata.CTIPRES}"/>
            <input type="hidden" name="CTIPGAS" id="CTIPGAS" value="${__formdata.CTIPGAS}"/>
            <input type="hidden" name="subpantalla" id="subpantalla" value="${subpantalla}"/>
            <input type="hidden" name="SECCION" id="SECCION" value="${__formdata.SECCION}"/>
            <input type="hidden" name="NMOVRES" id="NMOVRES" value="${__formdata.NMOVRES}"/>
            <input type="hidden" name="CMONRES" id="CMONRES" value="${__formdata.CMONRES}"/>
            <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
            <input type="hidden" name="FPERINI_AUX" id="FPERINI_AUX" value="${__formdata.FPERINI}"/>
            <input type="hidden" name="FPERFIN_AUX" id="FPERFIN_AUX" value="${__formdata.FPERFIN}"/>
            <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" name="IMPUESTOS_SAP" id="IMPUESTOS_SAP" value="${__formdata.IMPUESTOS_SAP}"/>
            <input type="hidden" name="CTIPDES" id="CTIPDES" value="${__formdata.PAGO.DESTINATARI.CTIPDES}"/>
            <input type="hidden" name="PRETEICA_CTIPIND" id="PRETEICA_CTIPIND" value="${__formdata.PRETEICA_CTIPIND}"/>
            <input type="hidden" name="PRETEIVA_CTIPIND" id="PRETEIVA_CTIPIND" value="${__formdata.PRETEIVA_CTIPIND}"/>
            <input type="hidden" name="PIPOCONSUMO_CTIPIND" id="PIPOCONSUMO_CTIPIND" value="${__formdata.PIPOCONSUMO_CTIPIND}"/>
            <input type="hidden" name="PIVA_CTIPIND" id="PIVA_CTIPIND" value="${__formdata.PIVA_CTIPIND}"/>
            <input type="hidden" name="PRETENC_CTIPIND" id="PRETENC_CTIPIND" value="${__formdata.PRETENC_CTIPIND}"/>
            <input type="hidden" name="PRETEICA_SAP_NPORCENT" id="PRETEICA_SAP_NPORCENT" value="${__formdata.PRETEICA_SAP_NPORCENT}"/>
            <input type="hidden" name="PRETEIVA_SAP_NPORCENT" id="PRETEIVA_SAP_NPORCENT" value="${__formdata.PRETEIVA_SAP_NPORCENT}"/>
            <input type="hidden" name="PIPOCONSUMO_SAP_NPORCENT" id="PIPOCONSUMO_SAP_NPORCENT" value="${__formdata.PIPOCONSUMO_SAP_NPORCENT}"/>
            <input type="hidden" name="PIVA_SAP_NPORCENT" id="PIVA_SAP_NPORCENT" value="${__formdata.PIVA_SAP_NPORCENT}"/>
            <input type="hidden" name="PRETENC_SAP_NPORCENT" id="PRETENC_SAP_NPORCENT" value="${__formdata.PRETENC_SAP_NPORCENT}"/>
            <input type="hidden" name="ITOTIMP" id="ITOTIMP" value="${__formdata.ITOTIMP}"/>
            <input type="hidden" name="ITOTRET" id="ITOTRET" value="${__formdata.ITOTRET}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo">
                    <axis:alt f="axissin014" c="LIT_DETALLE" lit="1000113"/>
                </c:param>
                <c:param name="formulario">
                    <axis:alt f="axissin014" c="LIT_DETALLE" lit="1000113"/>
                </c:param>
                <c:param name="form">axissin014</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
            <table id="tabla1" class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                                <th style="width:20%;height:0px">&nbsp;</th>
                            </tr>
                            <tr>
                             <axis:ocultar f="axissin014" c="NSINIES" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="NSINIES" lit="101298"/></b>
                                    </td>
                               </axis:ocultar>
                                <axis:visible c="TTIPTRA" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TTIPTRA" lit="9001028"/></b>
                                    <!-- Tipus tramitacio -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TTRAMIT" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TTRAMIT" lit="100588"/></b>
                                    <!-- Tipus dany  -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TTCAUSIN" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TTCAUSIN" lit="9000901"/></b>
                                    <!-- Tipus dany  -->
                                </td>
                                </axis:visible>
                                <axis:visible c="CINFORM" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="CINFORM" lit="9000905"/></b>
                                    <!-- Tramitación informativa -->
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>         
                              <axis:ocultar f="axissin014" c="NSINIES" dejarHueco="false"> 
                             <td class="campocaja">
                              <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin014" c="NSINIES" a="modificable=false"/> />
                                
                            </td>
                        </axis:ocultar>
                            <axis:visible c="TTIPTRA" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TTIPTRA"
                                           value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TTIPTRA" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="TTRAMIT" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TTRAMIT"
                                           value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TTRAMIT" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="TTCAUSIN" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TTCAUSIN"
                                           value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TTCAUSIN" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="CINFORM" f="axissin014">
                                <td class="campocaja" align="left">
                                    <input type="checkbox" disabled="disabled"
                                           id="CINFORM" name="CINFORM"
                                           <axis:atr f="axissin014" c="CINFORM" a="modificable=false"/>
                                           value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}"
                                           <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if>></input>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            <axis:visible c="TESTTRA" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TESTTRA" lit="100587"/></b>
                                    <!-- Estado -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TTIPTRA" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TSUBTRA" lit="9000852"/></b>
                                    <!--Subestado -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TUNITRA" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TUNITRA" lit="9000900"/></b>
                                    <!-- Unidad tramitacion -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TTRAMITAD" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TTRAMITAD" lit="9910018"/></b>
                                    <!-- Tramitador -->
                                </td>
                                </axis:visible>
                                <td class="titulocaja">&nbsp;</td>
                            </tr>
                            <tr>
                            <axis:visible c="TESTTRA" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TESTTRA"
                                           value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TESTTRA" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="TSUBTRA" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TSUBTRA"
                                           value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TSUBTRA" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="TUNITRA" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TUNITRA"
                                           value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TUNITRA" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <axis:visible c="TTRAMITAD" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" name="TTRAMITAD"
                                           value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}"
                                           class="campowidthinput campo campotexto"
                                           style="width:90%"
                                           <axis:atr f="axissin014" c="TTRAMITAD" a="modificable=false"/>/>
                                </td>
                                </axis:visible>
                                <td class="campocaja">&nbsp;</td>
                            </tr>
                            <tr>
                            <axis:visible c="TTIPPAG" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TTIPPAG" lit="100565"/></b>
                                    <!-- Tipo -->
                                </td>
                                </axis:visible>
                                <axis:visible c="DESTINATARI" f="axissin014">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axissin014" c="DESTINATARI" lit="9000909"/></b>
                                    <!-- Destinatario -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TCONPAG" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TCONPAG" lit="9001284"/></b>
                                    <!-- Concepto Pago -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TCAUIND" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TCAUIND" lit="9001199"/></b>
                                    <!-- Causa Indemnizacion -->
                                </td>
                                </axis:visible>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                            <axis:visible c="TTIPPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TTIPPAG"
                                           readonly="readonly" name="TTIPPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.PAGO.TTIPPAG}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="DESTINATARI" f="axissin014">
                                <td class="campocaja" colspan="2">
                                    <input type="text" id="DESTINATARI"
                                           readonly="readonly"
                                           name="DESTINATARI"
                                           class="campowidthselect campo campotexto"
                                           style="width:95%;"
                                           value="${__formdata.PAGO.DESTINATARI.PERSONA.SPERSON} - ${__formdata.PAGO.DESTINATARI.PERSONA.TNOMBRE}  ${__formdata.PAGO.DESTINATARI.PERSONA.TAPELLI1} ${__formdata.PAGO.DESTINATARI.PERSONA.TAPELLI2}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="TCONPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TCONPAG"
                                           readonly="readonly" name="TCONPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           title="${__formdata.PAGO.TCONPAG}"
                                           value="${__formdata.PAGO.TCONPAG}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="TCAUIND" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TCAUIND"
                                           readonly="readonly" name="TCAUIND"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.PAGO.TCAUIND}"></input>
                                </td>
                                </axis:visible>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                            <axis:visible c="FORDPAG" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="FORDPAG" lit="9000910"/></b>
                                    <!-- Fecha orden -->
                                </td>
                                </axis:visible>
                                <axis:visible c="NFACREF" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="NFACREF" lit="9001285"/></b>
                                    <!-- Referencia -->
                                </td>
                                </axis:visible>
                                <axis:visible c="FFACREF" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="FFACREF" lit="9000956"/></b>
                                    <!-- data factura -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TFORPAG" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TFORPAG" lit="100712"/></b>
                                    <!-- Forma Pago -->
                                </td>
                                </axis:visible>
                                <axis:visible c="CBANCAR" f="axissin014">
                                <td class="titulocaja">
                                    <c:if test="${__formdata.CFORPAG == 1}">
                                        <b><axis:alt f="axissin014" c="CBANCAR" lit="100965"/></b>
                                        <!-- cta bancaria -->
                                    </c:if>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            <axis:visible c="FORDPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="FORDPAG"
                                           readonly="readonly" name="FORDPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PAGO.FORDPAG}"/>'></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="NFACREF" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="NFACREF"
                                           readonly="readonly" name="NFACREF"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.PAGO.NFACREF}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="FFACREF" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" readonly="readonly"
                                           id="FFACREF" name="FFACREF"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PAGO.FFACREF}"/>'></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="TFORPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TFORPAG"
                                           readonly="readonly" name="TFORPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.PAGO.TFORPAG}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="CBANCAR" f="axissin014">
                                <td class="campocaja">
                                    <c:if test="${__formdata.PAGO.CFORPAG == 1}">
                                        <input type="text" id="CBANCAR"
                                               readonly="readonly"
                                               name="CBANCAR"
                                               class="campowidthselect campo campotexto"
                                               style="width:90%;"
                                               value="<axis:masc f="axissin014" c="CBANCAR" value="${__formdata.PAGO.CBANCAR}" />"></input>
                                    </c:if>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>                            
                            <axis:visible c="TESTVAL" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TESTVAL" lit="9001325"/></b>
                                    <!-- Estado Val. Anterior -->
                                </td>
                                </axis:visible>
                                <axis:visible c="TESTPAG" f="axissin014">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin014" c="TESTPAG" lit="9001327"/></b>
                                    <!-- Estado Pago anterior  -->
                                </td>
                                </axis:visible>
                                   <axis:visible c="TSUBPAG" f="axissin014">
                                <td class="titulocaja">
                                      <b><axis:alt f="axissin014" c="TSUBPAG" lit="9902489"/></b><!-- Estado Pago  -->
                                    <!-- Estado Pago anterior  -->
                                </td>
                                </axis:visible>
                                <td class="titulocaja">&nbsp;</td>
                            </tr>
                            <tr>
                            <axis:visible c="TESTVAL" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TESTVAL"
                                           readonly="readonly" name="TESTVAL"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.ULTMOVPAG.TESTVAL}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="TESTPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TESTPAG"
                                           readonly="readonly" name="TESTPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.ULTMOVPAG.TESTPAG}"></input>
                                </td>
                                </axis:visible>
                                <axis:visible c="TSUBPAG" f="axissin014">
                                <td class="campocaja">
                                    <input type="text" id="TSUBPAG"
                                           readonly="readonly" name="TSUBPAG"
                                           class="campowidthselect campo campotexto"
                                           style="width:90%;"
                                           value="${__formdata.ULTMOVPAG.TSUBPAG}"></input>
                                </td>
                                </axis:visible>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <div class="separador">&nbsp;</div>
                            <table class="seccion">
                    <tr>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                    </tr>
                                <tr>
                                    <td class="campocaja" colspan="5">
                                        <b><axis:alt f="axissin014" c="LIT_RESERVA" lit="9001408"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="5">
                                        <c:set var="title1">
                                            <axis:alt f="axissin014" c="NMOVRES" lit="800440"/>
                                        </c:set>
                                        <!--Nº-->
                                        <c:set var="title2">
                                            <axis:alt f="axissin014" c="TTIPRES" lit="100565"/>
                                        </c:set>
                                        <!--Tipo-->
                                        <c:set var="title3">
                                            <axis:alt f="axissin014" c="TGARANT" lit="110994"/>
                                        </c:set>
                                        <!--Garantia -->
                                        <c:set var="title4">
                                            <axis:alt f="axissin014" c="LIT_FECHA" lit="100562"/>
                                        </c:set>
                                        <!--data-->
                                        <c:set var="title5">
                                            <axis:alt f="axissin014" c="CALCULO" lit="9001023"/>
                                        </c:set>
                                        <!--Calcul -->
                                        <c:set var="title6">
                                            <axis:alt f="axissin014" c="ICOSTE" lit="9001024"/>
                                        </c:set>
                                        <!-- ICost -->
                                        <c:set var="title7">
                                            <axis:alt f="axissin014" c="IRESERVA" lit="9000913"/>
                                        </c:set>
                                        <!-- IRESERVA PDTE. -->
                                        <c:set var="title8">
                                            <axis:alt f="axissin014" c="IPAGO" lit="9000475"/>
                                        </c:set>
                                        <!-- IPagos -->
                                        <c:set var="title9">
                                            <axis:alt f="axissin014" c="IRECOBRO" lit="9001025"/>
                                        </c:set>
                                        <!-- IRecobros -->
                                        <c:set var="title0">
                                            <axis:alt f="axissin014" c="FINIRES" lit="9000526"/>
                                        </c:set>
                                        <!-- F_ini-->
                                        <c:set var="title10">
                                            <axis:alt f="axissin014" c="FFINRES" lit="9000527"/>
                                        </c:set>
                                        <c:set var="title11">
                                            <axis:alt f="axissin014" c="CMONRES" lit="108645"/>
                                        </c:set>
                                        <c:set var="title12">
                                            <axis:alt f="axissin014" c="ITOTRET" lit="9906813"/>
                                        </c:set>
                                        <c:set var="title13">
                                            <axis:alt f="axissin014" c="ITOTIMP" lit="9906301"/>
                                        </c:set>
                                        <c:set var="title30"><axis:alt f="axissin014" c="CSOLIDARIDAD" lit="9910049"/></c:set><!-- Solidaridad -->
	
                                        <!-- F_fin-->
                                        <c:set var="num_tramitacion">0</c:set>
                                        <div class="displayspace">
                                            <%int i = 0;%>
                                          
                                            <display:table name="${__formdata.RESERVAS}"
                                                           id="T_IAX_TRAM_RESERVAS"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="0"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0"
                                                           requestURI="">
                                                <c:set var="i">
                                                    <%=i%>
                                                </c:set>
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=""
                                                                sortable="false"
                                                                sortProperty=""
                                                                headerClass="headwidth5 sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspIcons">
                                                        <input onclick="javascript:f_getReserva(this, '${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPGAS}','${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPGAS}');"
                                                               <c:if test="${__formdata.NMOVRES == T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES && __formdata.CTIPRES == T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}"> checked </c:if>
                                                               value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IVALACTUAL}'/>|${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CGARANT}|${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CTIPRES}|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}'/>|${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES}|<fmt:formatDate pattern='dd/MM/yyyy' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESINI}'/>|<fmt:formatDate pattern='dd/MM/yyyy' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.FRESFIN}'/>|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO}'/>|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO}'/>|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP}'/>|<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET}'/>"
                                                               type="radio"
                                                               id="radioRES"
                                                               name="radioRES"
                                                               <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES == __formdata.NMOVFILA }">checked</c:if>
                                                               <c:if test="${!empty __formdata.isNew  && __formdata.isNew eq 'no'}">disabled</c:if>/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="OB_IAX_SIN_TRAMI_RESERVA.NTRAMIT"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspNumber">
                                                        ${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}
                                                    </div>
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="false"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}<c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPGAS!=null}"> - ${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPGAS}</c:if>
                                                    </div>
                                                </display:column>
                                                
                                                <axis:visible c="CSOLIDARIDAD" f="${formulari}">
                                                <display:column title="${title30}" sortable="false" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons"><a name="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"/>
                                                        <input type="checkbox" id="check_solidaridad_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.NMOVRES}_${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TTIPRES}"  <c:if test="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CSOLIDARIDAD == 1}"> checked </c:if>  value=""  disabled="disabled"  />
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title3}"
                                                                sortable="false"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.TGARANT}
                                                    </div>
                                                </display:column>
                                                    <axis:visible f="axissin014" c="CMONRES"> 
                                                 <display:column title="${title11}"
                                                                sortable="false"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText" title="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES}">
                                                        ${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.CMONRES}
                                                        
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title6}"
                                                                sortable="false"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <fmt:formatNumber  value="${(T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO  + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP) - (T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IINGRESO + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO  + T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET)}"/>
                                                    </div>
                                                </display:column>
                                                <axis:visible f="axissin014" c="ITOTIMP">
                                                    <display:column title="${title13}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTIMP}"/></div>   
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axissin014" c="ITOTRET">
                                                    <display:column title="${title12}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.ITOTRET}"/></div>   
                                                    </display:column>
                                                </axis:visible>
                                                <display:column title="${title7}"
                                                                sortable="false"
                                                                sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRESERVA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRESERVA}"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title8}"
                                                                sortable="false"
                                                                sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IPAGO"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <fmt:formatNumber value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IPAGO}"/>
                                                    </div>
                                                </display:column>
                                                <display:column title="${title9}"
                                                                sortable="false"
                                                                sortProperty="OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_IAX_TRAM_RESERVAS.OB_IAX_SIN_TRAMI_RESERVA.IRECOBRO}"/>
                                                    </div>
                                                </display:column>
                                               
                                                <%i++;%>
                                                <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                             
                                                <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                            </display:table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <axis:visible f="axissin014" c="IVALACTUAL"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="IVALACTUAL" lit="9001318"/></b>
                                    </td> 
                                    </axis:visible> 
                                
                                    <axis:visible f="axissin014" c="FPERINI">
                                    <td class="titulocaja">
                                        <b id="label_FPERINI"><axis:alt f="axissin014" c="FPERINI" lit="9000526"/></b>
                                    </td>
                                    </axis:visible> 
                                    <axis:visible f="axissin014" c="FPERFIN">
                                    <td class="titulocaja">
                                        <b id="label_FPERFIN"><axis:alt f="axissin014" c="FPERFIN" lit="9000527"/></b>
                                    </td>
                                    </axis:visible> 
                                    <%--c:if test="${!empty __formdata.CGARANT}"--%>
                                    <axis:visible f="axissin014" c="CCONPAG">
                                    <td class="titulocaja" id="CCONPAG_TD">
                                        <b><axis:alt f="axissin014" c="CCONPAG" lit="100896"/></b>
                                    </td>
                                    </axis:visible> 
                                  <%--/c:if--%>
                                </tr>
                                <tr>
                                    <td class="campocaja">

                                       <axis:visible f="axissin014" c="IVALACTUAL"> 
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IVALCTUALobj" name="IVALCTUALobj"
                                               size="15" style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IVALCTUALobj}"/>'
                                               readonly="readonly"/>
                                        <input type="hidden"
                                               class="campo campotexto"
                                               id="IVALACTUAL" name="IVALACTUAL"
                                               size="15" style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IVALACTUAL}"/>'
                                               readonly="readonly"/>
                                      </axis:visible>
                                    </td>
                                    
                                    <axis:visible f="axissin014" c="FPERINI"> 
                                    <td class="campocaja">
                                            <input   type="text"  class="campowidthinput campo campotexto" id="FPERINI"  style="width:65%" name="FPERINI"   
                                            <axis:atr f="axissin014" c="FPERINI" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FPERINI}"/>"/>                                    
                                            <a style="vertical-align:middle;"><img id="icon_FPERINI" alt="<axis:alt f="axissin014" c="LIT_FECHA_RECEP" lit="102913"/>" title="<axis:alt f="axissin014" c="LIT_FECHA_RECEP" lit="102913" />" src="images/calendar.gif"/></a>                                    
                                    </td>
                                     </axis:visible> 
                                    <axis:visible f="axissin014" c="FPERFIN"> 
                                    <td class="campocaja">
                                            <input   type="text"  class="campowidthinput campo campotexto" id="FPERFIN"  style="width:65%" name="FPERFIN"  
                                            <axis:atr f="axissin014" c="FPERFIN" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FPERFIN}"/>"/>                                    
                                            <a style="vertical-align:middle;"><img id="icon_FPERFIN" alt="<axis:alt f="axissin014" c="LIT_FECHA_RECEP" lit="102913"/>" title="<axis:alt f="axissin014" c="LIT_FECHA_RECEP" lit="102913" />" src="images/calendar.gif"/></a>                                                                        
                                    </td>
                                    </axis:visible> 
                                    <%--c:if test="${!empty __formdata.CGARANT}"--%>
                                     <axis:visible f="axissin014" c="CCONPAG"> 
                                      <td class="campocaja" id="CCONPAG_TD2">
                                    <select name="CCONPAG" id="CCONPAG" size="1" class="campowidthselect campo campotexto" style="width:90%;">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaConceptos}">
                                                <option value = "${element.CCONPAG}" 
                                                    <c:if test="${element.CCONPAG == __formdata.CCONPAG}"> selected </c:if> />
                                                    ${element.TCONPAG} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                        </td>
                                     </axis:visible>
                                    <%--/c:if--%>
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                            <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>                            
                                <%-- -- Bug 0017970 - 16/03/2011 - JMF ocultar campos --%>
                                <tr>
                                    <axis:ocultar f="axissin014" c="IRCMBRUT" dejarHueco="false">    
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="IRCMBRUT" lit="9001409"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="IREDUCCION" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="IREDUCCION" lit="9001410"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="ISINRET" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="ISINRET" lit="9000939"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="ISINRETPAG" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="ISINRETPAG" lit="9905189"/></b>
                                       </td>
                                    </axis:ocultar>
									

									
									
                                    <axis:ocultar f="axissin014" c="ISUPLID" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="ISUPLID" lit="9001201"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="NLOCALI" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b id="label_NLOCALI"><axis:alt f="axissin014" c="NLOCALI" lit="9002272"/></b>
                                       </td>
                                    </axis:ocultar> 
                                </tr>
								
                              <tr>
                                    <axis:ocultar f="axissin014" c="IRCMBRUT" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text" 
                                               class="campo campotexto" title="<axis:alt f="axissin014" c="IRCMBRUT" lit="9001409"/>"
                                               id="IRESRCM" name="IRESRCM"
                                               size="15" style="width:90%"
                                               onChange ="javascript:f_actualizarImporte(this, 0);"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESRCM}"/>'
                                               />
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="IREDUCCION" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text" 
                                               class="campo campotexto"
                                               id="IRESRED" name="IRESRED" title="<axis:alt f="axissin014" c="IREDUCCION" lit="9001410"/>"
                                               size="15" style="width:90%"
                                               onChange ="javascript:f_actualizarImporte(this, 0);"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESRED}"/>'
                                               />
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="ISINRET" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto_ob"
                                               id="ISINRET" name="ISINRET"
                                               size="15" style="width:80%"
                                               onChange ="javascript:f_actualizarImporte(this, 1);" 
											   onFocus = "javascript:f_focusImporte(this, 1);"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IVALCTUALobj}"/>'/>
                                        &nbsp;<span id="ISINRET_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axissin014" c="ISINRETPAG" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto_ob"
                                               id="ISINRETPAG" name="ISINRETPAG"
                                               size="15" style="width:80%"
                                               onChange ="javascript:f_actualizarImporte(this, 1);"
                                               readonly="true"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PISINRETPAG}"/>'/>
                                        &nbsp;<span id="ISINRETPAG_span"><b>${'COP'}</b></span>
                                       </td>
                                    </axis:ocultar>					
                                    
                                    <axis:ocultar f="axissin014" c="ISUPLID" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto"
                                               id="ISUPLID" name="ISUPLID"
                                               size="15" style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISUPLID}"/>'
                                               />
                                       </td>
                                    </axis:ocultar>   
                                    <axis:visible f="axissin014" c="NLOCALI"> 
                                        <td class="campocaja">
                                            <select name="NLOCALI" id="NLOCALI" size="1" class="campowidthselect campo campotexto" style="width:90%;" onchange="f_recarga_reteica()">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lstlocalizacion}">
                                                    <option value = "${element.NLOCALI}" 
                                                        <c:if test="${element.NLOCALI == __formdata.NLOCALI}"> selected </c:if> />
                                                        ${element.TLOCALI} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                </tr>
                                
								
 <!--                                     Pfeiffer tarea 3481 inicio-->
                                <tr>
                                    <axis:ocultar f="axissin014" c="VALORPESOS" dejarHueco="false"> 
                                       <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="VALORPESOS" lit="9905366"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    </tr>
                                <tr>
                                    <axis:ocultar f="axissin014" c="VALORPESOS" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto_ob"
                                               id="VALORPESOS" name="VALORPESOS"
                                               size="15" style="width:80%"
                                               onChange ="javascript:f_actualizarImporte(this, 1);"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.VALORPESOS}"/>'/>
                                        &nbsp;<span id="VALORPESOS_span"><b>${'COP'}</b></span>
                                       </td>
                                    </axis:ocultar> 

                                    <axis:ocultar f="axissin014" c="PVALORCONVERTIDO" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="hidden"
                                               class="campo campotexto_ob"
                                               id="PVALORCONVERTIDO" name="PVALORCONVERTIDO"
                                               size="15" style="width:80%"
                                               readonly="true"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PVALORCONVERTIDO}"/>'/>
                                       
                                       </td>
                                    </axis:ocultar>

                                </tr>
<!--                                     Pfeiffer tarea 3481 fim -->
								
								
                                 <tr>
                                 <td class="titulocaja">&nbsp;</td>
                                 <td class="titulocaja">&nbsp;</td>
                                 <axis:visible f="axissin014" c="IFRANQ">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="IFRANQ" lit="9001215"/></b>
                                    </td>
                                 </axis:visible>
                                 </tr>
                                 
                                 <tr>
                                 <td class="campocaja">&nbsp;</td>
                                 <td class="campocaja">&nbsp;</td>
                                 <axis:visible f="axissin014" c="IFRANQ"> 
                                    <td class="campocaja">
                                        
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IFRANQnomodif"
                                               name="IFRANQnomodif" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQ}"/>'
											   <%-- INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY --%>
											   <%-- readonly="readonly" --%>
											   onChange ="javascript:f_actualizarImporte(this, 1);"
											   <axis:atr f="axissin014" c="IFRANQ" a="modificable=false"/> 
											   <%-- FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY --%>
											   />											   
                                        <input type="hidden" id="IFRANQ"
                                               name="IFRANQ"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQ}"/>'
											   <%-- INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY --%>
											   onChange ="javascript:f_actualizarImporte(this, 1);"
											   <axis:atr f="axissin014" c="IFRANQ" a="modificable=false"/> 
											   <%-- FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY --%>
											   />
                                        &nbsp;<span id="IFRANQ_span"><b>${__formdata.CMONRES}</b></span>                                        
                                    </td>
                                </axis:visible> 
                                 
                                 </tr>
                                 <!-- Inicio AABC IAXIS_14205 Bug cambios en titulos y orden de campos -->
                                
                                 <tr>
                                    <axis:ocultar f="axissin014" c="IMPORTE" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="IMPORTE" lit="9900777"/></b> 
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="PRETENC_SAP" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="PRETENC_SAP" lit="9001319"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="IRETENC" dejarHueco="false"> 
                                        <td class="titulocaja">
                                        <b><axis:alt f="axissin014" c="IRETENC" lit="9001030"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axissin014" c="IMPORTE" dejarHueco="false"> 
                                       <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="IMPORTE" name="IMPORTE"
                                               size="15" style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMPORTE}"/>'
                                               readonly="readonly"/>
                                       </td>
                                    </axis:ocultar>
                                    <axis:visible f="axissin014" c="PRETENC"> 
                                       <td class="campocaja" id="td_PRETENC">
                                         <input type="text"
                                               class="campo campotexto" id="PRETENC"
                                               name="PRETENC" size="15" onChange = "f_actualizarImporte(this, 0);"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PRETENC}"/>'/> 
                                       </td>
                                    </axis:visible>
                                    <axis:visible f="axissin014" c="PRETENC_SAP"> 
                                        <td class="campocaja" id="td_PRETENC_SAP">
                                            <select name="PRETENC_SAP" id="PRETENC_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);"
                                                    title="<axis:alt f="axissin014" c="PRETENC_SAP" lit="9001319"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="e_pretenc" items="${__formdata.lstPRETENC}">
                                                    <option value = "${e_pretenc.PORCENT}|${e_pretenc.CTIPIND}" 
                                                        <c:if test="${e_pretenc.CTIPIND == __formdata.PRETENC_CTIPIND}"> selected </c:if> />
                                                        ${e_pretenc.TINDICA} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:ocultar f="axissin014" c="IRETENC" dejarHueco="false"> 
                                       <td class="campocaja" >
                                       <input type="text"
                                               class="campo campotexto"
                                               id="IRETENC" name="IRETENC"
                                             size="15" style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETENC}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="IRETENC_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                       <td class="campocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>          
                                    
                                </tr>
                                
                                <!-- LIT IVA GENERAL -->
                                <tr>
                                    
                                    <axis:ocultar f="axissin014" c="PIVA_SAP" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td><!-- in -->
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="PIVA_SAP" lit="9001320"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="IIVA" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="IIVA" lit="9001321"/></b>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                                <!-- CAMPOS IVA GENERAL -->
                                <tr>
                              
                                   <axis:ocultar f="axissin014" c="PIVA" dejarHueco="false"> 
                                        <td class="titulocaja">&nbsp;</td><!-- in -->
                                       <td class="campocaja" id="td_PIVA">
                                       <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto" id="PIVA"
                                               name="PIVA" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PIVA}"/>'/>                                                 
                                       </td>
                                   </axis:ocultar>
                                   
                                   <axis:visible f="axissin014" c="PIVA_SAP"> 
                                        <td class="titulocaja">&nbsp;</td>
                                        <td class="campocaja" id="td_PIVA_SAP">
                                            <select name="PIVA_SAP" id="PIVA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);"
                                                    title="<axis:alt f="axissin014" c="PIVA_SAP" lit="9001320"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="e_piva" items="${__formdata.lstPIVA}">
                                                    <option value = "${e_piva.PORCENT}|${e_piva.CTIPIND}" 
                                                        <c:if test="${e_piva.CTIPIND == __formdata.PIVA_CTIPIND}"> selected </c:if> />
                                                        ${e_piva.TINDICA} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                   <axis:ocultar f="axissin014" c="IIVA" dejarHueco="false">          
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IIVA"
                                               name="IIVA" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IIVA}"/>'
                                               readonly="readonly"/> 
                                        &nbsp;<span id="IIVA_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                       <td class="campocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>      
                                    
                                   
                                </tr>
                                
                                
                                
                                
                                <!-- LIT IVA GENERAL -->
                                <tr style="display:none">
                                   
                                    <axis:ocultar f="axissin014" c="PICA" dejarHueco="false"> 
                                     <td class="titulocaja">&nbsp;</td> <!-- in -->
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="PICA" lit="9902714"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="IICA" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b><axis:alt f="axissin014" c="IICA" lit="9902715"/></b>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                                <!-- CAMPOS ICA GENERAL -->
                                <tr style="display:none">
                                   
                                   <axis:ocultar f="axissin014" c="PICA" dejarHueco="false"> 
                                   <td class="titulocaja">&nbsp;</td> <!-- in -->
                                       <td class="campocaja">
                                       <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto" id="PICA"
                                               name="PICA" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PICA}"/>'/>                                                 
                                       </td>
                                   </axis:ocultar>
                                   
                                   <axis:ocultar f="axissin014" c="IICA" dejarHueco="false">          
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IICA"
                                               name="IICA" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IICA}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>      
                                    
                                   
                                </tr>
                                
                                
                                
                                
                                
                                
                                
                                <!-- *************************************************  -->
                                <!-- ****************** LIT RETE IVA *****************  -->
                                <!-- *************************************************  -->
                                <tr>
                                    
                                    <axis:ocultar f="axissin014" c="PRETEIVA_SAP" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td><!-- in -->
                                       <td class="titulocaja">
                                       <b id="label_PRTEIVA"><axis:alt f="axissin014" c="PRETEIVA_SAP" lit="9902695"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="IRETEIVA" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b id="label_IRETEIVA"><axis:alt f="axissin014" c="IRETEIVA" lit="9902698"/></b>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                                
                                <tr>
                                   
                                   <axis:ocultar f="axissin014" c="PRETEIVA" dejarHueco="false"> 
                                   <td class="titulocaja">&nbsp;</td><!-- in -->
                                       <td class="campocaja" id="td_PRETEIVA">
                                       <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto" id="PRETEIVA"
                                               name="PRETEIVA" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PRETEIVA}"/>'/>                                                 
                                       </td>
                                   </axis:ocultar>
                                   
                                   <axis:visible f="axissin014" c="PRETEIVA_SAP"> 
                                        <td class="titulocaja">&nbsp;</td><!-- in -->
                                        <td class="campocaja" id="td_PRETEIVA_SAP">
                                            <select name="PRETEIVA_SAP" id="PRETEIVA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);"
                                                    title="<axis:alt f="axissin014" c="PRETEIVA_SAP" lit="9902695"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="e_reteiva" items="${__formdata.lstPRETEIVA}">
                                                    <option value = "${e_reteiva.PORCENT}|${e_reteiva.CTIPIND}" 
                                                        <c:if test="${e_reteiva.CTIPIND == __formdata.PRETEIVA_CTIPIND}"> selected </c:if> />
                                                        ${e_reteiva.TINDICA} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                   <axis:ocultar f="axissin014" c="IRETEIVA" dejarHueco="false">          
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IRETEIVA"
                                               name="IRETEIVA" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEIVA}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="IRETEIVA_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                        <td class="campocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>      
                                   
                                    
                                </tr>
                                
                                <!-- **************************************************  -->
                                <!-- ****************** LIT RETE ICA ******************  -->
                                <!-- *************************************************  -->
                                <tr>
                                    
                                    <axis:ocultar f="axissin014" c="PRETEICA_SAP" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td> <!-- in -->
                                       <td class="titulocaja">
                                       <b id="label_PRTEICA"><axis:alt f="axissin014" c="PRETEICA_SAP" lit="9902696"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="IRETEICA" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b id="label_IRETEICA"><axis:alt f="axissin014" c="IRETEICA" lit="9902697"/></b>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                                
                                <tr>
                                   
                                   <axis:ocultar f="axissin014" c="PRETEICA" dejarHueco="false"> 
                                   <td class="campocaja">&nbsp;</td> <!-- in -->
                                       <td class="campocaja" id="td_PRETEICA">
                                       <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto" id="PRETEICA"
                                               name="PRETEICA" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PRETEICA}"/>'/>                                                 
                                       </td>
                                   </axis:ocultar>
                                   
                                   <axis:visible f="axissin014" c="PRETEICA_SAP"> 
                                        <td class="campocaja">&nbsp;</td> <!-- in -->
                                        <td class="campocaja" id="td_PRETEICA_SAP">
                                            <select name="PRETEICA_SAP" id="PRETEICA_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);"
                                                    title="<axis:alt f="axissin014" c="PRETEICA_SAP" lit="9902696"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="e_reteica" items="${__formdata.lstPRETEICA}">
                                                    <option value = "${e_reteica.PORCENT}|${e_reteica.CTIPIND}" 
                                                        <c:if test="${e_reteica.CTIPIND == __formdata.PRETEICA_CTIPIND}"> selected </c:if> />
                                                        ${e_reteica.TINDICA} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                   <axis:ocultar f="axissin014" c="IRETEICA" dejarHueco="false">          
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IRETEICA"
                                               name="IRETEICA" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEICA}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="IRETEICA_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                       <td class="campocaja">&nbsp;</td> <!-- in -->
                                    </axis:ocultar>      
                                    
                               
                                </tr>
                                
                                <tr>
                                    <td class="titulocaja">&nbsp;</td>
                                    
                                    <axis:ocultar f="axissin014" c="IOTROSGAS" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td>
                                       <td class="titulocaja">
                                       <b id="label_IOTROSGAS"><axis:alt f="axissin014" c="IOTROSGAS" lit="9909357"/></b>
                                       </td>
                                    </axis:ocultar>                                    
                                </tr>
                                
                                 <tr>
                                    <td class="campocaja">&nbsp;</td><!-- in -->
                                        
                                   <axis:ocultar f="axissin014" c="IOTROSGAS" dejarHueco="false"> 
                                   <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja" id="td_IOTROSGAS">
                                       <input type="text" onChange = "f_actualizarImporte(this, 1);"
                                               class="campo campotexto" id="IOTROSGAS"
                                               name="IOTROSGAS" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.IOTROSGAS}"/>'/>
                                        &nbsp;<span id="IOTROSGAS_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                   </axis:ocultar>                               
                                </tr>
                                
                                <tr>
                                    <td class="titulocaja">&nbsp;</td>
                                    
                                    <axis:ocultar f="axissin014" c="IBASEIPOC" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td>
                                       <td class="titulocaja">
                                       <b id="label_IBASEIPOC"><axis:alt f="axissin014" c="IBASEIPOC" lit="9909358"/></b>
                                       </td>
                                    </axis:ocultar>                                    
                                </tr>
                                
                                 <tr>
                                   <td class="campocaja">&nbsp;</td><!-- in -->
                                        
                                   <axis:ocultar f="axissin014" c="IBASEIPOC" dejarHueco="false"> 
                                       <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja" id="td_IBASEIPOC">
                                       <input type="text" onChange = "f_actualizarImporte(this, 1);"
                                               class="campo campotexto" id="IBASEIPOC"
                                               name="IBASEIPOC" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.IBASEIPOC}"/>'/>
                                        &nbsp;<span id="IBASEIPOC_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                   </axis:ocultar>                               
                                </tr>
                                
                                <tr>
                                    <axis:ocultar f="axissin014" c="PIPOCONSUMO_SAP" dejarHueco="false"> 
                                    <td class="titulocaja">&nbsp;</td>
                                       <td class="titulocaja">
                                       <b id="label_PIPOCONSUMO"><axis:alt f="axissin014" c="PIPOCONSUMO_SAP" lit="9909359"/></b>
                                       </td>
                                    </axis:ocultar> 
                                    
                                    <axis:ocultar f="axissin014" c="IIPOCONSUMO" dejarHueco="false"> 
                                       <td class="titulocaja">
                                       <b id="label_IIPOCONSUMO"><axis:alt f="axissin014" c="IIPOCONSUMO" lit="9909360"/></b>
                                       </td>
                                    </axis:ocultar>                                    
                                </tr>
                                
                                 <tr>
                                    <axis:ocultar f="axissin014" c="PIPOCONSUMO" dejarHueco="false"> 
                                    <td class="campocaja">&nbsp;</td> <!-- in -->
                                       <td class="campocaja" id="td_PIPOCONSUMO">
                                       <input type="text" onChange = "f_actualizarImporte(this, 0);"
                                               class="campo campotexto" id="PIPOCONSUMO"
                                               name="PIPOCONSUMO" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="###,##0.00" value="${__formdata.PIPOCONSUMO}"/>'/>                                                 
                                       </td>
                                    </axis:ocultar>
                                   
                                    <axis:visible f="axissin014" c="PIPOCONSUMO_SAP"> 
                                        <td class="campocaja">&nbsp;</td> <!-- in -->
                                        <td class="campocaja" id="td_PIPOCONSUMO_SAP">
                                            <select name="PIPOCONSUMO_SAP" id="PIPOCONSUMO_SAP" size="1" class="campowidthselect campo campotexto" style="width:90%;" onChange="javascript:f_actualizarImporte(this, 0);"
                                                    title="<axis:alt f="axissin014" c="PIPOCONSUMO_SAP" lit="9909359"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin014" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="e_reteipoconsumo" items="${__formdata.lstPIPOCONSUMO}">
                                                    <option value = "${e_reteipoconsumo.PORCENT}|${e_reteipoconsumo.CTIPIND}" 
                                                        <c:if test="${e_reteipoconsumo.CTIPIND == __formdata.PIPOCONSUMO_CTIPIND}"> selected </c:if> />
                                                        ${e_reteipoconsumo.TINDICA} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:ocultar f="axissin014" c="IIPOCONSUMO" dejarHueco="false">          
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IIPOCONSUMO"
                                               name="IIPOCONSUMO" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PIIPOCONSUMO}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="IIPOCONSUMO_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                       <td class="campocaja">&nbsp;</td> <!-- in -->
                                    </axis:ocultar>                                 
                                                   
                                </tr>
                                <!-- Inicio AABC IAXIS_14205 Bug cambios en titulos y orden de campos -->
                                 
                                
                                <!-- ******************************************************  -->
                                <!-- ******************** IVA Moneda Pago ****************** -->
                                <!-- *******************************************************  -->
                                <tr>
                                   
                                    <axis:ocultar f="axissin014" c="IRETEIVAPAG" dejarHueco="false"> 
                                    
                                        <td class="titulocaja">&nbsp;</td><!-- in -->
                                        <td class="titulocaja">&nbsp;</td><!-- in -->
                                    
                                       <td class="titulocaja">
                                       <b id="label_IRETEIVAPAG"><axis:alt f="axissin014" c="IRETEIVAPAG" lit="9902700"/></b>
                                       </td>
                                       <td class="titulocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>
                                    
                                </tr>
                                
                                <tr>
                                   
                                   <axis:ocultar f="axissin014" c="IRETEIVAPAG" dejarHueco="false">        
                                   
                                      <td class="campocaja">&nbsp;</td><!-- in -->
                                      <td class="campocaja">&nbsp;</td><!-- in -->
                                   
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IRETEIVAPAG"
                                               name="IRETEIVAPAG" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEIVAPAG}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td><!-- in -->
                                    </axis:ocultar>      
                                    
                              
                                </tr>
                                
                                <!-- ******************************************************* -->
                                <!-- ******************** ICA Moneda Pago ****************** -->
                                <!-- ******************************************************* -->
                                <tr>
                                    
                                    <axis:ocultar f="axissin014" c="IRETEICAPAG" dejarHueco="false"> 
                                                                      
                                    <td class="titulocaja">&nbsp;</td>
                                    <td class="titulocaja">&nbsp;</td>
                                    
                                    
                                       <td class="titulocaja">
                                       <b id="label_IRETEICAPAG"><axis:alt f="axissin014" c="IRETEICAPAG" lit="9902701"/></b>
                                       </td>
                                       
                                      <td class="titulocaja">&nbsp;</td>  
                                    </axis:ocultar>
                                   
                                </tr>
                                
                                <tr>
                                  
                                   <axis:ocultar f="axissin014" c="IRETEICAPAG" dejarHueco="false">  
                                   
                                       <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja">&nbsp;</td>
                                   
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="IRETEICAPAG"
                                               name="IRETEICAPAG" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETEICAPAG}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>      
                                   
                              
                                </tr>
                                
                                
                                <tr>                                    
                                    <axis:ocultar f="axissin014" c="PIOTROSGASPAG" dejarHueco="false">                                                                       
                                    <td class="titulocaja">&nbsp;</td>
                                    <td class="titulocaja">&nbsp;</td>                                    
                                    
                                       <td class="titulocaja">
                                       <b id="label_PIOTROSGASPAG"><axis:alt f="axissin014" c="PIOTROSGASPAG" lit="9909367"/></b>
                                       </td>
                                       
                                      <td class="titulocaja">&nbsp;</td>  
                                    </axis:ocultar>                                   
                                </tr>
                                
                                <tr>                                  
                                   <axis:ocultar f="axissin014" c="PIOTROSGASPAG" dejarHueco="false">                                     
                                       <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja">&nbsp;</td>                                   
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="PIOTROSGASPAG"
                                               name="PIOTROSGASPAG" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PIOTROSGASPAG}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>                              
                                </tr>
                                
                                <tr>                                    
                                    <axis:ocultar f="axissin014" c="PIBASEIPOCPAG" dejarHueco="false">                                                                       
                                    <td class="titulocaja">&nbsp;</td>
                                    <td class="titulocaja">&nbsp;</td>                                    
                                    
                                       <td class="titulocaja">
                                       <b id="label_PIBASEIPOCPAG"><axis:alt f="axissin014" c="PIBASEIPOCPAG" lit="9909368"/></b>
                                       </td>
                                       
                                      <td class="titulocaja">&nbsp;</td>  
                                    </axis:ocultar>                                   
                                </tr>
                                
                                <tr>                                  
                                   <axis:ocultar f="axissin014" c="PIBASEIPOCPAG" dejarHueco="false">                                     
                                       <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja">&nbsp;</td>                                   
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="PIBASEIPOCPAG"
                                               name="PIBASEIPOCPAG" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PIBASEIPOCPAG}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>                              
                                </tr>
                                
                                <tr>                                    
                                    <axis:ocultar f="axissin014" c="PIIPOCONSUMOPAG" dejarHueco="false">                                                                       
                                    <td class="titulocaja">&nbsp;</td>
                                    <td class="titulocaja">&nbsp;</td>                                    
                                    
                                       <td class="titulocaja">
                                       <b id="label_PIIPOCONSUMOPAG"><axis:alt f="axissin014" c="PIIPOCONSUMOPAG" lit="9909369"/></b>
                                       </td>
                                       
                                      <td class="titulocaja">&nbsp;</td>  
                                    </axis:ocultar>                                   
                                </tr>
                                
                                <tr>                                  
                                   <axis:ocultar f="axissin014" c="PIIPOCONSUMOPAG" dejarHueco="false">                                     
                                       <td class="campocaja">&nbsp;</td>
                                       <td class="campocaja">&nbsp;</td>                                   
                                      <td class="campocaja">
                                         <input type="text"
                                               class="campo campotexto" id="PIIPOCONSUMOPAG"
                                               name="PIIPOCONSUMOPAG" size="15"
                                               style="width:90%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PIIPOCONSUMOPAG}"/>'
                                               readonly="readonly"/>    
                                       </td>
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>                              
                                </tr>
                                

                                <tr>
                                    <%-- -- Bug 0017970 - 16/03/2011 - JMF ocultar campos --%>
                                    <axis:ocultar f="axissin014" c="INETA_CCOL1" dejarHueco="false"> 
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="INETA_CCOL2" dejarHueco="false"> 
                                       <td class="campocaja">&nbsp;</td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="INETA" dejarHueco="false"> 
                                       <td class="campocaja">
                                       <b><axis:alt f="axissin014" c="INETA" lit="9000474"/></b>
                                       </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axissin014" c="INETAPAG" dejarHueco="false"> 
                                       <td class="campocaja">
                                       <b><axis:alt f="axissin014" c="INETAPAG" lit="89906183"/></b>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                   <%-- -- Bug 0017970 - 16/03/2011 - JMF ocultar campos --%>
                                   <axis:ocultar f="axissin014" c="INETA_VCOL1" dejarHueco="false"> 
                                       <td class="campocaja">&nbsp;</td>
                                   </axis:ocultar>
                                   <axis:ocultar f="axissin014" c="INETA_VCOL2" dejarHueco="false"> 
                                      <td class="campocaja">&nbsp;</td>
                                   </axis:ocultar>
                                   <axis:ocultar f="axissin014" c="INETA" dejarHueco="false"> 
                                      <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="INETA" name="INETA" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.INETA}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="INETA_span"><b>${__formdata.CMONRES}</b></span>
                                       </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axissin014" c="INETAPAG" dejarHueco="false"> 
                                      <td class="campocaja">
                                        <input type="text"
                                               class="campo campotexto"
                                               id="INETAPAG" name="INETAPAG" size="15"
                                               style="width:80%"
                                               value='<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.PINETAPAG}"/>'
                                               readonly="readonly"/>
                                        &nbsp;<span id="INETAPAG_span"><b>${'COP'}</b></span>
                                       </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                        </table>
                    </td>
                </tr>
            </table> 
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axissin014</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>
<c:import url="../include/mensajes.jsp"/>
<script type="text/javascript">
            Calendar.setup({
                inputField     :    "FPERINI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FPERINI", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FPERFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FPERFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>   
</body>
<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
        <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin014');
        </script>                   
    </c:if>
</html>
