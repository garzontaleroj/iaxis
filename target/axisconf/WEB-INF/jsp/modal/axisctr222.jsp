<%/* Revision:# yREcTVia9F6/r6tEMmGn8A== # */%>

<%
	/**
	*  Fichero: axisctr222.jsp
	*  @author <a href="mailto:jaesteban@csi-ti.com">Johan Esteban</a>
	*   
	*  Modal - Calcula fecha
	*
	*  Fecha: 18/03/2016
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
<%
	String codPantalla = "axisctr222";
%>
<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>

<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
	function f_onload() {
		f_cargar_propiedades_pantalla();
		/** Changed for IAXIS-4320 PK-19/06/2019 Start */
		var rowCount = miListaIdGarantiasIva.rows.length;
        for (var i = rowCount - 1; i > 2; i--) {
        	miListaIdGarantiasIva.deleteRow(i);
        }
        var rowCount = miListaIdGarantiasGastos.rows.length;
        for (var i = rowCount - 1; i > 2; i--) {
        	miListaIdGarantiasGastos.deleteRow(i);
        }
        /** Changed for IAXIS-4320 PK-19/06/2019 End */
	}

	function f_but_cancelar() {
		parent.f_cerrar_Axisctr222();
	}
</script>
</head>
<body class=" " onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>


	<form name="miForm" action="" method="POST">
		<input type="hidden" name="operation" value="" />

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="formulario">
				<axis:alt f="axisctr222" c="TITULOPANTA" lit="9909212" />
			</c:param>
			<c:param name="producto">
				<axis:alt f="axisctr222" c="TITULOPANTA" lit="9909212" />
			</c:param>
			<c:param name="form">axisctr222</c:param>
		</c:import>

		<c:set var="title0">
			<axis:alt f="axisctr222" c="DESCRIPCION" lit="100588" />
		</c:set>
		<c:set var="title1">
			<axis:alt f="axisctr222" c="ICAPITAL" lit="1000073" />
		</c:set>
               	<c:set var="title3">
			<axis:alt f="axisctr222" c="IPRITAR" lit="9904028" />
		</c:set>
                <c:set var="title2">
			<axis:alt f="axisctr222" c="TASACAMB" lit="9909323" />
		</c:set>
		<c:set var="title4">
			<axis:alt f="axisctr222" c="IPRITARC" lit="9904028" />
		</c:set>
		<c:set var="title5">
			<axis:alt f="axisctr222" c="DETGARANT" lit="9901659" />
		</c:set>
		<c:set var="title6">
			<axis:alt f="axisctr222" c="PREGGARANT" lit="9901660" />
		</c:set>
		<c:set var="title7">
			<axis:alt f="axisctr222" c="FRANGARANT" lit="9901661" />
		</c:set>
		<c:set var="title8">
			<axis:alt f="axisctr222" c="CMONCAP" lit="108645" />
		</c:set>
		<c:set var="title9">
			<axis:alt f="axisctr222" c="IPRIRED" lit="101340" />
		</c:set>
		<c:set var="title10">
			<axis:alt f="axisctr222" c="FEFECTO" lit="9909213" />
		</c:set>
		
		<c:set var="title12">
			<axis:alt f="axisctr222" c="ICDERREG" lit="108480" />
		</c:set>
		
		<div class="separador">&nbsp;</div>

		<table class="mainModalDimensions base" align="center" cellpadding="0"
			cellspacing="0" style="height:100px">
			<tr>
				<td>
				    <div class="titulo"><img src="images/flecha.gif">Garantías</div>
				    <div class="separador">&nbsp;</div>
					<table class="seccion" cellpadding="0" cellspacing="0"
						align="center" id="miListaIdGarantias">
						<thead>
							<tr>
								<axis:visible f="axisctr222" c="DESCRIPCION">
									<th style="width: 30%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 5%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="FEFECTO">
									<th style="width: 7%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 5%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICAPITAL">
									<th style="width: 8%; height: 0px"></th>
								</axis:visible>
                                <axis:visible f="axisctr222" c="IPRITAR">
									<th style="width: 10%; height: 0px"></th>
								</axis:visible>
                                <axis:visible f="axisctr222" c="TASACAMB">
									<th style="width: 3%; height: 0px"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICAPITAL">
									<th style="width: 10%; height: 0px"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRITARC">
									<th style="width: 10%; height: 0px"></th>
								</axis:visible>
							</tr>
							<tr>
								<axis:visible f="axisctr222" c="DESCRIPCION">
									<td class="sortable"><b>${title0}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="TASACAMB">
									<td class="sortable"><b>${title2}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="FEFECTO">
									<td class="sortable"><b>${title10}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICAPITAL">
									<td class="sortable"><b>${title1}</b></td>
								</axis:visible>
                                <axis:visible f="axisctr222" c="IPRITAR">
									<td class="sortable"><b>${title3}</b></td>
								</axis:visible>
                                
                                <axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICAPITAL">
									<td class="sortable"><b>${title1}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRITARC">
									<td class="sortable"><b>${title4}</b></td>
								</axis:visible>
								

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.garantiasMoneda}"
								var="miListaIdGarantias" varStatus="x">
								<tr
									<c:if test="${x.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
									<c:if test="${x.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.DESCRIPCION}</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.TCAMBIO}"/>
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="FEFECTO">
										<td>
											<div class="dspText">
												<div class="dspText">${miListaIdGarantias.FCAMBIO}</div>
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.CMONCAPFIN}</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.ICAPITALC}"/>
											</div>
										</td>
									</axis:visible>
                                    <axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.IPRITARC}"/>
											</div>
										</td>
									</axis:visible>

									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.CMONCAPINT}</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.ICAPITAL}"/>
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
												<%-- <fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.IPRITAR}"/> --%>
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.IPRIDEV}"/>
												<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
											</div>
										</td>
									</axis:visible>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot 
							<c:if test="${sessionScope.nrow mod 2 ==0}">class="titulo gridNotEven"</c:if>
							<c:if test="${sessionScope.nrow mod 2 !=0}">class="titulo gridEven"</c:if>						
						>						
							<tr>
								<td class="right">Total:</td>
								<td></td>
								<td></td>
								<!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
								<td></td>
								<td>
									<div class="dspNumber">
										<fmt:formatNumber
											pattern="${__formatNumberPatterns[CMONPRODINT]}"
											value="${sessionScope.SUMACCAPITAL}"/>
									</div>
								</td>
                                <td>
                                	<div class="dspNumber">
										<fmt:formatNumber
											pattern="${__formatNumberPatterns[CMONPRODINT]}"
											value="${sessionScope.TOTALPRIMAPESOS}"/>
									</div>
								</td>
								<td></td>
								<td>
									<div class="dspNumber">
										<fmt:formatNumber
											pattern="${__formatNumberPatterns[CMONPRODINT]}"
											value="${sessionScope.SUMACPRIMA}"/>
									</div>
								</td>
								<td>
									<div class="dspNumber">
										<fmt:formatNumber
											pattern="${__formatNumberPatterns[CMONPRODINT]}"
											value="${sessionScope.TOTALPRIMAEXT}"/>
									</div>
								</td>
								<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
							</tr>
						</tfoot>
					</table>
				</td>
			</tr>
		</table>
		
		<table class="mainModalDimensions base" align="center" cellpadding="0"
			cellspacing="0" style="height: 100px">
			<tr>
				<td>
				    <div class="titulo"><img src="images/flecha.gif">Total Iva</div>
				    <div class="separador">&nbsp;</div>
				    <!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
					<table class="seccion" cellpadding="0" cellspacing="0"
						align="center" id="miListaIdGarantiasIva">
					<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
						<thead>
							<tr>

								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 3%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 3%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRIRED">
									<th style="width: 5%; height: 0px"></th>
								</axis:visible>
                                <axis:visible f="axisctr222" c="TASACAMB">
									<th style="width: 3%; height: 0px"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRIRED">
									<th style="width: 5%; height: 0px"></th>
								</axis:visible>
							</tr>
							<tr>
								<axis:visible f="axisctr222" c="TASACAMB">
									<td class="sortable"><b>${title2}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRIRED">
									<td class="sortable"><b>${title9}</b></td>
								</axis:visible>
                                
                                <axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>							
								<axis:visible f="axisctr222" c="IPRIRED">
									<td class="sortable"><b>${title9}</b></td>
								</axis:visible>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.garantiasMoneda}"
								var="miListaIdGarantias" varStatus="x">
								<tr
									<c:if test="${x.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
									<c:if test="${x.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>>

									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.TCAMBIO}"/>
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.CMONCAPFIN}</div>
										</td>
									</axis:visible>

                                    <axis:visible f="axisctr222" c="IPRIRED">
										<td>
											<div class="dspNumber">
												<!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
												<%-- <fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.IVAPESOS}"/> --%>
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.IVA}"/>
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<%-- <div class="dspText">${miListaIdGarantias.CMONCAPINT}</div> --%>
											<div class="dspText">${miListaIdGarantias.CMONCAPFIN}</div>
											<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
										</td>
									</axis:visible>
									

									<axis:visible f="axisctr222" c="IPRIRED">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${sessionScope.IVA}"/>
											</div>
										</td>
									</axis:visible>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
		
		<table class="mainModalDimensions base" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<div class="titulo">
						<img src="images/flecha.gif">Total Gastos
					</div>
					<div class="separador">&nbsp;</div>
					<!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
					<table class="seccion" cellpadding="0" cellspacing="0"
						align="center" id="miListaIdGarantiasGastos">
					<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
						<thead>
							<tr>

								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 3%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<th style="width: 3%; height: 0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRIRED">
									<th style="width: 5%; height: 0px"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="TASACAMB">
									<th style="width: 3%; height: 0px"></th>
								</axis:visible>
								<axis:visible f="axisctr222" c="IPRIRED">
									<th style="width: 5%; height: 0px"></th>
								</axis:visible>
							</tr>
							<tr>
								<axis:visible f="axisctr222" c="TASACAMB">
									<td class="sortable"><b>${title2}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICDERREG">
									<td class="sortable"><b>${title12}</b></td>
								</axis:visible>

								<axis:visible f="axisctr222" c="CMONCAP">
									<td class="sortable"><b>${title8}</b></td>
								</axis:visible>
								<axis:visible f="axisctr222" c="ICDERREG">
									<td class="sortable"><b>${title12}</b></td>
								</axis:visible>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.garantiasMoneda}"
								var="miListaIdGarantias" varStatus="x">
								<tr
									<c:if test="${x.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
									<c:if test="${x.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>>

									<axis:visible f="axisctr222" c="CTARMAN">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${miListaIdGarantias.TCAMBIO}" />
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.CMONCAPFIN}</div>
										</td>
									</axis:visible>

									<axis:visible f="axisctr222" c="ICDERREG">
										<td>
											<div class="dspNumber">
												<!-- Changed for IAXIS-4320 PK-19/06/2019 Start -->
												<%-- <fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${sessionScope.GASTOSPESOS}" /> --%>
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONPRODINT]}"
													value="${sessionScope.GASTOS}" />
												<!-- Changed for IAXIS-4320 PK-19/06/2019 End -->
											</div>
										</td>
									</axis:visible>
									<axis:visible f="axisctr222" c="CTARMAN">
										<td class="dspText">
											<div class="dspText">${miListaIdGarantias.CMONCAPFIN}</div>
										</td>
									</axis:visible>


									<axis:visible f="axisctr222" c="ICDERREG">
										<td>
											<div class="dspNumber">
												<fmt:formatNumber
													pattern="${__formatNumberPatterns[CMONCAPFIN]}"
													value="${sessionScope.GASTOS}" />
											</div>
										</td>
									</axis:visible>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
		<!-- Botonera -->
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisctr222</c:param>
			<c:param name="__botones">cancelar</c:param>
		</c:import>
	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>
