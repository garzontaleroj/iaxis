<%/* Revision:# 29m5faqcLg3vpocoyMoUPQ== # */%>

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
		$("#XSELECT").val(null);
		f_cargar_propiedades_pantalla();
                
	}
        
      $(document).ready(function(){
                          
          
      });        
        
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_salir() {
		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgca001", "cancelar", document.miForm, "_self");
	}     
	
	//**********************************************//
	//***************SUCURSAL********************//
	function f_abrir_axisctr014() {  
		objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
      }
            
      function f_cerrar_axisctr014() {
          objUtiles.cerrarModal("axisctr014");
      }
      
      function f_aceptar_axisctr014 (CAGENTE){                      
          f_cerrar_axisctr014();
          objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
      }
      
      function callbackAjaxCambiarAgente(ajaxResponseText){
          var doc=objAjax.domParse(ajaxResponseText); 
          if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              $("#CSUCURSAL").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0));
              $("#TSUCURSAL").val(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)); 
          }
      }
	//**********************************************//
	//Nuevo
	function f_but_nuevo(){
		objUtiles.abrirModal("axisgca008","src","axis_axisgca008.do?operation=form");
	} 
	//Buscar
	function f_but_100797(){
		objUtiles.ejecutarFormulario("axis_axisgca001.do?action=BUSCAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	} 
	//Detalle
	function f_but_102239(){
		if(objUtiles.estaVacio(document.miForm.SeleccionaConciliacion)){
			alert("Seleccione conciliacion");
		}else{
			objUtiles.abrirModal("axisgca009","src","axis_axisgca009.do?operation=form&SIDCON="+$("#XSELECT").val());
		}	
	} 
	//Generar Acta
	function f_but_9910381(){
		var estado =$("#XCESTADO").val();
		if(objUtiles.estaVacio(document.miForm.SeleccionaConciliacion)){
			alert("Seleccione conciliacion");
		}else{
			if(estado!=5){
				objUtiles.ejecutarFormulario("axis_axisgca001.do?SIDCON="+$("#XSELECT").val(),"generarActa", document.miForm, "_self",objJsMessages.jslit_cargando);			

			}else{
				alert("Acta conciliacion finalizada , no se puede generar ya");
			}
					
		}
	}
	//Consultar Acta
	function f_but_9910382(){
		if(objUtiles.estaVacio(document.miForm.SeleccionaConciliacion)){
			alert("Seleccione conciliacion");
		}else{
			objUtiles.abrirModal("axisgca010","src","axis_axisgca010.do?operation=form&action=FORM&SIDCON="+$("#XSELECT").val()+"&CESTADO="+$("#XCESTADO").val());
		}
	}
	//************************************************//
	//************** MODALES ************************//
	function f_cerrar_axisgca008(){
		objUtiles.cerrarModal("axisgca008");
	}
	function f_cerrar_axisgca009(){
		objUtiles.cerrarModal("axisgca009");
	}
	function f_cerrar_axisgca010(){
		objUtiles.cerrarModal("axisgca010");
	}
	
	function f_seleccion(XSELECT, XCESTADO){
		$("#XSELECT").val(XSELECT);
		$("#XCESTADO").val(XCESTADO);
	}
      
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910380" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910380" />
		</c:param>
		<c:param name="form">axisgca001</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr019" c="TITULO" lit="1000234" />
		</c:param>
		<c:param name="nid" value="axisctr014" />
	</c:import>


	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisadm001" c="TIT_ALTACONCILIACION" lit="9910383" />
		</c:param>
		<c:param name="nid" value="axisgca008" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisadm001" c="TIT_ALTACONCILIACION" lit="9910385" />
		</c:param>
		<c:param name="nid" value="axisgca009" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisadm001" c="TIT_ALTACONCILIACION" lit="9910385" />
		</c:param>
		<c:param name="nid" value="axisgca010" />
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> <input type="hidden" id="XSELECT"
			name="XSELECT" value="" />
			 <input type="hidden" id="XCESTADO"
			name="XCESTADO" value="" />


		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca001" c="ACON">
					<td><span class="bold"><axis:alt f="axisgca001" c="ACON" lit="101606"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="ACON" id="ACON"
						value="${__formdata.ACON}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca001" c="ACON" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca001" c="ACON" lit="101606" />"
						title="<axis:alt f="axisgca001" c="ACON" lit="101606" />" /></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca001" c="MCON">
					<td><span class="bold"><axis:alt f="axisgca001" c="MCON" lit="9000495"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca001' c='MCON' lit='9000495' />"
						alt="<axis:alt f='axisgca001' c='MCON' lit='9000495' />" name="MCON" id="MCON" size="1"
						onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca001" c="MCON" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca001" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_MESES}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.MCON}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>
				<td></td>
				<td></td>
			<tr>


				<axis:ocultar dejarHueco="false" f="axisgca001" c="NNUMIDEAGE">
					<td><span class="bold"><axis:alt f="axisgca001" c="NNUMIDEAGE" lit="9910330"></axis:alt></span><br />
						<input type="text" name="NNUMIDEAGE" id="NNUMIDEAGE" value="${__formdata.NNUMIDEAGE}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca001" c="NNUMIDEAGE" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca001" c="NNUMIDEAGE" lit="9910330" />"
						title="<axis:alt f="axisgca001" c="NNUMIDEAGE" lit="9910330" />" /></td>
				</axis:ocultar>
<%--IAXIS 4060 SGM  12/06/2019  se agregan ficheros a cruces cartera--%>				
				<axis:ocultar dejarHueco="false" f="axisgca001" c="NNUMPROCESO">
					<td><span class="bold"><axis:alt f="axisgca001" c="NNUMPROCESO" lit="9910331"></axis:alt></span><br />
						<input type="text" name="NNUMPROCESO"  size="1" id="NNUMPROCESO" value="${__formdata.SIDCON}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca001" c="NNUMPROCESO" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca001" c="NNUMPROCESO" lit="9910330" />"
						title="<axis:alt f="axisgca001" c="NNUMPROCESO" lit="9910330" />" /></td>
				</axis:ocultar>
				
			<tr>
		</table>

		<br /> <br />
		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<td><c:set var="title0">
						<axis:alt f="axisgca001" c="SIDCON" lit="9910331" />
					</c:set> <c:set var="title1">
						<axis:alt f="axisgca001" c="ACON" lit="101606" />
					</c:set> <c:set var="title2">
						<axis:alt f="axisgca001" c="MCON" lit="9000495" />
					</c:set> <c:set var="title3">
						<axis:alt f="axisgca001" c="TDESC" lit="100588" />
					</c:set> <c:set var="title4">
						<axis:alt f="axisgca001" c="TSUCURSAL" lit="9909330" />
					</c:set> <c:set var="title5">
						<axis:alt f="axisgca001" c="TNOMAGE" lit="9910332" />
					</c:set> <c:set var="title6">
						<axis:alt f="axisgca001" c="TFICHERO" lit="9910333" />
					</c:set> <c:set var="title7">
						<axis:alt f="axisgca001" c="SPROCES" lit="9910334" />
					</c:set> <c:set var="title8">
						<axis:alt f="axisgca001" c="TESTADO" lit="100587" />
					</c:set> <%
 	int contador = 0;
 %>

					<div class="seccion displayspaceGrande" style="width: 98%">
						<display:table name="${__formdata.LISTGCA_CONCILIACIONCAB}" id="ROW" export="false"
							class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisgca001.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
							<c:set var="contador"><%=contador%></c:set>


							<display:column title="" sortProperty="XSELECT" sortable="false"
								headerClass="sortable" media="html" autolink="false">
								<input type="radio" name="XSELECT" id="SeleccionaConciliacion" onchange="f_seleccion(${ROW.SIDCON}, ${ROW.CESTADO})"
									<axis:atr f="axisper008" c="XSELECT" a="formato=entero&modificable=true&obligatorio=false"/>
									alt="<axis:alt f="axisper008" c="XSELECT" lit="108341" />"
									title="<axis:alt f="axisper008" c="XSELECT" lit="108341" />" />
							</display:column>





							<display:column title="${title0}" sortProperty="SIDCON" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.SIDCON}</div>
							</display:column>
							<display:column title="${title1}" sortProperty="ACON" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.ACON}</div>
							</display:column>
							<display:column title="${title2}" sortProperty="MCON" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.MCON}</div>
							</display:column>
							<display:column title="${title3}" sortProperty="TDESC" sortable="true" headerClass="sortable"
								media="html" autolink="false">
								<div class="dspText">${ROW.TDESC}</div>
							</display:column>

							<display:column title="${title5}" sortProperty="TNOMAGE" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TNOMAGE}</div>
							</display:column>

							<display:column title="${title6}" sortProperty="TFICHERO" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.TFICHERO}</div>
							</display:column>
							<display:column title="${title7}" sortProperty="SPROCES" sortable="true"
								headerClass="sortable" media="html" autolink="false">
								<div class="dspText">${ROW.SPROCES}</div>
							</display:column>
							<display:column title="${title8}" sortProperty="TESTADO" sortable="true"
								headerClass="sortable" media="html" autolink="false">

								<div class="dspText">
									<c:forEach var="clase" items="${requestScope.LS_CESTADOS}">
										<c:if test="${clase.CATRIBU == ROW.CESTADO}">${clase.TATRIBU}</c:if>
									</c:forEach>
								</div>
							</display:column>

						</display:table>
					</div></td>
			</tr>
		</table>



		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca001</c:param>
			<c:param name="__botones">salir,nuevo,100797,102239,9910381,9910382</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>