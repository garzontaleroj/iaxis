<%/* Revision:# 47dUgfKXLjq1PBcepbh5Ww== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<c:choose>
	<c:when test="${empty param.f}">
		<c:set var="pantalla" value="axisctr020" />
	</c:when>
	<c:otherwise>
		<c:set var="pantalla" value="${param.f}" />
	</c:otherwise>
</c:choose>
<tr>
	<td class="titulo"><img src="images/flecha.gif" /> <c:if
			test="${!empty datos_poliza.TPRODUC}">&nbsp;${datos_poliza.TPRODUC}</c:if>
		<c:if test="${!empty datos_poliza.NPOLIZA}">&nbsp;-&nbsp;${datos_poliza.NPOLIZA}</c:if>
		<axis:visible f="${pantalla}" c="NCERTIF">
			<c:if test="${!empty datos_poliza.NCERTIF}">-${datos_poliza.NCERTIF}</c:if>
		</axis:visible> <c:if
			test="${!empty datos_poliza.CRETENI && datos_poliza.CRETENI != 0 && !empty tmotret}">&nbsp;-&nbsp;<axis:alt
				f="axisctr020" c="TMOTRETEN" lit="152427" />&nbsp;${tmotret}&nbsp;&nbsp;</c:if>
		<c:if test="${ADMITECERTIFICADOS == '1'}">- <axis:alt
				f="axisctr020" c="CCOLECT" lit="9001021" />: ${NAMETOMADORCERO}</c:if> <axis:visible
			f="${pantalla}" c="BT_BUSCAR_POLIZA">
			<img id="find" border="0" src="images/find.gif"
				onclick="f_abrir_axisctr019()" style="cursor: pointer" />
		</axis:visible></td>
	<td><axis:visible f="${pantalla}" c="MODIFICAR">
			<img border="0"
				alt="<axis:alt f="${pantalla}" c="MODIFICAR" lit="9000552"/>"
				title1="<axis:alt f="${pantalla}" c="MODIFICAR" lit="9000552"/>"
				src="images/lapiz.gif" style="cursor: pointer;"
				onclick="f_comisions()" />
		</axis:visible></td>
</tr>
<tr>
	<td>
		<!--campos-->
		<table class="seccion">
			<tr>
				<td align="left">
					<table class="area" align="center">
						<tr>
							<th style="height: 0px"></th>
						</tr>
						<c:if test="${! empty datos_poliza}">
							<tr>
								<td class="campocaja">
									<div style="float: left;">
										<img id="DSP_DATOS_POLIZA_parent" src="images/mes.gif"
											onclick="objEstilos.toggleDisplay('DSP_DATOS_POLIZA', this)"
											style="cursor: pointer" /> <b><axis:alt f="axisctr020"
												c="DATOS_POLIZA" lit="104925" /></b>&nbsp;&nbsp;${datos_poliza.NPOLIZA}
										<c:if test="${datos_poliza.NCERTIF!=null}">
											<axis:visible f="${pantalla}" c="NCERTIF">&nbsp;-&nbsp;${datos_poliza.NCERTIF}</axis:visible>
										</c:if>
										<c:if test="${datos_poliza.TSITUAC!=null}">&nbsp;-&nbsp;${datos_poliza.TSITUAC}</c:if>
										<c:if test="${datos_poliza.TRETENI!=null}">&nbsp;-&nbsp;${datos_poliza.TRETENI}</c:if>
										<c:if test="${!empty datos_poliza.TINCIDE}">&nbsp;-&nbsp;${datos_poliza.TINCIDE}</c:if>
										<c:if test="${datos_poliza.FEFECTO!=null}">&nbsp;-&nbsp;<axis:alt
												f="axisctr020" c="FFECTO" lit="100883" />&nbsp;<fmt:formatDate
												value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />
										</c:if>
										<c:if test="${datos_poliza.FVENCIM!=null}">&nbsp;-&nbsp;<axis:alt
												f="axisctr020" c="FVENCIM" lit="100885" />&nbsp;<fmt:formatDate
												value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />
										</c:if>
										<axis:visible c="CPOLCIA" f="${pantalla}">
											<c:if test="${datos_poliza.CPOLCIA!=null}">&nbsp;-&nbsp;<axis:alt
													f="axisctr020" c="CPOLCIA" lit="9001766" />&nbsp;${datos_poliza.CPOLCIA}</c:if>
										</axis:visible>
									</div> <axis:visible f="${pantalla}" c="LAPIZ1">
										<div style="float: right;" id="DATOS_POLIZA" c="LAPIZ1"></div>
									</axis:visible>
									<div class="seccion_suplementos" id="SECCION_DATOS_POLIZA"></div>

									<div style="float: right;">
									<!-- INI-CES-IAXIS2138: Ajuste para que no pinte las impresoras en cotizaciones csitua=4 -->
									<c:if test="${datos_poliza.CSITUAC!=4}">
									<!-- Ini-Bug 677- 20/04/2018 -VCG   -->
									    <axis:visible c="DOCPOL2" f="${pantalla}">
										    <div style="float:right;" id = "DOCPOL2">
										        <a href="javascript:f_but_docseguro()"> <img border="0"onclick= "javascript:f_but_docseguro()" alt="<axis:alt f="axisctr020" c="DOCPOL2" lit="9002213"/>"   title="<axis:alt f="axisctr020" c="DOCPOL2" lit="9002213"/>" src="images/print.gif"/></a>
										    </div>
										</axis:visible>
										<axis:visible c="DOCPOL" f="${pantalla}">
												<a href="javascript:f_but_docseguro()"> <img border="0"
													onclick="javascript:f_but_docseguro()"
													alt="<axis:alt f="axisctr020" c="DOCPOL" lit="9002213"/>"
													title="<axis:alt f="axisctr020" c="DOCPOL" lit="9002213"/>"
													src="images/print.gif" /></a>
										</axis:visible>
										 
                                   	<!-- Fin-Bug 677- 20/04/2018 -VCG   -->
                                   	</c:if>
                                   	<!-- END-CES-IAXIS2138: Ajuste para que no pinte las impresoras en cotizaciones csitua=4 -->
									</div>

									<div style="clear: both;">
										<hr class="titulo">
									</div>

								</td>
							</tr>
							<c:if test="${! empty mvtretencion_sup}">
								<tr>
									<td class="campocaja">
										<div class="displayspace">
											<c:set var="title0">
												<axis:alt f="axisctr020" c="CMOTRETEN" lit="1000297" />
											</c:set>
											<c:set var="title1">
												<axis:alt f="axisctr020" c="FRECEP" lit="1000148" />
											</c:set>
											<c:set var="title2">
												<axis:alt f="axisctr020" c="CUSUARI" lit="100894" />
											</c:set>
											<c:set var="title3">
												<axis:alt f="axisctr020" c="FREVISIO" lit="105403" />
											</c:set>
											<c:set var="title4">
												<axis:alt f="axisctr020" c="CSUSREV" lit="105404" />
											</c:set>
											<c:set var="title5">
												<axis:alt f="axisctr020" c="NRIESGO" lit="100649" />
											</c:set>
											<c:set var="title6">
												<axis:alt f="axisctr020" c="NRESUL" lit="1000345" />
											</c:set>
											<axis:tabla name="${mvtretencion_sup}" miid="mimvtretencion"
												objeto="OB_IAX_POLMVTRETEN"
												campos="TMOTRET(O)#FRETEN(O)#CUSURET(O)#FREVRET(O)#CUSUREF(O)#TRIESGO(O)#TRESULTA(O)"
												estilos="dspText#dspDate#dspText#dspDate#dspText#dspText#dspText"
												titulos="${title0}@@${title1}@@${title2}@@${title3}@@${title4}@@${title5}@@${title6}"
												columnHeaderClass="sortable gridsorted gridasc#sortable#sortable#sortable#sortable#sortable#sortable"
												cellpadding="0" cellspacing="0" />
										</div>
										<hr />

									</td>
								</tr>
							</c:if>

							<!--  INICIO SECCION CAMPOS **********************************************************  -->
							<tr id="DSP_DATOS_POLIZA_children" style="display: none">
								<td align="left">
									<table class="area" align="center">
										<tr>
											<th style="width: 10%; height: 0px"></th>
											<th style="width: 10%; height: 0px"></th>
											<th style="width: 20%; height: 0px"></th>
											<th style="width: 20%; height: 0px"></th>
											<th style="width: 20%; height: 0px"></th>
											<th style="width: 20%; height: 0px"></th>
										</tr>
										<!-- DATOS POLIZA -->
										<tr>
											<!-- Numero de poliza -->
											<td class="titulocaja" id="tit_NPOLIZA"><b
												id="label_NPOLIZA"><axis:alt f="axisctr020" c="NPOLIZA"
														lit="100624" /></b></td>
											<td>
												<table>
													<tr>
														<axis:ocultar f="${pantalla}" c="NCERTIF">
															<!-- Numero de CERTIF -->
															<td class="titulocaja"><b><axis:alt
																		f="axisctr020" c="NCERTIF" lit="101236" /></b></td>
														</axis:ocultar>
														<!-- Numero de NRENOV BUG 39659 AAC-->

														<axis:visible f="${pantalla}" c="NRENOVCOLM">
															<td class="titulocaja" align="right" width="50%"><b><axis:alt
																		f="axisctr020" c="NRENOVCOLM" lit="9908732" /></b></td>
														</axis:visible>
														<!-- BUG 39659 AAC -->
													</tr>
												</table>
											</td>
											<!-- Situacion -->
											<!-- INI SGM -->
											<axis:visible f="${pantalla}" c="NCERTDIAN">
											<td class="titulocaja"><b><axis:alt f="axisctr020"
														c="NCERTDIAN" lit="89907051" /></b></td>
											</axis:visible>
											<!-- FIN SGM -->			
											<td class="titulocaja"><b><axis:alt f="axisctr020"
														c="CSITUAC" lit="100874" /></b></td>
											<c:if test="${!empty datos_poliza.TRETENI}">
												<!-- Estado -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="CESTADO" lit="100587" /></b></td>
											</c:if>
											<td class="titulocaja" colspan="2"><b><axis:alt
														f="axisctr020" c="SPRODUC" lit="100829" /></b></td>
											<axis:visible f="${pantalla}" c="TACTIVI">
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="TACTIVI" lit="103481" /></b></td>
											</axis:visible>
										</tr>
										<tr>
											<!-- Numero de poliza -->
											<td class="campocaja"><input type="text"
												class="campo campotexto" id="NPOLIZA" name="NPOLIZA"
												size="15" style="width: 90px"
												value="${datos_poliza.NPOLIZA}" readonly="true" /></td>
											<td>
												<table>
													<tr>
														<td><axis:ocultar f="${pantalla}" c="NCERTIF">
																<td class="campocaja">
																	<!-- Numero de certificado --> <input type="text"
																	class="campo campotexto" id="NCERTIF" name="NCERTIF"
																	size="3" style="width: 100%"
																	value="${datos_poliza.NCERTIF}" readonly="true" />

																</td>
															</axis:ocultar></td>
														<td>
															<!-- Numero de NRENOV BUG 39659 AAC--> <axis:visible
																f="${pantalla}" c="NRENOVCOLM">
																<td class="campocaja" align="left" width="50%">
																	<!-- Numero de certificado --> <input type="text"
																	class="campo campotexto" id="NRENOVCOLM"
																	name="NRENOVCOLM" size="2" style="width: 90%" 
																	value="${datos_poliza.NRENOVCOLM}" readonly="true" />
																</td>
															</axis:visible> <!-- BUG 39659 AAC-->
														</td>
													</tr>
												</table>
											</td>
											<!-- Situacion -->
											<!-- INI SGM -->
											<axis:visible f="${pantalla}" c="NCERTDIAN">
											<td class="campocaja"><input type="text"
												class="campowidthinput campo campotexto" id="NCERTDIAN"
												name="NCERTDIAN" size="12" value="${__formdata.NCERTDIAN}"
												readonly="true" /></td>
												</axis:visible>
											<!-- FIN SGM -->	
											<td class="campocaja"><input type="text"
												class="campowidthinput campo campotexto" id="TSITUAC"
												name="TSITUAC" size="15" value="${datos_poliza.TSITUAC}"
												readonly="true" /></td>
											<c:if test="${!empty datos_poliza.TRETENI}">
												<!-- Estado -->
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="TRETENI"
													name="TRETENI" size="15" value="${datos_poliza.TRETENI}"
													readonly="true" /></td>
											</c:if>
											<!-- producto -->
											<td class="campocaja" colspan="2"><input type="text"
												style="width: 95%" class="campowidthinput campo campotexto"
												id="TPRODUC" name="TPRODUC" size="15"
												value="${datos_poliza.TPRODUC}" readonly="true" /></td>
											<axis:visible f="${pantalla}" c="TACTIVI">
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="TACTIVI"
													name="TACTIVI" size="15" value="${datosgestion.TACTIVI}"
													readonly="true" /></td>
											</axis:visible>

										</tr>
										<tr>
											<!-- Fecha efecto -->
											<td class="titulocaja" colspan="2"><b><axis:alt
														f="axisctr020" c="FFECTO" lit="100883" /></b></td>

											<!-- TDuraci -->
											<axis:visible c="TDURACI" f="${pantalla}">
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="TDURACI" lit="1000120" /></b></td>
											</axis:visible>
											<axis:visible c="NDURCOB" f="${pantalla}">
												<!-- NDURCOB -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="NDURCOB" lit="9000814" /></b></td>
											</axis:visible>
											<axis:ocultar f="${pantalla}" c="FVENCIM" dejarHueco="false">
												<!-- Fecha vencimiento -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="FVENCIM" lit="100885" /></b></td>
											</axis:ocultar>

										</tr>
										<tr>
											<!-- Fefecto -->
											<td class="campocaja" colspan="2"><input type="text"
												class="campowidthinput campo campotexto" id="FEFECTO"
												name="FEFECTO" size="15"
												value="<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />"
												readonly="true" /></td>
											<!-- TDuraci -->
											<axis:visible c="TDURACI" f="${pantalla}">
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="TDURACI"
													name="TDURACI" size="15" style="width: 150px"
													value="${datos_poliza.TDURACI}" readonly="true" /></td>
											</axis:visible>
											<axis:visible c="NDURCOB" f="${pantalla}">
												<!-- NDURCOB -->
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="NDURCOB"
													name="NDURCOB" size="15" style="width: 60%;"
													value="${datos_poliza.NDURCOB}" readonly="true" /></td>
											</axis:visible>
											<axis:ocultar f="${pantalla}" c="FVENCIM" dejarHueco="false">
												<!-- Fecha vencimiento -->
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="FVENCIM"
													name="FVENCIM" size="10"
													value="<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />"
													readonly="true" /></td>
											</axis:ocultar>



										</tr>
                                                                                
                                                                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                                                <tr>
                                                                                    <axis:ocultar f="${pantalla}" c="PEJECUCION2"  >
                                                                                        <td class="titulocaja" align="right">
                                                                                        </td>
                                                                                    </axis:ocultar>
                                                                                    
                                                                                    <td class="titulocaja" style="white-space:nowrap">
                                                                                        <axis:ocultar f="${pantalla}" c="FEFEPLAZO" >
                                                                                            <b id="label_FEFEPLAZO"><axis:alt f="${pantalla}" c="LIT_9908885" lit="9908885" /></b>
                                                                                            <b class="campocaja" style="white-space:nowrap"></b>
                                                                                            <b class="campocaja" style="white-space:nowrap"></b>
                                                                                            <b class="campocaja" style="white-space:nowrap"></b>                                            
                                                                                        </axis:ocultar>
                                                                                        
                                                                                        <axis:ocultar f="${pantalla}" c="FVENCPLAZO" >
                                                                                            <b id="label_FVENCPLAZO"><axis:alt f="${pantalla}" c="LIT_9908886" lit="9908886" /></b>
                                                                                        </axis:ocultar>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <axis:ocultar f="${pantalla}" c="PEJECUCION"  >
                                                                                        <td class="titulocaja" align="right">
                                                                                            <b id="label_PEJECUCION"><axis:alt f="${pantalla}" c="LIT_9908900" lit="9908900" /></b>
                                                                                        </td>
                                                                                    </axis:ocultar>
                                                                                    
                                                                                    <td class="campocaja"  style="white-space:nowrap">
                                                                                     <axis:ocultar f="${pantalla}" c="FEFEPLAZO" >                                        
                                                                                            <jsp:useBean id="today_FEFEPLAZO" class="java.util.Date" /> 
                                                                                            <c:set var="FEFEPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${datos_poliza.FEFEPLAZO}"/></c:set>
                                                                                            <input style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                                                                            <axis:atr f="${pantalla}" c="FEFEPLAZO" a="modificable=false&obligatorio=false&formato=fecha"/>
                                                                                            value="${FEFEPLAZO} <c:if test="${empty FEFEPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FEFEPLAZO}"/></c:if>"
                                                                                            title="<axis:alt f="${pantalla}" c="LIT_9908885" lit="9908885"/>"/>
                                                                                    </axis:ocultar>                                    
                                                                                    
                                                                                     <axis:ocultar f="${pantalla}" c="FVENCPLAZO" >
                                                                                            <b class="campocaja"  style="white-space:nowrap"></b>
                                                                                            <jsp:useBean id="today_FVENCPLAZO" class="java.util.Date" /> 
                                                                                            <c:set var="FVENCPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${datos_poliza.FVENCPLAZO}"/></c:set>
                                                                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FVENCPLAZO" name="FVENCPLAZO" size="15"
                                                                                            <axis:atr f="${pantalla}" c="FVENCPLAZO" a="modificable=false&obligatorio=false&formato=fecha"/>
                                                                                            value="${FVENCPLAZO} <c:if test="${empty FVENCPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FVENCPLAZO}"/></c:if>"
                                                                                            title="<axis:alt f="${pantalla}" c="LIT_9908886" lit="9908886"/>"/>
                                                                                    </axis:ocultar>
                                                                                    </td>
                                                                                </tr>
                                                                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->


										<tr>
											<axis:ocultar f="${pantalla}" c="CAGENTE" dejarHueco="false">
												<!-- Agente -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="CAGENTE" lit="100584" /></b></td>
												<td></td>
											</axis:ocultar>
										</tr>


										<tr>
											<axis:ocultar f="${pantalla}" c="CAGENTE" dejarHueco="false">
												<!-- AGENTE -->
												<td class="campocaja" colspan="6" nowrap="nowrap"><axis:visible
														f="${pantalla}" c="CAGENTE">
														<input type="text"
															class="campowidthinput campo campotexto" id="CAGENTE"
															name="CAGENTE" size="11" style="width: 60px"
															value="${datos_poliza.CAGENTE}" readonly="true" />
													</axis:visible> <input type="text"
													class="campowidthinput campo campotexto" id="TAGENTE"
													name="TAGENTE" size="40" style="width: 420px"
													value="${datos_poliza.axisctr020_agente.NOMBRE}"
													readonly="true" /></td>
											</axis:ocultar>
										<tr>
											<axis:visible f="${pantalla}" c="POLISSA_INI">
												<td class="titulocaja" colspan="2"><b><axis:alt
															f="axisctr020" c="NPOLINI" lit="1000017" /></b></td>
											</axis:visible>
											<axis:visible f="${pantalla}" c="NCONTRATO">
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="NCONTRATO" lit="9000536" /></b></td>
											</axis:visible>

											<axis:ocultar f="${pantalla}" c="CPOLCIA" dejarHueco="false">
												<!-- Poliza Compañía -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="CPOLCIA" lit="9001766" /></b></td>
											</axis:ocultar>

											<axis:ocultar f="${pantalla}" c="SFBUREAU" dejarHueco="false">
												<!-- Numero Bureu -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="SFBUREAU" lit="9908928" /></b></td>
											</axis:ocultar>
										</tr>

										<tr>
											<axis:visible f="${pantalla}" c="POLISSA_INI">
												<td class="campocaja" colspan="2"><input
													readonly="true" type="text"
													class="campowidthinput campo campotexto" id="polissa_ini"
													name="polissa_ini"
													title="<axis:alt f="axisctr020" c="NOPOLINI" lit="1000017"/>"
													size="15" value="${datos_poliza.POLISSA_INI}" />&nbsp;</td>
											</axis:visible>
											<axis:visible f="${pantalla}" c="NCONTRATO">
												<td class="campocaja"><input readonly="true"
													type="text" class="campowidthinput campo campotexto"
													id="NCONTRATO" name="NCONTRATO"
													title="<axis:alt f="axisctr020" c="NCONTRATO" lit="9000536"/>"
													size="15" value="${datos_poliza.NCONTRATO}" />&nbsp;</td>
											</axis:visible>

											<!-- Poliza Compañía -->
											<axis:visible c="CPOLCIA" f="${pantalla}">
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="CPOLCIA"
													name="CPOLCIA" size="15" value="${datos_poliza.CPOLCIA}"
													readonly="true" /></td>
											</axis:visible>

											<!-- Numero ficha bureau -->
											<axis:visible c="SFBUREAU" f="${pantalla}">
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="SFBUREAU"
													name="SFBUREAU" size="15" value="${datos_poliza.SFBUREAU}"
													readonly="true" /></td>
											</axis:visible>


											<td colspan="2">&nbsp;</td>
											<td class="campocaja" colspan="2" style="color: red;"><b>${datos_poliza.TINCIDE}</b>
											</td>
										</tr>
										<tr>
											<axis:ocultar f="${pantalla}" c="CMONPROD" dejarHueco="false">
												<!-- Moneda -->
												<td class="titulocaja" colspan="2"><b><axis:alt
															f="${pantalla}" c="CMONPROD" lit="9903008" /></b></td>
											</axis:ocultar>
											<axis:ocultar f="${pantalla}" c="CPROMOTOR"
												dejarHueco="false">
												<!-- Promotor -->
												<td class="titulocaja"><b><axis:alt f="${pantalla}"
															c="CPROMOTOR" lit="151522" /></b></td>
											</axis:ocultar>




										</tr>
										<tr>
											<axis:ocultar f="${pantalla}" c="CMONPROD" dejarHueco="false">
												<td class="campocaja" colspan="2"><input type="text"
													class="campowidthinput campo campotexto" id="CMONPROD"
													name="CMONPROD" size="15" style="width: 95%"
													value="${CMONPRODINT} - ${requestScope.TMONPROD}"
													readonly="true" /></td>
											</axis:ocultar>
											<axis:ocultar f="${pantalla}" c="CPROMOTOR"
												dejarHueco="false">
												<td class="campocaja" colspan="4"><input type="text"
													class="campowidthinput campo campotexto" id="TPROMOTOR"
													name="TPROMOTOR" size="15" style="width: 68%"
													value="${datos_poliza.axisctr020_promotor}" readonly="true" />
												</td>
											</axis:ocultar>






										</tr>
										<axis:visible f="${pantalla}" c="REEMPLAZOS">
											<c:if
												test="${!empty datos_poliza.REEMPLAZOS && fn:length(datos_poliza.REEMPLAZOS)>0}">
												<tr>
													<td align="left" colspan="6">
														<div class="displayspace">
															<c:set var="title0">
																<axis:alt f="axisctr020" c="NPOLIZAREEMPL" lit="9902381" />
															</c:set>
															<c:set var="title1">
																<axis:alt f="axisctr020" c="NPOLIZANUEVA" lit="9902382" />
															</c:set>
															<c:set var="title2">
																<axis:alt f="axisctr020" c="FMOVDIA" lit="100562" />
															</c:set>
															<c:set var="title3">
																<axis:alt f="axisctr020" c="CUSUARIO" lit="100894" />
															</c:set>
															<c:set var="title4">
																<axis:alt f="axisctr020" c="CAGENTE" lit="100584" />
															</c:set>
															<display:table name="${datos_poliza.REEMPLAZOS}"
																id="reemplazo" export="false" class="dsptgtable"
																pagesize="-1" defaultsort="1" defaultorder="ascending"
																sort="list" cellpadding="0" cellspacing="0"
																requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador">
																<%@ include file="../include/displaytag.jsp"%>
																<display:column title="${title0}" sortable="true"
																	sortProperty="OB_IAX_TOMADORES.TTIPIDE"
																	headerClass="sortable" style="width:20%" media="html"
																	autolink="false">
																	<div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.NPOLIZAREEMPL}</div>
																</display:column>
																<display:column title="${title1}" sortable="true"
																	sortProperty="OB_IAX_TOMADORES.NNUMIDE"
																	headerClass="headwidth5 sortable" style="width:20%"
																	media="html" autolink="false">
																	<div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.NPOLIZANUEVA}</div>
																</display:column>
																<display:column title="${title2}" sortable="true"
																	sortProperty="OB_IAX_TOMADORES.TNOMBRE"
																	headerClass="sortable" style="width:20%" media="html"
																	autolink="false">
																	<div class="dspText">
																		<fmt:formatDate pattern="dd/MM/yyyy"
																			value="${reemplazo.OB_IAX_REEMPLAZOS.FMOVDIA}" />
																	</div>
																</display:column>
																<display:column title="${title3}" sortable="true"
																	sortProperty="OB_IAX_TOMADORES.TSEXPER"
																	headerClass="headwidth5 sortable" style="width:20%"
																	media="html" autolink="false">
																	<div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.CUSUARIO}</div>
																</display:column>
																<display:column title="${title4}" sortable="true"
																	sortProperty="OB_IAX_TOMADORES.FNACIMI"
																	headerClass="sortable" style="width:20%" media="html"
																	autolink="false">
																	<div class="dspText">${reemplazo.OB_IAX_REEMPLAZOS.TAGENTE}</div>
																</display:column>
															</display:table>
														</div>
													</td>
												</tr>
											</c:if>
										</axis:visible>
									</table>
								</td>
							</tr>
						</c:if>
						<c:if test="${! empty datosgestion}">
							<axis:visible f="${pantalla}" c="DSP_DATOS_GESTION">
								<tr>
									<td class="campocaja">
										<div style="float: left;">
											<img id="DSP_DATOS_GESTION_parent" src="images/mes.gif"
												onclick="objEstilos.toggleDisplay('DSP_DATOS_GESTION', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisctr020"
													c="DATOS_GESTION" lit="140502" /> </b>&nbsp;&nbsp;
											${datos_poliza.TTIPCOB}&nbsp;
											<c:if test="${datos_poliza.CTIPCOB}=='2'">
												<c:if test="${datos_poliza.CBANCAR!=null}">&nbsp;-&nbsp;${datos_poliza.CBANCAR}</c:if>
											</c:if>
											&nbsp;-&nbsp;&nbsp;
											<axis:alt f="axisctr020" c="CFORPAG" lit="100712" />
											: &nbsp;${datos_poliza.TFORPAG}
											<axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">
												<c:if test="${datos_poliza.FCARPRO!=null}"> &nbsp;-&nbsp;<axis:alt
														f="axisctr020" c="FCARPRO" lit="151215" />&nbsp;<fmt:formatDate
														value="${datos_poliza.FCARPRO}" pattern="dd/MM/yyyy" />
												</c:if>
											</axis:ocultar>
											<axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">
												<c:if test="${datos_poliza.FCARANU!=null}"> &nbsp;-&nbsp;<axis:alt
														f="axisctr020" c="FRENOVA" lit="102626" />&nbsp;<fmt:formatDate
														value="${datos_poliza.FCARANU}" pattern="dd/MM/yyyy" />
												</c:if>
											</axis:ocultar>
											<axis:visible c="CMONPOL" f="axisctr020">
												<c:if test="${!empty datos_poliza.CMONPOL}"> - <axis:alt
														f="axisctr020" c="CMONPOL" lit="108645" /> :  ${datos_poliza.TMONPOL} </c:if>
											</axis:visible>
										</div> <axis:visible f="${pantalla}" c="LAPIZ1">
											<div style="float: right;" id="DATOS_GESTION" c="LAPIZ1"></div>
										</axis:visible>
										<div class="seccion_suplementos" id="SECCION_DATOS_GESTION"></div>
										<div style="clear: both;">
											<hr class="titulo">
										</div>
									</td>
								</tr>
								<tr id="DSP_DATOS_GESTION_children" style="display: none">
									<td align="left">
										<table class="area" align="center">
											<tr>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
											</tr>
											<!-- Datos Gesti?n -->
											<tr>
												<!-- TIPO_COBRO -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="CTIPCOB" lit="151348" /></b></td>
												<!-- CUENTA BANCARIA -->
												<axis:ocultar f="${pantalla}" c="CBANCAR" dejarHueco="false">
													<td class="titulocaja" colspan="2"><b><axis:alt
																f="axisctr020" c="CBANCAR" lit="100965" /></b></td>
												</axis:ocultar>
												<!-- FECHA ANULACION -->
												<axis:ocultar f="${pantalla}" c="FANULAC" dejarHueco="false">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="FANUL" lit="101244" /></b></td>
												</axis:ocultar>
												<!-- CUOTAS TARJETA bug 20761 -->
												<axis:ocultar f="${pantalla}" c="NCUOTAR" dejarHueco="false">
													<td class="tit_TARJETA"><b id="label_NCUOTAR"><axis:alt
																f="axisctr020" c="NCUOTAR" lit="9901245" /></b></td>
												</axis:ocultar>
											</tr>
											<tr>
												<!-- TIPO_COBRO -->
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="TTIPCOB"
													name="TTIPCOB" size="15" value="${datos_poliza.TTIPCOB}"
													readonly="true" /></td>
												<!-- CUENTA BANCARIA -->
												<axis:ocultar f="${pantalla}" c="CBANCAR" dejarHueco="false">
													<td class="campocaja" colspan="2"><input type="text"
														style="width: 100%"
														class="campowidthinput campo campotexto" id="CBANCAR"
														name="CBANCAR" size="15"
														value="<axis:masc f="axisctr020" c="CBANCAR" value="${datos_poliza.CBANCAR}" />"
														readonly="true" /></td>
												</axis:ocultar>
												<!-- FECHA ANULACION -->
												<axis:ocultar f="${pantalla}" c="FANULAC" dejarHueco="false">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FANULAC"
														name="FANULAC" size="15"
														value="<fmt:formatDate value="${datos_poliza.FANULAC}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:ocultar>
												<!-- CUOTAS TARJETA bug 20761 -->

												<td class="campocaja"><axis:ocultar f="${pantalla}"
														c="NCUOTAR" dejarHueco="false">
														<input type="text" style="width: 100%"
															class="campowidthinput campo campotexto" id="NCUOTAR"
															name="NCUOTAR" size="15" value="${datos_poliza.NCUOTAR}"
															readonly="true" />
													</axis:ocultar></td>
												<!-- CUOTAS TARJETA bug 20761 -->
												<td class="campocaja"><axis:ocultar f="${pantalla}"
														c="TARJETA" dejarHueco="false">
														<input type="hidden" style="width: 100%"
															class="campowidthinput campo campotexto" id="TARJETA"
															name="TARJETA" size="15" value="${datos_poliza.TARJETA}"
															readonly="true" />
													</axis:ocultar></td>

											</tr>
											<tr>

												<!-- FECHA TIPO FORMA DE PAGO -->
												<td class="titulocaja"><b><axis:alt f="axisctr020"
															c="CFORPAG" lit="100712" /></b></td>
												<!-- FECHA REnovacio -->
												<axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="FRENOVA" lit="102626" /></b></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">
													<!--F Proper Rebut -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="FCARPROREB" lit="1000462" /></b></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="FCARANT" dejarHueco="false">
													<!--fecha recibo anterior -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="FCARANT" lit="9000501" /></b></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="CRECFRA" dejarHueco="false">
													<!--recarrec fraccionament -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="CRECFRA" lit="1000483" /></b></td>
												</axis:ocultar>

											</tr>
											<tr>
												<!-- FECHA TIPO FORMA DE PAGO -->
												<td class="campocaja"><input type="text"
													class="campowidthinput campo campotexto" id="TFORPAG"
													name="TFORPAG" size="15" value="${datos_poliza.TFORPAG}"
													readonly="true" /></td>
												<!-- FECHA Renovacio -->
												<axis:ocultar f="${pantalla}" c="FCARANU" dejarHueco="false">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FCARANU"
														name="FCARANU" size="15"
														value="<fmt:formatDate value="${datos_poliza.FCARANU}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="FCARPRO" dejarHueco="false">
													<!--F Proper Rebut -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FCARPRO"
														name="FCARPRO" size="15"
														value="<fmt:formatDate value="${datos_poliza.FCARPRO}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="FCARANT" dejarHueco="false">
													<!--fecha recibo anterior -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FCARANT"
														name="FCARANT" size="15"
														value="<fmt:formatDate value="${datos_poliza.FCARANT}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:ocultar>
												<axis:ocultar f="${pantalla}" c="CRECFRA">
													<td class="campocaja"><input
														<c:if test="${datos_poliza.CRECFRA == '1'}">checked="true"</c:if>
														type="checkbox" disabled id="CRECFRA" name="CRECFRA"
														value="${datos_poliza.CRECFRA}" /></td>
												</axis:ocultar>

											</tr>

											<tr>

												<axis:visible f="${pantalla}" c="TDURPER">
													<!-- Periodo de revisión -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TDURPER" lit="1000558" /></b></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="PCAPFALL">
													<!-- Pct. Fallecimiento -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="PCAPFALL" lit="1000547" /></b></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="PDOSCAB">
													<!-- Pct. Reversión -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="PCTREV" lit="1000548" /></b></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="TFORPAGREN">
													<!-- Forma pago renta -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TFORPAGREN" lit="1000180" /></b></td>
												</axis:visible>
											</tr>

											<tr>
												<axis:visible f="${pantalla}" c="TDURPER">
													<!-- Periodo de revisión -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="NDURPER"
														name="NDURPER" size="15" value="${datos_poliza.NDURPER}"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="PCAPFALL">
													<!-- Pct. Fallecimiento -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="PCAPFALL "
														name="PCAPFALL " size="15"
														value="${datos_poliza.PCAPFALL}" readonly="true" /></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="PDOSCAB">
													<!-- Pct. Reversión -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="PDOSCAB "
														name="PDOSCAB " size="15" value="${datos_poliza.PDOSCAB }"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="TFORPAGREN">
													<!-- Forma pago renta -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="TFORPAGREN "
														name="TFORPAGREN " size="15"
														value="${datos_poliza.TFORPAGREN }" readonly="true" /></td>
												</axis:visible>
											</tr>


											<tr>
												<axis:visible f="${pantalla}" c="FREVISIO">
													<!-- Fecha de revisión -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="FREVISIO" lit="105403" /></b></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="NDURPRO">
													<!-- Duración próxima -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="NDURPRO" lit="1000549" /></b></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="INTPRO">
													<!--	Interés próximo -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="INTPRO" lit="1000550" /></b></td>
												</axis:visible>
											<tr>
												<axis:visible f="${pantalla}" c="FREVISIO">
													<!-- Fecha de revisión -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FREVISIO "
														name="FREVISIO " size="15"
														value="<fmt:formatDate value="${datos_poliza.FREVISIO}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="NDURPRO">
													<!-- Duración próxima -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="NDURPRO"
														name="NDURACI" size="15" value="${datos_poliza.NDURPRO}"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="${pantalla}" c="INTPRO">
													<!--	Interés próximo -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="INTPRO"
														name="IPROX" size="15" value="${datos_poliza.INTPRO}"
														readonly="true" /></td>
												</axis:visible>
											</tr>
											<tr>
												<axis:visible f="axisctr020" c="CFOLNUM">
													<td class="titulocaja"><b id="label_CFOLNUM"><axis:alt
																f="axisctr020" c="CFOLNUM" lit="9906602" /></b></td>
												</axis:visible>

												<axis:visible f="axisctr020" c="CFECMAN">
													<td class="titulocaja"><b id="label_CFECMAN"><axis:alt
																f="axisctr020" c="CFECMAN" lit="9906603" /></b></td>
												</axis:visible>

												<axis:visible f="axisctr020" c="CSUCURSAL">
													<td class="titulocaja"><b id="label_CSUCURSAL"><axis:alt
																f="axisctr020" c="CSUCURSAL" lit="9002202" /></b></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="FFINVIG">
													<td class="titulocaja"><b id="label_FFINVIG"><axis:alt
																f="axisctr020" c="FFINVIG" lit="9905543" /></b></td>
												</axis:visible>
											</tr>
											<tr>
												<axis:visible f="axisctr020" c="CFOLNUM">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="CFOLNUM"
														name="CFOLNUM" size="15" value="${datos_poliza.CFOLNUM}"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="CFECMAN">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="CFECMAN"
														name="CFECMAN" size="15"
														value="<fmt:formatDate value="${datos_poliza.CFECMAN}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="CSUCURSAL">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="CSUCURSAL"
														name="CSUCURSAL" size="15"
														value="${datos_poliza.CSUCURSAL}" readonly="true" /></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="FFINVIG">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="FFINVIG"
														name="FFINVIG" size="15"
														value="<fmt:formatDate value="${datos_poliza.FFINVIG}" pattern="dd/MM/yyyy"/>"
														readonly="true" /></td>
												</axis:visible>
											</tr>
											<tr>
												<axis:ocultar f="axisctr020" c="CTIPCOM" dejarHueco="false">
													<td class="titulocaja"><b id="label_CTIPCOM"><axis:alt
																f="axisctr020" c="LIT_101509" lit="101509" /></b></td>
												</axis:ocultar>

												<axis:visible f="axisctr020" c="CMONPOL">
													<!--	Interés próximo -->
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="CMONPOL" lit="108645" /></b></td>
												</axis:visible>

											</tr>

											<tr>
												<axis:ocultar f="axisctr020" c="CTIPCOM" dejarHueco="false">
													<td class="campocaja">
														<%--select name ="CTIPCOM" id ="CTIPCOM" size="1" onchange="f_carga_dependencias()" 
                                                                class="campowidth campo campotexto" style="width:90%" <axis:atr f="axisctr020" c="CTIPCOM" a="isInputText=false"/>>&nbsp; 
                                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.comision}" var="comision">
                                                                    <option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
                                                                </c:forEach>
                                                            </select--%>
														<input type="text"
														class="campowidthinput campo campotexto" id="TTIPCOM"
														name="TTIPCOM" size="15" value="${datos_poliza.TTIPCOM}"
														readonly="true" style="width: 70%" /> <input
														type="hidden" class="campowidthinput campo campotexto"
														id="CTIPCOM" name="CTIPCOM" size="15"
														value="${datos_poliza.CTIPCOM}" style="width: 70%" /> <axis:visible
															f="axisctr020" c="LIT_1000125">
															<a id="icon_CTIPCOM" name="icon_CTIPCOM"
																href="javascript:f_abrir_axisctr010('CONSULTA')"><img
																onclick="javascript:f_abrir_axisctr010('CONSULTA')"
																border="0"
																alt="<axis:alt f="axisctr020" c="LIT_1000125" lit="1000125"/>"
																title="<axis:alt f="axisctr020" c="LIT_1000125" lit="1000125"/>"
																src="images/informacion.gif" /></a>
														</axis:visible>
													</td>
												</axis:ocultar>

												<axis:visible f="axisctr020" c="CMONPOL">
													<!--	Moneda -->
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="CMONPOL"
														name="CMONPOL" size="15" value="${datos_poliza.TMONPOL}"
														readonly="true" /></td>
												</axis:visible>
											</tr>

											<tr>
												<axis:visible f="axisctr020" c="TCOMPANI">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TCOMPANI" lit="9000600" /></b></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="TBLOQUEOCOL">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TBLOQUEOCOL" lit="9904677" /></b></td>
												</axis:visible>
											</tr>
											<tr>
												<axis:visible f="axisctr020" c="TCOMPANI">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="TCOMPANI"
														name="TCOMPANI" size="15" value="${datos_poliza.TCOMPANI}"
														readonly="true" /></td>
												</axis:visible>
												<axis:visible f="axisctr020" c="TBLOQUEOCOL">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="TBLOQUEOCOL"
														name="TBLOQUEOCOL" size="15"
														value="${datos_poliza.TBLOQUEOCOL}" readonly="true" /></td>
												</axis:visible>
											</tr>

										</table>
									</td>
								</tr>
							</axis:visible>
						</c:if>
						<axis:visible c="DSP_GESTORCOBRO" f="${pantalla}">
							<c:if
								test="${!empty gestorescobro && fn:length(gestorescobro)>0}">
								<tr>
									<td class="campocaja">
										<div style="float: left;">
											<img id="DSP_GESTORCOBRO_parent" src="images/mes.gif"
												onclick="objEstilos.toggleDisplay('DSP_GESTORCOBRO', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisctr020"
													c="NGESTORCOBRO" lit="9903385" /></b>
										</div> <axis:visible f="${pantalla}" c="LAPIZ1">
											<div style="float: right;" id="GESTORCOBRO" c="LAPIZ1"></div>
										</axis:visible>
										<div class="seccion_suplementos" id="SECCION_GESTORCOBRO"></div>
										<div style="clear: both;">
											<hr class="titulo">
										</div>
									</td>
								</tr>
								<tr id="DSP_GESTORCOBRO_children" style="display: none">
									<td align="left">
										<div class="displayspace">
											<c:set var="title0">
												<axis:alt f="axisctr020" c="CTIPDOC" lit="109774" />
											</c:set>
											<c:set var="title1">
												<axis:alt f="axisctr020" c="TDOCUME" lit="105330" />
											</c:set>
											<c:set var="title2">
												<axis:alt f="axisctr020" c="TNOMBRE" lit="105940" />
											</c:set>
											<c:set var="title5">
												<axis:alt f="axisctr020" c="TDOMICI" lit="101078" />
											</c:set>
											<c:set var="title6">
												<axis:alt f="axisctr020" c="TAGRUPA" lit="111471" />
											</c:set>
											<display:table name="${gestorescobro}" id="gestorescobro"
												export="false" class="dsptgtable" pagesize="-1"
												defaultsort="1" defaultorder="ascending" sort="list"
												cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador">
												<%@ include file="../include/displaytag.jsp"%>
												<display:column title="${title0}" sortable="true"
													sortProperty="OB_IAX_GESCOBROS.TTIPIDE"
													headerClass="sortable" style="width:15%" media="html"
													autolink="false">
													<div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TTIPIDE}</div>
												</display:column>
												<display:column title="${title1}" sortable="true"
													sortProperty="OB_IAX_GESCOBROS.NNUMIDE"
													headerClass="headwidth5 sortable" style="width:15%"
													media="html" autolink="false">
													<div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.NNUMIDE}</div>
												</display:column>
												<display:column title="${title2}" sortable="true"
													sortProperty="OB_IAX_GESCOBROS.TNOMBRE"
													headerClass="sortable" style="width:25%" media="html"
													autolink="false">
													<div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TAPELLI1}
														${gestorescobro.OB_IAX_GESCOBROS.TAPELLI2}
														<c:if
															test="${!empty gestorescobro.OB_IAX_GESCOBROS.TNOMBRE}">, ${gestorescobro.OB_IAX_GESCOBROS.TNOMBRE}</c:if>
													</div>
												</display:column>
												<display:column title="${title5}" sortable="true"
													sortProperty="OB_IAX_GESCOBROS.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI"
													headerClass="sortable" style="width:40%" media="html"
													autolink="false">
													<div class="dspText">${gestorescobro.OB_IAX_GESCOBROS.TDOMICIGESTCOBRO}</div>
												</display:column>
												<display:column title="Consultar"
													headerClass="headwidth5 sortable" style="width:5%"
													media="html" autolink="false">
													<div class="dspIcons">
														<img id="find" border="0" src="images/find.gif"
															onclick="javascript:f_consultar_persona('${gestorescobro.OB_IAX_GESCOBROS.SPERSON}');"
															style="cursor: pointer" />
													</div>
												</display:column>
											</display:table>
										</div>
										<div class="separador">&nbsp;</div>
									</td>
								</tr>
							</c:if>
						</axis:visible>

						<!-- Datos de Convenio -->
						<axis:visible c="DSP_DATOSCONVENIO" f="axisctr020">
							<c:if test="${!empty datosconvenio}">
								<tr>
									<td class="campocaja">
										<div style="float: left;">
											<img src="images/mes.gif" id="DSP_DATOSCONVENIO_parent"
												onclick="objEstilos.toggleDisplay('DSP_DATOSCONVENIO', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisctr020"
													c="DATOSCONVENIO" lit="9907598" /></b>
										</div> <axis:visible f="${pantalla}" c="LAPIZ1">
											<div style="float: right;" id="DATOSCONVENIO" c="LAPIZ1"></div>
										</axis:visible>
										<div class="seccion_suplementos" id="SECCION_DATOSCONVENIO"></div>
										<div style="clear: both;">
											<hr class="titulo">
										</div>
									</td>
								</tr>

								<tr id="DSP_DATOSCONVENIO_children" style="display: none">
									<td align="left">

										<table class="area" align="center">
											<tr>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
												<th style="width: 40%; height: 0px"></th>
												<th style="width: 20%; height: 0px"></th>
											</tr>
											<tr>

												<!-- Identificador de Convenio -->
												<axis:visible f="${pantalla}" c="IDCONV">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="IDCONV" lit="9907600" /></b></td>
												</axis:visible>

												<!-- Código de Convenio -->
												<axis:visible f="${pantalla}" c="TCODCONV">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TCODCONV" lit="9907599" /></b></td>
												</axis:visible>

												<!-- Descripcion de Convenio -->
												<axis:visible f="${pantalla}" c="TDESCRI">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="TDESCRI" lit="9907603" /></b></td>
												</axis:visible>

												<!-- Número de Versión -->
												<axis:visible f="${pantalla}" c="NVERSION">
													<td class="titulocaja"><b><axis:alt f="axisctr020"
																c="NVERSION" lit="9907601" /></b></td>
												</axis:visible>

											</tr>
											<tr>

												<!-- Identificador de Convenio -->
												<axis:visible f="${pantalla}" c="IDCONV">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="IDCONV"
														name="IDCONV" size="15" value="${datosconvenio.IDCONV}"
														readonly="true" /></td>
												</axis:visible>

												<!-- Código de Convenio -->
												<axis:visible f="${pantalla}" c="TCODCONV">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="TCODCONV"
														name="TCODCONV" size="15"
														value="${datosconvenio.TCODCONV}" readonly="true" /></td>
												</axis:visible>

												<!-- Descripcion de Convenio -->
												<axis:visible f="${pantalla}" c="TDESCRI">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="TDESCRI"
														name="TDESCRI" size="15" value="${datosconvenio.TDESCRI}"
														readonly="true" /></td>
												</axis:visible>

												<!-- Número de Versión -->
												<axis:visible f="${pantalla}" c="NVERSION">
													<td class="campocaja"><input type="text"
														class="campowidthinput campo campotexto" id="NVERSION"
														name="NVERSION" size="15"
														value="${datosconvenio.NVERSION}" readonly="true" /></td>
												</axis:visible>

											</tr>
										</table>

										<div class="separador">&nbsp;</div>
									</td>
								</tr>

							</c:if>
						</axis:visible>

						<axis:visible c="DSP_COASEGURO" f="axisctr020">
							<c:if test="${! empty datos_poliza}">
								<tr>
									<td class="campocaja">
										<div style="float: left;">
											<img src="images/mes.gif" id="DSP_COASEGURO_parent"
												onclick="objEstilos.toggleDisplay('DSP_COASEGURO', this)"
												style="cursor: pointer" /> <b><axis:alt f="axisctr020"
													c="COASEGURO" lit="105387" /></b>
										</div> <axis:visible f="${pantalla}" c="LAPIZ1">
											<div style="float: right;" id="COASEGURO" c="LAPIZ1"></div>
										</axis:visible>
										<div class="seccion_suplementos" id="SECCION_COASEGURO"></div>
										<div style="clear: both;">
											<hr class="titulo">
										</div>
									</td>
								</tr>
								<tr id="DSP_COASEGURO_children" style="display: none">
									<td align="left">
										<table class="area" align="center">
											<tr>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
												<th style="width: 25%; height: 0px"></th>
											</tr>
											<tr>
												<axis:ocultar f="axisctr020" c="CTIPCOA" dejarHueco="false">
													<td class="titulocaja"><b id="label_CTIPCOA"><axis:alt
																f="axisctr020" c="label_CTIPCOA" lit="105387" /></b></td>
												</axis:ocultar>
												<axis:ocultar f="axisctr020" c="label_PLOCCOA"
													dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA != 0}">
														<td class="titulocaja"><b id="label_PLOCCOA"><axis:alt
																	f="axisctr020" c="label_PLOCCOA" lit="9904141" /></b></td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisctr020" c="SCIACOA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="titulocaja"><b id="label_SCIACOA"><axis:alt
																	f="axisctr020" c="label_SCIACOA" lit="9904142" /></b></td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisctr020" c="NPOLCIA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="titulocaja"><b id="label_NPOLCIA"><axis:alt
																	f="axisctr020" c="label_NPOLCIA" lit="9904143" /></b></td>
													</c:if>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar f="axisctr020" c="CTIPCOA" dejarHueco="false">
													<td class="campocaja"><input type="text"
														style="width: 80%"
														class="campowidthinput campo campotexto" id="TTIPCOA"
														name="TTIPCOA"
														title="<axis:alt f="axisctr020" c="label_TTIPCOA" lit="105387"/>"
														size="15" value="${datos_poliza.TTIPCOA}"
														<axis:atr f="axisctr020" c="TTIPCOA" a="modificable=false&obligatorio=false"/> />
													</td>
												</axis:ocultar>
												<!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 Start  -->
												<axis:ocultar f="axisctr020" c="PLOCCOA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA != 0}">
														<td class="campocaja"><input type="text"
															style="width: 40%"
															class="campowidthinput campo campotexto" id="PLOCCOA"
															name="PLOCCOA"
															title="<axis:alt f="axisctr020" c="label_PLOCCOA" lit="9904141"/>"
															size="15" value="<fmt:formatNumber pattern="###,####0.0000" value="${DATCOASEGURO.PLOCCOA}"/>"
															<axis:atr f="axisctr020" c="PLOCCOA" a="modificable=false&obligatorio=false&formato=entero"/> />
														</td>
													</c:if>
												</axis:ocultar>
												<!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 End  -->
												<axis:ocultar f="axisctr020" c="SCIACOA" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="campocaja"><input type="text"
															style="width: 80%"
															class="campowidthinput campo campotexto" id="SCIACOA"
															name="SCIACOA"
															title="<axis:alt f="axisctr020" c="label_SCIACOA" lit="9904142"/>"
															size="15" value="${DATCOASEGURO.TCOMPAN}"
															<axis:atr f="axisctr020" c="SCIACOA" a="modificable=false&obligatorio=false"/> />
														</td>
													</c:if>
												</axis:ocultar>
												<axis:ocultar f="axisctr020" c="NPOLCIA2" dejarHueco="false">
													<c:if test="${datos_poliza.CTIPCOA == 8}">
														<td class="campocaja"><input type="text"
															style="width: 60%"
															class="campowidthinput campo campotexto" id="NPOLCIA2"
															name="NPOLCIA2"
															title="<axis:alt f="axisctr020" c="label_NPOLCIA" lit="9904143"/>"
															alt="<axis:alt f="axisctr020" c="label_NPOLCIA" lit="9904143"/>"
															size="15" value="${DATCOASEGURO.NPOLIZA}"
															<axis:atr f="axisctr020" c="NPOLCIA2" a="obligatorio=false&modificable=false"/> />&nbsp;
														</td>
													</c:if>
												</axis:ocultar>
											</tr>
											
											
											<tr>
											<axis:visible f="axisctr020" c="ENDOSO">
											<c:if test="${datos_poliza.CTIPCOA == 8}">
												<td class="titulocaja"><b id="label_ENDOSO"><axis:alt
															f="axisctr004" c="label_ENDOSO" lit="9905423" /></b>
												
												</td>
											</c:if>					
											</axis:visible>
											
											</tr>
											
											<tr>
											
											<axis:visible f="axisctr020" c="ENDOSO">
											<c:if test="${datos_poliza.CTIPCOA == 8}">
												<td class="campocaja"><input type="text"
													style="width: 100%"
													title="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
													alt="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
													class="campowidthinput campo campotexto" id="ENDOSO"
													name="ENDOSO" size="15"
													value="${DATCOASEGURO.ENDOSO}"
													<axis:atr f="axisctr020" c="NPOLCIA2" a="obligatorio=false&modificable=false"/> />&nbsp;
												</td>
											</c:if>	
											</axis:visible>
											</tr>
											<c:if test="${datos_poliza.CTIPCOA == 1}">
												<tr>
													<td class="titulocaja">
														<div class="separador">&nbsp;</div> <b id="label_TABLACOA"><axis:alt
																f="axisctr004" c="label_TABLACOA" lit="9002270" /></b>
													</td>
												</tr>
												<tr>
													<td align="left" colspan="3">
														<div class="displayspace">
															<c:set var="title1">
																<b><axis:alt f="axisctr004" c="label_TCOMPANI"
																		lit="9000600" /></b>
															</c:set>
															<c:set var="title2">
																<b><axis:alt f="axisctr004" c="label_PCESCOA"
																		lit="104818" /></b>
															</c:set>
															<c:set var="title3">
																<b><axis:alt f="axisctr004" c="label_PCOMCON"
																		lit="9001923" /></b>
															</c:set>
															<c:set var="title4">
																<b><axis:alt f="axisctr004" c="label_PCOMGAS"
																		lit="9902215" />
															</c:set>
															<c:set var="title5">
																<b><axis:alt f="axisctr004" c="label_PCOMCOA"
																		lit="9904150" />
															</c:set>
															<display:table name="${DATCOASEGURO.COACEDIDO}" id="coa"
																export="false" class="dsptgtable" pagesize="-1"
																defaultsort="1" defaultorder="ascending" sort="list"
																cellpadding="0" cellspacing="0"
																requestURI="axis_axisctr020.do?paginar=true&tabla=tomador">
																<%@ include file="../include/displaytag.jsp"%>
																<axis:visible f="axisctr020" c="TCOMPAN">
																	<display:column title="${title1}" sortable="false"
																		sortProperty="OB_IAX_TOMADORES.TTIPIDE"
																		headerClass="sortable" style="width:45%" media="html"
																		autolink="false">
																		<div class="dspText">${coa.OB_IAX_COACEDIDO.TCOMPAN}</div>
																	</display:column>
																</axis:visible>
														  <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 Start  -->
																<axis:visible f="axisctr020" c="PCESCOA">
																	<display:column title="${title2}" sortable="false"
																		sortProperty="PCESCOA"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.0000"
																				value="${coa.OB_IAX_COACEDIDO.PCESCOA}" />
																		</div>
																	</display:column>
																</axis:visible>
																  <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 End  -->
																<axis:visible f="axisctr020" c="PCOMCON">
																	<display:column title="${title3}" sortable="false"
																		sortProperty="PCOMCON"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${coa.OB_IAX_COACEDIDO.PCOMCON}" />
																		</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisctr020" c="PCOMGAS">
																	<display:column title="${title4}" sortable="false"
																		sortProperty="PCOMGAS"
																		headerClass="headwidth5 sortable" style="width:12%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${coa.OB_IAX_COACEDIDO.PCOMGAS}" />
																		</div>
																	</display:column>
																</axis:visible>
																<axis:visible f="axisctr020" c="PCOMCOA">
																	<display:column title="${title5}" sortable="false"
																		sortProperty="PCOMCOA"
																		headerClass="headwidth5 sortable" style="width:19%"
																		media="html" autolink="false">
																		<div class="dspNumber">
																			<fmt:formatNumber pattern="###,##0.00"
																				value="${coa.OB_IAX_COACEDIDO.PCOMCOA}" />
																		</div>
																	</display:column>
																</axis:visible>
															</display:table>
														</div>
														<div class="separador">&nbsp;</div>
													</td>
												</tr>
											</c:if>
										</table>
									</td>
								</tr>
							</c:if>
						</axis:visible>
						<axis:visible c="DSP_TOMADORES" f="${pantalla}">
							<c:if test="${!empty tomadores && fn:length(tomadores)>0}">
								<tr>
									<td class="campocaja">
										<div style="float: left;">
											<img id="DSP_TOMADOR_parent" src="images/mes.gif"
												onclick="objEstilos.toggleDisplay('DSP_TOMADOR', this)"
												style="cursor: pointer" /> <b id="label_NTOMADOR"><axis:alt
													f="axisctr020" c="NTOMADOR" lit="1000380" /></b>&nbsp;&nbsp;
											<c:if test="${tomadores[0].OB_IAX_TOMADORES.TTIPIDE!=null}">${tomadores[0].OB_IAX_TOMADORES.TTIPIDE}&nbsp;-&nbsp;</c:if>${tomadores[0].OB_IAX_TOMADORES.NNUMIDE}
											- ${datos_poliza.TNOMTOM}
										</div> <axis:visible f="${pantalla}" c="LAPIZ1">
											<div style="float: right;" id="TOMADORES" c="LAPIZ1"></div>
										</axis:visible>
										<div class="seccion_suplementos" id="SECCION_TOMADORES"></div>
										<div style="clear: both;">
											<hr class="titulo">
										</div>
									</td>
								</tr>
								<tr id="DSP_TOMADOR_children" style="display: none">
									<td align="left">
										<div class="displayspace">
											<c:set var="title0">
												<axis:alt f="axisctr020" c="CTIPDOC" lit="109774" />
											</c:set>
											<c:set var="title1">
												<axis:alt f="axisctr020" c="TDOCUME" lit="105330" />
											</c:set>
											<c:set var="title2">
												<axis:alt f="axisctr020" c="TNOMBRE" lit="105940" />
											</c:set>
											<c:set var="title3">
												<axis:alt f="axisctr020" c="NSEXO" lit="100962" />
											</c:set>
											<c:set var="title4">
												<axis:alt f="axisctr020" c="FNACIMI" lit="1000064" />
											</c:set>
											<c:set var="title5">
												<axis:alt f="axisctr020" c="TDOMICI" lit="101078" />
											</c:set>
											<c:set var="title6">
												<axis:alt f="axisctr020" c="ASSEGURADOS" lit="100899" />
											</c:set>

											<display:table name="${tomadores}" id="tomadores"
												export="false" class="dsptgtable" pagesize="-1"
												defaultsort="1" defaultorder="ascending" sort="list"
												cellpadding="0" cellspacing="0"
												requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador">
												<%@ include file="../include/displaytag.jsp"%>

												<display:column title="${title2}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.TNOMBRE"
													headerClass="sortable" media="html" autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.NORDTOM}</div>
												</display:column>


												<display:column title="${title0}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.TTIPIDE"
													headerClass="sortable" style="width:11%" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.TTIPIDE}
													</div>
													<c:forEach items="${tomadores.OB_IAX_TOMADORES.CONTACTOS}"
														var="varcontacto">
														<c:if test="${varcontacto.OB_IAX_CONTACTOS.CTIPCON == 3}">
															<input id="CONTACTOEMAIL" name="CONTACTOEMAIL"
																type="hidden"
																value="${varcontacto.OB_IAX_CONTACTOS.TVALCON}">
														</c:if>
													</c:forEach>
												</display:column>
												<display:column title="${title1}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.NNUMIDE"
													headerClass="headwidth5 sortable" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
												</display:column>
												<display:column title="${title2}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.TNOMBRE"
													headerClass="sortable" style="width:23%" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.TAPELLI1}
														${tomadores.OB_IAX_TOMADORES.TAPELLI2}
														<c:if test="${!empty tomadores.OB_IAX_TOMADORES.TNOMBRE}">, ${tomadores.OB_IAX_TOMADORES.TNOMBRE}</c:if>
													</div>
												</display:column>
												<!-- INI CONF-1347_QT_2002 - 11/04/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->
                                                                                                <c:if test="${PROPIETARIO.OB_IAX_ASEGURADOS.CTIPPER == 1}"> 
												<display:column title="${title3}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.TSEXPER"
													headerClass="headwidth5 sortable" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.TSEXPER}</div>
												</display:column>
												<display:column title="${title4}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.FNACIMI"
													headerClass="sortable" style="width:20%" media="html"
													autolink="false">
													<div class="dspText">
														<fmt:formatDate
															value='${tomadores.OB_IAX_TOMADORES.FNACIMI}'
															pattern='dd/MM/yyyy' />
													</div>
												</display:column>
												</c:if>
												<!-- FIN CONF-1347_QT_2002 - 11/04/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->
												<display:column title="${title5}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI"
													headerClass="sortable" style="width:33%" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}</div>
												</display:column>
												<display:column title="${title6}" sortable="true"
													sortProperty="OB_IAX_TOMADORES.TAGRUPA"
													headerClass="headwidth5 sortable" media="html"
													autolink="false">
													<div class="dspText">${tomadores.OB_IAX_TOMADORES.TAGRUPA}</div>
												</display:column>
												<axis:visible f="axisctr020" c="BT_CON_FIND_TOM">
													<display:column title="Consultar"
														headerClass="headwidth5 sortable" media="html"
														autolink="false">
														<div class="dspIcons">
															<axis:visible f="${pantalla}" c="CONSULTAR_PERSONA">
																<img c="CONSULTAR_PERSONA" id="find" border="0"
																	src="images/find.gif"
																	onclick="javascript:f_consultar_persona('${tomadores.OB_IAX_TOMADORES.SPERSON}');"
																	style="cursor: pointer" />
															</axis:visible>
														</div>
													</display:column>
												</axis:visible>
											</display:table>
										</div>
									</td>
								</tr>
							</c:if>
						</axis:visible>
