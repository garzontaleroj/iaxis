<%/* Revision:# QYzonnEKavEHKXQXILTv2w== # */%>

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

	$(document).ready(function() {

	});
	
	//INI - AXIS-3999 -JRVG- 30/06/2020
	 function f_gestioagenda(CMODO,IDOBS,CTIPAGD, modificacion){
	        NSINIES = $("#NSINIES_R").val();
	        objUtiles.abrirModal("axisagd002","src","modal_axisagd002.do?operation=init&CMODO="+CMODO+"&IDOBS="+IDOBS+"&CTIPAGD="+CTIPAGD+"&NSINIES="+NSINIES+"&MODIFICACION="+modificacion+"&PANTALLA=axisgca003"); 
	    }
	 function f_cerrar_gestioagenda() {
	        objUtiles.cerrarModal("axisagd002");
		}
	//FIN - AXIS-3999 -JRVG- 30/06/2020
	
	//Nuevo
	function f_but_cancelar() {
		parent.f_cerrar_axisgca003();
	}
	//Exportar
	function f_but_nuevo() {
		$("#TTITOBS").val();
		$("#TOBS").val();
		callbackAjax();
	}
	function f_but_guardar(){
	//INI - AXIS-3999 -JRVG- 30/06/2020
		var TOBS= objDom.getValorPorId("TOBS");
		if (TOBS.length>=3000){
   		 alert('El texto de apunte no debe pasar los 3000 Caracteres.');
   	   }else{
		objAjax.invokeAsyncCGI("axis_axisgca003.do", callbackAjax, "operation=form&action=GUARDAR"
				+"&NSINIES_R="+$("#NSINIES_R").val()
				+"&NTRAMIT_R="+$("#NTRAMIT_R").val()
				+"&NPOLIZA_R="+$("#NPOLIZA_R").val()
				+"&TTITOBS="+$("#TTITOBS").val()
				+"&TOBS="+$("#TOBS").val() 				
				, this, objJsMessages.jslit_actualizando_registro);
   	   }
    //FIN - AXIS-3999 -JRVG- 30/06/2020
	}
	
	function callbackAjax(){location.reload();}
	//INI - AXIS 3999 - 13/5/2019 - ML - CREACION DE FUNCION PARA LA VISUALIZACION DE ARCHIVOS 
	function cargarArchivos (idObservacion) {		
		objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?operation=form&IDOBS="+idObservacion);
	}
    function f_cerrar_axisgedox() {
        objUtiles.cerrarModal("axisgedox");
	}
	//FIN - AXIS 3999 - 13/5/2019 - ML - CREACION DE FUNCION PARA LA VISUALIZACION DE ARCHIVOS
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
     <!-- INI - AXIS-3999 -JRVG- 30/06/2020 -->
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisagd002" c="TIT_AXISAGD002" lit="9001247" /></c:param>
            <c:param name="nid" value="axisagd002"></c:param>
        </c:import>
    <!-- FIN - AXIS-3999 -JRVG- 30/06/2020 -->
	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910402" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910402" />
		</c:param>
		<c:param name="form">axisgca003</c:param>
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
    	<c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
    </c:import>


	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		
		<input type="hidden" id="NSINIES_R" name="NSINIES_R" value="${__formdata.NSINIES_R}" />
		<input type="hidden" id="NTRAMIT_R" name="NTRAMIT_R" value="${__formdata.NTRAMIT_R}" />
		<input type="hidden" id="NPOLIZA_R" name="NPOLIZA_R" value="${__formdata.NPOLIZA_R}" />

		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca003" c="TITGEN" lit="103593"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca003" c="NSINIES" lit="100585" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca003" c="NTRAMIT" lit="9000908" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca003" c="NPOLIZA" lit="101273" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca003" c="NCERTIF" lit="104595" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca003" c="TTOMADOR" lit="9908119" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca003" c="TASEGURADO" lit="101028" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca003" c="TBENEFICIARIO" lit="9001911" />
					</c:set> <c:set var="title7">
						<axis:alt f="axisgca003" c="TAGENTE" lit="9908109" />
					</c:set>

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.GCA_CONCILIACIONCABS}" id="ROW" export="false" class="dsptgtable"
							pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca003.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="NSINIES_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NSINIES_R}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="NTRAMIT_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NTRAMIT_R}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="NPOLIZA_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NPOLIZA_R}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="NCERTIF_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NCERTIF_R}</div>
							</display:column>

							<display:column title="${title4}" sortProperty="TTOMADOR_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TTOMADOR_R}</div>
							</display:column>

							<display:column title="${title5}" sortProperty="TASEGURADO_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TASEGURADO_R}</div>
							</display:column>

							<display:column title="${title6}" sortProperty="TBENEFICIARIO_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TBENEFICIARIO_R}</div>
							</display:column>

							<display:column title="${title7}" sortProperty="TAGENTE_R" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TAGENTE_R}</div>
							</display:column>

						</display:table>
					</div></td>
			</tr>
		</table>

		<br /> <br />
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca003" c="TITAPUNTES" lit="9910402"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca003" c="IDOBS_GR" lit="9001189" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca003" c="TTITOBS_GR" lit="9001196" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca003" c="FALTA_GR" lit="105887" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca003" c="CUSUALT_GR" lit="9001630" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca003" c="TOBS_GR" lit="9001197" />
					</c:set>
					<!-- INI - AXIS 3999 - ML - 13/5/2019 - COLUMNA ADICIONAL PARA FICHERO -->
					<c:set var="title5">
						<axis:alt f="axisgca003" c="TFILE" lit="1000574" />
					</c:set>
					<!-- FIN - AXIS 3999 - ML - 13/5/2019 - COLUMNA ADICIONAL PARA FICHERO -->

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.LISTSIN_APUNTES_REC}" id="ROW" export="false" class="dsptgtable"
							pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca003.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="IDOBS_GR" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.IDOBS_GR}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="TTITOBS_GR" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TTITOBS}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="FALTA_GR" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.FALTA_GR}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="CUSUALT_GR" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.CUSUALT_GR}</div>
							</display:column>
							<!-- INI - AXIS 3999 - 13/5/2019 - ML - BOTON PARA VER Y ADJUNTAR ARCHIVOS -->
							<display:column title="${title5}" sortProperty="TFILE" sortable="false" headerClass="sortable" media="html" autolink="false">
								<div class="dspText"></div>
								<a type="button" style="color:blue;" href="#" onclick="cargarArchivos(${ROW.IDOBS_GR})">Archivos Adjuntos</a>
							</display:column>
							
							<!--INI - AXIS-3999 -JRVG- 30/06/2020 -->
							<display:column title="${title4}" sortProperty="TOBS_GR" sortable="true" headerClass="sortable" media="html" autolink="false">
                                    <div class="dspIcons" id="BT_CONS_AGENDA" align="left"><img border="0" alt="<axis:alt f="axisgca003" c="TOBS_GR" lit="9001218"/>" 
                                         title1="<axis:alt f="axisgca003" c="TOBS_GR" lit="9001218"/>" src="images/mas.gif" style="cursor:pointer;" onclick="f_gestioagenda('MODIF_SINIESTROS',${ROW.IDOBS_GR},4,'1')"/> 
                                    </div>
                             </display:column>
                             <!--FIN - AXIS-3999 -JRVG- 30/06/2020 -->               
							<!-- FIN - AXIS 3999 - 13/5/2019 - ML - BOTON PARA VER Y ADJUNTAR ARCHIVOS -->
						</display:table>
					</div></td>
			</tr>
		</table>

		<br /> <br />
		<table class="seccion" style="width: 90%;" align="center"> 
			<tr>
				<!--INI - AXIS 3999 - 14/05/2019 - ML - MAXLENGTH SEGUN DATABASE -->
				<axis:ocultar dejarHueco="false" f="axisgca003" c="TTITOBS">					
					<td><span class="bold"><axis:alt f="axisgca003" c="TTITOBS" lit="100785"></axis:alt></span><br />
						<input maxlength="150" type="text" name="TTITOBS" id="TTITOBS" value="${__formdata.TTITOBS}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca003" c="TTITOBS" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca003" c="TTITOBS" lit="100785" />"
						title="<axis:alt f="axisgca003" c="TTITOBS" lit="100785" />" /></td>					
				</axis:ocultar>
				<!--FIN - AXIS 3999 - 14/05/2019 - ML - MAXLENGTH SEGUN DATABASE -->
			</tr>
			<tr>
				<!--INI - AXIS 3999 - 14/05/2019 - ML - MAXLENGTH SEGUN DATABASE -->
				<!--FIN - AXIS-3999 -JRVG- 30/06/2020 --> 
				<axis:ocultar dejarHueco="false" f="axisgca003" c="TOBS">
					<td><span class="bold"><axis:alt f="axisgca003" c="TOBS" lit="9001197"></axis:alt></span><br />
						<textarea maxlength="3000" cols="100" rows="5" name="TOBS" id="TOBS" value="${__formdata.TOBS}"
							class="campowidthinput campo campotexto" style="width: 90%;"
							<axis:atr f="axisgca003" c="TOBS" a="modificable=true&obligatorio=false"/>
							alt="<axis:alt f="axisgca003" c="TOBS" lit="9001197" />"
							title="<axis:alt f="axisgca003" c="TOBS" lit="9001197" />"></textarea></td>
				</axis:ocultar>
				<!--FIN - AXIS-3999 -JRVG- 30/06/2020 --> 
				<!--FIN - AXIS 3999 - 14/05/2019 - ML - MAXLENGTH SEGUN DATABASE -->
			</tr>			
			<tr>
				<td align="right"><input type="button" class="boton" id="BT_GUARDAR" name="BT_GUARDAR"
					value="<axis:alt f="axisgca003" c="BT_FILTRO" lit="1000081" />" onclick="f_but_guardar()" /></td>
			</tr>
		</table>

		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca003</c:param>
			<c:param name="f">axisgca003</c:param>
			<c:param name="__botones">cancelar,nuevo</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>