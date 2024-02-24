
<%
	/*
	 *  Fichero: axiserror.jsp
	 *  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
	 *  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
	 *  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
	 *  @author <a href = "mailto:rveloza.ext@confianza.com.co">Rodrigo velosa</a>
	 *  
	 *  Pantalla que printea el pie (footer) del aplicativo
	 *
	 *  Fecha: 12/07/2019
	 */
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"
	errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script language="Javascript" type="text/javascript">
	/*** Prevenir Backspace y F5 en IE6 ***/
	if (document.all && navigator.userAgent.indexOf("MSIE 6.0") > -1) {
		document.onkeydown = function() {
			if (window.event
					&& ((window.event.keyCode == 8 && window.event.srcElement.type != "password") || window.event.keyCode == 116)) {

				if ((window.event.srcElement.type != "text" && window.event.srcElement.type != "textarea")
						|| (window.event.srcElement.disabled == true || window.event.srcElement.readOnly == true)) {

					window.event.keyCode = 505;
				}
			}

			if (window.event.keyCode == 505) {
				return false;
			}
		}
	}
	/*****/
</script>
<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle basename="axis.bundle.Mensajes" />
<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" />
</head>
<body>
	<table class="base" cellspacing="0" cellpadding="0"
		style="width: 95%; border-top-width: 1px; border-top-style: solid; border-top-color: #DDDDDD;"
		align="center">
		<%
			/*<tr><td style="text-align:center; font-size:20px">&copy;<a href="<fmt:message key="empresa.link"/>" target="_new"><fmt:message key="empresa.nombre"/></a></td></tr>*/
		%>
		<tr>
			<td style="text-align: center; font-size: 20px">
			  <a href="<fmt:message key="empresa.link"/>" 
			     target="_new"><fmt:message key="empresa.nombre" />
			  </a>
		   </td>
		</tr>
	</table>
</body>
</html>
