
<%
	/*
	*  Fichero: axisadm201.jsp
	*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> 
	*  
	*
	*
	*	El botón cancelar cierra la ventana actual.
	*
	*
	*  Fecha: 26/06/2019
	*/
%>
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<%-- Especial per controlar els scroll amb iPad --%>
<link type="text/css" href="styles/jquery.jscrollpane.css"
	rel="stylesheet"
	media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
<style type="text/css" id="page-css">
</style>
<%-- FI Especial per controlar els scroll amb iPad --%>
<c:import url="../include/carga_framework_js.jsp" />
<script language="Javascript" type="text/javascript">

	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/
	function f_onload() 
	{
		f_cargar_propiedades_pantalla();
		$("#but_108211").parent().css("text-align","left");		
		loadReqResData();
	}

	function f_but_108211() {
		parent.f_cerrar_axisadm201();
	}
	
	function loadReqResData() {
		var url = "operation=ajax_getReqResDetail&SINTERF=" + parent.document.getElementById("SINTERF").value;
		url = url + "&ESTADO=" + parent.document.getElementById("SELECTED_ESTADO").value;
		url = url + "&CINTERF=" + parent.document.getElementById("CINTERF").value;
		url = url + "&TESTADO_CONVI=" + parent.document.getElementById("TESTADO_CONVI").value;
		
		objAjax.invokeAsyncCGI("modal_axisadm201.do", callbackajaxResponse, url, this, null, 'selectedPerson');
	}
	
	function callbackajaxResponse(ajaxResponseText, origen) {
		try {
			var doc = objAjax.domParse(ajaxResponseText);
			if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
					var persona = doc.getElementsByTagName("ENTRADA")[0];
					
					for (var i = 0;i < doc.getElementsByTagName("element").length;i++) {
	                    var ENTRADA = ((objUtiles.hayValorElementoXml(
	                    		doc.getElementsByTagName("element")[i].getElementsByTagName("ENTRADA")[0])) ?
	                    				doc.getElementsByTagName("element")[i].
	                    				getElementsByTagName("ENTRADA")[0].childNodes[0].nodeValue : "");
	                    var SALIDA = ((objUtiles.hayValorElementoXml(
	                    		doc.getElementsByTagName("element")[i].getElementsByTagName("SALIDA")[0])) ?
	                    				doc.getElementsByTagName("element")[i].
	                    				getElementsByTagName("SALIDA")[0].childNodes[0].nodeValue : "");
	                }
					document.getElementById("SALIDA").value = SALIDA;
					document.getElementById("ENTRADA").value = ENTRADA;
					document.getElementById("SINTERF").value = parent.document.getElementById("SINTERF").value;
					document.getElementById("CINTERF").value = parent.document.getElementById("CINTERF").value;
				}
			}
		} catch (e) {
			if (isDebugAjaxEnabled == "true")
				alert(e.name + " " + e.message);
		}
	}
	
</script>
</head>
<body onload="f_onload()">
	<div id="wrapper" class="wrapper">
		<c:import url="../include/precargador_ajax.jsp">
			<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
		</c:import>
		<form name="miForm" action="" method="POST">
			<input type="hidden" name="operation" value="" />
			<!-- 
			<input type="hidden" name="SINTERF1" id="SINTERF1" value="" />
			<input type="hidden" name="ESTADO" id="ESTADO" value="" />
			 -->
			<c:import url="../include/titulo_nt.jsp">
				<c:param name="formulario">
					<axis:alt f="axisadm201" c="FORM" lit="89906335" />
				</c:param>
				<c:param name="producto">
					<axis:alt f="axisadm201" c="FORM" lit="89906335" />
				</c:param>
				<c:param name="form">axisadm201</c:param>
			</c:import>
			<!-- Area de campos  -->
			<table id="tabla1" class="mainModalDimensions base" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<!--campos-->
						<table class="seccion">
							<div class="separador">&nbsp;</div>
							<div class="separador">&nbsp;</div>
							<tr>
								<!-- Sinterf -->
								<axis:visible f="axisadm201" c="SINTERF">
									<td class="titulocaja"><b><axis:alt f="axisadm201"
												c="SINTERF" lit="89906332" /></b></td>
								</axis:visible>
								<!-- Cinterf -->
								<axis:visible f="axisadm201" c="CINTERF">
									<td class="titulocaja"><b><axis:alt f="axisadm201"
												c="CINTERF" lit="89906333" /></b></td>
								</axis:visible>
							</tr>
							
							<tr>
								<!-- SINTERF -->
								<axis:ocultar f="axisadm201" c="SINTERF"
									dejarHueco="false">
									<td class="campocaja">
										<input type="text" name="SINTERF" id="SINTERF"
											value="${__formdata.SINTERF}" class="campowidthinput campo campotexto"
											<axis:atr f="axisadm201" c="SINTERF" a="modificable=false"/> />
									</td>
								</axis:ocultar>
								<!-- CINTERF -->
								<axis:ocultar f="axisadm201" c="CINTERF"
									dejarHueco="false">
									<td class="campocaja">
										<input type="text" name="CINTERF" id="CINTERF"
											value="${__formdata.CINTERF}" class="campowidthinput campo campotexto"
											<axis:atr f="axisadm201" c="CINTERF" a="modificable=false"/> />
									</td>
								</axis:ocultar>
							</tr>
							
							<tr>
								<axis:ocultar f="axisadm201" c="ENTRADA" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm201" c="ENTRADA" lit="9901122"></axis:alt></b>
									</td>
								</axis:ocultar>
								<axis:ocultar f="axisadm201" c="SALIDA" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm201" c="SALIDA" lit="9901123"></axis:alt></b>
									</td>
								</axis:ocultar>

							</tr>
							<tr>
								<td>
									<textarea name="ENTRADA" id="ENTRADA"
										style="visibility: visible; display: block" rows="20" cols="50"
										<axis:atr f="axisadm201" c="ENTRADA" a="modificable=false&obligatorio=false"/>
										class="campo campotexto"></textarea>
								</td>
								<td>
									<textarea name="SALIDA" id="SALIDA"
										style="visibility: visible; display: block" rows="20" cols="50"
										<axis:atr f="axisadm201" c="SALIDA" a="modificable=false&obligatorio=false"/>
										class="campo campotexto"></textarea>
								</td>
							</tr>
						</table>

						<div class="separador">&nbsp;</div> <c:import
							url="../include/botonera_nt.jsp">
							<c:param name="f">axisadm201</c:param>
							<c:param name="__botones">108211</c:param>
						</c:import>
					</td>
				</tr>
			</table>
		</form>
		<c:import url="../include/mensajes.jsp" />
	</div>
</body>
<c:if
	test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
	<script language="Javascript" type="text/javascript">
		retocarPAGE_CSS('axisadm201');
	</script>
</c:if>
</html>

