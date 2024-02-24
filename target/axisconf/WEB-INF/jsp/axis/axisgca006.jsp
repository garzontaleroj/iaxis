<%/* Revision:# HN2K8Nc8udO/E9j3IZhmTw== # */%>

<%
	/* Revision:# taFHfb2FxxkbF9bHiNMuhA== # */
%>

<%
	/*
	*  Fichero: axiscga002.jsp
	*  Fecha: 03/02/2009
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
<link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en función del Locale -->
<script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
<!-- Setup del calendario -->
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->
<style>
.bold {
	font-weight: bold;
	font-size: 10px;
}

.campo {
	width: 200px;
}
</style>
<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {

		f_cargar_propiedades_pantalla();

	}

	function f_but_cancelar() {
		parent.cerrar_axisgca006();
		objUtiles.ejecutarFormulario("axis_axisgca006.do?action=FORM","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}

	
	function cerrar_axisgca007() {
		objUtiles.cerrarModal("axisgca007");
	}
	
	function ver_detalle(IDOBS){
		var SGSFAVCLI = objDom.getValorPorId("SGSFAVCLI");
		objUtiles.abrirModal("axisgca007","src","axis_axisgca007.do?operation=form&action=BUSCAR&SGSFAVCLI="+SGSFAVCLI+"&PARAMB="+IDOBS+"&PARAMA=2");
	}

	//crear
	function f_but_9910604() {
		objUtiles.abrirModal("axisgca007","src","axis_axisgca007.do?operation=form&SGSFAVCLI="+$("#SGSFAVCLI").val());
	}
	
	function f_but_gedox(IDOBS) {              
        objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?dt="+document.miForm.DTGDOC.value+"&operation=form&IDOBS="+IDOBS);
    }   
    function f_cerrar_axisgedox() {
        objUtiles.cerrarModal("axisgedox");
    }
    
    function f_aceptar_modal(cual) {
        objUtiles.cerrarModal(cual);
    	objUtiles.ejecutarFormulario("axis_axisgca006.do?action=FORM","form", document.miForm, "_self",objJsMessages.jslit_cargando);
    	
    }
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910374" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910374" />
		</c:param>
		<c:param name="form">axisgca006</c:param>
	</c:import>


	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisgca007" c="TITULO" lit="9910604" />
		</c:param>
		<c:param name="nid" value="axisgca007" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisrea002" c="TITULO" lit="1000614" />
		</c:param>
		<c:param name="nid" value="axisgedox" />
	</c:import>



	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" name="SGSFAVCLI"
			id="SGSFAVCLI" value="${__formdata.SGSFAVCLI}" /> <input type="hidden" name="PARAMA" id="PARAMA"
			value="${__formdata.PARAMA}" /> <input type="hidden" name="PARAMB" id="PARAMB"
			value="${__formdata.PARAMB}" /> <input type="hidden" id="DTGDOC" name="DTGDOC"
			value="<%=new java.util.Date().getTime()%>" />
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca006" c="TITRES" lit="9910374"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca006" c="IDOBS" lit="9001189" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca006" c="TTITOBS" lit="9001196" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca006" c="FALTA" lit="105887" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca006" c="CUSUALTA" lit="9001630" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca006" c="TOBS" lit="9001197" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca006" c="ICODETALLE" lit="9906458" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca006" c="ICODOC" lit="9910376" />
					</c:set>

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.LISAPUNTES_GESTION_CARTERA}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca006.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="IDOBS" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.IDOBS}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="TTITOBS" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TTITOBS}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="FALTA" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.FALTA}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="CUSUALTA" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.CUSUALT}</div>
							</display:column>

							<display:column title="${title4}" sortProperty="TOBS" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.TOBS}</div>
							</display:column>

							<display:column title="${title5}" sortProperty="ICODETALLE" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<center>
									<img src="images/mes.gif" onclick="ver_detalle(${ROW.IDOBS})">
								</center>
							</display:column>

							<display:column title="${title6}" sortProperty="ICODOC" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">
									<a href="javascript:f_but_gedox('${ROW.IDOBS}')"> <img border="0"
										alt="<axis:alt f="axisrea002" c="LIT_IMG_VAL" lit="1000577"/>" title="${title14}"
										src="images/gdocumental.gif" />
									</a>

								</div>
							</display:column>

						</display:table>
					</div></td>
			</tr>
		</table>

		<br /> <br />




		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca006</c:param>
			<c:param name="f">axisgca006</c:param>
			<c:param name="__botones">cancelar,9910604</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>

