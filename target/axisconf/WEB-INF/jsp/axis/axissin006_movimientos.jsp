<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="movimientos"/>

<script type="text/javascript">
   
    
</script>

<form name="${nombrePantalla}" action="" method="POST">  

                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">



                                    <c:set var="title0"><axis:alt f="axissin006" c="NMOVSIN" lit="800440" /></c:set><!-- Nº -->
                                    <c:set var="title1"><axis:alt f="axissin006" c="TESTSIN" lit="100587" /></c:set><!-- Numero mov -->
                                    <c:set var="title2"><axis:alt f="axissin006" c="FESTSIN" lit="100562" /><axis:alt f="axissin006" c="FESTSIN_01" lit="100587" /></c:set> <!-- Fecha estado -->
                                    <c:set var="title3"><axis:alt f="axissin006" c="TCAUEST" lit="102107" /></c:set><!-- Causa estado -->
                                    <c:set var="title4"><axis:alt f="axissin006" c="TUNITRA" lit="9000900" /></c:set><!-- Unidad tramitacion -->
                                    <c:set var="title5"><axis:alt f="axissin006" c="TTRAMITAD" lit="140769" /></c:set><!-- Tramitador -->
                                    	<c:set var="title6"><axis:alt f="axissin006" c="MOV_CUSUALT" lit="100894" /></c:set><!-- uSUARIO -->
                                    
                                    <div class="displayspace">
                                          <display:table name="${__formdata.OB_IAX_SINIESTRO.MOVIMIENTOS}" id="T_IAX_MOVIMIENTOS" export="false" class="dsptgtable" pagesize="-1"  cellpadding="0" cellspacing="0"
                                           requestURI="">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.NSINIES" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspNumber">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.NMOVSIN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.TESTSIN" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.TESTSIN}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.FESTSIN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.FESTSIN}"/></div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.TCAUEST" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.TCAUEST}</div>
                                            </display:column>
                                            <axis:visible f="axissin006" c="MOV_TUNITRA">
                                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.TUNITRA" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.TUNITRA}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="MOV_TTRAMITAD">
                                            <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.TTRAMITAD" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.TTRAMITAD}</div>
                                            </display:column>  
                                            </axis:visible>
                                            
                                             <axis:visible f="axissin006" c="MOV_CUSUALT">
                                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_MOVIMIENTOS.CUSUALT" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${T_IAX_MOVIMIENTOS.OB_IAX_SIN_MOVSINIESTRO.CUSUALT}</div>
                                            </display:column>  
                                            </axis:visible>
                                            
                                            
                                        </display:table>
                                        </div>
                            </td>
                        </tr>
                        </table>
                  
</form>