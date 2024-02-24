<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="title9"><fmt:message key="1000109" /></c:set>
<c:set var="title0"><fmt:message key="102738" /></c:set>
<c:set var="title1"><fmt:message key="500102" /></c:set>
<c:set var="title2"><fmt:message key="100565" /></c:set>
<c:set var="title3"><fmt:message key="112347" /></c:set>
<c:set var="title4"><fmt:message key="108347" /></c:set>
<c:set var="title5"><fmt:message key="9001550"/></c:set>
<c:set var="title6"><fmt:message key="149903" /></c:set>
<c:set var="title7"><fmt:message key="111496" /></c:set>
<c:set var="title8"><fmt:message key="1000487" /></c:set>

                        <div class="displayspace">
                          <display:table name="${mntproducto_actividades.PREGUNACTI}" id="T_IAX_ACTIVIDADES" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axispro001.do?paginar=true&operation=actividades_preguntas">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.CPREGUN}</div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TPREGUN}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.NPREORD}</div>
                            </display:column>
                            <display:column title="${title2}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNACTI.TPRETIP" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TPRETIP}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.CPREOBL" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon">
                                     <c:choose>
                               <c:when test="${miListaId.OB_IAX_PRODPREGUNACTI.CPREOBL == 1}"> 
                              <fmt:message key="101778" />            
                               </c:when>
                               <c:otherwise>
                               <fmt:message key="101779" />   
                               </c:otherwise>
                                </c:choose> 
                                
                            </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.TPREFOR" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TPREFOR}</div>
                            </display:column>
                            <display:column title="${title5}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNACTI.TVALFOR" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.TVALFOR}</div>
                            </display:column>
                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.CRESDEF" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.CRESDEF}</div>
                            </display:column>
                            <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_PRODPREGUNACTI.COFERSN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon">  <c:choose>
                                   <c:when test="${miListaId.OB_IAX_PRODPREGUNACTI.COFERSN == 1}"> 
                                   <fmt:message key="101778" />              
                                   </c:when>
                                   <c:otherwise>
                                   <fmt:message key="101779" />   
                                   </c:otherwise>
                                    </c:choose>  </div>
                            </display:column>
                            <display:column title="${title8}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNACTI.NPREIMP" media="html" autolink="false" >
                                <div class="dspIcon">${T_IAX_ACTIVIDADES.OB_IAX_PRODPREGUNACTI.NPREIMP}</div>
                            </display:column>
                        </display:table>
                        </div>