
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
		
		Calendar.setup({
			inputField : "FDOCINI",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDOCINI",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FDOCFIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDOCFIN",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FCONTINI",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCONTINI",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FCONTFIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCONTFIN",
			singleClick : true,
			firstDay : 1
		});
		
		Calendar.setup({
			inputField : "PERCORTE",
			ifFormat : "%d/%m/%Y",
			button : "icon_PERCORTE",
			singleClick : true,
			firstDay : 1
		});
		
		f_cargar_propiedades_pantalla();
                
	}
        
	
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_cancelar(){
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisgca013", "cancelar", document.miForm, "_self");
	}     
	

	//**********************************************//
	
	//Buscar
	function f_but_buscar(){		
		objUtiles.ejecutarFormulario("axis_axisgca013.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	} 
	
	

	
	function f_cerrar_axisgca014(){
		objUtiles.cerrarModal("axisgca014");
	}
	
	function f_abrir_axisgca014(CFICHERO,TFICHERO, TCOLORI, TCOLDEST, TDESCOLM ){
		
		objDom.setVisibilidadPorId('but_cerrar_modal_axisgca014', 'hidden');
		objUtiles.abrirModal('axisgca014', 'src', 'modal_axisgca014.do?operation=form&CFICHERO='+CFICHERO+'&TFICHERO='+TFICHERO+'&TCOLORI='+TCOLORI+'&TCOLDEST='+TCOLDEST+'&TDESCOLM='+TDESCOLM);
	}
	
	function f_aceptar_axisgca014(){
		objUtiles.cerrarModal("axisgca014");
		objUtiles.ejecutarFormulario("axis_axisgca013.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);

	}

	
	
	
	
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisgca013" c="TITULO" lit="89905796" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisgca013" c="TITULO" lit="89905796" />
		</c:param>
		<c:param name="form">axisgca013</c:param>
	</c:import>



	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisgca013" c="TITULO" lit="89905796" />
		</c:param>
		<c:param name="nid" value="axisgca014" />
	</c:import>



	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		
	


		<table class="seccion" style="width: 90%;" align="center">

			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca013" c="CFICHERO">
					<td><span class="bold"><axis:alt f="axisgca013" c="CFICHERO" lit="9910335"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca013' c='CFICHERO' lit='9910335' />"
						alt="<axis:alt f='axisgca013' c='CFICHERO' lit='9910335' />" name="CFICHERO" id="CFICHERO"
						size="1" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca013" c="CFICHERO" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca013" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${__formdata.LIST_FICHEROS}">
								<option value="${clase.CFICHERO}"
									<c:if test="${__formdata.CFICHERO == clase.CFICHERO}">selected</c:if>>
									${clase.TDESCRIP}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>


				<td></td>
				<td></td>
			</tr>

		</table>

		<br /> <br />

		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca003" c="TITRES" lit="111046"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca013" c="TFICHERO" lit="1000574" />
					</c:set> 
					<c:set var="title1">
						<axis:alt f="axisgca013" c="TCOLORI" lit="89905801" />
					</c:set> 
					<c:set var="title2">
						<axis:alt f="axisgca013" c="TCOLDEST" lit="89905802" />
					</c:set>
					<c:set var="title3">
						<axis:alt f="axisgca013" c="TDESCOLM" lit="89905803" />
					</c:set>
					<div class="displayspaceGrande">
						<display:table name="${__formdata.LIST_MAPEO}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca013.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="TFICHERO" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TFICHERO}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="TCOLORI" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TCOLORI_A}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="TCOLDEST" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TCOLDEST}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="TDESCOLM" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TDESCOLM}</div>
							</display:column>
							<display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:2%;" >
								<div class="dspIcons">
								<axis:visible f="axisgca013" c="BUT_MODIFICAR" >
                                     <a href="javascript:f_abrir_axisgca014(${ROW.CFICHERO},'${ROW.TFICHERO}', '${ROW.TCOLORI}'  ,'${ROW.TCOLDEST}','${ROW.TDESCOLM}')"><img border="0" alt="<axis:alt f='axisctr306' c='EDITAR' lit='9908074'/>"  
                                        title="<axis:alt f='axisgca014' c='EDITAR_TOT' lit='9908074'/>" src="images/lapiz.gif"/></a>
                                </axis:visible>
                                </div>

							</display:column>

						</display:table>
					</div></td>
			</tr>
		</table>

	


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca013</c:param>
			<c:param name="f">axisgca013</c:param>
			<c:param name="f">axisgca013</c:param>
			<c:param name="__botones">cancelar,buscar</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>