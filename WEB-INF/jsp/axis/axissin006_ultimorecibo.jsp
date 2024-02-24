<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>      
   
<c:set var="nombrePantalla" value="utlimorecibo"/>

<script type="text/javascript">
   
    
</script>

<form name="${nombrePantalla}" action="" method="POST">   
    <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                <!-- DisplayTag último recibo -->
                                <c:set var="title0"><axis:alt f="axissin006" c="NRECIBO" lit="100895"/></c:set>
                                <c:set var="title1"><axis:alt f="axissin006" c="FEFECTO_ULTREC" lit="100883"/></c:set>
                                <c:set var="title2"><axis:alt f="axissin006" c="FVENCIM" lit="100885"/></c:set>
                                <c:set var="title3"><axis:alt f="axissin006" c="ICONCEP" lit="100563"/></c:set>
                                <c:set var="title4"><axis:alt f="axissin006" c="TTIPREC" lit="102302"/></c:set>
                                <c:set var="title5"><axis:alt f="axissin006" c="TESTREC" lit="100874"/></c:set>
                                <axis:visible c="TCESTIMP" f="axissin006"> 
                                <c:set var="title6"><axis:alt f="axissin006" c="TCESTIMP" lit="9902593"/></c:set>
                                </axis:visible>
                                <div class="displayspace">
                                    <display:table name="${__formdata.T_IAX_LASTRECIBO}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin006.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%> 
                                        <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId.NRECIBO}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEFECTO}"/></div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="FVENCIM" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVENCIM}"/></div>
                                        </display:column>                                            
                                        <display:column title="${title3}" sortable="true" sortProperty="ICONCEP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${miListaId.ICONCEP}"/></div>
                                        </display:column>                                                                                        
                                        <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.TTIPREC}</div>
                                        </display:column>                                                                                                                                    
                                        <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div <c:if test="${miListaId['CESTREC']==0}">class="dspTextAviso"</c:if> <c:if test="${miListaId['CESTREC']!=0}">class="dspText"</c:if>>${miListaId['TESTREC']}</div>
                                        </display:column>  
                                        <axis:visible c="TCESTIMP" f="axissin006"> 
                                       <display:column title="${title6}" sortable="true" sortProperty="TCESTIMP" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TCESTIMP']}</div>
                                        </display:column> 
                                        </axis:visible>
                                    </display:table>
                                </div>
                             </td>
                        </tr>
                        <tr>
                            <td style="text-align:right">
                                 <div class="separador">&nbsp;</div>
                                 <input type="button" class="boton" id="but_mas_recibos" value="<axis:alt f="axissin006" c="BUT_MAS_RECIBOS" lit="1000232" />" onclick="f_abrir_axissin004()" />
                            </td>
                        </tr>
                       </td>
                    </tr>
                </table>
             </table>
</form>