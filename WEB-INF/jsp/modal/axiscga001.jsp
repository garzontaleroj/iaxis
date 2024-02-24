
<%
	/*
	*  Fichero: axiscga001.jsp
	*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
	*
	*  Fecha: 27/11/2012
	*/
%>
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<%@ page import="java.util.List"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>

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

<c:import url="../include/carga_framework_js.jsp" />
<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	//Inicio Bartolo Herrera 11-03-2019 IAXIS-3053
	$(document).ready(function(){
    $("#NRADICA").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code==13){
        	f_but_buscar();
        }
   	 });
	});
	//fin Bartolo Herrera 11-03-2019 IAXIS-3053
	
	function f_but_buscar() {

		//Inicio Bartolo Herrera 11-03-2019 IAXIS-3053
		parent.f_but_buscar(objDom.getValorPorId("NRADICA"), objDom.getValorPorId("SPERSON"), objDom.getValorPorId("CAGENTE"), objDom.getValorPorId("NNUMIDE"), objDom.getValorPorId("NOMBRE"));
		//fin Bartolo Herrera 11-03-2019 IAXIS-3053
	}
	function f_but_cancelar() {
		parent.f_cerrar_axiscga001();
	}

	function f_onload() {
		f_cargar_propiedades_pantalla();
	}

	function f_abrir_axisper021() {
		var SSEGURO = "${__formdata.SSEGURO}";
		var CAGENTE = "${__formdata.CAGENTE}";
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="
						+ CAGENTE + "&SSEGURO=" + SSEGURO);
	}

	function f_cerrar_axisper022() {
		f_cerrar_modalespersona("axisper022");
	}

	function f_cerrar_axisper021() {
		f_cerrar_modalespersona("axisper021");
	}

	function f_nova_persona() {
		//alert("al entrar en el parent***");
		f_cerrar_modalespersona("axisper021");
		var CAGENTE = "${__formdata.CAGENTE_PERSN}";
		//alert(CAGENTE);
		objUtiles.abrirModal("axisper022", "src",
				"modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="
						+ CAGENTE);
	}

	function f_cerrar_modalespersona(modal) {
		objUtiles.cerrarModal(modal);
	}

	function f_aceptar_persona(SPERSON, CAGENTE, SNIP, modal) {
// 		alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);

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
		}

		
	}

	function callbackAjaxActualitzaPersona(ajaxResponseText) {
		try {
			var doc = objAjax.domParse(ajaxResponseText);

			if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
				objDom.setValorPorId("NNUMIDE", objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("NNUMIDE"), 0, 0));
				
				var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TAPELLI1")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TAPELLI1"), 0, 0) : "");
				
				var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TAPELLI2")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TAPELLI2"), 0, 0) : "");
				
				var NOMBRE = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TNOMBRE")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TNOMBRE"), 0, 0) : "");
				
				var SPERSON = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("SPERSON")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("SPERSON"), 0, 0) : "");
				
				objDom.setValorPorId("NOMBRE", NOMBRE + ' ' + APELLIDO1 + ' '
						+ APELLIDO2);
				
				objDom.setValorPorId("SPERSON", SPERSON);
				
				var CAGENTE = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("CAGENTE")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("CAGENTE"), 0, 0) : "");
				
				objDom.setValorPorId("CAGENTE", CAGENTE);

				
				
			}

		} catch (e) {
		}
	}

	function cambiarDisplay(value) {
		if (value == 1) {
			celdaCompania1.style.display = "";
			celdaOficina1.style.display = "";
			celdaCompania2.style.display = "";
			celdaOficina2.style.display = "";
		} else {
			celdaCompania1.style.display = "none";
			celdaOficina1.style.display = "none";
			celdaCompania2.style.display = "none";
			celdaOficina2.style.display = "none";
		}
	}

	function f_editar(SCONTGAR) {
		objUtiles.ejecutarFormulario("axis_axiscga001.do?SCONTGAR=" + SCONTGAR,
				"editar", document.miForm, "_self",
				objJsMessages.jslit_cargando);
	}
	function f_detalle(SCONTGAR) {
		objUtiles.ejecutarFormulario("axis_axiscga001.do?SCONTGAR=" + SCONTGAR,
				"buscar", document.miForm, "_self",
				objJsMessages.jslit_cargando);
	}
</script>
</head>
<body onload="f_onload()" class=" ">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_022" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper022" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>

	<form name="axiscga001Form" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input
			type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
		<input type="hidden" name="CAGENTE_VISIO"
			value="${__formdata.CAGENTE_VISIO}" /> <input type="hidden"
			name="SNIP" value="${__formdata.SNIP}" /> <input type="hidden"
			id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}" /> <input
			type="hidden" id="SPERSON" name="SPERSON_REL"
			value="${__formdata.SPERSON_REL}" /> <input type="hidden"
			id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}" /> <input
			type="hidden" id="SSEGURO" name="SSEGURO"
			value="${__formdata.SSEGURO}" /> 



		<c:import url="../include/titulo_nt.jsp">
			<c:param name="formulario">
				<axis:alt f="axiscga001" c="formulario" lit="9904587" />
			</c:param>
			<c:param name="producto">
				<axis:alt f="axiscga001" c="producto" lit="9904587" />
			</c:param>
			<c:param name="form">axiscga001</c:param>
		</c:import>
		<!-- Area de campos  -->
		<table id="tabla1" class="mainModalDimensions base" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table class="seccion">
						<tr>
							<td align="left">
								<table class="area" align="center">
									<tr>
										<th style="width: 20%; height: 0px"></th>
										<th style="width: 20%; height: 0px"></th>
										<th style="width: 20%; height: 0px"></th>
										<th style="width: 20%; height: 0px"></th>
										<th style="width: 20%; height: 0px"></th>
									</tr>

									<tr>
										<!-- Número identificación -->
										<td class="titulocaja"><b><axis:alt f="axiscga001"
													c="NIDENTIFICACION" lit="9904434" /></b></td>
										<!-- Nombre persona -->
										<td class="titulocaja" colspan="2"><b><axis:alt
													f="axiscga001" c="NOMBREPER" lit="105940" /></b></td>
										<td class="titulocaja" colspan="2"><b><axis:alt
													f="axiscga001" c="NRADICA" lit="9908812" /></b></td>

									</tr>
									<tr>
										<td class="campocaja"><input type="hidden" name="SPERSON"
											value="${__formdata.SPERSON}"
											class="campowidthinput campo campotexto" style="width: 90%"
											<axis:atr f="axiscga001" c="SPERSON" a="modificable=false&obligatorio=true"/> />
											<input type="text" id="NNUMIDE" name="NNUMIDE"
											value="${__formdata.NNUMIDE}"
											class="campowidthinput campo campotexto" style="width: 60%"
											title="<axis:alt f="axiscga001" c="NNUMIDE" lit="9904434"/>"
											<axis:atr f="axiscga001" c="NNUMIDE" a="modificable=false"/> />
											<img id="find" border="0" src="images/find.gif"
											onclick="f_abrir_axisper021()" style="cursor: pointer" /></td>
										<td class="campocaja" colspan="2"><input type="text"
											id="NOMBRE" name="NOMBRE" value="${__formdata.NOMBRE}"
											class="campowidthinput campo campotexto" style="width: 90%"
											<axis:atr f="axiscga001" c="NOMBRE" a="modificable=false"/> />
										</td>
										<td class="campocaja" colspan="2"><input type="text" id="NRADICA"
											name="NRADICA" value="${__formdata.NRADICA}"
											class="campowidthinput campo campotexto" style="width: 20%"
											<axis:atr f="axiscga001" c="NRADICA" a="modificable=true"/> />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>



		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axiscga001</c:param>
			<c:param name="f">axiscga001</c:param>
			<c:param name="__botones">cancelar,buscar</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>

