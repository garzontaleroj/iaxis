<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="garantias_cumulos"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>


<form name="${nombrePantalla}" action="" method="POST">


   <table class="seccion" align="center" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
   <tr>
   <td>
<c:set var="title9"><axis:alt f="axispro001" c="TCUMULO" lit="104181"/></c:set>
<c:set var="title0"><axis:alt f="axispro001" c="FFECINI" lit="104095"/></c:set>
<c:set var="title1"><axis:alt f="axispro001" c="FECFIN" lit="103051"/></c:set>
<c:set var="title2"><axis:alt f="axispro001" c="ILIMITE" lit="108871"/></c:set>
<c:set var="title3"><axis:alt f="axispro001" c="TFORMUL" lit="9001606"/></c:set>
<c:set var="title4"><axis:alt f="axispro001" c="TCLAVE" lit="9001607"/></c:set>
<c:set var="title5"><axis:alt f="axispro001" c="TVALOR" lit="110263"/></c:set>
 <c:if test="${! empty mntgaran.CUMULOS}">
                        <div class="displayspace">
                          <display:table name="${mntgaran.CUMULOS}" id="miListaIdGC" export="false" class="dsptgtable" pagesize="6" defaultsort="6" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                              requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_cumulos">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.TCUMULO" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGC.OB_IAX_PRODCUMGARAN.TCUMULO }</div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.FFECINI"  headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate value="${miListaIdGC.OB_IAX_PRODCUMGARAN.FFECINI}" pattern="dd/MM/yy" /></div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.FECFIN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon"><fmt:formatDate value="${miListaIdGC.OB_IAX_PRODCUMGARAN.FECFIN}" pattern="dd/MM/yy" /></div>
                            </display:column>
                            <display:column title="${title2}" headerClass="headwidth5 sortable" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.ILIMITE" media="html" autolink="false" >
                                <div class="dspText"> <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGC.OB_IAX_PRODCUMGARAN.ILIMITE}"/></div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.TFORMUL" headerClass="sortable" media="html" autolink="false" >
                               <div class="dspText">${miListaIdGC.OB_IAX_PRODCUMGARAN.TFORMUL}</div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.TCLAVE" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGC.OB_IAX_PRODCUMGARAN.TCLAVE}</div>
                            </display:column>
                            <display:column title="${title5}" headerClass="sortable" sortable="true" sortProperty="OB_IAX_PRODCUMGARAN.TVALOR" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGC.OB_IAX_PRODCUMGARAN.TVALOR}</div>
                            </display:column>
                           
                        </display:table>
                        </div>
     
</c:if>     

</td>
</tr>
</table>