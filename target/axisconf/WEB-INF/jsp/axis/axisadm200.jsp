
<%
	/* Revision:# cg6wHR2vZv6cgcAomfE/Ug== # */
%>
<%
	/*
	 *  Fichero: axiadm200.jsp
	 *  Fecha: 26/06/2019
	 */
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
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

<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/
	
	function f_onload() 
	{
		f_cargar_propiedades_pantalla();
		document.miForm.CINTERF.focus();		
		
		if($("#CINTERF").val()=='l003' || $("#CINTERF").val()=='I031')
		{
			$("#tr_NUM_PAGO_T").show();
			$("#tr_NUM_PAGO_I").show();	
			$("#tr_BUSCAR_PERSONA_T").hide();
			$("#tr_BUSCAR_PERSONA_I").hide();
		}
		else
		{
			$("#tr_BUSCAR_PERSONA_T").show();
			$("#tr_BUSCAR_PERSONA_I").show();		
			$("#tr_NUM_PAGO_T").hide();
			$("#tr_NUM_PAGO_I").hide();
		}		
	}

	function f_but_salir() 
	{
		objUtiles.ejecutarFormulario("flujodetrabajo.do", "cancelar", document.miForm, "_self");
	}
	
	function f_but_9904040()
	{
		objUtiles.ejecutarFormulario("axis_axisadm200.do", "limpiar", document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	
	 function formateoFecha2(fecha1){
			
         var entrada =   fecha1.substring(3,5) + "/" +fecha1.substring(0, 2) + "/" + fecha1.substring(6, 10);
         return entrada;
     }

	function f_but_100797() 
	{				
		var isValid = false;
		if (objValidador.validaEntrada()) 
		{	
			if($("#FINICIO").val()== "" && $("#FFIN").val() == "")
			{
				alert("Su búsqueda ha retornado un resultado con muchos registros. Utilice el filtro para limitar el número.");	
				isValid = true;
			}	
			else if (($("#FINICIO").val() == "" || $("#FINICIO").val() == null) ||
				($("#FFIN").val() == "" || $("#FFIN").val() == null))
			{										
				alert("FECHA INICIO Y FECHA FIN OBLIGATORIO.");
				isValid = true;
			} 
			if($("#FINICIO").val() != "" && $("#FFIN").val() != "" )
			{											
				var sDate = formateoFecha2($("#FINICIO").val());
				var eDate = formateoFecha2($("#FFIN").val());

				if(new Date(sDate) > new Date(eDate))
				{					
					alert("FECHA INICIO DEBE SER MENOR A FECHA FIN.");
						isValid = true;
				}					
			}
			
			if(isValid == false)
			{
				objUtiles.ejecutarFormulario("axis_axisadm200.do", "buscarSolicitud", document.miForm, "_self",
				"<axis:alt f='axisadm200' c='buscarSolicitud' lit='89906336' />");
			}				
		}
	}

	function f_actualizarImporte(cinterf) 
	{				
		if($("#CINTERF").val()=='l003' || $("#CINTERF").val()=='I031')
		{
			$("#tr_NUM_PAGO_T").show();
			$("#tr_NUM_PAGO_I").show();	
			$("#tr_BUSCAR_PERSONA_T").hide();
			$("#tr_BUSCAR_PERSONA_I").hide();
		}
		else
		{
			$("#tr_BUSCAR_PERSONA_T").show();
			$("#tr_BUSCAR_PERSONA_I").show();		
			$("#tr_NUM_PAGO_T").hide();
			$("#tr_NUM_PAGO_I").hide();
		}		
		objUtiles.ejecutarFormulario("axis_axisadm200.do", "reajustarParaCinterf", document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	
	function f_actualizer_pago(value) 
	{
		var reg = /^\d+$/;
		if (value.match(reg))
			return true;
		else
			return false;
	}

	function isNumberKey(event) {
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (!(charCode > 31 && ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105))))
			event.preventDefault();
	}
		
	function verEntradaSalida(sinterf, estado,cinterf,testado) 
	{
		if (objUtiles.estaVacio(sinterf))
            alert (objJsMessages.jslit_error_de_seleccion);
        else 
        {        	
			objDom.setValorPorId("SINTERF", sinterf);
			objDom.setValorPorId("SELECTED_ESTADO", estado);
			objDom.setValorPorId("CINTERF", cinterf);			
			objDom.setValorPorId("TESTADO_CONVI", testado);
			f_abrir_axisadm201();
        }
	}
	function f_abrir_axisadm201() {
		objUtiles.abrirModal("axisadm200", "src",
				"modal_axisadm201.do?operation=form&CMODO=CONSULTA");
	}
	
	function f_cerrar_axisadm201() {
		objUtiles.cerrarModal("axisadm200");
		objDom.setValorPorId("TESTADO_CONVI", null);
	}
	
	function reintentarServicio(sinterf, estado, cinterf, testado) {
		if (objUtiles.estaVacio(sinterf))
            alert (objJsMessages.jslit_error_de_seleccion);
        else if (confirm("Reintentar para Sinterf Id " + sinterf)) 
        {        		
        	objDom.setValorPorId("SINTERF", sinterf);
			objDom.setValorPorId("SELECTED_ESTADO", estado);
			objDom.setValorPorId("CINTERF", cinterf);			
			objDom.setValorPorId("TESTADO_CONVI", testado);
			objUtiles.ejecutarFormulario("axis_axisadm200.do", "reintentarEntrada", document.miForm, "_self",
				"<axis:alt f='axisadm200' c='buscarSolicitud' lit='89906336' />");
        } else
        	console.log("Do nothing...");
	}
		
	/****************************************************************************************/
	/********************************** MODAL AXISPER008 **************************************/
	/****************************************************************************************/
	function f_abrir_axisper008() {
		objUtiles.abrirModal("axisper008", "src",
				"modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008&CMODO=CONSULTA");
	}

	function f_cerrar_axisper008() {
		objUtiles.cerrarModal("axisper008");
		if (objUtiles.estaVacio(document.miForm.SPERSON.value)) {
			f_but_salir();
		}
	}

	function f_aceptar_mtn_axisper008(selectedPerson, selectedAgente) {
		objUtiles.cerrarModal("axisper008");
		if (!objUtiles.estaVacio(selectedPerson)) {
			var qs = "operation=ajax_documentos";
			qs = qs + "&selectedPerson=" + selectedPerson + "&selectedAgente="
					+ selectedAgente;
			var origen = 'selectedPerson';
			objAjax.invokeAsyncCGI("axis_axisadm200.do", callbackajaxagencia,
					qs, this, null, origen);
		}
	}

	function callbackajaxagencia(ajaxResponseText, origen) {
		try {
			var doc = objAjax.domParse(ajaxResponseText);
			if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				var persona = doc.getElementsByTagName("OBPERSONA")[0];
				var nombre = "";
				var TNOMBRE1 = " ";
				var TNOMBRE2 = " ";
				var TAPELLI1 = " ";
				var TAPELLI2 = " ";

				var NNUMIDE = objDom.getValorNodoDelComponente(persona.getElementsByTagName("NNUMIDE"), 0, 0);
				var CTIPPER = objDom.getValorNodoDelComponente(persona.getElementsByTagName("CTIPPER"), 0, 0);				
				
				if (CTIPPER == 1) 
				{										
					if (objUtiles.hayValorElementoXml(persona.getElementsByTagName("TNOMBRE1")[0])) 
					{
						TNOMBRE1 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TNOMBRE1"), 0, 0);						
					}									
				    if(objUtiles.hayValorElementoXml(persona.getElementsByTagName("TNOMBRE2")[0]))
				    {
						TNOMBRE2 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TNOMBRE2"), 0, 0);
					}										
					if (objUtiles.hayValorElementoXml(persona.getElementsByTagName("TAPELLI1")[0])) 
					{
						TAPELLI1 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TAPELLI1"), 0, 0);
					}
					if (objUtiles.hayValorElementoXml(persona.getElementsByTagName("TAPELLI2")[0])) 
					{
						TAPELLI2 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TAPELLI2"), 0, 0);
					}

					nombre = TNOMBRE1.replace(/^\s+|\s+$/gm, '') + " "
							+ TNOMBRE2.replace(/^\s+|\s+$/gm, '') + " "
							+ TAPELLI1.replace(/^\s+|\s+$/gm, '') + " "
							+ TAPELLI2.replace(/^\s+|\s+$/gm, '');										
				}
				else 
				{
					TAPELLI1 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TAPELLI1"), 0, 0);
					nombre = TAPELLI1;
				}

				var SPERSON_AGENCIA = objDom.getValorNodoDelComponente(persona.getElementsByTagName("SPERSON"), 0, 0);

				document.getElementById("NOMBRE_AGENCIA").value = nombre;
				document.getElementById("NNUMIDE_AGENCIA").value = NNUMIDE;
				document.getElementById("SPERSON_AGENCIA").value = SPERSON_AGENCIA;

			}
		} 
		catch (e) 
		{
			if (isDebugAjaxEnabled == "true")
				alert(e.name + " " + e.message);
		}
	}
</script>
</head>
<body onload="f_onload()">

	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> 
		<input type="hidden" name="SINTERF" id="SINTERF" value="${__formdata.SINTERF}" />
		<input type="hidden" name="TESTADO_CONVI" id="TESTADO_CONVI" />
		<input type="hidden" name="SELECTED_ESTADO" id="SELECTED_ESTADO" />

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="${fname}" c="TITULO" lit="89906322" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="${fname}" c="TITULO" lit="89906322" />
			</c:param>
			<c:param name="form">axisadm200</c:param>
		</c:import>
		<!-- axisper008 -->
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper008|<axis:alt
					f="axisadm200" c="MODAL_AXISADM200" lit="1000065" />
			</c:param>
		</c:import>
			
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisadm200" c="TITULO" lit="89906335" />
			</c:param>
			<c:param name="nid" value="axisadm200" />
		</c:import>

		<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table class="seccion">
						<tr>
							<td align="left">
								<table class="area" align="center">
									<tr>
										<!-- Tipo de servicio -->
										<axis:visible f="axisadm200" c="CINTERF">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="CINTERF" lit="9908839" /></b></td>
										</axis:visible>
										<!-- Estado -->
										<axis:visible f="axisadm200" c="ESTADO_200">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="ESTADO_200" lit="9905523" /></b></td>
										</axis:visible>
									</tr>

									<tr>
										<!-- Tipo de servicio -->
										<axis:visible f="axisadm200" c="CINTERF">
											<td class="campocaja" id="td_CINTERF"><select
												name="CINTERF" id="CINTERF" size="1"
												class="campowidthselect campo campotexto"
												onChange="javascript:f_actualizarImporte(this.value);"
												style="width: 50%;"
												<axis:atr f="axisadm200" c="CINTERF" a="obligatorio=true"/>
												title="<axis:alt f="axisadm200" c="CINTERF" lit="9908839"/>">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisadm200" c="LIT_SELEC" lit="1000348" /> -
													</option>
													<c:forEach var="element"
														items="${__formdata.listaServicios}">
														<option value="${element.CINTERF}"
															<c:if test="${element.CINTERF == __formdata.CINTERF}"> selected </c:if> >
															${element.NOMBRE}
														</option>
													</c:forEach>
											</select></td>
										</axis:visible>
										<!-- Estado -->
										<axis:visible f="axisadm200" c="ESTADO_200">
											<td class="campocaja" id="td_ESTADO_200"><select
												name="ESTADO_200" id="ESTADO_200" size="1"
												class="campowidthselect campo campotexto"
												style="width: 50%;"
												<axis:atr f="axisadm200" c="ESTADO_200" a="modificable=true"/>
												title="<axis:alt f="axisadm200" c="ESTADO_200" lit="9905523"/>">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisadm200" c="LIT_SELEC" lit="1000348" /> -
													</option>
													<c:forEach var="element" items="${__formdata.listaEstados}">
														<option value="${element.ESTADO}"
															<c:if test="${element.ESTADO == __formdata.ESTADO_200}"> selected </c:if> >
															${element.TESTADO}
														</option>
													</c:forEach>
											</select></td>
										</axis:visible>
									</tr>

									<tr id="tr_NUM_PAGO_T">
										<axis:visible f="axisadm200" c="NUM_PAGO">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="NUM_PAGO" lit="9001909" /></b></td>
										</axis:visible>
									</tr>

									<tr id="tr_NUM_PAGO_I">
										<axis:visible f="axisadm200" c="NUM_PAGO">
											<td class="campocaja"><input type="text" name="NUM_PAGO"
												title="<axis:alt f="axisadm200" c="NUM_PAGO" lit="9001909" />"
												id="NUM_PAGO" value="${__formdata.NUM_PAGO}"
												onkeypress="javascript:isNumberKey(event)"
												onchange="f_actualizer_pago(this.value)"
												class="campowidthinput campo campotexto" style="width: 50%"												
												<axis:atr f="axisadm200" c="NUM_PAGO" a="modificable=true"/> />
											</td>
											<td class="campocaja">
											</td>
										</axis:visible>
									</tr>


									<tr id="tr_BUSCAR_PERSONA_T">
										<axis:visible f="axisadm200" c="NNUMIDE_AGENCIA">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="NNUMIDE_AGENCIA" lit="9907781" /></b> <img id="find"
												border="0" src="images/find.gif"
												onclick="f_abrir_axisper008()" style="cursor: pointer" /></td>
										</axis:visible>
									</tr>

									<tr id="tr_BUSCAR_PERSONA_I">
										<!-- NNUMIDE -->
										<axis:ocultar f="axisadm200" c="NNUMIDE_AGENCIA"
											dejarHueco="false">
											<td class="campocaja"><input type="text"
												name="NNUMIDE_AGENCIA" id="NNUMIDE_AGENCIA"
												value="${__formdata.NNUMIDE_AGENCIA}"
												class="campowidthinput campo campotexto"
												<axis:atr f="axisadm200" c="NNUMIDE_AGENCIA" a="modificable=false"/> />
											</td>
										</axis:ocultar>
										<!-- NOMBRE -->
										<axis:ocultar f="axisadm200" c="NOMBRE_AGENCIA"
											dejarHueco="false">
											<td class="campocaja"><input type="text"
												name="NOMBRE_AGENCIA" id="NOMBRE_AGENCIA"
												value="${__formdata.NOMBRE_AGENCIA}"
												class="campowidthinput campo campotexto"
												<axis:atr f="axisadm200" c="NOMBRE_AGENCIA" a="modificable=false"/> />
											</td>
										</axis:ocultar>
									</tr>

									<tr>
										<!-- Fecha inicio -->
										<axis:visible f="axisadm200" c="FINICIO">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="FINICIO" lit="9000526" /></b></td>
										</axis:visible>
										<!-- Fecha fin -->
										<axis:visible f="axisadm200" c="FFIN">
											<td class="titulocaja"><b> <axis:alt f="axisadm200"
														c="FFIN" lit="9000527" /></b></td>
										</axis:visible>
									</tr>

									<tr>
										<!-- Fecha inicio -->
										<axis:ocultar c="FINICIO" f="axisadm200" dejarHueco="false">
											<td class="campocaja" id="TD_FINICIO"><input type="text"
												class="campo campotexto campowidthinput" id="FINICIO"
												name="FINICIO"												
												<axis:atr f="axisadm200" c="FINICIO" 
	                                            a="modificable=true&obligatorio=false&formato=fecha"/>
												size="15" style="width: 80px" maxlength="10"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}" />" />
												<a id="icon_FINICIO" style="vertical-align: middle;"> <img
													alt="<axis:alt f="axisadm200" c="LIT_108341" lit="108341"/>"
													title="<axis:alt f="axisadm200" c="LIT_100883" lit="100883" />"
													src="images/calendar.gif" />
											</a></td>
										</axis:ocultar>
										<!-- Fecha fin -->
										<axis:ocultar c="FFIN" f="axisadm200" dejarHueco="false">
											<td class="campocaja" id="td_FFIN"><input type="text"
												class="campo campotexto campowidthinput" id="FFIN"
												name="FFIN" 
												<axis:atr f="axisadm200" c="FFIN" 
	                                            a="modificable=true&obligatorio=false&formato=fecha"/>
												size="15" style="width: 80px" maxlength="10"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}" />" />
												<a id="icon_FFIN" style="vertical-align: middle;"> <img
													alt="<axis:alt f="axisadm200" c="LIT_9000527" lit="9000527"/>"
													title="<axis:alt f="axisadm200" c="LIT_9000527" lit="9000527" />"
													src="images/calendar.gif" />
											</a></td>
										</axis:ocultar>
									</tr>

								</table>
							</td>
						</tr>

						<tr>
							<c:import url="../include/botonera_nt.jsp">
								<c:param name="f">axisadm200</c:param>
								<c:param name="__botones">100797,9904040</c:param>
							</c:import>
						</tr>
						<tr>
							<td>
								<!-- SOLICITUD -->
								<div class="titulo">
									<img src="images/flecha.gif" />
									<axis:alt f="axisadm200" c="titulos" lit="89906334" />
								</div>

								<table class="mainTableDimensions base">
									<!-- FIN Cabecera -->
									<tr>
										<td><c:set var="title1">
												<b><axis:alt f="axisadm200" c="label_SINTERF"
														lit="89906332" /></b>
											</c:set> <c:set var="title2">
												<b><axis:alt f="axisadm200" c="label_CINTERF"
														lit="89906333" /></b>
											</c:set> <c:set var="title3">
												<b><axis:alt f="axisadm200" c="label_FSOLICITUD"
														lit="9001983" /></b>
											</c:set> <c:set var="title4">
												<b><axis:alt f="axisadm200" c="label_ESTADO"
														lit="9905523" /></b>
											</c:set>

											<div class="seccion displayspaceGrande" style="width: 98%">
												<display:table name="${__formdata.listaSolicitud}"
													id="solicitud" export="false" class="dsptgtable"
													pagesize="10" defaultsort="1" defaultorder="descending"
													requestURI="axis_axisadm200.do?paginar=true" sort="list"
													cellpadding="0" cellspacing="0">
													<%@ include file="../include/displaytag.jsp"%>

													<display:column title=" " sortable="false"
														headerClass="headwidth5 sortable" style="width:5%;"
														media="html" autolink="false">
														<div class="dspIcons">
															<input
																value="${solicitud['SINTERF']}|${solicitud['ESTADO']}"
																type="radio" id="radioSolicitud" name="radioSolicitud" />
														</div>
													</display:column>

													<display:column title="${title1}" sortable="true"
														style="width:10%;" sortProperty="SINTERF"
														headerClass="headwidth5 sortable" media="html"
														autolink="false">
														<div class="dspText">${solicitud['SINTERF']}</div>
													</display:column>

													<display:column title="${title2}" sortable="true"
														style="width:10%;" sortProperty="CINTERF"
														headerClass="headwidth5 sortable" media="html"
														autolink="false">
														<div class="dspText">${solicitud['CINTERF']}</div>
													</display:column>

													<axis:visible f="axisadm200" c="FECHA_SOLICITUD">
														<display:column title="${title3}" sortable="true"
															style="width:25%;" sortProperty="FECHA_SOLICITUD"
															headerClass="sortable" media="html" autolink="false">
															<div class="dspText">${solicitud['FECHA_SOLICITUD']}</div>
														</display:column>
													</axis:visible>

													<axis:visible f="axisadm200" c="TESTADO">
														<display:column title="${title4}" sortable="true"
															style="width:20%;" sortProperty="TESTADO"
															headerClass="sortable" media="html" autolink="false">
															<div class="dspText">${solicitud['TESTADO']}</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisadm200" c="ESTADO">
														<display:column title=" " sortable="true"
															style="width:30%;" sortProperty=""
															headerClass="headwidth5 sortable" media="html"
															autolink="false">
															<axis:visible f="axisadm200" c="ACCION"> 
															<c:if test="${solicitud['ESTADO'] == 1}">
																<div class="dspText">
																	<a
																		onclick="javascript:verEntradaSalida('${solicitud['SINTERF']}','${solicitud['ESTADO']}',
																	'${solicitud['CINTERF']}','${solicitud['TESTADO']}')">Ver</a>
																</div>
															</c:if>
															<c:if
																test="${solicitud['ESTADO'] == 2 || solicitud['ESTADO'] == null}">
																<div class="dspText">
																	<a
																		onclick="javascript:verEntradaSalida('${solicitud['SINTERF']}','${solicitud['ESTADO']}',
																	'${solicitud['CINTERF']}','${solicitud['TESTADO']}')">Ver</a>
																	&nbsp;&nbsp;&nbsp;
																	<c:if
																		test="${solicitud['CINTERF'] == 'I017' || solicitud['CINTERF'] == 'I031'}">
																		<a
																			onclick="javascript:reintentarServicio('${solicitud['SINTERF']}', 
																			'${solicitud['ESTADO']}', '${solicitud['CINTERF']}','${solicitud['TESTADO']}')">Reintentar</a>
																	</c:if>
																	<c:if test="${solicitud['CINTERF'] == 'CONVI'}">
																		<a
																			onclick="javascript:reintentarServicio('${solicitud['SINTERF']}', 
																			'${solicitud['ESTADO']}', '${solicitud['CINTERF']}','${solicitud['TESTADO']}')">Reintentar</a>
																	</c:if>
																</div>
															</c:if>
															</axis:visible>
														</display:column>
													</axis:visible>

												</display:table>

											</div>
											<div  class="separador">&nbsp;</div> <c:import
												url="../include/botonera_nt.jsp">
												<c:param name="f">axisadm200</c:param>
												<c:param name="__botones">salir</c:param>
											</c:import></td>
									</tr>

								</table>

							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</form>

	<c:import url="../include/mensajes.jsp" />
	<script type="text/javascript">
		Calendar.setup({
			inputField : "FINICIO",
			ifFormat : "%d/%m/%Y",
			button : "icon_FINICIO",
			singleClick : true,
			firstDay : 1
		});

		Calendar.setup({
			inputField : "FFIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FFIN",
			singleClick : true,
			firstDay : 1
		});
	</script>

</body>
</html>
