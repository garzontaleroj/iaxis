<%/* Revision:# 07NEL4Lzd1KeeXU2a6Yh9Q== # */%>

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
                          
          
      });        
        
  

	function isNumberKey(evt){
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }

	function f_but_salir() {
		objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisgca008", "cancelar", document.miForm, "_self");
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
	function f_but_cancelar(){		
		parent.f_cerrar_axisgca008();
	} 
	//Buscar
	function f_but_aceptar(){
		objUtiles.ejecutarFormulario("axis_axisgca008.do?action=ACEPTAR","form", document.miForm, "_self",objJsMessages.jslit_cargando);
	} 
	
      
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910383" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910383" />
		</c:param>
		<c:param name="form">axisgca008</c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisctr019" c="TITULO" lit="1000234" />
		</c:param>
		<c:param name="nid" value="axisctr014" />
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />


		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca008" c="ACON">
					<td><span class="bold"><axis:alt f="axisgca008" c="ACON" lit="101606"></axis:alt></span><br />
						<input onkeypress="return isNumberKey(event)" type="text" name="ACON" id="ACON"
						value="${__formdata.ACON}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca008" c="ACON" 
			a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca008" c="ACON" lit="101606" />"
						title="<axis:alt f="axisgca008" c="ACON" lit="101606" />" /></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca008" c="MCON">
					<td><span class="bold"><axis:alt f="axisgca008" c="MCON" lit="9000495"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca008' c='MCON' lit='9000495' />"
						alt="<axis:alt f='axisgca008' c='MCON' lit='9000495' />" name="MCON" id="MCON" size="1"
						onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca008" c="MCON" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca008" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_MESES}">
								<option value="${clase.CATRIBU}"
									<c:if test="${clase.CATRIBU == __formdata.MCON}">selected</c:if>>${clase.TATRIBU}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca008" c="TDESC">
					<td><span class="bold"><axis:alt f="axisgca008" c="TDESC" lit="100588"></axis:alt></span><br />
						<input type="text" name="TDESC" id="TDESC"
						value="${__formdata.TDESC}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca008" c="TDESC" 
			a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca008" c="TDESC" lit="100588" />"
						title="<axis:alt f="axisgca008" c="TDESC" lit="100588" />" /></td>
				</axis:ocultar>


				<td></td>
			<tr>

				<axis:ocultar dejarHueco="false" f="axisgca008" c="CSUCURSAL">
					<td><span class="bold"><axis:alt f="axisgca008" c="CSUCURSAL" lit="9909330"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca008' c='CSUCURSAL' lit='9000495' />"
						alt="<axis:alt f='axisgca008' c='CSUCURSAL' lit='9000495' />" name="CSUCURSAL" id="CSUCURSAL"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca008" c="CSUCURSAL" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca008" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_SUCURSALES}">
								<option value="${clase.CAGENTE}"
									<c:if test="${__formdata.CSUCURSAL == clase.CAGENTE}">selected</c:if>>
									${clase.TAGENTE}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>



				<axis:ocultar dejarHueco="false" f="axisgca008" c="NNUMIDEAGE">
					<td><span class="bold"><axis:alt f="axisgca008" c="NNUMIDEAGE" lit="9910330"></axis:alt></span><br />
						<input type="text" name="NNUMIDEAGE" id="NNUMIDEAGE" value="${__formdata.NNUMIDEAGE}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca008" c="NNUMIDEAGE" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca008" c="NNUMIDEAGE" lit="9910330" />"
						title="<axis:alt f="axisgca008" c="NNUMIDEAGE" lit="9910330" />" /></td>
				</axis:ocultar>
			<tr>



				<axis:ocultar dejarHueco="false" f="axisgca008" c="CFICHERO">
					<td><span class="bold"><axis:alt f="axisgca008" c="CFICHERO" lit="9910335"></axis:alt></span><br />
						<select title="<axis:alt f='axisgca008' c='CFICHERO' lit='9910335' />"
						alt="<axis:alt f='axisgca008' c='CFICHERO' lit='9910335' />" name="CFICHERO" id="CFICHERO"
						size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
						<axis:atr f="axisgca008" c="CFICHERO" a="isInputText=false&modificable=true"/>>
							<option selected value>-
								<axis:alt f="axisgca008" c="BLANCO" lit="1000348" /> -
							</option>
							<c:forEach var="clase" items="${requestScope.LS_GCA_CARGACONC}">
								<option value="${clase.CFICHERO}"
									<c:if test="${clase.CFICHERO == __formdata.CFICHERO}">selected</c:if>>${clase.TDESCRIP}</option>
							</c:forEach>
					</select></td>
				</axis:ocultar>

				<axis:ocultar dejarHueco="false" f="axisgca008" c="SPROCES">
					<td><span class="bold"><axis:alt f="axisgca008" c="SPROCES" lit="9910334"></axis:alt></span><br />
						<input type="text" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"
						class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca008" c="SPROCES" a="modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca008" c="SPROCES" lit="9910334" />"
						title="<axis:alt f="axisgca008" c="SPROCES" lit="9910334" />" /></td>
				</axis:ocultar>
				<td></td>
			</tr>
		</table>


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca008</c:param>
			<c:param name="f">axisgca008</c:param>
			<c:param name="__botones">cancelar,aceptar</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>