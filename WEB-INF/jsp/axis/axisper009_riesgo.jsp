<%/* Revision:# ADEWCUP9LePoc/1EuJrncQ== # */%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
						<!-- *************************  CALIFICACION PERFIL DE RIESGO LA/FT ****************** -->
                        <axis:visible c="DSP_CALRIESGO" f="axisper009">
                            <c:if test="${__formdata.T_IAX_FINANCIERA==null}">
 
                                <div class="titulo">
                                    <b><axis:alt f="axisper009" c="LIT10" lit="9910728"/></b>
                                </div>
                                
                                <table class="seccion">
                                    									
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisper009" c="LIT20" lit="9910729"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisper009" c="LIT21" lit="9910730"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisper009" c="LIT22" lit="9910731"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisper009" c="LIT23" lit="9910732"/></c:set>
                                            <c:set var="titl25"><axis:alt f="axisper009" c="LIT24" lit="9910734"/></c:set>
                                            <c:set var="titl26"><axis:alt f="axisper009" c="LIT25" lit="9910735"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.scoring.lstScoring}"  id="idLstScoring" export="false"
                                                               class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending"
                                                               sort="list" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title1}" sortable="true" sortProperty="NFACCLI"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstScoring.NFACCLI}"/></div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" sortProperty="NFACJUR"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstScoring.NFACJUR}"/></div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" sortProperty="NFACPRO"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstScoring.NFACPRO}"/></div>
                                                        </display:column>                                                       
                                                        <display:column title="${title4}" sortable="true" sortProperty="NFACCAL"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstScoring.NFACCAL}"/></div>
                                                        </display:column>
                                                        <display:column title="${titl25}" sortable="true" sortProperty="NSCOTOT"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${idLstScoring.NSCOTOT}"/></div>
                                                        </display:column>
                                                        <display:column title="${titl26}" sortable="true" sortProperty="FCALCUL"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html" autolink="false">
                                                            <div class="dspDate"><fmt:formatDate value="${idLstScoring.FCALCUL}" pattern="dd/MM/yyyy"/></div>
                                                        </display:column>
                                                         
                                                </display:table>
                                            </div>  
                                        </td>
                                    </tr>  
                                </table>
                            </c:if>
                        </axis:visible>     
						<!-- *************************  CALIFICACION PERFIL DE RIESGO LA/FT ****************** -->

                      