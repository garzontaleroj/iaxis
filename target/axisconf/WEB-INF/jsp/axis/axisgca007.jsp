<%/* Revision:# FmoTZgxUzzV2fJt4W5/2aw== # */%>

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
       
            parent.f_aceptar_modal("axisgca007");
        }
		Calendar.setup({
			inputField : "FALTA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FALTA",
			singleClick : true,
			firstDay : 1
		});
		
		
		f_cargar_propiedades_pantalla();

                
	}
        
  function cargar_pantalla_por_clase(){}
  

	function isNumberKey(evt){
       var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode > 31 && (charCode < 48 || charCode > 57))
           return false;
        return true;
   }

	function f_but_cancelar(){
		parent.cerrar_axisgca007();
	}     
	
	
	//Aceptar
	function f_but_aceptar(){
		$("#PARAMA").val(2);
		objUtiles.ejecutarFormulario("axis_axisgca007.do?action=GUARDAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
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
		<c:param name="form">axisgca007</c:param>
	</c:import>







	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> 
		
		
		<input type="hidden" name="SGSFAVCLI" id="SGSFAVCLI" value="${__formdata.SGSFAVCLI}" />
		<input type="hidden" name="PARAMA" id="PARAMA" value="${__formdata.PARAMA}"/>
		<input type="hidden" name="PARAMB" id="PARAMB" value="${__formdata.PARAMB}"/>

		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca007" c="CTIPAGD">
					<td><span class="bold"><axis:alt f="axisgca007" c="CTIPAGD" lit="9901935"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca007' c='CTIPAGD' lit='9901935' />"
						alt="<axis:alt f='axisgca007' c='CTIPAGD' lit='9901935' />" name="CTIPAGD" id="CTIPAGD"
						style="width: 90%;"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca007" c="CTIPAGD" a="isInputText=false&modificable=false"/>>
							<option selected value>-
								<axis:alt f="axisgca007" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="lsttiposagenda" items="${__formdata.PLSTTIPOSAGENDA}">
								<option value="${lsttiposagenda.CTIPAGD}"
									<c:if test="${lsttiposagenda.CTIPAGD == 10}">selected</c:if>>
									${lsttiposagenda.TTIPAGD}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca007" c="IDOBS">
					<td><span class="bold"><axis:alt f="axisgca007" c="IDOBS" lit="89905773"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="IDOBS" id="IDOBS"
						value="${__formdata.DETAGD_OBSERVACIONES.IDOBS}" class="campowidthinput campo campotexto"
						style="width: 90%;" readonly="readonly"
						<axis:atr f="axisgca007" c="IDOBS" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca007" c="IDOBS" lit="89905773" />"
						title="<axis:alt f="axisgca007" c="IDOBS" lit="89905773" />" /></td>
				</axis:ocultar>
			</tr>



			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca007" c="TTITOBS">
					<td><span class="bold"><axis:alt f="axisgca007" c="TTITOBS" lit="100785"></axis:alt></span><br />
						<input type="text" name="TTITOBS" id="TTITOBS"
						value="${__formdata.DETAGD_OBSERVACIONES.TTITOBS}" class="campowidthinput campo campotexto"
						style="width: 90%;"
						<axis:atr f="axisgca007" c="TTITOBS" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca007" c="TTITOBS" lit="100785" />"
						title="<axis:alt f="axisgca007" c="TTITOBS" lit="100785" />" /></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca007" c="TOBS">
					<td colspan="2"><span class="bold"><axis:alt f="axisgca007" c="TOBS" lit="9001197"></axis:alt></span><br />
						<textarea cols="100" rows="10" name="TOBS" id="TOBS" 
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca007" c="TOBS" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca007" c="TOBS" lit="9001197" />"
						title="<axis:alt f="axisgca007" c="TOBS" lit="9001197" />" >${__formdata.DETAGD_OBSERVACIONES.TOBS}</textarea></td>
				</axis:ocultar>
			</tr>

			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca007" c="CCONOBS">
					<td><span class="bold"><axis:alt f="axisgca007" c="CCONOBS" lit="9000715"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca007' c='CCONOBS' lit='9000715' />"
						alt="<axis:alt f='axisgca007' c='CCONOBS' lit='9000715' />" name="CCONOBS" id="CCONOBS"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca007" c="CCONOBS" a="isInputText=false&modificable=false"/>>
							<option selected value>-
								<axis:alt f="axisgca007" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="conceptos" items="${__formdata.PLSTCONCEPTOS}">
								<option value="${conceptos.CATRIBU}"
									<c:if test="${conceptos.CATRIBU == 2}">selected</c:if>>
									${conceptos.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca007" c="FALTA">
					<td><span class="bold"><axis:alt f="axisgca007" c="FALTA" lit="9001192"></axis:alt></span><br />
						<input type="text" name="FALTA" id="FALTA" size="15" class="campo campotexto"
						style="width: 70%;" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DETAGD_OBSERVACIONES.FALTA}"/>"
						title="<axis:alt f='axisgca007' c='FALTA' lit='9001192'/>"
						alt="<axis:alt f='axisgca007' c='FALTA' lit='9001192'/>"
						<axis:atr f="axisgca007" c="FALTA" a="formato=fecha&modificable=true&obligatorio=true"/> /> <a
						style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FALTA" alt="<axis:alt f="axisgca007" c="FALTA" lit="9001192"/>"
									title="<axis:alt f="axisgca007" c="FALTA" lit="9001192" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>
				
				<axis:ocultar dejarHueco="false" f="axisgca007" c="CUSUALT">
					<td><span class="bold"><axis:alt f="axisgca007" c="CUSUALT" lit="9001630"></axis:alt></span><br />
						<input type="text" name="CUSUALT" id="CUSUALT"
						value="${__formdata.DETAGD_OBSERVACIONES.CUSUALT}" class="campowidthinput campo campotexto"
						style="width: 90%;"
						<axis:atr f="axisgca007" c="CUSUALT" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca007" c="CUSUALT" lit="9001630" />"
						title="<axis:alt f="axisgca007" c="CUSUALT" lit="9001630" />" /></td>
				</axis:ocultar>
				
			</tr>
		</table>

		<br /> <br />




		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca007</c:param>
			<c:param name="f">axisgca007</c:param>
			<c:param name="__botones">cancelar,aceptar</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
