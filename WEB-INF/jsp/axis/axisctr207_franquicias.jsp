
<%
	/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<c:choose>
	<c:when test="${param.multiPantalla == 'true'}">
		<c:set var="pantalla" value="axisctr028" />
	</c:when>
	<c:otherwise>
		<c:set var="pantalla" value="axisctr207" />
	</c:otherwise>
</c:choose>
<div class="separador">&nbsp;</div>
<div class="separador">&nbsp;</div>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>
<c:if test="${__formdata.PFRANQUICIAS > 0}">
	<div id="franquiciasG_hidden"
		<c:if test="${empty __formdata.franq && empty __formdata.franqlibres && empty __formdata.franqtecnicas && empty __formdata.franqfranqtecnicaslibres}">style="visibility:false;display:none"  </c:if>>
		<div class="titulo">
			<div style="float: left;">
				<img src="images/flecha.gif" />
				<axis:alt f="axisctr207" c="TIT_FRANQ" lit="9001800" />
			</div>
			<div style="float: right;">
				<axis:visible f="axisctr207" c="BT_DETFRANQ">
					<input type="button" class="boton" id="but_detfranq"
						value="<axis:alt f="axisctr207" c="BT_DETFRANQ" lit="9904192"></axis:alt>"
						onclick="javascript:f_abrir_axisctr074()" />
				</axis:visible>
			</div>
		</div>
		<%
			int contador = 0;
		%>
		<!--campos-->
		<axis:visible f="axisctr207" c="DSP_FRANQUICIAS">
			<div id="franquicias_hidden"
				<c:if test="${empty __formdata.franq && empty __formdata.franqlibres}">style="visibility:false;display:none"  </c:if>>
				<div class="separador">&nbsp;</div>
				<table class="area">
					<tr>
						<td><c:set var="title0">
								<axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt>
							</c:set> <c:set var="title1">
								<axis:alt f="axisctr207" c="IIMPORT" lit="101159"></axis:alt>
							</c:set>
							<!-- INI IAXIS-4936 --> 
							<c:set var="title6">
								<axis:alt f="${pantalla}" c="IMPORT_MIN" lit="9904858"></axis:alt>
							</c:set> <c:set var="title7">
								<axis:alt f="${pantalla}" c="TIPO_IMPORT" lit="9002015"></axis:alt>
							</c:set> 
							<!-- FIN IAXIS-4936 -->

							<table>
								<tr>
									<th style="width: 60%; height: 0px"></th>
									<th style="width: 40%; height: 0px"></th>

								</tr>
								<tr>
									<td colspan="2">
										<div id="franquicias_area_hidden"
											<c:if test="${empty __formdata.franq}">style="visibility:false;display:none"  </c:if>>
											<div id="DSP_FRANQUICIAS" class="displayspaceOver"
												style="visibility: hidden;">&nbsp;</div>
											<div id="Dt_FRANQUICIAS" class="displayspace">
												<display:table name="${__formdata.franq}" id="franquicias"
													export="false" class="dsptgtable" pagesize="-1"
													defaultorder="ascending" sort="list" cellpadding="0"
													cellspacing="0"
													requestURI="axis_${pantalla}.do?paginar=true">
													<%@ include file="../include/displaytag.jsp"%>
													<axis:visible f="axisctr207" c="TGRUP">
														<display:column title="${title0}" sortable="false"
															sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="headwidth10 sortable" media="html"
															autolink="false">
															<div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisctr207" c="TNIVEL">
														<display:column title="${title1}" sortable="false"
															sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="headwidth10 sortable" media="html"
															autolink="false">

															<div class="dspIcons">

																<c:choose>
																	<c:when
																		test="${!empty franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 1}">
																		<!-- SPV IAXIS-4201 -->
																		<select
																			onblur="f_actualizar_franq(1,this.value,'${franquicias.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquicias.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','','','','','','','');"
																			<axis:atr f="axisctr207" c="TNIVEL" a="modificable=true&isInputText=false"/>
																			name="TNIVEL" id="TNIVEL" size="1"
																			style="width: 100%" class="campo campotexto"
																			title="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquicias.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																			<option value="<%=Integer.MIN_VALUE%>">-
																				<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																				-
																			</option>
																			<c:forEach
																				items="${franquicias.OB_IAX_BF_PROACTGRUP.LNIVELES}"
																				var="respuesta">
																				<option
																					value="${respuesta.OB_IAX_BF_DETNIVEL.CNIVEL}"
																					<c:if test="${respuesta.OB_IAX_BF_DETNIVEL.CDEFECTO eq 'S'}"> selected </c:if>>
																					${respuesta.OB_IAX_BF_DETNIVEL.TNIVEL}</option>
																			</c:forEach>
																		</select>
																		<!-- SPV IAXIS-4201 -->
																	</c:when>
																	<c:otherwise>
																		<input type="text"
																			class="campowidthinput campo campotexto"
																			id="IMPVALOR_${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			name="IMPVALOR_${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			onblur="f_actualizar_franq('${franquicias.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquicias.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquicias.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value);"
																			title="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquicias.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																			<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																			style="width: 60%"
																			value="<fmt:formatNumber pattern="###,##0.00" value="${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
																			title="<axis:alt f="axisctr207" c="IMPVALOR" lit="1000382" />"
																			size="15"
																			onfocus="javascript:f_on_focus_impvalor(this)" />

																	</c:otherwise>
																</c:choose>

															</div>
														</display:column>
														</axis:visible>
														<axis:visible f="axisctr207" c="BT_SIN_EDITAR_FRANQ">
															<!--boton editar persona asociada -->
															<!-- INI IAXIS-4936 -->
															<display:column title="${title17}"
																headerClass="headwidth5 sortable" media="html"
																autolink="false">
															
																<c:if
																	test="${(!empty franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP)}">
																	<div class="dspIcons" id="BT_SIN_EDITAR_FRANQ">
																		<img border="0"
																			alt="<axis:alt f="axisctr207" c="BT_SIN_EDITAR_FRANQ" lit="100002"/>"
																			title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_FRANQ" lit="100002"/>"
																			src="images/lapiz.gif" width="15px" height="15px"
																			style="cursor: pointer;"
																			onclick="javascript:objUtiles.abrirModal('axisctr508','src', 'modal_axisctr508.do?operation=init'+'&CVERSION='+'${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}'+'&CSUBGRUP='+'${franquicias.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}'+'&CGRUP='+'${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}'+'&CNIVEL='+objDom.getValorPorId('TNIVEL'));" />
																	</div>
																</c:if>
															</display:column>
														</axis:visible>
														<!-- CJMR -->
													<axis:visible f="axisctr207" c="IMPMIN">	
	                                                <display:column title="${title6}" headerClass="headwidth5 sortable" media="html" autolink="false" >
													<!-- FIN IAXIS-4936 -->
	                                                 <!-- SPV IAXIS-4201 -->       
	                                                 <input onblur="f_actualizar_franq(1,'','${franquicias.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquicias.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','','','','','','',this.value);" 
	                                                 type="text" class="campowidthinput campo campotexto" style="width:100%"   id="IMPMIN" name="IMPMIN" size="5"   
						                                     <axis:atr f="axisctr207" c="IMPMIN" a="obligatorio=true&isInputText=false"/>  
						                                     value="${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}" 
						                                     title="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - <axis:alt c="IMPMIN" f="axisctr207" lit="9904477" />" 
						                                     alt="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - <axis:alt c="IMPMIN" f="axisctr207" lit="9904477" />" />
						                             </display:column>
						                             </axis:visible>
						                             
						                            <axis:visible f="axisctr207" c="CIMPMIN">
						                            <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" > 
						                                  <!-- SPV IAXIS-4201 -->   
						                                  <select onblur="f_actualizar_franq(1,'','${franquicias.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquicias.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','','','',this.value,'','','');" 
						                                  name = "CIMPMIN" id="CIMPMIN" style="width:100%" size="1"  
						                                  class="campowidthselect campo campotexto" <axis:atr f="axisctr207" c="CIMPMIN" a="obligatorio=true&isInputText=false"/> 						                                     
															alt="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - <axis:alt c="CIMPMIN" f="axisctr207" lit="9904477" />" 						                                  
															title="${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - <axis:alt c="CIMPMIN" f="axisctr207" lit="9904477" />" > 						                                        
						                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axisctr207" lit="1000348"/> - </option>
						                                                <c:forEach var="unidades" items="${__formdata.listaTipoUnidad}">
						                                                    <option value = "${unidades.CATRIBU}"
						                                               <c:if test="${unidades.CATRIBU == franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}"> selected </c:if>  >
						                                                        ${unidades.TATRIBU}
						                                                    </option>
						                                                </c:forEach>
						                                    </select>
							                                 <!-- SPV IAXIS-4201 -->  
	                                                </display:column> 
	                                                <!-- CJMR -->


													</axis:visible>

												</display:table>
											</div>
										</div>
										<div id="franquiciaslibres_area_hidden"
											<c:if test="${empty __formdata.franqlibres}">style="visibility:false;display:none"  </c:if>>

											<div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver"
												style="visibility: hidden;">&nbsp;</div>
											<c:set var="title3">
												<axis:alt f="axisctr207" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>
											<c:set var="title4">
												<axis:alt f="axisctr207" c="VALORMIN" lit="9904477"></axis:alt>
											</c:set>
											<c:set var="title5">
												<axis:alt f="axisctr207" c="VALORMAX" lit="9904478"></axis:alt>
											</c:set>
											<b><axis:alt f="axisctr207" c="FRAQNQLIBRES"
													lit="9904502"></axis:alt></b>

											<display:table name="${__formdata.franqlibres}"
												id="franquiciaslibres" export="false" class="dsptgtable"
												pagesize="-1" defaultorder="ascending" sort="list"
												cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
												<%@ include file="../include/displaytag.jsp"%>
												<axis:visible f="axisctr207" c="TGRUP">
													<display:column title="${title0}" sortable="false"
														style="width:15%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">
														<div class="dspText">${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr207" c="CVALOR1">
													<display:column title="${title1}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspText">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
																<select
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','',this.value,'','','','','','');"
																	<axis:atr f="axisctr207" c="CVALOR1" a="modificable=true&isInputText=false"/>
																	name="CVALOR1_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	id="CVALOR1_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	size="1" style="width: 60%" class="campo campotexto"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																	<option value="<%=Integer.MIN_VALUE%>">-
																		<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																		-
																	</option>
																	<c:forEach
																		items="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR1}"
																		var="respuesta">
																		<option
																			value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																			<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																			${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																	</c:forEach>
																</select>

																<input type="text"
																	class="campowidthinput campo campotexto"
																	id="IMPVALOR1_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	name="IMPVALOR_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																	<axis:atr f="axisctr207" c="IMPVALOR1" a="modificable=true"/>
																	style="width: 30%"
																	value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
																	size="15"
																	onfocus="javascript:f_on_focus_impvalor(this)" />

															</c:if>

														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr207" c="CVALOR2">
													<display:column title="${title3}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspIcons">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
																<select
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																	<axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/>
																	name="CVALOR2_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	id="CVALOR2_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	size="1" style="width: 60%" class="campo campotexto"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title3}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																	<option value="<%=Integer.MIN_VALUE%>">-
																		<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																		-
																	</option>
																	<c:forEach
																		items="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}"
																		var="respuesta">
																		<option
																			value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																			<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																			${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																	</c:forEach>
																</select>

																<input type="text"
																	class="campowidthinput campo campotexto"
																	id="IMPVALOR2_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	name="IMPVALOR2_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title3}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																	<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																	style="width: 30%"
																	value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>"
																	size="15"
																	onfocus="javascript:f_on_focus_impvalor(this)" />




															</c:if>


														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr207" c="CIMPMIN">
													<display:column title="${title4}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspIcons">

															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
																<select
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																	<axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/>
																	name="CIMPMIN_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	id="CIMPMIN_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	size="1" style="width: 60%" class="campo campotexto"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title4}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																	<option value="<%=Integer.MIN_VALUE%>">-
																		<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																		-
																	</option>
																	<c:forEach
																		items="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}"
																		var="respuesta">
																		<option
																			value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																			<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																			${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																	</c:forEach>
																</select>

																<input type="text"
																	class="campowidthinput campo campotexto"
																	id="IMPMIN_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	name="IMPMIN_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title4}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																	<axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>
																	style="width: 30%"
																	value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>"
																	size="15"
																	onfocus="javascript:f_on_focus_impvalor(this)" />


															</c:if>

														</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr207" c="CIMPMAX">
													<display:column title="${title5}" sortable="false"
														style="width:22%"
														sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="sortable" media="html" autolink="false">

														<div class="dspIcons">


															<c:if
																test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
																<select
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}',this.value,'${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','');"
																	<axis:atr f="axisctr207" c="CIMPMAX" a="modificable=true&isInputText=false"/>
																	name="CIMPMAX_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	id="CIMPMAX_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	size="1" style="width: 60%" class="campo campotexto"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title5}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																	<option value="<%=Integer.MIN_VALUE%>">-
																		<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																		-
																	</option>
																	<c:forEach
																		items="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}"
																		var="respuesta">
																		<option
																			value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																			<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																			${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																	</c:forEach>
																</select>

																<input type="text"
																	class="campowidthinput campo campotexto"
																	id="IMPMAX_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	name="IMPMAX_${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																	onchange="f_actualizar_franq('${franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}',this.value);"
																	title="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title5}"
																	<c:if test="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																	<axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>
																	style="width: 30%"
																	value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>"
																	size="15"
																	onfocus="javascript:f_on_focus_impvalor(this)" />


															</c:if>

														</div>
													</display:column>

												</axis:visible>

											</display:table>

										</div>
									</td>
									<td class="campocaja" align="center"></td>
								</tr>
							</table>

							</div></td>
					</tr>
				</table>
		</axis:visible>
	</div>

	<!--campos-->
	<axis:visible f="axisctr207" c="DSP_FRANQTECNICAS">

		<div id="franquiciastecnicas_hidden"
			<c:if test="${empty __formdata.franqtecnicas && empty __formdata.franqtecnicaslibres}">style="visibility:false;display:none"  </c:if>>

			<div class="separador">&nbsp;</div>

			<table class="area">
				<tr>
					<td><b><axis:alt c="LIT_FRANQTECNICAS" f="axisctr207"
								lit="9904198" /></b></td>
				</tr>
				<tr>
					<td>
						<!-- DisplayTag preguntas --> <c:set var="title0">
							<axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt>
						</c:set> <c:set var="title1">
							<axis:alt f="axisctr207" c="IIMPORT" lit="101159"></axis:alt>
						</c:set>
						<div id="DSP_FRANQTECNICAS" class="displayspaceOver"
							style="visibility: hidden;">&nbsp;</div>
						<div id="Dt_FRANQTECNICAS" class="displayspace">
							<table>
								<tr>
									<th style="width: 60%; height: 0px"></th>
									<th style="width: 40%; height: 0px"></th>
								</tr>
								<tr>
									<td>
										<%--c:if test="${!empty __formdata.franqtecnicas}"--%>
										<div id="franquiciastecnicas_area_hidden"
											<c:if test="${empty __formdata.franqtecnicas}">style="visibility:false;display:none"  </c:if>>
											<display:table name="${__formdata.franqtecnicas}"
												id="franquiciastecnicas" export="false" class="dsptgtable"
												pagesize="-1" defaultorder="ascending" sort="list"
												cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true">
												<%@ include file="../include/displaytag.jsp"%>
												<axis:visible f="axisctr207" c="TGRUP">
													<display:column title="${title0}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">
														<div class="dspText">${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
													</display:column>
												</axis:visible>
												<axis:visible f="axisctr207" c="TNIVEL">
													<display:column title="${title1}" sortable="false"
														sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
														headerClass="headwidth10 sortable" media="html"
														autolink="false">

														<div class="dspIcons">
															<c:choose>
																<c:when
																	test="${!empty franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 1}">
																	<select
																		onchange="f_actualizar_franq(this.value,'${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}');"
																		<axis:atr f="axisctr207" c="TNIVEL" a="modificable=true&isInputText=false"/>
																		name="TNIVELQUEST" id="TNIVELQUEST" size="1"
																		style="width: 100%" class="campo campotexto"
																		title="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>>
																		<option value="null">-
																			<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																			-
																		</option>
																		<c:forEach
																			items="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.LNIVELES}"
																			var="respuesta">
																			<option
																				value="${respuesta.OB_IAX_BF_DETNIVEL.CNIVEL}"
																				<c:if test="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL == respuesta.OB_IAX_BF_DETNIVEL.CNIVEL }"> selected </c:if>>
																				${respuesta.OB_IAX_BF_DETNIVEL.TNIVEL}</option>
																		</c:forEach>
																	</select>
																</c:when>
																<c:otherwise>
																	<input type="text"
																		class="campowidthinput campo campotexto"
																		id="IMPVALOR_${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		name="IMPVALOR_${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		onchange="f_actualizar_franq('${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value);"
																		title="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																		<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																		style="width: 60%"
																		value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicas.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
																		title="<axis:alt f="axisctr207" c="PREVALI" lit="1000382" />"
																		size="15"
																		onfocus="javascript:f_on_focus_impvalor(this)" />

																</c:otherwise>
															</c:choose>
														</div>
													</display:column>
												</axis:visible>
											</display:table>
										</div>
										<div id="franquiciastecnicaslibres_area_hidden"
											<c:if test="${empty __formdata.franqtecnicaslibres}">style="visibility:false;display:none"  </c:if>>

											<div id="DSP_FRANQUICIASTECNICASLIBRES"
												class="displayspaceOver" style="visibility: hidden;">&nbsp;</div>
											<c:set var="title3">
												<axis:alt f="axisctr207" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
											<c:set var="title4">
												<axis:alt f="axisctr207" c="VALORMIN" lit="9904477"></axis:alt>
											</c:set>
											<c:set var="title5">
												<axis:alt f="axisctr207" c="VALORMAX" lit="9904478"></axis:alt>
											</c:set>
											<b> <axis:alt f="axisctr207" c="FRAQNQTECNICASLIBRES"
													lit="9904501"></axis:alt></b>

											<div id="Dt_FRANQUICIAS" class="displayspace">
												<display:table name="${__formdata.franqtecnicaslibres}"
													id="franquiciastecnicaslibres" export="false"
													class="dsptgtable" pagesize="-1" defaultorder="ascending"
													sort="list" cellpadding="0" cellspacing="0"
													requestURI="axis_${pantalla}.do?paginar=true">
													<%@ include file="../include/displaytag.jsp"%>
													<axis:visible f="axisctr207" c="TGRUP">
														<display:column title="${title0}" sortable="false"
															style="width:15%"
															sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">
															<div class="dspText">${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisctr207" c="CVALOR1">
														<display:column title="${title1}" sortable="false"
															style="width:22%"
															sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspText">

																<c:choose>
																	<c:when
																		test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 1}">

																		<select
																			onchange="f_actualizar_franq(this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}');"
																			<axis:atr f="axisctr207" c="TNIVEL" a="modificable=true&isInputText=false"/>
																			name="TNIVEL" id="TNIVEL" size="1"
																			style="width: 100%" class="campo campotexto"
																			title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																			<option value="<%=Integer.MIN_VALUE%>">-
																				<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																				-
																			</option>
																			<c:forEach
																				items="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES}"
																				var="respuesta">
																				<option
																					value="${respuesta.OB_IAX_BF_DETNIVEL.CNIVEL}"
																					<c:if test="${ franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL == respuesta.OB_IAX_BF_DETNIVEL.CNIVEL }"> selected </c:if>>
																					${respuesta.OB_IAX_BF_DETNIVEL.TNIVEL}</option>
																			</c:forEach>
																		</select>
																	</c:when>
																	<c:when
																		test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 2}">
																		<input type="text"
																			class="campowidthinput campo campotexto"
																			id="IMPVALOR_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			name="IMPVALOR_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value);"
																			title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																			<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																			style="width: 60%"
																			value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
																			title="<axis:alt f="axisctr207" c="IMPVALOR" lit="1000382" />"
																			size="15"
																			onfocus="javascript:f_on_focus_impvalor(this)" />

																	</c:when>
																	<c:when
																		test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
																		<select
																			onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','',this.value,'','','','','','');"
																			<axis:atr f="axisctr207" c="CVALOR1" a="modificable=true&isInputText=false"/>
																			name="CVALOR1_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			id="CVALOR1_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			size="1" style="width: 60%" class="campo campotexto"
																			title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																			<option value="<%=Integer.MIN_VALUE%>">-
																				<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																				-
																			</option>
																			<c:forEach
																				items="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR1}"
																				var="respuesta">
																				<option
																					value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																					<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																					${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																			</c:forEach>
																		</select>

																		<input type="text"
																			class="campowidthinput campo campotexto"
																			id="IMPVALOR_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			name="IMPVALOR_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																			onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																			title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																			<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																			<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																			style="width: 30%"
																			value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
																			title="<axis:alt f="axisctr207" c="IMPVALOR" lit="1000382" />"
																			size="15"
																			onfocus="javascript:f_on_focus_impvalor(this)" />


																	</c:when>
																</c:choose>

															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisctr207" c="CVALOR2">
														<display:column title="${title3}" sortable="false"
															style="width:22%"
															sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspIcons">

																<c:if
																	test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
																	<select
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																		<axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/>
																		name="CVALOR2_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		id="CVALOR2_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		size="1" style="width: 60%" class="campo campotexto"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																		<option value="<%=Integer.MIN_VALUE%>">-
																			<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																			-
																		</option>
																		<c:forEach
																			items="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}"
																			var="respuesta">
																			<option
																				value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																				<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																				${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																		</c:forEach>
																	</select>

																	<input type="text"
																		class="campowidthinput campo campotexto"
																		id="IMPVALOR2_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		name="IMPVALOR2_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																		<axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>
																		style="width: 30%"
																		value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>"
																		title="<axis:alt f="axisctr207" c="IMPVALOR2" lit="1000382" />"
																		size="15"
																		onfocus="javascript:f_on_focus_impvalor(this)" />




																</c:if>


															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisctr207" c="CIMPMIN">
														<display:column title="${title4}" sortable="false"
															style="width:22%"
															sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspIcons">

																<c:if
																	test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
																	<select
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																		<axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/>
																		name="CIMPMIN_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		id="CIMPMIN_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		size="1" style="width: 60%" class="campo campotexto"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																		<option value="<%=Integer.MIN_VALUE%>">-
																			<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																			-
																		</option>
																		<c:forEach
																			items="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}"
																			var="respuesta">
																			<option
																				value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																				<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																				${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																		</c:forEach>
																	</select>

																	<input type="text"
																		class="campowidthinput campo campotexto"
																		id="IMPMIN_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		name="IMPMIN_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																		<axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>
																		style="width: 30%"
																		value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>"
																		title="<axis:alt f="axisctr207" c="IMPMIN" lit="1000382" />"
																		size="15"
																		onfocus="javascript:f_on_focus_impvalor(this)" />


																</c:if>

															</div>
														</display:column>
													</axis:visible>
													<axis:visible f="axisctr207" c="CIMPMAX">
														<display:column title="${title5}" sortable="false"
															style="width:22%"
															sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP"
															headerClass="sortable" media="html" autolink="false">

															<div class="dspIcons">


																<c:if
																	test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
																	<select
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}',this.value,'${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','');"
																		<axis:atr f="axisctr207" c="CIMPMAX" a="modificable=true&isInputText=false"/>
																		name="CIMPMAX_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		id="CIMPMAX_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		size="1" style="width: 60%" class="campo campotexto"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if>>
																		<option value="<%=Integer.MIN_VALUE%>">-
																			<axis:alt f="axisctr207" c="COMBO_SNV" lit="108341" />
																			-
																		</option>
																		<c:forEach
																			items="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}"
																			var="respuesta">
																			<option
																				value="${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}"
																				<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if>>
																				${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU}</option>
																		</c:forEach>
																	</select>

																	<input type="text"
																		class="campowidthinput campo campotexto"
																		id="IMPMAX_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		name="IMPMAX_${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"
																		onchange="f_actualizar_franq('${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}',this.value);"
																		title="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}"
																		<c:if test="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
																		<axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>
																		style="width: 30%"
																		value="<fmt:formatNumber pattern="###,##0.00" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>"
																		title="<axis:alt f="axisctr207" c="IMPMAX" lit="1000382" />"
																		size="15"
																		onfocus="javascript:f_on_focus_impvalor(this)" />


																</c:if>

															</div>
														</display:column>

													</axis:visible>

												</display:table>
											</div>
										</div>
									</td>
									<td class="campocaja" align="center">
										<%--input type="button" class="boton" id="but_detfranq" value="<axis:alt f="axisctr207" c="BT_DETFRANQ" lit="9904192"></axis:alt>" onclick="javascript:f_abrir_axisctr074(1)" /--%>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</axis:visible>
	<!--campos-->
</c:if>
</div>
<c:if test="${ __formdata.PBONUSMALUS >0 }">
	<c:import url="axisctr207_bonusmalus.jsp" />
</c:if>
