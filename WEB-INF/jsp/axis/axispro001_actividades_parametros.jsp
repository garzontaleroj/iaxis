<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>


<c:set var="title0"><fmt:message key="104111" /></c:set>
<c:set var="title1"><fmt:message key="101159" /></c:set>
                        <div class="displayspace">
                          <display:table name="${mntproducto_actividades.PARACTIVIDAD}" id="T_IAX_ACTIVIDADES" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axispro001.do?paginar=true&operation=actividades_parametros">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPARACTIVIDAD.TPARAME" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.TPARAME}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_PRODPARACTIVIDAD.NVALPAR" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">
                                <c:choose>
                                  <c:when test="${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.CTIPPAR == 1}"> 
                                      ${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.NVALPAR}                  
                                  </c:when>
                                  <c:when test="${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.CTIPPAR == 2}"> 
                                      ${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.TVALPAR}
                                  </c:when>
                                  <c:when test="${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.CTIPPAR == 3}"> 
                                      ${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.FVALPAR}
                                  </c:when>
                                  <c:when test="${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.CTIPPAR == 4}"> 
                                      ${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.DVALPAR}
                                  </c:when>
                                  <c:otherwise>
                                     ${T_IAX_ACTIVIDADES.OB_IAX_PRODPARACTIVIDAD.TVALPAR}
                                  </c:otherwise>
                                </c:choose>       
                                </div>
                            </display:column>
                           
                        </display:table>
                        </div>