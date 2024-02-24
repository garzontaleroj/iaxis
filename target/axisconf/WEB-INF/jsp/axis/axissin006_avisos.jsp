<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>      
   
<c:set var="nombrePantalla" value="avisos"/>

<script type="text/javascript">
   
    
</script>

<form name="${nombrePantalla}" action="" method="POST">   
    <table class="seccion">
            <!--campos-->
                 <tr>
                    <td align="left" >
                      <table class="area" align="center">
                        <tr>
                            <td align="left" class="campocaja">
                                <!-- DisplayTag último recibo -->
                                <c:set var="title0"><axis:alt f="axissin006" c="CAVISO" lit="103465" /></c:set>
                                <c:set var="title1"><axis:alt f="axissin006" c="TAVISO" lit="9000642" /></c:set>
                                <c:set var="title2"><axis:alt f="axissin006" c="TTIPAVISO" lit="9902103" /></c:set>
                                <c:set var="title3"><axis:alt f="axissin006" c="TMENSAJE" lit="9902104" /></c:set>
                                
                                <div class="displayspace">
                                
                                    <display:table name="${__formdata.PLSTAVISOS}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_axissin006.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                         <axis:visible f="axissin006" c="CAVISO"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="CAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId.OB_IAX_AVISO.CAVISO}</div>
                                        </display:column>
                                      </axis:visible>
                                      <axis:visible f="axissin006" c="TAVISO">
                                         <display:column title="${title1}" sortable="true" sortProperty="TAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_AVISO.TAVISO}</div>
                                        </display:column>
                                        </axis:visible>
                                      <axis:visible f="axissin006" c="TTIPAVISO">
                                        <display:column title="${title2}" sortable="true" sortProperty="TTIPAVISO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText">${miListaId.OB_IAX_AVISO.TTIPAVISO}</div>
                                        </display:column> 
                                        </axis:visible>
                                      <axis:visible f="axissin006" c="TMENSAJE">
                                        <display:column title="${title3}" sortable="true" sortProperty="TMENSAJE" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                            <div class="dspText"   <c:if test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 1}"> style="color:red" </c:if> >${miListaId.OB_IAX_AVISO.TMENSAJE}</div>
                                        </display:column>  
                                        </axis:visible>
                                      <axis:visible f="axissin006" c="CBLOQUEO">
                                        <display:column title="" sortable="true" sortProperty="CBLOQUEO" headerClass="sortable" style="width:16,6%" media="html" autolink="false" >
                                          <div class="dspIcons">
                                              <c:choose>
                                                  <c:when test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 1}">
                                                    <img border="0" src="images/mensaje_error.gif"   width="16px" height="16px"/>
                                                  </c:when>
                                                  <c:when test="${miListaId.OB_IAX_AVISO.CBLOQUEO == 2}">
                                                    <img border="0" src="images/mensaje_info.gif"  width="16px" height="16px"/>
                                                  </c:when>
                                                  <c:otherwise>
                                                  	<img border="0" src="images/formulap.gif"  width="16px" height="16px"/>
                                                  </c:otherwise>
                                              </c:choose>
                                          </div>
                                        </display:column>   
                                        </axis:visible>
                                                                                                                                                                        
                                    </display:table>
                                </div>
                             </td>
                        </tr>
                       
                       </td>
                    </tr>
                </table>
             </table>
</form>