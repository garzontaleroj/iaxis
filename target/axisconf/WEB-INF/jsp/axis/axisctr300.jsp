<%/* Revision:# CVBhM4DPDgBLqtVSq4i/Cw== # */%>

<%
	/*
	*  Fichero: axisctr300.jsp
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

<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {

	/*	<c:if test="${empty sessionScope.CONTRAGARANTIAS}">
		f_abrir_axiscga001();
		</c:if>*/

		f_cargar_propiedades_pantalla();
	}

//	 	Inicio Bartolo Herrera 08-03-2019 IAXIS-3053
	function f_but_buscar(NRADICA, SPERSON, CAGENTE, NNUMIDE, NOMBRE) {
		f_cerrar_axiscga001();
		
		var ssegurox="${sessionScope.SSEGURO}";
		if(ssegurox==null || ssegurox==""){
			document.miForm.CMODO.value = 'GENERAL';
		}else{
			document.miForm.CMODO.value = 'ALTA_POLIZA';
		}
		console.log(document.miForm.CMODO.value);
		objDom.setValorPorId("SPERSON", SPERSON);
		objDom.setValorPorId("NRADICA", NRADICA);
	
		objUtiles.ejecutarFormulario("axis_axisctr300.do?NRADICAPARAM=" + objDom.getValorPorId("NRADICA")
				+ "&SPERSON=" + SPERSON + "&CAGENTE=" + CAGENTE+"&CMODOPAN="+document.miForm.CMODO.value+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}"+ "&NNUMIDE=" + NNUMIDE+ "&NOMBRE=" + NOMBRE,
				"listarContragarancias", document.miForm, "_self",
				objJsMessages.jslit_cargando);

	}
//	 	Fin Bartolo Herrera 08-03-2019 IAXIS-3053	

	function f_abrir_axiscga001() {
		objUtiles.abrirModal("axiscga001", "src",
				"modal_axiscga001.do?operation=form");
		console.log(document.miForm.CMODO.value);
	}

	function f_ver_detalle(SCONTGAR,SPERSON) {
		
		objUtiles.abrirModal("axisctr511", "src",
				"modal_axisctr511.do?operation=form&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON);
		
	}
	
	function f_cerrar_axisctr511() {

		objUtiles.cerrarModal("axisctr511");
	}


	function f_but_cancelar() {
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisctr300",
				"cancelar", document.miForm, "_self");
		console.log(document.miForm.CMODO.value);
	}

	function f_nuevo() {
		f_abrir_axiscga002();
		console.log(document.miForm.CMODO.value);
		/*
		document.miForm.CMODO.value = 'GENERAL';
		objUtiles.ejecutarFormulario("axis_axiscga002.do?CMODO="
				+ document.miForm.CMODO.value, "form", document.miForm,
				"_self", objJsMessages.jslit_cargando);*/
	}

	function f_abrir_axiscga002() {
		var ssegurox="${sessionScope.SSEGURO}";
		if(ssegurox==null || ssegurox==""){
			document.miForm.CMODO.value = 'NUEVO';//bartolo herrera 13/03/2019
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=form&SCONTGAR=null&SPERSON=null&NMOVIMI=null&CMODOPAN=NUEVO&OPMODO=1&SSEGUROPRODUCCION=${sessionScope.SSEGURO}&TOMADOR_SPERSONX="+document.miForm.TOMADOR_SPERSONX.value+"&TOMADOR_NNUMIDEX="+document.miForm.TOMADOR_NNUMIDEX.value+"&TOMADOR_TNOMBRE1X="+document.miForm.TOMADOR_TNOMBRE1X.value+"&TOMADOR_TAPELLI1X="+document.miForm.TOMADOR_TAPELLI1X.value);
		}else{
			document.miForm.CMODO.value = 'NUEVO';
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=form&SCONTGAR=null&SPERSON=null&NMOVIMI=null&CMODOPAN=ALTA_POLIZA&OPMODO=1&SSEGUROPRODUCCION=${sessionScope.SSEGURO}"+"&TOMADOR_SPERSONX="+document.miForm.TOMADOR_SPERSONX.value+"&TOMADOR_NNUMIDEX="+document.miForm.TOMADOR_NNUMIDEX.value+"&TOMADOR_TNOMBRE1X="+document.miForm.TOMADOR_TNOMBRE1X.value+"&TOMADOR_TAPELLI1X="+document.miForm.TOMADOR_TAPELLI1X.value);
		}
		
		
	}

	function f_consultar(SCONTGAR,NMOVIMI,SPERSON) {
		var ssegurox="${sessionScope.SSEGURO}";
		if(ssegurox==null || ssegurox==""){
			document.miForm.CMODO.value = 'CONSULTA';
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle_consulta&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");
		}else{
			document.miForm.CMODO.value = 'CONSULTA';
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle_consulta&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");
		}
		console.log(document.miForm.CMODO.value);
		
		/*objUtiles.ejecutarFormulario("axis_axiscga002.do?SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODO=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&CMODO=CONSULTA", "detalle_consulta",
				document.miForm, "_self", objJsMessages.jslit_cargando);*/
	}
	function f_editar(SCONTGAR,NMOVIMI,SPERSON) {
		var ssegurox="${sessionScope.SSEGURO}";

		if(ssegurox==null || ssegurox==""){
			document.miForm.CMODO.value = 'GENERAL';
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&NMOVIMI="+NMOVIMI+"&CMODOPAN=GENERAL&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");
		}else{
			document.miForm.CMODO.value = 'ALTA_POLIZA';
			objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&NMOVIMI="+NMOVIMI+"&CMODOPAN=ALTA_POLIZA&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");
		}
		console.log(document.miForm.CMODO.value);
		
		/*objUtiles.ejecutarFormulario("axis_axiscga002.do?SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&NMOVIMI="+NMOVIMI+"&CMODO=GENERAL", "detalle",
				document.miForm, "_self", objJsMessages.jslit_cargando);*/
	}

	function f_mod_tipimp(id, check) {
		objDom.setValorPorId("SELEC_" + id, ((check.checked) ? 1 : 0));
	}

	function f_cerrar_axiscga001(SPERSON) {

		objUtiles.cerrarModal("axiscga001");
	}

	function f_but_anterior() {
        objUtiles.ejecutarFormulario("axis_axisctr300.do", "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
	function f_but_siguiente() {
    	//Inicio Bartolo Herrera 27-02-2019 IAXIS-2107 ---- IAXIS-2826
    	var exentoContragarantia = new Number('${sessionScope.EXENTO_CONTRAGARANTIA}');
    	var paramCumuloMinimo = new Number('${sessionScope.CUMULO_MINIMO}');
    	var totalCumulo = new Number('${sessionScope.CUMULO}');
    	var nroContragarantias = new Number('${sessionScope.MI_CONTADOR}');
    	var cupoPersona = new Number('${sessionScope.CUPO_PERSONA}');
    	var mensaje = "";
    	var crear = "no";
    	
    	//alert("paramCumuloMinimo = "+paramCumuloMinimo+" - totalCumulo = "+totalCumulo+" - nroContragarantias = "+nroContragarantias+" - cupoPersona = "+cupoPersona);
    	    	
    	if(totalCumulo > paramCumuloMinimo && exentoContragarantia != 1){//si el cumulo total del cliente es mayor al cumulo minimo configurado y el cliente no esta exento de contragarantia
    		
    		if(cupoPersona <= totalCumulo && cupoPersona > 0){//si el cliente tiene cupo y el cupo es menor o igual a su cumulo total 
				mensaje = "Debe constituir contragarantia adicional con codeudor.";
			}else{
				if(nroContragarantias < 1){//si el cliente no tiene contragarantias
					mensaje = "La póliza está sin respaldo de contragarantía, ¿Desea crearla?";
					crear = "si";
				}else{
					if( $('#selectedClausula').prop('checked') ) {// si selecciono alguna contragarantia
						objUtiles.ejecutarFormulario("axis_axisctr300.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
	    			}else{//si no selecciono ninguna contragarantia
	    				mensaje = "Debe asociar una contragarantía a la propuesta, ¿Desea realizar la asociación?";
	    			}
				}
			}
    		
    		if(mensaje.length > 0){//si existe un mensaje
	    		var answer = confirm(mensaje);
	            if (!answer){ //si selecciona no o cancelar continua el flujo
	            	objUtiles.ejecutarFormulario("axis_axisctr300.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
	            }else{
	            	if(crear == "si"){ //si selecciona si o aceptar y no tiene contragarantias muestra la pantalla de creacion
	            		f_abrir_axiscga002();
	            	}
	            }
    		}    	
    	}else{
    		objUtiles.ejecutarFormulario("axis_axisctr300.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
    	}
    	//FIN Bartolo Herrera 27-02-2019 IAXIS-2107 ---- IAXIS-2826
    }
	
	// TCS_818 - ACL - 20/02/2019 - Se comenta la linea para el regreso a la pantalla
    function f_but_cerrar_axiscga002(){
    	objUtiles.cerrarModal("axiscga002");
    	// f_but_buscar(null,'${sessionScope.TOMADOR_SPERSON}',null);   
		//inicio Bartolo Herrera 13-03-2019
    	var sperson = '${sessionScope.TOMADOR_SPERSON}';
    	
    	if(sperson == ""){
    		sperson = '${__formdata.SPERSON}';
    	}
    	
        f_but_buscar(null,sperson,null,null,null);   
        
      //FIN Bartolo Herrera 13-03-2019
   }
    
   function validar_seleccion(VALOR,X__SCONTGAR,X__SSEGURO,X__NMOVIMI,X__SPERSON){
	   if(VALOR==true){
		   f_agregar_polcon(X__SCONTGAR,X__SSEGURO,X__NMOVIMI,X__SPERSON);
	   }else{
		   f_eliminar_polcon(X__SCONTGAR,X__SSEGURO,X__NMOVIMI,X__SPERSON);
	   }
   } 
   
   function f_eliminar_polcon(X__SCONTGAR,X__SSEGURO,X__NMOVIMI,X__SPERSON) {
		objUtiles.ejecutarFormulario("axis_axisctr300.do?X__SCONTGAR=" + X__SCONTGAR + "&X__SSEGURO=" + X__SSEGURO + "&X__NMOVIMI="+ X__NMOVIMI+"&X__SPERSON="+X__SPERSON, "del_pol",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	function f_agregar_polcon(X__SCONTGAR,X__SSEGURO,X__NMOVIMI,X__SPERSON) {
		objUtiles.ejecutarFormulario("axis_axisctr300.do?X__SCONTGAR=" + X__SCONTGAR + "&X__SSEGURO=" + X__SSEGURO + "&X__NMOVIMI="+ X__NMOVIMI+"&X__SPERSON="+X__SPERSON, "ins_pol",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}
</script>


</head>
<body onload="f_onload()">

	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="TIT_001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axiscga001" />
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr511" c="TIT_001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisctr511" />
	</c:import>

	
	<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisadm001" c="TITULO" lit="9908805" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisadm001" c="TITULO" lit="9908805" />
			</c:param>
			<c:param name="form">axisctr300</c:param>
		</c:import>
		
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9908805" />
		</c:param>
		<c:param name="nid" value="axiscga002" />
	</c:import>

	<form name="miForm" action="" method="POST">

		<input type="hidden" id="CMODO" name="CMODO_REL" value="" /> <input
			type="hidden" id="SPERSON" name="SPERSON_REL"
			value="${__formdata.SPERSON}" /> 
			
			<input
			type="hidden" id="NRADICA" name="NRADICA"
			value="${__formdata.NRADICA}" />
			
			
			
			<input type="hidden" id="TOMADOR_SPERSONX" name="TOMADOR_SPERSONX" value="${sessionScope.TOMADOR_SPERSON}" />
			<input type="hidden" id="TOMADOR_NNUMIDEX" name="TOMADOR_NNUMIDEX" value="${sessionScope.TOMADOR_NNUMIDE}" />
			<input type="hidden" id="TOMADOR_TNOMBRE1X" name="TOMADOR_TNOMBRE1X" value="${sessionScope.TOMADOR_TNOMBRE1}" />
			<input type="hidden" id="TOMADOR_TAPELLI1X" name="TOMADOR_TAPELLI1X" value="${sessionScope.TOMADOR_TAPELLI1}" />
			
			<input type="hidden"
			name="operation" value="" />
			
		<table class="mainTableDimensions base">
			<tr>
				<td>
					<div class="titulo">
						<div style="float: left">
							<img src="images/flecha.gif" />
							<axis:alt f="axisctr300" c="titulos" lit="9908803" />
							<c:if test="${sessionScope.TOMADOR_SPERSON ==null}">
									<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axiscga001()" style="cursor: pointer" />
									
<!-- 				Inicio Bartolo Herrera 11-03-2019 IAXIS-3053 -->
									<c:if test="${__formdata.NNUMIDE != null}">
										
										${__formdata.NNUMIDE} - ${__formdata.NOMBRE}
									
									</c:if>
<!-- 				fin Bartolo Herrera 11-03-2019 IAXIS-3053 -->

							</c:if>
						</div>
						<div style="float: right">
						<!--INI IAXIS-4789--> 
						<!-- EDICION CABECERA SINIESTRO -->
							<axis:visible f="axisctr300" c="BT_NUEVA_CON">
								<img id="new" border="0" src="images/new.gif"
									title="<axis:alt f="axisctr300" c="NEW" lit="104825"/>"
									alt="<axis:alt f="axisctr300" c="NEW" lit="104825"/>"
									onclick="f_nuevo()" style="cursor: pointer" />
							</axis:visible>
						</div>
						<!--FIN IAXIS-4789--> 

					</div>

					<div class="separador">&nbsp;</div> 
					<c:if test="${sessionScope.TOMADOR_SPERSON!=null}">
						<c:set var="title0"></c:set>
					</c:if>
					 
					<c:set var="title1">
						<axis:alt f="axisctr300" c="SCONTGAR" lit="9908801" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisctr300" c="TDESCRIP" lit="101761" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisctr300" c="TTIPO" lit="100565" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisctr300" c="TCLASE" lit="9904874" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisctr300" c="TTENEDOR" lit="89906063" /> <!-- Bartolo Herrera 08-03-2019 IAXIS-3053 -->
					</c:set> <c:set var="title6">
						<axis:alt f="axisctr300" c="TESTADO" lit="100587" />
					</c:set> <c:set var="title7">
						<axis:alt f="axisctr300" c="IVALOR" lit="101159" />
					</c:set> <c:set var="title80">
						<axis:alt f="axisctr300" c="EDITAR" lit="9901356" />
					</c:set> <c:set var="title8">
						<axis:alt f="axisctr300" c="BUSCAR" lit="100797" />
					</c:set> <%
 	int contador = 0;
 %>
 
					<c:set var="title9">
						<axis:alt f="axisctr300" c="VER" lit="9000968" />
					</c:set>

					<div class="seccion displayspaceGrande" style="width: 98%">
					
<!-- 				Inicio Bartolo Herrera 11-03-2019 IAXIS-3053 -->

						<display:table name="${sessionScope.CONTRAGARANTIAS}"
							id="TB_CONTRAGARANTIAS" export="false" class="dsptgtable"
							pagesize="12" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisctr300.do?paginar=true" sort="list"
							cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<c:if test="${sessionScope.TOMADOR_SPERSON!=null}">
								<display:column title="${title0}" sortable="false"
									sortProperty="CACTIVO" headerClass="sortable" media="html"
									autolink="false">
									<div class="dspIcons">
										<input
											onclick="javascript:validar_seleccion(this.checked,'${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}','${sessionScope.SSEGURO}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.NMOVIMI}','${sessionScope.TOMADOR_SPERSON}')"
											<c:if test="${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.CACTIVO==1}">checked</c:if>
											<%-- Ini CONF-1379_QT_2036 --%>
											<c:if test="${sessionScope.MI_CONTADOR==1}">checked</c:if>
											<%-- Fin CONF-1379_QT_2036 --%>
											type="checkbox" id="selectedClausula" name="selectedClausula"
											
											<%--disabled="disabled"--%>
											<%-- <c:if test="${__configform.axisctr300__NRECSELEC__modificable == 'false'}">readonly</c:if> --%> />
										<input type="hidden" name="IDCUENTA_<%= contador %>"
											id="IDCUENTA_<%= contador %>"
											value="${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}" />
										<input type="hidden" name="NREC_<%= contador %>"
											id="NREC_<%= contador %>"
											value="${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}" />
										<input type="hidden" name="SELEC_<%= contador %>"
											id="SELEC_<%= contador %>"
											value="${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.CACTIVO}" />
									</div>
								</display:column>
							</c:if>
							<display:column title="${title1}" 
								sortProperty="OB_IAX_CONTRAGARAN.SCONTGAR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}</div>
							</display:column>
							<display:column title="${title2}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.TDESCRIP" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.TDESCRIP}</div>
							</display:column>
							<display:column title="${title3}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.TTIPO" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.TTIPO}</div>
							</display:column>
							<display:column title="${title4}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.TCLASE" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.TCLASE}</div>
							</display:column>
							<display:column title="${title5}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.TTENEDOR" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.TTENEDOR}</div>
							</display:column>
							<display:column title="${title6}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.TESTADO" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.TESTADO}</div>
							</display:column>
							<display:column title="${title7}" sortable="true"
								sortProperty="OB_IAX_CONTRAGARAN.IVALOR" headerClass="sortable" media="html"
								autolink="false">
								<div class="dspText">${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.IVALOR}</div>
							</display:column>
							
<!-- 				FIN Bartolo Herrera 11-03-2019 IAXIS-3053 -->
							
							<display:column title="${title80}"
								headerClass="headwidth5 sortable" style="width:5%" media="html"
								autolink="false">
								<div class="dspIcons">
								<!-- ini IAXIS-5256 -->
									<axis:visible f="axisctr300" c="BT_EDIT_CON">
										<img id="find" border="0" src="images/lapiz.gif"
											onclick="javascript:f_editar('${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.NMOVIMI}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SPERSON}');"
											style="cursor: pointer" />
									</axis:visible>
								<!-- fin IAXIS-5256 -->
								</div>
							</display:column>
							<display:column title="${title8}"
								headerClass="headwidth5 sortable" style="width:5%" media="html"
								autolink="false">
								<div class="dspIcons">
									<img id="find" border="0" src="images/find.gif"
										onclick="javascript:f_consultar('${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.NMOVIMI}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SPERSON}');"
										style="cursor: pointer" />
								</div>
							</display:column>
							
							<display:column title="${title9}"
								headerClass="headwidth5 sortable" style="width:5%" media="html"
								autolink="false">
								<div class="dspIcons">
									<img id="find" border="0" src="images/mas.gif"
										onclick="javascript:f_ver_detalle('${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SCONTGAR}','${TB_CONTRAGARANTIAS.OB_IAX_CONTRAGARAN.SPERSON}');"
										style="cursor: pointer" />
								</div>
							</display:column>

							<%
								contador++;
							%>
						</display:table>
					</div>
				</td>
			</tr>
		</table>

		<div class="separador">&nbsp;</div>
		<c:if test="${sessionScope.multiPantalla==false || sessionScope.multiPantalla==null}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisctr300</c:param>			
				<c:param name="__botones">cancelar</c:param>
			</c:import>
		</c:if>
		<c:if test="${sessionScope.multiPantalla==true}">
			<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisctr300</c:param>
            <c:param name="f">axisctr300</c:param>
            <c:param name="f">axisctr300</c:param>
            <c:param name="__botones">cancelar,anterior,siguiente</c:param> 
	        </c:import>
        </c:if>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
