
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<c:set var="miGET_MOV_CTACOAindex" value="0" />
<c:set var="miGET_MOV_CTACOAindexSigueSumando" value="1" />
<c:forEach items="${__formdata.GET_MOV_CTACOA}" var="item">
	<c:if
		test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].NNUMLIN==__formdata.IDREGISTRO}">
		<c:set var="miGET_MOV_CTACOAindexSigueSumando" value="0" />
	</c:if>
	<c:if test="${miGET_MOV_CTACOAindexSigueSumando==1}">
		<c:set var="miGET_MOV_CTACOAindex" value="${miGET_MOV_CTACOAindex+1}" />
	</c:if>
</c:forEach>

<html>
<head>
<title><axis:alt f="axisrea050" c="TITULO" lit="9909796" /></title>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css"></link>
<c:import url="../include/carga_framework_js.jsp" />
<link rel="stylesheet" type="text/css" media="all"
	href="styles/calendar-green.css" title="green" />
<script type="text/javascript" src="scripts/calendar.js"></script>
<script type="text/javascript"
	src="scripts/calendar-${sessionScope.__locale}.js"></script>
<script type="text/javascript" src="scripts/calendar-setup.js"></script>
<script type="text/javascript">

	function f_onload() {

		if (document.getElementById("CMODO").value == 'ALTA_REMESA') {

			document.getElementById("CESTADO").value = 1;

		}

		var ok = '${__formdata.ok}';

		console.log(ok);

		if (ok == 1) {

			document.miForm.but_aceptar.style.display = 'none';

		}

		f_cargar_propiedades_pantalla();

	}

	function f_but_cancelar() {

		parent.f_cerrar_axisrea050();
	}

	function f_but_aceptar() {

		if (objValidador.validaEntrada()) {
			objUtiles.ejecutarFormulario("modal_axisrea050.do?ESTADO="
					+ document.getElementById("CESTADO").value, "aceptar",
					document.miForm, "_self", objJsMessages.jslit_cargando);
		}

	}

	/**
	 * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
	 * @param {Object} valor a validar
	 * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
	 * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
	 * @return {String} Valor obtenido de la validación y formateo
	 */
	function valorFormateadoCampoNumerico(entrada, isDecimal, tienePuntoMiles) {
		if (objNumero.validaNumero(entrada, isDecimal)) {
			// Validación correcta, formatear valor 
			entrada = objNumero.formateaNumero(entrada, isDecimal);
			if (!tienePuntoMiles)
				entrada = objNumero.quitarSeparadorMiles(entrada);

		} else {
			return '';
		}
		return entrada;
	}

	function reformatearImportes() {
		objDom.setValorPorId("IIMPORT", valorFormateadoCampoNumerico(objDom
				.getValorPorId("IIMPORT"), true, true));
	}
</script>
</head>
<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />
		<input type="hidden" name="identificador" value="${__formdata.identificador}" /> 
		<input type="hidden" name="IDREGISTRO" value="${__formdata.IDREGISTRO}" /> 
		<input type="hidden" name="CTIPCOA" value="${__formdata.CAB_COASEGURO[0].CTIPCOA}" /> 
		<input type="hidden" name="RECARGAR_PADRE_A_CANCELAR" value="${__formdata.RECARGAR_PADRE_A_CANCELAR}" /> 
		<input type="hidden" name="PMODO" value="${(!empty ALTA)?1:0}" /> 
		<input type="hidden" name="ALTA" value="${(!empty ALTA)?1:0}" />
		<input type="hidden" name="CEMPRES" value="${__formdata.CEMPRES}" />
		<input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />	
		<input type="hidden" name="SMVCOA" id="SMVCOA" value="${__formdata.SMVCOA}" />	
		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea050" c="TITCOA003" lit="9909796" />
			</c:param>
			<c:param name="form">axisrea050</c:param>
		</c:import>

		<table class="mainModalDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table class="seccion">
						<tr>
							<td>
								<table class="area" align="center">
									<tr>
										<th style="width: 25%; height: 0px"></th>
										<th style="width: 25%; height: 0px"></th>
										<th style="width: 25%; height: 0px"></th>
										<th style="width: 25%; height: 0px"></th>
									</tr>
									<tr>
										<td class="campocaja" colspan="5">
											<div class="separador">&nbsp;</div>
											<div class="titulo">
												<img src="images/flecha.gif" />
												<axis:alt f="axisrea050" c="TIT_COA" lit="9001947" />
											</div>
										</td>
									</tr>
									<tr>
										<axis:ocultar c="label_CCOMPANI" f="axisrea050" dejarHueco="false">
											<td class="titulocaja" colspan="2"><b><axis:alt
														f="axisrea050" c="CCOMPANI" lit="9904160" /></b> <!-- Reaseguradora -->
											</td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:visible c="CCOMPANI" f="axisrea050">
											<td class="campocaja" colspan="2">
											<select name="CCOMPANI" id="CCOMPANI" class="campowidthselect campo campotexto"
												<axis:atr f="axisrea050" c="CCOMPANI" a="modificable=true&obligato=true"/>>
												title="<axis:alt f="axisrea050" c="CCOMPANI" lit="9904160"/>"
												alt="<axis:alt f="axisrea050" c="CCOMPANI" lit="9904160"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea050" c="CCOMPANI" lit="1000348" /> -
													</option>
													<c:forEach var="item" items="${__formdata.listValores.LSTCIA_REA}">
														<option value="${item.CCOMPANI}"
															<c:if test="${item.CCOMPANI == __formdata.CTACOASEGURO[0].CCOMPANI}"> selected </c:if>>
															${item.TCOMPANI}</option>
													</c:forEach>
													
											</select>
											</td>
										</axis:visible>
									</tr>

									<tr>

										<axis:ocultar c="NPOLIZA" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="NPOLIZA" lit="111324" /></b> <!-- Póliza --></td>
										</axis:ocultar>
										<axis:ocultar f="axisrea049" c="LABEL_SUCURSAL">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="SUCURSAL" lit="9002202" /></b></td>
										</axis:ocultar>

									</tr>
									<tr>

										<axis:ocultar c="NPOLIZA" f="axisrea050" dejarHueco="false">
											<td class="campocaja"><input type="text"
												class="campo campotexto" style="width: 80%;" size="15"
												value="${__formdata.CTACOASEGURO[0].NPOLCIA}"
												name="NPOLIZA" id="NPOLIZA"
												<axis:atr f="axisrea050" c="NPOLIZA" a="modificable=false"/>
												title="<axis:alt f="axisrea050" c="NPOLIZA" lit="111324"/>" />

											</td>
										</axis:ocultar>
										<axis:visible f="axisrea050" c="SUCURSAL">
											<td class="campocaja" id="td_SUCURSAL" colspan="1"><select
												name="SUCURSAL" id="SUCURSAL" paramMap="true" size="1"
												onchange="" style="width: 100%"
												title="<axis:alt f="axisrea050" c="SUCURSAL" lit="9002202"/>"
												class="campowidthselect campo campotexto"
												<axis:atr f="axisrea050" c="SUCURSAL" a="modificable=true&isInputText=false"/>>
													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisrea050" c="SUCURSAL" lit="1000348" /> -
													</option>
													<c:forEach items="${__formdata.listValores.LSTASUC}"
														var="item">
														<option value="${item.CAGENTE}"
															<c:if test="${item.CAGENTE == __formdata.CTACOASEGURO[0].CSUCURSAL}"> selected </c:if>>
															${item.TAGENTE}</option>
													</c:forEach>
											</select></td>
										</axis:visible>

									</tr>

									<tr>
										<axis:ocultar c="FCIERRE" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="FCIERRE" lit="9000490" /></b></td>
										</axis:ocultar>
										<axis:ocultar c="label_CESTADO" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="label_CESTADO" lit="101510" /></b></td>
										</axis:ocultar>
										
									</tr>
									<tr>
										<axis:visible c="FCIERRE" f="axisrea050">
											<td class="campocaja">
												<!-- <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/> -->
												<input type="text" style="width: 50%;"
												class="campo campotexto" size="15"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.CTACOASEGURO[0].FCIERRE}" />"
												name="FCIERRE" id="FCIERRE"
												<axis:atr f="axisrea050" c="FCIERRE" a="&formato=fecha${(empty ALTA)?'&modificable=false':''}"/>
												title="<axis:alt f="axisrea050" c="FCIERRE" lit="9000490"/>" />
												<a style="vertical-align: middle;"><img
													id="icon_FCIERRE"
													title="<axis:alt f=" axiscoa001" c="FCIERRE" lit="100890" />"
													src="images/calendar.gif" /></a>
											</td>
										</axis:visible>
										<axis:ocultar c="CESTADO" f="axisrea050" dejarHueco="false">
											<td class="campocaja"><select name="CESTADO"
												id="CESTADO" size="1" class="campowidthselect campo"
												<axis:atr f="axisrea050" c="CESTADO" a="isInputText=false&obligatorio=true"/>
												title="<axis:alt f="axisrea050" c="CESTADO" lit="101510"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea050" c="SNV_COMBO" lit="100587" /> -
													</option>
													<c:forEach items="${ESTADO_CTA}" var="item">
														<option value="${item.CATRIBU}"
																<c:if test="${__formdata.CTACOASEGURO[0].CESTADO==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
													
													</c:forEach>
											</select></td>
										</axis:ocultar>
										
										
									</tr>
									<tr>
										<axis:ocultar c="TDESCRI" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="TDESCRI" lit="100588" /></b></td>
										</axis:ocultar>
										<axis:ocultar c="TDOCUME" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="TDOCUME" lit="105330" /></b></td>
										</axis:ocultar>
									</tr>
									<tr>
										<axis:ocultar c="TDESCRI" f="axisrea050" dejarHueco="false">
											<td class="campocaja"><input type="text"
												class="campo campotexto" size="15"
												value="${__formdata.CTACOASEGURO[0].TDESCRI}"
												name="TDESCRI" id="TDESCRI"
												<axis:atr f="axisrea050" c="TDESCRI" a=""/>
												title="<axis:alt f="axisrea050" c="TDESCRI" lit="100588"/>" />
											</td>
										</axis:ocultar>
										<axis:ocultar c="TDOCUME" f="axisrea050" dejarHueco="false">
											<td class="campocaja"><input type="text"
												class="campo campotexto" size="15"
												value="${__formdata.CTACOASEGURO[0].TDOCUME}"
												name="TDOCUME" id="TDOCUME"
												<axis:atr f="axisrea050" c="TDOCUME" a=""/>
												title="<axis:alt f="axisrea050" c="TDOCUME" lit="105330"/>" />
											</td>
										</axis:ocultar>
									</tr>
									<tr>
										<%--
                      <axis:ocultar c="CCONCEP" f="axisrea050" dejarHueco="false">
                        <td class="titulocaja">
                          <b><axis:alt f="axisrea050" c="CCONCEP" lit="9000715"/></b>
                        </td>
                      </axis:ocultar>
                      --%>
										<axis:ocultar c="CIMPORT" f="axisrea050" dejarHueco="false">
											<td class="titulocaja" id="tit_CIMPORT"><b
												id="label_CIMPORT"><axis:alt f="axisrea050" c="CIMPORT"
														lit="9002015" /></b></td>
										</axis:ocultar>

										<axis:ocultar c="CDEBHAB" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="CDEBHAB" lit="9001948" /></b></td>
										</axis:ocultar>
										<axis:ocultar c="IIMPORT" f="axisrea050" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisrea050"
														c="IIMPORT" lit="100563" /></b></td>
										</axis:ocultar>
										
										<axis:visible f="axisrea050" c="CMONEDA">
                                            <td class="titulocaja" id="tit_CMONEDA">
                                                <b id="label_CMONEDA"><axis:alt f="axisrea050" c="CMONEDA" lit="108645"/></b>
                                            </td>
                                        </axis:visible>
										
									</tr>
									<tr>
										<%--
                      <axis:ocultar c="CCONCEP" f="axisrea050" dejarHueco="false">
                        <td class="campocaja">
                          <select name="CCONCEP" id="CCONCEP" size="1" class="campowidthselect campo"  <axis:atr f="axisrea050" c="CCONCEP" a="&isInputText=false&obligatorio=true"/>>
                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea050" c="SNV_COMBO" lit="108341"/> - </option>
                            <c:forEach items="${LSTCONCEP_CTA}" var="item">
                              <option value="${item.CATRIBU}" <c:if test="${__formdata.GET_MOV_CTACOA[miGET_MOV_CTACOAindex].CCONCEP==item.CATRIBU}}">selected</c:if>>${item.TATRIBU}</option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      --%>
										<axis:ocultar c="CIMPORT" f="axisrea050" dejarHueco="false">
											<td class="campocaja" id="td_CIMPORT"><select
												name="CIMPORT" id="CIMPORT" size="1"
												class="campowidthselect campo"
												<axis:atr f="axisrea050" c="CIMPORT" a="isInputText=false&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/>
												onchange="f_cargar_propiedades_pantalla();"
												title="<axis:alt f="axisrea050" c="CIMPORT" lit="9002015"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea050" c="SNV_COMBO" lit="108341" /> -
													</option>
													<c:forEach items="${TIPO_IMPORTE}" var="item">
														<option value="${item.CATRIBU}"
															<c:if test="${__formdata.CTACOASEGURO[0].CIMPORT ==item.CATRIBU}">selected</c:if>>${item.TATRIBU}</option>
													</c:forEach>
											</select></td>
										</axis:ocultar>

										<axis:ocultar c="CDEBHAB" f="axisrea050" dejarHueco="false">
											<td class="campocaja" id="td_CDEBHAB"><select
												name="CDEBHAB" id="CDEBHAB" size="1"
												class="campowidthselect campo"
												<axis:atr f="axisrea050" c="CDEBHAB" a="isInputText=false&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/>
												title="<axis:alt f="axisrea050" c="CDEBHAB" lit="9001948"/>">
													<option value="<%= Integer.MIN_VALUE %>">-
														<axis:alt f="axisrea050" c="SNV_COMBO" lit="108341" /> -
													</option>
													<option value="1"
														<c:if test="${__formdata.CTACOASEGURO[0].CDEBHAB==1}">selected</c:if>><axis:alt
															f="axisrea050" c="CDEBHAB_DEBE" lit="9000499" /></option>
													<option value="2"
														<c:if test="${__formdata.CTACOASEGURO[0].CDEBHAB==2}">selected</c:if>><axis:alt
															f="axisrea050" c="CDEBHAB_DEBE" lit="101004" /></option>
											</select></td>
										</axis:ocultar>
										<axis:ocultar c="IIMPORT" f="axisrea050" dejarHueco="false">
											<td class="campocaja">
													
														<input type="text" style="width: 50%;"
															class="campo campotexto" size="15"
															value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.CTACOASEGURO[0].IMOVIMI}"/>"
															name="IIMPORT" id="IIMPORT"
															title="<axis:alt f="axisrea050" c="IIMPORT" lit="100563"/>"
															<axis:atr f="axisrea050" c="IIMPORT" a="formato=decimal&obligatorio=true${(empty ALTA)?'&modificable=false':''}"/> />
													
												
										</axis:ocultar>
										<axis:visible f="axisrea050" c="CMONEDA">
                                         <td class="campocaja" id="td_CMONEDA">     
                                     <select name="CMONEDA" id="CMONEDA" paramMap="true"  size="1" class="campowidthselect campo campotexto" style="width:62.5%;"                               
                                         title="<axis:alt f="axisrea050" c="BROKER" lit="108645"/>" >                                       
                                        <option value=""> - <axis:alt f="axisrea050" c="ALT_CMONEDA_SEL" lit="108645"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaMonedas}">
                                                <option value = "${element.CMONEDA}" 
                                                <c:if test="${element.CMONEDA == __formdata.CTACOASEGURO[0].CMONEDA}"> selected </c:if> /> 
                                                               ${element.TMONEDA} 
                                                </option>
                                            </c:forEach>
                                        </select>   
                                       </td>
                                         </axis:visible> 
										
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisrea050</c:param>
			<c:param name="__botones">cancelar<axis:visible
					c="BT_GUARDAR" f="axisrea050">,aceptar</axis:visible>
			</c:param>
		</c:import>
		<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FCIERRE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FCIERRE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
	</form>
	<c:import url="../include/mensajes.jsp" />
</body>
</html>