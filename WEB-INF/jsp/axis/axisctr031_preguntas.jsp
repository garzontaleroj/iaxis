<%/**
*  Fichero: axisctr031.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". És el cuerpo 
*
*
*  Fecha: 12/03/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr032"/>
        <c:set var="literalPantalla" value="1000198"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr031"/>
        <c:set var="literalPantalla" value="1000197"/>
    </c:otherwise>
</c:choose>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<% pageContext.setAttribute("newLineChar", "\n"); %>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="DSP_PREGUNTAS" lit="1000100" /></div>
                <% int contador = 0; %>
                <c:if test="${!empty sessionScope.axisctr_preguntasRiesgo}">
                
                <!--campos-->
                <axis:ocultar f="axisctr031" c="DSP_PREGUNTASRIESGO" dejarHueco="false">  
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREGUNTES" f="axisctr031" lit="102299"/></b>
                  
                    <table class="seccion">
                        <tr>
                            <td>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr031" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr031" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr031" c="LIT_103712" lit="103712"/></c:set>
                                <div class="displayspaceGrande">
                                <c:set var="num_risc">${fn:length(sessionScope.axisctr_preguntasRiesgo)}</c:set>
                                <div id="DSP_PREGUNTASRIESGO" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_risc*20+20}"/>px">&nbsp;</div>
                                
                                <div id="Dt_PREGUNTASRIESGO" class="displayspace" style="height:<c:out value="${num_risc*20+20}"/>px;max-height:<c:out value="${num_risc*20+20}"/>px">
                                    <display:table name="${sessionScope.axisctr_preguntasRiesgo}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr031" c="CPREGUN"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible> 
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);"  <axis:atr f="axisctr031" c="CRESPUE" a="modificable=true&isInputText=false"/>  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr031" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if>--%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999
                                                    <c:if test="${!empty __configform.axisctr031__CRESPUE__modificable && __configform.axisctr031__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                
                                                
                                                   <input onkeypress="javascript:f_disabled_but_siguiente(true);" <c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA}">formato="decimal"</c:if> type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PATTERN_DECIMAL}' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PATTERN_DECIMAL}' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}">obligatorio='true' <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}" >onblur="f_onblur_respuestas_numericas(this, this.title, true)" </c:if> </c:if></c:if>
                                                    <c:if test="${(empty NO_VALIDA || NO_VALIDA == 0) && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"><c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}" > onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if></c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:otherwise>
                                                
                                                
                                                      <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" onkeypress="javascript:f_disabled_but_siguiente(true);"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                             class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input onkeypress="javascript:f_disabled_but_siguiente(true);" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                
                                                    
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                        <axis:visible f="axisctr031" c="BT_EDIT_PREG">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                        <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de lápiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanumérico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), '${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}', '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                        </c:if>
                                        </display:column>    
                                        </axis:visible>                                        
                                    <% contador++; %>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                  </div>
                </axis:ocultar>
                </c:if>
<c:if test="${!empty sessionScope.axisctr_pregQuestSalut}">
                
                <!--campos-->
                <axis:ocultar f="axisctr031" c="DSP_PREGUNTASQUEST" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr031" lit="103672"/></b>
                    <table class="seccion">
                        <tr>
                            <td>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr007" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="LIT_103712" lit="103712"/></c:set>
                                <!-- <div class="displayspace"> -->
                                <c:set var="num_preg">${fn:length(sessionScope.axisctr_pregQuestSalut)}</c:set>
                                <div id="DSP_PREGUNTASQUEST" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_preg*20+20}"/>px">&nbsp;</div>
                                 
                                <div id="Dt_PREGUNTASQUEST" class="displayspace" style="height:<c:out value="${num_preg*20+20}"/>px;max-height:<c:out value="${num_preg*20+20}"/>px" >
                                    <display:table name="${sessionScope.axisctr_pregQuestSalut}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr031" c="CPREGUNRIES"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible> 
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}">
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);" <axis:atr f="axisctr031" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASQUEST__visible || __configform.axisctr031__DSP_PREGUNTASQUEST__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr031" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if> --%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999<c:if test="${!empty __configform.axisctr031__CRESPUE__modificable && __configform.axisctr031__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                  <input type="text" onchange="javascript:f_disabled_but_siguiente(true);" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/>  ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN} "${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}" 
                                                   <c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA}">formato="decimal"</c:if> 
                                                   <c:if test="${(sessionScope.valjoinlife == '1' && (sessionScope.isjoinlife == '2' || sessionScope.isjoinlife == '3')  && (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN == '77' || miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN == '88'))}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)" </c:if> 
                                                   <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}"> value="<fmt:formatNumber pattern='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PATTERN_DECIMAL}' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                   <c:if test="${(empty NO_VALIDA || NO_VALIDA == 0) && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}" >onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if></c:if></c:if>
                                                   <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> obligatorio='true' <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}"> onblur="f_onblur_respuestas_numericas(this, this.title, true)" </c:if> </c:if> </c:if> </input>
                                                </c:when>	
                                                <c:otherwise>
                                                
                                                  <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" onkeypress="javascript:f_disabled_but_siguiente(true);"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                             class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASQUEST__visible || __configform.axisctr031__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if> </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASQUEST__visible || __configform.axisctr031__DSP_PREGUNTASQUEST__visible == 'true'))}">disabled </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input onkeypress="javascript:f_disabled_but_siguiente(true);" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASQUEST__visible || __configform.axisctr031__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if> </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASQUEST__visible || __configform.axisctr031__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                
                                                   
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                        <axis:visible f="axisctr031" c="BT_EDIT_PREG">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                        <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de lápiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanumérico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), '${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}', '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                        </c:if>
                                        </display:column>    
                                        </axis:visible>                                        
                                    <% contador++; %>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                  </div>
                </axis:ocultar>
                </c:if>
<c:if test="${!empty sessionScope.axisctr_pregDespeses}">
                
                <!--campos-->
                <axis:ocultar f="axisctr031" c="DSP_PREGDESPESES" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
                <axis:visible f="axisctr031" c="DATOSRIESGO"> 
                <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr031" lit="9001509"/></b> 
                    <table class="seccion">
                        <tr>
                            <td>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr007" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="LIT_103712" lit="103712"/></c:set>
                                <c:set var="num_desp">${fn:length(sessionScope.axisctr_pregDespeses)}</c:set>
                                <div id="DSP_PREGUNTASDESPESES" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_desp*20+20}"/>px">&nbsp;</div>
                                <div id="Dt_PREGUNTASDESPESES" class="displayspace" style="height:<c:out value="${num_desp*20+20}"/>px;max-height:<c:out value="${num_desp*20+20}"/>px">                                
                                <!-- <div class="displayspace"> -->
                                
                                    <display:table name="${sessionScope.axisctr_pregDespeses}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr031" c="CPREGUNRIES"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible> 
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);" <axis:atr f="axisctr031" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGDESPESES__visible || __configform.axisctr031__DSP_PREGDESPESES__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr031" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if> --%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999
                                                    <c:if test="${!empty __configform.axisctr031__CRESPUE__modificable && __configform.axisctr031__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                   <input onkeypress="javascript:f_disabled_but_siguiente(true);" <c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA}">formato="decimal"</c:if> type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PATTERN_DECIMAL}' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PATTERN_DECIMAL}' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}">obligatorio='true' <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}" >onblur="f_onblur_respuestas_numericas(this, this.title, true)" </c:if> </c:if></c:if>
                                                    <c:if test="${(empty NO_VALIDA || NO_VALIDA == 0) && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${ miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.NO_VALIDA )}" >onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if></c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGUNTASRIESGO__visible || __configform.axisctr031__DSP_PREGUNTASRIESGO__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:otherwise>
                                                
                                                 <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" onkeypress="javascript:f_disabled_but_siguiente(true);"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                             class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGDESPESES__visible || __configform.axisctr031__DSP_PREGDESPESES__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGDESPESES__visible || __configform.axisctr031__DSP_PREGDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input onkeypress="javascript:f_disabled_but_siguiente(true);" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr031" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGDESPESES__visible || __configform.axisctr031__DSP_PREGDESPESES__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr031__DSP_PREGDESPESES__visible || __configform.axisctr031__DSP_PREGDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                
                                                    
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                        <axis:visible f="axisctr031" c="BT_EDIT_PREG">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                        <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de lápiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanumérico --%>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), '${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}', '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr031" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                        </c:if>
                                        </display:column>    
                                        </axis:visible>                                        
                                    <% contador++; %>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </axis:visible>
                  </div>
                </axis:ocultar>
                </c:if>
