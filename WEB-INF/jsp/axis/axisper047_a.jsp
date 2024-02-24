<%/* Revision:# sjuPn//o2ZC601ObPr8vxA== # */%>

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
<c:import url="../include/modal_estandar.jsp">
  <c:param name="titulo"><axis:alt f="axisper047" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
  <c:param name="nid" value="axisper021" />
</c:import>

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
		parent.f_but_cerrar_axisper047_a();
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
		if(document.getElementById("NNUMIDE").value == ""){
			alert("<axis:alt f='axisper047' c='NNUMIDE' lit='9902301' />");
			
		}else{
			if (objValidador.validaEntrada()) {	
				objAjax.invokeAsyncCGI("axis_axisper047_a.do",
						callBackResponse,
						"operation=aceptara"+serial("miForm"),
						this, objJsMessages.jslit_actualizando_registro);	
				}
		}
	}
	function f_but_cancelar() {
		parent.f_but_cerrar_axisper047_a();
	}

	
	function f_abrir_axisper021 () {
        var SSEGURO = "${__formdata.SSEGURO}";
        var CAGENTE = "${__formdata.CAGENTE}";
        objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
  }

  function f_cerrar_axisper021(){
	  f_cerrar_modalespersona("axisper021");
  }   
	 
  function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
  }
  
  function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
      
      f_cerrar_modalespersona(modal);
      
       if (!objUtiles.estaVacio(SPERSON)){          
        objAjax.invokeAsyncCGI("axis_axisper047.do?SPERSON_REL="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
      }
    }

  function callbackAjaxActualitzaPersona (ajaxResponseText) {
      try{
         
         var doc = objAjax.domParse(ajaxResponseText);

          if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
               
               objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
             
               var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
               var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
               var NOMBRE_COMPLETO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE_COMPLETO")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE_COMPLETO"), 0, 0) : "");
               var TIPOID = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIPOID")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIPOID"), 0, 0) : "");
               
               objDom.setValorPorId("CTIPIDEN", TIPOID);
               objDom.setValorPorId("TNOMBRE", NOMBRE_COMPLETO);   
               }          
       
      }catch(e){}
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
				<axis:alt f="axisper047" c="TITULO" lit="89906150" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisper047" c="TITULO" lit="89906150" />
			</c:param>
			<c:param name="form">axisper047</c:param>
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


								<axis:ocultar dejarHueco="false" f="axisper047" c="CTIPIDEN">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CTIPIDEN" lit="9909619"></axis:alt></span><br /> <select 
										title="<axis:alt f='axisper047' c='CTIPIDEN' lit='9909619' />"
										alt="<axis:alt f='axisper047' c='CTIPIDEN' lit='9909619' />"
										name="CTIPIDEN" id="CTIPIDEN" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="CTIPIDEN" a="isInputText=false&modificable=false&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="element" items="${sessionScope.ls_identificaciones}">
                                                <option value = "${element.CATRIBU}"
													<c:if test="${element.CATRIBU == __formdata.CTIPIDEN}">selected</c:if>>
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
									</select></td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper047" c="NNUMIDE">
									<td><span class="bold"><axis:alt f="axisper047"
												c="NNUMIDE" lit="9904434"></axis:alt></span><br /> <input
										onkeypress="return isNumberKey(event)" type="text"
										name="NNUMIDE" id="NNUMIDE"
										value="${__formdata.NNUMIDE}"
										class="campowidthinput campo campotexto" 
										<axis:atr f="axisper047" c="NNUMIDE" 
											a="modificable=false&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />"
										title="<axis:alt f="axisper047" c="NNUMIDE" lit="9904434" />" />
										<axis:visible f="axisper047" c="BUSC_PERS">
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                        </axis:visible>
									</td>
								</axis:ocultar>

								<axis:ocultar dejarHueco="false" f="axisper047" c="TNOMBRE">
									<td><span class="bold"><axis:alt f="axisper047"
												c="TNOMBRE" lit="9907629"></axis:alt></span><br /> <input
										type="text" name="TNOMBRE" id="TNOMBRE"
										value="${__formdata.TNOMBRE}"
										class="campowidthinput campo campotexto" style="width: 90%;"
										<axis:atr f="axisper047" c="TNOMBRE" a="modificable=false&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />"
										title="<axis:alt f="axisper047" c="TNOMBRE" lit="9907629" />" />
									</td>
								</axis:ocultar>

							</tr>
							<tr>


								<axis:ocultar dejarHueco="false" f="axisper047" c="PPARTICI">
									<td><br /><span class="bold"><axis:alt f="axisper047"
												c="PPARTICI" lit="104818"></axis:alt></span><br /> <input
										 type="text"
										name="PPARTICI" id="PPARTICI"
										value="${__formdata.PPARTICI}"
										class="campowidthinput campo campotexto" 
										<axis:atr f="axisper047" c="PPARTICI" 
											a="modificable=true&obligatorio=true"/>
										alt="<axis:alt f="axisper047" c="PPARTICI" lit="104818" />"
										title="<axis:alt f="axisper047" c="PPARTICI" lit="104818" />" />
									</td>
								</axis:ocultar>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CBOLSA">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CBOLSA" lit="89906151"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='CBOLSA' lit='89906151' />"
										alt="<axis:alt f='axisper047' c='CBOLSA' lit='89906151' />"
										name="CBOLSA" id="CBOLSA" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="CBOLSA" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
												<option value="${clase.CATRIBU}"
													<c:if test="${clase.CATRIBU == __formdata.CBOLSA}">selected</c:if>>
													${clase.TATRIBU}
												</option>
											</c:forEach>
									</select></td>
								</axis:ocultar>
							
								<axis:ocultar dejarHueco="false" f="axisper047" c="CPEP">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CPEP" lit="89906152"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='CPEP' lit='89906152' />"
										alt="<axis:alt f='axisper047' c='CPEP' lit='89906152' />"
										name="CPEP" id="CPEP" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="CPEP" a="isInputText=false&modificable=true&obligatorio=true"/>>
											<option disabled selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="clase" items="${sessionScope.LS_VALORES}">
												<option value="${clase.CATRIBU}"
													<c:if test="${clase.CATRIBU == __formdata.CPEP}">selected</c:if>>
													${clase.TATRIBU}
												</option>
											</c:forEach>
									</select></td>
								</axis:ocultar>
							</tr>
							<tr>
								<axis:ocultar dejarHueco="false" f="axisper047" c="CTRIBUEXT">
									<td><span class="bold"><axis:alt f="axisper047"
												c="CTRIBUEXT" lit="89906153"></axis:alt></span><br /> <select
										title="<axis:alt f='axisper047' c='CTRIBUEXT' lit='89906153' />"
										alt="<axis:alt f='axisper047' c='CTRIBUEXT' lit='89906153' />"
										name="CTRIBUEXT" id="CTRIBUEXT" size="1"
										onchange="cargar_pantalla_por_clase();"
										class="campowidthselect campo campotexto_ob"
										<axis:atr f="axisper047" c="CTRIBUEXT" a="isInputText=false&modificable=true&obligatorio=false"/>>
											<option selected value>-
												<axis:alt f="axisper047" c="BLANCO" lit="1000348" /> -
											</option>
											<c:forEach var="clase" items="${sessionScope.LS_PAIS}">
												<option value="${clase.CPAIS}"
													<c:if test="${clase.CPAIS == __formdata.CTRIBUEXT}">selected</c:if>>
													${clase.TPAIS}
												</option>
											</c:forEach>
									</select></td>
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
