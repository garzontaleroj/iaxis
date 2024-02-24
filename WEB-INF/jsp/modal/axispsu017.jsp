
<%
	/**
	*  Fichero: axispsu003.jsp
	*  
	*
	* Descripción de pantalla
	*
	*  Fecha: 02/02/2010
	*/
%>

<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ page import="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title><axis:alt f="axispsu015" c="TITULO_HTML" lit="9002255" /></title>
<%-- Politica de subscripción detalle --%>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
	// Código javascript

	function f_onload() {

		//var grabat = "${__formdata.OK}";
		//if (!objUtiles.estaVacio(grabat) && objUtiles.utilEquals(grabat,"0")){
		// parent.f_aceptar_modal('axispsu015',1);
		// }

		//Deshabilitar campos entrada
		<c:if test="${EDITABLE == 1}">
		objDom.setVisibilidadPorId("but_aceptar", "hidden");
		document.getElementById("OBSERV").readonly = true;
		document.getElementById("OBSERV").disabled = true;
		document.getElementById("CAUTREC").readonly = true;
		document.getElementById("CAUTREC").disabled = true;
		</c:if>

		f_cargar_propiedades_pantalla();
	}

	function f_but_cancelar() {
		parent.f_cerrar_axispsu017();
	}
	function f_axispsu018(sseguro,nversion,nmovimi,NVERSIONSUBEST){
		
    	objUtiles.abrirModal("axispsu018", "src", "modal_axispsu018.do?operation=form&SSEGUROS="+sseguro+"&NVERSIONS="+nversion+
         			             "&NMOVIMIS="+nmovimi+"&NVERSIONSUBESTS="+NVERSIONSUBEST);            	
	 } 
    
    function f_cerrar_axispsu018() {
        objUtiles.cerrarModal("axispsu018");
    } 

	//  function f_but_aceptar(){

	//    if (objValidador.validaEntrada()) 
	//     objUtiles.ejecutarFormulario("modal_axispsu015.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);         
	// }

	// Fin código javascript
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="formulario">
				<axis:alt f="axispsu017" c="TIT_FORM" lit="9002255" />
			</c:param>
			<c:param name="producto">
				<axis:alt f="axispsu017" c="TIT_FORM" lit="9002255" />
			</c:param>
			<c:param name="form">axispsu017</c:param>
		</c:import>
		<!-- Ventana modal axisctr021 rechazar -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr018" c="LIT_TIT_RECHAZO" lit="1000189" /></c:param>
                <c:param name="nid" value="axispsu018" />
            </c:import>


		<!-- Area de campos  -->
		<table class="" align="center" cellpadding="0"
			cellspacing="0">

			<div class="separador">&nbsp;</div>

			<table class="seccion" cellpadding="0" cellspacing="0">

				<axis:visible f="${pantalla}" c="DSP_PSUCONTROLSEG_HIST">


					<c:set var="title24">
						<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100894" />
					</c:set>
					<c:set var="title25">
						<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100562" />
					</c:set>
					<c:set var="title26">
						<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909287" />
					</c:set>
					<c:set var="title27">
						<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
					</c:set>

					<c:set var="title29">
						<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
					</c:set>
					

					<div id="gridPSU_OBSERV">

						<table class="area" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td class="campocaja"><img
									id="DSP_PSUCONTROLSEG_HIST_parent" src="images/mes.gif"
									onclick="objEstilos.toggleDisplay('DSP_PSUCONTROLSEG_HIST', this)"
									style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
											c="DSP_PSUCONTROLSEG_HIST" lit="9904548" /></b>
									<hr class="titulo"></hr></td>
							</tr>
							<tr id="DSP_PSUCONTROLSEG_HIST_children" style="display: none">


								<td class="campocaja"><display:table
										name="${__formdata.P_TPSU_SUBESTADOSPROP}" id="lstPsuControl"
										export="false" class="dsptgtable" pagesize="-1" sort="list"
										cellpadding="0" cellspacing="0"
										requestURI="axis_axisctr020.do?paginar=true"
										style="width:100%">
										<%@ include file="../include/displaytag.jsp"%>


										<display:column title="${title24}" sortable="true"
											sortProperty="CMOVIMI" headerClass="sortable" media="html"
											autolink="false" style="white-space:nowrap; width:15px">
											<div class="dspText">${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.CUSUALT}</div>
										</display:column>

										<display:column title="${title25}" sortable="true"
											sortProperty="CMOVIMI" headerClass="sortable" media="html"
											autolink="false" style="white-space:nowrap; width:15px">
											<div class="dspText">${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.FALTA}</div>
										</display:column>

										<display:column title="${title26}" sortable="true"
											sortProperty="CMOVIMI" headerClass="sortable" media="html"
											autolink="false" style="white-space:nowrap; width:15px">
											<div class="dspText">${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.TSUBESTADO}</div>
										</display:column>

										<display:column title="${title27}" sortable="true"
											sortProperty="CMOVIMI" headerClass="sortable" media="html"
											autolink="false" style="white-space:nowrap; width:15px">
											<div class="dspText">${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.COBSERVACIONES}</div>
										</display:column>

										<display:column title="${title29}" sortable="true"
											sortProperty="" headerClass="sortable" media="html"
											autolink="false" style="white-space:nowrap; width:15px">
											<div class="dspIcons">
												<img border="0" src="images/informacion.gif" width="12px"
													height="12px" style="cursor: pointer"
													onClick="javascript:f_axispsu018('${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.SSEGURO}','${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.NVERSION}',
								'${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.NMOVIMI}','${lstPsuControl.OB_IAX_PSU_SUBESTADOSPROP.NVERSIONSUBEST}')" />
											</div>
										</display:column>


									</display:table></td>
							</tr>

						</table>
					</div>
				</axis:visible>

			</table>

		</table>


		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axispsu017</c:param>
			<c:param name="__botones">cancelar
			</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
