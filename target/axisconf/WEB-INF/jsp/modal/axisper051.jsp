<%/* Revision:# j4sdshhk8hwV3EyapGc29w== # */%>

<%
	/*
	*  Fichero: axisper051.jsp
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
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

		Calendar.setup({
			inputField : "FDESVIN",
			ifFormat : "%d/%m/%Y",
			button : "icon_FDESVIN",
			singleClick : true,
			firstDay : 1
		});
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
    	var IDENTIFICACION = document.getElementById("IDENTIFICACION").value;
    	var CTIPREL   = document.getElementById("CTIPREL").value;
    	var CTIPIDEN    = document.getElementById("CTIPIDEN").value;
    	var TNOMBRE    = document.getElementById("TNOMBRE").value;
    	var NNUMIDE   = document.getElementById("NNUMIDE").value;
    	var TNACIONALI1  = document.getElementById("TNACIONALI1").value;
    	var EMPTNACIONALI1 = document.getElementById("EMPTNACIONALI1").value;
    	var TENTIDAD = document.getElementById("TENTIDAD").value;
    	var TCARGO = document.getElementById("TCARGO").value;
    	var FDESVIN = document.getElementById("FDESVIN").value;
    	
		if (objValidador.validaEntrada()) {	
			parent.f_aceptar_per_expuestas(IDENTIFICACION, CTIPREL, CTIPIDEN, TNOMBRE, NNUMIDE, TNACIONALI1, EMPTNACIONALI1, TENTIDAD, TCARGO, FDESVIN);
		}
	}
	
	function f_but_cancelar() {
		parent.f_but_cerrar_axisper051();
	}
	
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
	<input type="hidden" name="operation" value=""/>
	
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisper051" c="TITULO" lit="9902423" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisper051" c="TITULO" lit="9902423" />
			</c:param>
			<c:param name="form">axisper051</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axiscom001" c="TIT_AXISPER001" lit="102068" />
			</c:param>
			<c:param name="nid" value="axiscom001" />
		</c:import>
		<input type="hidden" name="IDENTIFICACION" id="IDENTIFICACION" value="${__formdata.IDENTIFICACION}" /> 
		<input type="hidden" name="SSARLAFT" id="SSARLAFT" value="${__formdata.SSARLAFT}" />

		<div class="separador"></div>

	
		<table class="seccion" style="width: 90%;" align="center">
			<tbody>
				<tr>
					<td>
						<table class="area">
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper051" c="CTIPREL">
									<td><span class="bold"><axis:alt f="axisper051"
												c="CTIPREL" lit="89906119"></axis:alt></span><br /> <select 
										title="<axis:alt f='axisper051' c='CTIPREL' lit='89906119' />"
										alt="<axis:alt f='axisper051' c='CTIPREL' lit='89906119' />"
										name="CTIPREL" id="CTIPREL" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper051" c="CTIPREL" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper051" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="element" items="${sessionScope.ls_tipos_relacion}">
                                                <option value = "${element.CATRIBU}"
													<c:if test="${element.CATRIBU == __formdata.CTIPREL}">selected</c:if>>
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
									</select></td>
								</axis:ocultar>
								
								<axis:ocultar dejarHueco="false" f="axisper051" c="TNOMBRE">
									<td><span class="bold"><axis:alt f="axisper051"
												c="TNOMBRE" lit="9907629"></axis:alt></span><br /> <input
										type="text" name="TNOMBRE" id="TNOMBRE"
										value="${__formdata.TNOMBRE}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper051" c="TNOMBRE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper051" c="TNOMBRE" lit="9907629" />"
										title="<axis:alt f="axisper051" c="TNOMBRE" lit="9907629" />" />
									</td>
								</axis:ocultar>
								</tr>
								<tr>
								<axis:ocultar dejarHueco="false" f="axisper051" c="CTIPIDEN">
									<td><span class="bold"><axis:alt f="axisper051"
												c="CTIPIDEN" lit="9904433"></axis:alt></span><br /> <select 
										title="<axis:alt f='axisper051' c='CTIPIDEN' lit='9904433' />"
										alt="<axis:alt f='axisper051' c='CTIPIDEN' lit='9904433' />"
										name="CTIPIDEN" id="CTIPIDEN" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper051" c="CTIPIDEN" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper051" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="element" items="${sessionScope.ls_identificaciones}">
                                                <option value = "${element.CATRIBU}"
													<c:if test="${element.CATRIBU == __formdata.CTIPIDEN}">selected</c:if>>
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
									</select></td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper051" c="NNUMIDE">
									<td><span class="bold"><axis:alt f="axisper051"
												c="NNUMIDE" lit="9904434"></axis:alt></span><br /> <input
										onkeypress="return isNumberKey(event)" type="text"
										name="NNUMIDE" id="NNUMIDE"
										value="${__formdata.NNUMIDE}"
										class="campowidthinput campo campotexto" 
										<axis:atr f="axisper051" c="NNUMIDE" 
											a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper051" c="NNUMIDE" lit="9904434" />"
										title="<axis:alt f="axisper051" c="NNUMIDE" lit="9904434" />" />
									</td>
								</axis:ocultar>

									<axis:ocultar dejarHueco="false" f="axisper051" c="TNACIONALI1">
										<td><span class="bold"><axis:alt f="axisper051" c="TNACIONALI1" lit="9909611"></axis:alt></span><br />
											<input type="text" name="TNACIONALI1" id="TNACIONALI1" readonly="readonly"
											style="width: 40px;" value="${__formdata.CPAIS}"
											class="campowidthinput campo campotexto"
											<axis:atr f="axisper051" c="TNACIONALI1" a="modificable=true&obligatorio=false"/>
											alt="<axis:alt f="axisper051" c="TNACIONALI1" lit="9909611" />"
											title="<axis:alt f="axisper051" c="TNACIONALI1" lit="9909611" />" /> <img id="findPais"
											border="0" src="images/find.gif" onclick="f_pais('TNACIONALI1','','','EMPTNACIONALI1')"
											style="cursor: pointer" /><input type="text" name="EMPTNACIONALI1" id="EMPTNACIONALI1"
											value="${__formdata.TPAIS}" class="campowidthinput campo campotexto"
											style="width: 70px;" readonly="readonly"
											<axis:atr f="axisper051" c="EMPTNACIONALI1" a="modificable=true&obligatorio=false"/>
											alt="<axis:alt f="axisper051" c="EMPTNACIONALI1" lit="0000" />"
											title="<axis:alt f="axisper051" c="EMPTNACIONALI1" lit="0000" />" /></td>
									</axis:ocultar>
									</tr>
									<tr>

								<axis:ocultar dejarHueco="false" f="axisper051" c="TENTIDAD">
									<td><span class="bold"><axis:alt f="axisper051"
												c="TENTIDAD" lit="9001624"></axis:alt></span><br /> <input
										type="text" name="TENTIDAD" id="TENTIDAD"
										value="${__formdata.TENTIDAD}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper051" c="TENTIDAD" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper051" c="TENTIDAD" lit="9001624" />"
										title="<axis:alt f="axisper051" c="TENTIDAD" lit="9001624" />" />
									</td>
								</axis:ocultar>
								
								<axis:ocultar dejarHueco="false" f="axisper051" c="TCARGO">
									<td><span class="bold"><axis:alt f="axisper051"
												c="TCARGO" lit="9902638"></axis:alt></span><br /> <input
										type="text" name="TCARGO" id="TCARGO"
										value="${__formdata.TCARGO}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper051" c="TCARGO" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper051" c="TCARGO" lit="9902638" />"
										title="<axis:alt f="axisper051" c="TCARGO" lit="9902638" />" />
									</td>
								</axis:ocultar>
								
								
								
								
							</tr>
							<!-- CP0637M_SYS_PERS - ACL - 15/11/2018 -- Se modifica para que el campo FDESVIN no sea obligatorio  -->
							<tr>
								   <axis:ocultar dejarHueco="false" f="axisper047" c="FDESVIN">
										<td><span class="bold"><axis:alt f="axisper047" c="FDESVIN" lit="89906120"></axis:alt></span><br />
											<input type="text" name="FDESVIN" id="FDESVIN" size="15" class="campo campotexto"
											value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESVIN}"/>"
											title="<axis:alt f='axisper047' c='FDESVIN' lit='89906120'/>"
											alt="<axis:alt f='axisper047' c='FDESVIN' lit='89906120'/>"
											<axis:atr f="axisper047" c="FDESVIN" a="formato=fecha&modificable=true&obligatorio=false"/> />
											<a style="vertical-align: middle;"> <c:if
													test="${__formdata.ACTIONMOD != 'CONSULTA'}">
													<img id="icon_FDESVIN"
														alt="<axis:alt f="axisper047" c="FDESVIN" lit="89906120"/>"
														title="<axis:alt f="axisper047" c="FDESVIN" lit="89906120" />"
														src="images/calendar.gif" />
												</c:if>
										</a></td>
									</axis:ocultar>
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
				<c:param name="f">axisper051</c:param>
				<c:param name="f">axisper051</c:param>
				<c:param name="__botones">cancelar,aceptar</c:param>
			</c:import>
		</c:if>
		<c:if test="${__formdata.CMODO == 'CONSULTA'}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper051</c:param>
				<c:param name="__botones">cancelar</c:param>
			</c:import>
		</c:if>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
