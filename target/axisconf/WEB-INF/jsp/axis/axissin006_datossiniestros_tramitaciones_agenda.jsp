<%/* Revision:# c1kklpqnyt41F16BjdFG0w== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="tramitaciones_agenda"/>

<script type="text/javascript">
   
    
    
</script>

<form name="${nombrePantalla}" action="" method="POST">                      
                        
                        				<c:set var="title0"><axis:alt f="axissin006" c="NPOLIZA" lit="100624"/></c:set> <!-- pÃ³liza -->
                                        <c:set var="title1"><axis:alt f="axissin006" c="IDOBS" lit="9001189"/></c:set> <!-- NÂº apunte -->
                                        <c:set var="title2"><axis:alt f="axissin006" c="TCONOBS" lit="9000715"/></c:set> <!-- Concepto -->
										<c:set var="title14"><axis:alt f="axissin006" c="TTIPAPUNTE" lit="9000908" /></c:set> <!-- Tipo tramitacion -->
                                        <c:set var="title3"><axis:alt f="axissin006" c="TTIPOBS" lit="9001195"/></c:set> <!-- Tipo apunte -->
                                        <c:set var="title4"><axis:alt f="axissin006" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                                        <c:set var="title5"><axis:alt f="axissin006" c="TTITULO_AGD_TRAMITA" lit="9001196"/></c:set> <!-- TÃ­tulo apunte -->
                                        <c:set var="title6"><axis:alt f="axissin006" c="TTEXTLIN" lit="9001197"/></c:set> <!-- Texto apunte -->
                                        <c:set var="title7"><axis:alt f="axissin006" c="CUSUALT" lit="100894"/></c:set> <!-- Usuario -->
                                        <c:set var="title8"><axis:alt f="axissin006" c="TUSUALT" lit="100894"/></c:set> <!-- Usuario -->
                                        <c:set var="title9"><axis:alt f="axissin006" c="TESTADO" lit="100587"/></c:set> <!-- Estado -->
                                        <c:set var="title10"><axis:alt f="axissin006" c="FFINALI" lit="9001198"/></c:set> <!-- Fecha finalizaciÃ³n -->
                                        <c:set var="title11"><axis:alt f="axissin006" c="TUSUFIN" lit="9909659"/></c:set> <!-- Usuario finalizaciÃ³n -->
                                        <c:set var="title12"><axis:alt f="axissin006" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                                        <c:set var="title13"><axis:alt f="axissin006" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->
                    
                                         <div class="displayspace">
                    
                                            <display:table name="${__formdata.PLSTAGENDA_TRAMI}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable"  pagesize="-1"
                                            requestURI="axis_axissin006.do?paginar=true&subseccion=DSP_AGENDA" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                    
                                             <axis:visible f="axissin006" c="IDOBS">
                                            <display:column title="${title1}" sortable="true" sortProperty="IDOBS" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">${LISTAAPUNTESAGENDA['IDOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="TCONOBS">
                                            <display:column title="${title2}" sortable="true" sortProperty="TTIPOBS" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TCONOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                        
					                        <axis:visible c="TTIPAPUNTE" f="axissin006">
					                            <display:column title="${title14}" sortable="true" sortProperty="TTIPAPUNTE" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
					                                <div class="dspText" align="center">${LISTAAPUNTESAGENDA['NTRAMIT']}</div>
					                            </display:column>
					                        </axis:visible>

                                            <axis:visible f="axissin006" c="TTIPOBS">
                                            <display:column title="${title3}" sortable="true" sortProperty="TTIPOBS" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTIPOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axissin006" c="TTITOBS">
                                            <display:column title="${title5}" sortable="true" sortProperty="TTITOBS" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTITOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axissin006" c="FALTA">
                                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FALTA']}"/></div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axissin006" c="CUSUALT">
                                            <display:column title="${title7}" sortable="true" sortProperty="CUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['CUSUALT']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="TUSUALT">
                                            <display:column title="${title8}" sortable="true" sortProperty="TUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TUSUALT']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axissin006" c="TESTOBS">
                                            <display:column title="${title9}" sortable="true" sortProperty="TESTOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TESTOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="FFINALI">
                                            <display:column title="${title10}" sortable="true" sortProperty="FFINALI" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['FFINALI']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin006" c="TUSUFIN">
                                            <display:column title="${title11}" sortable="true" sortProperty="TUSUFIN" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TUSUFIN']}</div>
                                            </display:column>
                                            </axis:visible>
                                              <axis:visible f="axissin006" c="BT_CONS_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                                 <div class="dspIcons" id="BT_CONS_AGENDA" align="left"><img border="0" alt="<axis:alt f="axissin006" c="CONSULTA_AGD" lit="9001218"/>" title1="<axis:alt f="axissin006" c="CONSULTA_AGD" lit="9001218"/>" src="images/mas.gif"
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}',5,'1')"/></div>
                                             </display:column>
                                            </axis:visible>
               								<axis:visible f="axissin006" c="BT_SIN_EDITAR"> 
                        						<axis:visible f="axissin006" c="BT_EDIT_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                             <c:if test="${LISTAAPUNTESAGENDA['CESTOBS'] != 1}">
                                                 <div class="dspIcons" id="BT_SIN_EDITAR" align="left"><img border="0" alt="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}',5,0)"/></div>
                                             </c:if>
                                             </display:column>
                                             </axis:visible>
                            									 </axis:visible>
                           									  <axis:visible f="axissin006" c="BT_SIN_DELETE"> 
                           					<axis:visible f="axissin006" c="BT_BORRAR_AGENDA_TRAMITA"><!-- IAXIS-4887 -->
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                                 <div class="dspIcons" id="BT_SIN_DELETE" align="left"><img border="0" alt="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/delete.gif"
                                                 style="cursor:pointer;" onclick="f_borrar_agenda('${LISTAAPUNTESAGENDA['IDOBS']}')"/></div>
                                             </display:column>
                                             </axis:visible>
                                              </axis:visible>
                                             
                                            </display:table>
                                        </div>
               <axis:visible c="DSP_TAREAS_TRAMITACION" f="axissin006">
                <div class="separador">&nbsp;</div> 
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_TAREAS_TRAMITACION_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TAREAS_TRAMITACION', this)" style="cursor:pointer"/>
                        <b><axis:alt f="axissin006" c="DSP_TAREAS_TRAMITACION_LIT" lit="9909671"/></b>
                        </div>
                        
                        <axis:visible c="BT_SIN_NUEVO_AGD_TRAM" f="axissin006">
                        <div style="float:right;" id="BT_SIN_NUEVO_AGD_TRAM">
                            <a href="javascript:f_agd_gestioagenda_alta_tramit(null,'${miListaId['IDAGENDA']}','ALTA_CONS')"><img border="0" alt="<axis:alt f="axissin006" c="AGENDA_LIT" lit="9901437"/>" title="<axis:alt f="axissin006" c="AGENDA_LIT" lit="9901437"/>" src="images/agenda.gif"/></a>
                        </div>
                        </axis:visible>
                        
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>
                </tr>
                
                <tr id="DSP_TAREAS_TRAMITACION_children" style="display:none">
                    <td class="campocaja" >
                    <c:set var="title1"><axis:alt f="axissin006" c="IDAPUNTE" lit="9001189"/></c:set> <!-- NÂº apunte -->
                    <c:set var="title2"><axis:alt f="axissin006" c="TCONAPU" lit="9000715"/></c:set> <!-- Concepto -->
                    <c:set var="title3"><axis:alt f="axissin006" c="TTITAPU" lit="9001196"/></c:set> <!-- Tipo apunte -->
                    <c:set var="title4"><axis:alt f="axissin006" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                    <c:set var="title6"><axis:alt f="axissin006" c="CUSUARI" lit="100894"/></c:set> <!-- Usuario -->
                    <c:set var="title7"><axis:alt f="axissin006" c="TASIGNADOAPU" lit="9909663"/></c:set> <!-- Usuario destinatario-->
                    <c:set var="title8"><axis:alt f="axissin006" c="TESTAPU" lit="100587"/></c:set> <!-- Estado -->
                    <c:set var="title9"><axis:alt f="axissin006" c="FESTAPU" lit="9901964"/></c:set> <!-- Fecha Apunte -->
                    <c:set var="title10"><axis:alt f="axissin006" c="FFINALIAPU" lit="9001198"/></c:set> <!-- Fecha finalizacion -->
                    <c:set var="title11"><axis:alt f="axissin006" c="TUSUFINAPU" lit="9909659"/></c:set> <!-- Usuario finalizacion -->
                    <c:set var="title12"><axis:alt f="axissin006" c="BT_EDIT_TRAM" lit="9000552"/></c:set> <!-- Modificar -->
                    <c:set var="title13"><axis:alt f="axissin006" c="BT_MASDATOS_TRAM" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->

                     <div class="displayspace">

                        <display:table name="${lstagdagenda_tram}" id="miListaId" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_axissin006.do?paginar=true&subseccion=DSP_TAREAS_USUARIO" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>

                        <%--  --%>
                        <axis:visible c="IDAPUNTE" f="axissin006">
                            <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['IDAPUNTE']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TCONAPU" f="axissin006">
                            <display:column title="${title2}" sortable="true" sortProperty="TCONAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TCONAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="TTITAPU" f="axissin006">
                            <display:column title="${title3}" sortable="true" sortProperty="TTITAPU" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TTITAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="FALTA" f="axissin006">
                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/></div>
                            </display:column>
                        </axis:visible>
			<!---IAXIS-2134 AABC 04/04/2019 CAMBIO DE USUARIO --->
                        <axis:visible c="CUSUARI" f="axissin006">
                            <display:column title="${title6}" sortable="true" sortProperty="CUSUARI" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['CUSUALT']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TASIGNADOAPU" f="axissin006">
                            <display:column title="${title7}" sortable="true" sortProperty="TASIGNADOAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TDESTINO']} - ${miListaId['TDESCGRUPO']}</div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TESTAPU" f="axissin006">
                            <display:column title="${title8}" sortable="true" sortProperty="TESTAPU" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TESTAPU']}</div>
                            </display:column>
                        </axis:visible>    
                        <axis:visible c="FESTAPU" f="axissin006">
                            <display:column title="${title9}" sortable="true" sortProperty="FESTAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FESTAPU']}"/></div>
                            </display:column>
                        </axis:visible> 
                        <axis:visible c="FFINALIAPU" f="axissin006">
                            <display:column title="${title10}" sortable="true" sortProperty="FFINALIAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">
                                	<c:if test="${miListaId['CESTAPU']==1}">
                                                ${miListaId['FESTAPU']}
                                    </c:if>
                                </div>
                            </display:column>
                        </axis:visible>
                        <axis:visible c="TUSUFINAPU" f="axissin006">
                            <display:column title="${title11}" sortable="true" sortProperty="TUSUFINAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TUSUFINAPU']}</div>
                            </display:column>
                        </axis:visible>   
                       <!----------------------------------------------------------------------------------------------------------------------------------------------------->
                       <axis:visible f="axissin006" c="BT_SIN_EDITAR_TRAM">
                         <display:column title="${title12}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                         <c:if test="${miListaId['CESTAPU'] != 1 || __configform.axissin006__AGENDACESTADOFINALIZADO__visible == 'true'}">
                             <div class="dspIcons" align="left" id="BT_SIN_EDITAR_TRAM"><img border="0" alt="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axissin006" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                             style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','MODIF_AGEN')"/></div>
                         </c:if>
                         </display:column>
                        </axis:visible>
                        
                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                        <!-- Ara no Ã©s el botÃ³ de mÃ©s dades, Ã©s Detall. -->
                        <!-- <div class="dspIcons"><img border="0" alt="" title1="" src="images/mes.gif" width="11px" height="11px"
                             style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"  />
                        -->
                        <axis:visible f="axissin006" c="BT_SIN_CONSULTAR_TRAM">
                             <display:column title="${title13}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axissin006" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" title1="<axis:alt f="axissin006" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','CONSULTA')"  />
                                </div>
                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                        </axis:visible>
                           
                        </display:table>
                    </div>

                    </td>
                </tr>

</axis:visible>
</form>