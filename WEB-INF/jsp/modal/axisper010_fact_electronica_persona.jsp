

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

<link rel="stylesheet" href="styles/displaytag.css"></link>

<body>

<div class="seccion">
	<table>
		<tr>
			<th style="width: 4%; height: 0px"></th>
			<th style="width: 48%; height: 0px"></th>
			<th style="width: 48%; height: 0px"></th>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<axis:ocultar f="axisper010" c="NIT_PROVEEDOR" dejarHueco="false">
				<td class="titulocaja">
				<b>
					<axis:alt f="axisper010" c="NIT_PROVEEDOR" lit="89908047" />
			    </b>
			    </td>
			</axis:ocultar>
			<axis:ocultar f="axisper010" c="RESPONSABLE_IVA" dejarHueco="false">
				<td class="titulocaja">
				<b>
					<axis:alt f="axisper010" c="RESPONSABLE_IVA" lit="89908048" />
				</b>
				</td>
			</axis:ocultar>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td class="campocaja">
				<input type="text" maxlength="15"
					class="campowidthinput campo campotexto" size="15"
					value="${__formdata.NIT_PROVEEDOR}" name="NIT_PROVEEDOR" id="NIT_PROVEEDOR"
					style="width: 40%;"
					onchange="f_onlynumber_FE(this)"
					title="<axis:alt f="axisper010" c="NIT_PROVEEDOR" lit="89908047"/>"
					<axis:atr f="axisper010" c="NIT_PROVEEDOR" a="obligatorio=false"/> />
			</td>
		
			<td class="campocaja">			
				<select name="RESPONSABLE_IVA"
						id="RESPONSABLE_IVA" size="1"
						class="campowidthselect campo campotexto"
						style="width: 40%;"
						title="<axis:alt f="axisper010" c="RESPONSABLE_IVA" lit="89908048"/>"
							   <axis:atr f="axisper010" c="RESPONSABLE_IVA" a="isInputText=false&obligatorio=false"/>>&nbsp;
									 <option value="<%=Integer.MIN_VALUE%>">-
										<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348" /> -
											</option>
												<c:forEach var="element" items="${__formdata.listValores.tipResponsable_IVA}">
													<option value="${element.CATRIBU}"
														<c:if test="${element.CATRIBU == __formdata.RESPONSABLE_IVA}"> selected </c:if> />
	                                                	${element.TATRIBU} 
	                                            	</option>
												</c:forEach>
				</select>			
			</td>
		<tr>
		<td>&nbsp;</td>
			<axis:ocultar f="axisper010" c="FISCALES_ADQUIRIENTE" dejarHueco="false">
				<td class="titulocaja">
				<b>
					<axis:alt f="axisper010" c="FISCALES_ADQUIRIENTE" lit="89908049" />
			    </b>
			    </td>
			</axis:ocultar>
			<axis:ocultar f="axisper010" c="CORREO_FACT_ELECT" dejarHueco="false">
				<td class="titulocaja">
				<b>
					<axis:alt f="axisper010" c="CORREO_FACT_ELECT" lit="89908050" />
				</b>
				</td>
			</axis:ocultar>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td class="campocaja">		
					<input type="text"
						class="campowidthinput campo campotexto"						
						
						size="15"
						value="${__formdata.FISCALES_ADQUIRIENTE}" name="FISCALES_ADQUIRIENTE" id="FISCALES_ADQUIRIENTE"
						style="width: 20%;"
						title="<axis:alt f="axisper010" c="FISCALES_ADQUIRIENTE" lit="89908049"/>"
						<axis:atr f="axisper010" c="FISCALES_ADQUIRIENTE" a="obligatorio=false"/> />
						&nbsp;<img id="findFISCALES_ADQUIRIENTE" border="0" src="images/find.gif"
						onclick="f_abrir_axisfiscales_adquiriente001(null, null)" style="cursor: pointer" />
						&nbsp;<span id="TFISCALES_ADQUIRIENTE_span" ><b>${__formdata.TFISCALES_ADQUIRIENTE}</b></span>
			</td>				
			<td class="campocaja">
			<input type="text"
				class="campowidthinput campo campotexto" size="15"
				value="${__formdata.CORREO_FACT_ELECT}" name="CORREO_FACT_ELECT" id="CORREO_FACT_ELECT"
				style="width: 40%;"
				title="<axis:alt f="axisper010" c="CORREO_FACT_ELECT" lit="89908050"/>"
				<axis:atr f="axisper010" c="CORREO_FACT_ELECT" a="obligatorio=false"/> onblur="f_onblur_email_FS(this.value)" />
			</td>	
		<tr>		
	</table>			
	<br/>
</div>
</body>
