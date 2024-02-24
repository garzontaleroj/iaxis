<%/* Revision:# WxEREOhTgB6h+wW7nnqjRw== # */%>

<%
	/*
	*  Fichero: axisrea047.jsp
	*
	*  Fecha: 29/06/2009
	*/
%>

<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}" />
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title><axis:alt f="axisrea047" c="axisrea047_TIT" lit="9001860" /></title>
<%-- Consulta de cesiones --%>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
<c:import url="../include/carga_framework_js.jsp" />

<style type="text/css">
.displayspace {
	width: 99.8%;
	height: expression(this.scrollHeight > 349 ? "350px" : "auto");
	max-height: 350px;
	overflow-x: hidden;
	overflow-y: auto;
	border: 1px solid #DDDDDD;
}

.tabla_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	border-collapse: collapse;
	width: 100%;
	border-top: none;
	border-left: none;
}

.td_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	padding: 0px;
	border-top: none;
	border-left: none;
}

.th_ {
	border: 1px solid #ddd;
	text-align: -webkit-center;
	border-top: none;
	border-left: none;
	padding: 0px;
	border-top: none;
	border-left: none;
}

.total {
	border: 1px solid #ddd;
	text-align: end;
	border-collapse: collapse;
	width: 100%;
}
</style>

<script type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		f_cargar_propiedades_pantalla();

	}

	function f_but_salir() {
		parent.f_cerrar_axisrea047();
	}
</script>
</head>

<body onload="f_onload()">
	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<form name="miForm" action="" method="POST">

		<c:import url="../include/titulo_nt.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea047" c="TITULO_NT1" lit="9910118" />
			</c:param>
			<%-- Consulta de cesiones --%>
			<c:param name="formulario">
				<axis:alt f="axisrea047" c="TITULO_NT2" lit="9910118" />
			</c:param>
			<%-- Consulta de cesiones --%>
			<c:param name="form">axisrea047</c:param>
		</c:import>
		<c:import url="../include/modal_estandar.jsp">
			<c:param name="nid_y_titulo">
                axisrea010|<axis:alt f="axisrea047" c="CERCADOR_TIT" lit="9001862" />
				<%-- Buscador de cesiones --%>#axisrea012|<axis:alt f="axisrea047" c="CES_X_RECIBO"
					lit="9001863" />
				<%-- Consulta datos de cesión por recibo --%>
			</c:param>
		</c:import>
		<input type="hidden" name="operation" value="" /> <input type="hidden" id="SSEGURO"
			name="SSEGURO" value="${__formdata.SSEGURO}" /> <input type="hidden" id="NPOLIZA" name="NPOLIZA"
			value="${__formdata.NPOLIZA}" /> <input type="hidden" id="TIPO_REA" name="TIPO_REA"
			value="${__formdata.TIPO_REA}" /> <input type="hidden" id="NCERTIF" name="NCERTIF"
			value="${__formdata.NCERTIF}" />
		<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><c:if
						test="${!empty requestScope.T_IAX_CESIONESREA && empty requestScope.__mensajes.m__clave}">
						<c:set var="resumen">
							<span class="titulocaja"
								style="color: black; font-weight: normal; padding-bottom: 2px; . vertical-align: bottom">
								<b><axis:alt f="axisrea047" c="N_POLIZA" lit="9001875" />:</b> ${__formdata.NPOLIZA} <b>
									<axis:alt f="axisrea047" c="N_CERTIF" lit="101096" />
							</b> ${__formdata.NCERTIF}
							</span>
						</c:set>
					</c:if>
					<div class="separador">&nbsp;</div>
					
					<c:set var="T1_C0" scope="session" value="none"/>
					<c:set var="T1_C1" scope="session" value="none"/>
					<c:set var="T1_C2" scope="session" value="none"/>
					<c:set var="T1_C3" scope="session" value="none"/>
					<c:set var="T1_C4" scope="session" value="none"/>
					<c:set var="T1_C5" scope="session" value="none"/>
					<c:set var="T1_C6" scope="session" value="none"/>
					<c:set var="T1_C7" scope="session" value="none"/>
					<c:set var="T1_C8" scope="session" value="none"/>
					
					<c:set var="T2_C0" scope="session" value="none"/>
					<c:set var="T2_C1" scope="session" value="none"/>
					<c:set var="T2_C2" scope="session" value="none"/>
					<c:set var="T2_C3" scope="session" value="none"/>
					<c:set var="T2_C4" scope="session" value="none"/>
					<c:set var="T2_C5" scope="session" value="none"/>
					<c:set var="T2_C6" scope="session" value="none"/>
					<c:set var="T2_C7" scope="session" value="none"/>
					<c:set var="T2_C8" scope="session" value="none"/>
					
					<c:set var="SUMT1_C0" scope="session" value="${0}"/>
					<c:set var="SUMT1_C1" scope="session" value="${0}"/>
					<c:set var="SUMT1_C2" scope="session" value="${0}"/>
					<c:set var="SUMT1_C3" scope="session" value="${0}"/>
					<c:set var="SUMT1_C4" scope="session" value="${0}"/>
					<c:set var="SUMT1_C5" scope="session" value="${0}"/>
					<c:set var="SUMT1_C6" scope="session" value="${0}"/>
					<c:set var="SUMT1_C7" scope="session" value="${0}"/>
					<c:set var="SUMT1_C8" scope="session" value="${0}"/>
					
					
					<c:set var="SUMT2_C0" scope="session" value="${0}"/>
					<c:set var="SUMT2_C1" scope="session" value="${0}"/>
					<c:set var="SUMT2_C2" scope="session" value="${0}"/>
					<c:set var="SUMT2_C3" scope="session" value="${0}"/>
					<c:set var="SUMT2_C4" scope="session" value="${0}"/>
					<c:set var="SUMT2_C5" scope="session" value="${0}"/>
					<c:set var="SUMT2_C6" scope="session" value="${0}"/>
					<c:set var="SUMT2_C7" scope="session" value="${0}"/>
					<c:set var="SUMT2_C8" scope="session" value="${0}"/>
					
					<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
						<c:if test="${ITEM.key==0}"><c:set var="T1_C0" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==1}"><c:set var="T1_C1" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==2}"><c:set var="T1_C2" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==3}"><c:set var="T1_C3" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==4}"><c:set var="T1_C4" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==5}"><c:set var="T1_C5" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==6}"><c:set var="T1_C6" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==7}"><c:set var="T1_C7" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==8}"><c:set var="T1_C8" scope="session" value=""/></c:if>
					</c:forEach>
					<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
						<c:if test="${ITEM.key==0}"><c:set var="T2_C0" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==1}"><c:set var="T2_C1" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==2}"><c:set var="T2_C2" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==3}"><c:set var="T2_C3" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==4}"><c:set var="T2_C4" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==5}"><c:set var="T2_C5" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==6}"><c:set var="T2_C6" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==7}"><c:set var="T2_C7" scope="session" value=""/></c:if>
						<c:if test="${ITEM.key==8}"><c:set var="T2_C8" scope="session" value=""/></c:if>
					</c:forEach>
					
					
 

					<div>
						<div class="titulo">
					      <b><axis:alt f="axisrea047" c="LIT_DSP_PERREL" lit="9901422"/></b>
					    </div>
						<table class="table_">
							<tr>
								<td rowspan="3" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
										f="axisrea047" c="TX" lit="9909989" /></td>
								<td colspan="5" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt
										f="axisrea047" c="TY" lit="9909990" /></td>
							</tr>
							<tr>
								<td style="width: 150px; display: ${T1_C0}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T1" lit="9909991" />
								</td>
								<td style="width: 150px;display: ${T1_C1}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T2" lit="9909992" />
								</td>
								<td style="width: 150px;display: ${T1_C2}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T3" lit="9909993" />
								</td>
								<td style="width: 150px;display: ${T1_C3}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T4" lit="9909994" />
								</td>
								<td style="width: 150px;display: ${T1_C4}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T4" lit="9910122" />
								</td>
								<td style="width: 150px;display: ${T1_C5}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T5" lit="9909995" />
								</td>
								<td style="width: 150px;display: ${T1_C6}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T6" lit="9910123" />
								</td>
								<td style="width: 150px;display: ${T1_C7}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T7" lit="9910124" />
								</td>
								<td style="width: 150px;display: ${T1_C8}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T8" lit="9910125" />
								</td>
							</tr>
							<tr>

								<td class="td_" style="display: ${T1_C0}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==0}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C1}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==1}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C2}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==2}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C3}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==3}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C4}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==4}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C5}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==5}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C6}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==6}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C7}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==7}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T1_C8}">
									<c:forEach items="${requestScope.MAP_PORCENTAJE}" var="ITEM">
										<c:if test="${ITEM.key==8}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
							</tr>
							
							<c:forEach items="${requestScope.MAP_DETALLE_L1}" var="ITEM">
								<tr>
									<td class="td_">${ITEM.key}</td>
									<td class="td_" style="display: ${T1_C0}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==0}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C0" scope="session" value="${SUMT1_C0 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C1}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==1}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C1" scope="session" value="${SUMT1_C1 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C2}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==2}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C2" scope="session" value="${SUMT1_C2 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C3}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==3}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C3" scope="session" value="${SUMT1_C3 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C4}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==4}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C4" scope="session" value="${SUMT1_C4 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C5}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==5}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C5" scope="session" value="${SUMT1_C5 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C6}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==6}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C3" scope="session" value="${SUMT1_C3 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C7}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==7}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C7" scope="session" value="${SUMT1_C7 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T1_C8}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==8}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}" /><c:set var="SUMT1_C8" scope="session" value="${SUMT1_C8 + SITEM.value}" /></c:if>											
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: end;"><b>TOTAL</b></td>
								<td style="text-align: center;display: ${T1_C0}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C0}" /></b></td>
								<td style="text-align: center;display: ${T1_C1}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C1}" /></b></td>
								<td style="text-align: center;display: ${T1_C2}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C2}" /></b></td>
								<td style="text-align: center;display: ${T1_C3}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C3}" /></b></td>
								<td style="text-align: center;display: ${T1_C4}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C4}" /></b></td>
								<td style="text-align: center;display: ${T1_C5}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C5}" /></b></td>
								<td style="text-align: center;display: ${T1_C6}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C6}" /></b></td>
								<td style="text-align: center;display: ${T1_C7}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C7}" /></b></td>
								<td style="text-align: center;display: ${T1_C8}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT1_C8}" /></b></td>								
							</tr>
						</table>
						<br /> <br />
						
						<div class="titulo">
					      <b><axis:alt f="axisrea047" c="LIT_DSP_PERREL" lit="102728"/></b>
					    </div>
						<table class="table_">
							<tr>
								<td rowspan="3" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="TX" lit="9909989" />
								</td>
								<td colspan="5" class="sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="TY" lit="9909996" />
								</td>
							</tr>
							<tr>
								<td style="width: 150px; display: ${T2_C0}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T1" lit="9909991" />
								</td>
								<td style="width: 150px; display: ${T2_C1}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T2" lit="9909992" />
								</td>
								<td style="width: 150px; display: ${T2_C2}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T3" lit="9909993" />
								</td>
								<td style="width: 150px; display: ${T2_C3}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T4" lit="9909994" />
								</td>
								<td style="width: 150px; display: ${T2_C4}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T4" lit="9910122" />
								</td>
								<td style="width: 150px; display: ${T2_C5}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T5" lit="9909995" />
								</td>
								<td style="width: 150px;display: ${T1_C6}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T6" lit="9910123" />
								</td>
								<td style="width: 150px;display: ${T1_C7}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T7" lit="9910124" />
								</td>
								<td style="width: 150px;display: ${T1_C8}" class="td_ sortable gridsortable gridsorted gridasc">
									<axis:alt f="axisrea047" c="T8" lit="9910125" />
								</td>
							</tr>
							<tr>

								<td class="td_" style="display: ${T2_C0}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==0}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C1}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==1}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C2}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==2}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C3}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==3}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C4}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==4}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C5}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==5}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C6}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==6}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C7}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==7}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
								<td class="td_" style="display: ${T2_C8}">
									<c:forEach items="${requestScope.MAP_PORCENTAJEL2}" var="ITEM">
										<c:if test="${ITEM.key==8}">${ITEM.value}%</c:if>
									</c:forEach>
								</td>
							</tr>
							<c:forEach items="${requestScope.MAP_DETALLE_L2}" var="ITEM">
								<tr>
									<td class="td_">${ITEM.key}</td>
									<td class="td_" style="display: ${T2_C0}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==0}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C0" scope="session" value="${SUMT2_C0 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C1}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==1}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C1" scope="session" value="${SUMT2_C1 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C2}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==2}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C2" scope="session" value="${SUMT2_C2 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C3}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==3}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C3" scope="session" value="${SUMT2_C3 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C4}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==4}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C4" scope="session" value="${SUMT2_C4 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C5}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==5}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C5" scope="session" value="${SUMT2_C5 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C6}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==6}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C6" scope="session" value="${SUMT2_C6 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C7}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==7}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C7" scope="session" value="${SUMT2_C7 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
									<td class="td_" style="display: ${T2_C8}">
										<c:forEach items="${ITEM.value}" var="SITEM">
											<c:if test="${SITEM.key==8}"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SITEM.value}"/><c:set var="SUMT2_C8" scope="session" value="${SUMT2_C8 + SITEM.value}" /></c:if>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: end;"><b>TOTAL</b></td>
								<td style="text-align: center;display: ${T2_C0}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C0}" /></b></td>
								<td style="text-align: center;display: ${T2_C1}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C1}" /></b></td>
								<td style="text-align: center;display: ${T2_C2}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C2}" /></b></td>
								<td style="text-align: center;display: ${T2_C3}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C3}" /></b></td>
								<td style="text-align: center;display: ${T2_C4}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C4}" /></b></td>
								<td style="text-align: center;display: ${T2_C5}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C5}" /></b></td>
								<td style="text-align: center;display: ${T2_C6}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C6}" /></b></td>
								<td style="text-align: center;display: ${T2_C7}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C7}" /></b></td>
								<td style="text-align: center;display: ${T2_C8}"><b><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${SUMT2_C8}" /></b></td>								
							</tr>
						</table>
						<br /> <br />
						<table class="table_">
							<tr>
								<!--INI - AXIS 4448 - SE AJUSTA TABLA DE DETALLE DE FACULTATIVO-->
                                <!-- INICIO INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
								<td colspan="13" class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="TP"
										lit="9909997" />
                                </td>
                                <!-- FIN INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
							</tr>
							<!--Inicio IAXIS-14737 19/01/2021 -->
							<tr>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="TP"
										lit="89908090" />
                                </td>
                                <td class="td_">${requestScope.NCESFAC} </td>
							</tr>
							<!--Fin IAXIS-14737 19/01/2021 -->
							<tr>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T1"
										lit="9909998" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T2"
										lit="9909999" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T3"
										lit="9910000" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T4"
										lit="9910001" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T5"
										lit="9910021" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T6"
										lit="9910002" /></td>
                                <!-- INICIO INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T10"
										lit="9001917" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T10"
										lit="9000608" /></td>
								<!-- INICIO INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T7"
										lit="89908056" /></td>
                                <!-- FIN INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T7"
										lit="89908057" /></td>
								<!-- FINAL INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T11"
										lit="9901180" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T8"
										lit="9910004" /></td>
								<td class="td_ sortable gridsortable gridsorted gridasc"><axis:alt f="axisrea047" c="T9"
										lit="9910005" /></td>
							</tr>
							<c:forEach items="${requestScope.MREA}" var="ITEM">
								<tr>
									<td class="td_">${ITEM.ASEGURADOR} </td>
									<td class="td_">${ITEM.PORCENTAJE}%</td>
									<td class="td_">${ITEM.VALORASEG}</td>
									<td class="td_">${ITEM.IMPCESION} </td>
									<td class="td_">${ITEM.COMISION}%</td>
									<td class="td_">${ITEM.VALCOMI}</td>
									<td class="td_">${ITEM.RETENCION}%</td>
                                    <!-- INICIO INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
                                    <td class="td_">${ITEM.RETENCIONREA}%</td>
                                    <!-- FIN INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
									<td class="td_">${ITEM.RETENIDO}</td>
									<!-- INICIO INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
									<td class="td_">${ITEM.RETENIDOREA}</td>
									<!-- FINAL INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
									<td class="td_">${ITEM.RETEFUENTE}</td>
									<td class="td_">${ITEM.SALDO}</td>
									<td class="td_">${ITEM.FGARPRI}</td>
								</tr>
							</c:forEach>
							<c:forEach items="${requestScope.LREADET}" var="ITEM">
								<tr>
									<td class="td_"><b><axis:alt f="axisrea047" c="TH"
										lit="9909984" /></b></td>
									<td class="td_"><b>${ITEM.PORCENTAJE}%</b></td>
									<td class="td_"><b>${ITEM.VALORASEG}</b></td>
									<td class="td_"><b>${ITEM.IMPCESION}</b></td>
									<td class="td_"></td>
									<td class="td_"><b>${ITEM.VALCOMI}</b></td>
									<td class="td_"></td>
                                    <!-- INICIO INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
                                    <td class="td_"></td>
                                    <!-- FIN INFORCOL 04-04-2020 Reaseguro - Ajuste retencion local y retencion reasegurador -->
									<td class="td_"><b>${ITEM.RETENIDO}</b></td>
									<!-- INICIO INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
									<td class="td_"><b>${ITEM.RETENIDOREA}</b></td>
									<!-- FINAL INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
									<td class="td_"><b>${ITEM.RETEFUENTE}</b></td>
									<td class="td_"><b>${ITEM.SALDO}</b></td>
									<td class="td_"></td>
								</tr>
							</c:forEach>
							<!--FIN - AXIS 4448 - SE AJUSTA TABLA DE DETALLE DE FACULTATIVO-->
						</table>


					</div></td>
			</tr>
		</table>


		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axisrea047</c:param>
			<c:param name="f">axisrea047</c:param>
			<c:param name="__botones">salir</c:param>
		</c:import>

	</form>

	<c:import url="../include/mensajes.jsp" />

</body>
</html>