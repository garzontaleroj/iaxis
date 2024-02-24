<%/* Revision:# HwRKKpVmOEdkYyIxW1C9iw== # */%>

<%
	/*
	*  Fichero: axisper047.jsp
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

	function cargar_pantalla_por_clase() {
		f_cargar_propiedades_pantalla();
		
	}

	function isNumberKey(evt)
	   {
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }
	
	
	
	function callBackResponse(response){
		parent.f_but_cerrar_axisper047_c();
	}
	
	function serial(form){
		var elements = document.getElementById(form).elements;
	    var serial="";
	    for(var i = 0 ; i < elements.length ; i++){
	        var item = elements.item(i);
	        serial+="&"+item.name+"="+item.value;        
	    }
	    return serial;
	}	
	function f_but_aceptar() {
		if (objValidador.validaEntrada()) {	
			objAjax.invokeAsyncCGI("axis_axisper047_c.do",
					callBackResponse,
					"operation=aceptarc"+serial("miForm"),
					this, objJsMessages.jslit_actualizando_registro);	
		}
	}
	
	


	function f_but_cancelar() {
		parent.f_but_cerrar_axisper047_c();
	}
	
	


 
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<form name="miForm" id="miForm" action="" method="POST">
		<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisper047" c="TITULO" lit="9902423" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisper047" c="TITULO" lit="9902423" />
			</c:param>
			<c:param name="form">axispers047</c:param>
		</c:import>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
		<input type="hidden" name="SSARLAFT" id="SSARLAFT" value="${__formdata.SSARLAFT}" />
		<input type="hidden" name="NRECLA" id="NRECLA" value="${__formdata.NRECLA}" />

		<div class="separador"></div>

		<table class="seccion" style="width: 90%;" align="center">
			<tbody>
				<tr>
					<td>
						<table class="area">
							<tr>

								<axis:ocultar dejarHueco="false" f="axisper047" c="CANIO">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CANIO" lit="101606"></axis:alt></span><br /> <input
										onkeypress="return isNumberKey(event)" type="text"
										name="CANIO" id="CANIO" value="${__formdata.LISTAARLAFTC.CANIO}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CANIO" 
											a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CANIO" lit="101606" />"
										title="<axis:alt f="axisper047" c="CANIO" lit="101606" />" />
									</td>
								</axis:ocultar>
								
								
								<axis:ocultar dejarHueco="false" f="axisper047" c="CRAMO">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CRAMO" lit="100784"></axis:alt></span><br /> <input
										type="text" name="CRAMO" id="CRAMO"
										value="${__formdata.LISTAARLAFTC.CRAMO}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CRAMO" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CRAMO" lit="100784" />"
										title="<axis:alt f="axisper047" c="CRAMO" lit="100784" />" />
									</td>
								</axis:ocultar>
								
								

								<axis:ocultar dejarHueco="false" f="axisper047" c="TCOMPANIA">
									<td><span class="bold"><axis:alt f="axisper047"
												c="TCOMPANIA" lit="9901223"></axis:alt></span><br /> <input
										type="text" name="TCOMPANIA" id="TCOMPANIA"
										value="${__formdata.LISTAARLAFTC.TCOMPANIA}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="TCOMPANIA" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="TCOMPANIA" lit="9901223" />"
										title="<axis:alt f="axisper047" c="TCOMPANIA" lit="9901223" />" />
									</td>
								</axis:ocultar>

							</tr>

							<tr>

								<axis:ocultar dejarHueco="false" f="axisper047" c="CVALOR">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CVALOR" lit="101159"></axis:alt></span><br /> <input
										onkeypress="return isNumberKey(event)" type="text"
										name="CVALOR" id="CVALOR" value="${__formdata.LISTAARLAFTC.CVALOR}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CVALOR" 
											a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CVALOR" lit="101159" />"
										title="<axis:alt f="axisper047" c="CVALOR" lit="101159" />" />
									</td>
								</axis:ocultar>

								
								<axis:ocultar dejarHueco="false" f="axisper047" c="TRESULTADO">
									<td><span class="bold"><axis:alt f="axisper047"
												c="TRESULTADO" lit="111046"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='TRESULTADO' lit='111046' />"
										alt="<axis:alt f='axisper047' c='TRESULTADO' lit='111046' />"
										name="TRESULTADO" id="TRESULTADO" size="1" onchange=""
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="TRESULTADO" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="clase"
												items="${sessionScope.LS_VALORES_RESSINI}">
												<option value="${clase.CATRIBU}"
													<c:if test="${clase.CATRIBU == __formdata.LISTAARLAFTC.TRESULTADO}">selected</c:if>>${clase.TATRIBU}</option>
											</c:forEach>
									</select></td>
								</axis:ocultar>
								
								<td></td>
							</tr>
						</table>


					</td>
				</tr>
			</tbody>
		</table>
		</center>



		<div class="separador">&nbsp;</div>


		<c:if test="${__formdata.CMODO != 'CONSULTA'}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper047</c:param>
				<c:param name="f">axisper047</c:param>
				<c:param name="__botones">cancelar,aceptar</c:param>
			</c:import>
		</c:if>
		<c:if test="${__formdata.CMODO == 'CONSULTA'}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper047</c:param>
				<c:param name="__botones">cancelar</c:param>
			</c:import>
		</c:if>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
