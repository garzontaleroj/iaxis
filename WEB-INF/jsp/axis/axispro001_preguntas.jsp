<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.*" %>

<c:set var="nombrePantalla" value="preguntas"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>


<form name="${nombrePantalla}" action="" method="POST">


                        <c:set var="title0"><fmt:message key="100713" /></c:set>
                        <c:set var="title1"><fmt:message key="101824" /></c:set>
                        <c:set var="title2"><fmt:message key="101697" /></c:set>

<table cellpadding="0" cellspacing="5" class="seccion" style="padding:1% 1% 1% 1%">                                            
   <tr>
   <td>

  
  
<c:set var="title9"><fmt:message key="1000109" /></c:set>
<c:set var="title0"><fmt:message key="102738" /></c:set>
<c:set var="title1"><fmt:message key="500102" /></c:set>
<c:set var="title2"><fmt:message key="100565" /></c:set>
<c:set var="title3"><fmt:message key="9001175" /></c:set>
<c:set var="title4"><fmt:message key="108347" /></c:set>
<c:set var="title5"><fmt:message key="9001550"/></c:set>
<c:set var="title6"><fmt:message key="149903" /></c:set>
<c:set var="title7"><fmt:message key="111496" /></c:set>
<c:set var="title8"><fmt:message key="104960" /></c:set>
<c:set var="title10"><fmt:message key="9001802"/></c:set>

                        <!--div class="displayspace" style="width:99%"-->
                          <display:table name="${mntproducto.PREGUNTAS}" id="miListaId_2" export="false" class="dsptgtable" pagesize="5" sort="list" cellpadding="0" cellspacing="0"
                           requestURI="axis_axispro001.do?paginar=true&operation=preguntas">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.CPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.CPREGUN }</div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.TPREGUN" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TPREGUN}</div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.NPREORD" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspIcon">${miListaId_2.OB_IAX_PRODPREGUNTAS.NPREORD}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNTAS.CPRETIP" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TPRETIP}</div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.CPREOBL" headerClass="sortable" media="html" autolink="false" >
                            <div class="dspText" >
                               <c:choose>
                               <c:when test="${miListaId_2.OB_IAX_PRODPREGUNTAS.CPREOBL == 1}"> 
                              <fmt:message key="101778" />            
                               </c:when>
                               <c:otherwise>
                               <fmt:message key="101779" />   
                               </c:otherwise>
                                </c:choose>   
                            
                            </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.TPREFOR" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TPREFOR}</div>
                            </display:column>
                            <display:column title="${title5}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNTAS.TVALFOR" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TVALFOR}</div>
                            </display:column>
                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.TRESDEF" headerClass="sortable" media="html" autolink="false" >
                                <div class="dspText">${miListaId_2.OB_IAX_PRODPREGUNTAS.TRESDEF}</div>
                            </display:column>
                            <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.COFERSN" headerClass="sortable" media="html" autolink="false" >
                                   <div class="dspText" > 
                                   <c:choose>
                                   <c:when test="${miListaId_2.OB_IAX_PRODPREGUNTAS.COFERSN == 1}"> 
                                   <fmt:message key="101778" />              
                                   </c:when>
                                   <c:otherwise>
                                   <fmt:message key="101779" />   
                                   </c:otherwise>
                                    </c:choose>  
                                  </div>
                            </display:column>
                            <display:column title="${title8}" sortable="true" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODPREGUNTAS.NPREIMP" media="html" autolink="false" >
                                <div class="dspIcon">${miListaId_2.OB_IAX_PRODPREGUNTAS.NPREIMP}</div>
                            </display:column>
                            <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_PRODPREGUNTAS.TNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText" id="TNIVEL">${miListaId_2.OB_IAX_PRODPREGUNTAS.TNIVEL}</div>
                            </display:column>
                        </display:table>
                        <!--/div-->
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     

</td>
</tr>
</table>

   
</form>