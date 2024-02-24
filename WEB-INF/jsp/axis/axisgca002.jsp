<%/* Revision:# IQyKsYT6hFrlP855iFMZhQ== # */%>

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
        
      $(document).ready(function(){
    	  Calendar.setup({
    			inputField : "FINICIO",
    			ifFormat : "%d/%m/%Y",
    			button : "icon_FINICIO",
    			singleClick : true,
    			firstDay : 1
    		});  
    	  Calendar.setup({
    			inputField : "FFINAL",
    			ifFormat : "%d/%m/%Y",
    			button : "icon_FFINAL",
    			singleClick : true,
    			firstDay : 1
    		});
          
      });        
        
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_cancelar() {
		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgca002", "cancelar", document.miForm, "_self");
	}     
	

	//Buscar
	function f_but_buscar(){
		if(document.miForm.CRECOPEN.checked){
			objDom.setValorPorId("CRECOPEN_SEL", 1);
			document.miForm.CRECOPEN_SEL = 1;
			$("#CRECOPEN_SEL").val(1);
		}else{
			document.miForm.CRECOPEN_SEL = 0;
			objDom.setValorPorId("CRECOPEN_SEL", 0);
			$("#CRECOPEN_SEL").val(0);
		}
		objUtiles.ejecutarFormulario("axis_axisgca002.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);		
	} 
	//Apuntes
	function f_but_9910401(){
		objUtiles.abrirModal("axisgca003","src","axis_axisgca003.do?operation=form&action=FORM&NSINIES_R="+$("#NSINIES_R").val()+"&NTRAMIT_R="+$("#NTRAMIT_R").val()+"&NPOLIZA_R="+$("#NPOLIZA_R").val());
	} 
	
	
	function f_abrir_axisper021() {
		objUtiles.abrirModal("axisper021", "src",
				"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS");		
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
	
	function callbackajaxGetPersona(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);
		//alert(ajaxResponseText);
		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

			document.miForm.NNUMIDE.value = '';
			document.miForm.TNOMBRE.value = '';
			document.miForm.SPERSON.value = '';

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

			document.miForm.NNUMIDE.value = NNUMIDE;
			document.miForm.TNOMBRE.value = TAPELLI1 + "" + TAPELLI2 + " ,"
					+ TNOMBRE;

			objDom.setValorPorId("SPERSON", SPERSON);

		}
	}
	
	
	function f_cerrar_axisgca003(){
		objUtiles.cerrarModal("axisgca003");
	}
	
	function cargar_productos(){
		// INI - AXIS 3999 - ML - REFERENCIA A METODO AJAX DE BUSQUEDA
        objAjax.invokeAsyncCGI("axis_axisgca002.do", callbackAjax, "operation=ajax_busqueda_productos&action=FORM&CRAMO="+$("#CRAMO").val(), this, objJsMessages.jslit_actualizando_registro);
      	// FIN - AXIS 3999 - ML - REFERENCIA A METODO AJAX DE BUSQUEDA
	}
	
	function f_seleccion(NSINIES_R,NTRAMIT_R,NPOLIZA_R){
		$("#NSINIES_R").val(NSINIES_R);
		$("#NTRAMIT_R").val(NTRAMIT_R);
		$("#NPOLIZA_R").val(NPOLIZA_R);
		
	}
	//INI - AXIS 3999 - ML - CODIFICACION DE CALLBACK PARA CARGAR DATOS EN SELECT DE PRODUCTOS
	function callbackAjax(data){		
		var doc=objAjax.domParse(data);
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){        	
            var elementos = doc.getElementsByTagName("SPRODUC");
            var SPRODUCCombo = document.miForm.SPRODUC;     
            objDom.borrarOpcionesDeCombo(SPRODUCCombo);
            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisgca002" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
               for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            seleccionarOpcionCombo(objDom.getValorPorId("SPRODUC_SELEC"),SPRODUCCombo);
        }
	}
  	function seleccionarOpcionCombo(elemento, combo) {
        var cantidad = combo.length;
        for (i = 0; i < cantidad; i++) {
           if (combo[i].value == elemento) {
              combo[i].selected = true;
           }   
        }
    }
	//FIN - AXIS 3999 - ML - CODIFICACION DE CALLBACK PARA CARGAR DATOS EN SELECT DE PRODUCTOS
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910400" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910400" />
		</c:param>
		<c:param name="form">axisgca002</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="9910402" />
		</c:param>
		<c:param name="nid" value="axisgca003" />
	</c:import>




	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" id="SPERSON"
			name="SPERSON" value="${__formdata.SPERSON}" />
			<input type="hidden" id="NSINIES_R" name="NSINIES_R" value="${__formdata.NSINIES_R}" />
			<input type="hidden" id="NTRAMIT_R" name="NTRAMIT_R" value="${__formdata.NTRAMIT_R}" />
			<input type="hidden" id="NPOLIZA_R" name="NPOLIZA_R" value="${__formdata.NPOLIZA_R}" />
			<input type="hidden" id="CRECOPEN_SEL" name="CRECOPEN_SEL" value="${__formdata.CRECOPEN_SEL}" />


		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca002" c="NNUMIDE">
					<td><span class="bold"><axis:alt f="axisgca002" c="NNUMIDE" lit="9910042"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NNUMIDE" id="NNUMIDE"
						value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca002" c="NNUMIDE" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="NNUMIDE" lit="9910042" />"
						title="<axis:alt f="axisgca002" c="NNUMIDE" lit="9910042" />" /> <img border="0"
						src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor: pointer"></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="TNOMBRE">
					<td colspan="2"><span class="bold"><axis:alt f="axisgca002" c="TNOMBRE"
								lit="9909970"></axis:alt></span><br /> <input type="text" name="TNOMBRE" id="TNOMBRE"
						value="${__formdata.TNOMBRE}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca002" c="TNOMBRE" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="TNOMBRE" lit="9909970" />"
						title="<axis:alt f="axisgca002" c="TNOMBRE" lit="9909970" />" /></td>
				</axis:ocultar>
			</tr>
			<tr>			
				<axis:ocultar dejarHueco="false" f="axisgca002" c="CRAMO">
					<td><span class="bold"><axis:alt f="axisgca002" c="CRAMO" lit="100784"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca002' c='CRAMO' lit='100784' />"
						alt="<axis:alt f='axisgca002' c='CRAMO' lit='100784' />" name="CRAMO" id="CRAMO" size="1"
						onchange="cargar_productos();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca002" c="CRAMO" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca002" c="BLANCO" lit="1000348" /> -
							</option>							
							<c:forEach var="clase" items="${__formdata.LS_RAMOS}">
								<option value="${clase.CRAMO}"
									<c:if test="${clase.CRAMO == __formdata.CRAMO}">selected</c:if>>${clase.TRAMO}</option>
							</c:forEach>

					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="SPRODUC">
					<td><span class="bold"><axis:alt f="axisgca002" c="SPRODUC" lit="9902909"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca002' c='SPRODUC' lit='9902909' />"
						alt="<axis:alt f='axisgca002' c='SPRODUC' lit='9902909' />" name="SPRODUC" id="SPRODUC"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca002" c="SPRODUC" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca002" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${__formdata.LS_PRODUCTOS}">
								<option value="${clase.SPRODUC}"
									<c:if test="${clase.SPRODUC == __formdata.SPRODUC}">selected</c:if>>${clase.TTITULO}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="NPOLIZA">
					<td><span class="bold"><axis:alt f="axisgca002" c="NPOLIZA" lit="9001514"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NPOLIZA" id="NPOLIZA"
						value="${__formdata.NPOLIZA}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca002" c="NPOLIZA" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="NPOLIZA" lit="9001514" />"
						title="<axis:alt f="axisgca002" c="NPOLIZA" lit="9001514" />" /></td>
				</axis:ocultar>
			</tr>
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca002" c="NCERTIF">
					<td><span class="bold"><axis:alt f="axisgca002" c="NCERTIF" lit="104595"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NCERTIF" id="NCERTIF"
						value="${__formdata.NCERTIF}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca002" c="NCERTIF" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="NCERTIF" lit="104595" />"
						title="<axis:alt f="axisgca002" c="NCERTIF" lit="104595" />" /></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="NSINIES">
					<td><span class="bold"><axis:alt f="axisgca002" c="NSINIES" lit="100585"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="NSINIES" id="NSINIES"
						value="${__formdata.NSINIES}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca002" c="NSINIES" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="NSINIES" lit="100585" />"
						title="<axis:alt f="axisgca002" c="NSINIES" lit="100585" />" /></td>
				</axis:ocultar>



			</tr>
			<tr>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="FINICIO">
					<td><span class="bold"><axis:alt f="axisgca002" c="FINICIO" lit="9908885"></axis:alt></span><br />
						<input type="text" name="FINICIO" id="FINICIO" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>"
						title="<axis:alt f='axisgca002' c='FINICIO' lit='9908885'/>"
						alt="<axis:alt f='axisgca002' c='FINICIO' lit='9908885'/>"
						<axis:atr f="axisgca002" c="FINICIO" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FINICIO" alt="<axis:alt f="axisgca002" c="FINICIO" lit="9908885"/>"
									title="<axis:alt f="axisgca002" c="FINICIO" lit="9908885" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="FFINAL">
					<td><span class="bold"><axis:alt f="axisgca002" c="FFINAL" lit="9910357"></axis:alt></span><br />
						<input type="text" name="FFINAL" id="FFINAL" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINAL}"/>"
						title="<axis:alt f='axisgca002' c='FFINAL' lit='9910357'/>"
						alt="<axis:alt f='axisgca002' c='FFINAL' lit='9910357'/>"
						<axis:atr f="axisgca002" c="FFINAL" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FFINAL" alt="<axis:alt f="axisgca002" c="FFINAL" lit="9910357"/>"
									title="<axis:alt f="axisgca002" c="FFINAL" lit="9910357" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca002" c="CRECOPEN">
					<td><span class="bold"><axis:alt f="axisgca002" c="CRECOPEN" lit="9910358"></axis:alt></span><br />
						<input type="checkbox" name="CRECOPEN" <c:if test="${__formdata.CRECOPEN_SEL==1}">checked</c:if>
						id="CRECOPEN" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca002" c="CRECOPEN" a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca002" c="CRECOPEN" lit="9910358" />"
						title="<axis:alt f="axisgca002" c="CRECOPEN" lit="9910358" />" /></td>
				</axis:ocultar>
			</tr>
		</table>

		<br /> <br />
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td>
					<c:set var="title0">
						<axis:alt f="axisgca002" c="NSINIES_R" lit="103688" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca002" c="NTRAMIT_R" lit="9000908" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca002" c="NPOLIZA_R" lit="111324" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca002" c="NCERTIF_R" lit="104595" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca002" c="TTOMADOR_R" lit="9908119" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca002" c="TASEGURADO_R" lit="101028" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca002" c="TBENEFICIARIO_R" lit="9001911" />
					</c:set> <c:set var="title7">
						<axis:alt f="axisgca002" c="TAGENTE_R" lit="100584" />
					</c:set> <%
 	int contador = 0;
 %>

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.GCA_CONCILIACIONCABS}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca002.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
							<c:set var="contador"><%=contador%></c:set>


							<display:column title=" " sortProperty="XSELECT" sortable="false"
								headerClass="sortable" media="html" autolink="false">
								<input type="radio" name="XSELECT" onchange="f_seleccion(${ROW.NSINIES_R},${ROW.NTRAMIT_R},${ROW.NPOLIZA_R})"
									<axis:atr f="axisper008" c="XSELECT" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axisper008" c="XSELECT" lit="108341" />"
									title="<axis:alt f="axisper008" c="XSELECT" lit="108341" />" />
							</display:column>

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



		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca002</c:param>
			<c:param name="__botones">cancelar,buscar,9910401</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>