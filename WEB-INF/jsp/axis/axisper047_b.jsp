<%/* Revision:# HlMRFGRxFwXG0FbfqDw60Q== # */%>

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
<link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
<!-- Script principal del calendario -->
<script type="text/javascript" src="scripts/calendar.js"></script>
<!-- Idioma del calendario, en funcin del Locale -->
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
		<c:if test="${__formdata.CMODO != 'CONSULTA'}"> 
		/*
		Calendar.setup({
			inputField : "FCREA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FCREA",
			singleClick : true,
			firstDay : 1
		});
		*/
		
		</c:if>
		
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
		parent.f_but_cerrar_axisper047_b();
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
		objAjax.invokeAsyncCGI("axis_axisper047_b.do",
				callBackResponse,
				"operation=aceptarb"+serial("miForm"),
				this, objJsMessages.jslit_actualizando_registro);	
		}
	}
	


	function f_but_cancelar() {
		parent.f_but_cerrar_axisper047_b();
	}
	
	
	var itemp="";
 	var itemd="";
 	var itemmc="";
 	var itemnp="";
 	var itemnd="";
 	var itemmnc="";
 	var itempboolean=false;
 	var itemdboolean=false;
 	var itemmboolean=false;
	function f_pais(pais,dep,ciudad,npais){
		itemp=pais;
		itemnp=npais;
		itempboolean=true;
		itemdboolean=false;
		itemmboolean=false;
		f_abrir_axiscom001('152430', 'LISTA_PAIS', null);
		objDom.setValorPorId(dep,"");
		objDom.setValorPorId(ciudad,"");
	}
	function f_dep(pais,dep,ciudad,ndep){
		itemd=dep;
		itemnd=ndep;
		itempboolean=false;
		itemdboolean=true;
		itemmboolean=false;
		if(objDom.getValorPorId(pais)!=null || objDom.getValorPorId(pais)!=""){
			f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', objDom.getValorPorId(pais));
			objDom.setValorPorId(ciudad,"");
		}else{
			alert("seleccione el pais");
		}
	}
	function f_ciudad(pais,dep,ciudad,nciudad){
		itemmc=ciudad;
		itemmnc=nciudad;
		itempboolean=false;
		itemdboolean=false;
		itemmboolean=true;
		if(objDom.getValorPorId(dep)!=null || objDom.getValorPorId(dep)!=""){
			f_abrir_axiscom001('152432', 'LISTA_POBLACION', objDom.getValorPorId(dep), null);
		}else{
			alert("Seleccione el departamento");
		}
	}
	
	function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
        objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
         "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
   }
	
	function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
		f_cerrar_axiscom001();
		
		if(itempboolean){
			objDom.setValorPorId(itemp,CODIGO);
			objDom.setValorPorId(itemnp,TEXTO);
		}
		if(itemdboolean){
			objDom.setValorPorId(itemd,CODIGO);
			objDom.setValorPorId(itemnd,TEXTO);
		}
		if(itemmboolean){
			objDom.setValorPorId(itemmc,CODIGO);
			objDom.setValorPorId(itemmnc,TEXTO);
		}
		
    }
	
	function f_cerrar_axiscom001() {
        objUtiles.cerrarModal("axiscom001");
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

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisper047" c="TIT_AXISPER001" lit="102068" />
			</c:param>
			<c:param name="nid" value="axiscom001" />
		</c:import>


		<div class="separador"></div>

		<table class="seccion" style="width: 90%;" align="center">
			<tbody>
				<tr>
					<td>
						<table class="area">
							<tr>
								<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />
								<input type="hidden" name="SSARLAFT" id="SSARLAFT" value="${__formdata.SSARLAFT}" />
								<input type="hidden" name="NACTIVI" id="NACTIVI" value="${__formdata.NACTIVI}" />


								<axis:ocultar dejarHueco="false" f="axisper047" c="CTIPOPROD">
									<td><span class="bold"><axis:alt f="axisper047" c="CTIPOPROD" lit="9909569"></axis:alt></span><br />
										<input type="text" name="CTIPOPROD" id="CTIPOPROD" value="${__formdata.CTIPOPROD}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CTIPOPROD" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CTIPOPROD" lit="9909569" />"
										title="<axis:alt f="axisper047" c="CTIPOPROD" lit="9909569" />" /></td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper047" c="CIDNUMPROD">
									<td><span class="bold"><axis:alt f="axisper047" c="CIDNUMPROD" lit="9909634"></axis:alt></span><br />
										<input type="text" name="CIDNUMPROD" id="CIDNUMPROD" value="${__formdata.CIDNUMPROD}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CIDNUMPROD" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CIDNUMPROD" lit="9909634" />"
										title="<axis:alt f="axisper047" c="CIDNUMPROD" lit="9909634" />" /></td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper047" c="TENTIDAD">
									<td><span class="bold"><axis:alt f="axisper047" c="TENTIDAD" lit="9001624"></axis:alt></span><br />
										<input type="text" name="TENTIDAD" id="TENTIDAD" value="${__formdata.TENTIDAD}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="TENTIDAD" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="TENTIDAD" lit="9001624" />"
										title="<axis:alt f="axisper047" c="TENTIDAD" lit="9001624" />" /></td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper047" c="CMONTO">
									<td><span class="bold"><axis:alt f="axisper047" c="CMONTO" lit="9905096"></axis:alt></span><br />
										<input onkeypress="return isNumberKey(event)" type="text" name="CMONTO" id="CMONTO"
										value="${__formdata.CMONTO}" class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="CMONTO" 
											a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="CMONTO" lit="9905096" />"
										title="<axis:alt f="axisper047" c="CMONTO" lit="9905096" />" /></td>
								</axis:ocultar>

							</tr>

							<tr>

								<td colspan="2">
									<table>
										<tr>
											<axis:ocultar dejarHueco="false" f="axisper047" c="CPAIS">
												<td><span class="bold"><axis:alt f="axisper047" c="CPAIS" lit="9909597"></axis:alt></span><br />
													<input type="text" name="CPAIS" id="CPAIS" readonly="readonly" style="width: 40px;"
													class="campowidthinput campo campotexto" value="${__formdata.CPAIS}"
													<axis:atr f="axisper047" c="CPAIS" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="CPAIS" lit="9909597" />"
													title="<axis:alt f="axisper047" c="CPAIS" lit="9909597" />" /> <img id="findPais"
													border="0" src="images/find.gif" onclick="f_pais('CPAIS','TDEPB','CCIUDAD','SCPAIS')"
													style="cursor: pointer" /><input type="text" name="SCPAIS" id="SCPAIS" value="${__formdata.SCPAIS}"
													class="campowidthinput campo campotexto" readonly="readonly" style="width: 70px;"
													<axis:atr f="axisper047" c="SCPAIS" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="SCPAIS" lit="0000" />"
													title="<axis:alt f="axisper047" c="SCPAIS" lit="0000" />" /></td>
											</axis:ocultar>
											<axis:ocultar dejarHueco="false" f="axisper047" c="TDEPB">
												<td><span class="bold"><axis:alt f="axisper047" c="TDEPB" lit="9902610"></axis:alt></span><br />
													<input type="text" name="TDEPB" style="width: 40px;" id="TDEPB" disabled
													class="campowidthinput campo campotexto" value="${__formdata.TDEPB}"
													<axis:atr f="axisper047" c="TDEPB" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="TDEPB" lit="9902610" />"
													title="<axis:alt f="axisper047" c="TDEPB" lit="9902610" />" /> <img id="findPais"
													border="0" src="images/find.gif" onclick="f_dep('CPAIS','TDEPB','CCIUDAD','STDEPB')"
													style="cursor: pointer" /><input type="text" name="STDEPB" id="STDEPB" value="${__formdata.STDEPB}"
													class="campowidthinput campo campotexto" readonly="readonly" style="width: 70px;"
													<axis:atr f="axisper047" c="STDEPB" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="STDEPB" lit="0000" />"
													title="<axis:alt f="axisper047" c="STDEPB" lit="0000" />" /></td>
											</axis:ocultar>
											<axis:ocultar dejarHueco="false" f="axisper047" c="CCIUDAD">
												<td><span class="bold"><axis:alt f="axisper047" c="CCIUDAD" lit="9908410"></axis:alt></span><br />
													<input type="text" name="CCIUDAD" id="CCIUDAD" readonly="readonly" style="width: 40px;"
													class="campowidthinput campo campotexto" value="${__formdata.CCIUDAD}"
													<axis:atr f="axisper047" c="CCIUDAD" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="CCIUDAD" lit="9908410" />"
													title="<axis:alt f="axisper047" c="CCIUDAD" lit="9908410" />" /> <img id="findPais"
													border="0" src="images/find.gif" onclick="f_ciudad('CPAIS','TDEPB','CCIUDAD','SCCIUDAD')"
													style="cursor: pointer" /><input type="text" name="SCCIUDAD" id="SCCIUDAD" value="${__formdata.SCCIUDAD}"
													class="campowidthinput campo campotexto" readonly="readonly" style="width: 70px;"
													<axis:atr f="axisper047" c="SCCIUDAD" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axisper047" c="SCCIUDAD" lit="0000" />"
													title="<axis:alt f="axisper047" c="SCCIUDAD" lit="0000" />" /></td>
											</axis:ocultar>
										</tr>
									</table>

								</td>

								<axis:ocultar dejarHueco="false" f="axisper047" c="CMONEDA">
									<td><span class="bold"><axis:alt f="axisper047" c="CMONEDA" lit="9907718"></axis:alt></span><br />
										<select title="<axis:alt f='axisper047' c='CMONEDA' lit='9907718' />"
										alt="<axis:alt f='axisper047' c='CMONEDA' lit='9907718' />" name="CMONEDA" id="CMONEDA"
										size="1" onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="CMONEDA" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="element" items="${sessionScope.listaMonedas}">
												<option value="${element.CMONEDA}"
													<c:if test="${element.CMONEDA == __formdata.CMONEDA}">selected</c:if>>
													${element.TMONEDA}
												</option>
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
