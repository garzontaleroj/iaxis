<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>


 
      <axis:visible f="${pantalla}" c="DSP_AGENDA">
                                                <tr>
                                                    <td class="campocaja" colspan="4">
                                                    	<div class="separador">&nbsp;</div>  
                                                      <div style="float:left;">
                                                        <img id="DSP_AGENDA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_AGENDA', this)" style="cursor:pointer"/>
                                                        <b><axis:alt f="${pantalla}" c="DSP_AGENDA_LIT" lit="9001769"/></b>
                                                        </div>
                                                        <axis:visible c="BT_ALTA_AGENDA" f="${pantalla}">
                                                        <div style="float:right;">
                                                            <a href="javascript:f_gestioagenda('',0)"><img border="0" alt="<axis:alt f="${pantalla}" c="AGENDA_LIT" lit="9001332"/>" title="<axis:alt f="${pantalla}" c="AGENDA_LIT" lit="9001332"/>" src="images/new.gif"/></a>
                                                        </div>
                                                        </axis:visible>
                                                        <div style="clear:both;">
                                                        <hr class="titulo">
                                                        </div>
                                                    </td>
                                                </tr>                                                                  
                                            
                                            
                                    
                                    <tr id="DSP_AGENDA_children" style="display:none">
                                        <td class="campocaja" colspan="4">
                                        <c:set var="title0"><axis:alt f="${pantalla}" c="NPOLIZA" lit="100624"/></c:set> <!-- póliza -->
                                        <c:set var="title1"><axis:alt f="${pantalla}" c="NLINEA" lit="9001189"/></c:set> <!-- Nº apunte -->
                                        <c:set var="title2"><axis:alt f="${pantalla}" c="TTIPREG" lit="9000715"/></c:set> <!-- Concepto -->
                                        <c:set var="title3"><axis:alt f="${pantalla}" c="TTIPLIN" lit="9001195"/></c:set> <!-- Tipo apunte -->
                                        <c:set var="title4"><axis:alt f="${pantalla}" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                                        <c:set var="title5"><axis:alt f="${pantalla}" c="TTITULO" lit="9001196"/></c:set> <!-- Título apunte -->
                                        <c:set var="title6"><axis:alt f="${pantalla}" c="TTEXTLIN" lit="9001197"/></c:set> <!-- Texto apunte -->
                                        <c:set var="title7"><axis:alt f="${pantalla}" c="CUSUALT" lit="100894"/></c:set> <!-- Usuario -->
                                        <c:set var="title8"><axis:alt f="${pantalla}" c="TESTADO" lit="100587"/></c:set> <!-- Estado -->
                                        <c:set var="title9"><axis:alt f="${pantalla}" c="FFINALI" lit="9001198"/></c:set> <!-- Fecha finalización -->
                                        <c:set var="title10"><axis:alt f="${pantalla}" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                                        <c:set var="title11"><axis:alt f="${pantalla}" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->
                    
                                         <div class="displayspace">
                    
                                            <display:table name="${__formdata.PLSTAGENDA}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable"  pagesize="-1"
                                            requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_AGENDA" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                    
                                             <axis:visible f="${pantalla}" c="IDOBS">
                                            <display:column title="${title1}" sortable="true" sortProperty="IDOBS" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">${LISTAAPUNTESAGENDA['IDOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="IDOBS">
                                            <display:column title="${title2}" sortable="true" sortProperty="TTIPOBS" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTIPOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="TTITOBS">
                                            <display:column title="${title5}" sortable="true" sortProperty="TTITOBS" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTITOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="FALTA">
                                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FALTA']}"/></div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="CUSUALT">
                                            <display:column title="${title7}" sortable="true" sortProperty="CUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['CUSUALT']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="TESTOBS">
                                            <display:column title="${title8}" sortable="true" sortProperty="TESTOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TESTOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="BT_CONS_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="${pantalla}" c="CONSULTA_AGD" lit="9001218"/>" title1="<axis:alt f="${pantalla}" c="CONSULTA_AGD" lit="9001218"/>" src="images/mas.gif"
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}','1')"/></div>
                                             </display:column>
                                            </axis:visible>
                                           <axis:visible f="${pantalla}" c="BT_EDIT_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                             <c:if test="${LISTAAPUNTESAGENDA['CESTOBS'] != 1}">
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="${pantalla}" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}','0')"/></div>
                                             </c:if>
                                             </display:column>
                                            </axis:visible>
                                             <axis:visible f="${pantalla}" c="BT_BORRAR_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="${pantalla}" c="ELIMINAR_AGD" lit="9001333"/>" title1="<axis:alt f="axissin006" c="ELIMINAR_AGD" lit="9001333"/>" src="images/delete.gif"
                                                 style="cursor:pointer;" onclick="f_borrar_agenda('${LISTAAPUNTESAGENDA['IDOBS']}')"/></div>
                                             </display:column>
                                              </axis:visible>
                                            </display:table>
                                        </div>
                    
                                        </td>
                                    </tr>
                       
                                



                        
                        </axis:visible>
    



