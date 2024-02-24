

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
			<axis:ocultar f="axisper010" c="CCODIMP" dejarHueco="false">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="CCODIMP" lit="9906564" /></b></td>
			</axis:ocultar>
			<axis:ocultar f="axisper010" c="CTIPIND" dejarHueco="false">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="CTIPIND" lit="9906486" /></b></td>
			</axis:ocultar>
		</tr>
		<tr>
		<td>&nbsp;</td>
			<axis:ocultar f="axisper010" c="CCODIMP" dejarHueco="false">
				<td class="campocaja"><select name="CCODIMP" id="CCODIMP"
					size="1" class="campowidthselect campo campotexto_ob"
					<axis:atr f="axisper010" c="CCODIMP"/>
					title="<axis:alt f="axisper010" c="CCODIMP" lit="101159"/>"
					onchange="f_carga_tipos_indicadores()">
						<option value="<%=Integer.MIN_VALUE%>">
							<axis:alt f="axisper010" c="SELECCIONAR" lit="108341" />
						</option>
						<c:forEach var="impuesto" items="${__formdata.LSTIMPUESTOS}">
							<option value="${impuesto.CCODIMP}">${impuesto.TDESIMP}
							</option>
						</c:forEach>
				</select></td>
			</axis:ocultar>

			<axis:ocultar f="axisper010" c="CTIPIND" dejarHueco="false">
				<td class="campocaja"><select name="CTIPIND" id="CTIPIND"
					size="1" class="campowidthselect campo campotexto_ob"
					<axis:atr f="axisper010" c="CTIPIND"/>
					title="<axis:alt f="axisper010" c="CTIPIND" lit="9901195"/>">
						<option value="<%=Integer.MIN_VALUE%>">
							<axis:alt f="axisper010" c="SELECCIONAR" lit="108341" />
						</option>
						<c:forEach var="tipo_ind" items="${__formdata.LSTTIPIND}">
							<option value="${tipo_ind.CTIPIND}">${tipo_ind.TINDICA}
							</option>
						</c:forEach>
				</select></td>
			</axis:ocultar>

		</tr>

	</table>
	
	<c:import url="../include/botonera_nt.jsp">
		<c:param name="f">axisper010</c:param>
		<c:param name="f">axisper010</c:param>
		<c:param name="__botones">anadir</c:param>
	</c:import>
	
	
	
	<br/>
</div>
</body>