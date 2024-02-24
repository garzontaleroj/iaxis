
<%
	/*
	*  Fichero: axiscga003.jsp
	*
	*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
	*  Fecha: 07/07/2008
	*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">

<c:import url="../include/carga_framework_js.jsp" />
<script type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_but_cancelar() {
		parent.f_cerrar_axiscga003();
	}

	function f_onload() {
		f_cargar_propiedades_pantalla();

		var isUpload = "${isUpload}";
		try {
			if (!objUtiles.estaVacio(isUpload)
					&& objUtiles.utilEquals(isUpload, 'ok')) {
				parent.f_aceptar_axiscga003();
			}
		} catch (e) {
		}
		document.getElementById("myTDESC").focus();
	}

	function f_enviar_datos() {
		var userAgent = "${header['User-agent']}";

		// En FF, no se recogen bien los acentos en el Fileupload Servlet. 
		// Por eso, pasamos el nombre de fichero como un campo hidden.
		// En IE, se recoge de forma normal, con item.getName().
		if (userAgent.indexOf("Firefox") > 0)
			objDom.setValorPorId("TFILENAME", objDom.getValorPorId("TFILE"));

		objDom.setValorPorId("TDESC", objDom.getValorPorId("myTDESC"));
		objDom.setValorPorId("IDCAT", objDom.getValorPorId("myIDCAT"));

		objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText",
				objJsMessages.jslit_cargando, "inline");
		document.miForm.submit();

		

	}

	function f_but_aceptar() {
		if (objValidador.validaEntrada()) {
			f_enviar_datos();

		}
	}

</script>
</head>
<body onunload="try { f_clear_resources(document.body) } catch (e) {}"
	onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

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


		<form name="miForm" enctype='multipart/form-data'
				action="Axiscga003Servlet" method="POST" accept-charset='UTF-8'>
				<c:import url="../include/titulo_nt.jsp">
					<c:param name="titulo">
						<axis:alt f="axiscga003" c="TITULO" lit="1000431" />
					</c:param>
					<c:param name="formulario">
						<axis:alt f="axiscga003" c="TITFORM" lit="1000614" />
					</c:param>
					<c:param name="form">axiscga003</c:param>
				</c:import>
				<input type="hidden" id="TDESC" name="TDESC" value="" /> 
				<input type="hidden" id="SPERSON" name="SPERSON" value="${param.SPERSON}" /> 
				<input type="hidden" id="CAGENTE" name="CAGENTE"
					value="${param.CAGENTE}" /> <input type="hidden" id="IDDOCGEDOX"
					name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}" /> <input
					type="hidden" id="NDOCUME" name="NDOCUME"
					value="${__formdata.NDOCUME}" /> <input type="hidden" id="NTRAMIT"
					name="NTRAMIT" value="${__formdata.NTRAMIT}" /> <input
					type="hidden" id="TAMANO" name="TAMANO"
					value="${__formdata.TAMANO}" /> <input type="hidden" id="ORIGEN"
					name="ORIGEN" value="${__formdata.ORIGEN}" /> <input type="hidden"
					id="IDCAT" name="IDCAT" value="" /> <input type="hidden"
					id="TFILENAME" name="TFILENAME" value="" /> <input type="hidden"
					id="operation" name="operation" value="" /> <input type="hidden"
					id="SCONTGAR" name="SCONTGAR" value="${__formdata.SCONTGAR}" /> <input
					type="hidden" id="NMOVIMI" name="NMOVIMI"
					value="${__formdata.NMOVIMI}" /> 

				<table id="tabla1" class="mainModalDimensions base" align="center"
					cellpadding="0" cellspacing="3">

					<tr>
						<td>
							<div class="separador">&nbsp;</div>

							<table class="seccion">
								<tr>
									<th style="width: 5%; height: 0%">&nbsp;</th>
									<th style="width: 20%; height: 0%">&nbsp;</th>
									<th style="width: 20%; height: 0%">&nbsp;</th>
									<th style="width: 25%; height: 0%">&nbsp;</th>
									<th style="width: 30%; height: 0%">&nbsp;</th>

								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="FITXER" lit="1000574" /></b> <%-- FITXER --%></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<c:if test="${empty __formdata.IDDOCGEDOX}">
										<td class="campocaja" colspan="3"><input type="file"
											size="70" class="campowidthinput campo campotexto"
											name="TFILE" id="TFILE"
											title="<axis:alt f="axiscga003" c="TFILE" lit="1000574"/>"
											obligatorio="true" />
											<div class="separador">&nbsp;</div></td>
									</c:if>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="myTDESC" lit="100588" /></b></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="campocaja" colspan="3"><input type="text"
										name="myTDESC" id="myTDESC"
										class="campowidthinput campo campotexto"
										title="<axis:alt f="axiscga003" c="myTDESC" lit="100588"/>"
										obligatorio="true" value="${__formdata.myTDESC}"
										<c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axiscga003" c="myTDESC" a="modificable=false&obligatorio=true"/></c:if> />
										<div class="separador">&nbsp;</div></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="myIDCAT" lit="1000612" /></b></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="campocaja" colspan="3"><select name="myIDCAT"
										id="myIDCAT" size="1" obligatorio="true"
										title="<axis:alt f="axiscga003" c="myIDCAT" lit="1000612"/>"
										class="campowidthselect campo campotexto_ob"
										style="width: 50%;"
										<c:if test="${!empty __formdata.IDDOCGEDOX}">disabled="disabled"</c:if>>&nbsp;
											<option value="null">-
												<axis:alt f="axiscga003" c="SNV_COMBO" lit="108341" /> -
											</option>
											<c:forEach
												items="${__formdata.LS_TIPO_DOCUMENTO_CONTRAGARANTIA}"
												var="LSTCATEGOR">
												<option value="${LSTCATEGOR.CATRIBU}"
													<c:if test="${LSTCATEGOR.CATRIBU  == __formdata.myIDCAT}">selected</c:if>>${LSTCATEGOR.TATRIBU}</option>
											</c:forEach>
									</select>
										<div class="separador">&nbsp;</div></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="TOBSERVACIONES" lit="101162" /></b></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="3" style="width: 100%;" class="campocaja">
										<!-- colspan="5" --> <axis:ocultar c="OBSERVACIONES"
											f="axiscga003" dejarHueco="false">
											<textarea class="campowidthinput campo campotexto"
												style="width: 100%;" name="OBSERVACIONES" id="OBSERVACIONES">${__formdata.OBSERVACIONES}</textarea>
										</axis:ocultar>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="FCADUCIDAD" lit="9001356" /></b></td>
									<td class="titulocaja"><b><axis:alt f="axiscga003"
												c="FALTA" lit="105887" /></b></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<axis:ocultar c="FCADUCIDAD" f="axiscga003" dejarHueco="false">
										<td class="campocaja"><input type="text"
											class="campowidthinput campo campotexto" size="10"
											value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCADUCIDAD}"/>"
											name="FCADUCIDAD" id="FCADUCIDAD" style="width: 50%;"
											title="<axis:alt f="axiscga003" c="FCADUCIDAD" lit="9001356"/>"
											<axis:atr f="axiscga003" c="FCADUCIDAD" a="modificable=true&obligatorio=false&formato=fecha"/> />
											<a style="vertical-align: middle;"><img
												id="popup_calendario_FCADUCIDAD"
												alt="<axis:alt f="axiscga003" c="FCADUCIDAD" lit="9001356"/>"
												src="images/calendar.gif" /> </a></td>
									</axis:ocultar>
									<axis:ocultar c="FALTA" f="axiscga003" dejarHueco="false">
										<td class="campocaja"><input type="text"
											class="campowidthinput campo campotexto" size="10"
											value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTA}"/>"
											name="FALTA" id="FALTA" style="width: 50%;"
											title="<axis:alt f="axiscga003" c="FALTA" lit="105887"/>"
											<axis:atr f="axiscga003" c="FALTA" a="modificable=false&obligatorio=false&formato=fecha"/> />
										</td>
									</axis:ocultar>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		


	<c:import url="../include/botonera_nt.jsp">
		<c:param name="f">axiscga003</c:param>
		<c:param name="f">axiscga003</c:param>
		<c:param name="__botones">cancelar,aceptar</c:param>
	</c:import>


	<script type="text/javascript">
		Calendar.setup({
			inputField : "FCADUCIDAD",
			ifFormat : "%d/%m/%Y",
			button : "popup_calendario_FCADUCIDAD",
			singleClick : true,
			firstDay : 1
		});
	</script>

	<c:import url="../include/mensajes.jsp" />
</body>
</html>