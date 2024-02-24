
<%
	/* Revision:# cg6wHR2vZv6cgcAomfE/Ug== # */
%>
<%
	/*
	*  Fichero: axisadm102.jsp
	*  Fecha: 09/07/2019
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

<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {

		Calendar.setup({
            inputField     :    "FHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FHASTA", 
            singleClick    :    true,
            firstDay       :    1
        });
		Calendar.setup({
            inputField     :    "FDESE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FDESE", 
            singleClick    :    true,
            firstDay       :    1
        });
		f_cargar_propiedades_pantalla();
		
		if (!($('#outsourcing').is(':checked') || $('#tomador').is(':checked') )){
			$("#outsourcing").prop("checked", true);
		}
	}
	
	 function f_but_salir() {
         objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
     } 
	 
	 function f_cerrar_modal(cual){
         objUtiles.cerrarModal(cual);
     }
	 
	  function f_cerrar_axisctr014() {
          objUtiles.cerrarModal("axisctr014")
      } 
     function f_abrir_axisctr014() {
         objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
     }
     function f_aceptar_axisctr014 (CAGENTE){
         objDom.setValorPorId("CAGENTE", CAGENTE);
         f_cerrar_axisctr014();
         objAjax.invokeAsyncCGI("axis_axisadm102.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
     }
     function callbackAjaxCambiarAgente(ajaxResponseText){
         var doc=objAjax.domParse(ajaxResponseText);
         if(!objAppMensajes.existenErroresEnAplicacion(doc)){
         var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
         var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
         objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
         objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
             }
     }
     
     function mostrar(nombreCapa,nombreDIV){ 
    	  objUtiles.scrollPoll(nombreCapa,nombreDIV);
    	} 

     function f_but_buscar() {
 		
    	 if(objValidador.validaEntrada()){
    		 objUtiles.ejecutarFormulario("axis_axisadm102.do?cargaPersonas=true", "buscar",
    	 				document.miForm, "_self", objJsMessages.jslit_cargando); 
    	 }
 	}


	function f_but_cancelar() {
		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisadm102",
				"cancelar", document.miForm, "_self");
	}
	  function f_cargar_DATOSPERSONA() {  
          
          var nnumide = objDom.getValorPorId("NNUMIDE");
          var tnombre = objDom.getValorPorId("TNOMBRE");
          if(nnumide!="" || tnombre!=""){
              objUtiles.ejecutarFormulario("axis_axisadm102.do?cargaPersonas=true", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
          } 
      }
	 
	  function f_asignaSPERSON(campo){
		  console.log("campo : " + campo.parentElement.parentNode + " and value : " + campo.value);
	   		objDom.setValorPorId("SPERSON", campo.value);
	   		objDom.setValorPorId("NNUMIDE", $(campo).parent().parent().parent().find("td").eq(1).find("div").text());
	   		objDom.setValorPorId("TNOMBRE", $(campo).parent().parent().parent().find("td").eq(2).find("div").text());
      }

	/* *************************************************************************************************** */
	/* ***************************************** CHEQUEAR TODOS ****************************************** */
	/* *************************************************************************************************** */
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

		var elementCount = document.miForm.CUENTA.value;

		for (var j = 0; j < elementCount; j++) {
			var ID = eval("document.miForm.IDCUENTA_" + j + ".value");
			var ISALDO = eval("document.miForm.NREC_" + j + ".value");

		}
	}
	
	function ocultar(nombreCapa){ 
	    document.getElementById(nombreCapa).style.visibility="hidden"; 
	} 
	
	function f_but_imprimir(nnumord) {
       
        var ctipo = "LIQ_OUTSOURCING";
        objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?&operation=impresion_personas&SPERSON="+nnumord+"&TIPO="+ctipo);
    }
	
	function f_cerrar_axisimprimir() {
        objUtiles.cerrarModal("axisimprimir");  
    }
	
	function f_aceptar_axisadm105(){
        f_cerrar_modal("axisadm105");
        objUtiles.ejecutarFormulario ("axis_axisadm102.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
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

		var elementCount = document.miForm.CUENTA.value;

		for (var j = 0; j < elementCount; j++) {
			var ID = eval("document.miForm.IDCUENTA_" + j + ".value");
			var ISALDO = eval("document.miForm.NREC_" + j + ".value");

		}

	}
	
	function f_but_calcular() {
		objUtiles.ejecutarFormulario("axis_axisadm102.do?cargaPersonas=true", "calcular",
				document.miForm, "_self", objJsMessages.jslit_cargando);
	}
	
	function f_checkea_persona(tipo){
        
		if (tipo == 1) {
        	document.getElementById("tomador").checked=true;
            document.getElementById("outsourcing").checked=false;
        } else if (tipo == 2) {
        	document.getElementById("tomador").checked=false;
            document.getElementById("outsourcing").checked=true;
        }
    
        objDom.setValorPorId("TIPO_PERS",tipo);
              
    }
	
	function f_editar (NNUMORD){
        objUtiles.abrirModal("axisadm105", "src", "modal_axisadm105.do?operation=form&NNUMORD=" + NNUMORD);
    }

	function f_mod_tipimp(id, check) {
		
		objDom.setValorPorId("SELEC_" + id, ((check.checked) ? 1 : 0));

	}

	function f_abrir_axisctr014() {
		objUtiles
				.abrirModal("axisctr014", "src",
						"modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
	}
	function f_cerrar_axisctr014() {
		objUtiles.cerrarModal("axisctr014")
	}

	function f_aceptar_axisctr014(CAGENTE) {
		objDom.setValorPorId("CAGENTE", CAGENTE);
		f_cerrar_axisctr014();
		objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente,
				"operation=ver_agente&CODI=" + CAGENTE, this,
				objJsMessages.jslit_actualizando_registro);
	}
	
	function callbackAjaxCambiarAgente(ajaxResponseText) {
		var doc = objAjax.domParse(ajaxResponseText);

		if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
			var CAGENTEformateado = objDom.getValorNodoDelComponente(doc
					.getElementsByTagName("CODI"), 0, 0);
			var NOMBREformateado = objDom.getValorNodoDelComponente(doc
					.getElementsByTagName("NOMBRE"), 0, 0);
			objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
			objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
		}

	}

	function f_limpiar_axisctr014() {

		objDom.setValorPorId("CAGENTE_TEXT", "");
		objDom.setValorPorId("NOMBRE_TEXT", "");
		objDom.setValorPorId("CAGENTE", "");
	}


</script>
</head>
<body onload="f_onload()"
	onkeypress="if (event.keyCode==13)  { f_but_100797() }">

	<c:import url="../include/precargador_ajax.jsp">
	   <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
       <c:param name="nid_y_titulo">axisadm105|<axis:alt f="axisadm102" c="MODAL_EDIT" lit="89907012" /></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
	    <c:param name="titulo">
	         <axis:alt f="axisadm102" c="TITULOIMPRIMIR" lit="1000205" />
	    </c:param>
	    <c:param name="nid" value="axisimprimir"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" /> 
		<input type="hidden" name="PESTREC" id="PESTREC" value="${__formdata.PESTREC}" /> 
		<input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}" /> 
		<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" />  
		<input type="hidden" id="TIPO_PERS" name="TIPO_PERS" value="${__formdata.TIPO_PERS}"/>
		  <c:import url="../include/modal_estandar.jsp">
	      <c:param name="titulo">
	        <axis:alt f="axisper009" c="MODPER008_TIT" lit="1000235"/>
	      </c:param>
	      <c:param name="nid" value="axisper001"/>
	    </c:import>

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="producto">
				<axis:alt f="axisadm102" c="TITULO" lit="89906278" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisadm102" c="TITULO" lit="89906278" />
			</c:param>
			<c:param name="form">axisadm102</c:param>
		</c:import>
		 <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>

		<!-- Area de campos  -->
		<table id="tabla1" class="mainModalDimensions base" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisadm102" c="titulo" lit="1000178" />
					</div> <!--campos-->

					<table class="seccion">
						<tr>
							<td>
								<!-- Área 1 -->
								<table class="area" align="center">
								   <tr>
								     <axis:ocultar f="axisadm102" c="NNUMIDE" dejarHueco="false">
			                            <td class="titulocaja">
			                               <b><axis:alt f="axisadm102" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificación --%>
			                            </td>
			                         </axis:ocultar>
		                             <axis:ocultar f="axisadm102" c="TNOMBRE" dejarHueco="false">
		                             	<td class="titulocaja" colspan="3">
		                                  <b><axis:alt f="axisadm102" c="TNOMBRE" lit="9902326"/></b> <%-- Nombres --%>
		                                </td>
		                             </axis:ocultar>
		                             <axis:ocultar f="axisadm102" c="TIPOPER" dejarHueco="false">     
		                             	<td class="titulocaja">
		                                   <b><axis:alt f="axisadm102" c="TIPOPER" lit="101027"/></b> <%-- Tomador/Outsourcing --%>
		                           	    </td>                            
		                                <td class="titulocaja">
		                                   <input type="radio" id="tomador" name="tomador" onclick="f_checkea_persona(1)"                                
		                                   <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/>                                    
		                                </td>
		                            </axis:ocultar>
                       			  </tr>
								  <tr>
								    <axis:ocultar f="axisadm102" c="NNUMIDE" dejarHueco="false">
			                            <td class="campocaja">                             
			                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
			                                <axis:atr f="axisadm102" c="NNUMIDE" a="obligatorio=true"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
			                                title="<axis:alt f="axisadm102" c="NNUMIDE" lit="105330"/>" />
			                            </td>
                            		</axis:ocultar>
		                            <axis:ocultar f="axisadm102" c="TNOMBRE" dejarHueco="false">
			                            <td class="campocaja" colspan="3">                             
			                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
			                                <axis:atr f="axisadm102" c="TNOMBRE" a="obligatorio=true"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"
			                                title="<axis:alt f="axisadm102" c="TNOMBRE" lit="9902326"/>"/>
			                            </td>
		                            </axis:ocultar>
		                            <axis:ocultar f="axisadm102" c="TIPOPER" dejarHueco="false">     
			                            <td class="titulocaja">
			                                <b><axis:alt f="axisadm102" c="CAMPO003" lit="9909565"/></b> <%-- Outsourcing --%>                                
			                            </td>
			                            <td class="titulocaja">
			                                <input type="radio" id="outsourcing" name="outsourcing" onclick="f_checkea_persona(2)"
			                                <c:if test="${__formdata['outsourcing'] == 'on'}">checked</c:if>/>
			                            </td>
		                            </axis:ocultar>
                            	  </tr>
								  <tr>	
									<axis:ocultar f="axisadm102" c="DSP_DATPERSON" dejarHueco="false"> 
				                       <tr>
				                            <td colspan="6">
				                                <c:set var="title1"><axis:alt f="axisadm102" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
				                                <c:set var="title2"><axis:alt f="axisadm102" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
				                                <div class="displayspace">
				                                    <display:table name="${DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
				                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
				                                    requestURI="axis_axisadm102.do?paginar=true">
				                                        <%@ include file="../include/displaytag.jsp"%>
				                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
				                                            <div class="dspIcons">
				                                                <input value="${DATOSPERSONA.CODI}" type="radio" id="radioSPERSON" name="radioSPERSON" onclick="f_asignaSPERSON(this)"/>
				                                            </div>
				                                        </display:column>
				                                        <display:column title="${title1}" sortable="true" sortProperty="VALOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
				                                            <div class="dspText">${DATOSPERSONA.VALOR}</div>
				                                        </display:column>
				                                        <display:column title="${title2}" sortable="true" sortProperty="TEXTO" headerClass="sortable"  media="html" autolink="false" >                                    
				                                            <div class="dspText">${DATOSPERSONA.TEXTO}</div>
				                                        </display:column>
				                                    </display:table>
				                                </div>
				                            </td>
				                        </tr> 
				                    </axis:ocultar>
                    			  </tr>
                    			  <tr>
                    			    <td>
                    			      <div class="separador">&nbsp;</div>
                    			    </td>
                    			  </tr>	
								  <tr>
								    <axis:ocultar f="axisadm102" c="ESTGEST" dejarHueco = "false">
								      <td class="titulocaja">
									    <b><axis:alt f="axisadm102" c="ESTGEST" lit="89906279" /></b>
									  </td>
									</axis:ocultar>
									<axis:ocultar dejarHueco="false" f="axisadm102" c="NRECIBO">
									  <td class="titulocaja">
									    <b><axis:alt f="axisadm102" c="NRECIBO" lit="800636"></axis:alt></b>
									  </td>
									</axis:ocultar>
									<axis:ocultar f="axisadm102" c="FEFEINI" dejarHueco="false">
		                              <td class="titulocaja">
		                                <b><axis:alt f="axisadm102" c="FEFEINI" lit="1000556"></axis:alt></b>
		                              </td>
		                            </axis:ocultar>
		                            <axis:ocultar f="axisadm102" c="FHASTA" dejarHueco="false">
		                              <td class="titulocaja">
		                                <b><axis:alt f="axisadm102" c="FHASTA" lit="1000557"></axis:alt></b>
		                              </td>
		                            </axis:ocultar>
								    <axis:ocultar f="axisadm102" c="CAGENTE" dejarHueco="false">
	                                  <td class="titulocaja">
	                                    <b><axis:alt f="axisadm102" c="CAGENTE" lit="100584"></axis:alt></b>
	                                  </td>
	                                </axis:ocultar>
								  </tr>
								  <tr>
								    <td>
								      <select name="ESTGEST" id="ESTGEST"
								        <axis:atr f="axisadm102" c="ESTGEST" a="obligatorio=false&modificable=true&isInputText=false"/>
										size="1" class="campowidthselect campo campotexto" style="width: 75%;">
										<option value="<%=Integer.MIN_VALUE%>"> -
										  <axis:alt f="axisadm102" c="BLANCO" lit="1000348"/> -
										</option>
										<c:forEach var="element" items="${__formdata.LSTIMPREC}">
										  <option value="${element.CATRIBU}">
											${element.TATRIBU}
										  </option>
										</c:forEach>
									  </select> 
									</td>
									<td>
										<input type="text" name="NRECIBO" id="NRECIBO"
										value="${__formdata.NRECIBO}" 
										class="campowidthinput campo campotexto" style="width: 75%;"
										<axis:atr f="axisadm102" c="NRECIBO" a="modificable=true&obligatorio=false"/>
										alt="<axis:alt f="axisadm102" c="NRECIBO" lit="800636" />"
										title="<axis:alt f="axisadm102" c="NRECIBO" lit="800636" />" />
									</td>		
									<td>
										<input type="text" class="campo campotexto" size="15" style="width:70%;"
		                                 value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESE}"/>" name="FDESE" id="FDESE"
		                                 title="<axis:alt f='axisadm102' c='FDESE' lit='9902360'/>" alt="<axis:alt f='axisadm102' c='FDESE' lit='9902360'/>"
		                                 <axis:atr f="axisadm102" c="FDESE" a="formato=fecha"/> /><a style="vertical-align:middle;"><img id="icon_FDESE" 
		                                 alt="<axis:alt f="axisadm102" c="FDESE" lit="9902360"/>" title="<axis:alt f="axisadm102" c="FDESE" lit="9902360" />" src="images/calendar.gif"/></a>
									</td>
									<td>
										<input type="text" class="campo campotexto" size="15" style="width:70%;"
		                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FHASTA}"/>" name="FHASTA" id="FHASTA"
		                                title="<axis:alt f='axisadm102' c='FHASTA' lit='1000557'/>" alt="<axis:alt f='axisadm102' c='FHASTA' lit='108341'/>"
		                                <axis:atr f="axisadm102" c="FHASTA" a="formato=fecha"/> /><a style="vertical-align:middle;"><img id="icon_FHASTA" 
		                                alt="<axis:alt f="axisadm102" c="FHASTA" lit="1000557"/>" title="<axis:alt f="axisadm102" c="FHASTA" lit="9901135" />" src="images/calendar.gif"/></a>
									</td>
									<td>
										<input readonly="true" type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
	                                     title="<axis:alt  c="CAGENTE" f="axisadm102" lit="100584"/>" 
	                                    onchange="f_actualizar_agente()" />
	                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
	                                    <img id="IMG_DELAGEN_TEXT" border="0" src="images/delete.gif" onclick="f_limpiar_axisctr014()" style="cursor: pointer" />
	                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
									</td>
									</tr>
									<tr>
									  <td>
									    <div class="separador">&nbsp;</div>
									  </td>
									</tr>
									<tr>
									  <td>
									    <input type="button" onclick="f_but_buscar()" class="boton"
										value="<axis:alt f="axiadm102" c="LIT_BUT_SELTODOS" lit="9000508"/>" />
									  </td>
									</tr>
								</table>

							</td>
						</tr>

					</table>
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisadm102" c="DSP_MVTPOLIZA" lit="111046" />
					</div>
					<div class="separador">&nbsp;</div>
				<table class="seccion">
				  <tr>
				    <td>
				      <table class="area" align="center">
			 <axis:visible f="axisadm087" c="DSP_MVTPOLIZA" >  
             
						<tr style="width:100%">
							<td style="width:100%">
							    <c:set var="title0">
									<axis:alt f="axisadm102" c="LIT_NUM" lit="800440" />
								</c:set> <c:set var="title1">
									<axis:alt f="axisadm102" c="NPOLIZA" lit="9903659" />
								</c:set> <c:set var="title2">
									<axis:alt f="axisadm102" c="NRECIBO" lit="100895" />
								</c:set> <c:set var="title3">
									<axis:alt f="axisadm102" c="ESTREC" lit="1000553" />
								</c:set> <c:set var="title4">
									<axis:alt f="axisadm102" c="TOMADOR" lit="109360" />
								</c:set> <c:set var="title5">
									<axis:alt f="axisadm102" c="AGENTE" lit="100584" />
								</c:set> <c:set var="title6">
									<axis:alt f="axisadm102" c="ITOTREC" lit="1000563" />
								</c:set> <c:set var="title7">
									<axis:alt f="axisadm102" c="2" lit="89906283" />
								</c:set> <c:set var="title8">
									<axis:alt f="axisadm102" c="3" lit="89907019" />
								</c:set> <c:set var="title9">
									<axis:alt f="axisadm102" c="4" lit="89906284" />
								</c:set> <c:set var="title10">
									<axis:alt f="axisadm102" c="5" lit="89906285" />
								</c:set> <c:set var="title11">
									<axis:alt f="axisadm102" c="CESTGES" lit="89906279" />
								</c:set>
								 <%int contador1 = 0; %> 
								<input type="hidden" name="CUENTA" id="CUENTA"
								value="${fn:length(__formdata.LST)}"> 

								<div class="seccion displayspaceGrande" style="width: 100%">

									<display:table name="${__formdata.LST}"
										id="LST" export="false" class="dsptgtable"
										pagesize="-1" defaultsort="2" defaultorder="ascending"
										requestURI="axis_axisadm102.do?paginar=true" sort="list"
										cellpadding="0" cellspacing="0">
										<%@ include file="../include/displaytag.jsp"%>

                                      <display:column title="${title0}" sortable="false"
											sortProperty="LIT_NUM" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspIcons">
												<input
													onclick="javascript:f_mod_tipimp('<%= contador1 %>',this)"
													type="checkbox" id="selectedClausula"
													name="selectedClausula" value=""
													
													<c:if test="${__configform.axisadm102__NRECSELEC__modificable == 'false'}">readonly</c:if> />
													
													<input type="hidden" name="IDCUENTA_<%= contador1 %>"
													id="IDCUENTA_<%= contador1 %>" value="${LST.NRECIBO}" />
												<input type="hidden" name="NREC_<%= contador1 %>"
													id="NREC_<%= contador1 %>" value="${LST.NRECIBO}" />
												<input type="hidden" name="SELEC_<%= contador1 %>"
													id="SELEC_<%= contador1 %>" value="${LST.CEXISTE}" /> 
											</div>
										</display:column>
										<display:column title="${title1}" sortable="false"
											sortProperty="NPOLIZA" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspIcons">
											${LST.NPOLIZA}</div>
										</display:column>
										<display:column title="${title2}" sortable="true"
											sortProperty="NRECIBO" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LST.NRECIBO}</div>
										</display:column>
										<display:column title="${title3}" sortable="true"
											sortProperty="ESTREC" headerClass="sortable" media="html"
											autolink="false">
											
												<div class="dspText">${LST.TESTREC}</div>
										</display:column>
										<display:column title="${title4}" sortable="true"
											sortProperty="TOMADOR" headerClass="sortable" media="html"
											autolink="false">
											
												<div class="dspText">${LST.TNOMTOM}</div>
										</display:column>
										<display:column title="${title5}" sortable="true"
											sortProperty="AGENTE" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LST.TNOMAGE}</div>
										</display:column>
										<display:column title="${title6}" sortable="true"
											sortProperty="PRIMAT" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspNumber">
											  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST.ITOTREC}"/>
											</div>
										</display:column>
										<display:column title="${title7}" sortable="true"
											sortProperty="2" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspNumber">
											  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST.IGESOUT}"/>
											</div>
										</display:column>
										<display:column title="${title8}" sortable="true"
											sortProperty="2" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspNumber">
											  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LST.IIMPPENDLIQ}"/>
											</div>
										</display:column>
										<display:column title="${title9}" sortable="true"
											sortProperty="3" headerClass="sortable" media="html"
											autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy"
												value="${LST.FGESOUT}" />
										</display:column>
										<display:column title="${title10}" sortable="true"
											sortProperty="4" headerClass="sortable" media="html"
											autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy"
												value="${LST.FRECMOVREC}" />
										</display:column>
										<display:column title="${title11}" sortable="true"
											sortProperty="ESTGEST" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LST.CESTGES}</div>
										</display:column>
										
										<%
											contador1++;
										%>
									</display:table>
								</div> <div class="separador">&nbsp;</div></td>
              
              </tr>
					<tr><td ><input type="button" onclick="ChequearTodosBut()"
								class="boton"
								value="<axis:alt f="axiadm102" c="LIT_BUT_SELTODOS" lit="9000756"/>" />

								<input type="button" onclick="DesChequearTodosBut()"
								class="boton"
								value="<axis:alt f="axiadm102" c="LIT_BUT_DESELTODOS" lit="9000757"/>" />
						</td>

							<td>	<input type="button" onclick="f_but_calcular()"
								class="boton"
								value="<axis:alt f="axiadm102" c="LIT_CALCULAR" lit="89906291"/>" />
						</td></tr>	
			</axis:visible>
					</table>
				    </td>
				  </tr>
				</table>
				
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisadm102" c="titulos" lit="89906292" />
					</div>
					<div class="separador">&nbsp;</div>
			<table class="area" align="center">
			 <axis:visible f="axisadm087" c="DSP_PAGOUT" >  
						<tr>
							<td><c:set var="title0">
									<axis:alt f="axisadm102" c="NNUMORD" lit="9905245" />
								</c:set> <c:set var="title1">
									<axis:alt f="axisadm102" c="FFECORD" lit="89906293" />
								</c:set> <c:set var="title2">
									<axis:alt f="axisadm102" c="ITOTPAG" lit="89906294" />
								</c:set> <c:set var="title3">
									<axis:alt f="axisadm102" c="TNOMOUT" lit="9909565" />
								</c:set> <c:set var="title4">
									<axis:alt f="axisadm102" c="TESTERP" lit="89906295" />
								</c:set> <c:set var="title5">
									<axis:alt f="axisadm102" c="NPRCERP" lit="89906296" />
								</c:set> <c:set var="title6">
									<axis:alt f="axisadm102" c="FFECPAGERP" lit="9906996" />
								</c:set> <c:set var="title7">
									<axis:alt f="axisadm102" c="IVALPAGERP" lit="89906297" />
								</c:set> <c:set var="title8">
									<axis:alt f="axisadm102" c="TEDIT" lit="100002" />
									</c:set><c:set var="title9">
									<axis:alt f="axisadm102" c="TDET" lit="1000113" />
								</c:set><c:set var="title10">
									<axis:alt f="axisadm102" c="TIMP" lit="100001" />
								</c:set>

								<div class="seccion displayspaceGrande" style="width: 98%" id="TRANSF">

									<display:table name="${__formdata.LST_PAGOUT}"
										id="LSTPAGOUT" export="false" class="dsptgtable"
										pagesize="-1" defaultsort="2" defaultorder="ascending"
										requestURI="axis_axisadm102.do?paginar=true" sort="list"
										cellpadding="0" cellspacing="0">
										<%@ include file="../include/displaytag.jsp"%>

										<display:column title="${title0}" sortable="true"
											sortProperty="NNUMORD" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LSTPAGOUT.NNUMORD}</div>
										</display:column>
										<display:column title="${title1}" sortable="true"
											sortProperty="FFECORD" headerClass="sortable" media="html"
											autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy"
												value="${LSTPAGOUT.FFECORD}" />
										</display:column>
										<display:column title="${title2}" sortable="true"
											sortProperty="ITOTPAG" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspNumber">
											  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTPAGOUT.ITOTPAG}"/>
											</div>
										</display:column>
										<display:column title="${title3}" sortable="true"
											sortProperty="TNOMOUT" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LSTPAGOUT.TNOMOUT}</div>
										</display:column>
										<display:column title="${title4}" sortable="true"
											sortProperty="TESTERP" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LSTPAGOUT.TESTERP}</div>
										</display:column>
										<display:column title="${title5}" sortable="true"
											sortProperty="NPRCERP" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspText">${LSTPAGOUT.NPRCERP}</div>
										</display:column>
										<display:column title="${title6}" sortable="true"
											sortProperty="FFECPAGERP" headerClass="sortable" media="html"
											autolink="false">
											<fmt:formatDate pattern="dd/MM/yyyy"
												value="${LSTPAGOUT.FFECPAGERP}" />
										</display:column>
										<display:column title="${title7}" sortable="true"
											sortProperty="IVALPAGERP" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspNumber">
											  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTPAGOUT.IVALPAGERP}"/>
											</div>
										</display:column>
										<display:column title="${title8}" sortable="true"
											sortProperty="TEDIT" headerClass="sortable" media="html"
											autolink="false">
											<div class="dspIcons">
											   <img border="0" alt="<axis:alt f="axisadm102" c="EDIT" lit="9901356"/>" title="<axis:alt f="axisadm102" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                               style="vertical-align:middle;cursor:pointer;" onclick="javascript:f_editar('${LSTPAGOUT.NNUMORD}')"/>
                                            </div>
										</display:column>
										<display:column title="${title9}" sortable="true"
											sortProperty="TDET" headerClass="sortable" media="html"
											autolink="false">
											<axis:visible c="DETPAGOUT" f="axisadm102">
                                               <div style="float:center;text-align:center;padding-right:10px;padding-left:5px;">
                                                  <img border="0" alt="<axis:alt f="axisadm102" c="TDET" lit="9000791"/>" title1="<axis:alt f="axisadm102" c="CESTREC" lit="9000791"/>" src="images/mes.gif" width="11px" height="11px"
                                                   style="cursor:pointer;"   onclick="javascript:mostrar('SECCION_N${LSTPAGOUT.NNUMORD}','TRANSF')"   />
                                               </div>
                                            </axis:visible>
										</display:column>
										<display:column title="${title10}" sortable="true"
											sortProperty="TIMP" headerClass="sortable" media="html"
											autolink="false">
											<axis:visible c="TIMP" f="axisadm102">
                                               <div style="float:center;text-align:center;padding-right:10px;padding-left:5px;">
										          <a href="javascript:f_but_imprimir('${LSTPAGOUT.NNUMORD}')"> <img border="0"onclick= "javascript:f_but_imprimir('${LSTPAGOUT.NNUMORD}')" alt="<axis:alt f="axisadm102" c="TIMP" lit="100001"/>"   title="<axis:alt f="axisadm102" c="TIMP" lit="100001"/>" src="images/print.gif"/></a>
										       </div>
                                            </axis:visible>
										</display:column>
										<display:column class="seccion_informacion" style="width:900px;padding-right:10px;padding-left:5px;">
										   <div id="SECCION_N${LSTPAGOUT.NNUMORD}" style="width:900px;height:auto;padding-right:10px;padding-left:5px;margin:332 auto;margin-left:300px " class="seccion_informacion">
                                              <div style="float:right;">
                                                 <img  src="images/but_cerrar.gif" alt="<axis:alt f="axisadm102" c="CERRAR" lit="1000430" />" onclick="javascript:ocultar('SECCION_N${LSTPAGOUT.NNUMORD}')" style="cursor:pointer"/> 
                                              </div>
                                              <table class="area" align="center">
                                                 <tr>
                                                    <th style="width:50%;height:0px"></th>
                                                    <th style="width:50%;height:0px"></th>
                                                 </tr>
                                                 <tr>
                                                    <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;" >
                                                       <c:set var="title11"><axis:alt f="axisadm102" c="ORDEN" lit="500102"/></c:set>     <%-- N° Orden --%>
                                                       <c:set var="title12"><axis:alt f="axisadm102" c="ITOTNET" lit="1000527"/></c:set>  <%-- Importe Neto --%>
                                                       <c:set var="title13"><axis:alt f="axisadm102" c="IIVA" lit="101340"/></c:set>      <%-- IVA --%>
                                                       <c:set var="title14"><axis:alt f="axisadm102" c="IRETFUE" lit="9901180"/></c:set>  <%-- Retefuente --%>
                                                       <c:set var="title15"><axis:alt f="axisadm102" c="IRETIVA" lit="9909383"/></c:set>  <%-- ReteIVA --%>
                                                       <c:set var="title16"><axis:alt f="axisadm102" c="IRETICA" lit="9903552"/></c:set>  <%-- ReteICA --%>
                                                       <c:set var="title17"><axis:alt f="axisadm102" c="ITOTPAG" lit="9000939"/></c:set>  <%-- Importe Bruto --%>
                                                       <div style="float:left;">
                                                          <b><axis:alt f="axisadm003" c="DETALLMOV" lit="9002153" /></b>
                                                       </div>
                                                       <br><br>
                                                       <display:table name="${LSTPAGOUT.NNUMORD}" id="DETLSTPAGOUT" export="false" class="dsptgtable" pagesize="-1"   sort="list" cellpadding="0" cellspacing="0"
                                                        requestURI="axis_axisadm102.do?paginar=true&subseccion=movimientos_recibo">
                                                          <%@ include file="../include/displaytag.jsp"%>
                                                          <display:column title="${title11}"  sortProperty="DETLSTPAGOUT.NNUMORD" headerClass="sortable" style="width:5%;"  media="html" autolink="false">
                                                              <div class="dspText">${LSTPAGOUT.NNUMORD}</div>
                                                          </display:column>
                                                          <display:column title="${title12}"  sortProperty="DETMOVRECIBO.FMOVDIA" headerClass="sortable" style="width:10%;"  media="html" autolink="false">
                                                             <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.ITOTNET}'/></div>
                                                          </display:column>
                                                          <display:column title="${title13}" sortProperty="DETMOVRECIBO.FMOVIMI" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                          <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.IIVA}'/></div>
                                                          </display:column>
                                                          <display:column title="${title14}" sortProperty="OB_IAX_MOVRECIBO.FEFEADM" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                              <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.IRETFUE}'/></div>
                                                          </display:column>
                                                          <display:column title="${title15}"  sortProperty="DETMOVRECIBO.SEDEVOLU" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                              <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.IRETIVA}'/></div> 
                                                          </display:column>
                                                           <display:column title="${title16}"  sortProperty="DETMOVRECIBO.NNUMLIN" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                              <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.IRETICA}'/></div>  
                                                          </display:column>
                                                            <display:column title="${title17}"  sortProperty="DETMOVRECIBO.CBANCAR1" headerClass="sortable"  style="width:15%;"  media="html" autolink="false">
                                                           <div class="dspNumber">
                                                             	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${LSTPAGOUT.ITOTPAG}'/></div> 
                                                          </display:column>
                                                       </display:table>
                                                    </td>
                                                 </tr>
                                              </table>
                                           </div>
                                        </display:column>
								     </display:table>
							      </div>
					           </td>
					        </tr>
					     </axis:visible>
					  </table>
				</td>
		</table>

		<div class="separador">&nbsp;</div>
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisadm102</c:param>
			
			<c:param name="__botones">salir</c:param>
		</c:import>
	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>
