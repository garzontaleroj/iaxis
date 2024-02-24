<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title></title>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css"></link>
<c:import url="../include/carga_framework_js.jsp" />
<%-- Inicio Sólo si vamos a tener un campo fecha--%>
<!--********** CALENDARIO ************************* -->
<!-- Hoja de estilo del Calendario -->
<link rel="stylesheet" type="text/css" media="all"
	href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en función del Locale -->
<script type="text/javascript"
	src="scripts/calendar-${sessionScope.__locale}.js"></script>
<!-- Setup del calendario -->
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->
<%-- fin Sólo si vamos a tener un campo fecha--%>
<script type="text/javascript">
          /****************************************************************************************/
          /*********************************** NAVEGACION *****************************************/

          /****************************************************************************************/
          function f_onload() {
              
              <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> 
    		Calendar.setup({
    			inputField : "FELABORACION",
    			ifFormat : "%d/%m/%Y",
    			button : "icon_FELABORACION",
    			singleClick : true,
    			firstDay : 1
    		});
    		</c:if>
			  f_ocultar_pagare();
              f_cargar_propiedades_pantalla();
          }
		  
		  function f_ocultar_pagare (){
        	  
        	  objDom.setDisplayPorId("datos_recibo_children","none");
    		  objDom.setDisplayPorId("datos_recibo_children2","none");
    		  objDom.setDisplayPorId("datos_recibo_children3","none");
    		  objDom.setDisplayPorId("datos_recibo_children4","none");
          }
		  
		  function f_formatear(thiss){
        	
            thiss.value = (objNumero.formateaNumeroCero(thiss.value, true)).split(",")[0];
         }
		  
         /* IAXIS 3602 Shubendu Informe Tecnico*/
         function f_redireccionaFoco(){
            document.getElementById("botoCFitxer").focus();                          
        }
          
          function f_but_cancelar() {
                parent.f_cerrar_modal_064('axissin064');
          }
          
          function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
          }
          
          function f_pago(NTRAMIT){                    
           objAjax.invokeAsyncCGI("modal_axissin064.do", callbackAjaxCargarPasgos, "operation=ajax_busqueda_pagos&TRAMITE=" + NTRAMIT + "&NSINIES_AUX=" + document.miForm.RECLAMO.value, this, objJsMessages.jslit_cargando);                                            
        }      
        /* IAXIS 3602 Shubendu Informe Tecnico*/        
        function callbackAjaxCargarPasgos (ajaxResponseText){
        
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc, false)){
                    var elementos = doc.getElementsByTagName("SIDEPAG");
                    var NPAGOCombo = document.miForm.NPAGO;     
                    objDom.borrarOpcionesDeCombo(NPAGOCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin064" c="SELECCIONAR" lit="108341" /> - ', NPAGOCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SIDEPAG = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SIDEPAG"), i, 0);
                            var TDESTINATARIO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDESTINATARIO"), i, 0);                                     
                            objDom.addOpcionACombo(SIDEPAG, TDESTINATARIO, NPAGOCombo, i+1);
                        }                       
                }
  
        }  
        
        function f_but_aceptar() { 
                if (objValidador.validaEntrada()){
			var url = "modal_axissin064.do?operation=descargar&DOCUMENTO="
					+ document.miForm.DOCUMENTO.value + "&RECLAMO="
					+ document.miForm.RECLAMO.value + "&TRAMITAC="
					+ document.miForm.TRAMITAC.value + "&NPAGO="
					+ document.miForm.NPAGO.value + "&SSEGURO="
					+ document.miForm.SSEGURO.value + "&NIT="
					+ document.miForm.NIT.value+"&SUMA="
					+document.miForm.SUMA.value+ "&CONCEPTO="
					+document.miForm.CONCEPTO.value 					
					+"&VALPAGARE="+document.miForm.VALPAGARE.value
					+"&RESOLUCION="+document.miForm.RESOLUCION.value
					+"&DATERESOLU="+document.miForm.DATERESOLU.value
					+"&VALINTERES="+document.miForm.VALINTERES.value
					+"&PORCEQUIVALE="+document.miForm.PORCEQUIVALE.value
					+"&DATEOBLIGA="+document.miForm.DATEOBLIGA.value
					+"&VALCUOTA="+document.miForm.VALCUOTA.value
					+"&NUMCUOTAS="+document.miForm.NUMCUOTAS.value
					+"&PORCINTERES="+document.miForm.PORCINTERES.value
					+"&VALXCUOTA="+document.miForm.VALXCUOTA.value
					+"&DATEFIRSTPAGO="+document.miForm.DATEFIRSTPAGO.value
					+"&CTIPCC="+document.miForm.CTIPCC.value
					+"&CBANCO="+document.miForm.CBANCO.value
					+"&CCUENTA="+document.miForm.CCUENTA.value
					+"&REFDOS="+document.miForm.REFDOS.value
					+"&DATEACUERDOPAGO="+document.miForm.DATEACUERDOPAGO.value
					+"&CIUDADACUERDO="+document.miForm.CIUDADACUERDO.value
					+"&CORREO1="+document.miForm.CORREO1.value
					+"&CORREO2="+document.miForm.CORREO2.value;
			objAjax.invokeAsyncCGI_JSON(url, callbackAceptar,
					"<axis:alt f='axissin064' c='MSG_CARGAR' lit='9905686'/>")
                }   
        } 
		
		function changuetipodoc(tipo){
    	  if(tipo==="76"){
    		  objDom.setDisplayPorId("datos_recibo_children","block");
    		  objDom.setDisplayPorId("datos_recibo_children2","block");
    		  objDom.setDisplayPorId("datos_recibo_children3","block");
    		  objDom.setDisplayPorId("datos_recibo_children4","block");
    	  }else{
    		  f_ocultar_pagare();
    	  }
    	  f_cargar_propiedades_pantalla();
    	                    
    
       }
	   
	    var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
		
		var nav = window.Event ? true : false;
		function ValidNumComa(evt) {
		    	var key = nav ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57)|| key==44);
		}
		
		
		 function f_formatear2(thiss){
			  debugger;
	        	if((thiss.value).indexOf(",")==-1 ){
	        		thiss.value = (objNumero.formateaNumeroCero(thiss.value, true)).split(",")[0];
	        	}else{
	        		thiss.value = ((objNumero.formateaNumeroCero(thiss.value.split(",")[0], true)).split(",")[0])+","+thiss.value.split(",")[1];
	        	}
	            
	         }
            
        function callbackAceptar (p) {
           
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             //hay que actualizar la lista de resulotados xxx
            var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
            var div_OBFICHEROcontenido="";
            div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
               if (p.JSON2.LIST_FICHEROS.OFICHERO!=null) { 
                 

                 
                  var ficherolist = p.JSON2.LIST_FICHEROS.OFICHERO;
                           
                         var str2 = ficherolist.replace(/barrainvertida/gi, "\\");    
                         console.log(ficherolist);
                         console.log(str2);
                         objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2);

           
                } 
           }
        </script>
</head>
<body onload="f_onload()">

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisimprimir|<axis:alt
				f="axissin064" c="TITULO_IMPR" lit="1000205" />|true</c:param>
	</c:import>
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" id="operation" name="operation" value="" /> <input
			type="hidden" name="TIPODOC" id="TIPODOC"
			value="${__formdata.TIPODOC}" /> <input type="hidden" name="SSEGURO"
			id="SSEGURO" value="${__formdata.SSEGURO}" />
		<c:import url="../include/titulo_nt.jsp">
			<c:param name="formulario">
				<axis:alt c="form" f=" axissin064" lit="9001247" />
			</c:param>
			<c:param name="form">axissin064</c:param>
		</c:import>
		<div class="separador">&nbsp;</div>
		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<div class="titulo">
						<div style="float: left;">
							<img src="images/flecha.gif" />
							<axis:alt c="form" f="TITULO" lit="9909803" />
						</div>
					</div>
					<table class="seccion">
						<tr>
							<td>
								<table class="area" align="center">
									<tr>
										<th style="width: 80%; height: 0%;" />
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="DOCUMENTO" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axissin064"
														c="DOCUMENTO" lit="9909805" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="DOCUMENTO" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><select name="DOCUMENTO"
												id="DOCUMENTO" style="width: 95%;"
												onchange="changuetipodoc(this.value)" size="1"
												title="<axis:alt f="axissin064" c="DOCUMENTO" lit="9909805"/>"
												<axis:atr f="axissin064" c="DOCUMENTO" a="modificable=true&isInputText=false"/>
												class="campowidthselect campo campotexto">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt c="COMBO_SNV" f="axissin064" lit="108341" /> -
													</option>
													<c:forEach var="documentos" items="${listaDocument}">
														<option value="${documentos.CTIPO}">
															${documentos.TATRIBU}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="RECLAMO" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axissin064"
														c="RECLAMO" lit="9909219" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="RECLAMO" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><input type="text"
												class="campo campotexto"
												<axis:atr f="axissin064" c="RECLAMO" a="modificable=false"/>
												style="width: 25%;" value="${__formdata.NSINIES_AUX}"
												name="RECLAMO" id="RECLAMO"
												title="<axis:alt f="axisagd004" c="RECLAMO" lit="9909219"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr>

									<!-- INICIO MODIFICACION RAFAEL BORDUCHI 3-06-2019 -->

									<tr>
										<axis:ocultar f="axissin064" c="NIT" dejarHueco="false">
											<td id="td_NIT" class="titulocaja"><b><axis:alt
														f="axissin064" c="NIT" lit="9905773" /></b></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="NIT" dejarHueco="false">
											<td class="campocaja"><input type="text"
												class="campo campotexto" style="width: 25%;"
												value="${__formdata.NIT}" name="NIT" id="NIT"
												title="<axis:alt f="axissin064" c="NIT" lit="9905773"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr>


									<!--Contragarantia - Pagare acuerdo de pago Recobros-->

									<!--DOCUMENTO SECCION1-->


									<tr>
										<td>
											<table class="seccion" align="center"
												id="datos_recibo_children">
												<tr>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALPAGARE"
														dejarHueco="false">
														<td id="td_VALPAGARE" class="titulocaja"><b><axis:alt
																	f="axissin064" c="VALPAGARE" lit="89907001" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALPAGARE"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNumComa(event);"
															onChange="javascript:f_formatear2(this);"
															style="width: 55%;"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.VALPAGARE}"/>"
															name="VALPAGARE" id="VALPAGARE"
															title="<axis:alt f="axissin064" c="VALPAGARE" lit="89907001"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="RESOLUCION"
														dejarHueco="false">
														<td id="td_RESOLUCION" class="titulocaja"><b><axis:alt
																	f="axissin064" c="RESOLUCION" lit="9903489" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="RESOLUCION"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto" style="width: 55%;"
															value="${__formdata.RESOLUCION}" name="RESOLUCION"
															id="RESOLUCION"
															title="<axis:alt f="axissin064" c="RESOLUCION" lit="9903489"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>


												<tr>
													<axis:ocultar c="DATERESOLU" f="axissin064"
														dejarHueco="false">
														<td id="td_DATERESOLU" class="titulocaja"><b><axis:alt
																	f="axissin064" c="DATERESOLU" lit="89907002" /></b></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar c="DATERESOLU" f="axissin064"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campowidthinput campo campotexto" size="15"
															value="<fmt:formatDate value='${__formdata.DATERESOLU}' pattern='dd/MM/yyyy'/>"
															name="DATERESOLU" id="DATERESOLU" style="width: 55%"
															<axis:atr f="axissin064" c="DATERESOLU" a="formato=fecha"/>
															title="<fmt:message key="89907002"/>" /><a
															id="icon_DATERESOLU" style="vertical-align: middle;"><img
																alt="<fmt:message key="108341"/>"
																title="<fmt:message key="89907002" />"
																src="images/calendar.gif" /></a></td>
													</axis:ocultar>
												</tr>
											</table>

										</td>
									</tr>

									<!--DOCUMENTO SECCION2-->
									<tr>
										<td>
											<div class="separador">&nbsp;</div>
										</td>
									</tr>
									<tr>
										<td>
											<table class="seccion" align="center"
												id="datos_recibo_children2">
												<tr>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALINTERES"
														dejarHueco="false">
														<td id="td_VALINTERES" class="titulocaja"><b><axis:alt
																	f="axissin064" c="VALINTERES" lit="89907003" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALINTERES"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNumComa(event);"
															onChange="javascript:f_formatear2(this);"
															style="width: 55%;"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.VALINTERES}"/>"
															name="VALINTERES" id="VALINTERES"
															title="<axis:alt f="axissin064" c="VALINTERES" lit="89907003"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="PORCEQUIVALE"
														dejarHueco="false">
														<td id="td_PORCEQUIVALE" class="titulocaja"><b><axis:alt
																	f="axissin064" c="PORCEQUIVALE" lit="89907004" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="PORCEQUIVALE"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNum(event);" style="width: 55%;"
															value="${__formdata.PORCEQUIVALE}" name="PORCEQUIVALE"
															id="PORCEQUIVALE"
															title="<axis:alt f="axissin064" c="PORCEQUIVALE" lit="89907004"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>


												<tr>
													<axis:ocultar c="DATEOBLIGA" f="axissin064"
														dejarHueco="false">
														<td id="td_DATEOBLIGA" class="titulocaja"><b><axis:alt
																	f="axissin064" c="DATEOBLIGA" lit="89907005" /></b></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar c="DATEOBLIGA" f="axissin064"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campowidthinput campo campotexto" size="15"
															value="<fmt:formatDate value='${__formdata.DATEOBLIGA}' pattern='dd/MM/yyyy'/>"
															name="DATEOBLIGA" id="DATEOBLIGA" style="width: 55%"
															<axis:atr f="axissin064" c="DATEOBLIGA" a="formato=fecha"/>
															title="<fmt:message key="89907005"/>" /><a
															id="icon_DATEOBLIGA" style="vertical-align: middle;"><img
																alt="<fmt:message key="108341"/>"
																title="<fmt:message key="89907005" />"
																src="images/calendar.gif" /></a></td>
													</axis:ocultar>
												</tr>
											</table>

										</td>
									</tr>

									<div class="separador">&nbsp;</div>


									<!--DOCUMENTO SECCION3-->
									<tr>
										<td>
											<div class="separador">&nbsp;</div>
										</td>
									</tr>

									<tr>
										<td>
											<table class="seccion" align="center"
												id="datos_recibo_children3">
												<tr>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 35%; height: 0px"></th>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALCUOTA"
														dejarHueco="false">
														<td id="td_VALCUOTA" class="titulocaja"><b><axis:alt
																	f="axissin064" c="VALCUOTA" lit="89907006" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALCUOTA"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNumComa(event);"
															onChange="javascript:f_formatear2(this);"
															style="width: 55%;"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.VALCUOTA}"/>"
															name="VALCUOTA" id="VALCUOTA"
															title="<axis:alt f="axissin064" c="VALCUOTA" lit="89907006"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="NUMCUOTAS"
														dejarHueco="false">
														<td id="td_NUMCUOTAS" class="titulocaja"><b><axis:alt
																	f="axissin064" c="NUMCUOTAS" lit="89907007" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="NUMCUOTAS"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNum(event);" style="width: 55%;"
															value="${__formdata.NUMCUOTAS}" name="NUMCUOTAS"
															id="NUMCUOTAS"
															title="<axis:alt f="axissin064" c="NUMCUOTAS" lit="89907007"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="PORCINTERES"
														dejarHueco="false">
														<td id="td_PORCINTERES" class="titulocaja"><b><axis:alt
																	f="axissin064" c="PORCINTERES" lit="89907008" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="PORCINTERES"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNum(event);" style="width: 55%;"
															value="${__formdata.PORCINTERES}" name="PORCINTERES"
															id="PORCINTERES"
															title="<axis:alt f="axissin064" c="PORCINTERES" lit="89907008"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>


												<tr>
													<axis:ocultar f="axissin064" c="VALXCUOTA"
														dejarHueco="false">
														<td id="td_VALXCUOTA" class="titulocaja"><b><axis:alt
																	f="axissin064" c="VALXCUOTA" lit="89907009" /></b></td>
													</axis:ocultar>
												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="VALXCUOTA"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															onkeypress="return ValidNumComa(event);"
															onChange="javascript:f_formatear2(this);"
															style="width: 55%;"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.VALXCUOTA}"/>"
															name="VALXCUOTA" id="VALXCUOTA"
															title="<axis:alt f="axissin064" c="VALXCUOTA" lit="89907009"/>"
															size="15" /></td>
													</axis:ocultar>
												</tr>


												<tr>
													<axis:ocultar c="DATEFIRSTPAGO" f="axissin064"
														dejarHueco="false">
														<td id="td_DATEFIRSTPAGO" class="titulocaja"><b><axis:alt
																	f="axissin064" c="DATEFIRSTPAGO" lit="89907010" /></b></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar c="DATEFIRSTPAGO" f="axissin064"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campowidthinput campo campotexto" size="15"
															value="<fmt:formatDate value='${__formdata.DATEFIRSTPAGO}' pattern='dd/MM/yyyy'/>"
															name="DATEFIRSTPAGO" id="DATEFIRSTPAGO"
															style="width: 55%"
															<axis:atr f="axissin064" c="DATEFIRSTPAGO" a="formato=fecha"/>
															title="<fmt:message key="89907010"/>" /><a
															id="icon_DATEFIRSTPAGO" style="vertical-align: middle;"><img
																alt="<fmt:message key="108341"/>"
																title="<fmt:message key="89907010" />"
																src="images/calendar.gif" /></a></td>
													</axis:ocultar>
												</tr>
											</table>

										</td>
									</tr>

									<div class="separador">&nbsp;</div>

									<!--DOCUMENTO CUENTAS BANCARIAS-->
									<tr>
										<td>
											<div class="separador">&nbsp;</div>
										</td>
									</tr>

									<tr>
										<td>
											<table class="seccion" align="center"
												id="datos_recibo_children4">
												<tr>
													<th style="width: 20%; height: 0px"></th>
													<th style="width: 20%; height: 0px"></th>
													<th style="width: 20%; height: 0px"></th>
													<th style="width: 20%; height: 0px"></th>
												</tr>
												<tr>


													<axis:ocultar f="axisper014" c="CTIPCC" dejarHueco="false">
														<td id="td_CTIPCC" class="titulocaja"><b><axis:alt
																	f="axissin064" c="CTIPCC" lit="1000374" /></b></td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="CBANCO" dejarHueco="false">
														<td id="td_CBANCO" class="titulocaja"><b><axis:alt
																	f="axissin064" c="CBANCO" lit="9000964" /></b> <!-- *** Banco *** -->
														</td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="CCUENTA" dejarHueco="false">
														<td id="td_CCUENTA" class="titulocaja" colspan="1">
															<b><axis:alt f="axissin064" c="CCUENTA" lit="100965" /></b>
															<!-- *** Cuenta Bancaria *** -->
														</td>
													</axis:ocultar>
												</tr>
												<tr>


													<axis:visible f="axissin064" c="CTIPCC">
														<td class="campocaja"><select name="CTIPCC"
															id="CTIPCC" size="1"
															class="campowidthselect campo campotexto"
															style="width: 99%;"
															title="<axis:alt f="axissin064" c="CTIPCC_LIT" lit="1000374"/>"
															<axis:atr f="axissin064" c="CTIPCC"/>
															<c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
																<option value="<%= Integer.MIN_VALUE %>">-
																	<axis:alt f="axissin064" c="CTIPCC_ALT2" lit="1000348" />
																	-
																</option>
																<c:forEach var="element"
																	items="${__formdata.listValores.tipBCC_cuentas}">
																	<option value="${element.CATRIBU}"
																		<c:if test="${element.CATRIBU == __formdata.CTIPCC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
																</c:forEach>
														</select></td>
													</axis:visible>


													<axis:ocultar f="axissin064" c="CBANCO" dejarHueco="false">
														<td class="campocaja"><select name="CBANCO"
															id="CBANCO" <axis:atr f="axissin064" c="CBANCO"/>
															title="<axis:alt f="axissin064" c="CBANCO_ALT1" lit="9000964"/>"
															size="1" class="campowidthselect campo campotexto"
															style="width: 99%;"
															<c:if test="${ __formdata.MODO == 'MODIF'}">disabled</c:if>>&nbsp;
																<option value="<%= Integer.MIN_VALUE %>">-
																	<axis:alt f="axissin064" c="SNV_COMBO_CBANCO"
																		lit="1000348" /> -
																</option>
																<c:forEach var="element"
																	items="${__formdata.listValores.tipBANCO}">
																	<option value="${element.CBANCO}"
																		<c:if test="${element.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                                ${element.TBANCO} 
                                            </option>
																</c:forEach>
														</select></td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="CCUENTA" dejarHueco="false">
														<td class="campocaja" colspan="2"><input type="text"
															<axis:atr f="axissin064" c="CCUENTA"/>
															title="<axis:alt f="axissin064" c="CCUENTA_ALT" lit="100965"/>"
															onkeypress="return ValidNum(event);"
															class="campowidthinput campo campotexto" maxlength="20"
															size="15" value="${__formdata.CCUENTA}" name="CCUENTA"
															id="CCUENTA" style="width: 99%;" /></td>
													</axis:ocultar>
												</tr>

												<tr>
												<tr>
													<axis:ocultar f="axisper014" c="REFUNO" dejarHueco="false">
														<td id="td_REFUNO" class="titulocaja"><b><axis:alt
																	f="axissin064" c="REFUNO" lit="9001285" /></b></td>
													</axis:ocultar>

													<axis:ocultar f="axisper014" c="REFDOS" dejarHueco="false">
														<td id="td_REFDOS" class="titulocaja"><b><axis:alt
																	f="axissin064" c="REFDOS" lit="89907011" /></b></td>
													</axis:ocultar>

												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="REFUNO" dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															<axis:atr f="axissin064" c="REFUNO" a="modificable=false"/>
															style="width: 99%;" value="${__formdata.NSINIES_AUX}"
															name="REFUNO" id="REFUNO"
															title="<axis:alt f="axisagd004" c="REFUNO" lit="9001285"/>"
															size="15" /></td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="REFDOS" dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															<axis:atr f="axissin064" c="REFDOS"/> style="width: 99%;"
															value="${__formdata.REFDOS}" name="REFDOS" id="REFDOS"
															title="<axis:alt f="axisagd004" c="REFDOS" lit="89907011"/>"
															size="15" /></td>
													</axis:ocultar>


												</tr>


												<tr>
													<axis:ocultar f="axisper014" c="DATEACUERDOPAGO"
														dejarHueco="false">
														<td id="td_DATEACUERDOPAGO" class="titulocaja"><b><axis:alt
																	f="axissin064" c="DATEACUERDOPAGO" lit="89907013" /></b></td>
													</axis:ocultar>

													<axis:ocultar f="axisper014" c="CIUDADACUERDO"
														dejarHueco="false">
														<td id="td_CIUDADACUERDO" class="titulocaja"><b><axis:alt
																	f="axissin064" c="CIUDADACUERDO" lit="89907014" /></b></td>
													</axis:ocultar>

												</tr>

												<tr>

													<axis:ocultar c="DATEACUERDOPAGO" f="axissin064"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campowidthinput campo campotexto" size="15"
															value="<fmt:formatDate value='${__formdata.DATEACUERDOPAGO}' pattern='dd/MM/yyyy'/>"
															name="DATEACUERDOPAGO" id="DATEACUERDOPAGO"
															style="width: 92%"
															<axis:atr f="axissin064" c="DATEFIRSTPAGO" a="formato=fecha"/>
															title="<fmt:message key="89907013"/>" /><a
															id="icon_DATEACUERDOPAGO" style="vertical-align: middle;"><img
																alt="<fmt:message key="108341"/>"
																title="<fmt:message key="89907013" />"
																src="images/calendar.gif" /></a></td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="CIUDADACUERDO"
														dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															<axis:atr f="axissin064" c="CIUDADACUERDO"/>
															style="width: 99%;" value="${__formdata.CIUDADACUERDO}"
															name="CIUDADACUERDO" id="CIUDADACUERDO"
															title="<axis:alt f="axisagd004" c="CIUDADACUERDO" lit="89907014"/>"
															size="15" /></td>
													</axis:ocultar>

												</tr>


												<tr>
													<axis:ocultar f="axisper014" c="CORREO1" dejarHueco="false">
														<td id="td_CORREO1" class="titulocaja"><b><axis:alt
																	f="axissin064" c="CORREO1" lit="89907015" /></b></td>
													</axis:ocultar>

													<axis:ocultar f="axisper014" c="CORREO2" dejarHueco="false">
														<td id="td_CORREO2" class="titulocaja"><b><axis:alt
																	f="axissin064" c="CORREO2" lit="89907016" /></b></td>
													</axis:ocultar>

												</tr>

												<tr>
													<axis:ocultar f="axissin064" c="CORREO1" dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															<axis:atr f="axissin064" c="CORREO1"/>
															style="width: 99%;" value="${__formdata.CORREO1}"
															name="CORREO1" id="CORREO1"
															title="<axis:alt f="axisagd004" c="CORREO1" lit="89907015"/>"
															size="15" /></td>
													</axis:ocultar>

													<axis:ocultar f="axissin064" c="CORREO2" dejarHueco="false">
														<td class="campocaja"><input type="text"
															class="campo campotexto"
															<axis:atr f="axissin064" c="REFDOS"/> style="width: 99%;"
															value="${__formdata.CORREO2}" name="CORREO2" id="CORREO2"
															title="<axis:alt f="axisagd004" c="CORREO2" lit="89907016"/>"
															size="15" /></td>
													</axis:ocultar>


												</tr>


											</table>
										</td>
									</tr>

									<!-- FIN Contragarantia - Pagare acuerdo de pago Recobros-->



									<tr>
										<axis:ocultar f="axissin064" c="SUMA" dejarHueco="false">
											<td id="td_SUMA" class="titulocaja"><b><axis:alt
														f="axissin064" c="SUMA" lit="101159" /></b></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="SUMA" dejarHueco="false">
											<td class="campocaja"><input type="text"
												class="campo campotexto" style="width: 25%;"
												value="${__formdata.SUMA}" name="SUMA" id="SUMA"
												title="<axis:alt f="axissin064" c="SUMA" lit="101159"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="CONCEPTO" dejarHueco="false">
											<td id="td_CONCEPTO" class="titulocaja"><b><axis:alt
														f="axissin064" c="CONCEPTO" lit="100896" /></b></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="CONCEPTO" dejarHueco="false">

											<td class="campocaja" colspan="4"><textarea rows="4"
													class="campo campotexto" style="width: 95%;"
													name="CONCEPTO" id="CONCEPTO"
													<axis:atr f="axissin064" c="CONCEPTO" a="modificable=true"/>>${__formdata.CONCEPTO}</textarea>
											</td>




										</axis:ocultar>
									</tr>

									<!-- FIN MODIFICACION RAFAEL BORDUCHI 3-06-2019 -->




									<tr>
										<axis:ocultar f="axissin064" c="TRAMITAC" dejarHueco="false">
											<td id="td_TRAMITAC" class="titulocaja"><b><axis:alt
														f="axissin064" c="TRAMITAC" lit="9000908" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="TRAMITAC" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><select name="TRAMITAC"
												id="TRAMITAC" style="width: 25%;"
												onchange="f_pago(this.value)" size="1"
												title="<axis:alt f="axissin064" c="TRAMITAC" lit="9000908"/>"
												<axis:atr f="axissin064" c="TRAMITAC" a="modificable=true&isInputText=false"/>
												class="campowidthselect campo campotexto">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt c="COMBO_SNV" f="axissin064" lit="108341" /> -
													</option>
													<c:forEach var="tramite" items="${listaTramit}">
														<option value="${tramite.NTRAMIT}">
															${tramite.TTIPTRA}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axissin064" c="NPAGO" dejarHueco="false">
											<td id="td_NPAGO" class="titulocaja"><b><axis:alt
														f="axissin064" c="NPAGO" lit="9001909" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="NPAGO" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><select name="NPAGO" id="NPAGO"
												style="width: 25%;" size="1"
												title="<axis:alt f="axissin064" c="NPAGO" lit="9001909"/>"
												<axis:atr f="axissin064" c="NPAGO" a="modificable=true&isInputText=false"/>
												class="campowidthselect campo campotexto">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt c="COMBO_SNV" f="axissin064" lit="108341" /> -
													</option>
													<c:forEach var="pagos" items="${listaPagos}">
														<option value="${pagos.SIDEPAG}">
															${pagos.TDESTINATARIO}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
									</tr>
									<!-- for Detalles del plazo:  Text Field (Newly asked by BA to add this)  ID = DEPLAZO , TD_DEPLAZO ,  C = DEPLAZO -->
									<%-- <tr>
										<axis:ocultar f="axissin064" c="DEPLAZO" dejarHueco="false">
											<td id="td_DEPLAZO" class="titulocaja"><b><axis:alt
														f="axissin064" c="DEPLAZO" lit="89906258" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="DEPLAZO" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><input type="text"
												class="campo campotexto"
												<axis:atr f="axissin064" c="DEPLAZO" a="modificable=true"/>
												style="width: 25%;" value=" " name="DEPLAZO" id="DEPLAZO"
												title="<axis:alt f="axisagd004" c="DEPLAZO" lit="89906258"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr>
									<!-- Interventor   : Text Field ID = interventor , TD_interventor ,  C = interventor
                                         -->
									<tr>
										<axis:ocultar f="axissin064" c="Interventor"
											dejarHueco="false">
											<td id="td_Interventor" class="titulocaja"><b><axis:alt
														f="axissin064" c="Interventor" lit="89906259" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="Interventor"
											dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><input type="text"
												class="campo campotexto"
												<axis:atr f="axissin064" c="Interventor" />
												style="width: 25%;" value=" " name="Interventor"
												id="Interventor"
												title="<axis:alt f="axissin064" c="Interventor" lit="89906259"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr>
									<!-- Supervisor   : Text Area ID = Supervisor , TD_Supervisor ,  C = Supervisor -->
									<tr>
										<axis:ocultar f="axissin064" c="Supervisor" dejarHueco="false">
											<td id="td_Supervisor" class="titulocaja"><b><axis:alt
														f="axissin064" c="Supervisor" lit="89906260" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="Supervisor" dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja">
												<input type="textarea"
												class="campo campotexto"
												<axis:atr f="axissin064" c="Supervisor"/>
												style="width: 25%;" value=" " name="Supervisor"
												id="Supervisor"
												title="<axis:alt f="axissin064" c="Supervisor" lit="89906260"/>"
												size="15" /> <textarea rows="2"
													class="campo campotexto"
													<axis:atr f="axissin064" c="Supervisor"/>
													style="width: 80%;" name="Supervisor" id="Supervisor"
													title="<axis:alt f="axissin064" c="Supervisor" lit="89906260"/>"></textarea>
                                                </td>
                                            </axis:ocultar> 
                                        </tr>
									<!-- Fecha Elaboracion -->
									<tr>
										<axis:ocultar f="axissin064" c="FELABORACION"
											dejarHueco="false">
											<td id="td_FELABORACION" class="titulocaja"><b><axis:alt
														f="axissin064" c="FELABORACION" lit="89906262" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="FELABORACION"
											dejarHueco="false">
											<td><span class="bold"><axis:alt f="axisper047"
												c="FELABORACION" lit="9909578"></axis:alt></span><br /> <jsp:useBean id="today" class="java.util.Date" />  <input
										type="text" name="FELABORACION" id="FELABORACION" size="15"     style= "width: 20%;"
										class="campo campotexto"
										value="<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>"
										title="<axis:alt f='axissin064' c='FELABORACION' lit='9909578'/>"
										alt="<axis:alt f='axissin064' c='FELABORACION' lit='9909578'/>"
										<axis:atr f="axissin064" c="FELABORACION" a="formato=fecha&modificable=true&obligatorio=true"/> />
										<a style="vertical-align: middle;"> <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">
												<img id="icon_FELABORACION"
													alt="<axis:alt f="axissin064" c="FELABORACION" lit="9909578"/>"
													title="<axis:alt f="axissin064" c="FELABORACION" lit="9909578" />"
													src="images/calendar.gif" />
											</c:if>
									</a></td>
										</axis:ocultar>
									</tr>
									<!-- Fuente de Información -->
									<tr>
										<axis:ocultar f="axissin064" c="FUENTEDEINFO"
											dejarHueco="false">
											<td id="td_FUENTEDEINFO" class="titulocaja"><b><axis:alt
														f="axissin064" c="FUENTEDEINFO" lit="89906263" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar f="axissin064" c="FUENTEDEINFO"
											dejarHueco="false">
											<!-- TODO C -->
											<td class="campocaja"><input type="text"
												class="campo campotexto"
												<axis:atr f="axissin064" c="FUENTEDEINFO" />
												style="width: 25%;" value=" " name="FUENTEDEINFO"
												id="FUENTEDEINFO"
												title="<axis:alt f="axissin064" c="FUENTEDEINFO" lit="89906263"/>"
												size="15" /></td>
										</axis:ocultar>
									</tr> --%>
								</table>
							</td>
						</tr>
					</table> <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->
				</td>
			</tr>
		</table>
		<div class="separador">&nbsp;</div>
	</form>

	<c:import url="../include/botonera_nt.jsp">
		<c:param name="f">axissin064</c:param>
		<c:param name="f">axissin064</c:param>
		<c:param name="f">axissin064</c:param>
		<c:param name="__botones">cancelar<axis:visible c="BT_ACEPTAR" f="axissin064">,aceptar</axis:visible></c:param>
	</c:import>

	<script type="text/javascript">
        Calendar.setup({
            inputField     :    "DATERESOLU",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_DATERESOLU", 
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "DATEOBLIGA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_DATEOBLIGA", 
            singleClick    :    true,
            firstDay       :    1
        });       
        Calendar.setup({
            inputField     :    "DATEFIRSTPAGO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_DATEFIRSTPAGO", 
            singleClick    :    true,
            firstDay       :    1
        });  
        Calendar.setup({
            inputField     :    "DATEACUERDOPAGO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_DATEACUERDOPAGO", 
            singleClick    :    true,
            firstDay       :    1
        });  
        
        
     </script>
</body>
</html>
