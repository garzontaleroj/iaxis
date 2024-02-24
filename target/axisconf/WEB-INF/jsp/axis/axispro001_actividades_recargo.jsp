<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="title0"><fmt:message key="100712" /></c:set>
<c:set var="title1"><fmt:message key="101566" /></c:set>

                        <div class="displayspace">
                          <display:table name="${mntproducto_actividades.RECFRACCACTI}" id="T_IAX_ACTIVIDADES" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axispro001.do?paginar=true&operation=actividades_recargo">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODRECFRACCACTI.TFORPAG" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODRECFRACCACTI.TFORPAG}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODRECFRACCACTI.PRECARG" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${T_IAX_ACTIVIDADES.OB_IAX_PRODRECFRACCACTI.PRECARG}</div>
                            </display:column>
                        </display:table>
                        </div>
</form>