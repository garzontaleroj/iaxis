
<head>
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<script>

function f_dependencia_prefix() {        
    f_cargar_propiedades_pantalla();            
}
</script>
</head>
<body>
								<table class="seccion">
									<tr>
										<th style="width: 4%; height: 0px"></th>
										<th style="width: 21%; height: 0px"></th>
										<th style="width: 21%; height: 0px"></th>
										<th style="width: 21%; height: 0px"></th>
										<th style="width: 21%; height: 0px"></th>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="TLFFIJO" lit="1000378" /></b></td>
										<axis:ocultar c="CPREFIXTF" f="axisper010">
											<td class="titulocaja" id="tit_CPREFIXTF"><b
												id="label_CPREFIXTF"><axis:alt f="axisper010"
														c="CPREFIXTF" lit="9910954" /></b></td>
										</axis:ocultar>
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="TLFMOVIL" lit="1000379" /></b></td>
										<axis:ocultar c="CPREFIXTM" f="axisper010">
											<td class="titulocaja" id="tit_CPREFIXTM"><b
												id="label_CPREFIXTM"><axis:alt f="axisper010"
														c="CPREFIXTM" lit="9910954" /></b></td>
										</axis:ocultar>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td class="campocaja"><input type="text"
											onkeypress="return ValidNum(event);"
											title="<axis:alt f="axisper010" c="TLFFIJO" lit="1000378"/>"
											class="campowidthinput campo campotexto" size="7" maxlength="10"
											value="${__formdata.TLFFIJO}"
											<axis:atr f="axisper010" c="TLFFIJO" a="obligatorio=false"/>  <%-- IAXIS-4832 - JVG - 30/07/2019  a = "obligatorio = false" --%>
											name="TLFFIJO" id="TLFFIJO" style="width: 90%;"
											onchange="f_dependencia_prefix();" />
										</td>

										<axis:visible f="axisper010" c="CPREFIXTF">
											<td class="campocaja" id="td_CPREFIXTF"><select
												onchange="selectFlag(this.selectedIndex, 'CPREFIXTF');"
												name="CPREFIXTF" id="CPREFIXTF"
												class="campowidthselect campo campotexto"
												style="width: 80%; vertical-align: top;"
												title="<axis:alt f="axisper010" c="lit_CPREFIXTF" lit="9910954"/>">

													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisper010" c="lit_1000348" lit="1000348" />
														-
													</option>

													<c:forEach var="element"
														items="${__formdata.listValores.listPrefijos}">
														<option id="${element.CODISOIBAN}"
															value="${element.CODISOTEL}"
															<c:if test="${element.CODISOTEL == __formdata.CPREFIXTF}"> selected </c:if>>
															${element.TPAIS} +${element.CODISOTEL}</option>
													</c:forEach>
											</select> <img id="flagPaisCPREFIXTF"
												src="images/flagiso/_unknown.png"
												onerror="this.src='images/flagiso/_unknown.png'"
												width="20px" height="20px" /> &nbsp;<span
												id="TFLAG_spanCPREFIXTF"><b></b></span></td>
										</axis:visible>

										<td class="campocaja"><input type="text"
											onkeypress="return ValidNum(event);"
											title="<axis:alt f="axisper010" c="TLFMOVIL" lit="1000379"/>"
											class="campowidthinput campo campotexto" size="10" maxlength="15"
											value="${__formdata.TLFMOVIL}" name="TLFMOVIL" id="TLFMOVIL"
											<axis:atr f="axisper010" c="TLFMOVIL" a="obligatorio=false"/>
											style="width: 90%;" onchange="f_dependencia_prefix();" /></td>

										<axis:visible f="axisper010" c="CPREFIXTM">
											<td class="campocaja" id="td_CPREFIXTM"><select
												onchange="selectFlag(this.selectedIndex, 'CPREFIXTM');"
												name="CPREFIXTM" id="CPREFIXTM"
												class="campowidthselect campo campotexto"
												style="width: 80%; vertical-align: top;"
												title="<axis:alt f="axisper010" c="lit_CPREFIXTM" lit="9910954"/>">

													<option value="<%=Integer.MIN_VALUE%>">-
														<axis:alt f="axisper010" c="lit_1000348" lit="1000348" />
														-
													</option>

													<c:forEach var="element"
														items="${__formdata.listValores.listPrefijos}">
														<option id="${element.CODISOIBAN}"
															value="${element.CODISOTEL}"
															<c:if test="${element.CODISOTEL == __formdata.CPREFIXTM}"> selected </c:if>>
															${element.TPAIS} +${element.CODISOTEL}</option>
													</c:forEach>
											</select> <img id="flagPaisCPREFIXTM"
												src="images/flagiso/_unknown.png"
												onerror="this.src='images/flagiso/_unknown.png'"
												width="20px" height="20px" /> &nbsp;<span
												id="TFLAG_spanCPREFIXTM"><b></b></span></td>
										</axis:visible>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td class="titulocaja"><b><axis:alt f="axisper010"
													c="EMAIL" lit="109792" /></b></td>
										<%-- Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
										<axis:ocultar c="FAX" f="axisper010" dejarHueco="false">
											<td class="titulocaja"><b><axis:alt f="axisper010"
														c="FAX" lit="9903323" /></b></td>
											<axis:ocultar c="CPREFIXF" f="axisper010">
												<td class="titulocaja"><b id="label_CPREFIXF"><axis:alt
															f="axisper010" c="CPREFIXF" lit="9910954" /></b></td>
											</axis:ocultar>
										</axis:ocultar>
										<%-- Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td class="campocaja"><input type="text"
											class="campowidthinput campo campotexto" size="15"
											value="${__formdata.EMAIL}" name="EMAIL" id="EMAIL"
											style="width: 90%;"
											title="<axis:alt f="axisper010" c="EMAIL" lit="109792"/>"
											<axis:atr f="axisper010" c="EMAIL" a="obligatorio=false"/> onblur="f_onblur_email(this.value)"/>
										</td>
										<%-- Inici BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
										<axis:ocultar c="FAX" f="axisper010" dejarHueco="false">
											<td class="campocaja"><input type="text"
												onkeypress="return ValidNum(event);"
												class="campowidthinput campo campotexto" size="7" maxlength="10"
												value="${__formdata.FAX}" name="FAX" id="FAX"
												style="width: 90%;"
												title="<axis:alt f="axisper010" c="FAX" lit="9903323"/>"
												<axis:atr f="axisper010" c="FAX" a="obligatorio=false"/>
												onchange="f_dependencia_prefix();" /></td>
											<axis:visible f="axisper010" c="CPREFIXF">
												<td class="campocaja" id="td_CPREFIXF"><select
													onchange="selectFlag(this.selectedIndex, 'CPREFIXF');"
													name="CPREFIXF" id="CPREFIXF"
													class="campowidthselect campo campotexto"
													style="width: 80%; vertical-align: top;"
													title="<axis:alt f="axisper010" c="lit_CPREFIXF" lit="9910954"/>">

														<option value="<%=Integer.MIN_VALUE%>">-
															<axis:alt f="axisper010" c="lit_1000348" lit="1000348" />
															-
														</option>

														<c:forEach var="element"
															items="${__formdata.listValores.listPrefijos}">
															<option id="${element.CODISOIBAN}"
																value="${element.CODISOTEL}"
																<c:if test="${element.CODISOTEL == __formdata.CPREFIXF}"> selected </c:if>>
																${element.TPAIS} +${element.CODISOTEL}</option>
														</c:forEach>
												</select> <img id="flagPaisCPREFIXF"
													src="images/flagiso/_unknown.png"
													onerror="this.src='images/flagiso/_unknown.png'"
													width="20px" height="20px" /> &nbsp;<span
													id="TFLAG_spanCPREFIXF"><b></b></span></td>
											</axis:visible>
										</axis:ocultar>
										<%-- Fi BUG 27814 - RCL - 02/08/2013 - Aladir Contacto FAX en el alta rapida de personas --%>
									</tr>
								</table>
								</body>