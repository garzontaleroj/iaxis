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

<%--SINIESTROS--%>
 <axis:visible c="DSP_SINIESTROS_RIESGO" f="${pantalla}">
 <c:if test="${ ! empty lstsiniestros_riesgo }">
 <div class="separador">&nbsp;</div> 
                        <table class="area" align="center">       
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_SINIESTROS_RIESGO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SINIESTROS_RIESGO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="TIT_SIN_RIESG" lit="100592" /></b>
                        </div>                        
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>
                    </td>
                </tr>
                <tr id="DSP_SINIESTROS_RIESGO_children" style="display:none">
                    <td class="campocaja" >
                    <c:set var="title0"><axis:alt f="${pantalla}" c="NPOLIZA" lit="100624"/></c:set> <!-- póliza -->
                    <c:set var="title1"><axis:alt f="${pantalla}" c="NSINIES" lit="800279"/></c:set> <!-- Nº siniestro -->
                    <c:set var="title2"><axis:alt f="${pantalla}" c="TRIESGO" lit="102524"/></c:set> <!-- Riesgo -->
                    <c:set var="title3"><axis:alt f="${pantalla}" c="TESTSIN" lit="112259"/></c:set> <!-- Estat sinistre -->
                    <c:set var="title4"><axis:alt f="${pantalla}" c="TPRODUC" lit="1000111"/></c:set> <!-- Producto -->                    
                    <c:set var="title5"><axis:alt f="${pantalla}" c="BT_MASDATOS_SINIESTROS_RIESGO" lit="103101"/></c:set> <!-- Consultar -->

                     <div class="displayspace">

                        <display:table name="${lstsiniestros_riesgo}" id="LISTASINIESTROS_RIESGO" export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_${pantalla}.do?paginar=true&subseccion=DSP_SINIESTROS_RIESGO" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>

                        <%--  --%>
                        <display:column title="${title0}" sortable="true" sortProperty="NPOLIZA" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS_RIESGO['NPOLIZA']}</div>
                        </display:column>
                        <display:column title="${title1}" sortable="true" sortProperty="NSINIES" style="width:8%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS_RIESGO['NSINIES']}</div>
                        </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="TRIESGO" style="width:20%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS_RIESGO['TRIESGO']}</div>
                        </display:column>                        
                        <display:column title="${title3}" sortable="true" sortProperty="TESTSIN" style="width:10%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS_RIESGO['TESTSIN']}</div>
                        </display:column>   
                        <display:column title="${title4}" sortable="true" sortProperty="TPRODUC" style="width:20%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTASINIESTROS_RIESGO['TPRODUC']}</div>
                        </display:column>                       
                        
                       <!------------------------------------------------------------------------------------------------------------------------------------------------------>
                        
                        <axis:visible f="${pantalla}" c="BT_MASDATOS_SINIESTROS_RIESGO">
                             <display:column title="${title5}" headerClass="sortable fixed" media="html" style="width:7%;" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="lit1" lit="1000113"/>" title1="<axis:alt f="${pantalla}" c="lit1" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                style="cursor:pointer;"   onclick="f_seleccionar_siniestro('${LISTASINIESTROS_RIESGO['NSINIES']}')"  />
                                </div>
                            </display:column>   <%--onmouseout="javascript:ocultar('SECCION_A${LISTAAPUNTESAGENDA['NLINEA']}')"--%>
                        </axis:visible>                           
                        </display:table>

                    </div>

                    </td>
                </tr>
                   </table>
</c:if>
</axis:visible>                  	





