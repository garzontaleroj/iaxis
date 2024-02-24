<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="garantias_preguntas"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>


<form name="${nombrePantalla}" action="" method="POST">


   <table class="seccion" align="center" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
   <tr>
   <td>
   
<c:set var="title9"><axis:alt f="axispro001" c="CPREGUN" lit="1000109"/></c:set>
<c:set var="title0"><axis:alt f="axispro001" c="TPREGUN" lit="102738"/></c:set>
<c:set var="title1"><axis:alt f="axispro001" c="NPREORD" lit="500102"/></c:set>
<c:set var="title2"><axis:alt f="axispro001" c="TPRETIP" lit="100565"/></c:set>
<c:set var="title3"><axis:alt f="axispro001" c="CPREOBL" lit="112347"/></c:set>
<c:set var="title4"><axis:alt f="axispro001" c="TPREFOR" lit="108347"/></c:set>
<c:set var="title5"><axis:alt f="axispro001" c="TVALFOR" lit="9001550"/></c:set>
<c:set var="title6"><axis:alt f="axispro001" c="TRESDEF" lit="149903"/></c:set>
<c:set var="title7"><axis:alt f="axispro001" c="COFERSN" lit="111496"/></c:set>
<c:set var="title8"><axis:alt f="axispro001" c="NPREIMP" lit="104960"/></c:set>

                        <div class="displayspace">
                          <display:table name="${mntgaran.PREGUNTAS}" id="miListaIdGPr" export="false" class="dsptgtable" pagesize="6" sort="list" cellpadding="0" cellspacing="0"
                              requestURI="modal_axispro001_garantias.do?paginar=true&subpantalla=garantias_preguntas">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.CPREGUN }</div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.TPREGUN}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.NPREORD}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TPRETIP" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.TPRETIP}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.CPREOBL" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon"> 
                               <c:choose>
                               <c:when test="${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.CPREOBL == 1}"> 
                               <axis:alt f="axispro001" c="CPREOBL1" lit="101778"/>           
                               </c:when>
                               <c:otherwise>
                               <axis:alt f="axispro001" c="CPREOBL2" lit="101779"/>           
                               </c:otherwise>
                                </c:choose>   
                            
                            </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TPREFOR" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.TPREFOR}</div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TVALFOR" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.TVALFOR}</div>
                            </display:column>
                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.TRESDEF" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.TRESDEF}</div>
                            </display:column>
                            <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_PRODPREGUNPROGARAN.COFERSN" headerClass="sortable" media="html" autolink="false" >
                               <div class="dspText" > 
                               <c:choose>
                               <c:when test="${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.COFERSN == 1}"> 
                               <axis:alt f="axispro001" c="COFERSN1" lit="101778"/>            
                               </c:when>
                               <c:otherwise>
                              <axis:alt f="axispro001" c="COFERSN2" lit="101779"/> 
                               </c:otherwise>
                                </c:choose>  
                           </div>
                            </display:column>
                            <display:column title="${title8}" sortable="true"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNPROGARAN.NPREIMP" media="html" autolink="false" >
                                <div class="dspIcon">${miListaIdGPr.OB_IAX_PRODPREGUNPROGARAN.NPREIMP}</div>
                            </display:column>
                        </display:table>
                        </div>
     
     

</td>
</tr>
</table>

   
</form>