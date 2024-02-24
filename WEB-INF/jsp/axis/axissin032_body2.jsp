<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>                        
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.math.BigDecimal" %>
<c:set var="nombrePantalla" value="preguntas"/>

<script type="text/javascript"></script>

<!-- *****************PREGUNTAS****************** -->
<% int contador = 0; %>
<% int c_chec = 0; %>

<c:if test="${!empty sessionScope.axissin_preguntasSiniestro}">
    <axis:ocultar f="axissin032" c="DSP_PREG" dejarHueco="false">  
        <tr id="preguntas_siniestros">
            <td colspan="3">
                <table>
                    <tr>
                        
                                                           
                                        
                        <td class="titulocaja" style="padding-right:31px">
                            <b><axis:alt c="LIT_PREGUNTES" f="axissin032" lit="102299"/></b>
                            <!-- DisplayTag preguntas -->
                            <c:set var="title0"><axis:alt f="axissin032" c="LIT_800440" lit="800440"/></c:set>
                            <c:set var="title1"><axis:alt f="axissin032" c="LIT_102738" lit="102738"/></c:set> 
                            <c:set var="title2"><axis:alt f="axissin032" c="LIT_103712" lit="103712"/></c:set>
                            <div id="DSP_PREG" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                            <div id="Dt_PREG" style="max-height:none;overflow:hidden;border: 1px solid #DDDDDD;border-right-width: 0px;"> 
                                <display:table name="${sessionScope.axissin_preguntasSiniestro}" id="LSTPREGUNTAS" export="false" class="dsptgtable" 
                                               pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               style="border:1px"  requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <% HashMap formdata = (HashMap)request.getAttribute(axis.util.Constantes.FORMDATA);
                                       String respuesta_j = null;
                                       BigDecimal b_respuesta_j = new BigDecimal(-1); %>
                                       <c:set var="resp_guardada" value=""/>
                                    <%  if (formdata.get("respuesta_"+contador) != null){
                                            if (formdata.get("respuesta_"+contador) instanceof String){
                                                respuesta_j = (String)formdata.get("respuesta_"+contador);%>
                                                <c:set var="resp_guardada" value="<%= respuesta_j %>"/>
                                            <%}else if (formdata.get("respuesta_"+contador) instanceof BigDecimal){
                                                b_respuesta_j = ((BigDecimal)formdata.get("respuesta_"+contador)).divide(new BigDecimal(10));%>
                                                <c:set var="resp_guardada" value="<%= b_respuesta_j %>"/>
                                            <%}else{
                                                respuesta_j = "";
                                            }
                                        }%>
                                    <% if (respuesta_j == null ) { respuesta_j = " "; }%>
                                    <axis:visible f="axissin032" c="DPS_CPREGUN">
                                        <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                            <display:column title="${title0}" sortable="true" sortProperty="CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">${LSTPREGUNTAS.CPREGUN}</div>
                                            </display:column>
                                        </axis:ocultar>
                                    </axis:visible>
                                    <display:column title="${title1}" sortable="true" sortProperty="TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText" id="mipregunta_<%=contador%>">${LSTPREGUNTAS.TPREGUN}</div>
                                        <span style="display:none">${LSTPREGUNTAS.CPREGUN}</span>
                                        <c:if test="${LSTPREGUNTAS.TIMAGEN != null}">
                                            <img border="0" alt="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" src="images/${LSTPREGUNTAS.TIMAGEN}"/>
                                        </c:if>
                                    </display:column>
                                    <display:column style="width:25%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                        <c:choose>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '1' || LSTPREGUNTAS.CTIPPRE == '2'}"> 
                                                <div class="dspIcons">  
                                                    <select <c:if test="${LSTPREGUNTAS.COBLIGA==1}">
                                                                <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                            </c:if>
                                                            <c:if test="${LSTPREGUNTAS.COBLIGA!=1}">
                                                                <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                            </c:if> title="${LSTPREGUNTAS.TPREGUN}"
                                                    name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${LSTPREGUNTAS.CPREGUN}" 
                                                    size="1" style="width:100%" class="campo campotexto">
                                                    <option value="null"> - <axis:alt f="axissin032" c="COMBO_SNV" lit="108341"/> - </option> 
                                                    <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="respuesta">
                                                        <c:if test="${LSTPREGUNTAS.CPREGUN==respuesta.CPREGUN }">
                                                        <option value = "${respuesta.CRESPUE}" 
                                                        <c:if test="${!empty resp_guardada && resp_guardada != 'null'}">
                                                            <c:if test="${respuesta.CRESPUE == resp_guardada}">selected</c:if>
                                                        </c:if>>${respuesta.TRESPUE}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                    </select>
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '3' || LSTPREGUNTAS.CTIPPRE == '5'}"> 
                                                <div class="dspIcons">  
                                                	  <input <c:if test="${LSTPREGUNTAS.COBLIGA==1}">
                                                                <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=true&modificable=true&isInputText=true"/>
                                                            </c:if>
                                                            <c:if test="${LSTPREGUNTAS.COBLIGA!=1}">
                                                                <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=false&modificable=true&isInputText=true"/>
                                                            </c:if> title="${LSTPREGUNTAS.TPREGUN}" type="text" 
                                                           name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${LSTPREGUNTAS.CPREGUN}"
                                                           <c:if test="${empty resp_guardada or resp_guardada == 'null'}">
                                                           	    <c:if test="${!empty LSTPREGUNTAS.NVALDEF}">
                                                                	  value="${LSTPREGUNTAS.NVALDEF}" 
                                                                    <c:if test="${LSTPREGUNTAS.CMODIFI == 1}">
                                                                        disabled
                                                                    </c:if>
                                                                </c:if>
                                                           </c:if>
                                                           <c:if test="${!empty resp_guardada && resp_guardada != 'null'}">
                                                                value="${resp_guardada}" 
                                                           </c:if>
                                                           class="campowidthinput campo campotexto" 
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '9'}"> 
                                                <div class="dspIcons"> 
                                                    <table>
                                                            <% int cont_comun = contador; %>
                                                            <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="respuesta">
                                                            <c:if test="${LSTPREGUNTAS.CPREGUN==respuesta.CPREGUN }">
                                                            <% formdata = (HashMap)request.getAttribute(axis.util.Constantes.FORMDATA);
                                                               respuesta_j = null;
                                                               b_respuesta_j = new BigDecimal(-1); %>
                                                            <c:set var="resp_guardada" value=""/>
                                                            <%  if (formdata.get("respuesta_"+contador) != null){
                                                                    if (formdata.get("respuesta_"+contador) instanceof String){
                                                                        respuesta_j = (String)formdata.get("respuesta_"+contador);%>
                                                                        <c:set var="resp_guardada" value="<%= respuesta_j %>"/>
                                                                    <%}else if (formdata.get("respuesta_"+contador) instanceof BigDecimal){
                                                                            b_respuesta_j = ((BigDecimal)formdata.get("respuesta_"+contador)).divide(new BigDecimal(10));%>
                                                                            <c:set var="resp_guardada" value="<%= b_respuesta_j %>"/>
                                                                    <%}else{
                                                                            respuesta_j = "";
                                                                    }
                                                                }%>
                                                            <% if (respuesta_j == null ) { respuesta_j = " "; }%>
                                                            <tr>
                                                                <td style="border:0px;width:10%;">
                                                                <input <c:if test="${LSTPREGUNTAS.COBLIGA==1}">
                                                                        <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=true&modificable=true&isInputText=false"/>
                                                                        </c:if>
                                                                        <c:if test="${LSTPREGUNTAS.COBLIGA!=1}">
                                                                            <axis:atr f="axissin032" c="CRESPUE" a="obligatorio=false&modificable=true&isInputText=false"/>
                                                                        </c:if> title="${LSTPREGUNTAS.TPREGUN}" type="checkbox" 
                                                                        value ="${respuesta.CRESPUE}" id="respuesta_<%= contador %>"  
                                                                        name="respuesta_<%= contador %>" 
                                                                       class="respuesta_<%= cont_comun %>"
                                                                       <c:if test="${resp_guardada == respuesta.CRESPUE}">checked</c:if>
                                                                       /> 
                                                                </td>
                                                                <td style="text-align:left"><div id="${respuesta.CPREGUN}#<%= c_chec %>">- ${respuesta.TRESPUE} </div></td>
                                                            </tr>
                                                            <% c_chec++; %>
                                                            <% contador++; %>
                                                            </c:if>
                                                            </c:forEach>
                                                    </table>
                                                </div>
                                            </c:when>
                                            <c:otherwise><div class="dspText">${LSTPREGUNTAS.TPREGUN}</div></c:otherwise> 
                                            </c:choose>
                                        </div>
                                    </display:column>
                                    <c:if test="${LSTPREGUNTAS.CMODIFI != 1}">
                                        <c:if test="${__configform.axissin032__DSP_PREG__modificable != 'false'}">
                                            <axis:ocultar f="axissin032" c="BT_EDIT_PREG" dejarHueco="false">
                                                <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" 
                                                                autolink="false">    
                                                    <c:if test="${LSTPREGUNTAS.CTIPPRE == '3' || LSTPREGUNTAS.CTIPPRE == '5'}"> 
                                                        <div class="dspIcons">
                                                            <c:set var="atributos" value=""/>
                                                            <c:choose>
                                                                <c:when test="${LSTPREGUNTAS.CTIPPRE == '3'}"> 
                                                                    <c:if test="${LSTPREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true-"/>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise> <%-- Formato: alfanum?rico --%>
                                                                    <c:if test="${LSTPREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true-"/>
                                                                    </c:if>
                                                                </c:otherwise>                                    
                                                            </c:choose>
                                                            <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'),  document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" src="images/lapiz.gif"/>
                                                        </div>
                                                    </c:if>
                                                </display:column>
                                            </axis:ocultar>
                                        </c:if>
                                    </c:if>
                                    <% contador++; %>
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </axis:ocultar>
</c:if>
<!-- FIN PREGUNTAS -->