<%/* Revision:# 0Q7UA6jyHoTPsgph7Q93uw== # */%>

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
    			inputField : "FSOLUCION",
    			ifFormat : "%d/%m/%Y",
    			button : "icon_FSOLUCION",
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
	

	//Nuevo
	function f_but_cancelar(){		
		parent.f_cerrar_axisgca012();
	} 
	//Buscar
	function f_but_aceptar(){
		var CRESPAGE=null;
		var CRESPCIA=null;
		
		if($("#CRESPAGE").is(":checked")){
			CRESPAGE=1;
		}
		if($("#CRESPCIA").is(":checked")){
			CRESPCIA=1;
		}
		parent.guardar_axisgca012($("#SIDCON").val(),
				$("#NCONCIACT").val(),
				$("#CCONACTA").val(),
				CRESPAGE,
				CRESPCIA,
				$("#FSOLUCION").val(),
				$("#TOBS").val());
	} 
	
      
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axisadm001" c="TITULO" lit="9910398" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axisadm001" c="TITULO" lit="9910398" />
		</c:param>
		<c:param name="form">axisgca012</c:param>
	</c:import>

	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		<input type="hidden" name=NCONCIACT id="NCONCIACT" value="${__formdata.ITMGCA_CONCILIACION_ACTA.NCONCIACT}" />
		<input type="hidden" name=CCONACTA id="CCONACTA" value="${__formdata.ITMGCA_CONCILIACION_ACTA.CCONACTA}" />
		<input type="hidden" name=SIDCON id="SIDCON" value="${__formdata.ITMGCA_CONCILIACION_ACTA.SIDCON}" />
		<input type="hidden" name=OCULTAC id="OCULTAC" value="${__formdata.OCULTAC}" />
		


		<table class="seccion" style="width: 90%;" align="center">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca012" c="DESCONACTA">
					<td colspan="3"><span class="bold"><axis:alt f="axisgca012" c="DESCONACTA"
								lit="9910353"></axis:alt></span><br /> <input type="text" name="DESCONACTA" id="DESCONACTA"
						value="${__formdata.ITMGCA_CONCILIACION_ACTA.DESCONACTA}" class="campowidthinput campo campotexto" style="width: 90%;"
						<axis:atr f="axisgca012" c="DESCONACTA" a="modificable=false&obligatorio=false"/>
						alt="<axis:alt f="axisgca012" c="DESCONACTA" lit="9910353" />"
						title="<axis:alt f="axisgca012" c="DESCONACTA" lit="9910353" />" /></td>
				</axis:ocultar>
			</tr>
			<c:if test="${__formdata.OCULTAC==0}">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca012" c="CRESPAGE">
					<td><span class="bold"><axis:alt f="axisgca012" c="CRESPAGE" lit="9910390"></axis:alt></span><br />
						<input type="checkbox" name="CRESPAGE" <c:if test="${__formdata.ITMGCA_CONCILIACION_ACTA.CRESPAGE==1}">checked</c:if>
						id="CRESPAGE" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca012" c="CRESPAGE" a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca012" c="CRESPAGE" lit="9910390" />"
						title="<axis:alt f="axisgca012" c="CRESPAGE" lit="9910390" />" /></td>
				</axis:ocultar>


				<axis:ocultar dejarHueco="false" f="axisgca012" c="CRESPCIA">
					<td><span class="bold"><axis:alt f="axisgca012" c="CRESPCIA" lit="9910391"></axis:alt></span><br />
						<input type="checkbox" name="CRESPCIA" <c:if test="${__formdata.ITMGCA_CONCILIACION_ACTA.CRESPCIA==1}">checked</c:if>
						id="CRESPCIA" class="campowidthinput campo campotexto"
						<axis:atr f="axisgca012" c="CRESPCIA" a="formato=entero&modificable=true&obligatorio=false"/>
						alt="<axis:alt f="axisgca012" c="CRESPCIA" lit="9910391" />"
						title="<axis:alt f="axisgca012" c="CRESPCIA" lit="9910391" />" /></td>
				</axis:ocultar>


				<axis:ocultar dejarHueco="false" f="axisgca012" c="FSOLUCION">
					<td><span class="bold"><axis:alt f="axisgca012" c="FSOLUCION" lit="9910389"></axis:alt></span><br />
						<input type="text" name="FSOLUCION" id="FSOLUCION" size="15" class="campo campotexto"
						style="width: 70%;"
						value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.ITMGCA_CONCILIACION_ACTA.FSOLUCION}"/>"
						title="<axis:alt f='axisgca012' c='FSOLUCION' lit='9910389'/>"
						alt="<axis:alt f='axisgca012' c='FSOLUCION' lit='9910389'/>"
						<axis:atr f="axisgca012" c="FSOLUCION" a="formato=fecha&modificable=true&obligatorio=true"/> />
						<a style="vertical-align: middle;"> <c:if test="${__formdata.CMODO != 'CONSULTA'}">
								<img id="icon_FSOLUCION" alt="<axis:alt f="axisgca012" c="FSOLUCION" lit="9910389"/>"
									title="<axis:alt f="axisgca012" c="FSOLUCION" lit="9910389" />" src="images/calendar.gif" />
							</c:if>
					</a></td>
				</axis:ocultar>
			</tr>
			</c:if>
			<c:if test="${__formdata.OCULTAC==1}">
			<tr>
				<axis:ocultar dejarHueco="false" f="axisgca012" c="TOBS">
					<td colspan="3"><span class="bold"><axis:alt f="axisgca012" c="TOBS" lit="101162"></axis:alt></span><br />
						<textarea cols="100" rows="5" name="TOBS" id="TOBS" 
							class="campowidthinput campo campotexto" style="width: 90%;"
							<axis:atr f="axisgca012" c="TOBS" a="modificable=true&obligatorio=false"/>
							alt="<axis:alt f="axisgca012" c="TOBS" lit="101162" />"
							title="<axis:alt f="axisgca012" c="TOBS" lit="101162" />">${__formdata.ITMGCA_CONCILIACION_ACTA.TOBS}</textarea></td>
				</axis:ocultar>
			</tr>
			</c:if>
		</table>


		<div class="separador">&nbsp;</div>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisgca012</c:param>
			<c:param name="f">axisgca012</c:param>
			<c:param name="__botones">cancelar,aceptar</c:param>
		</c:import>


	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>