
<%
	/* Revision:# yw/ItbzfYYv27Y2bGxAaGw== # */
%>
<%
	/***Fichero: axisctr148.jsp,Autos*/
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>


<table class="seccion">
	<tr>
		<th style="width: 4%; height: 0px"></th>
		<th style="width: 21%; height: 0px"></th>
		<th style="width: 21%; height: 0px"></th>
		<th style="width: 22%; height: 0px"></th>
		<th style="width: 20%; height: 0px"></th>
	</tr>
	<tr>
		<td>&nbsp;</td>

		<axis:ocultar f="axisper010" c="CIR037" dejarHueco="false">
				<td class="titulocaja"><b><axis:alt f="axisper010"
							c="CIR037" lit="89908126" /></b></td>
		</axis:ocultar>
	</tr>
	<tr>
		<td>&nbsp;</td>
		
		<axis:ocultar c="CIR037" f="axisper010" dejarHueco="false">
			
				<td class="campocaja"><select
					title="<axis:alt f="axisper010" c="CIR037" lit="89908126"/>"
					name="CIR037" id="CIR037" size="1"
					class="campowidthselect campo campotexto"
					onchange="f_cir037(this.value)"
					style="width: 90%;"
					<axis:atr f="axisper010" c="CIR037" a="obligatorio=false"/>
					<c:if test="${!empty __formdata.SPEREAL && !empty __formdata.CIR037}"> disabled </c:if> > &nbsp;
						<option value="<%=Integer.MIN_VALUE%>">-
							<axis:alt f="axisper010" c="SNV_COMBO" lit="1000348"/> 
							 -
						</option>
						<c:forEach var="element" items="${__formdata.listValores.lstCircular037}" >
							<option value="${element.CATRIBU}"
								<c:if test="${element.CATRIBU == __formdata.CIR037}"> selected </c:if> >
                                                        ${element.TATRIBU} 
                            </option>
						</c:forEach>
				</select></td>
		</axis:ocultar>
	</tr>

</table>