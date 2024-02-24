<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>

<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>

<p>
    <%@ page import="java.util.ArrayList"%><%@ page import="java.util.HashMap" %>
</p>

<c:if test="${!empty T_IAX_PSU_RETENIDAS}">
    <axis:visible c="DSP_TOT_RECHAZOS" f="${pantalla}">
        <tr>
            <td class="campocaja" >
                <div style="float:left;">
                    <img id="DSP_RAZONES_RECHAZO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RAZONES_RECHAZO', this)" style="cursor:pointer"/> 
                        <b><axis:alt c="LIT_RAZONES_RECHAZO" f="${pantalla}" lit="89905631"/></b> 
                </div>
                <axis:visible f="${pantalla}" c="LAPIZ1" >
                    <div style="float:right;" id="RAZONES_RECHAZO" c="LAPIZ1"></div>
                </axis:visible>
                <div class="seccion_suplementos" id="SECCION_RAZONES_RECHAZO"></div>
                    <div style="clear:both;">
                        <hr class="titulo">
                    </div>    
            </td>
        </tr>
        
        <tr id="DSP_RAZONES_RECHAZO_children" style="display:none">
            <td class="campocaja" >
                <table class="area" align="center">
                    <tr>
                        <td class="campocaja"></td>
                    </tr>
                    <tr>   
                        <td class="campocaja" >
                            <div class="displayspace">
                                <c:set var="title0"><axis:alt f="axisctr020" c="REASREJ" lit="9906608" /></c:set>   <!-- Reason for Rejection -->
                                <c:set var="title1"><axis:alt f="axisctr020" c="OBSERV"  lit="101162" /></c:set>    <!-- Observations -->
                                <c:set var="title3"><axis:alt f="axisctr020" c="POSTPER" lit="9908345" /></c:set>   <!-- Postpone Period -->
                                <c:set var="title2"><axis:alt f="axisctr020" c="PERIOD"  lit="106053" /></c:set>    <!-- Period -->
                                
                                <c:set var="title4"><axis:alt f="axisctr020" c="CODENF"  lit="103465" /></c:set>    <!-- Codigo Enfermedad -->
                                <c:set var="title5"><axis:alt f="axisctr020" c="DESENF"  lit="100588" /></c:set>    <!-- Descripcion Enfermedad -->
                                <c:set var="title6"><axis:alt f="axisctr020" c="TFFECAUT"  lit="9902241" /></c:set>    <!-- Rejection Date -->
                                <c:set var="title7"><axis:alt f="axisctr020" c="TCUSUAUT"  lit="9908523" /></c:set>    <!-- Rejection User -->
                                         
                                <display:table name="${T_IAX_PSU_RETENIDAS}" id="T_IAX_PSU_RETENIDAS" export="false" 
                                               class="dsptgtable" pagesize="-1"
                                               sort="list" cellpadding="0" cellspacing="0" 
                                               requestURI="axis_${pantalla}.do?paginar=true&tabla=T_IAX_PSU_RETENIDAS">
                                    <%@ include file="../include/displaytag.jsp"%>
                                                  
                                    <display:column title="${title0}" sortable="true" 
                                                                      sortProperty="CDETMOTREC_DESC" headerClass="headwidth5 sortable"  
                                                                      media="html" autolink="false"
                                                                      style="width: 20%;">
                                        <div class="dspText">${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.CDETMOTREC_DESC}</div>
                                    </display:column>
                                                         
                                    <display:column title="${title1}" sortable="true" 
                                                                      sortProperty="OBSERV" headerClass="sortable"  media="html" autolink="false" style="width: 30%;">
                                        <div class="dspText">${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.OBSERV}</div>
                                    </display:column>
                                    
                                    <c:if test="${!empty T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.POSTPPER}">
                                        <display:column title="${title3}" sortable="true" 
                                                                          sortProperty="POSTPPER_DESC" headerClass="sortable"  media="html" autolink="false" style="width: 10%;">
                                            <div class="dspText">${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.POSTPPER}</div>
                                        </display:column>
                                    </c:if>
                                    <c:if test="${!empty T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.PERPOST_DESC}">
                                        <display:column title="${title2}" sortable="true" 
                                                                          sortProperty="PERPOST" headerClass="sortable"  media="html" autolink="false" style="width: 30%;">
                                            <div class="dspText">${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.PERPOST_DESC}</div>
                                        </display:column>
                                    </c:if>
                                    
                                    <axis:visible f="${pantalla}" c="TFFECAUT">
                                    <display:column title="${title6}" sortable="true" 
                                                    sortProperty="FFECAUT" 
                                                    headerClass="sortable"  
                                                    media="html" 
                                                    autolink="false" 
                                                    style="width: 30%;">
                                        <div class="dspText">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.FFECAUT}"/>                                            
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="${pantalla}" c="TCUSUAUT">
                                    <display:column title="${title7}" sortable="true" 
                                                    sortProperty="CUSUAUT" 
                                                    headerClass="sortable"  
                                                    media="html" 
                                                    autolink="false" 
                                                    style="width: 30%;">
                                        <div class="dspText">
                                            ${T_IAX_PSU_RETENIDAS.OB_IAX_PSU_RETENIDAS.CUSUAUT}
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    
                                </display:table>
                                <br></br>
                                <c:if test="${!empty ENFERMEDADES}">
                                    <display:table name="${ENFERMEDADES}" id="ENFERMEDADES" export="false" 
                                                   class="dsptgtable" pagesize="-1"
                                                   sort="list" cellpadding="0" cellspacing="0" 
                                                   requestURI="axis_${pantalla}.do?paginar=true&tabla=ENFERMEDADES">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                        <display:column title="${title4}" sortable="true" 
                                                                          sortProperty="CODENF" headerClass="headwidth5 sortable"  
                                                                          media="html" autolink="false"
                                                                          style="width: 20%;">
                                            <div class="dspText">${ENFERMEDADES.OB_IAX_ENFERMEDADES_BASE.CODENF}</div>
                                        </display:column>
                                                      
                                        <display:column title="${title5}" sortable="true" 
                                                                          sortProperty="DESENF" headerClass="headwidth5 sortable"  
                                                                          media="html" autolink="false"
                                                                          style="width: 80%;">
                                            <div class="dspText">${ENFERMEDADES.OB_IAX_ENFERMEDADES_BASE.DESENF}</div>
                                        </display:column>
                                    </display:table>   
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </table>                              
            </td>
        </tr>
    </axis:visible>
</c:if>