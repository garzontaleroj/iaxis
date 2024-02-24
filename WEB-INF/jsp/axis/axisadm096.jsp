<%/* Revision:# cg6wHR2vZv6cgcAomfE/Ug== # */%>
<%
	/*
	*  Fichero: axiadm096.jsp
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

<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {

		f_cargar_propiedades_pantalla();
		document.miForm.list_CEMPRES.focus();
		f_cargar_checks();
	}

	function f_but_aceptar() {
		objUtiles.ejecutarFormulario("axis_axisadm096.do", "aceptar",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_but_cancelar() {
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisadm096",
				"cancelar", document.miForm, "_self");
	}

	function f_but_100797() { //f_but_buscar
		//Si la validación es correcta (true), ejecutamos la acción
		if (objValidador.validaEntrada()) {
			objUtiles
					.ejecutarFormulario("axis_axisadm096.do",
							"busqueda_recibo", document.miForm, "_self",
							"<axis:alt f='axisadm096' c='busqueda_recibo' lit='9000986' />");
			console.log("ESS");
		}
	}

	function f_onchange_sproduc(SPRODUC) {
		objDom.setValorPorId("SPRODUCSEL", SPRODUC);

	}
	function f_onchange_empresa(CEMPRES) {
		objDom.setValorPorId("CEMPRES", CEMPRES);
		objUtiles.ejecutarFormulario("axis_axisadm096.do", "form",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	function f_onchange_ramo(CRAMO) {
		console.log(CRAMO);
		objDom.setValorPorId("CRAMO", CRAMO);
		objUtiles.ejecutarFormulario("axis_axisadm096.do", "form",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}

	/* ***************************************************************************************************** */
	/* ***************************************** UNIFICAR RECIBOS ****************************************** */
	/* ***************************************************************************************************** */
	function ChequearTodosBut() {

		for (var i = 0; i < document.forms["miForm"].elements.length; i++) {

			var elemento = document.forms[0].elements[i];
			if (elemento.type == "checkbox") {
				elemento.checked = true;

			}

			var x = elemento.id;
			if (x.match(/SELEC_.*/))
				objDom.setValorPorId(elemento.id, 1);

		}

		//var elem = document.getElementById("CUENTA");
		var elementCount = document.miForm.CUENTA.value;

		//alert(elementCount);
		for (var j = 0; j < elementCount; j++) {
			var ID = eval("document.miForm.IDCUENTA_" + j + ".value");
			var ISALDO = eval("document.miForm.NREC_" + j + ".value");

			//alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);

		}
	}

	function DesChequearTodosBut() {
		for (var i = 0; i < document.forms["miForm"].elements.length; i++) {
			var elemento = document.forms[0].elements[i];
			if (elemento.type == "checkbox") {
				elemento.checked = false;
			}

			var x = elemento.id;
			if (x.match(/SELEC_.*/))
				objDom.setValorPorId(elemento.id, 0);
		}

		//var elem = document.getElementById("CUENTA");
		var elementCount = document.miForm.CUENTA.value;

		//alert(elementCount);
		for (var j = 0; j < elementCount; j++) {
			var ID = eval("document.miForm.IDCUENTA_" + j + ".value");
			var ISALDO = eval("document.miForm.NREC_" + j + ".value");

			//alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);

		}

	}

	function f_mod_tipimp(id, check) {
		// var check = document.getElementById("selectedClausula_"+id);

		objDom.setValorPorId("SELEC_" + id, ((check.checked) ? 1 : 0));

		//alert(" Valores: id  "+id+ " , ctimp " + ctipimp + " , saldo " + selsaldo + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);

		//if (objValidador.validaEntrada()) {
		//    if (!objUtiles.estaVacio(selsaldo) && selsaldo != 0 && selsaldo != 1){
		//        sel = selsaldo.checked ? 1 : 0;

		//    }

		// }

	}
	
	function f_abrir_axisctr014() {
        objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
    }
	function f_cerrar_axisctr014() {
        objUtiles.cerrarModal("axisctr014")
    } 
	
	function f_aceptar_axisctr014 (CAGENTE){
        objDom.setValorPorId("CAGENTE", CAGENTE);
        f_cerrar_axisctr014();
        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
    }
	function callbackAjaxCambiarAgente(ajaxResponseText){
        var doc=objAjax.domParse(ajaxResponseText);

        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
	        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
	        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
	        objDom.setValorPorId("TCAGENTE", CAGENTEformateado);
	        objDom.setValorPorId("TAGENTE", NOMBREformateado);
        }         
        
    }
	
	function f_limpiar_axisctr014(){
		  
		objDom.setValorPorId("TCAGENTE", "");
		objDom.setValorPorId("TAGENTE", "");
		objDom.setValorPorId("CAGENTE", "");
	} 

	    function f_chequearBusqueda(checkObject){    

        var elemento = checkObject.checked ? 1 : 0;

        switch(checkObject.name){
            case "ABRECIBO": 
                document.miForm.HABRECIBO.value = elemento;                
                break
            case "SOFERTA": 
                document.miForm.HSOFERTA.value = elemento;
                break        
            case "PCMODIF": 
                document.miForm.HPCMODIF.value = elemento;
                break        
            case "PPDLEGAL": 
                document.miForm.HPPDLEGAL.value = elemento;
                break        
            case "PPJUDI": 
                document.miForm.HPPJUDI.value = elemento;
                break        
            case "PPGUNICA": 
                document.miForm.HPPGUNICA.value = elemento;
                break        
            case "PPESTATAL": 
                document.miForm.HPPESTATAL.value = elemento;
                break        
        }        
    }
    
    function f_cargar_checks(){
        if(document.miForm.HABRECIBO.value == 1){
            document.miForm.ABRECIBO.checked = true;  
        }
        if(document.miForm.HSOFERTA.value == 1){
            document.miForm.SOFERTA.checked = true;  
        }
        if(document.miForm.HPCMODIF.value == 1){
            document.miForm.PCMODIF.checked = true;  
        }
        if(document.miForm.HPPDLEGAL.value == 1){
            document.miForm.PPDLEGAL.checked = true;  
        }
        if(document.miForm.HPPJUDI.value == 1){
            document.miForm.PPJUDI.checked = true;  
        }
        if(document.miForm.HPPGUNICA.value == 1){
            document.miForm.PPGUNICA.checked = true;  
        }
        if(document.miForm.HPPESTATAL.value == 1){
            document.miForm.PPESTATAL.checked = true;  
        }
    }
</script>
</head>
<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_100797() }">

	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" name="PESTREC"
			id="PESTREC" value="${__formdata.PESTREC}" /> <input type="hidden" id="PCTIPCOB" name="PCTIPCOB"
			value="${__formdata.PCTIPCOB}" /> <input type="hidden" id="CRAMO" name="CRAMO"
			value="${__formdata.CRAMO}" /> <input type="hidden" id="TRAMO" name="TRAMO"
			value="${__formdata.TRAMO}" /> <input type="hidden" id="SPRODUCSEL" name="SPRODUCSEL"
			value="${__formdata.SPRODUCSEL}" /> <input type="hidden" id="tipo" name="tipo"
			value="${__formdata.tipo}" /> <input type="hidden" name="SPERSON" id="SPERSON"
			value="${__formdata.SPERSON}" /> <input type="hidden" name="CAGENTE"
			value="${__formdata.CAGENTE}" id="CAGENTE"> <input type="hidden" name="CCONDICION"
			id="CCONDICION" value="${__formdata.CCONDICION}"> <input type="hidden" name="TCONDICION"
			id="TCONDICION" value="${__formdata.TCONDICION}">
            <input type="hidden" name="HABRECIBO" id="HABRECIBO" value="${__formdata.HABRECIBO}"/>
            <input type="hidden" name="HSOFERTA" id="HSOFERTA" value="${__formdata.HSOFERTA}"/>
            <input type="hidden" name="HPCMODIF" id="HPCMODIF" value="${__formdata.HPCMODIF}"/>
            <input type="hidden" name="HPPDLEGAL" id="HPPDLEGAL" value="${__formdata.HPPDLEGAL}"/>
            <input type="hidden" name="HPPJUDI" id="HPPJUDI" value="${__formdata.HPPJUDI}"/>
            <input type="hidden" name="HPPGUNICA" id="HPPGUNICA" value="${__formdata.HPPGUNICA}"/>
            <input type="hidden" name="HPPESTATAL" id="HPPESTATAL" value="${__formdata.HPPESTATAL}"/>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" />
			</c:param>
			<c:param name="nid" value="axisctr014" />
		</c:import>

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisadm001" c="TITULO" lit="9908855" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisadm001" c="TITULO" lit="9908855" />
			</c:param>
			<c:param name="form">axisadm096</c:param>
		</c:import>
		
		<!-- Area de campos  -->
		<table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisadm096" c="titulo" lit="1000178" />
					</div> <!--campos-->

					<table class="seccion">
						<tr>
							<td>
								<!-- Área 1 -->
								<table class="area" align="center">
									<tr>

										<axis:visible f="axisadm096" c="CEMPRES">
											<!-- TODO C -->
											<td class="campocaja" colspan="2"><b id="label_CEMPRES"><axis:alt f="axisadm096"
														c="CEMPRES" lit="101619" /></b> <br /> <select
												title="<axis:alt f='axisadm096' c='CEMPRES' lit='101619' />"
												alt="<axis:alt f='axisadm096' c='CEMPRES' lit='101619' />" name="list_CEMPRES"
												id="list_CEMPRES" size="1" class="campowidthselect campo campotexto_ob"
												onchange="f_onchange_empresa(this.value)"
												<axis:atr f="axisadm096" c="list_CEMPRES" a="modificable=true&obligatorio=false"/>>
													<option value="null">-
														<axis:alt f="axisadm096" c="BLANCO" lit="1000348" /> -
													</option>
													<c:forEach var="empresas" items="${__formdata.T_IAX_EMPRESAS}">
														<option value="${empresas.CEMPRES}"
															<c:choose>
                                                                    <c:when test="${__formdata.selected_CEMPRES == empresas.CEMPRES}">selected</c:when>
                                                                </c:choose>>
															${empresas.TEMPRES}</option>
													</c:forEach>
											</select></td>
										</axis:visible>
										<axis:visible f="axisadm096" c="CRAMO">
											<td class="campocaja"><b><axis:alt f="axisctr019" c="CRAMO" lit="100784"></axis:alt></b><br />
												<select name="ramoProducto" id="ramoProducto" style="width: 200px;" id="ramoProducto"
												size="1" onchange="f_onchange_ramo(this.value)" class="campowidthselect campo">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisadm096" c="BLANCO" lit="1000348" /> -
													</option>
													<c:forEach var="ramos" items="${__formdata.DOM_LSTRAMOS}">
														<option value="${ramos.CRAMO}"
															<c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
															${ramos.TRAMO}</option>
													</c:forEach>
											</select></td>
										</axis:visible>
										<axis:visible f="axisadm096" c="SPRODUC">
											<td class="campocaja" colspan="3"><b><axis:alt f="axisadm001" c="PRODUCTE"
														lit="100829" /></b> <br /> <select name="SPRODUC" id="SPRODUC" size="1"
												class="campowidthselect campo campotexto" style="width: 75%;"
												onchange="f_onchange_sproduc(this.value)">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisadm096" c="BLANCO" lit="1000348" /> -
													</option>
													<c:forEach var="element" items="${__formdata.DOM_LSPRODUCTOS}">
														<option value="${element.SPRODUC}"
															<c:if test="${__formdata.SPRODUC == element.SPRODUC}">selected</c:if>>
															${element.TTITULO}</option>
													</c:forEach>
											</select></td>
										</axis:visible>


									</tr>

									<tr>

										<axis:visible f="axisadm096" c="AGENTETIPO">
											<td class="campocaja" colspan="3"><b><axis:alt f="axisadm096" c="AGENTETIPO"
														lit="9002202" /></b> <br /> <select name="AGENTETIPO" id="AGENTETIPO"
												<axis:atr f="axisadm096" c="AGENTETIPO" a="obligatorio=false&modificable=true&isInputText=false"/>
												size="1" class="campowidthselect campo campotexto" style="width: 75%;">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisadm096" c="AGENTETIPOS" lit="1000348" /> -
													</option>
													<c:forEach var="element" items="${__formdata.LSAGENTESTIPO}">
														<option value="${element.CAGENTE}"
															<c:if test="${__formdata.AGENTETIPO == element.CAGENTE}">selected</c:if>>
															${element.TAGENTE}</option>
													</c:forEach>
											</select></td>
										</axis:visible>
										<axis:ocultar dejarHueco="false" f="axisadm096" c="TCAGENTE">
											<td><span class="campocaja"><b><axis:alt f="axisadm096" c="TCAGENTE" lit="100584"></axis:alt></b></span><br />
												<input type="text" name="TCAGENTE" id="TCAGENTE" value="${__formdata.TCAGENTE}" readonly="readonly"
												class="campowidthinput campo campotexto" style="width: 70%;"
												<axis:atr f="axisadm096" c="TCAGENTE" a="modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="TCAGENTE" lit="100584" />"
												title="<axis:alt f="axisadm096" c="TCAGENTE" lit="100584" />" /><img
												id="IMG_TCAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()"
												style="cursor: pointer" /><img
												id="IMG_DELAGEN_TEXT" border="0" src="images/delete.gif" onclick="f_limpiar_axisctr014()"
												style="cursor: pointer" /></td>
										</axis:ocultar>

										<axis:ocultar dejarHueco="false" f="axisadm096" c="TAGENTE">
											<td><span class="campocaja"><b><axis:alt f="axisadm096" c="TAGENTE" lit="105940"></axis:alt></b></span><br />
												<input type="text" name="TAGENTE" id="TAGENTE" value="${__formdata.TAGENTE}" readonly="readonly"
												class="campowidthinput campo campotexto" style="width: 90%;"
												<axis:atr f="axisadm096" c="TAGENTE" a="modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="TAGENTE" lit="105940" />"
												title="<axis:alt f="axisadm096" c="TAGENTE" lit="105940" />" /></td>
										</axis:ocultar>



									</tr>

									<tr>
										<axis:visible f="axisadm096" c="NPOLIZA">
											<!-- TODO C -->
											<td class="campocaja"><b id="label_NPOLIZA"><axis:alt f="axisadm096" c="NPOLIZA"
														lit="100836" /></b> <br /> <input type="text" name="NPOLIZA" id="NPOLIZA"
												value="${__formdata.NPOLIZA}" class="campowidthinput campo campotexto"
												style="width: 90%;"
												<axis:atr f="axisdm096" c="NPOLIZA" a="formato=entero&modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="NPOLIZA" lit="100836" />"
												title="<axis:alt f="axisadm096" c="NPOLIZA" lit="100836" />" /></td>
										</axis:visible>
										<axis:visible f="axisadm096" c="NCERTIF">
											<!-- TODO C -->
											<td class="campocaja"><b id="label_NCERTIF"><axis:alt f="axisadm096" c="NCERTIF"
														lit="104595" /></b> <br /> <input type="text" name="NCERTIF" id="NCERTIF"
												value="${__formdata.NCERTIF}" class="campowidthinput campo campotexto"
												style="width: 90%;"
												<axis:atr f="axisadm096" c="NCERTIF" a="formato=entero&modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="NCERTIF" lit="104595" />"
												title="<axis:alt f="axisadm096" c="NCERTIF" lit="104595" />" /></td>
										</axis:visible>
										<axis:visible f="axisadm096" c="NRECIBO">
											<!-- TODO C -->
											<td class="campocaja"><b id="label_NRECIBO"><axis:alt f="axisadm096" c="NRECIBO"
														lit="111838" /></b> <br /> <input type="text" name="NRECIBO" id="NRECIBO"
												value="${__formdata.NRECIBO}" class="campowidthinput campo campotexto"
												style="width: 90%;"
												<axis:atr f="axisadm096" c="NRECIBO" a="modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="NRECIBO" lit="111838" />"
												title="<axis:alt f="axisadm096" c="NRECIBO" lit="111838" />" /></td>
										</axis:visible>

									</tr>
      <tr >
                                    <tr>
                                        <td>
                                        <div class="titulo">
                                   <b id="label_BTOMADOR"><axis:alt f="axisadm096" c="BTOMADOR"
														lit="101027" /></b> <br />
                                        </div>
                                    </td>
                                    </tr>
                                   
                                     <axis:visible f="axisadm096" c="BTOMADOR">
											<!-- IDENTIFICADOR DE TOMADOR -->
                                           
											<td class="campocaja"><b id="label_IDTOMADOR"><axis:alt f="axisadm096" c="IDTOMADOR"
														lit="9904434" /></b> <br /> <input type="text" name="IDTOMADOR" id="IDTOMADOR"
												value="${__formdata.IDTOMADOR}" class="campowidthinput campo campotexto"
												style="width: 90%;"
												<axis:atr f="axisadm096" c="IDTOMADOR" a="modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="IDTOMADOR" lit="9904434" />"
												title="<axis:alt f="axisadm096" c="IDTOMADOR" lit="9904434" />" /></td>
                                                <!-- NOMBRE DE TOMADOR -->
                                                <td class="campocaja"><b id="label_NTOMADOR"><axis:alt f="axisadm096" c="NTOMADOR"
														lit="105940" /></b> <br /> <input type="text" name="NTOMADOR" id="NTOMADOR"
												value="${__formdata.NTOMADOR}" class="campo campotexto campowidthextrabig"
												style="width: 90%;"
												<axis:atr f="axisadm096" c="NTOMADOR" a="modificable=true&obligatorio=false"/>
												alt="<axis:alt f="axisadm096" c="NTOMADOR" lit="105940" />"
												title="<axis:alt f="axisadm096" c="NTOMADOR" lit="105940" />" /></td>
                                                
										</axis:visible>
                                    </tr>
                                    <tr>
										<axis:visible f="axisadm096" c="PCMODIF">
											<td class="campocaja"><b id="label_PCMODIF">
                                                <axis:alt f="axisadm096" c="PCMODIF" lit="89906178" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="PCMODIF" id="PCMODIF" value="${__formdata.HPCMODIF}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="PCMODIF" lit="89906178" />" title="<axis:alt f="axisadm096" c="PCMODIF" lit="89906178" />" />
                                            </td>
										</axis:visible>
										<axis:visible f="axisadm096" c="SOFERTA">
											<td class="campocaja"><b id="label_SOFERTA">
                                                <axis:alt f="axisadm096" c="SOFERTA" lit="89906179" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="SOFERTA" id="SOFERTA" value="${__formdata.HSOFERTA}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="SOFERTA" lit="89906179" />" title="<axis:alt f="axisadm096" c="SOFERTA" lit="89906179" />" />
                                            </td>
										</axis:visible>
										<axis:visible f="axisadm096" c="P">
											<td class="campocaja"><b id="label_ABRECIBO">
                                                <axis:alt f="axisadm096" c="ABRECIBO" lit="89906180" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="ABRECIBO" id="ABRECIBO" value="${__formdata.HABRECIBO}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="ABRECIBO" lit="89906180" />" title="<axis:alt f="axisadm096" c="ABRECIBO" lit="89906180" />" />
                                            </td>
										</axis:visible>
									</tr>
									<tr>
										<axis:visible f="axisadm096" c="PPDLEGAL">
											<td class="campocaja"><b id="label_PPDLEGAL">
                                                <axis:alt f="axisadm096" c="PPDLEGAL" lit="89906177" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="PPDLEGAL" id="PPDLEGAL" value="${__formdata.HPPDLEGAL}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="PPDLEGAL" lit="89906177" />" title="<axis:alt f="axisadm096" c="PPDLEGAL" lit="89906177" />" />
                                            </td>
										</axis:visible>
										<axis:visible f="axisadm096" c="PPJUDI">
											<td class="campocaja"><b id="label_PPJUDI">
                                                <axis:alt f="axisadm096" c="PPJUDI" lit="89906176" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="PPJUDI" id="PPJUDI" value="${__formdata.HPPJUDI}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="PPJUDI" lit="89906176" />" title="<axis:alt f="axisadm096" c="PPJUDI" lit="89906176" />" />
                                            </td>
										</axis:visible>
										<axis:visible f="axisadm096" c="PPGUNICA">
											<td class="campocaja"><b id="label_PPGUNICA">
                                                <axis:alt f="axisadm096" c="PPGUNICA" lit="89906175" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="PPGUNICA" id="PPGUNICA" value="${__formdata.HPPGUNICA}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="PPGUNICA" lit="89906175" />" title="<axis:alt f="axisadm096" c="PPGUNICA" lit="89906175" />" />
                                            </td>
										</axis:visible>
									</tr>                                    
									<tr>
										<axis:visible f="axisadm096" c="PPESTATAL">
											<td class="campocaja"><b id="label_PPESTATAL">
                                                <axis:alt f="axisadm096" c="PPESTATAL" lit="89906172" /></b> 
                                                <br /> 
                                                <input type="checkbox" name="PPESTATAL" id="PPESTATAL" value="${__formdata.HPPESTATAL}" onclick="f_chequearBusqueda(this)"  alt="<axis:alt f="axisadm096" c="PPESTATAL" lit="89906172" />" title="<axis:alt f="axisadm096" c="PPESTATAL" lit="89906172" />" />
                                            </td>
										</axis:visible>
									</tr>                                                                        
								</table>
							</td>
						</tr>
					</table>
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisadm096" c="titulos" lit="111046" />
					</div> <!--campos-->

					<table class="mainTableDimensions base">
						<!-- FIN Cabecera -->
						<tr>
							<td><c:set var="title0">
									<axis:alt f="axisadm096" c="LIT_NUM" lit="800440" />
								</c:set> <c:set var="title1">
									<axis:alt f="axisadm096" c="NRECIBO" lit="100895" />
								</c:set> <c:set var="title2">
									<axis:alt f="axisadm096" c="FEFECTO" lit="111625" />
								</c:set> <c:set var="title3">
									<axis:alt f="axisadm096" c="FVENCIM" lit="102526" />
								</c:set> <c:set var="title4">
									<axis:alt f="axisadm096" c="NDGRACI" lit="9908856" />
								</c:set> <c:set var="title5">
									<axis:alt f="axisadm096" c="FTERMIN" lit="9908857" />
								</c:set> <c:set var="title6">
									<axis:alt f="axisadm096" c="TTIPO" lit="100565" />
								</c:set> <%-- 								<c:set var="title7"><axis:alt f="axisadm096" c="CESTADO" lit="101510"/></c:set> --%>
								<c:set var="title7">
									<axis:alt f="axisadm096" c="TESTADO" lit="101510" />
								</c:set> <c:set var="title8">
									<axis:alt f="axisadm096" c="TRAMO" lit="100784" />
								</c:set> <c:set var="title9">
									<axis:alt f="axisadm096" c="TPRODUC" lit="100829" />
								</c:set> <c:set var="title10">
									<axis:alt f="axisadm096" c="TSUCURS" lit="9002202" />
								</c:set> <c:set var="title11">
									<axis:alt f="axisadm096" c="TAGENTE" lit="100584" />
								</c:set> <c:set var="title12">
									<axis:alt f="axisadm096" c="NPOLIZA" lit="9903659" />
								</c:set> <c:set var="title13">
									<axis:alt f="axisadm096" c="TTOMADO" lit="109360" />
								</c:set> <c:set var="title14">
									<axis:alt f="axisadm096" c="ITOTAL" lit="101093" />
								</c:set> <%
 	int contador = 0;
 %> <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(sessionScope.REC_LSTRECIBOS)}">

								<div class="seccion displayspaceGrande" style="width: 98%">

									<display:table name="${sessionScope.REC_LSTRECIBOS}" id="LSTRECIBOS" export="false"
										class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
										requestURI="axis_axisadm096.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
										<%@ include file="../include/displaytag.jsp"%>


										<display:column title="${title0}" sortable="false" sortProperty="NRECIBO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspIcons">
												<input onclick="javascript:f_mod_tipimp('<%= contador %>',this)"
													<c:if test="${LSTRECIBOS.CEXISTE==1 || __formdata['CMODO']=='UNIF'}">checked</c:if>
													type="checkbox" id="selectedClausula" name="selectedClausula" value=""
													<c:if test="${__configform.axiadm096__NRECSELEC__modificable == 'false'}">readonly</c:if> />

												<input type="hidden" name="IDCUENTA_<%= contador %>" id="IDCUENTA_<%= contador %>"
													value="${LSTRECIBOS.NRECIBO}" /> <input type="hidden" name="NREC_<%= contador %>"
													id="NREC_<%= contador %>" value="${LSTRECIBOS.NRECIBO}" /> <input type="hidden"
													name="SELEC_<%= contador %>" id="SELEC_<%= contador %>" value="${LSTRECIBOS.CEXISTE}" />
											</div>
										</display:column>
										<display:column title="${title1}" sortable="true" sortProperty="NRECIBO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.NRECIBO}</div>
										</display:column>
										<display:column title="${title2}" sortable="true" sortProperty="FEFECTO"
											headerClass="sortable" media="html" autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEFECTO}" />
										</display:column>
										<display:column title="${title3}" sortable="true" sortProperty="FVENCIM"
											headerClass="sortable" media="html" autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FVENCIM}" />
										</display:column>
										<display:column title="${title4}" sortable="true" sortProperty="NDGRACI"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.NDGRACI}</div>
										</display:column>
										<display:column title="${title5}" sortable="true" sortProperty="FTERMIN"
											headerClass="sortable" media="html" autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FTERMIN}" />
										</display:column>
										<display:column title="${title6}" sortable="true" sortProperty="TTIPO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TTIPO}</div>
										</display:column>
										<display:column title="${title7}" sortable="true" sortProperty="TESTADO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TESTADO}</div>
										</display:column>
										<display:column title="${title8}" sortable="true" sortProperty="TRAMO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TRAMO}</div>
										</display:column>
										<display:column title="${title9}" sortable="true" sortProperty="TPRODUC"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TPRODUC}</div>
										</display:column>
										<display:column title="${title10}" sortable="true" sortProperty="TSUCURS"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TSUCURS}</div>
										</display:column>
										<display:column title="${title11}" sortable="true" sortProperty="TAGENTE"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TAGENTE}</div>
										</display:column>
										<display:column title="${title12}" sortable="true" sortProperty="NPOLIZA"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.NPOLIZA}</div>
										</display:column>
										<display:column title="${title13}" sortable="true" sortProperty="TTOMADO"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.TTOMADO}</div>
										</display:column>
										<display:column title="${title14}" sortable="true" sortProperty="ITOTAL"
											headerClass="sortable" media="html" autolink="false">
											<div class="dspText">${LSTRECIBOS.ITOTAL}</div>
										</display:column>

										<%
											contador++;
										%>
									</display:table>
								</div> <axis:visible f="axiadm096" c="BUT_SEL_TODOS">
									<input type="button" onclick="ChequearTodosBut()" class="boton"
										value="<axis:alt f="axiadm096" c="LIT_BUT_SELTODOS" lit="9000756"/>" />
								</axis:visible> <axis:visible f="axiadm096" c="BUT_DSEL_TODOS">
									<input type="button" onclick="DesChequearTodosBut()" class="boton"
										value="<axis:alt f="axiadm096" c="LIT_BUT_DESELTODOS" lit="9000757"/>" />
								</axis:visible></td>
						</tr>
					</table>



				</td>
			</tr>
		</table>

		<div class="separador">&nbsp;</div>
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisadm096</c:param>
			<c:param name="f">axisadm096</c:param>
			<c:param name="f">axisadm096</c:param>
			<c:param name="__botones">cancelar,100797,aceptar</c:param>
		</c:import>
	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
