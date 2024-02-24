
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
			<td class="titulocaja"><b><axis:alt f="axisper005"
						c="CNACIONALIDAD" lit="1000304" /></b></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td class="campocaja"><input type="text"
				title="<axis:alt f="axisper005" c="CNACIONALIDAD" lit="1000304"/>"
				class="campowidthinput campo campotexto" size="15" maxlength="3"
				<axis:atr f="axisper005" c="CNACIONALIDAD" a="obligatorio=true"/>
				value="${__formdata.CNACIONALIDAD}" name="CNACIONALIDAD"
				id="CNACIONALIDAD" onchange="f_onchange_CNACIONALIDAD()"
				style="width: 18%;" /> <img id="findPaisNacionalidad"
				title="<axis:alt f="axisper005" c="CNACIONALIDAD" lit="9000508"/>"
				border="0" src="images/find.gif"
				onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_NACIONALIDAD', null)"
				style="cursor: pointer" /> <span id="TPAISNACIONALIDAD_span"><b>${__formdata.TPAISNACIONALIDAD}</b></span>
			</td>
		</tr>
	</table>
</body>