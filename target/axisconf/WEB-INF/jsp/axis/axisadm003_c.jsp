<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>

	<tr>
		<td align="left">
			<table class="area" align="center">
				<%-- IMPORTES RECIBO --%>
				<tr>
					<th style="width:100%;height:0px"></th>
				</tr>
				<tr>
					<td class="campocaja">
						<img id="importes_recibo_monpol_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_recibo_monpol', this)" style="cursor:pointer"/>
						<%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
						<%-- INI -IAXIS-14223 - JRVG - 19/08/2020 --%>
						<b><axis:alt f="axisadm003" c="importes_recibo_monpol_parent" lit="1000582"/>&nbsp;${__defaultCMONINT}</b>&nbsp;&nbsp;
						<axis:alt f="axisadm003" c="LIT_ITOTAL" lit="1000584"/>&nbsp;&nbsp;
						<axis:alt f="axisadm003" c="LIT_INETA" lit="102995"/>  
						  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI}"/>&nbsp;-&nbsp;
						<axis:alt f="axisadm003" c="LIT_IMPUESTOS" lit="89906206"/>   
						  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC}"/>
						<axis:ocultar f="axisadm003" c="ICOMBRUT" dejarHueco="false">&nbsp;-&nbsp;
						  <axis:alt f="axisadm003" c="ICOMBRUT" lit="108482"/> 
						    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMBRU}"/>
						</axis:ocultar>&nbsp;-&nbsp;
						<axis:alt f="axisadm003" c="INETA" lit="1000563"/> 
						  <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC}"/>&nbsp;-&nbsp;               
                        <axis:alt f="axisadm003" c="TOTALIIMPORTE" lit="89906272"/> 
                            <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.TOTAL_ABONO_MONPOL}"/>&nbsp;-&nbsp; <%-- IAXIS-14408 JRVG  05/10/2020 --%>
                        <axis:alt f="axisadm003" c="SALDORECIBO" lit="89906273"/> 
                             <fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC - __formdata.TOTALIIMPORTE_MONPOL}"/>                
						<hr class="titulo"/>
						<%-- FIN -IAXIS-14223 - JRVG - 19/08/2020 --%>
						<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
					</td>
				</tr>                                                
				<tr id="importes_recibo_monpol_children" style="display:none">
					<td align="left">
						<table class="area" align="center">
							<tr>
								<th style="width:20%;height:0px"></th>
								<th style="width:20%;height:0px"></th>
								<th style="width:20%;height:0px"></th>
								<th style="width:20%;height:0px"></th>
								<th style="width:20%;height:0px"></th>                                                    
							</tr>
							<!-- 1 -->
							<tr>
								<%-- Prima neta --%>
								<axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
									<td class="titulocaja" id="tit_IPRINET">
										<b><axis:alt f="axisadm003" c="IPRINET" lit="102995"/></b>
									</td>  
								</axis:ocultar>
								<%-- Total descuentos --%>
								<axis:ocultar c="IT1DTO" f="axisadm003" dejarHueco="false">
									<td class="titulocaja" id="tit_IT1DTO">
										<b><axis:alt f="axisadm003" c="IT1DTO" lit="1000578"/></b>
									</td>  
								</axis:ocultar>
								<%-- Total recargos --%>
								<axis:ocultar c="IT1REC" f="axisadm003" dejarHueco="false">
									<td class="titulocaja" id="tit_IT1REC">
										<b><axis:alt f="axisadm003" c="IT1REC" lit="1000579"/></b>
									</td>  
								</axis:ocultar>
								<%-- Total recargos --%>
								<axis:ocultar c="IRECFRA" f="axisadm003" dejarHueco="false">
									<td class="titulocaja" id="tit_IRECFRA">
										<b><axis:alt f="axisadm003" c="IRECFRA" lit="1000579"/></b>
									</td>  
								</axis:ocultar>
																	  
								<%-- Consorcio --%>
								<axis:ocultar f="axisadm003" c="IT1CON" dejarHueco="false">
									<td class="titulocaja" id="tit_IT1CON">
										<b><axis:alt f="axisadm003" c="IT1CON" lit="1000587"/></b>
									</td>
								</axis:ocultar>
					
								<%-- Comisiones --%>
								<axis:ocultar f="axisadm003" c="ICOMBRU" dejarHueco="false">
									<td class="titulocaja" id="tit_ICOMBRU">
										<b><axis:alt f="axisadm003" c="ICOMBRU" lit="108482"/></b>
									</td>
								</axis:ocultar>
							</tr>
							
							<!-- 2 -->
							<tr>
								<%-- Prima neta --%>
								<axis:ocultar c="IPRINET" f="axisadm003" dejarHueco="false">
									<td class="campocaja" id="td_IPRINET">
									    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
										<input type="text" class="campo campotexto" id="IPRINET" name="IPRINET" size="15" style="width:75%" <axis:atr f="axisadm003" c="IPRINET" a="modificable=false&obligatorio=true&formato=decimal"/>                                                        
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI- __formdata.VIMPORTE_PRIMA}"/>" /> <%-- IAXIS-15532 --%>
										<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%> 
									</td>
								</axis:ocultar>
								<%-- Total descuentos --%>
								<axis:ocultar c="IT1DTO" f="axisadm003" dejarHueco="false">
									<td class="campocaja" id="td_IT1DTO">
									    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
										<input type="text" class="campo campotexto " id="IT1DTO" name="IT1DTO" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1DTO" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IIPS}'/>" />
										<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
									</td>
								</axis:ocultar>
								<%-- Total recargos --%>
								<axis:ocultar c="IT1REC" f="axisadm003" dejarHueco="false">
									<td class="campocaja" id="td_IT1REC">
									    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
										<input type="text" class="campo campotexto " id="IT1REC" name="IT1REC" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1REC" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IDERREG}'/>" />
										<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
									</td>
								</axis:ocultar>
								<%-- Total recargos --%>
								<axis:ocultar c="IRECFRA" f="axisadm003" dejarHueco="false">
									<td class="campocaja" id="td_IRECFRA">
										<input type="text" class="campo campotexto " id="IRECFRA" name="IRECFRA" size="15" style="width:75%" <axis:atr f="axisadm003" c="IRECFRA" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IRECFRA}'/>" />
									</td>
								</axis:ocultar>
								<%-- Consorcio --%>
								<axis:ocultar f="axisadm003" c="IT1CON" dejarHueco="false">
									<td class="campocaja" id="td_IT1CON">
										<input type="text" class="campo campotexto " id="IT1CON" name="IT1CON" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1CON" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IT1CON}'/>" />
									</td>
								</axis:ocultar>
					
								<%-- Comisiones --%>
								<axis:ocultar f="axisadm003" c="ICOMBRU" dejarHueco="false">
									<td class="campocaja" id="td_ICOMBRU">
										<input type="text" class="campo campotexto " id="ICOMBRU" name="ICOMBRU" size="15" style="width:75%" <axis:atr f="axisadm003" c="ICOMBRU" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMBRU}'/>" />
									</td>
								</axis:ocultar>
							</tr>  
							
							<!-- 3 -->
							<tr>
								<axis:ocultar f="axisadm003" c="IIPS" dejarHueco="false"> 
									<td class="titulocaja" id="tit_IIPS">                                                        
										<b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.TIIPS}</b>                                                        
									</td>
								</axis:ocultar>
								<axis:ocultar f="axisadm003" c="IDGS" dejarHueco="false">
									<td class="titulocaja" id="tit_IDGS">                                                        
										<b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.TIDGS}</b>                                                        
									</td>
								</axis:ocultar>
								<axis:ocultar f="axisadm003" c="IARBITR" dejarHueco="false">
									<td class="titulocaja" id="tit_IARBITR">                                                        
										<b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.TIARBITR}</b>                                                        
									</td>
								</axis:ocultar>
								<axis:ocultar f="axisadm003" c="IFNG" dejarHueco="false">
									<td class="titulocaja" id="tit_IFNG">                                                        
										<b>${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.TIFNG}</b>                                                        
									</td>
								</axis:ocultar>
								<%-- Total impuestos --%>
								<axis:ocultar f="axisadm003" c="IT1IMP" dejarHueco="false">
								<td class="titulocaja" id="tit_IT1IMP">
									<b><axis:alt f="axisadm003" c="IT1IMP" lit="1000580"/></b>
								</td>
								</axis:ocultar>
							</tr>
				
							<!-- 4 -->
							<tr>
								<%-- IIPS --%>
								<axis:ocultar f="axisadm003" c="IIPS" dejarHueco="false">
									<td class="campocaja">                                   
										<input type="text" class="campo campotexto " id="IIPS" name="IIPS" size="15" style="width:75%" <axis:atr f="axisadm003" c="IIPS" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IIPS}'/>" />                                                        
									</td>
								</axis:ocultar>    
								<%-- IDGS --%>
								<axis:ocultar f="axisadm003" c="IDGS" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="IDGS" name="IDGS" size="15" style="width:75%" <axis:atr f="axisadm003" c="IDGS" a="modificable=false&obligatorio=false&formato=decimal"/>
											onChange = "javascript:f_calculoma(this);"
											value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IDGS}'/>" />                                                        
									</td>
								</axis:ocultar>
								<%-- IARBITR --%>
								<axis:ocultar f="axisadm003" c="IARBITR" dejarHueco="false">
									<td class="campocaja">                                                           
										<input type="text" class="campo campotexto " id="IARBITR" name="IARBITR" size="15" style="width:75%" <axis:atr f="axisadm003" c="IARBITR" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IARBITR}'/>" />                                                        
									</td>
								</axis:ocultar>
								<%-- IFNG --%>
								<axis:ocultar f="axisadm003" c="IFNG" dejarHueco="false">
									<td class="campocaja">                                                        
										<input type="text" class="campo campotexto " id="IFNG" name="IFNG" size="15" style="width:75%" <axis:atr f="axisadm003" c="IFNG" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IFNG}'/>" />
									</td>                                                   
								</axis:ocultar>
								<%-- Total impuestos --%>
								<axis:ocultar f="axisadm003" c="IT1IMP" dejarHueco="false">
									<td class="campocaja">
									    <%-- INI -IAXIS-4995 - JLTS - 08/08/2019 --%>
										<input type="text" class="campo campotexto " id="IT1IMP" name="IT1IMP" size="15" style="width:75%" <axis:atr f="axisadm003" c="IT1IMP" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP- __formdata.VIMPORTE_IVA}"/>" /> <%-- IAXIS-15532 --%>
										<%-- FIN -IAXIS-4995 - JLTS - 08/08/2019 --%>
									</td>
								</axis:ocultar>
							</tr>   
							
							<!-- 5 -->
							<tr>
								<axis:ocultar f="axisadm003" c="ILIQUIDO" dejarHueco="false">
									<td class="titulocaja" id="tit_ILIQUIDO">                                                        
										<b><axis:alt f="axisadm003" c="ILIQUIDO" lit="9904375"/></b>
									</td>
								</axis:ocultar>
							</tr>
							<!-- 6 -->
							<tr>
								<axis:ocultar f="axisadm003" c="ILIQUIDO" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="ILIQUIDO" name="ILIQUIDO" size="15" style="width:75%" <axis:atr f="axisadm003" c="ILIQUIDO" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTALR +(__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMBRU - __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMRET)}'/>" />
									</td>
								</axis:ocultar>
							</tr>
				
				
							<!-- 7 -->
							<axis:ocultar f="axisadm003" c="TRILINEAREC" dejarHueco="false">
								<!-- 7.1 -->
								<tr>
									<%-- Bug 0019791 - 25/10/2011 - JMF --%>
									<%-- Derechos de registro --%>
									<axis:ocultar f="axisadm003" c="TIDERREG" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm003" c="TIDERREG" lit="1000106"/></b>
									</td>
									</axis:ocultar>
									<%-- Consorcio especial --%>
									<axis:ocultar f="axisadm003" c="TIRECCON" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm003" c="TIRECCON" lit="9902595"/></b>
									</td>
									</axis:ocultar>
									<%-- Prima bruta--%>
									<axis:ocultar f="axisadm003" c="TIPBRUTA" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm003" c="TIPBRUTA" lit="9902594"/></b>
									</td>
									</axis:ocultar>
									<%-- Total recibo --%>
									<axis:ocultar f="axisadm003" c="TITOTALR" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm003" c="TITOTALR" lit="1000563"/></b>
									</td>
									</axis:ocultar>
									<%-- Total recibo --%>
									<axis:ocultar f="axisadm003" c="ITOTLIQ" dejarHueco="false">
									<td class="titulocaja">
										<b><axis:alt f="axisadm003" c="ITOTLIQ" lit="9903053"/></b>
									</td>
									</axis:ocultar>
								</tr>                                          
								
								<!-- 7.2 -->
								<tr>
									<%-- Derechos de registro --%>
									<axis:ocultar f="axisadm003" c="IDERREG" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="IDERREG" name="IDERREG" size="15" style="width:75%" <axis:atr f="axisadm003" c="IDERREG" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC- __formdata.VIMPORTE_GASTO}"/>" /> <%-- IAXIS-15532 --%>
									</td>
									</axis:ocultar>
									<%-- Consorcio especial --%>
									<axis:ocultar f="axisadm003" c="IRECCON" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="IRECCON" name="IRECCON" size="15" style="width:75%" <axis:atr f="axisadm003" c="IRECCON" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IRECCON}'/>" />
									</td>
									</axis:ocultar>
									<%-- Prima bruta--%>
									<axis:ocultar f="axisadm003" c="IPBRUTA" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="IPBRUTA" name="IPBRUTA" size="15" style="width:75%" <axis:atr f="axisadm003" c="IPBRUTA" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.IPBRUTA}'/>" />
									</td>
									</axis:ocultar>
									<%-- Total recibo --%>
									<axis:ocultar f="axisadm003" c="ITOTALR" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="ITOTALR" name="ITOTALR" size="15" style="width:75%" <axis:atr f="axisadm003" c="ITOTALR" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value="${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTPRI + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTIMP + __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTREC - __formdata.TOTALIIMPORTE_MONPOL}"/>" <%-- IAXIS-15532 --%> />
									</td>
									</axis:ocultar>
									
									<%-- Total liquido --%>
									<axis:ocultar f="axisadm003" c="ITOTLIQ" dejarHueco="false">
									<td class="campocaja">
										<input type="text" class="campo campotexto " id="ITOTLIQ" name="ITOTLIQ" size="15" style="width:75%" <axis:atr f="axisadm003" c="ITOTLIQ" a="modificable=false&obligatorio=false&formato=decimal"/>
										onChange = "javascript:f_calculoma(this);"
										value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ITOTALR - (__formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMBRU - __formdata.OB_IAX_RECIBOS.VDETRECIBO_MONPOL[0].OB_IAX_VDETRECIBO.ICOMRET)}'/>" />
									</td>
									</axis:ocultar>
								</tr>                                                   
							</axis:ocultar>                                                
							<!-- 8 -->							
							<axis:ocultar f="axisadm003" c="DSP_DETIMPREC" dejarHueco="false">
								<!-- 8.1 -->
								<tr>
									<table class="area" align="center">
										<%-- IMPORTES RECIBO --%>
										<tr>
											<th style="width:100%;height:0px"></th>
										</tr>
										<tr>
											<td class="campocaja">
												<img id="importes_detallados_recibo_monpol_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_recibo_monpol', this)" style="cursor:pointer"/> 
												<b><axis:alt f="axisadm003" c="IRECIBO" lit="1000586"/></b>
												<hr class="titulo"/>
											</td>
										</tr>                                                
										<tr id="importes_detallados_recibo_monpol_children" style="display:none">
											<td align="left">
												<table class="area" align="center">
													<tr>
														<th style="width:100%;height:0px"></th>
													</tr>
													<tr> 
														<c:forEach items="${__formdata.OB_IAX_RECIBOS.DETRECIBO}" var="DETRECIBO" varStatus="status">                                                                        
															<table class="area" align="center">
																<%-- 1 Subsección por cada DETRECIBO --%>
																<tr>
																	<th style="width:100%;height:0px"></th>
																</tr>
																<tr>
																	<td class="campocaja">
																		<img id="importes_detallados_${status.count}_recibo_monpol_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_${status.count}_recibo_monpol', this)" style="cursor:pointer"/> 
																		<b>${DETRECIBO.OB_IAX_DETRECIBO.TCONCEP} </b> <fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${DETRECIBO.OB_IAX_DETRECIBO.ICONCEP_MONPOL}'/>
																		<hr class="titulo"/>
																	</td>
																</tr>                                                
																<tr id="importes_detallados_${status.count}_recibo_monpol_children" style="display:none">
																	<td align="left">
																		<table class="area" align="center">
																			 <tr>
																				<th style="width:100%;height:0px"></th>
																			</tr>
																			<tr>                                    
																				<td class="titulocaja">
																					<%-- DisplayTag para DETRECIBO_DET de cada DETRECIBO! --%>                                                                                                
																					<c:set var="title0"><axis:alt f="axisadm003" c="LIT_NRIESGO0" lit="800440"/> <axis:alt f="axisadm003" c="LIT_NRIESGO" lit="100649"/>  </c:set>  <%-- Nº Riesgo --%>
																					<c:set var="title1"><axis:alt f="axisadm003" c="LIT_TRIESGO" lit="100649"/></c:set>  <%-- Riesgo --%>
																					<c:set var="title2"><axis:alt f="axisadm003" c="LIT_NGARANT" lit="110994"/></c:set>  <%-- Garantía --%>
																					<c:set var="title3"><axis:alt f="axisadm003" c="LIT_TGARANT" lit="9901338"/></c:set>  <%-- Desc.garantía --%> 
																					<c:set var="title4"><axis:alt f="axisadm003" c="LIT_ICONCEP" lit="100563"/> </c:set> <%-- Importe --%>                                                                                                
																					
																					<div class="seccion displayspace">                                                                                                
																						<display:table name="${DETRECIBO.OB_IAX_DETRECIBO.DETRECIBO_DET}" id="DETRECIBO_DET" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
																							 requestURI="axis_axisadm003.do?paginar=true&subseccion=importes_detallados_${status.count}_recibo">
																							<%@ include file="../include/displaytag.jsp"%>
																							<axis:visible f="axisadm003" c="NRIESGO">
																							<display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DETRECIBO.NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false">
																								<div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.NRIESGO}</div> 
																							</display:column>
																							</axis:visible>
																							<axis:visible f="axisadm003" c="TRIESGO" >
																							<display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TRIESGO" headerClass="sortable"  media="html" autolink="false">
																								<div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.TRIESGO}</div> 
																							</display:column>
																							</axis:visible>
																							<axis:visible f="axisadm003" c="CGARANT" >
																							<display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.CGARANT" headerClass="headwidth10 sortable"  media="html" autolink="false">                                                                    
																								<div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.CGARANT}</div> 
																							</display:column>
																							</axis:visible>
																							<axis:visible f="axisadm003" c="TGARANT" >
																							<display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TGARANT" headerClass="sortable"  media="html" autolink="false">
																								<div class="dspText">${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.TGARANT}</div> 
																							</display:column>
																							</axis:visible>
																							<axis:visible f="axisadm003" c="ICONCEP" >
																							<display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.ICONCEP" headerClass="headwidth10 sortable"  media="html" autolink="false">
																								<div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${DETRECIBO_DET.OB_IAX_DETRECIBO_DET.ICONCEP_MONPOL}'/></div> 
																							</display:column>
																							</axis:visible>
																						</display:table>
																					</div>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</c:forEach>
													</tr>
                                                                                                        <tr>
                                                    <table class="area" align="center">
                                                        <%-- IMPORTES RECIBO --%>
                                                        <tr>
                                                            <th style="width:100%;height:0px"></th>
                                                        </tr>
                                                        <tr>
                                                            <td class="campocaja">
                                                                <img id="importes_detallados_recibo_recaudo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_recibo_recaudo', this)" style="cursor:pointer"/> 
                                                                <b><axis:alt f="axisadm003" c="IRECIBO" lit="9910147"/></b>
                                                                <hr class="titulo"/>
                                                            </td>
                                                        </tr>                                                
                                                        <tr id="importes_detallados_recibo_recaudo_children" style="display:none">
                                                            <td align="left">
                                                                <table class="area" align="center">
                                                                     <tr>
                                                                        <th style="width:100%;height:0px"></th>
                                                                    </tr>
                                                                    <tr> 
                                                                        <c:forEach items="${__formdata.OB_IAX_RECIBOS.DETRECIBO}" var="DETRECIBO" varStatus="status">   
                                                                        <c:if test="${!empty DETRECIBO.OB_IAX_DETRECIBO.TCONCEP_FCAMBIO}">
                                                                        <table class="area" align="center">
                                                                            <%-- 1 Subsección por cada DETRECIBO --%>
                                                                            
                                                                            <tr>
                                                                                <th style="width:100%;height:0px"></th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="campocaja">
                                                                                    <img id="importes_detallados_${status.count}_recibo_recaudo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('importes_detallados_${status.count}_recibo_recaudo', this)" style="cursor:pointer"/> 
                                                                                    <b>${DETRECIBO.OB_IAX_DETRECIBO.TCONCEP_FCAMBIO} </b> <fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${DETRECIBO.OB_IAX_DETRECIBO.ICONCEP_MONPOL_FCAMBIO}'/>
                                                                                    <hr class="titulo"/>
                                                                                </td>
                                                                            </tr>                                                
                                                                            <tr id="importes_detallados_${status.count}_recibo_recaudo_children" style="display:none">
                                                                                <td align="left">
                                                                                    <table class="area" align="center">
                                                                                         <tr>
                                                                                            <th style="width:100%;height:0px"></th>
                                                                                        </tr>
                                                                                        <tr>                                    
                                                                                            <td class="titulocaja">
                                                                                                <%-- DisplayTag para DETRECIBO_DET de cada DETRECIBO! --%>                                                                                                
                                                                                                <c:set var="title0"><axis:alt f="axisadm003" c="LIT_NRIESGO0" lit="800440"/> <axis:alt f="axisadm003" c="LIT_NRIESGO" lit="100649"/>  </c:set>  <%-- Nº Riesgo --%>
                                                                                                <c:set var="title1"><axis:alt f="axisadm003" c="LIT_TRIESGO" lit="100649"/></c:set>  <%-- Riesgo --%>
                                                                                                <c:set var="title2"><axis:alt f="axisadm003" c="LIT_NGARANT" lit="110994"/></c:set>  <%-- Garantía --%>
                                                                                                <c:set var="title3"><axis:alt f="axisadm003" c="LIT_TGARANT" lit="9901338"/></c:set>  <%-- Desc.garantía --%> 
                                                                                                <c:set var="title4"><axis:alt f="axisadm003" c="LIT_ICONCEP" lit="100563"/> </c:set> <%-- Importe --%>                                                                                                
                                                                                                
                                                                                                <div class="seccion displayspace">                                                                                                
                                                                                                    <display:table name="${DETRECIBO.OB_IAX_DETRECIBO.DETRECIBO_DET_FCAMBIO}" id="DETRECIBO_DET_FCAMBIO" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                         requestURI="axis_axisadm003.do?paginar=true&subseccion=importes_detallados_${status.count}_recibo_recaudo">
                                                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                        <axis:visible f="axisadm003" c="NRIESGO">
                                                                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_DETRECIBO.NRIESGO" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET_FCAMBIO.OB_IAX_DETRECIBO_DET.NRIESGO}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="TRIESGO" >
                                                                                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TRIESGO" headerClass="sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET_FCAMBIO.OB_IAX_DETRECIBO_DET.TRIESGO}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="CGARANT" >
                                                                                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.CGARANT" headerClass="headwidth10 sortable"  media="html" autolink="false">                                                                    
                                                                                                            <div class="dspText">${DETRECIBO_DET_FCAMBIO.OB_IAX_DETRECIBO_DET.CGARANT}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="TGARANT" >
                                                                                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.TGARANT" headerClass="sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText">${DETRECIBO_DET_FCAMBIO.OB_IAX_DETRECIBO_DET.TGARANT}</div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                        <axis:visible f="axisadm003" c="ICONCEP" >
                                                                                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DETRECIBO_DET.ICONCEP" headerClass="headwidth10 sortable"  media="html" autolink="false">
                                                                                                            <div class="dspText"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONEDAPROD]}' value='${DETRECIBO_DET_FCAMBIO.OB_IAX_DETRECIBO_DET.ICONCEP_MONPOL}'/></div> 
                                                                                                        </display:column>
                                                                                                        </axis:visible>
                                                                                                    </display:table>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        </c:if>
                                                                        </c:forEach>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </tr>
												</table>
											</td>
										</tr>
									</table>
								</tr>			
							</axis:ocultar>
						</table>        
					</td> 
				</tr> 
			</table>
		</td>
	</tr>