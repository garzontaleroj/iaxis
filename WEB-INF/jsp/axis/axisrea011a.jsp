<%/* Revision:# /QSY5CYOkEkjSm9sjHC+tA== # */%>

<%
	/*
	*  Fichero: axisrea011a.jsp
	*
	*  Fecha: 29/06/2009
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
<title><axis:alt f="axisrea011a" c="AXISREA011_TIT" lit="9001860" /></title>
<%-- Consulta de cesiones --%>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />

<style type="text/css">
.displayspace {
	width: 99.8%;
	height: expression(this.scrollHeight > 349 ? "350px" : "auto");
	max-height: 350px;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px solid #DDDDDD;
}

.tabla_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	border-collapse: collapse;
	width: 100%;
	border-top: none;
	border-left: none;
}

.td_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	padding: 0px;
	border-top: none;
	border-left: none;
}

.th_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	padding: 0px;
	border-top: none;
	border-left: none;
}

.total {
	border: 1px solid #ddd;
	text-align: end;
	border-collapse: collapse;
	width: 100%;
}
</style>

<script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() { 
            revisarEstilos();
            f_cargar_propiedades_pantalla();//BFP bug 20747 2/02/2012
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            
            if (${empty requestScope.T_IAX_CESIONESREA} && !hayErrores){
                f_but_buscar();
            }
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea011a", "cancelar", document.miForm, "_self");
        }
        
        
        function f_but_buscar() {
            f_abrir_modal("axisrea010");
        }
        
        
        function f_detallRebut(NMOVIMI){
            var SSEGURO = objDom.getValorPorId("SSEGURO");            
            f_abrir_modal("axisrea012", false, "&SSEGURO=" + SSEGURO + "&NMOVIMI=" + NMOVIMI + "&primeraCarrega=0"); 
        }
        
        
        function f_muestra_detalle(NMOVIMI, TCGENERA, CGENERA, FEFECTO, FVENCIM, FANULAC, NRIESGO, NOM, SCONTRA, NVERSIO, TCONTRA, TCTRAMO, SFACULT, CGARANT, TGARANT, NSINIES, SIDEPAG, PFACCED, ICAPCES, PRIMARET, ICOMEXT, ICESION, PCESION) {                    
            //   si es explorer
            if(document.all){
               document.getElementById("detalle").style.display = 'inline';        
            }
        //    si no es explorer    
            else{
                document.getElementById("detalle").style.display = 'table';            
            }            
            
            document.getElementById("resumen_detalle").innerHTML = SCONTRA + "/" + NVERSIO + " &nbsp; " + TCTRAMO +" &nbsp; <b><axis:alt f='axisrea011a' c='AXISREA011_DET' lit='100883'/>:</b> " + FEFECTO;
            objDom.setValorPorId("NMOVIMI", NMOVIMI);
            objDom.setValorPorId("TCGENERA", TCGENERA);
            objDom.setValorPorId("FEFECTO", FEFECTO);
            objDom.setValorPorId("FVENCIM", FVENCIM);
            objDom.setValorPorId("FANULAC", FANULAC);
            objDom.setValorPorId("NRIESGO", NRIESGO);
            objDom.setValorPorId("NMOVIMI", NMOVIMI);
            objDom.setValorPorId("NOM", NOM);
            objDom.setValorPorId("SCONTRA", SCONTRA);
            objDom.setValorPorId("NVERSIO", NVERSIO);
            objDom.setValorPorId("TCONTRA", TCONTRA);
            objDom.setValorPorId("TCTRAMO", TCTRAMO);
            objDom.setValorPorId("SFACULT", SFACULT);
            objDom.setValorPorId("CGARANT", CGARANT);
            objDom.setValorPorId("TGARANT", TGARANT);
            objDom.setValorPorId("PRIMARET", PRIMARET);
            objDom.setValorPorId("ICOMEXT", ICOMEXT);
            if(CGENERA == 2 && (NSINIES == '' || NSINIES == null)){
                objDom.setValorPorId("NSINIES", "Reemb. " + SIDEPAG);
            }
            else{            
                objDom.setValorPorId("NSINIES", NSINIES + (!objUtiles.estaVacio(NSINIES) ? "/" : "") + SIDEPAG);
                }
            objDom.setValorPorId("PFACCED", PCESION);
            objDom.setValorPorId("ICAPCES", ICAPCES);
            objDom.setValorPorId("ICESION", ICESION);
        }

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_axisrea010() {
            objUtiles.cerrarModal("axisrea010");
        }
        
        function f_aceptar_axisrea010(SSEGURO, NPOLIZA, TIPO_REA, NCERTIF, NSINIES) {
            objUtiles.cerrarModal("axisrea010");
            objDom.setValorPorId("SSEGURO", SSEGURO);
            objDom.setValorPorId("NPOLIZA", NPOLIZA);
            objDom.setValorPorId("TIPO_REA", TIPO_REA);
            objDom.setValorPorId("NCERTIF", NCERTIF);
            objDom.setValorPorId("NSINIES", NSINIES);
            objUtiles.ejecutarFormulario("axis_axisrea011a.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
      //@BORIS
        function f_but_axisrea011aa(){
        	$("#operation").val("form")         
            objUtiles.abrirModal("axisrea011aa", "src", "axis_axisrea011aa.do?"+$("#miForm").serialize());
        }
        function f_but_axisrea047(SPROCES){
        	$("#operation").val("form");     
        	$("#SPROCES").val(SPROCES);
            objUtiles.abrirModal("axisrea047", "src", "axis_axisrea047.do?"+$("#miForm").serialize());
        }
        
        function f_cerrar_axisrea011aa() {
            objUtiles.cerrarModal("axisrea011aa");
        }
        function f_cerrar_axisrea047() {
            objUtiles.cerrarModal("axisrea047");
        }
        
        //@BORIS
        
        function f_cerrar_axisctr069() {
            objUtiles.cerrarModal("axisctr069");
            objUtiles.ejecutarFormulario("axis_axisrea011a.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        //-------------------------------
    	function f_descargar_reporte(pfitxer){
	      	$("#SPROCES").val(pfitxer);
			objAjax.invokeAsyncCGI_JSON("axis_axisrea011a.do?operation=descargar_reporte&"+$("#miForm").serialize(), callBack_miajaxjson, "<axis:alt f='axiscga002' c='MSG_CARGAR' lit='9905686'/>")
		} 

    	function callBack_miajaxjson(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             //hay que actualizar la lista de resulotados xxx
             var odiv_OBFICHERO=document.getElementById("div_OBFICHERO");
             odiv_OBFICHERO.innerHTML="";
             var div_OBFICHEROcontenido="";
             div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<table align=\"center\" class=\"dsptgtable\">";
             
             if (p.JSON2.LIST_FICHEROS!=null) {           	 
            	 
            	 div_OBFICHEROcontenido=div_OBFICHEROcontenido+"<tr><td><a href=\"javascript:f_imprimir_fitxer()\">"+p.JSON2.LIST_FICHEROS.ONOMFICHERO+"</a><input type=\"hidden\"   name=\"fileAbsolutePath"+"\" id=\"fileAbsolutePath"+"\" value=\""+p.JSON2.LIST_FICHEROS.OFICHERO+"\"/> </td></tr> ";
                 div_OBFICHEROcontenido=div_OBFICHEROcontenido+"</table>";
                 odiv_OBFICHERO.innerHTML=div_OBFICHEROcontenido;
                 f_imprimir_fitxer();
       		}
    	}
    	
    	
	
	function f_imprimir_fitxer(){
        		
        pfitxer = document.getElementById('fileAbsolutePath').value;
        var doc = pfitxer.replace(/barrainvertida/gi, "\\");
        nuevaVentana = window.open("axis_axisrea011a.do?operation=tunnel_doc&fileAbsolutePath=" + doc, "_new");    
        // Abrir un proceso con setInterval para cerrar la ventana recién abierta
        if (document.all) {
             idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
             contadorVentanas++;
         }
     } 
    function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");
    }
        
    </script>
</head>

<body onload="f_onload()">
	<div class="seccion displayspace" id="div_OBFICHERO" style="display:none"></div>
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisrea011a" c="TITCC" lit="9001860" />
		</c:param>
		<c:param name="nid" value="axisrea011a" />
	</c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axisrea011a" c="TITDETCC" lit="9910118" />
		</c:param>
		<c:param name="nid" value="axisrea047" />
	</c:import>
	<form id="miForm" name="miForm" action="" method="POST">

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea011a" c="TITULO_NT1" lit="9001860" />
			</c:param>
			<%-- Consulta de cesiones --%>
			<c:param name="formulario">
				<axis:alt f="axisrea011a" c="TITULO_NT2" lit="9001860" />
			</c:param>
			<%-- Consulta de cesiones --%>
			<c:param name="form">axisrea011a</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">
                axisrea010|<axis:alt f="axisrea011a" c="CERCADOR_TIT" lit="9001862" />
				<%-- Buscador de cesiones --%>#axisrea012|<axis:alt f="axisrea011a" c="CES_X_RECIBO"
					lit="9001863" />
				<%-- Consulta datos de cesión por recibo --%>
			</c:param>
		</c:import>
		
		<input type="hidden" id="fileAbsolutePath" name="fileAbsolutePath" value="" />
		<input type="hidden" id="SPROCES" name="SPROCES" value="${__formdata.SPROCES}" /> <input
			type="hidden" id="operation" name="operation" value="" /> <input type="hidden" id="SSEGURO"
			name="SSEGURO" value="${__formdata.SSEGURO}" /> <input type="hidden" id="NPOLIZA" name="NPOLIZA"
			value="${__formdata.NPOLIZA}" /> <input type="hidden" id="TIPO_REA" name="TIPO_REA"
			value="${__formdata.TIPO_REA}" /> <input type="hidden" id="NCERTIF" name="NCERTIF"
			value="${__formdata.NCERTIF}" />
		<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><c:if
						test="${!empty requestScope.T_IAX_CESIONESREA && empty requestScope.__mensajes.m__clave}">
						<c:set var="resumen">
							<span class="titulocaja"
								style="color: black; font-weight: normal; padding-bottom: 2px; . vertical-align: bottom">
								<b><axis:alt f="axisrea011a" c="N_POLIZA" lit="9001875" />:</b> ${__formdata.NPOLIZA} <b>
									<axis:alt f="axisrea011a" c="N_CERTIF" lit="101096" />
							</b> ${__formdata.NCERTIF}
							</span>
						</c:set>
					</c:if>
					<div class="separador">&nbsp;</div>
					<div class="titulo">
						<img src="images/flecha.gif" />
						<axis:alt f="axisrea011a" c="FLETXA_DET" lit="1000113" />
						<%-- Detalle --%>
						&nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_but_buscar()"
							style="cursor: pointer" alt="<axis:alt f="axisrea011a" c="CERCA_DET" lit="9000508"/>"
							title="<axis:alt f="axisrea011a" c="CERCADET2" lit="9000508"/>" />
					</div>


					<table class="seccion" cellpadding="0" cellspacing="0">
						<tr>
							<td align="left">
								<div class="separador">&nbsp;</div>
								<table class="table_">
									<tr>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="MOVECES" lit="9909979" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="SCONTRA" lit="9001894" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="GARANCES" lit="9909980" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="CONTRATOCES" lit="9909981" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="FEFECTCES" lit="9909982" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="FVENCCES" lit="9909983" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="VERSCES" lit="9909985" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="CEDIDOCES" lit="9909986" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="ICAPITCES" lit="9909987" /></td>
										<td style="width: 150px;" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
												f="axisrea011a" c="ICESIONCES" lit="9909988" /></td>
										<td style="width: 20px;" class="td_ sortable gridsortable gridsorted gridasc"></td>
									</tr>
									<c:forEach items="${requestScope.T_IAX_CESIONESREA}" var="T_IAX_CESIONESREA"
										varStatus="tindex">
										<%-- 						<c:if test="${tindex.index%2!=0}">class="gridNotEven"</c:if><c:if test="${tindex.index%2==0}">class="gridEven"</c:if> --%>
										<tr>
											<td class="td_" rowspan="2" style="width: 150px;">${T_IAX_CESIONESREA.MOTIVO}</td>
											<td class="td_" rowspan="2" style="width: 150px;">${T_IAX_CESIONESREA.SCONTRA}</td>
											<td class="td_" rowspan="2" style="width: 150px;">${T_IAX_CESIONESREA.ANO_CON}</td>
											<td class="td_" rowspan="2" style="width: 150px;">${T_IAX_CESIONESREA.NVERSIO}</td>
											<td class="td_" rowspan="2" style="width: 150px;">${T_IAX_CESIONESREA.FEC_INI}</td>
											<td class="td_" rowspan="1" style="width: 150px;">${T_IAX_CESIONESREA.FEC_FIN}</td>
											<td class="td_" rowspan="2" colspan="4" style="width: 600px;">
												<table class="table_">
													<c:forEach items="${T_IAX_CESIONESREA.PROCESOS}" var="T_IAX_CESIONESREA_SUB"
														varStatus="stindex">
														<%-- 										<c:if test="${stindex.index%2!=0}">class="gridNotEven"</c:if><c:if test="${stindex.index%2==0}">class="gridEven"</c:if> --%>
														<tr>
															<td class="td_" style="width: 150px;">${T_IAX_CESIONESREA_SUB.POR_CESION}</td>
															<td class="td_" style="width: 150px;">																
																<c:if test="${T_IAX_CESIONESREA_SUB.TRAMO == '0'}">Ret </c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '1' or T_IAX_CESIONESREA_SUB.TRAMO=='1'}">Q1</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '2' or T_IAX_CESIONESREA_SUB.TRAMO=='2'}">Q2</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '3' or T_IAX_CESIONESREA_SUB.TRAMO=='3'}">Q3</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '4' or T_IAX_CESIONESREA_SUB.TRAMO=='4'}">Q4</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '5' or T_IAX_CESIONESREA_SUB.TRAMO=='Fac'}">Fac</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '6' or T_IAX_CESIONESREA_SUB.TRAMO=='6'}">Q6</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '7' or T_IAX_CESIONESREA_SUB.TRAMO=='7'}">Q7</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '8' or T_IAX_CESIONESREA_SUB.TRAMO=='8'}">Q8</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '9' or T_IAX_CESIONESREA_SUB.TRAMO=='9'}">Q9</c:if>
																<c:if test="${T_IAX_CESIONESREA_SUB.CTRAMPA == '10' or T_IAX_CESIONESREA_SUB.TRAMO=='10'}">Q10</c:if>																
															</td>
															<td class="td_" style="width: 150px;">${T_IAX_CESIONESREA_SUB.VAL_ASEG}</td>
															<td class="td_" style="width: 150px;">${T_IAX_CESIONESREA_SUB.PRI_CED}</td>

														</tr>
													</c:forEach>
													<tr>
														<td class="td_" style="width: 150px;"><b>${T_IAX_CESIONESREA.PORCESION}</b></td>
														<td class="td_" style="width: 150px;">-</td>
														<td class="td_" style="width: 150px;"><b>${T_IAX_CESIONESREA.IMPVALASE}</b></td>
														<td class="td_" style="width: 150px;"><b>${T_IAX_CESIONESREA.IMPCESION}</b></td>
													</tr>
												</table>
											</td>

											<td rowspan="1" style="width: 20px;"></td>
										</tr>
										<tr>
											<td class="td_" style="height: 16px;"><b><axis:alt f="axisrea011a" c="TOTALS"
														lit="9909984" /></b></td>

											<td rowspan="1">
												<div class="dspIcons">
													<table>
														<tr>
															<td><a href="javascript:f_but_axisrea047('${T_IAX_CESIONESREA.SPROCES}')"> <img
																	border="0" style="height: 13px;" alt="<axis:alt f="axisrea011a" c="DESGAMP1" lit="9001863"/>"
																	title="<axis:alt f="axisrea011a" c="DESGAMP2" lit="9001863"/>" src="images/mas.gif" />
															</a></td>
															<td><a href="javascript:f_descargar_reporte('${T_IAX_CESIONESREA.SPROCES}')">
																	<img border="0" style="height: 13px;" alt="<axis:alt f="axiscga002" c="PRINT" lit="100001"/>"
																	title="<axis:alt f="axiscga002" c="PRINT" lit="100001"/>" src="images/print.gif" />
															</a></td>
														</tr>
													</table>

												</div>
											</td>
										</tr>
									</c:forEach>

								</table>
								<div class="separador">&nbsp;</div>
							</td>
						</tr>
						<tr>
							<td align="left">
								<div class="separador">&nbsp;</div>
								<table class="area" align="center" id="detalle" style="display: none">
									<tr>
										<td><c:set var="resumen_detalle">
												<span id="resumen_detalle" class="titulocaja"
													style="color: black; font-weight: normal; padding-bottom: 2px; . vertical-align: bottom">
													${__formdata.SCONTRA}/${__formdata.NVERSIO} &nbsp; ${__formdata.TCTRAMO} &nbsp; <b><axis:alt
															f="axisrea011a" c="FEFECTOCES" lit="100883" />:</b> <fmt:formatDate
														value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy" />
												</span>
											</c:set>
											<div class="titulo">
												<img src="images/flecha.gif" />
												<axis:alt f="axisrea011a" c="RESDETCES" lit="9001866" />
												<%-- Detalle cesión --%>
												&nbsp; ${resumen_detalle}
											</div>

											<table class="area" align="center">
												<tr>
													<th style="width: 35%; height: 0px"></th>
													<th style="width: 30%; height: 0px"></th>
													<th style="width: 20%; height: 0px"></th>
													<th style="width: 15%; height: 0px"></th>
												</tr>

												<tr>
													<axis:ocultar f="axisrea011a" c="NMOVIMI" dejarHueco="false">
														<td class="titulocaja"><b id="label_NMOVIMI"><axis:alt f="axisrea011a"
																	c="LMOVCES" lit="9001868" /></b> <%-- Movimiento --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FEFECTO" dejarHueco="false">
														<td class="titulocaja"><b id="label_FEFECTO"><axis:alt f="axisrea011a"
																	c="LFEFECTCES" lit="100883" /></b> <%-- Fecha efecto --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FVENCIM" dejarHueco="false">
														<td class="titulocaja"><b id="label_FVENCIM"><axis:alt f="axisrea011a"
																	c="LFVENCCES" lit="100885" /></b> <%-- Fecha vencimiento --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FANULAC" dejarHueco="false">
														<td class="titulocaja"><b id="label_FANULAC"><axis:alt f="axisrea011a"
																	c="LFANULCES" lit="140214" /></b> <%-- Fecha anulación --%></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar f="axisrea011a" c="NMOVIMI" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="NMOVIMI" name="NMOVIMI" size="15"
															<axis:atr f="axisrea011a" c="NMOVIMI" a="modificable=false"/>
															value="${__formdata.NMOVIMI}" style="width: 10%"
															title="<axis:alt f="axisrea011a" c="CNMOVIMICES" lit="9001868"/>" /> &nbsp;&nbsp; <input
															type="text" class="campowidthinput campo campotexto" id="TCGENERA" name="TCGENERA"
															size="15" <axis:atr f="axisrea011a" c="TCGENERA" a="modificable=false"/>
															value="${__formdata.TCGENERA}" style="width: 80%"
															title="<axis:alt f="axisrea011a" c="CTCGENERACES" lit="9001868"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FEFECTO" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="FEFECTO" name="FEFECTO" size="15"
															<axis:atr f="axisrea011a" c="FEFECTO" a="modificable=false"/>
															value="<fmt:formatDate value="${__formdata.FEFECTO}" pattern="dd/MM/yyyy"/>"
															style="width: 40%" title="<axis:alt f="axisrea011a" c="CFEFECTOCES" lit="100883"/>" />
														</td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FVENCIM" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="FVENCIM" name="FVENCIM" size="15"
															<axis:atr f="axisrea011a" c="FVENCIM" a="modificable=false"/>
															value="<fmt:formatDate value="${__formdata.FVENCIM}" pattern="dd/MM/yyyy"/>"
															style="width: 60%" title="<axis:alt f="axisrea011a" c="CFVENCIMCES" lit="100885"/>" />
														</td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="FANULAC" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="FANULAC" name="FANULAC" size="15"
															<axis:atr f="axisrea011a" c="FANULAC" a="modificable=false"/>
															value="<fmt:formatDate value="${__formdata.FANULAC}" pattern="dd/MM/yyyy"/>"
															style="width: 85%" title="<axis:alt f="axisrea011a" c="CFANULACCES" lit="140214"/>" />
														</td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar f="axisrea011a" c="NRIESGO" dejarHueco="false">
														<td class="titulocaja"><b id="label_NRIESGO"><axis:alt f="axisrea011a"
																	c="LRIESGOCES" lit="100649" /></b> <%-- Riesgo --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="SCONTRA" dejarHueco="false">
														<td class="titulocaja"><b id="label_SCONTRA"><axis:alt f="axisrea011a"
																	c="LCONTRCES" lit="9001594" /></b> <%-- Contrato QP/núm.versión --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="TCTRAMO" dejarHueco="false">
														<td class="titulocaja"><b id="label_TCTRAMO"><axis:alt f="axisrea011a"
																	c="LTRAMOCES" lit="9000609" /></b> <%-- Tramo --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="SFACULT" dejarHueco="false">
														<td class="titulocaja"><b id="label_SFACULT"><axis:alt f="axisrea011a"
																	c="LNFACULTACES" lit="9001918" /></b> <%-- Nº facultativo --%></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar f="axisrea011a" c="NRIESGO" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="NRIESGO" name="NRIESGO" size="15"
															<axis:atr f="axisrea011a" c="NRIESGO" a="modificable=false"/>
															value="${__formdata.NRIESGO}" style="width: 10%"
															title="<axis:alt f="axisrea011a" c="CNGRIESGOCES" lit="100649"/>" /> &nbsp;&nbsp; <input
															type="text" class="campowidthinput campo campotexto" id="NOM" name="NOM" size="15"
															<axis:atr f="axisrea011a" c="NOM" a="modificable=false"/> value="${__formdata.NOM}"
															style="width: 80%" title="<axis:alt f="axisrea011a" c="CNOMCES" lit="100649"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="SCONTRA" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="SCONTRA" name="SCONTRA" size="15"
															<axis:atr f="axisrea011a" c="SCONTRA" a="modificable=false"/>
															value="${__formdata.SCONTRA}" style="width: 10%"
															title="<axis:alt f="axisrea011a" c="CSCONTRACES" lit="9001594"/>" /> &nbsp;&nbsp; <input
															type="text" class="campowidthinput campo campotexto" id="NVERSIO" name="NVERSIO"
															size="15" <axis:atr f="axisrea011a" c="NVERSIO" a="modificable=false"/>
															value="${__formdata.NVERSIO}" style="width: 10%"
															title="<axis:alt f="axisrea011a" c="CNVERSIOCES" lit="9001594"/>" /> &nbsp;&nbsp; <input
															type="text" class="campowidthinput campo campotexto" id="TCONTRA" name="TCONTRA"
															size="15" <axis:atr f="axisrea011a" c="TCONTRA" a="modificable=false"/>
															value="${__formdata.TCONTRA}" style="width: 60%"
															title="<axis:alt f="axisrea011a" c="CTCONTRACES" lit="9001594"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="TCTRAMO" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="TCTRAMO" name="TCTRAMO" size="15"
															<axis:atr f="axisrea011a" c="TCTRAMO" a="modificable=false"/>
															value="${__formdata.TCTRAMO}" style="width: 85%"
															title="<axis:alt f="axisrea011a" c="CTCTRAMOCES" lit="9000609"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="SFACULT" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="SFACULT" name="SFACULT" size="15"
															<axis:atr f="axisrea011a" c="SFACULT" a="modificable=false"/>
															value="${__formdata.SFACULT}" style="width: 85%"
															title="<axis:alt f="axisrea011a" c="CSFACULTCES" lit="9001918"/>" /></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar f="axisrea011a" c="CGARANT" dejarHueco="false">
														<td class="titulocaja"><b id="label_CGARANT"><axis:alt f="axisrea011a"
																	c="LGARANTICES" lit="110994" /></b> <%-- Garantía --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="NSINIES" dejarHueco="false">
														<td class="titulocaja"><b id="label_NSINIES"><axis:alt f="axisrea011a"
																	c="LSINIPAGCES" lit="9001869" /></b> <%-- Siniestro / pago --%></td>
													</axis:ocultar>
													<td class="titulocaja"><axis:ocultar f="axisrea011a" c="PFACCED"
															dejarHueco="false">
															<b id="label_PFACCED"><axis:alt f="axisrea011a" c="LREASCES" lit="9000608" /></b>
															<%-- % Reas. --%>
                                                            &nbsp;&nbsp;
                                                        </axis:ocultar> <axis:ocultar f="axisrea011a" c="ICAPCES"
															dejarHueco="false">
															<b id="label_ICAPCES"><axis:alt f="axisrea011a" c="LCAPACITCES" lit="9000602" /></b>
															<%-- Capacitat --%>
														</axis:ocultar></td>
													<axis:ocultar f="axisrea011a" c="ICESION" dejarHueco="false">
														<td class="titulocaja"><b id="label_ICESION"><axis:alt f="axisrea011a"
																	c="LCESION" lit="9001870" /></b> <%-- Cesión --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="PRIMARET" dejarHueco="false">
														<td class="titulocaja"><b id="label_PRIMARET"><axis:alt f="axisrea011a"
																	c="PRIMARET" lit="9906654" /></b> <%-- Prima retencion --%></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="ICOMEXT" dejarHueco="false">
														<td class="titulocaja"><b id="label_ICOMEXT"><axis:alt f="axisrea011a"
																	c="ICOMEXT" lit="9906742" /></b> <%-- Comisión extra prima --%></td>
													</axis:ocultar>
												</tr>
												<tr>
													<axis:ocultar f="axisrea011a" c="CGARANT" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="CGARANT" name="CGARANT" size="15"
															<axis:atr f="axisrea011a" c="CGARANT" a="modificable=false"/>
															value="${__formdata.CGARANT}" style="width: 10%"
															title="<axis:alt f="axisrea011a" c="CCGARANTCES" lit="110994"/>" /> &nbsp;&nbsp; <input
															type="text" class="campowidthinput campo campotexto" id="TGARANT" name="TGARANT"
															size="15" <axis:atr f="axisrea011a" c="TGARANT" a="modificable=false"/>
															value="${__formdata.TGARANT}" style="width: 80%"
															title="<axis:alt f="axisrea011a" c="CTGARANTCES" lit="110994"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="NSINIES" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="NSINIES" name="NSINIES" size="15"
															<axis:atr f="axisrea011a" c="NSINIES" a="modificable=false"/>
															value="${__formdata.NSINIES}" style="width: 40%"
															title="<axis:alt f="axisrea011a" c="CNSINIESCES" lit="9001869"/>" /></td>
													</axis:ocultar>
													<td class="campocaja"><axis:ocultar f="axisrea011a" c="PFACCED" dejarHueco="false">
															<input type="text" class="campowidthinput campo campotexto" id="PFACCED"
																name="PFACCED" size="15"
																<axis:atr f="axisrea011a" c="PFACCED" a="modificable=false"/>
																value='${__formdata.PCESION}' style="width: 20%"
																title="<axis:alt f="axisrea011a" c="CPFACCEDCES" lit="9000608"/>" />
                                                                &nbsp;&nbsp;
                                                            <input type="text"
																class="campowidthinput campo campotexto" id="ICAPCES" name="ICAPCES" size="15"
																<axis:atr f="axisrea011a" c="ICAPCES" a="modificable=false"/> style="width: 55%"
																value='${__formdata.ICAPCES}'
																title="<axis:alt f="axisrea011a" c="CICAPCESCES" lit="9000602"/>" />
														</axis:ocultar></td>
													<axis:ocultar f="axisrea011a" c="ICESION" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="ICESION" name="ICESION" size="15"
															<axis:atr f="axisrea011a" c="ICESION" a="modificable=false"/>
															value='${__formdata.ICESION}' style="width: 85%"
															title="<axis:alt f="axisrea011a" c="CICESIONCES" lit="9001870"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="PRIMARET" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="PRIMARET" name="PRIMARET" size="15"
															<axis:atr f="axisrea011a" c="PRIMARET" a="modificable=false"/>
															value="${__formdata.PRIMARET}" style="width: 100px"
															title="<axis:alt f="axisrea011a" c="PRIMARET" lit="9906654"/>" /></td>
													</axis:ocultar>
													<axis:ocultar f="axisrea011a" c="ICOMEXT" dejarHueco="false">
														<td class="campocaja"><input type="text" class="campowidthinput campo campotexto"
															id="ICOMEXT" name="ICOMEXT" size="15"
															<axis:atr f="axisrea011a" c="ICOMEXT" a="modificable=false"/>
															value="${__formdata.ICOMEXT}" style="width: 100px"
															title="<axis:alt f="axisrea011a" c="ICOMEXT" lit="9906742"/>" /></td>
													</axis:ocultar>

												</tr>
											</table></td>
									</tr>
								</table>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>



		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisrea011a</c:param>
			<c:param name="f">axisrea011a</c:param>
			<c:param name="__botones">salir</c:param>
		</c:import>

	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>
