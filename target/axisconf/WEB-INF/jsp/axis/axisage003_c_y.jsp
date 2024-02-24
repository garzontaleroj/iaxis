<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

                                <%-- DisplayTag Red Comercial --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="DESDE" lit="104095"/></c:set>  <%-- Desde --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="HASTA" lit="103051"/></c:set>  <%-- Hasta --%>
                                <c:set var="title2"><axis:alt f="axisage003" c="CTIPAGE" lit="9000519"/></c:set> <%-- Tipo Agente --%>
                                <c:set var="title3"><axis:alt f="axisage003" c="GESTOR" lit="1000566"/></c:set> <%-- Gestor --%>
                                <c:set var="title4"><axis:alt f="axisage003" c="NVISIO" lit="9000707"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title5"><axis:alt f="axisage003" c="TIPVISIO" lit="9000708"/></c:set>  <%-- Tipo de visión --%>
                                <c:set var="title6"><axis:alt f="axisage003" c="NVISIO_POL" lit="9902710"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title7"><axis:alt f="axisage003" c="TIPVISIO_POL" lit="9902709"/></c:set>  <%-- Tipo de visión --%>
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVINI" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVINI}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVFIN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVFIN}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TCTIPAGE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TCTIPAGE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPADRE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPADRE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERVISIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.CPERVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERVISIO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERNIVEL}
                                            </div>
                                        </display:column>
                                        <axis:visible f="axisage003" c="CPOLVISIO">
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.CPOLVISIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.CPOLVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPOLVISIO}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="TPOLNIVEL">
                                        <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPOLNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPOLNIVEL}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>      
                                </div>