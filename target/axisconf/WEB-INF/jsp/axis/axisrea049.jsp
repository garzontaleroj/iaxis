<%/* Revision:# JLQtlmZqsskn28NAoIE71Q== # */%>
<%-- CONSULTA CUENTAS COASEGURO--%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" media="all"
	href="styles/calendar-green.css" title="green" />
<script type="text/javascript" src="scripts/calendar.js"></script>
<script type="text/javascript"
	src="scripts/calendar-${sessionScope.__locale}.js"></script>
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<c:import url="../include/carga_framework_js.jsp" />
<script type="text/javascript">

        

	function f_onload() {
		f_cargar_propiedades_pantalla();
		

	}

	function f_but_buscar() {

		if (objValidador.validaEntrada()) {
			objUtiles.ejecutarFormulario("axis_axisrea049.do", "buscar",document.miForm, "_self", objJsMessages.jslit_cargando);
		}

	}

	function f_but_cancelar() {

		objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea049","cancelar", document.miForm, "_self");
	}

	function f_but_9909788() {
		
		var EMPRESA = document.getElementById("CEMPRES").value;
		
		objUtiles.abrirModal("axisrea050","src","modal_axisrea050.do?operation=form&CMODO=ALTA_REMESA&CEMPRES="+EMPRESA);


	}

	function f_cerrar_axisrea050(){

		objUtiles.cerrarModal("axisrea050");
		f_but_buscar();

	}
	
	function f_editar(SMOVCOA){
		
		var EMPRESA = document.getElementById("CEMPRES").value;
		objUtiles.abrirModal("axisrea050","src","modal_axisrea050.do?operation=form&CMODO=MODIFICACION_REMESA&SMOVCOA="+SMOVCOA+"&CEMPRES="+EMPRESA);
			
	}
</script>
</head>
<body onunload="try { f_clear_resources(document.body) } catch (e) {}"
	onload="f_onload()"
	onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<form name="miForm" action="axis_axisrea049.do" method="POST">

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea049" c="TITULO" lit="REMESAS DE COASEGURO" />
			</c:param>
			<c:param name="formulario">
				<axis:alt f="axisrea049" c="TITULO" lit="REMESAS DE COASEGURO" />
			</c:param>
			<c:param name="form">axisrea049|</c:param>
		</c:import>

		<c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea049" c="TIT_005" lit="99999999" />
			</c:param>
			<c:param name="nid" value="axiscoa005" />
		</c:import>

		<%-- bug 0023830 --%>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisimprimir|<axis:alt
					f="axisrea049" c="cam_impressio_doc" lit="1000205" />|true</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">axisrea050|<axis:alt
					f="axisrea049" c="cam_impressio_doc" lit="999999999" />|true</c:param>
		</c:import>

		<input type="hidden" name="SPROCES" value="${__formdata.SPROCES}" />
		<input type="hidden" name="SPROCES_ANT" value="${__formdata.SPROCES_ANT}" /> 
		<input type="hidden"
			name="CCOMPANI_COA" value="${__formdata.CCOMPANI}" /> 
		<input
			type="hidden" id="operation" name="operation" value="" /> 
		<input
			type="hidden" id="filtros" name="filtros"
			value="${__formdata.filtros}" /> 
			<input type="hidden"
			id="identificador" name="identificador"
			value="${__formdata.identificador}" /> <input type="hidden"
			id="identificadorFila001" name="identificadorFila001"
			value="${__formdata.identificadorFila001}" />

		<table class="mainTableDimensions base" align="center" cellpadding="0"
			cellspacing="3">
			<tr>
				<td>
					<div class="separador">&nbsp;</div>
					<table class="seccion">
						<tr>
							<td>
								<table class="area" align="center">
									<tr>
										<th style="width: 25%; height: 0%;"></th>
										<th style="width: 25%; height: 0%;"></th>
										<th style="width: 25%; height: 0%;"></th>
										<th style="width: 25%; height: 0%;"></th>
									</tr>
									<tr>
										<axis:ocultar f="axisrea049" c="label_CEMPRES">
											<td class="titulocaja" colspan="2"><b><axis:alt
														f="axisrea049" c="CEMPRES" lit="101619" /></b></td>
										</axis:ocultar>


									</tr>
									<tr>
										<axis:ocultar f="axisrea049" c="CEMPRES">
											<td class="campocaja" colspan="2"><select name="CEMPRES"
												id="CEMPRES" size="1"
												onchange="f_itemchanges('CEMPRES', this.value)"
												class="campowidthselect campo campotexto"
												title="<axis:alt f="axisrea049" c="CEMPRES" lit="101619"/>"
												alt="<axis:alt f="axisrea049" c="CEMPRES" lit="101619"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea049" c="SELECC" lit="1000348" /> -
													</option>
													<c:forEach var="item" items="${LSTEMPRESAS}">
														<option value="${item.CEMPRES}"
															<c:if test="${__formdata.CEMPRES == item.CEMPRES || fn:length(LSTEMPRESAS) == 1}">selected</c:if>>${item.TEMPRES}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>

									</tr>
									<tr>

										<axis:ocultar f="axisrea049" c="CCOMPANI">
											<td class="titulocaja"><b><axis:alt f="axiscoa002"
														c="CCOMPANI" lit="9904160" /></b></td>
										</axis:ocultar>
										<axis:visible f="axisrea037" c="CESTADO">
											<td class="titulocaja"><b><axis:alt f="axisrea049"
														c="CESTADO" lit="9000489" /></b></td>
										</axis:visible>
									</tr>
									<tr>


										<axis:ocultar f="axisrea049" c="CCOMPANI">
											<td class="campocaja"><select name="CCOMPANI"
												id="CCOMPANI" class="campowidthselect campo campotexto"
												title="<axis:alt f="axisrea049" c="CCOMPANI" lit="9904160"/>"
												alt="<axis:alt f="axisrea049" c="CCOMPANI" lit="9904160"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea049" c="SELECC" lit="1000348" /> -
													</option>
													<c:forEach var="item" items="${LSTCIA_REA}">
														<option value="${item.CCOMPANI}"
															<c:if test="${__formdata.CCOMPANI == item.CCOMPANI || fn:length(LSTCIA_REA) == 1}">selected</c:if>>${item.TCOMPANI}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
										<axis:ocultar f="axisrea049" c="CESTADO">
											<td class="campocaja"><select name="CESTADO"
												id="CESTADO" size="1" onchange="f_buscar()"
												class="campo campotexto" style="width: 90%"
												title="<axis:alt f="axisrea049" c="CESTADO" lit="9000489"/>"
												alt="<axis:alt f="axisrea049" c="CESTADO" lit="9000489"/>">
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisrea049" c="SNV_COMBO" lit="1000348" /> -
													</option>
													<c:forEach items="${LSTESTADOS}" var="item">
														<option value="${item.CATRIBU}"
															<c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>
									</tr>

									<tr>
										<axis:ocultar f="axisrea049" c="SUCURSAL">
											<td class="titulocaja"><b><axis:alt f="axisrea049"
														c="SUCURSAL" lit="9002202" /></b></td>
										</axis:ocultar>
										<axis:ocultar f="axisrea049" c="NPOLIZA">
											<td class="titulocaja"><b><axis:alt f="axisrea049"
														c="NPOLIZA" lit="9904143" /></b></td>
										</axis:ocultar>

									</tr>


									<tr>
										<axis:visible f="axislist002" c="SUCURSAL">
											<td class="campocaja" id="td_SUCURSAL" colspan="1"><select
												name="SUCURSAL" id="SUCURSAL" paramMap="true" size="1"
												onchange="" style="width: 100%"
												title="<axis:alt f="axislist002" c="SUCURSAL" lit="9002202"/>"
												class="campowidthselect campo campotexto"
												<axis:atr f="axislist002" c="SUCURSAL" a="modificable=true&isInputText=false"/>>
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axislist002" c="SELECTED" lit="1000348" /> -
													</option>
													<c:forEach items="${__formdata.listValores.LSTASUC}"
														var="item">
														<option value="${item.CAGENTE}"
															<c:if test="${item.CAGENTE == __formdata.SUCURSAL}"> selected </c:if>>
															${item.TAGENTE}</option>
													</c:forEach>
											</select></td>
										</axis:visible>

										<axis:ocultar f="axisrea049" c="NPOLIZA">
											<td class="campocaja"><input type="text" name="NPOLIZA"
												id="NPOLIZA" class="campo campotexto" style="width: 70%"
												value="${__formdata.NPOLIZA}"
												title="<axis:alt f="axisrea049" c="NPOLIZA" lit="109546"/>"
												alt="<axis:alt f="axisrea049" c="NPOLIZA" lit="NPOLIZA"/>"
												<axis:atr f="axisrea049" c="NPOLIZA" a="formato=entero"/> />

											</td>
										</axis:ocultar>

									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td class="titulocaja" colspan="5">
								<div class="separador">&nbsp;</div>
								<div class="displayspaceGrande">
									<c:set var="title0">
										<axis:alt f="axisrea049" c="COMPANIA" lit="9901223" />
									</c:set>

									<c:set var="title1">
										<axis:alt f="axisrea049" c="COASEGURADORA" lit="9904160" />
									</c:set>

									<c:set var="title2">
										<axis:alt f="axisrea049" c="FECHACIERRE" lit="9000490" />
									</c:set>

									<c:set var="title3">
										<axis:alt f="axisrea049" c="TIPOCOASEGURO" lit="9002015" />
									</c:set>


									<c:set var="title4">
										<axis:alt f="axisrea049" c="MONEDA" lit="108645" />
									</c:set>

									<c:set var="title5">
										<axis:alt f="axisrea049" c="ISALDO" lit="104910" />
									</c:set>
									<c:set var="title6">
										<axis:alt f="axisrea049" c="NPOLCIA" lit="9904143" />
									</c:set>
									<c:set var="title7">
										<axis:alt f="axisrea049" c="SUCURSAL" lit="9002202" />
									</c:set>


									<display:table name="${CTACOASEGURO}" id="CTACOASEGURO"
										export="false" class="dsptgtable" pagesize="-1"
										defaultsort="3" defaultorder="ascending" sort="list"
										cellpadding="0" cellspacing="0"
										requestURI="axis_axisrea049.do?paginar=true">
										<%@ include file="../include/displaytag.jsp"%>

										<display:column title="" sortable="false"
											headerClass="sortable headwidth5 fixed" media="html"
											autolink="false">
											<div class="dspIcons">${CTACOASEGURO.SMOVCOA}</div>
										</display:column>
										<display:column title="${title6}" sortable="false"
											headerClass="sortable headwidth5 fixed" media="html"
											autolink="false">
											<div class="dspIcons">${CTACOASEGURO.NPOLCIA}</div>
										</display:column>
										<display:column title="${title1}" sortable="true"
											sortProperty="TCOMPAPR" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspText">${CTACOASEGURO.TCOMPANI}</div>
										</display:column>
										<display:column title="${title7}" sortable="true"
											sortProperty="TCOMPAPR" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspText">${CTACOASEGURO.SUCURSAL}</div>
										</display:column>

										<display:column title="${title2}" sortable="true"
											sortProperty="FCIERRE" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspText">
												<fmt:formatDate value="${CTACOASEGURO.FCIERRE}"
													pattern="dd/MM/yyyy" />
											</div>
										</display:column>
										<display:column title="${title3}" sortable="true"
											sortProperty="TTIPCOA" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspText">
												<span style="text-decoration: underline; cursor: pointer">
													${CTACOASEGURO.TTIPCOA} </span>
											</div>
										</display:column>
										<display:column title="${title4}" sortable="true"
											sortProperty="TMONEDA" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspText">${CTACOASEGURO.TDESCRIMONEDAS}</div>
										</display:column>
										<display:column title="${title5}" sortable="true"
											sortProperty="ISALDO" headerClass="sortable fixed"
											media="html" autolink="false">
											<div class="dspNumber">
												<div class="dspText">${CTACOASEGURO.IMOVIMI}</div>
											</div>
										</display:column>
                                        <display:column title="" sortable="" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%" >
                                            <div class="dspIcons">
                                                <img border="0" alt="<axis:alt f="axisrea049" c="EDIT" lit="9901356"/>" title="<axis:alt f="axismnt015" c="edit" lit="9901356"/>" src="images/lapiz.gif"
                                                style="vertical-align:middle;cursor:pointer;" 
                                                onclick="javascript:f_editar('${CTACOASEGURO.SMOVCOA}')"/>
                                            </div>
                                        </display:column>
										</display:table>


										<div class="separador">&nbsp;</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisrea049</c:param>
			<c:param name="__botones">cancelar,<axis:visible
					f="axisrea049" c="BT_REMESA">9909788,</axis:visible>buscar</c:param>
		</c:import>
		<div class="separador">&nbsp;</div>
	</form>
	<c:import url="../include/mensajes.jsp" />
	<script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>
</body>
</html>