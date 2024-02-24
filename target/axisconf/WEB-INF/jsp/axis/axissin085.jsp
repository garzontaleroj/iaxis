
<%
	/*
	*  Fichero: axissin085.jsp
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
<title>Traspaso de cartera de agente</title>
<%-- Traspaso de cartera de agente --%>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />

<style type="text/css">
.displayspaceMaximo {
	width: 99.8%;
	height: expression(this.scrollHeight > 349 ? "350px" : "auto");
	max-height: 350px;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px solid #DDDDDD;
}
</style>

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

<!-- 7782-86 SE AJUSTA PARA QUE LA PANTALLA SOLO PUEDA MIGRAR POLIZAS -->
<script type="text/javascript">
        function f_onload() {     
            
            //var numSiniestros = ${fn:length(__formdata.lista_sin)};
            var ok = "${__formdata.OK}";
            var seguro = "${__formdata.SEGURO}";
            var persona = "${__formdata.TERCERO}";
            var siniestro = "${__formdata.SINIESTRO}";
            var res = "${__formdata.RES}";//7782-83
          	
            if (!objUtiles.estaVacio(ok)){
	            if (ok != 0){
	            	if (ok == 1100000){
	            		alert("El proceso de migración terminó correctamente se genero el numero de poliza: " + seguro);
	            	}else if(ok == 1000000){
	            		alert("Se deben colocar parametros de entrada correctos.");
	            	}else if(ok == 1000001){
	            		alert("La póliza no existe en el origen.");
	            	}else if(ok == 1000002){
	            		alert("La póliza existe en el origen.");
	            	}else if(ok == 1000003){
	            		alert("La póliza ya fue migrada, el proceso se detiene.");
	            	}else if(ok == 1000004){
	            		alert("El tercero no existe en el origen.");
	            	}else if(ok == 1000005){
	            		alert("El tercero existe en el origen.");
	            	}else if(ok == 1000006){
	            		alert("El tercero ya fue migrado, el proceso se detiene.");
	            	}else if(ok == 1000007){
	            		alert("El siniestro no existe en el origen.");
	            	}else if(ok == 1000008){
	            		alert("El siniestro existe en el origen.");
	            	}else if(ok == 1000009){
	            		alert("El siniestro ya fue migrado, el proceso se detiene.");
	                }
	            	else if(ok == 1999999){
	            		alert("Se encontraron errores durante la ejecución de la migración, favor revisar el log, se detiene el proceso. Release: " + res);
	            	}
	            }else{
	            	if(seguro != 0){
	            		alert("El proceso termino correctamente, se genera la poliza: " + seguro);
	            	}else if(persona != 0){
	            		alert("El proceso termino correctamente, se genera el tercero: " + persona);
	            	}else if(siniestro != 0){
	            		alert("El siniestro termino correctamente, se genera el siniestro: " + siniestro);
	            	}
	            }
            f_cargar_propiedades_pantalla();
        	}
        }
        
        
        function f_but_consultar() {
            var inputs=document.getElementsByTagName("input");
            var siniestros = null;
            var siniestro = null;
                     objUtiles.ejecutarFormulario ("axis_axissin085.do?",
                                              "consultar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro); 
            
         }
        
        function f_but_aceptar() {
            var inputs=document.getElementsByTagName("input");
            objUtiles.ejecutarFormulario ("axis_axissin085.do?",
                                              "aceptar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro); 
            
         }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axissin085", "cancelar", document.miForm, "_self");                   
        }
        
        
    </script>
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}"
	onload="f_onload()">

	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<form name="miForm" action="" method="POST">

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="axissin085" c="TITULO" lit="89907017" />
			</c:param>
			<%-- Cambio masivo de tramitador --%>
			<c:param name="formulario">
				<axis:alt f="axissin085" c="TITULO" lit="89907017" />
			</c:param>
			<%-- Cambio masivo de tramitador --%>
			<c:param name="form">axissin085</c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axissin019|<axis:alt
					f="axissin085" c="TITULO_DOMIC" lit="" />
			</c:param>
			<%-- INTRODUCCIÓN DE UN RIESGO DOMICILIO --%>
		</c:import>

		<input type="hidden" name="operation" value="" />

		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<!--campos-->
					<table class="seccion">
						<tr>
							<th style="width: 1%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 25%; height: 0px"></th>
							<th style="width: 23%; height: 0px"></th>
							<th style="width: 1%; height: 0px"></th>
						</tr>
						<tr>
							<td></td>
							<axis:visible c="CNPOLIZA" f="axissin085">
								<td class="titulocaja"><b><axis:alt f="axissin085"
											c="CNPOLIZA" lit="9908968" /></b>
								<!-- Numero de poliza --></td>
							</axis:visible>
							<axis:visible c="CSUCURSAL" f="axissin016">
								<td class="titulocaja"><b><axis:alt f="axissin085"
											c="CSUCURSAL" lit="9909330" /></b>
								<!-- codigo de sucursal --></td>
							</axis:visible>
						</tr>
						<tr>
							<td></td>
							<axis:visible c="CNPOLIZA" f="axissin085">
								<td class="campocaja"><input type="text"
									class="campowidthinput campo campotexto"
									value="${__formdata.CNPOLIZA}" name="CNPOLIZA" id="CNPOLIZA"
									<axis:atr f="axissin085" c="CNPOLIZA" a="modificable=true"/>
									title="<axis:alt f="axissin085" c="CNPOLIZA" lit="9908968"/>"
									size="5" /></td>
							</axis:visible>
							<!-- Unitat Tramitació -->
							<axis:visible c="CUNITRANEW" f="axissin085">
								<td class="campocaja"><select name="CSUCURSAL"
									id="CSUCURSAL" onchange="f_cambiaSucursal()"
									title="<axis:alt f="axisctr019" c="CSUCURSAL" lit="9000436" />"
									<axis:atr f="axisadm001" c="CSUCURSAL" a="obligatorio=false&modificable=true&isInputText=false"/>
									size="1" class="campowidthselect campo campotexto"
									style="width: 94%;">
										<option value="-1">-
											<axis:alt f="axisctr019" c="BLANCO" lit="108341" /> -
										</option>
										<c:forEach var="item" items="${sucursales}">
											<option value="${item.CAGENTE}"
												<c:if test="${__formdata.CSUCURSAL == item.CAGENTE}">selected</c:if>>
												${item.TAGENTE}</option>
										</c:forEach>
								</select></td>
							</axis:visible>

						</tr>
					</table>
				</td>
			</tr>

		</table>

		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axissin085</c:param>
			<c:param name="__botones">salir,aceptar,consultar</c:param>
		</c:import>

	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>