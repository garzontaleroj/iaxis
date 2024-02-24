
<%
	/*
	 *  Fichero: axisper049.jsp
	 *  Fecha: 17/03/2021
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


<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		f_cargar_propiedades_pantalla();		
	}
	
	function isNumberKey(event) {
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (!(charCode > 31 && ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105))))
			event.preventDefault();
	}
	

	function f_but_salir() {
		objUtiles.ejecutarFormulario("flujodetrabajo.do", "cancelar",
				document.miForm, "_self");
	}

	function f_but_9904040() {
		objUtiles.ejecutarFormulario("axis_axisper049.do", "limpiar",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_but_9000552() {
		
		if($("#NNUMIDE").val()== "")
		{
			alert("Por favor buscar una persona para actulizar datos.");	
		}	
		else if (objValidador.validaEntrada()) 
		{
		objUtiles
				.ejecutarFormulario("axis_axisper049.do", "actulizarDatos",
						document.miForm, "_self",
						"<axis:alt f='axisper049' c='actulizarDatos' lit='1000153' />");
		}

	}

	/****************************************************************************************/
	/********************************** MODAL AXISPER008 **************************************/
	/****************************************************************************************/
	function f_abrir_axisper008() {
		objUtiles
				.abrirModal(
						"axisper008",
						"src",
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
			objAjax.invokeAsyncCGI("axis_axisper049.do", callbackajaxagencia,
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

				var NNUMIDE = objDom.getValorNodoDelComponente(persona
						.getElementsByTagName("NNUMIDE"), 0, 0);
				var CTIPPER = objDom.getValorNodoDelComponente(persona
						.getElementsByTagName("CTIPPER"), 0, 0);

				if (CTIPPER == 1) {
					if (objUtiles.hayValorElementoXml(persona
							.getElementsByTagName("TNOMBRE1")[0])) {
						TNOMBRE1 = objDom.getValorNodoDelComponente(persona
								.getElementsByTagName("TNOMBRE1"), 0, 0);
					}
					if (objUtiles.hayValorElementoXml(persona
							.getElementsByTagName("TNOMBRE2")[0])) {
						TNOMBRE2 = objDom.getValorNodoDelComponente(persona
								.getElementsByTagName("TNOMBRE2"), 0, 0);
					}
					if (objUtiles.hayValorElementoXml(persona
							.getElementsByTagName("TAPELLI1")[0])) {
						TAPELLI1 = objDom.getValorNodoDelComponente(persona
								.getElementsByTagName("TAPELLI1"), 0, 0);
					}
					if (objUtiles.hayValorElementoXml(persona
							.getElementsByTagName("TAPELLI2")[0])) {
						TAPELLI2 = objDom.getValorNodoDelComponente(persona
								.getElementsByTagName("TAPELLI2"), 0, 0);
					}

					nombre = TNOMBRE1.replace(/^\s+|\s+$/gm, '') + " "
							+ TNOMBRE2.replace(/^\s+|\s+$/gm, '') + " "
							+ TAPELLI1.replace(/^\s+|\s+$/gm, '') + " "
							+ TAPELLI2.replace(/^\s+|\s+$/gm, '');
				} else {
					TAPELLI1 = objDom.getValorNodoDelComponente(persona
							.getElementsByTagName("TAPELLI1"), 0, 0);
					nombre = TAPELLI1;
				}

				var SPERSON_AGENCIA = objDom.getValorNodoDelComponente(persona
						.getElementsByTagName("SPERSON"), 0, 0);

				document.getElementById("NOMBRE").value = nombre;
				document.getElementById("NNUMIDE").value = NNUMIDE;
				document.getElementById("SPERSON_AGENCIA").value = SPERSON_AGENCIA;

			}
		} catch (e) {
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
		<input type="hidden" name="SPERSON_AGENCIA" id="SPERSON_AGENCIA" />

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="${fname}" c="TITULO" lit="89908113" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="${fname}" c="TITULO" lit="89908113" />
			</c:param>
			<c:param name="form">axisper049</c:param>
		</c:import>
		<!-- axisper008 -->
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisper008|<axis:alt
					f="axisper049" c="MODAL_AXISPER049" lit="1000065" />
			</c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisper049" c="TITULO" lit="89908113" />
			</c:param>
			<c:param name="nid" value="axisper049" />
		</c:import>

		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table class="seccion">
						<tr>
							<td align="left">
								<table class="area" align="center">
									<tr id="tr_BUSCAR_PERSONA_T">
										<axis:visible f="axisper049" c="NNUMIDE">
											<td class="titulocaja"><b> <axis:alt f="axisper049"
														c="NNUMIDE" lit="9907781" /></b> <img id="find" border="0"
												src="images/find.gif" onclick="f_abrir_axisper008()"
												style="cursor: pointer" /></td>
										</axis:visible>
									</tr>

									<tr id="tr_BUSCAR_PERSONA_I">
										<!-- NNUMIDE -->
										
										<axis:ocultar f="axisper049" c="NNUMIDE" dejarHueco="false">
											<td class="campocaja"><input type="text" name="NNUMIDE"
												id="NNUMIDE" value="${__formdata.NNUMIDE}"
												class="campowidthinput campo campotexto"
												<axis:atr f="axisper049" c="NNUMIDE" a="modificable=false&obligatorio=true"/> />
											</td>
										</axis:ocultar>
										<!-- NOMBRE -->
										<axis:ocultar f="axisper049" c="NOMBRE" dejarHueco="false">
											<td class="campocaja"><input type="text" name="NOMBRE"
												id="NOMBRE" value="${__formdata.NOMBRE}"
												class="campowidthinput campo campotexto"
												<axis:atr f="axisper049" c="NOMBRE" a="modificable=false&obligatorio=true"/> />
											</td>
										</axis:ocultar>
									</tr>

									<tr id="tr_CODIGO_DEUDOR_T">
										<axis:visible f="axisper049" c="CODIGO_DEUDOR">
											<td class="titulocaja"><b> <axis:alt f="axisper049"
														c="CODIGO_DEUDOR" lit="89908114" /></b></td>
										</axis:visible>
										<axis:visible f="axisper049" c="CODIGO_ACREEDOR">
											<td class="titulocaja"><b> <axis:alt f="axisper049"
														c="CODIGO_ACREEDOR" lit="89908115" /></b></td>
										</axis:visible>

									</tr>

									<tr id="tr_CODIGO_DEUDOR_I">
										<axis:visible f="axisper049" c="CODIGO_DEUDOR">
											<td class="campocaja"><input type="text"
												name="CODIGO_DEUDOR"
												title="<axis:alt f="axisper049" c="CODIGO_DEUDOR" lit="89908114" />"
												id="CODIGO_DEUDOR" value="${__formdata.CODIGO_DEUDOR}"
												onkeypress="javascript:isNumberKey(event)"												
												class="campowidthinput campo campotexto" style="width: 50%"
												<axis:atr f="axisper049" c="CODIGO_DEUDOR" a="modificable=true&obligatorio=true"/> />
											</td>
										</axis:visible>

										<axis:visible f="axisper049" c="CODIGO_ACREEDOR">
											<td class="campocaja"><input type="text"
												name="CODIGO_ACREEDOR"
												title="<axis:alt f="axisper049" c="CODIGO_ACREEDOR" lit="89908115" />"
												id="CODIGO_ACREEDOR" value="${__formdata.CODIGO_ACREEDOR}"
												onkeypress="javascript:isNumberKey(event)"												
												class="campowidthinput campo campotexto" style="width: 50%"
												<axis:atr f="axisper049" c="CODIGO_ACREEDOR" a="modificable=true&obligatorio=true"/> />
											</td>
										</axis:visible>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<c:import url="../include/botonera_nt.jsp">
								<c:param name="f">axisper049</c:param>
								<c:param name="__botones">9000552,9904040,salir</c:param>
							</c:import>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>
