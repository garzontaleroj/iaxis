<%/* Revision:# fkKgileD6SRLYo7mmNeFXQ== # */%>

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
		
        if (${requestScope.grabarOK == true}) {
        	parent.f_cerrar_axisgca011();
        }

		f_cargar_propiedades_pantalla();

	}

	$(document).ready(function() {

	});

	//Nuevo
	function f_but_cancelar() {
		parent.f_cerrar_axisgca011();
	}
	//Exportar
	function f_but_aceptar() {
		objUtiles.ejecutarFormulario("axis_axisgca011.do?action=GUARDAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
		
	}
	
	function cargar_datos(){
		objUtiles.ejecutarFormulario("axis_axisgca011.do?action=FORMIN","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}
	
	function f_but_concilia(){
		var anotacion=document.getElementById("TOBSERVA").value;
		var meses = new Array ("ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE");
		var f=new Date();
		var anotacion2 = "CONCILIADO EN " + meses[f.getMonth()] +" "+ anotacion
		document.getElementById("TOBSERVA").value = anotacion2;
		document.getElementById('BT_CONCILIA').style.display = 'none';
	}

</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910399" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910399" />
		</c:param>
		<c:param name="form">axisgca011</c:param>
	</c:import>


	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		
		<input type="hidden" name="NLINEA" id="NLINEA"
			value="${__formdata.NLINEA}" />
			
			<input type="hidden" name="SIDCON" id="SIDCON"
			value="${__formdata.SIDCON}" />


		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca011" c="CESTADOI">
					<td><span class="bold"><axis:alt f="axisgca011" c="CESTADOI" lit="9910352"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca011' c='CESTADOI' lit='9910352' />"
						alt="<axis:alt f='axisgca011' c='CESTADOI' lit='9910352' />" name="CESTADOI" id="CESTADOI"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca011" c="CESTADOI" a="isInputText=false&modificable=false&obligatorio=true"/>>
							<option selected value>-
								<axis:alt f="axisgca011" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CESTADOI}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CESTADOI}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca011" c="CESTADO">
					<td><span class="bold"><axis:alt f="axisgca011" c="CESTADO" lit="101510"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca011' c='CESTADO' lit='101510' />"
						alt="<axis:alt f='axisgca011' c='CESTADO' lit='101510' />" name="CESTADO" id="CESTADO"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca011" c="CESTADO" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca011" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CESTADO}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CESTADO}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca011" c="CCRUCE">
					<td><span class="bold"><axis:alt f="axisgca011" c="CCRUCE" lit="9910377"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca011' c='CCRUCE' lit='9910377' />"
						alt="<axis:alt f='axisgca011' c='CCRUCE' lit='9910377' />" name="CCRUCE" id="CCRUCE" size="1"
						onchange="cargar_datos();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca011" c="CCRUCE" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca011" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_CCRUCE}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CCRUCE}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca011" c="CCRUCEDET">
					<td><span class="bold"><axis:alt f="axisgca011" c="CCRUCEDET" lit="9910378"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca011' c='CCRUCEDET' lit='9910378' />"
						alt="<axis:alt f='axisgca011' c='CCRUCEDET' lit='9910378' />" name="CCRUCEDET" id="CCRUCEDET"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca011" c="CCRUCEDET" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca011" c="BLANCO" lit="1000348" /> -
							</option>
							<c:if test="${__formdata.DETGCA_CONCILIACIONDET.CCRUCE == 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_6}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>
							<c:if test="${__formdata.DETGCA_CONCILIACIONDET.CCRUCE == 7}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_7}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>
							
							<c:if test="${__formdata.DETGCA_CONCILIACIONDET.CCRUCE < 6}">
								<c:forEach var="clase" items="${requestScope.LS_CCRUCEDET_NO6NO7}">
									<option value="${clase.CATRIBU}"
										<c:if test="${clase.CATRIBU == __formdata.DETGCA_CONCILIACIONDET.CCRUCEDET}">selected</c:if>>${clase.TATRIBU}</option>
								</c:forEach>
							</c:if>
					</select></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca011" c="TOBSERVA">
					<td colspan="2"><span class="bold"><axis:alt f="axisgca011" c="TOBSERVA"
								lit="101162"></axis:alt></span><br /> <textarea cols="100" rows="5"  name="TOBSERVA" id="TOBSERVA"
						 class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca011" c="TOBSERVA" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca011" c="TOBSERVA" lit="101162" />"
						title="<axis:alt f="axisgca011" c="TOBSERVA" lit="101162" />" >${__formdata.DETGCA_CONCILIACIONDET.TOBSERVA}</textarea></td>
				</axis:ocultar>

			</tr>
			<tr>
				<td></td>
				<td><input type="button" class="boton" id="BT_CONCILIA" name="BT_CONCILIA"
					value="<axis:alt f="axisgca011" c="BT_CONCILIA" lit="9910384" />" onclick="f_but_concilia()" /></td>
			</tr>			
			
		</table>


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca011</c:param>
			<c:param name="f">axisgca011</c:param>
			<c:param name="__botones">cancelar,aceptar</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>