<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


                                    
                                    
                                    <c:set var="title1"><axis:alt f="axisage007" c="IDAPUNTE" lit="9001189"/></c:set> <!-- Nº apunte -->
                                    <c:set var="title2"><axis:alt f="axisage007" c="TCONAPU" lit="9000715"/></c:set> <!-- Concepto -->
                                    <c:set var="title3"><axis:alt f="axisage007" c="TTITAPU" lit="9001196"/></c:set> <!-- Tipo apunte -->
                                    <c:set var="title4"><axis:alt f="axisage007" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                                    <c:set var="title6"><axis:alt f="axisage007" c="CUSUARI" lit="100894"/></c:set> <!-- Usuario -->
                                    <c:set var="title7"><axis:alt f="axisage007" c="TESTAPU" lit="100587"/></c:set> <!-- Estado -->
                                    <c:set var="title8"><axis:alt f="axisage007" c="FESTAPU" lit="9901964"/></c:set> <!-- Fecha Apunte -->
                                    <c:set var="title9"><axis:alt f="axisage007" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                                    <c:set var="title10"><axis:alt f="axisage007" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->
                
                                     <div class="displayspace">
                
                                        <display:table name="${lstagdagenda}" id="miListaId" export="false" class="dsptgtable"  pagesize="-1"
                                        requestURI="axis_axisage007.do?paginar=true&subseccion=DSP_TAREAS_USUARIO" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>
                
                                        <%--  --%>
                                        <axis:visible c="IDAPUNTE" f="axisage007">
                                            <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['IDAPUNTE']}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="TCONAPU" f="axisage007">
                                            <display:column title="${title2}" sortable="true" sortProperty="TCONAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TCONAPU']}</div>
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible c="TTITAPU" f="axisage007">
                                            <display:column title="${title3}" sortable="true" sortProperty="TTITAPU" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TTITAPU']}</div>
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible c="FALTA" f="axisage007">
                                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="CUSUARI" f="axisage007">
                                            <display:column title="${title6}" sortable="true" sortProperty="CUSUARI" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['CUSUARI']}</div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="TESTAPU" f="axisage007">
                                            <display:column title="${title7}" sortable="true" sortProperty="TESTAPU" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TESTAPU']}</div>
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible c="FESTAPU" f="axisage007">
                                            <display:column title="${title8}" sortable="true" sortProperty="FESTAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FESTAPU']}"/></div>
                                            </display:column>
                                        </axis:visible>    
                                       <!----------------------------------------------------------------------------------------------------------------------------------------------------->
                                       <axis:visible f="axisage007" c="BT_SIN_EDITAR_AGD">
                                         <display:column title="${title9}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                         <c:if test="${miListaId['CESTAPU'] != 1 || __configform.axisctr020__AGENDACESTADOFINALIZADO__visible == 'true'}">
                                             <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axisage007" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axisage007" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                                             style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','MODIF_AGEN')"/></div>
                                         </c:if>
                                         </display:column>
                                        </axis:visible>
                                        
                                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                                        <!-- Ara no és el botó de més dades, és Detall. -->
                                        <!-- <div class="dspIcons"><img border="0" alt="" title1="" src="images/mes.gif" width="11px" height="11px"
                                             style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"  />
                                        -->
                                        <axis:visible f="axisage007" c="BT_SIN_CONSULTAR_AGD">
                                             <display:column title="${title10}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisage007" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" title1="<axis:alt f="axisage007" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                style="cursor:pointer;"   onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','CONSULTA')"  />
                                                </div>
                                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                                        </axis:visible>
                                           
                                        </display:table>
                                        </div>
 
