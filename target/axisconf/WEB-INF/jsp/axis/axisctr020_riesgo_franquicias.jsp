<p>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
		uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%><%@ taglib
		uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%><%@ taglib
		uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib
		uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>
<c:choose>
	<c:when test="${empty param.f}">
		<c:set var="pantalla" value="axisctr020" />
	</c:when>
	<c:otherwise>
		<c:set var="pantalla" value="${param.f}" />
	</c:otherwise>
</c:choose>
<p>
	<%@ page import="java.util.ArrayList"%><%@ page
		import="java.util.HashMap"%>
	<%
		// Recuperamos parámetros de búsqueda si se ha efectuado alguna

		ArrayList garantias_salida = null;
		if (request.getSession().getAttribute("garantiasSortida") != null) {
			garantias_salida = (ArrayList) request.getSession().getAttribute("garantiasSortida");
		}

		ArrayList garantias_entrada = null;
		if (request.getSession().getAttribute("garantiasEntrada") != null) {
			garantias_entrada = (ArrayList) request.getSession().getAttribute("garantiasEntrada");
		}
	%>
</p>
<axis:visible c="DSP_TOT_FRANQUICIAS" f="${pantalla}">

	<c:if
		test="${!empty OB_IAX_RIESGOS.BONFRANSEG || !empty OB_IAX_RIESGOS.franqlibres || !empty  OB_IAX_RIESGOS.franqtecnicas || !empty  OB_IAX_RIESGOS.franqtecnicaslibres}">
		<tr>
			<td class="campocaja">
				<div style="float: left;">

					<img id="DSP_FRANQUICIAS_parent" src="images/mes.gif"
						onclick="objEstilos.toggleDisplay('DSP_FRANQUICIAS', this)"
						style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
							c="TIT_FRANQ" lit="9001800" /></b>
				</div>
				<div style="float: right;">
					<!-- Bug 0027955/0152240 - JSV (17/09/2013) => Añadimos parametro a  f_abrir_axisctr074 -->

					<!-- IAXIS-5423 CJMR 23/09/2019 <input type="button" class="boton" id="but_detfranq"
						value="<axis:alt f="${pantalla}" c="BT_DETFRANQ" lit="9904192"></axis:alt>"
						onclick="javascript:f_abrir_axisctr074(0)" /> -->

				</div>
				
				<axis:visible f="${pantalla}" c="LAPIZ1" >
                        <div style="float:right;" id="FRANQUICIAS" c="LAPIZ1"></div>
                        </axis:visible>
                   		<div class="seccion_suplementos" id="SECCION_FRANQUICIAS"></div>
				
				<div style="clear: both;">
					<hr class="titulo">
				</div>
			</td>
		</tr>
		<tr id="DSP_FRANQUICIAS_children" style="display: none">
			<td class="campocaja"><c:if
					test="${!empty OB_IAX_RIESGOS.BONFRANSEG || !empty OB_IAX_RIESGOS.franqlibres}">
					<axis:visible c="DSP_FRANQUICIAS" f="${pantalla}">
						<table class="area" align="center">
							<tr>
								<td class="campocaja"></td>
							</tr>
							<tr id="DSP_FRANQUICIAS_children">
								<td class="campocaja">
									<c:set var="title0">
										<axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt>
									</c:set> 
									<c:set var="title1">
										<axis:alt f="${pantalla}" c="IIMPORT" lit="101159"></axis:alt>
									</c:set> 
									<!-- INI IAXIS-4936 -->
									<c:set var="title6">
										<axis:alt f="${pantalla}" c="IMPORT_MIN" lit="9904858"></axis:alt>
									</c:set> 
									<c:set var="title7">
										<axis:alt f="${pantalla}" c="TIPO_IMPORT" lit="9002015"></axis:alt>
									</c:set>
									<!-- FIN IAXIS-4936 -->
									<c:if test="${!empty OB_IAX_RIESGOS.BONFRANSEG}">
										<div class="displayspace">
							                <!-- INI IAXIS-4936 -->
											<display:table name="${OB_IAX_RIESGOS.BONFRANSEG}"
												id="franquicias" style="width:100%" export="false"
												class="dsptgtable" pagesize="-1" defaultorder="ascending"
												sort="list" cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
											<!-- FIN IAXIS-4936 -->
												include file="../include/displaytag.jsp"%>
								  
                                                                 <axis:visible
													f="${pantalla}" c="TGRUP">
													<display:column title="${title0}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">





														<div class="dspText">${franquicias.OB_IAX_BONFRANSEG.TGRUP}</div>

													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="TNIVEL">
													<display:column title="${title1}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">


														<div class="dspText">

															${franquicias.OB_IAX_BONFRANSEG.TNIVEL}</div>
													</display:column>
												</axis:visible>
												<!--INI IAXIS-4936 -->
												<axis:visible f="axisctr009" c="TGRUP">
													<display:column title="${title6}" sortable="false"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">
														<div class="dspText">
															<fmt:formatNumber
																pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																value="${franquicias.OB_IAX_BONFRANSEG.IMPMIN}" />
														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr009" c="TNIVEL">
													<display:column title="${title7}" sortable="false"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">
														<div class="dspText">${franquicias.OB_IAX_BONFRANSEG.CTIPMIN}</div>
													</display:column>
												</axis:visible>
												<!-- FIN IAXIS-4936 -->
											</display:table>
									</c:if> <c:if test="${!empty OB_IAX_RIESGOS.franqlibres}">
										<div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver"
											style="visibility: hidden;">&nbsp;</div>


										<c:set var="title3">
											<axis:alt f="${pantalla}" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>

										<c:set var="title4">
											<axis:alt f="${pantalla}" c="VALORMIN" lit="9904477"></axis:alt>
										</c:set>


										<c:set var="title5">
											<axis:alt f="${pantalla}" c="VALORMAX" lit="9904478"></axis:alt>
										</c:set>

										<b><axis:alt f="${pantalla}" c="FRAQNQLIBRES"
												lit="9904502"></axis:alt></b>

										<div id="Dt_FRANQUICIAS" class="displayspace">
											<display:table name="${OB_IAX_RIESGOS.franqlibres}"
												id="franquiciaslibres" export="false" class="dsptgtable"
												pagesize="-1" defaultorder="ascending" sort="list"
												cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
												<%@ include file="../include/displaytag.jsp"%>
												<axis:visible f="${pantalla}" c="TGRUP">
													<display:column title="${title0}" sortable="false"
														style="width:15%"
														sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP"
														headerClass="sortable" media="html" autolink="false">



														<div class="dspText">${franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP}</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="CVALOR1">


													<display:column title="${title1}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspText">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP && franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP == 3}">
                                                                                    ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR1} -
																									
																																																												   
                                                                                   <fmt:formatNumber
																	pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																	value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1}" />
															</c:if>
														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="CVALOR2">


													<display:column title="${title3}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspText">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CVALOR2}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR2} -
																								 
																																																												   
                                                                                <fmt:formatNumber
																	pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																	value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2}" />
															</c:if>
														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="CIMPMIN">


													<display:column title="${title4}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspText">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMIN}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMIN} - <fmt:formatNumber
																	pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																	value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMIN}" />


															</c:if>
														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="CIMPMAX">


													<display:column title="${title5}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspText">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMAX}">
                                                                                 ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMAX} - <fmt:formatNumber
																	pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																	value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMAX}" />


															</c:if>
														</div>
													</display:column>
												</axis:visible>
											</display:table>
										</div>
									</c:if>



									</div></td>
							</tr>
						</table>
					</axis:visible>
				</c:if> <c:if
					test="${!empty OB_IAX_RIESGOS.franqtecnicas || !empty OB_IAX_RIESGOS.franqtecnicaslibres}">
					<axis:visible c="DSP_FRANQTECNICAS" f="${pantalla}">
						<table class="area" align="center">
							<div class="separador">&nbsp;</div>
							<tr>
								<td class="campocaja"><img id="DSP_FRANQTECNICAS_parent"
									src="images/mes.gif"
									onclick="objEstilos.toggleDisplay('DSP_FRANQTECNICAS', this)"
									style="cursor: pointer" /> <b><axis:alt
											c="LIT_FRANQTECNICAS" f="${pantalla}" lit="9904198" /></b>
									<hr class="titulo"></hr></td>
							</tr>
							<tr id="DSP_FRANQTECNICAS_children" style="display: none">
								<td class="campocaja">
									<div class="displayspace">

										<c:set var="title0">
											<axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt>
										</c:set>


										<c:set var="title1">
											<axis:alt f="${pantalla}" c="IIMPORT" lit="101159"></axis:alt>
										</c:set>

										<c:if test="${!empty OB_IAX_RIESGOS.franqtecnicas}">
											<display:table name="${OB_IAX_RIESGOS.franqtecnicas}"
												id="franquicias" style="width:60%" export="false"
												class="dsptgtable" pagesize="-1" defaultorder="ascending"
												sort="list" cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
												<%@ include file="../include/displaytag.jsp"%>
												<axis:visible f="${pantalla}" c="TGRUP">

													<display:column title="${title0}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">


														<div class="dspText">${franquicias.OB_IAX_BONFRANSEG.TGRUP}</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="TNIVEL">

													<display:column title="${title1}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">



														<div class="dspText">

															${franquicias.OB_IAX_BONFRANSEG.TNIVEL}</div>
													</display:column>
												</axis:visible>
											</display:table>
										</c:if>



										<c:if test="${!empty OB_IAX_RIESGOS.franqtecnicaslibres}">
											<div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver"
												style="visibility: hidden;">&nbsp;</div>


											<c:set var="title3">
												<axis:alt f="${pantalla}" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>

											<c:set var="title4">
												<axis:alt f="${pantalla}" c="VALORMIN" lit="9904477"></axis:alt>
											</c:set>


											<c:set var="title5">
												<axis:alt f="${pantalla}" c="VALORMAX" lit="9904478"></axis:alt>
											</c:set>

											<b><axis:alt f="${pantalla}" c="FRANQTECNICASLIBRES"
													lit="9904198"></axis:alt></b>

											<div id="Dt_FRANQUICIAS" class="displayspace">
												<display:table name="${OB_IAX_RIESGOS.franqtecnicaslibres}"
													id="franquiciaslibres" export="false" class="dsptgtable"
													pagesize="-1" defaultorder="ascending" sort="list"
													cellpadding="0" cellspacing="0"
													requestURI="axis_${pantalla}.do?paginar=true">
													<%@ include file="../include/displaytag.jsp"%>
													<axis:visible f="${pantalla}" c="TGRUP">
														<display:column title="${title0}" sortable="false"
															style="width:15%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP"
															headerClass="sortable" media="html" autolink="false">



															<div class="dspText">${franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP}</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CVALOR1">


														<display:column title="${title1}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP && franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP == 3}">
                                                                                    ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR1} -
																									
																																																																										  
                                                                                   <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1}" />
																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CVALOR2">


														<display:column title="${title3}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CVALOR2}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR2} -
																								 
																																																																										  
                                                                                <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2}" />
																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CIMPMIN">


														<display:column title="${title4}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMIN}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMIN} - <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMIN}" />


																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CIMPMAX">


														<display:column title="${title5}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMAX}">
                                                                                 ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMAX} - <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMAX}" />


																</c:if>
															</div>
														</display:column>
													</axis:visible>
												</display:table>
											</div>
										</c:if>

									</div>
								</td>
							</tr>
						</table>
					</axis:visible>
				</c:if></td>
		</tr>
	</c:if>




	<c:if
		test="${!empty  OB_IAX_RIESGOS.bonusmalus || !empty  OB_IAX_RIESGOS.bonusmaluslibres}">
		<tr>
			<td class="campocaja">
				<div style="float: left;">

					<img id="DSP_BONUSMALUS_parent" src="images/mes.gif"
						onclick="objEstilos.toggleDisplay('DSP_BONUSMALUS', this)"
						style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
							c="TIT_FRANQ" lit="9001799" /></b>
				</div>
				<div style="float: right;">
					<!-- Bug 0027955/0152240 - JSV (17/09/2013) => Añadimos parametro a  f_abrir_axisctr074 -->

					<input type="button" class="boton" id="BT_DETBONUS"
						value="<axis:alt f="${pantalla}" c="BT_DETBONUS" lit="1000113"></axis:alt>"
						onclick="javascript:f_abrir_axisctr074(1)" />

				</div>
				<div style="clear: both;">
					<hr class="titulo">
				</div>
			</td>
		</tr>
		<tr id="DSP_BONUSMALUS_children" style="display: none">
			<td class="campocaja"><c:if
					test="${! empty OB_IAX_RIESGOS.bonusmalus ||! empty OB_IAX_RIESGOS.bonusmaluslibres}">
					<axis:visible c="DSP_BONUSMALUS" f="${pantalla}">
						<table class="area" align="center">
							<div class="separador">&nbsp;</div>
							<tr>
								<td class="campocaja">
									<div class="displayspace">

										<c:set var="title0">
											<axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt>
										</c:set>


										<c:set var="title1">
											<axis:alt f="${pantalla}" c="IIMPORT" lit="101159"></axis:alt>
										</c:set>

										<c:if test="${! empty OB_IAX_RIESGOS.bonusmalus }">
											<display:table name="${OB_IAX_RIESGOS.bonusmalus}"
												id="franquicias" style="width:60%" export="false"
												class="dsptgtable" pagesize="-1" defaultorder="ascending"
												sort="list" cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
												<%@ include file="../include/displaytag.jsp"%>
												<axis:visible f="${pantalla}" c="TGRUP">

													<display:column title="${title0}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">


														<div class="dspText">${franquicias.OB_IAX_BONFRANSEG.TGRUP}</div>
													</display:column>
												</axis:visible>
												<axis:visible f="${pantalla}" c="TNIVEL">

													<display:column title="${title1}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">



														<div class="dspText">

															${franquicias.OB_IAX_BONFRANSEG.TNIVEL}</div>
													</display:column>
												</axis:visible>
											</display:table>
										</c:if>


										<c:if test="${!empty OB_IAX_RIESGOS.bonusmaluslibres}">
											<div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver"
												style="visibility: hidden;">&nbsp;</div>


											<c:set var="title3">
												<axis:alt f="${pantalla}" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>

											<c:set var="title4">
												<axis:alt f="${pantalla}" c="VALORMIN" lit="9904477"></axis:alt>
											</c:set>


											<c:set var="title5">
												<axis:alt f="${pantalla}" c="VALORMAX" lit="9904478"></axis:alt>
											</c:set>

											<b><axis:alt f="${pantalla}" c="BONUMASNULIBRES"
													lit="9904503"></axis:alt></b>

											<div id="Dt_FRANQUICIAS" class="displayspace">
												<display:table name="${OB_IAX_RIESGOS.bonusmaluslibres}"
													id="franquiciaslibres" export="false" class="dsptgtable"
													pagesize="-1" defaultorder="ascending" sort="list"
													cellpadding="0" cellspacing="0"
													requestURI="axis_${pantalla}.do?paginar=true">
													<%@ include file="../include/displaytag.jsp"%>
													<axis:visible f="${pantalla}" c="TGRUP">
														<display:column title="${title0}" sortable="false"
															style="width:15%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP"
															headerClass="sortable" media="html" autolink="false">



															<div class="dspText">${franquiciaslibres.OB_IAX_BONFRANSEG.TGRUP}</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CVALOR1">


														<display:column title="${title1}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP && franquiciaslibres.OB_IAX_BONFRANSEG.CTIPGRUPSUBGRUP == 3}">
                                                                                    ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR1} -
																									
																																																																										  
                                                                                   <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR1}" />
																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CVALOR2">


														<display:column title="${title3}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CVALOR2}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TVALOR2} -
																								 
																																																																										  
                                                                                <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPVALOR2}" />
																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CIMPMIN">


														<display:column title="${title4}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMIN}">
                                                                                        ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMIN} - <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMIN}" />


																</c:if>
															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="${pantalla}" c="CIMPMAX">


														<display:column title="${title5}" sortable="false"
															style="width:22%"
															sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:if
																	test="${!empty franquiciaslibres.OB_IAX_BONFRANSEG.CIMPMAX}">
                                                                                 ${franquiciaslibres.OB_IAX_BONFRANSEG.TIMPMAX} - <fmt:formatNumber
																		pattern="${__formatNumberPatterns[__defaultCMONINT]}"
																		value="${franquiciaslibres.OB_IAX_BONFRANSEG.IMPMAX}" />


																</c:if>
															</div>
														</display:column>
													</axis:visible>
												</display:table>
											</div>
										</c:if>


									</div>
								</td>
							</tr>
						</table>
					</axis:visible>
				</c:if></td>
		</tr>
	</c:if>
</axis:visible>