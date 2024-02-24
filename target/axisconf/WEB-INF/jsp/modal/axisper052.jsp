<%/* Revision:# JTrD7zO2Rvp5gn52bdJzLw== # */%>

<%
	/*
	*  Fichero: axisper052.jsp
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
		parent.f_but_cerrar_axisper052_a();
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
    	var CTIPIDEN   = document.getElementById("CTIPIDEN").value;
    	var NNUMIDE    = document.getElementById("NNUMIDE").value;
    	var TNOMBRE    = document.getElementById("TNOMBRE").value;
    	var PPARTICI   = document.getElementById("PPARTICI").value;
    	var TSOCIEDAD  = document.getElementById("TSOCIEDAD").value;
    	var NNUMIDESOC = document.getElementById("NNUMIDESOC").value;
    	
		if (objValidador.validaEntrada()) {	
			parent.f_aceptar_per_beneficiarios(IDENTIFICACION, CTIPIDEN, NNUMIDE, TNOMBRE, PPARTICI, TSOCIEDAD, NNUMIDESOC);
			
		}
	}
	function f_but_cancelar() {
		parent.f_but_cerrar_axisper052();
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
				<axis:alt f="axisper052" c="TITULO" lit="89906138" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisper052" c="TITULO" lit="89906138" />
			</c:param>
			<c:param name="form">axisper052</c:param>
		</c:import>

		<input type="hidden" name="SSARLAFT" id="SSARLAFT" value="${__formdata.SSARLAFT}" />
		<input type="hidden" name="IDENTIFICACION" id="IDENTIFICACION" value="${__formdata.IDENTIFICACION}" />

		<div class="separador"></div>

	
		<table class="seccion" style="width: 90%;" align="center">
			<tbody>
				<tr>
					<td>
						<table class="area">
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper052" c="CTIPIDEN">
									<td><span class="bold"><axis:alt f="axisper052"
												c="CTIPIDEN" lit="9904433"></axis:alt></span><br /> <select 
										title="<axis:alt f='axisper052' c='CTIPIDEN' lit='9904433' />"
										alt="<axis:alt f='axisper052' c='CTIPIDEN' lit='9904433' />"
										name="CTIPIDEN" id="CTIPIDEN" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper052" c="CTIPIDEN" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper052" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="element" items="${sessionScope.ls_identificaciones}">
                                                <option value = "${element.CATRIBU}"
													<c:if test="${element.CATRIBU == __formdata.CTIPIDEN}">selected</c:if>>
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
									</select></td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper052" c="NNUMIDE">
									<td><span class="bold"><axis:alt f="axisper052"
												c="NNUMIDE" lit="9904434"></axis:alt></span><br /> <input
										type="text" name="NNUMIDE" id="NNUMIDE"
										value="${__formdata.NNUMIDE}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper052" c="NNUMIDE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper052" c="NNUMIDE" lit="9904434" />"
										title="<axis:alt f="axisper052" c="NNUMIDE" lit="9904434" />" />
									</td>
								</axis:ocultar>								
								<axis:ocultar dejarHueco="false" f="axisper052" c="TNOMBRE">
									<td><span class="bold"><axis:alt f="axisper052"
												c="TNOMBRE" lit="9907629"></axis:alt></span><br /> <input
										type="text" name="TNOMBRE" id="TNOMBRE"
										value="${__formdata.TNOMBRE}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper052" c="TNOMBRE" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper052" c="TNOMBRE" lit="9907629" />"
										title="<axis:alt f="axisper052" c="TNOMBRE" lit="9907629" />" />
									</td>
								</axis:ocultar>
							</tr>
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper052" c="PPARTICI">
									<td><span class="bold"><axis:alt f="axisper052"
												c="PPARTICI" lit="104818"></axis:alt></span><br /> <input
										type="text" name="PPARTICI" id="PPARTICI"
										value="${__formdata.PPARTICI}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper052" c="PPARTICI" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper052" c="PPARTICI" lit="104818" />"
										title="<axis:alt f="axisper052" c="PPARTICI" lit="104818" />" />
									</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper052" c="TSOCIEDAD">
									<td><span class="bold"><axis:alt f="axisper052"
												c="TSOCIEDAD" lit="89906143"></axis:alt></span><br /> <input
										type="text" name="TSOCIEDAD" id="TSOCIEDAD"
										value="${__formdata.TSOCIEDAD}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper052" c="TSOCIEDAD" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper052" c="TSOCIEDAD" lit="89906143" />"
										title="<axis:alt f="axisper052" c="TSOCIEDAD" lit="89906143" />" />
									</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper052" c="NNUMIDESOC">
									<td><span class="bold"><axis:alt f="axisper052"
												c="NNUMIDESOC" lit="9905773"></axis:alt></span><br /> <input
										type="text" name="NNUMIDESOC" id="NNUMIDESOC"
										value="${__formdata.NNUMIDESOC}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper052" c="NNUMIDESOC" a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper052" c="NNUMIDESOC" lit="9905773" />"
										title="<axis:alt f="axisper052" c="NNUMIDESOC" lit="9905773" />" />
									</td>
								</axis:ocultar>
							</tr>							
						</table>
					</td>
				</tr>
			</tbody>
		</table>



		<div class="separador">&nbsp;</div>


		<c:if test="${__formdata.CMODO != 'CONSULTA'}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper052</c:param>
				<c:param name="f">axisper052</c:param>
				<c:param name="__botones">cancelar,aceptar</c:param>
			</c:import>
		</c:if>
		<c:if test="${__formdata.CMODO == 'CONSULTA'}">
			<c:import url="../include/botonera_nt.jsp">
				<c:param name="f">axisper052</c:param>
				<c:param name="__botones">cancelar</c:param>
			</c:import>
		</c:if>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
