<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
    }
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
%>


 <c:if test="${!empty OB_IAX_RIESGOS.PRESTAMO}">
<div class="separador">&nbsp;</div>   
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_SALDODEUTOR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SALDODEUTOR', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axisctr009" c="SALDODEUT" lit="9002050"/></b>
                                    </div>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                             </tr>
                             <tr id="DSP_SALDODEUTOR_children" style="display:none">
                             <td class="campocaja">
                                  <table  >
                                  <tr>
                                        <th style="width:90%;height:0px"></th>
                                    </tr>
                                    <tr>
                                    <td>
                                      <div class="displayspace">
                                    <!-- displaytag! -->
                                        <c:set var="title0"><axis:alt f="axisctr009" c="title0" lit="1000109"/></c:set>
                                        <c:set var="title1"><axis:alt f="axisctr009" c="title1" lit="100588"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisctr009" c="title2" lit="9001942"/></c:set>
                                        <c:set var="title3"><axis:alt f="axisctr009" c="title3" lit="9002015"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisctr009" c="title4" lit="9900816"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisctr009" c="title5" lit="105815"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisctr009" c="title6" lit="9002016"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisctr009" c="title7" lit="108871"/></c:set>
                                        <c:set var="title88"><axis:alt f="axisctr009" c="title88" lit="108871"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisctr009" c="title9" lit="100565"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisctr009" c="title10" lit="9000526"/></c:set>
                                        <c:set var="title11"><axis:alt f="axisctr009" c="title11" lit="9000527"/></c:set>
                                        <%int contador = 0;%>
                            <display:table name="${OB_IAX_RIESGOS.PRESTAMO}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr091.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%> 
                                                <c:set var="contador"><%=contador%></c:set>
                                                <%--restringim que nomes s'ens mostri els registres marcats--%>
                                                <axis:visible c="RADIOBUTON" f="axisctr020">                                                                                                    
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                            <input type="radio" name="selCesiones" 
                                                            onclick="f_recargar_cuadro_amortizacion('${contador}');"                                                            
                                                            <c:if test="${__formdata.NCONTADOR == contador}"> checked </c:if> >
                                                        </div>
                                                    </display:column>
                                                </axis:visible>   
                                                <axis:visible c="RADIO" f="axisctr009">
                                                 <display:column title="" sortable="false" style="width:5%;" sortProperty="selectedSaldo" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                    <input disabled <c:if test="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']==1}">checked</c:if> 
                                                        type="checkbox" id="selectedSaldo" name="selectedSaldo" value="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}"/>
                                                    </div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="IDCUENTA" f="axisctr009">
                                                <display:column title="${title0}" sortable="false" style="width:18%;" sortProperty="IDCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="DESCRIPCION" f="axisctr009">
                                                <display:column title="${title1}" sortable="false" style="width:19%;" sortProperty="TTIPCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.DESCRIPCION}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="CMONEDA" f="axisctr009">
                                                <display:column title="${title4}" style="width:5%;" sortable="false" sortProperty="CMONEDA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.CMONEDA}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="ISALDO" f="axisctr009">
                                                <display:column title="${title2}" sortable="false" style="width:10%;" sortProperty="ISALDO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}"/></div>
                                                </display:column> 
                                                </axis:visible>
                                                <axis:visible c="ILIMITE" f="axisctr009">
                                                <display:column title="${title88}" sortable="false" style="width:10%;" sortProperty="ILIMITE" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}"/>
                                                        
                                                    </div>
                                                </display:column> 
                                                </axis:visible>
                                                <axis:visible c="TTIPIMPORTE" f="axisctr009">
                                                    <display:column title="${title9}"
                                                            headerClass="headwidth5 sortable"
                                                            media="html" style="width:12%;"
                                                            autolink="false">
                                                        <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.TTIPIMP}</div>
                                                    </display:column>
                                                </axis:visible>
                                            <axis:visible c="CTIPIMPORTE" f="axisctr009">
                                            <display:column title="%" sortable="false" style="width:5%;" sortProperty="ILIMITE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                <c:choose>
                                                    <c:when test="${!empty miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP &&  miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP == 2}">
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}"/></div>
                                                    </c:when>
                                                     <c:otherwise>
                                                               &nbsp; 
                                                    </c:otherwise>
                                                </c:choose>
                                             </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="ICAPMAX" f="axisctr009">
                                                <display:column title="${title5}" style="width:8%;" sortable="false" sortProperty="ICAPMAX" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}"/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible c="ICAPASEG" f="axisctr009">
                                                <display:column title="${title6}" sortable="false" style="width:8%;" sortProperty="ICAPASEG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPASEG}"/></div>
                                                </display:column> 
                                            </axis:visible>
                                             <axis:visible c="FINIPREST" f="axisctr009">
                                                <display:column title="${title10}" sortable="false" style="width:8%;" sortProperty="FINIPREST" headerClass="sortable fixed"  media="html" autolink="false" >
                                                   <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FINIPREST}" pattern="dd/MM/yyyy"/></div>
                                                </display:column> 
                                            </axis:visible>
                                            <axis:visible c="FFINPREST" f="axisctr009">
                                                <display:column title="${title11}" sortable="false" style="width:8%;" sortProperty="FFINPREST" headerClass="sortable fixed"  media="html" autolink="false" >                                               
                                                    <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FFINPREST}" pattern="dd/MM/yyyy"/></div>
                                                </display:column> 
                                            </axis:visible>
                                            <%contador++;%>
                                            </display:table>
                                            </div>
                                </td>
                        </tr>
                        <!--Nova subtaula cuadres-->
                        <tr>
                            <axis:ocultar f="axisctr009" c="CUADRODEAMORTIZACION" dejarHueco="false">                            
                            <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>                                
                                <table class="area" align="right">                           
                                 <tr>
                                   <td>    
                                                         
                                    <c:set var="title0"><axis:alt f="axisctr009" c="title0" lit="100883"/></c:set>     <!--Fecha Efecto-->
                                    <c:set var="title1"><axis:alt f="axisctr009" c="title1" lit="100885"/></c:set>     <!--Fecha vencimiento-->
                                    <c:set var="title2"><axis:alt f="axisctr009" c="title2" lit="9901245"/></c:set>    <!--Cuota-->
                                    <c:set var="title3"><axis:alt f="axisctr009" c="title3" lit="9901246"/></c:set>    <!--Amortización-->
                                    <c:set var="title4"><axis:alt f="axisctr009" c="title4" lit="9901247"/></c:set>    <!--Interés-->
                                    <c:set var="title5"><axis:alt f="axisctr009" c="title5" lit="9901248"/></c:set>    <!--Capital pendiente-->
                                    <div class="seccion displayspaceGrande">                                                                          
                                        <display:table style="width:98%;" name="${OB_IAX_RIESGOS.PRESTAMO[__formdata.NCONTADOR].OB_IAX_PRESTAMOSEG.CUADRO}" id="LISTACUADROS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axisctr009.do?operation=form&paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                        <%@ include file="../include/displaytag.jsp"%>                                   
                                        <axis:visible c="FEFECTO" f="axisctr009">
                                            <display:column title="${title0}"  style="width:16%" sortable="true" sortProperty="FEFECTO" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">
                                                <div class="dspText"><fmt:formatDate value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.FEFECTO}" pattern="dd/MM/yyyy"/></div>                                        
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible c="FVENCIM" f="axisctr009">
                                            <display:column title="${title1}"  sortable="true" style="width:16%" sortProperty="FVENCIM" headerClass="headwidth15 sortable fixed"  media="html" autolink="false">                                        
                                                <div class="dspText"><fmt:formatDate value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.FVENCIM}" pattern="dd/MM/yyyy"/></div>                                        
                                            </display:column>                        
                                        </axis:visible>
                                        <axis:visible c="ICUOTA" f="axisctr009">
                                            <display:column title="${title2}" sortable="true" style="width:16%" sortProperty="ICUOTA" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICUOTA}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible c="ICAPITAL" f="axisctr009">                                        
                                            <display:column title="${title3}" sortable="true" style="width:16%" sortProperty="ICAPITAL" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="###,###,###,###,###,###.##" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICAPITAL}"/></div>                                        
                                            </display:column>                                                                
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="ICAPPEND">
                                            <display:column title="${title5}" style="width:16%" sortable="true" sortProperty="ICAPPEND" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.ICAPPEND}"/></div>                                            
                                            </display:column>                            
                                        </axis:visible>
                                        <axis:visible c="IINTERES" f="axisctr009">
                                            <display:column title="${title4}" sortable="true" sortProperty="IINTERES" style="width:16%" headerClass="headwidth15 sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${LISTACUADROS.OB_IAX_PRESTCUADROSEG.IINTERES}"/></div>                                                                                    
                                            </display:column>                        
                                        </axis:visible>
                                        </display:table>
                                        <c:choose>
                                        <c:when test="${!empty LISTACUADROS}">
                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                <script language="javascript">objUtiles.retocarDsptagtable("LISTACUADROS");</script>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <script language="javascript">
                                               objLista.esconderListaSpans();
                                               objLista.esconderListaLinks();     
                                            </script>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                   </td>
                                   </tr>
                                  </table>                                                 
                                </td>
                            </tr>
                           </axis:ocultar>
                      </tr>
                        <!--Fi nova subtaula cuadres-->                        
                </table>
            </td>
        </tr>
    </c:if>