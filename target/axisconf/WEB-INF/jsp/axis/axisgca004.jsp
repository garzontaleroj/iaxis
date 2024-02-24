<%/* Revision:# yN/y69SEh6BIrSS5I7qYzg== # */%>

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
 // INI - IAXIS-7653 - SGM - 16/12/2019. SE CORRIGEN FILTROS DE PANTALLA
	function f_onchange_sucursal(CSUCURSAL) {
		objDom.setValorPorId("CSUCURSAL", CSUCURSAL);
		//objUtiles.ejecutarFormulario("axis_axisgca004.do", "form",
		//		document.miForm, "_self", objJsMessages.jslit_cargando);
	}	
 // FIN - IAXIS-7653 - SGM - 16/12/2019. SE CORRIGEN FILTROS DE PANTALLA  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_cancelar(){
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisgca004", "cancelar", document.miForm, "_self");
	}     
	

	function f_abrir_agente() {
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBLICAS");	
		$("#TIPO_PERSONA").val("AGENTE");
	}
	
	function f_abrir_persona() {
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS");	
		$("#TIPO_PERSONA").val("PERSONA");
	}
      
	function f_aceptar_persona(selectedPerson, CAGENTE, SNIP, modal) {
		try {
			$("#CAGENTE").val(CAGENTE);
			var porigen = 'INT';
			objUtiles.cerrarModal("axisper021");
			objDom.setValorPorId("SPERSON", selectedPerson);
			
			objAjax.invokeAsyncCGI("modal_axiscga002.do",
					callbackajaxGetPersona,
					"operation=ajax_get_persona&SPERSON_REL=" + selectedPerson
					+ "&CAGENTE1=" + CAGENTE,
					this, objJsMessages.jslit_actualizando_registro);

		} catch (e) {
			if (isDebugAjaxEnabled == "true")
				alert(e.name + " " + e.message);
		}
	}

// 	INI SGM IAXIS-4102 saldos a favor del cliente
    function f_onclickCheckbox(thiss) {
        thiss.value =  ((thiss.checked)?1:0);
        vcpendientes = 1
        objDom.setValorPorId(thiss.id, thiss.value);
         }		
// 	FIN SGM IAXIS-4102 saldos a favor del cliente

	function callbackajaxGetPersona(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);
		//alert(ajaxResponseText);
		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

			

			var TNOMBRE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TNOMBRE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TNOMBRE"), 0, 0) : "");

			var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI1")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI1"), 0, 0) : "");

			var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("TAPELLI2")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("TAPELLI2"), 0, 0) : "");

			var CTIPIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("CTIPIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("CTIPIDE"), 0, 0) : "");

			var NNUMIDE = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("NNUMIDE")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("NNUMIDE"), 0, 0) : "");

			var SPERSON = ((objUtiles.hayValorElementoXml(doc
					.getElementsByTagName("SPERSON")[0])) ? objDom
					.getValorNodoDelComponente(doc
							.getElementsByTagName("SPERSON"), 0, 0) : "");

			if($("#TIPO_PERSONA").val()=="AGENTE"){
				document.miForm.NNUMIDEAGE.value = NNUMIDE;
				document.miForm.TAGENTE.value = TAPELLI1 + "" + TAPELLI2 + " ,"+ TNOMBRE;
				 
				objDom.setValorPorId("SPERSON_AGENTE", SPERSON);
			}else{
				
				document.miForm.NNUMIDECLI.value = NNUMIDE;
				document.miForm.TNOMCLI.value = TAPELLI1 + "" + TAPELLI2 + " ,"+ TNOMBRE;
				 
				objDom.setValorPorId("SPERSON_CLI", SPERSON);
			}			

		}
	}
	
	
	
	//**********************************************//
	//***************SUCURSAL********************//
	function f_abrir_axisctr014() {  
		objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
      }
            
      function f_cerrar_axisctr014() {
          objUtiles.cerrarModal("axisctr014");
      }
      
      function f_cerrar_modalespersona() {
          objUtiles.cerrarModal("axisper021");
      }
      
      
      function f_aceptar_axisctr014 (CAGENTE){                      
          f_cerrar_axisctr014();
          objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
      }
      
      function callbackAjaxCambiarAgente(ajaxResponseText){
          var doc=objAjax.domParse(ajaxResponseText); 
          if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              $("#NNUMIDEAGE").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
              $("#TAGENTE").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)); 
          }
      }
	//**********************************************//
	
	//Buscar
	function f_but_buscar(){		
		objUtiles.ejecutarFormulario("axis_axisgca004.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	} 
	
	function f_cargar_detalle(IDDETALLE1,IDDETALLE2){
		$("#IDDETALLE1").val(IDDETALLE1);
		$("#IDDETALLE2").val(IDDETALLE2);
		objUtiles.ejecutarFormulario("axis_axisgca004.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}
	
	//Aceptar
	function f_but_aceptar(){
		objUtiles.ejecutarFormulario("axis_axisgca004.do?action=GUARDAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	}
	
	function f_abrir_axisgca006(SGSFAVCLI){
		
		objUtiles.abrirModal("axisgca006","src","axis_axisgca006.do?operation=form&SGSFAVCLI="+SGSFAVCLI+"&PARAMA=1");
	}
	
	function cerrar_axisgca006(){
		objUtiles.cerrarModal("axisgca006");
	}
$(function(){
		
		$("#CSELTODO").change(function() { 
			if(this.checked) {
				ChequearTodosBut();
			}else{
				DesChequearTodosBut();
			} 
		});		
	});
	
	
	
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
	}
	
	function f_mod_tipimp(id, check) {
		objDom.setValorPorId("SELEC_" + id, ((check.checked) ? 1 : 0));
	}
	
	
	
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910404" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910404" />
		</c:param>
		<c:param name="form">axisgca004</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr019" c="TITULO" lit="1000234" />
		</c:param>
		<c:param name="nid" value="axisctr014" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr019" c="TITULO" lit="9910374" />
		</c:param>
		<c:param name="nid" value="axisgca006" />
	</c:import>

	<form name="miForm" id="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		
		<input type="hidden" name="IDDETALLE1" id="IDDETALLE1" value="${__formdata.IDDETALLE1}" />
		<input type="hidden" name="IDDETALLE2" id="IDDETALLE2" value="${__formdata.IDDETALLE2}"/>

		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca004" c="PERCORTE">
	<td><span class="bold"><axis:alt f="axisgca004" c="PERCORTE" lit="9910364"></axis:alt></span><br />
		<input type="text" name="PERCORTE" id="PERCORTE" size="15" class="campo campotexto"
		style="width: 70%;"
		value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.PERCORTE}"/>"
		title="<axis:alt f='axisgca004' c='PERCORTE' lit='9910364'/>"
		alt="<axis:alt f='axisgca004' c='PERCORTE' lit='9910364'/>"
		<axis:atr f="axisgca004" c="PERCORTE" a="formato=fecha&modificable=true&obligatorio=true"/> />
		<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
				<img id="icon_PERCORTE" alt="<axis:alt f="axisgca004" c="PERCORTE" lit="9910364"/>"
					title="<axis:alt f="axisgca004" c="PERCORTE" lit="9910364" />" src="images/calendar.gif" />
			</c:if>
	</a></td>
</axis:ocultar>

<!-- INI SGM IAXIS-4102 saldos a favor del cliente -->
				<axis:ocultar dejarHueco="false" f="axisgca004" c="CPENDIENTES">
				<td><span class="bold"><axis:alt f="axisgca004" c="CPENDIENTES" lit="9910360"></axis:alt></span><br />
						<input onClick="f_onclickCheckbox(this);" type="checkbox" id="CPENDIENTES" name="CPENDIENTES"
						<c:if test="${__formdata.CPENDIENTES==1}">checked="true"</c:if> value="${__formdata.CPENDIENTES}"/>   
						<axis:atr f="axisgca004" c="CPENDIENTES"/>
				</axis:ocultar>
				<td></td>
				<td></td>
			</tr>
			<tr>
				
                            <axis:ocultar f="axisgca004" c="CSUCURSAL" dejarHueco="false">
                
                                   <td class="campocaja" colspan="1">
                                   <span class="bold"><axis:alt f="axisgca004" c="CSUCURSAL" lit="9910768"></axis:alt></span><br /> 
                                        <select name = "CSUCURSAL" id="CSUCURSAL" 
                                         class="campowidthselect campo campotexto">
                                                <option value=""> - <fmt:message key="108341"/> - </option>
                                                <c:forEach var="LS_SUCURSALES" items="${LS_SUCURSALES}">
                                                    <option value = "${LS_SUCURSALES.CODI}"
                                                    <c:if test="${LS_SUCURSALES.CODI == __formdata.CSUCURSAL}">selected</c:if>>
                                                     ${LS_SUCURSALES.NOMBRE}</option>
                                                </c:forEach>
                                        </select>
                                   </td>
                            </axis:ocultar>						

<axis:ocultar dejarHueco="false" f="axisgca004" c="NNUMIDEAGE">
					<td><span class="bold"><axis:alt f="axisgca004" c="NNUMIDEAGE" lit="9910198"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NNUMIDEAGE" id="NNUMIDEAGE"
						value="${__formdata.NNUMIDEAGE}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca004" c="NNUMIDEAGE" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca004" c="NNUMIDEAGE" lit="9909665" />"
						title="<axis:alt f="axisgca004" c="NNUMIDEAGE" lit="9909665" />" /><img border="0"
						src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor: pointer" /></td>
				</axis:ocultar>
				<axis:ocultar dejarHueco="false" f="axisgca004" c="TAGENTE">
					<td><span class="bold"><axis:alt f="axisgca004" c="TAGENTE" lit="9902363"></axis:alt></span><br />
						<input type="text" name="TAGENTE" id="TAGENTE" value="${__formdata.TAGENTE}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca004" c="TAGENTE" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca004" c="TAGENTE" lit="9909665" />"
						title="<axis:alt f="axisgca004" c="TAGENTE" lit="9909665" />" /></td>
				</axis:ocultar>

				
			</tr>




			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca004" c="NNUMIDECLI">
					<td><span class="bold"><axis:alt f="axisgca004" c="NNUMIDECLI" lit="9910042"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NNUMIDECLI" id="NNUMIDECLI"
						value="${__formdata.NNUMIDECLI}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca004" c="NNUMIDECLI" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca004" c="NNUMIDECLI" lit="9910369" />"
						title="<axis:alt f="axisgca004" c="NNUMIDECLI" lit="9910369" />" /><img border="0"
						src="images/find.gif" onclick="f_abrir_persona()" style="cursor: pointer" /></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca004" c="TNOMCLI">
					<td><span class="bold"><axis:alt f="axisgca004" c="TNOMCLI" lit="9909970"></axis:alt></span><br />
						<input type="text" name="TNOMCLI" id="TNOMCLI" value="${__formdata.TNOMCLI}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca004" c="TNOMCLI" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca004" c="TNOMCLI" lit="9909970" />"
						title="<axis:alt f="axisgca004" c="TNOMCLI" lit="9909970" />" /></td>
				</axis:ocultar>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca004" c="FDOCINI">
					<td><span class="bold"><axis:alt f="axisgca004" c="FDOCINI" lit="9910361"></axis:alt></span><br />
						<input type="text" name="FDOCINI" id="FDOCINI" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDOCINI}"/>"
						title="<axis:alt f='axisgca004' c='FDOCINI' lit='9910361'/>"
						alt="<axis:alt f='axisgca004' c='FDOCINI' lit='9910361'/>"
						<axis:atr f="axisgca004" c="FDOCINI" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FDOCINI" alt="<axis:alt f="axisgca004" c="FDOCINI" lit="9910361"/>"
									title="<axis:alt f="axisgca004" c="FDOCINI" lit="9910361" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>


				<axis:ocultar dejarHueco="false" f="axisgca004" c="FDOCFIN">
					<td><span class="bold"><axis:alt f="axisgca004" c="FDOCFIN" lit="9910362"></axis:alt></span><br />
						<input type="text" name="FDOCFIN" id="FDOCFIN" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDOCFIN}"/>"
						title="<axis:alt f='axisgca004' c='FDOCFIN' lit='9910362'/>"
						alt="<axis:alt f='axisgca004' c='FDOCFIN' lit='9910362'/>"
						<axis:atr f="axisgca004" c="FDOCFIN" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FDOCFIN" alt="<axis:alt f="axisgca004" c="FDOCFIN" lit="9910362"/>"
									title="<axis:alt f="axisgca004" c="FDOCFIN" lit="9910362" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca004" c="NDOCSAP">
					<td><span class="bold"><axis:alt f="axisgca004" c="NDOCSAP" lit="102999"></axis:alt></span><br />
						<input type="text" name="NDOCSAP" id="NDOCSAP" value="${__formdata.NDOCSAP}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca004" c="NDOCSAP" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca004" c="NDOCSAP" lit="102999" />"
						title="<axis:alt f="axisgca004" c="NDOCSAP" lit="102999" />" /></td>
				</axis:ocultar>
				<td></td>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca004" c="FCONTINI">
					<td><span class="bold"><axis:alt f="axisgca004" c="FCONTINI" lit="9910363"></axis:alt></span><br />
						<input type="text" name="FCONTINI" id="FCONTINI" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTINI}"/>"
						title="<axis:alt f='axisgca004' c='FCONTINI' lit='9910363'/>"
						alt="<axis:alt f='axisgca004' c='FCONTINI' lit='9910363'/>"
						<axis:atr f="axisgca004" c="FCONTINI" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FCONTINI" alt="<axis:alt f="axisgca004" c="FCONTINI" lit="9910363"/>"
									title="<axis:alt f="axisgca004" c="FCONTINI" lit="9910363" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>


				<axis:ocultar dejarHueco="false" f="axisgca004" c="FCONTFIN">
					<td><span class="bold"><axis:alt f="axisgca004" c="FCONTFIN" lit="9910364"></axis:alt></span><br />
						<input type="text" name="FCONTFIN" id="FCONTFIN" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONTFIN}"/>"
						title="<axis:alt f='axisgca004' c='FCONTFIN' lit='9910364'/>"
						alt="<axis:alt f='axisgca004' c='FCONTFIN' lit='9910364'/>"
						<axis:atr f="axisgca004" c="FCONTFIN" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FCONTFIN" alt="<axis:alt f="axisgca004" c="FCONTFIN" lit="9910364"/>"
									title="<axis:alt f="axisgca004" c="FCONTFIN" lit="9910364" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
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
						<axis:alt f="axisgca004" c="CSUCURSAL_T" lit="9909330" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca004" c="NNUMIDECLI_T" lit="89908040" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca004" c="TNOMCLI_T" lit="89908041" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca004" c="IDEBITO_T" lit="9910366" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca004" c="ICREDITO_T" lit="9910367" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca004" c="ISALDO_T" lit="104910" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca004" c="ICODETALLE_T" lit="9906458" />
					</c:set>

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.LISTDEPU_SALDOFAVCLI}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca004.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="CSUCURSAL_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.CSUCURSAL_T}</div>
							</display:column>

							<display:column title="${title1}" sortProperty="NNUMIDECLI_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NNUMIDECLI_T}</div>
							</display:column>

							<display:column title="${title2}" sortProperty="TNOMCLI_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TNOMCLI_T}</div>
							</display:column>

							<display:column title="${title3}" sortProperty="IDEBITO_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.IDEBITO_T}</div>
							</display:column>

							<display:column title="${title4}" sortProperty="ICREDITO_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.ICREDITO_T}</div>
							</display:column>

							<display:column title="${title5}" sortProperty="ISALDO_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.ISALDO_T}</div>
							</display:column>

							<display:column title="${title6}" sortProperty="ICODETALLE_T" sortable="true"
								headerClass="sortable" media="html" autolink="false">

								<input type="radio" name="ICODETALLE_T" id="ICODETALLE_T"
									class="campowidthinput campo campotexto" 
									onclick="f_cargar_detalle(${ROW.CSUCURSAL_N},${ROW.NNUMIDECLI_T})"
									<c:if test="${(!empty __formdata.LISTDEPU_SALDOFAVCLI && fn:length(__formdata.LISTDEPU_SALDOFAVCLI) == 1) || (ROW.CSUCURSAL_N == __formdata.IDDETALLE1  && ROW.NNUMIDECLI_T   == __formdata.IDDETALLE2  ) }" >checked</c:if>
									<axis:atr f="axisgca004" c="ICODETALLE_T" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axisgca004" c="ICODETALLE_T" lit="1000113" />"
									title="<axis:alt f="axisgca004" c="ICODETALLE_T" lit="1000113" />" />

							</display:column>

						</display:table>
					</div></td>
			</tr>
		</table>

		<br /> <br />
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><span class="bold"><axis:alt f="axisgca003" c="TITDET" lit="140280"></axis:alt></span>
					<div style="clear: both;">
						<hr class="titulo">
						</hr>
					</div></td>
			</tr>
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca004" c="CSUCURSAL_D" lit="9909330" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca004" c="FDOC_D" lit="9903313" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca004" c="NDOCSAP_D" lit="102999" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca004" c="NNUMIDEAGE_D" lit="9910198" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca004" c="TNOMAGE_D" lit="9902363" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca004" c="NNUMIDECLI_D" lit="9910369" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca004" c="TNOMCLI_D" lit="9909667" />
					</c:set> <c:set var="title7">
						<axis:alt f="axisgca004" c="FCONTAB_D" lit="1000575" />
					</c:set> <c:set var="title8">
						<axis:alt f="axisgca004" c="IDEBITO_D" lit="9910366" />
					</c:set> <c:set var="title9">
						<axis:alt f="axisgca004" c="ICREDITO_D" lit="9910371" />
					</c:set> <c:set var="title10">
						<axis:alt f="axisgca004" c="ISALDO_D" lit="104910" />
					</c:set> <c:set var="title11">
						<axis:alt f="axisgca004" c="TINCONSISTENCIA_D" lit="9910372" />
					</c:set> <c:set var="title12">	
						<axis:alt f="axisgca004" c="CAPUNTE_D" lit="9910374" />					
					</c:set> <c:set var="title13">
						<axis:alt f="axisgca004" c="CGESTION_D" lit="9910373" />
						<br />
						<span class="bold"><axis:alt f="axisgca004" c="CSELTODO" lit="9910368"></axis:alt></span>
						<br />
						<input type="checkbox" name="CSELTODO" 
							id="CSELTODO" class="campowidthinput campo campotexto"
							<axis:atr f="axisgca004" c="CSELTODO" a="formato=entero&modificable=true&obligatorio=false"/>
							alt="<axis:alt f="axisgca004" c="CSELTODO" lit="9910368" />"
							title="<axis:alt f="axisgca004" c="CSELTODO" lit="9910368" />" />
					</c:set> <%
 	int contador = 0;
 %><input type="hidden" name="CUENTA" id="CUENTA"
					value="${fn:length(__formdata.DETLISTDEPU_SALDOFAVCLI)}">

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.DETLISTDEPU_SALDOFAVCLI}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca004.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>

							<display:column title="${title0}" sortProperty="CSUCURSAL_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.CSUCURSAL_D}</div>
							</display:column>
							<display:column title="${title1}" sortProperty="FDOC_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.FDOC_D}</div>
							</display:column>
							<display:column title="${title2}" sortProperty="NDOCSAP_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NDOCSAP_D}</div>
							</display:column>
							<display:column title="${title3}" sortProperty="NNUMIDEAGE_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.NNUMIDEAGE_D}</div>
							</display:column>
							<display:column title="${title4}" sortProperty="TNOMAGE_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TNOMAGE_D}</div>
							</display:column>
							<display:column title="${title5}" sortProperty="NNUMIDECLI_D" sortable="true"
							headerClass="sortable" media="html" autolink="false">
						    <c:choose>
						     <c:when test="${ROW.NNUMIDEAGE_D > 1}">
								<div class="dspText">${""}</div>
						     </c:when>    
						     <c:otherwise>			        
							    <div class="dspText">${ROW.NNUMIDECLI_D}</div>
						     </c:otherwise>
						    </c:choose>
							</display:column>
							<display:column title="${title6}" sortProperty="TNOMCLI_D" sortable="true"
							headerClass="sortable" media="html" autolink="false">
							<c:choose>
						     <c:when test="${ROW.NNUMIDEAGE_D > 1}">
								<div class="dspText">${""}</div>
						     </c:when>    
						     <c:otherwise>			        
							    <div class="dspText">${ROW.TNOMCLI_D}</div>
						     </c:otherwise>
						     </c:choose>
							</display:column>
							<display:column title="${title7}" sortProperty="FCONTAB_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.FCONTAB_D}</div>
							</display:column>
							<display:column title="${title8}" sortProperty="IDEBITO_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.IDEBITO_D}</div>
							</display:column>
							<display:column title="${title9}" sortProperty="ICREDITO_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.ICREDITO_D}</div>
							</display:column>
							<display:column title="${title10}" sortProperty="ISALDO_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.ISALDO_D}</div>
							</display:column>
							<display:column title="${title11}" sortProperty="TINCONSISTENCIA_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TINCONSISTENCIA_D}</div>
							</display:column>
							<display:column title="${title12}" sortProperty="CAPUNTES_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspIcons">
								 <img id="detalleVers_parent" name="detalleVers_parent" src="images/mes.gif" onclick="f_abrir_axisgca006(${ROW.SGSFAVCLI})" style="cursor:pointer">
								</div>
							</display:column>
							<display:column title="${title13}" sortProperty="CGESTION_D" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspIcons">
									<input onclick="javascript:f_mod_tipimp('<%= contador %>',this)"
										<c:if test="${ROW.CGESTION_D==1}">checked</c:if> type="checkbox" id="selectedClausula"
										name="selectedClausula" value="" /> <input type="hidden" name="IDPARAM1_<%= contador %>"
										id="IDPARAM1_<%= contador %>" value="${ROW.SGSFAVCLI}" /> <input type="hidden"
										name="IDPARAM2_<%= contador %>" id="IDPARAM2_<%= contador %>" value="${ROW.FDOC_D}" /> <input
										type="hidden" name="SELEC_<%= contador %>" id="SELEC_<%= contador %>"
										value="${ROW.CGESTION_D}" />
								</div>
							</display:column>
							
							<%
								contador++;
							%>
						</display:table>
					</div></td>
			</tr>
		</table>


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca004</c:param>
			<c:param name="f">axisgca004</c:param>
			<c:param name="f">axisgca004</c:param>
			<c:param name="__botones">cancelar,buscar,aceptar</c:param>
		</c:import>

	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
