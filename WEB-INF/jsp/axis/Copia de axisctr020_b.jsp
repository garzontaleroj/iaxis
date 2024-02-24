<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>
<p>
    <%@ page import="java.util.ArrayList"%><%@ page import="java.util.HashMap"%><%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna

    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
    }
    
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
    
    
%>
</p>

<!-- SECCION CAPITALES ASEGURADOS / CAPITALS ASSEGURATS-->

<c:if test="${!empty OB_IAX_RIESGOS.PRESTAMO}">
       <div class="separador">&nbsp;</div>   
                       
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_SALDODEUTOR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SALDODEUTOR', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axisctr020" c="DSP_CAPASEG" lit="9002050"></axis:alt></b>
                                    </div>
  																	<div style="float:right;" id="DATOS_PRESTAMOS"></div>
                                    <div class="seccion_suplementos" id="SECCION_PRESTAMOS"></div>
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
                                        <c:set var="title0"><fmt:message key="1000109" /></c:set>
                                        <c:set var="title1"><fmt:message key="100588" /></c:set>
                                        <c:set var="title2"><fmt:message key="9001942" /></c:set>
                                        <c:set var="title3"><fmt:message key="9002015" /></c:set>
                                        <c:set var="title4"><fmt:message key="9900816" /></c:set>
                                        <c:set var="title5"><fmt:message key="105815" /></c:set>
                                        <c:set var="title6"><fmt:message key="9002016" /></c:set>
                                        <c:set var="title7"><fmt:message key="108871" /></c:set>
                                        <c:set var="title88"><fmt:message key="108871" /></c:set>
                                        <c:set var="title9"><fmt:message key="100565" /></c:set>
                                        <c:set var="title10"><fmt:message key="9000526" /></c:set>
                                        <c:set var="title11"><fmt:message key="9000527" /></c:set>
                            <display:table name="${OB_IAX_RIESGOS.PRESTAMO}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr020.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <%--restringim que nomes s'ens mostri els registres marcats--%>
                                                <axis:visible c="RADIO" f="axisctr020">
                                                 <display:column title="" sortable="false" style="width:5%;" sortProperty="selectedSaldo" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                    <input disabled <c:if test="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']==1}">checked</c:if> 
                                                        type="checkbox" id="selectedSaldo" name="selectedSaldo" value="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}"/>
                                                    </div>    
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="IDCUENTA" f="axisctr020">
                                                <display:column title="${title0}" sortable="false" style="width:18%;" sortProperty="IDCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="DESCRIPCION" f="axisctr020">
                                                <display:column title="${title1}" sortable="false" style="width:19%;" sortProperty="TTIPCUENTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.DESCRIPCION}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="CMONEDA" f="axisctr020">
                                                <display:column title="${title4}" style="width:5%;" sortable="false" sortProperty="CMONEDA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.CMONEDA}</div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="ISALDO" f="axisctr020">
                                                <display:column title="${title2}" sortable="false" style="width:10%;" sortProperty="ISALDO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}"/></div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="ILIMITE" f="axisctr020">
                                                <display:column title="${title88}" sortable="false" style="width:10%;" sortProperty="ILIMITE" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}"/>
                                                        
                                                    </div>
                                                </display:column>
                                                </axis:visible>
                                                <axis:visible c="TTIPIMPORTE" f="axisctr020">
                                                <display:column title="${title9}"
                                                            headerClass="headwidth5 sortable"
                                                            media="html" style="width:12%;"
                                                            autolink="false">
                                                <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.TTIPIMP}</div>
                                                </display:column>
                                                </axis:visible>
                                            
                                            <axis:visible c="CTIPIMPORTE" f="axisctr020">
                                            <display:column title="%" sortable="false" style="width:5%;" sortProperty="ILIMITE" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                <%-- <c:choose>
                                                    <c:when test="${!empty miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP &&  miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP == 2}">  --%>
                                                        <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}"/></div>
                                                <%--     </c:when>
                                                     <c:otherwise>
                                                               &nbsp; 
                                                    </c:otherwise>
                                                </c:choose> --%>
                                             </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="ICAPMAX" f="axisctr020">
                                                <display:column title="${title5}" style="width:8%;" sortable="false" sortProperty="ICAPMAX" headerClass="sortable fixed"  media="html" autolink="false" >
                                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}"/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible c="ICAPASEG" f="axisctr020">
                                                <display:column title="${title6}" sortable="false" style="width:8%;" sortProperty="ICAPASEG" headerClass="sortable fixed"  media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPASEG}"/></div>
                                                </display:column> 
                                            </axis:visible>
                                             <axis:visible c="FINIPREST" f="axisctr020">
                                                <display:column title="${title10}" sortable="false" style="width:8%;" sortProperty="FINIPREST" headerClass="sortable fixed"  media="html" autolink="false" >
                                                   <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FINIPREST}" pattern="dd/MM/yyyy"/></div>
                                                </display:column> 
                                            </axis:visible>
                                            <axis:visible c="FFINPREST" f="axisctr020">
                                                <display:column title="${title11}" sortable="false" style="width:8%;" sortProperty="FFINPREST" headerClass="sortable fixed"  media="html" autolink="false" >                                               
                                                    <div class="dspText"><fmt:formatDate value="${miListaId.OB_IAX_PRESTAMOSEG.FFINPREST}" pattern="dd/MM/yyyy"/></div>
                                                </display:column> 
                                            </axis:visible>
                                            </display:table>
                                            </div>
                            </td>
                        </tr>
                           
                        <tr>
                            <axis:ocultar f="axisctr020" c="ICAPMAXPOL" dejarHueco="false">
                                <td class="campocaja">
                                    <div class="separador">&nbsp;</div>   
                                    <b id="label_ICAPMAXPOL"><fmt:message key="9002025" /></b> &nbsp;
                                    <input  type="text" class="campowidth campo campotexto" id="ICAPMAXPOL" name="ICAPMAXPOL" size="3" style="width:10%;text-align:right;"
                                            value="<fmt:formatNumber pattern="###,##0.00" value="${datos_poliza.ICAPMAXPOL}"/>" readonly="true" 
                                            <axis:atr f="axisctr020" c="ICAPMAXPOL" a="modificable=false&formato=decimal"/> />
                                </td>
                            </axis:ocultar>  
                        </tr>
                </table>
            </td>
        </tr>
    </c:if>


