<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr028"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr207"/>
    </c:otherwise>
</c:choose>
<axis:visible f="axisctr207" c="PARTIDAS">
 	
	 <div class="titulo" style="color:black" >
		<div style="float:left;">
		  <b ><axis:alt f="axisctr207" c="PARTIDES" lit="9901925" /></b>
		</div>
	    <div style="float:right;">
		  <axis:visible f="axisctr207" c="CAPRECOMEND"> 
			<input type="button" class="boton" name="BT_CAPRECOMEND"  id="BT_CAPRECOMEND" value="<axis:alt f="axisctr207" c="CAPRECOMEND" lit="9903813"/>" onclick="javascript:f_capital_recomendado_json()" />
		</axis:visible>
	    </div>
    </div>
	<table class="area">
		<tr>
			<td>
                           
				<!-- DisplayTag Partidas -->
				<c:if test="${! empty sessionScope.axisctr_partidas  }">
					<c:set var="title0"><axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
					<c:set var="title1"><axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
					<c:set var="num_par">6</c:set>
					<c:if test="${!empty __formdata.num_partidas && __formdata.num_partidas > 0 }">
						<c:set var="num_par">${__formdata.num_partidas}</c:set><!--  -->
					</c:if>
				<c:set var="title0"><axis:alt f="axisctr207" c="DESCRIPCION_PARTIDAS" lit="100588"></axis:alt></c:set>
					<c:set var="title1"><axis:alt f="axisctr207" c="ICAPITAL_PARTIDAS" lit="1000073"></axis:alt></c:set>
					<c:set var="title2"><axis:alt f="axisctr207" c="IPRITOT_PARTIDAS" lit="1000497"/></c:set>
					<c:set var="title3"><axis:alt f="axisctr207" c="IPRITAR_PARTIDAS" lit="1000496"/></c:set>
					<c:set var="title4"><axis:alt f="axisctr207" c="CTARMAN_PARTIDAS" lit="9000958"/></c:set>
					<c:set var="title5"><axis:alt f="axisctr207" c="DETGARANT_PARTIDAS" lit="9901659"></axis:alt></c:set>
					<c:set var="title6"><axis:alt f="axisctr207" c="PREGGARANT_PARTIDAS" lit="9901660"></axis:alt></c:set>
					<c:set var="title7"><axis:alt f="axisctr207" c="FRANGARANT_PARTIDAS" lit="9901661"></axis:alt></c:set>
					<c:set var="title8"><axis:alt f="axisctr207" c="CMONCAP_PARTIDAS" lit="108645"/></c:set>
                <div id="DSP_PARTIDAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_par*20+20+20}"/>px">&nbsp;</div>
                <div id="dt_partidas" class="displayspacewomax" style="height:<c:out value="${num_par*20+20+20}"/>px">   
                    <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdPartidas">
                        <thead>
							<tr>
								<th style="width:7%;height:0px"></th>
								<%--axis:visible f="axisctr207" c="CTARMAN_PARTIDAS">
									<th style="width:5%;height:0px;"></th>
								</axis:visible--%>
                                <axis:visible f="axisctr207" c="DESCRIPCION_PARTIDAS">
									<th style="width:30%;height:0px"></th>
								</axis:visible>
								<axis:visible f="axisctr207" c="ICAPITAL_PARTIDAS">    
									<th style="width:15%;height:0px"></th>
								 </axis:visible>  
								  <axis:visible f="axisctr207" c="CAPRECOMEND_PARTIDAS"> 
									<th style="width:10%;height:0px"></th>
								  </axis:visible>
								<axis:visible f="axisctr207" c="CMONCAP_PARTIDAS">
									<th style="width:8%;height:0px;"></th>
								</axis:visible>
								 <%--axis:visible f="axisctr207" c="IPRITAR_PARTIDAS">
									<th style="width:10%;height:0px"></th>
								</axis:visible>
								<axis:visible f="axisctr207" c="IPRITOT_PARTIDAS">
									<th style="width:10%;height:0px"></th>
								</axis:visible--%>
								<axis:visible f="axisctr207" c="DETGARANT_PARTIDAS">
									<th style="width:5%;height:0px;"></th>
								</axis:visible>
								<axis:visible f="axisctr207" c="PREGGARANT_PARTIDAS">
									<th style="width:5%;height:0px;"></th>
								</axis:visible>
								<%--axis:visible f="axisctr207" c="FRANGARANT">
									<th style="width:5%;height:0px;"></th>
								</axis:visible--%>
                            </tr>
                            <tr>   
								<td class="sortable" align="center"></td>
								<%--axis:visible f="axisctr207" c="CTARMAN_PARTIDAS">
									<td class="sortable"><b>${title4}</b></td>
								</axis:visible--%>
                                              
								<axis:visible f="axisctr207" c="DESCRIPCION_PARTIDAS">
									<td class="sortable"><b>${title0}</b></td>
								</axis:visible>
                                            
								<axis:visible f="axisctr207" c="ICAPITAL_PARTIDAS">
									<td class="sortable"><b>${title1}</b></td>                                        
								</axis:visible>
								 <axis:visible f="axisctr207" c="CAPRECOMEND_PARTIDAS"> 
									  <td class="sortable"><b><axis:alt f="axisctr207" c="CAPRECOMEND_PARTIDAS" lit="9903813"/></b></td>     
								  </axis:visible>
								<axis:visible f="axisctr207" c="CMONCAP_PARTIDAS">
									<td class="sortable"><b>${title8}</b></td>                                        
								</axis:visible>
								<%--axis:visible f="axisctr207" c="IPRITAR_PARTIDAS">
									<td class="sortable"><b>${title3}</b></td>                                        
								</axis:visible>
								<axis:visible f="axisctr207" c="IPRITOT_PARTIDAS">
									<td class="sortable"><b>${title2}</b></td>                                        
								</axis:visible--%>
								<axis:visible f="axisctr207" c="DETGARANT_PARTIDAS">
									  <td class="sortable"><b>${title5}</b></td>                                        
								</axis:visible>
								<axis:visible f="axisctr207" c="PREGGARANT_PARTIDAS">
									 <td class="sortable"><b>${title6}</b></td>                                        
								</axis:visible>
								<%--axis:visible f="axisctr207" c="FRANGARANT_PARTIDAS">
									  <td class="sortable"><b>${title7}</b></td>                                        
								</axis:visible--%>
							</tr>   
						</thead>
						<tbody>
						<c:forEach items="${sessionScope.axisctr_partidas}" var="miListaIdPartidas" varStatus="x"> 
							<tr  tipo="ri" id="g_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}-${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}"
								<c:if test="${x.count mod 2 ==0}">                                                                      
									class="gridEven"                                                        
								</c:if>
								<c:if test="${x.count mod 2 !=0}">                                                                      
									class="gridNotEven"                                                        
								</c:if>
							>
								<td class="dspText" align="left">   
									<div align="left" >
										<c:choose>
											<c:when test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
												<img id="img_DSP_DATOS_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" src="images/mes.gif" onclick="toggleDisplay2('DSP_DATOS_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}', this)" style="cursor:pointer"/> 
												 <input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
												type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" 
													<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
													<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
																  __configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
													/>
											</c:when>
											<c:otherwise>
												<img src="images/blank.gif"/>
												<input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
												type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}"> checked='checked'</c:if> 
													<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPGAR == 2 ||__configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
													/>
											</c:otherwise>
										</c:choose>
									</div>   
								</td>
								<%--axis:visible f="axisctr207" c="CTARMAN_PARTIDAS">
								<td class="dspText">   
									<div class="dspIcons"><input onclick="javascript:f_actualiza_manual_json(this, '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
										type="checkbox" id="CTARMAN" name="CTARMAN" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN}" 
											<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN == '1'}">checked='checked'</c:if> />
									</div> 
								</td>
								</axis:visible--%>
								<axis:visible f="axisctr207" c="DESCRIPCION_PARTIDAS">
									<td class="dspText">   
										<div class="dspText">${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}</div>
									</td>
								</axis:visible>
								<axis:visible f="axisctr207" c="ICAPITAL_PARTIDAS">
									<td class="dspText">   
										<c:set var="CAPITAL">
											<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
												<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL}"/>
											</c:if>
										</c:set>
										<div class="dspIcons">
											<c:set var="CLASS">
												<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
												<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
											</c:set>
											<c:choose>
												<c:when test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
													<select id="ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" name="ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" onchange="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
													style="width:120px" class="${CLASS}" <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if>/>                                                                >
														<c:forEach items="${miListaIdPartidas.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">    <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
															   <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL==null}">
																   <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
															   </c:if>
															   <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL!=null}">
																	<c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
															   </c:if>>
															   ${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL} 
															</option>
														</c:forEach>
													</select>
												</c:when>
												<c:otherwise>
													<c:set var="VALORCERO">
													<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="0"/>
													</c:set>
													<c:set var="MONTOVALOR">
													   <c:if test="${ empty CAPITAL || fn:startsWith(CAPITAL, '0') }" var="Respuesta"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPRECOMEND}"/></c:if>
													   <c:if test="${ !Respuesta }" var="Respuesta2">${CAPITAL}</c:if>
													</c:set>
													<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
														<input onfocus="javascript:f_on_focus_capital(this);"
														<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '3' || miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '5' }">
															<c:if  test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '8'}">
																onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
															</c:if>
														</c:if>
														<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '3' ||miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '5'||miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '8'}">
															readonly
														</c:if>
														<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '0'}">
															disabled
														</c:if>                                                                
														type="text"
														id="ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}"
														name="ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}"
														value=<c:if test="${empty MONTOVALOR}">${VALORCERO}</c:if><c:if test="${!empty MONTOVALOR}">${MONTOVALOR}</c:if>
														style="width:90px"
														class="${CLASS}"
														formato="decimal"
														title="<axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr207" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}"/>
														
														<c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdPartidas.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">
															<a onclick ="f_abrir_axisctr163('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT }')">
																<img  src="images/lapiz.gif" title='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />'>
															</a>
														</c:if>
														<%--c:if test="${ Respuesta }">
															<script language="Javascript" type="text/javascript">
																f_on_focus_capital(document.getElementById("ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}"));
																f_selecciona_garantia(document.getElementById("ICAPITAL_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}").value, '0', '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');
															</script>
														</c:if--%>
													</c:if>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
								</axis:visible>
								<axis:visible f="axisctr207" c="CAPRECOMEND_PARTIDAS"> 
									<td class="dspText">  
										<div class="dspNumber">
										<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
										</div>
									</td>
								</axis:visible>
    							<axis:visible f="axisctr207" c="CMONCAP_PARTIDAS">
									<td class="dspText">   
										<div class="dspText" title="${miListaIdPartidas.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdPartidas.OB_IAX_GARANTIAS.TMONCAP}">
											  ${miListaIdPartidas.OB_IAX_GARANTIAS.CMONCAPINT}
										 </div>
									</td>
								</axis:visible>
								<%--axis:visible f="axisctr207" c="IPRITAR_PARTIDAS">
									<td class="dspText">  
										<div class="dspNumber">
											<c:choose>
											<c:when test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN && miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN == 1}">
											 <input     type="text" id="IPRITAR_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" onchange="f_actualiza_imports('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}', this.value, '<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITOT}"/>','1')" name="IPRITAR" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITAR}"/>" style="width:90px" class="${CLASS}"
														formato="decimal" />
											</c:when>
											<c:otherwise>
											<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITAR}"/>
											</c:otherwise>
											</c:choose>
										</div>
									</td>
								</axis:visible>
                                <axis:visible f="axisctr207" c="IPRITOT_PARTIDAS">
									<td class="dspText">  
										<div class="dspNumber">
										 <c:choose>
										<c:when test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN && miListaIdPartidas.OB_IAX_GARANTIAS.CTARMAN == 1}">
										 <input     type="text" id="IPRITOT"  name="IPRITOT" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITOT}"/>" style="width:90px" class="${CLASS}"
													formato="decimal" onchange="f_actualiza_imports('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}', '<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITAR}"/>', this.value)" />
										</c:when>
										<c:otherwise>
										<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.IPRITOT}"/>
										</c:otherwise>
										</c:choose>
										</div>
									</td>
								</axis:visible--%>
								<axis:visible f="axisctr207" c="DETGARANT_PARTIDAS">
									<td class="dspText">  
										<c:choose>
											<c:when test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">
												<div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}')">D</a></div>
											</c:when>
											<c:otherwise>
												<div class="dspIcons">D</div>
											</c:otherwise>
										</c:choose>
									</td>
								</axis:visible>
								<axis:visible f="axisctr207" c="PREGGARANT_PARTIDAS">
									<td class="dspText">  
										<c:choose>
											<c:when test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">
												<div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}')">P</a></div>
											</c:when>
											<c:otherwise>
												<div class="dspIcons">P</div>
											</c:otherwise>
										</c:choose>
									</td>
								</axis:visible>
								<%--axis:visible f="axisctr207" c="FRANGARANT">
									<td class="dspText">  
										<div class="dspIcons"><a href="#">F</a></div>
									</td>
								</axis:visible--%>
							</tr>
							<c:if test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
								<c:set scope="session" var="hijos" value="${miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
								<c:import url="axisctr207_hijos.jsp">
									<c:param name="thijos" value="${miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}" />
										<c:param name="ppartidas" value="1" />
									<c:param name="CGARANTPADRE" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" />
								</c:import>
							</c:if>
						</c:forEach>		
						</tbody>
                    </table>
				</div>
				</c:if> 
			</td>
		</tr>
	</table>
    <div class="separador">&nbsp;</div>
</axis:visible>
                   