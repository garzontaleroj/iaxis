<%/* Revision:# T0OUczhE3w1ftDhO66ej9g== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>

                        <!--  ******************************************  procesos carga fichero ************************************ -->
                        <axis:visible f="axisadm003" c="DSP_CARGAPROCESO">
                        <tr>
                        <td align="left">
                                    <table class="area" align="center">
                                    <%-- MOVIMIENTOS RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="procesos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('procesos_recibo', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisadm003" c="procesos_parent" lit="9900748"/></b>
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                                
                                    <tr id="procesos_recibo_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <div class="displayspace">
                                                               <c:set var="title0"><axis:alt f="axisadm003" c="CARGAPROCESO_LIT1" lit="1000576"/></c:set>
                                                                <display:table name="${carga_fichero_datos}" id="lista_fichero" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                            requestURI="axis_axisadm003.do?paginar=true&tabla=tomador"> 
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">${lista_fichero.LINEA}</div>
                                                                    </display:column>
                                                                </display:table>    
                                                        </div> 
                                                    </td>
                                                 </tr>
                                            </table>
                                        </td>
                                        </tr>
                                    </table>
                                </td>    
                                                           
                        </tr>
                        </axis:visible>
                        
                          <!--  ******************************************  LIQUIDACIONES DEL RECIBO ************************************ -->
                        <axis:visible f="axisadm003" c="DSP_LIQREC">
                        <c:if test="${!empty __formdata.LSTLIQREC}">
                        <tr>
                        <td align="left">
                                    <table class="area" align="center">
                                    <%-- MOVIMIENTOS RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="liqrec_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('liqrec', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisadm003" c="LIQREC" lit="9002265"/></b>
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                                
                                    <tr id="liqrec_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <div class="displayspace">
                                                                <c:set var="title0"><axis:alt f="axisadm003" c="NPROCESO" lit="9000493"/></c:set>   <%-- Núm proceso --%>
                                                                 <c:set var="title2"><axis:alt f="axisadm003" c="MESANO" lit="100562"/></c:set>  <%-- Mes/año --%>
                                                                <c:set var="title3"><axis:alt f="axisadm003" c="OBSER" lit="101162"/></c:set>   <%-- Observaciones --%>
                                                                <c:set var="title4"><axis:alt f="axisadm003" c="FINILIQ" lit="9000526"/></c:set>   <%-- Fecha inicio --%>
                                                                <c:set var="title5"><axis:alt f="axisadm003" c="FFINLIQ" lit="9000527"/></c:set>   <%-- Observaciones --%>
                                                                <c:set var="title7"><axis:alt f="axisadm003" c="CCOMPANI" lit="9000600"/></c:set>   <%-- Observaciones --%>
                                                                <c:set var="title8"><axis:alt f="axisadm003" c="CESTADO" lit="101510"/></c:set>   <%-- Estado --%>
                                                                 <c:set var="title10"><axis:alt f="axisadm003" c="COMISION" lit="101509"/> </c:set>  <%-- Comision --%>
                                                                <c:set var="title9"><axis:alt f="axisadm003" c="TAGENTE" lit="100584"/></c:set>   <%-- AGENTE --%>
                                                                
                                                                <display:table name="${__formdata.LSTLIQREC}" id="LSTLIQUID" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisadm003.do?paginar=true" style="width:99.9%">
                                                                <%@ include file="../include/displaytag.jsp"%>     
                                                               <display:column title="${title0}" sortable="true" sortProperty="SPROLIQ" headerClass="sortable"  media="html" autolink="false" >                                                                                                                
                                                                    <div class="dspNumber">
                                                                            ${LSTLIQUID.SPROLIQ}
                                                                    </div>
                                                                </display:column>
                                                                
                                                                 <display:column title="${title7}" sortable="true" sortProperty="TCOMPANI" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                            ${LSTLIQUID.TCOMPANI}
                                                                    </div>
                                                                </display:column>
                                                                 <display:column title="${title2}" sortable="true" sortProperty="FLIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FLIQUIDA}"/>
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title4}" sortable="true" sortProperty="FINILIQ" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FINILIQ}"/>
                                                                    </div>
                                                                </display:column>
                                                                 <display:column title="${title5}" sortable="true" sortProperty="FFINLIQ" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                         <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FFINLIQ}"/>
                                                                    </div>
                                                                </display:column>
                                                                 
                                                                <display:column title="${title3}" sortable="true" sortProperty="TLIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">                                    
                                                                            ${LSTLIQUID.TLIQUIDA}
                                                                    </div>
                                                                </display:column>
                                                                
                                                                 <display:column title="${title8}" sortable="true" sortProperty="TESTLIQ" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                            ${LSTLIQUID.TESTLIQ}
                                                                    </div>
                                                                </display:column>
                                                                
                                                                <display:column title="${title9}" sortable="true" sortProperty="TAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                            ${LSTLIQUID.TAGENTE}
                                                                    </div>
                                                                </display:column>
                                                                <display:column title="${title10}" sortable="false" sortProperty="ILIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspNumber">                                    
                                                                         <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTLIQUID.ILIQUIDA}'/>
                                                                    </div>
                                                                </display:column>                            
                                                                
                                                            </display:table>
                                                        </div> 
                                                    </td>
                                                 </tr>
                                            </table>
                                        </td>
                                        </tr>
                                    </table>
                                </td>    
                                                           
                        </tr>
                        </c:if>
                        </axis:visible>
                        
                        <axis:visible f="axisadm003" c="DSP_AGENDA">
                         <tr>
                                <td align="left">
                                                <table class="area" align="center">
                                               
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <td class="campocaja">
                                                      <div style="float:left;">
                                                        <img id="DSP_AGENDA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_AGENDA', this)" style="cursor:pointer"/>
                                                        <b><axis:alt f="axisadm003" c="DSP_AGENDA_LIT" lit="9001769"/></b>
                                                        </div>
                                                        <axis:visible c="BT_ALTA_AGENDA" f="axisadm003">
                                                        <div style="float:right;">
                                                            <a href="javascript:f_gestioagenda('',0)"><img border="0" alt="<axis:alt f="axisadm003" c="AGENDA_LIT" lit="9001332"/>" title="<axis:alt f="axisadm003" c="AGENDA_LIT" lit="9001332"/>" src="images/agenda.gif"/></a>
                                                        </div>
                                                        </axis:visible>
                                                        <div style="clear:both;">
                                                        <hr class="titulo">
                                                        </div>
                                                    </td>
                                                </tr>                                                                  
                                            
<%--
${__formdata.PLSTAGENDA}
--%>
                                    
                                    <tr id="DSP_AGENDA_children" style="display:none">
                                        <td class="campocaja" >
                                        <c:set var="title0"><axis:alt f="axisadm003" c="NPOLIZA" lit="100624"/></c:set> <!-- póliza -->
                                        <c:set var="title1"><axis:alt f="axisadm003" c="NLINEA" lit="9001189"/></c:set> <!-- Nº apunte -->
                                        <c:set var="title2"><axis:alt f="axisadm003" c="TTIPREG" lit="9000715"/></c:set> <!-- Concepto -->
                                        <c:set var="title3"><axis:alt f="axisadm003" c="TTIPLIN" lit="9001195"/></c:set> <!-- Tipo apunte -->
                                        <c:set var="title4"><axis:alt f="axisadm003" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                                        <c:set var="title5"><axis:alt f="axisadm003" c="TTITULO" lit="9001196"/></c:set> <!-- Título apunte -->
                                        <c:set var="title6"><axis:alt f="axisadm003" c="TTEXTLIN" lit="9001197"/></c:set> <!-- Texto apunte -->
                                        <c:set var="title7"><axis:alt f="axisadm003" c="CUSUALT" lit="100894"/></c:set> <!-- Usuario -->
                                        <c:set var="title8"><axis:alt f="axisadm003" c="TESTADO" lit="100587"/></c:set> <!-- Estado -->
                                        <c:set var="title9"><axis:alt f="axisadm003" c="FFINALI" lit="9001198"/></c:set> <!-- Fecha finalización -->
                                        <c:set var="title10"><axis:alt f="axisadm003" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                                        <c:set var="title11"><axis:alt f="axisadm003" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->
                                        <c:set var="title12"><axis:alt f="axisadm003" c="TTIPAGD" lit="9001328"/></c:set> <!-- Tipo apunte -->
                                        <%--IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                        <c:set var="title13"><axis:alt f="axisadm003" c="NMOVOBS" lit="100913"/></c:set> <!-- Movimientos -->
                                        <c:set var="title14"><axis:alt f="axisadm003" c="FICHERO" lit="9905642"/></c:set> <!-- Fichero -->
                    
                                         <div class="displayspace">
                    
                                            <display:table name="${__formdata.PLSTAGENDA}" id="LISTAAPUNTESAGENDA" export="false" class="dsptgtable"  pagesize="-1"
                                            requestURI="axis_axisadm003.do?paginar=true&subseccion=DSP_AGENDA" sort="list" cellpadding="0" cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                    
                                             <axis:visible f="axisadm003" c="IDOBS">
                                            <display:column title="${title1}" sortable="true" sortProperty="IDOBS" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">${LISTAAPUNTESAGENDA['IDOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <%--IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                            <axis:visible f="axisadm003" c="IDOBS">
                                            <display:column title="${title13}" sortable="true" sortProperty="NMOVOBS" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber">${LISTAAPUNTESAGENDA['NMOVOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisadm003" c="IDOBS">
                                            <display:column title="${title2}" sortable="true" sortProperty="TCONOBS" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TCONOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisadm003" c="TTIPAGD">
                                            <display:column title="${title12}" sortable="true" sortProperty="TTIPAGD" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTIPOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="TTITOBS">
                                            <display:column title="${title5}" sortable="true" sortProperty="TTITOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TTITOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisadm003" c="TTEXTLIN">
                                            <display:column title="${title6}" sortable="true" sortProperty="TOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TOBS']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="FALTA">
                                            <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FALTA']}"/></div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="CUSUALT">
                                            <display:column title="${title7}" sortable="true" sortProperty="CUSUALT" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['CUSUALT']}</div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="TESTOBS">
                                            <display:column title="${title8}" sortable="true" sortProperty="TESTOBS" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText">${LISTAAPUNTESAGENDA['TESTOBS']}</div>
                                            </display:column>
                                            </axis:visible>
<%--INI IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                            <axis:visible f="axisadm003" c="TESTOBS">
                                            <display:column title="${title14}" sortable="true" sortProperty="FICHERO" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                             <div class="dspText"></div>
								             <a type="button" style="color:blue;" href="#" onclick="cargarArchivos(${LISTAAPUNTESAGENDA['IDOBS']})">Archivos Adjuntos</a>
                                            </display:column>
                                            </axis:visible>
<%--FIN IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                            <axis:visible f="axisadm003" c="FFINALI">
                                            <display:column title="${title9}" sortable="true" sortProperty="FFINALI" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTAAPUNTESAGENDA['FFINALI']}"/></div>
                                            </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="BT_CONS_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:5%;" autolink="false"  >
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axisadm003" c="CONSULTA_AGD" lit="9001218"/>" title1="<axis:alt f="axisadm003" c="CONSULTA_AGD" lit="9001218"/>" src="images/mas.gif"
 <%--INI IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}','1', '${LISTAAPUNTESAGENDA['NMOVOBS']}')"/></div>
                                             </display:column>
                                            </axis:visible>
                                           <axis:visible f="axisadm003" c="BT_EDIT_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:5%;" autolink="false"  >
                                             <c:if test="${LISTAAPUNTESAGENDA['CESTOBS'] != 1}">
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axisadm003" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axisadm003" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
 <%--FIN IAXIS 3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda--%>
                                                 style="cursor:pointer;" onclick="f_gestioagenda('${LISTAAPUNTESAGENDA['IDOBS']}','0','${LISTAAPUNTESAGENDA['NMOVOBS']}')"/></div>
                                             </c:if>
                                             </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisadm003" c="BT_BORRAR_AGENDA">
                                             <display:column title="" headerClass="sortable fixed" media="html" style="width:5%;" autolink="false"  >
                                                 <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axisadm003" c="ELIMINAR_AGD" lit="9001333"/>" title1="<axis:alt f="axissin006" c="ELIMINAR_AGD" lit="9001333"/>" src="images/delete.gif"
                                                 style="cursor:pointer;" onclick="f_borrar_agenda('${LISTAAPUNTESAGENDA['IDOBS']}')"/></div>
                                             </display:column>
                                              </axis:visible>
                                            </display:table>
                                        </div>
                    
                                        </td>
                                    </tr>
                                    </table>
                                    </td>
                                    </tr>



                        
                        </axis:visible>
                        
                        
                        <axis:visible c="DSP_TAREAS_USUARIO" f="axisadm003">
                       
                        <tr>
                                <td align="left">
                                                <table class="area" align="center">
                                               
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>
                                                </tr>
                       
                            <tr>
                                <td class="campocaja" >
                                    <div style="float:left;">
                                    <img id="DSP_TAREAS_USUARIO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TAREAS_USUARIO', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisadm003" c="DSP_TAREAS_USUARIO_LIT" lit="9901963"/></b>
                                    </div>
                                    
                                    <axis:visible c="BT_SIN_NUEVO_AGD_AGENDA" f="axisadm003">
                                    <div style="float:right;">
                                        <a href="javascript:f_agd_gestioagenda_alta(null,'${miListaId['IDAGENDA']}','ALTA_CONS')"><img border="0" alt="<axis:alt f="axisadm003" c="AGENDA_LIT" lit="9001332"/>" title="<axis:alt f="axisadm003" c="AGENDA_LIT" lit="9001332"/>" src="images/agenda.gif"/></a>
                                    </div>
                                    </axis:visible>
                                    
                                    <div style="clear:both;">
                                    <hr class="titulo">
                                    </div>
            
                                </td>
                            </tr>
                            
                            <tr id="DSP_TAREAS_USUARIO_children" style="display:none">
                                <td class="campocaja" >
                                <c:set var="title1"><axis:alt f="axisadm003" c="IDAPUNTE" lit="9001189"/></c:set> <!-- Nº apunte -->
                                <c:set var="title2"><axis:alt f="axisadm003" c="TCONAPU" lit="9000715"/></c:set> <!-- Concepto -->
                                <c:set var="title3"><axis:alt f="axisadm003" c="TTITAPU" lit="9001196"/></c:set> <!-- Tipo apunte -->
                                <c:set var="title4"><axis:alt f="axisadm003" c="FALTA" lit="9001192"/></c:set> <!-- Fecha alta -->
                                <c:set var="title6"><axis:alt f="axisadm003" c="CUSUARI" lit="100894"/></c:set> <!-- Usuario -->
                                <c:set var="title7"><axis:alt f="axisadm003" c="TESTAPU" lit="100587"/></c:set> <!-- Estado -->
                                <c:set var="title8"><axis:alt f="axisadm003" c="FESTAPU" lit="9901964"/></c:set> <!-- Fecha Apunte -->
                                <c:set var="title9"><axis:alt f="axisadm003" c="BT_EDIT_AGENDA" lit="9000552"/></c:set> <!-- Modificar -->
                                <c:set var="title10"><axis:alt f="axisadm003" c="BT_MASDATOS_AGENDA" lit="1000113"/></c:set> <!-- Detall 11177.NMM. -->
            
                                 <div class="displayspace">
            
                                    <display:table name="${lstagdagenda}" id="miListaId" export="false" class="dsptgtable"  pagesize="-1"
                                    requestURI="axis_axisadm003.do?paginar=true&subseccion=DSP_TAREAS_USUARIO" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
            
                                    <%--  --%>
                                    <axis:visible c="IDAPUNTE" f="axisadm003">
                                        <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['IDAPUNTE']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible c="TCONAPU" f="axisadm003">
                                        <display:column title="${title2}" sortable="true" sortProperty="TCONAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TCONAPU']}</div>
                                        </display:column>
                                    </axis:visible>    
                                    <axis:visible c="TTITAPU" f="axisadm003">
                                        <display:column title="${title3}" sortable="true" sortProperty="TTITAPU" style="width:18%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TTITAPU']}</div>
                                        </display:column>
                                    </axis:visible>    
                                    <axis:visible c="FALTA" f="axisadm003">
                                        <display:column title="${title4}" sortable="true" sortProperty="FALTA" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/></div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible c="CUSUARI" f="axisadm003">
                                        <display:column title="${title6}" sortable="true" sortProperty="CUSUARI" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['CUSUARI']}</div>
                                        </display:column>
                                    </axis:visible>
                                    <axis:visible c="TESTAPU" f="axisadm003">
                                        <display:column title="${title7}" sortable="true" sortProperty="TESTAPU" style="width:15%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText">${miListaId['TESTAPU']}</div>
                                        </display:column>
                                    </axis:visible>    
                                    <axis:visible c="FESTAPU" f="axisadm003">
                                        <display:column title="${title8}" sortable="true" sortProperty="FESTAPU" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FESTAPU']}"/></div>
                                        </display:column>
                                    </axis:visible>    
                                   <!----------------------------------------------------------------------------------------------------------------------------------------------------->
                                   <axis:visible f="axisadm003" c="BT_SIN_EDITAR_AGD">
                                     <display:column title="${title9}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false"  >
                                     <c:if test="${miListaId['CESTAPU'] != 1 || __configform.axisadm003__AGENDACESTADOFINALIZADO__visible == 'true'}">
                                         <div class="dspIcons" align="left"><img border="0" alt="<axis:alt f="axisadm003" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" title1="<axis:alt f="axisadm003" c="AGENDACESTADOFINALIZADO_LIT" lit="9001330"/>" src="images/lapiz.gif"
                                         style="cursor:pointer;" onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','MODIF_AGEN')"/></div>
                                     </c:if>
                                     </display:column>
                                    </axis:visible>
                                    
                                   <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                                    <!-- Ara no és el botó de més dades, és Detall. -->
                                    <!-- <div class="dspIcons"><img border="0" alt="" title1="" src="images/mes.gif" width="11px" height="11px"
                                         style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"  />
                                    -->
                                    <axis:visible f="axisadm003" c="BT_SIN_CONSULTAR_AGD">
                                         <display:column title="${title10}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                            <div class="dspIcons"><img border="0" alt="<axis:alt f="axisadm003" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" title1="<axis:alt f="axisadm003" c="MASDATOS_AGENDA_LIT" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                            style="cursor:pointer;"   onclick="f_agd_gestioagenda('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}','CONSULTA')"  />
                                            </div>
                                        </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                                    </axis:visible>
                                       
                                    </display:table>
                                </div>
            
                                </td>
                            </tr>
                            
                             </table>
                                    </td>
                                    </tr>
            
                        </axis:visible>
                        
<!--  ****************************************** documentos del recibo ************************************ -->
                        <axis:visible f="axisadm003" c="DSP_RECDOCS">
                        <tr>
                        <td align="left">
                                    <table class="area" align="center">
                                    <%-- DOCUMENTOS DE RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <div style="float:left;">
                                                <img id="procesos_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('documentos_recibo', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisadm003" c="procesos_parent" lit="9902385"/></b>
                                            </div>
                                            
                                            <axis:visible c="IMP_RECIBO2" f="axisadm003">
                                                <div style="float:right;" id="BT_IMPRIMIR" name="BT_IMPRIMIR">
                                                    <img border="0" alt="<axis:alt f="axisadm003" c="BT_IMPRIMIR" lit="100001"/>"  
                                                    onclick="javascript:f_imprimir_rec('RECIBO_ACT');" style="cursor:pointer;"
                                                    title="<axis:alt f="axisadm003" c="BT_IMPRIMIR" lit="100001"/>" 
                                                    src="images/print.gif"/>
                                                </div>
                                            </axis:visible>
                                            
                                            <div style="clear:both;">
                                                <hr class="titulo"/>
                                            </div>
                                        </td>
                                    </tr>                                                
                                    <tr id="documentos_recibo_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <div class="displayspace">
                                                            <c:set var="title0"><axis:alt f="axisadm003" c="FDATE" lit="9903983"/></c:set>
                                                            <c:set var="title1"><axis:alt f="axisadm003" c="TUSER" lit="100894"/></c:set>
                                                            <c:set var="title2"><axis:alt f="axisadm003" c="BT_DUPLICADO" lit="9903984"/></c:set>
                                                            <c:set var="title3"><axis:alt f="axisadm003" c="BT_DOCGEDOX" lit="9001357"/></c:set>
                                                            <c:set var="title4"><axis:alt f="axisadm003" c="DESCRIPDOC" lit="100588"/></c:set>
                                                            <c:set var="title5"><axis:alt f="axisadm003" c="NOMFICH" lit="105940"/></c:set>
                                                            <display:table name="${__formdata.OB_IAX_DOCSRECIBO}" id="docrec" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                     requestURI="axis_axisadm003.do?paginar=true&tabla=documentos_recibo"> 
                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                <%--display:column title="" sortable="false" sortProperty="" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                    <div class="dspText">${docrec.NDOCUME}</div>
                                                                </display:column--%>
                                                                <axis:visible f="axisadm003" c="DESCRIPDOC">
                                                                    <display:column title="${title4}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">${docrec.TDESCRIP}</div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axisadm003" c="FICHERO">
                                                                    <display:column title="${title5}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">${docrec.FICHERO}</div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axisadm003" c="FDATE">
                                                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${docrec.FDATE}"/></div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axisadm003" c="TUSER">
                                                                    <display:column title="${title1}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspText">${docrec.TUSER}</div>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axisadm003" c="BT_DUPLICADO">
                                                                    <display:column title="${title2}" sortable="false" sortProperty="" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <c:if test="${!empty docrec.NDOCUME}">
                                                                            <div class="dspIcons">
                                                                                 <img border="0" alt="<axis:alt f="axisadm003" c="DUPLICADO" lit="9903984"/>" title1="<axis:alt f="axisadm003" c="DUPLICADO" lit="9903984"/>" src="images/print.gif"
                                                                                    style="cursor:pointer;" onclick="javascript:f_imprimir_recdup(${docrec.NRECIBO},${docrec.NDOCUME})"  />
                                                                            </div>
                                                                        </c:if>
                                                                    </display:column>
                                                                </axis:visible>
                                                                <axis:visible f="axisadm003" c="BT_DOCGEDOX">
                                                                    <display:column title="${title3}" sortable="false" sortProperty="" style="width:5%;" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                            <img border="0" alt="<axis:alt f="axisadm003" c="DOCGEDOX" lit="9001357"/>" title1="<axis:alt f="axisadm003" c="DOCGEDOX" lit="9001357"/>" src="images/gdocumental.gif"
                                                                                style="cursor:pointer;" onclick="javascript:f_ver_doc('${docrec.IDDOC}')"  />
                                                                        </div>
                                                                    </display:column>
                                                                </axis:visible>
                                                            </display:table>    
                                                        </div> 
                                                    </td>
                                                 </tr>
                                            </table>
                                        </td>
                                        </tr>
                                    </table>
                                </td>    
                                                           
                        </tr>
                        </axis:visible>                       
                        
                        <!-- ******************************************************************************************************** -->
                        <tr>
                            <td align="left">
                                    <table class="area" align="center">
                                    <%-- MOVIMIENTOS RECIBO --%>
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <img id="movimientos_recibo_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('movimientos_recibo', this)" style="cursor:pointer"/> 
                                            <b><axis:alt f="axisadm003" c="movimientos_recibo_parent" lit="1000581"/></b>
                                            <hr class="titulo"/>
                                        </td>
                                    </tr>                                                
                                    <tr id="movimientos_recibo_children" style="display:none">
                                        <td align="left">
                                             <table class="area" align="center">
                                                <tr>
                                                    <th style="width:100%;height:0px"></th>                                                    
                                                </tr>
                                                <tr>                                                    
                                                    <td class="titulocaja">
                                                        <%-- DisplayTag Movimientos recibo --%>
                                                        <c:set var="title0"><axis:alt f="axisadm003" c="FDIA" lit="1000597"/></c:set> <%-- Data dia --%>
                                                        <c:set var="title1"><axis:alt f="axisadm003" c="DCONTABLE" lit="1000575"/></c:set> <%-- Data comptable --%>
                                                        <c:set var="title2"><axis:alt f="axisadm003" c="DADMINISTRACIO" lit="1000596"/></c:set> <%-- Data administració --%>
                                                        <c:set var="title3"><axis:alt f="axisadm003" c="TSITUAC" lit="100874"/></c:set>  <%-- Situació --%>
                                                        <c:set var="title4"><axis:alt f="axisadm003" c="USUARI" lit="100894"/></c:set>  <%-- Usuari --%>
                                                        <c:set var="title5"><axis:alt f="axisadm003" c="PROCES" lit="1000576"/></c:set> <%-- Procés --%>
                                                        <c:set var="title6"><axis:alt f="axisadm003" c="FMOVIMENT" lit="101006"/></c:set>  <%-- Data moviment --%>
                                                        <%-- INI -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
                                                        <c:set var="title50"><axis:alt f="axisadm003" c="TESTABONO" lit="2000095"/></c:set>  <%-- Estado abonado --%>
                                                        <%-- FIN -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
                                                        <c:set var="title55"><axis:alt f="axisadm003" c="FIN" lit="IPENDENT" /></c:set>
                                                      
                                                        <div class="seccion displayspace" id="TRANSF">
                                                            <display:table name="${__formdata.OB_IAX_RECIBOS.MOVRECIBO}" id="MOVRECIBO" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisadm003.do?paginar=true&subseccion=movimientos_recibo">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <axis:visible c="FMOVDIA" f="axisadm003">
                                                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.FMOVDIA" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MOVRECIBO.OB_IAX_MOVRECIBO.FMOVDIA}"/></div> 
                                                                </display:column>
                                                                </axis:visible>
                                                                <axis:visible c="FCONTAB" f="axisadm003">
                                                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.FCONTAB" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MOVRECIBO.OB_IAX_MOVRECIBO.FCONTAB}"/></div>
                                                                </display:column>
                                                                </axis:visible>
                                                                <axis:visible c="FEFEADM" f="axisadm003">
                                                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.FEFEADM" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MOVRECIBO.OB_IAX_MOVRECIBO.FEFEADM}"/></div>
                                                                </display:column>
                                                                </axis:visible>
                                                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.TESTREC" headerClass="sortable"  media="html" autolink="false">                                                                    
                                                                    <div style="float:left;text-align:left;padding-left:10px;padding-right:5px;"> 
                                                                        ${MOVRECIBO.OB_IAX_MOVRECIBO.TESTREC}
                                                                    </div>
                                                                    <%--<c:if test="${!empty MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO}">--%>
                                                                    <axis:visible c="DETMOVRECIBO" f="axisadm003">
                                                                    <div style="float:right;text-align:right;padding-right:10px;padding-left:5px;">
                                                                         <c:if test="${(MOVRECIBO.OB_IAX_MOVRECIBO.CESTREC == 0 && !empty MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO) || (MOVRECIBO.OB_IAX_MOVRECIBO.CESTREC == 3 && !empty MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO2)}">
                                                                            <img border="0" alt="<axis:alt f="axisadm003" c="CESTREC" lit="9000791"/>" title1="<axis:alt f="axisadm003" c="CESTREC" lit="9000791"/>" src="images/mes.gif" width="11px" height="11px"
                                                                            style="cursor:pointer;"   onclick="javascript:mostrar('SECCION_A${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}','TRANSF')"   />
                                                                         </c:if>
                                                                    </div>
                                                                    </axis:visible>
                                                                  <%--</c:if>--%>
                                                                </display:column>
                                                              
                                                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.CUSUARI" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText">${MOVRECIBO.OB_IAX_MOVRECIBO.CUSUARI}</div>
                                                                </display:column>
                                                                
                                                                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.SMOVAGR" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText">${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVAGR}</div> 
                                                                </display:column>
                                                                <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_MOVRECIBO.FMOVINI" headerClass="sortable"  media="html" autolink="false">
                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${MOVRECIBO.OB_IAX_MOVRECIBO.FMOVINI}"/></div>
                                                                </display:column>
                                                                <%-- INI -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
								                                  <display:column title="${title50}"
								                                                  sortable="true"
								                                                  sortProperty="OB_IAX_MOVRECIBO.CESTABONO"
								                                                  headerClass="sortable fixed"
								                                                  media="html" autolink="false">
								                                    <div class="dspIcons">
								                                      <input type="checkbox" id="CESTABONO"
								                                      <c:if test="${MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO[0].ESABONADO eq 1}">checked</c:if><%-- IAXIS-4926 DFR 23/10/2019 --%>
								                                             name="CESTABONO" value=""
								                                             disabled="disabled"/>
								                                    </div>
								                                  </display:column>
                                                                <%-- FIN -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
                                                                <%-- Bug 19791 --%>
                                                                <axis:visible c="MESMOVRECIBO" f="axisadm003">
                                                                <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html" style="width:5%" autolink="false" >
                                                                     <div class="dspIcons">    
                                                                         <img border="0" alt="<axis:alt f="axisadm003" c="MESMOVRECIBO" lit="9000791"/>" title1="<axis:alt f="axisadm003" c="MESMOVRECIBO" lit="9000791"/>" src="images/mes.gif" width="11px" height="11px"
                                                                            style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_B${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}','TRANSF')" 
                                                                            onmouseout="javascript:ocultar('SECCION_B${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}')"  />
                                                                    </div>
                                                                </display:column>
                                                                </axis:visible>
                                                                
                                                                <display:column class="seccion_informacion">
                                                                    <div id="SECCION_B${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}" style="height:150px;" class="seccion_informacion">
                                                                        <!-- INICIO SECCION -->
                                                                         <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:50%;height:0px"></th>
                                                                                <th style="width:50%;height:0px"></th>
                                                                             </tr>
                                                                             <tr>
                                                                                <%-- Campo 1 --%>
                                                                                <axis:ocultar c="TMRECA" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="TMRECA" lit="9910168"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="MOVTCODIGO" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="MOVTCODIGO" lit="9901743"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                            </tr>
                                                                            <tr>
                                                                                <axis:ocultar c="TMRECA" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="TMRECA" name="TMRECA" <axis:atr f="axisadm003" c="TMRECA" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${MOVRECIBO.OB_IAX_MOVRECIBO.TMRECA}" readonly="readonly"/><!-- Changes for 4944 -->
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="MOVTMOTIVO" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="MOVTMOTIVO" name="MOVTMOTIVO" <axis:atr f="axisadm003" c="MOVTMOTIVO" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${MOVRECIBO.OB_IAX_MOVRECIBO.TMOTIVO}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                            </tr>
                                                                            
                                                                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                                                                            <tr>
                                                                                <%-- Campo 1 --%>
                                                                                <axis:ocultar c="NRECCAJ" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="NRECCAJ" lit="9910167"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="CINDICAF" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="CINDICAF" lit="89906203"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                            </tr>
                                                                            <tr>
                                                                                <axis:ocultar c="NRECCAJ" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="NRECCAJ" name="NRECCAJ" <axis:atr f="axisadm003" c="NRECCAJ" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${MOVRECIBO.OB_IAX_MOVRECIBO.NRECCAJ}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="CINDICAF" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="CINDICAF" name="CINDICAF" 
                                                                                        	<axis:atr f="axisadm003" c="CINDICAF" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                        	value="${MOVRECIBO.OB_IAX_MOVRECIBO.CINDICAF}" readonly="readonly"/><!-- Changes for 4944 -->
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="CSUCURSAL" lit="89906204"/></b>
                                                                                </td>
                                                                                <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="CUSUPAG" lit="89906205"/></b>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
	                                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
	                                                                                <input type="text" class="campo campotexto campodisabled" id="CSUCURSAL" name="CSUCURSAL" 
	                                                                                	<axis:atr f="axisadm003" c="CSUCURSAL" a="modificable=false&obligatorio=false"/> size="15" 
	                                                                                	value="${MOVRECIBO.OB_IAX_MOVRECIBO.CSUCURSAL}" readonly="readonly"/><!-- Changes for 4944 -->
	                                                
	                                                                            </td>
	                                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
	                                                                                <input type="text" class="campo campotexto campodisabled" id="CUSUPAG" name="CUSUPAG" 
	                                                                                	<axis:atr f="axisadm003" c="CUSUPAG" a="modificable=false&obligatorio=false"/> size="15" 
	                                                                                	value="${MOVRECIBO.OB_IAX_MOVRECIBO.CUSUARI}" readonly="readonly"/><!-- Changes for 4944 -->
	                                                
	                                                                            </td>
                                                                            </tr>
                                                                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                                                                        </table>
                                                                    </div>
                                                                </display:column>
                                                                <%-- Fi Bug 19791 --%>
                                                                
                                                                 <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                                <display:column class="seccion_informacion" style="width:900px;padding-right:10px;padding-left:5px;">
                                                                    <div id="SECCION_A${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}" style="width:900px;height:auto;padding-right:10px;padding-left:5px;" class="seccion_informacion">
                                                                        <!-- INICIO SECCION -->
                                                                         <div style="float:right;">
                                                                        <img  src="images/but_cerrar.gif" alt="<axis:alt f="axisadm003" c="CERRAR" lit="1000430" />" onclick="javascript:ocultar('SECCION_A${MOVRECIBO.OB_IAX_MOVRECIBO.SMOVREC}')" style="cursor:pointer"/> 
                                                                        </div>
                                                                        
                                                                        <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:50%;height:0px"></th>
                                                                                <th style="width:50%;height:0px"></th>
                                                                             </tr>

                                                                            <tr>
                                                                                <%-- Campo 1 --%>
                                                                                  <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;" >
                                                                                  <c:set var="title7"><axis:alt f="axisadm003" c="ORDEN" lit="9000715"/></c:set>  <%-- Ordre --%>
                                                                                  <c:set var="title8"><axis:alt f="axisadm003" c="ICOBRAT" lit="9002154"/></c:set>  <%-- Import cobrat --%>
                                                                                  <c:set var="title9"><axis:alt f="axisadm003" c="FMOVIMI" lit="101006"/></c:set>  <%-- Data moviment --%>
                                                                                  <c:set var="title10"><axis:alt f="axisadm003" c="FADMINISTRA" lit="1000596"/></c:set>  <%-- Data administració --%>
                                                                                  <c:set var="title11"><axis:alt f="axisadm003" c="DEVOLUCION" lit="9001622"/></c:set>  <%-- Devolucio --%>
                                                                                  <c:set var="title12"><axis:alt f="axisadm003" c="DADMINISTRA" lit="9000455"/></c:set>  <%-- Data administració --%>
                                                                                  <c:set var="title13"><axis:alt f="axisadm003" c="CBANCAR1" lit="100965"/></c:set>  <%-- Data administració --%>
                                                                                  <c:set var="title14"><axis:alt f="axisadm003" c="DESCRIPCIO" lit="100588"/></c:set>  <%-- Descrpció --%>
                                                                                  <%-- INI -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el campo  --%>
                                                                                  <c:set var="title15"><axis:alt f="axisadm003" c="NRECCAJDET" lit="9910167"/></c:set>  <%-- Número de recibo de caja --%>
                                                                                  <c:set var="title16"><axis:alt f="axisadm003" c="TMRECADET" lit="9910168"/></c:set>  <%-- Medio de recaudo --%>
                                                                                  <%-- FIN -IAXIS-4153 - JLTS 07/06/2019 Se adiciona el literal 2000095 --%>
                                                                                    <div style="float:left;">
                                                                                    <b><axis:alt f="axisadm003" c="DETALLMOV" lit="9002153" /></b>
                                                                                    </div>
                                                                                    <br><br>
                                                                                  <display:table name="${(MOVRECIBO.OB_IAX_MOVRECIBO.CESTREC == 3) ? MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO2 : MOVRECIBO.OB_IAX_MOVRECIBO.DETMOVRECIBO }" id="DETMOVRECIBO" export="false" class="dsptgtable" pagesize="-1"   sort="list" cellpadding="0" cellspacing="0"
                                                                                     requestURI="axis_axisadm003.do?paginar=true&subseccion=movimientos_recibo">
                                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                    <display:column title="${title7}"  sortProperty="DETMOVRECIBO.TATRIBU" headerClass="sortable" style="width:35%;"  media="html" autolink="false">
                                                                                        <div class="dspText">${DETMOVRECIBO.TATRIBU}</div>
                                                                                    </display:column>
                                                                                    <display:column title="${title8}"  sortProperty="DETMOVRECIBO.FMOVDIA" headerClass="sortable" style="width:10%;"  media="html" autolink="false">
                                                                                       <div class="dspNumber">
                                                                                       	<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${(empty DETMOVRECIBO.IIMPORTE_MONCON) ? DETMOVRECIBO.IIMPORTE : DETMOVRECIBO.IIMPORTE_MONCON }'/></div>
                                                                                    </display:column>
                                                                                    <display:column title="${title9}" sortProperty="DETMOVRECIBO.FMOVIMI" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DETMOVRECIBO.FMOVIMI}"/></div>
                                                                                    </display:column>
                                                                                    <display:column title="${title10}" sortProperty="OB_IAX_MOVRECIBO.FEFEADM" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${DETMOVRECIBO.FEFEADM}"/></div>
                                                                                    </display:column>
                                                                                    <display:column title="${title11}"  sortProperty="DETMOVRECIBO.SEDEVOLU" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                                                        <div class="dspText">${DETMOVRECIBO.SDEVOLU}</div> 
                                                                                    </display:column>
                                                                                     <display:column title="${title12}"  sortProperty="DETMOVRECIBO.NNUMLIN" headerClass="sortable"  style="width:10%;"  media="html" autolink="false">
                                                                                        <div class="dspText">${DETMOVRECIBO.NNUMNLIN}</div> 
                                                                                    </display:column>
                                                                                      <display:column title="${title13}"  sortProperty="DETMOVRECIBO.CBANCAR1" headerClass="sortable"  style="width:15%;"  media="html" autolink="false">
                                                                                     <div class="dspText">${DETMOVRECIBO.CBANCAR1}</div>
                                                                                    </display:column>
                                                                                    <display:column title="${title14}"  sortProperty="DETMOVRECIBO.TDESCRIP" headerClass="sortable"  style="width:30%;"  media="html" autolink="false">
                                                                                        <div class="dspText">
                                                                                        	<c:if test="${!empty DETMOVRECIBO.TDESCRIP}">
                                                                                        		 <textarea  rows="2" class="campo campotexto" readonly style="width:100%;"  name="TDESCRIP" id="TDESCRIP">${DETMOVRECIBO.TDESCRIP}</textarea>
                                                                                        	</c:if>
                                                                                        	</div> 
                                                                                    </display:column>
                                                                                    <%-- INI -IAXIS-4153 - JLTS - 07/06/2019 --%>
                                                                                    <display:column title="${title15}"  sortProperty="DETMOVRECIBO.NRECCAJ" headerClass="sortable"  style="width:15%;"  media="html" autolink="false">
                                                                                     <div class="dspText">${DETMOVRECIBO.NRECCAJ}</div>
                                                                                    </display:column>
                                                                                    <display:column title="${title16}"  sortProperty="DETMOVRECIBO.TMRECADET" headerClass="sortable"  style="width:30%;"  media="html" autolink="false">
                                                                                        <div class="dspText">
                                                                                        	<c:if test="${!empty DETMOVRECIBO.TMRECADET}">
                                                                                        		 <textarea  rows="2" class="campo campotexto" readonly style="width:100%;"  name="TMRECADET" id="TMRECADET">${DETMOVRECIBO.TMRECADET}</textarea>
                                                                                        	</c:if>
                                                                                        	</div> 
                                                                                    </display:column>
                                                                                    <%-- FIN -IAXIS-4153 - JLTS - 07/06/2019 --%>
                                                                                    </display:table>
                                                                                    
                                                                                </td>
                                                                            </tr>
                                                                
                                   
                                                                            </table>
                                                                            
                                                                        
                                                                    </div>
                                                                </display:column>
                                                        </display:table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <c:if test="${__formdata.OB_IAX_IMPAGOS != null}" >
                                                <!-- SECCION IMPAGADOS -->
                                                <tr>
                                                     <td>       
                                                            <div class="separador">&nbsp;</div>
                                                            <div class="titulocaja">
                                                            <b>&nbsp;<axis:alt f="axisadm003" c="LIT_LISTAIMP" lit="9908676"/></b>
                                                            </div>   
                                                            <table class="area" align="center">
                                                            <tr>
                                                                <th style="width:100%;height:0px"></th>                                                    
                                                            </tr>
                                                            <tr>                                                    
                                                                <td class="titulocaja">
                                                                    <%-- DisplayTag Movimientos recibo --%>
                                                                    <c:set var="title0"><axis:alt f="axisadm003" c="TESTADO" lit="100587"/></c:set> <%-- Estado --%>
                                                                    <c:set var="title1"><axis:alt f="axisadm003" c="FEXECU" lit="9001207"/></c:set> <%-- Data execució --%>
                                                                    <c:set var="title2"><axis:alt f="axisadm003" c="ACCION" lit="9000844"/></c:set> <%-- Accio --%>
                                                                    <c:set var="title3"><axis:alt f="axisadm003" c="CARTA" lit="9001210"/></c:set>  <%-- Carta --%>
                                                                    <c:set var="title4"><axis:alt f="axisadm003" c="FIMPRESIO" lit="9001211"/></c:set>  <%-- Data impressio --%>
                                                                    <div class="seccion displayspace">
                                                                        <display:table name="${__formdata.OB_IAX_IMPAGOS}" id="IMPAGOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                             requestURI="axis_axisadm003.do?paginar=true&subseccion=movimientos_recibo">
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                            <display:column title="${title0}" sortable="true" sortProperty="IMPAGOS.CTRACTAT" headerClass="sortable"  media="html" autolink="false">
                                                                                <div class="dspText">${IMPAGOS.CTRACTAT}</div> 
                                                                            </display:column>
                                                                            <display:column title="${title1}" sortable="true" sortProperty="IMPAGOS.FFEJECU" headerClass="sortable"  media="html" autolink="false">
                                                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${IMPAGOS.FFEJECU}"/></div>
                                                                            </display:column>
                                                                            <display:column title="${title2}" sortable="true" sortProperty="IMPAGOS.CACTIMP" headerClass="sortable"  media="html" autolink="false">
                                                                                <div class="dspText">${IMPAGOS.CACTIMP}</div>
                                                                            </display:column>
                                                                            <display:column title="${title3}" sortable="true" sortProperty="IMPAGOS.CCARTA" headerClass="sortable"  media="html" autolink="false">                                                                    
                                                                                <div class="dspText">${IMPAGOS.CCARTA}</div>
                                                                            </display:column>
                                                                            <display:column title="${title4}" sortable="true" sortProperty="IMPAGOS.FIMPRES" headerClass="sortable"  media="html" autolink="false">
                                                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${IMPAGOS.FIMPRES}"/></div>
                                                                            </display:column>
                                                                           
                                                                        </display:table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            </table>        
                                                       </td>         
                                                            
                                                </tr>
                                                <!--  fin  impagados   -->
                                                </c:if>
                                            </table>   
                                            
                                        </td> 
                                    </tr>
<!-- SIGUIENTE : SECCION más datos -->