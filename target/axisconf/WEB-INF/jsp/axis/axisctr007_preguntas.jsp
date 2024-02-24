<%/* Revision:# NaPftDtJMAsnGgHBVjZrwg== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr028"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr007"/>
    </c:otherwise>
</c:choose>
<% pageContext.setAttribute("newLineChar", "\n"); %>
                 <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr007" c="DSP_PREGUNTAS" lit="1000100" /></div>
                

       <% int contador = 0; %>         
                <c:if test="${!empty sessionScope.axisctr_preguntasRiesgo}">
                
                <!--campos-->
                <axis:ocultar f="axisctr007" c="DSP_PREGUNTASRIESGO" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
               <%-- <b><axis:alt c="LIT_PREGUNTES" f="axisctr007" lit="102299"/></b>--%>
                    <table class="seccion">
                        <tr>
                            <td>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr007" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="LIT_103712" lit="103712"/></c:set>
                                
                                <div id="DSP_PREGUNTASRIESGO" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                <div id="Dt_PREGUNTASRIESGO" class="displayspace">
                                
                              
                                    <display:table name="${sessionScope.axisctr_preguntasRiesgo}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">

                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr007" c="CPREGUN"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                     
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);" <axis:atr f="axisctr007" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr007" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if> --%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999
                                                     <c:if test="${!empty __configform.axisctr007__CRESPUE__modificable && __configform.axisctr007__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input onkeypress="javascript:f_disabled_but_siguiente(true);" formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                  <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}');"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>
                                                <c:otherwise>
                                                
                                                <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1"  onkeypress="javascript:f_disabled_but_siguiente(true);"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}">obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}"> disabled </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                             <input onkeypress="javascript:f_disabled_but_siguiente(true);"  type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}">obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASRIESGO__visible || __configform.axisctr007__DSP_PREGUNTASRIESGO__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                
                                                   
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                         <c:if test="${__configform.axisctr007__DSP_PREGUNTASRIESGO__modificable != 'false'}">
                                        
                                        <axis:visible f="axisctr007" c="BT_EDIT_PREG">
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
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    
                                                    </a>
                                                </div>
                                            </c:if>
                                        </display:column>
                                        </axis:visible>
                                        
                                        </c:if>
                                        
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
                <axis:ocultar f="axisctr007" c="DSP_PREGUNTASQUEST" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr007" lit="103672"/></b>
                    <table class="seccion">
                        <tr>
                            <td>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr007" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="LIT_103712" lit="103712"/></c:set>
                                <div id="DSP_PREGUNTASQUEST" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                <div id="Dt_PREGUNTASQUEST" class="displayspace">
                                    <display:table name="${sessionScope.axisctr_pregQuestSalut}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">

                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr007" c="CPREGUN"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);" <axis:atr f="axisctr007" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr007" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if>--%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999
                                                     <c:if test="${!empty __configform.axisctr007__CRESPUE__modificable && __configform.axisctr007__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input onkeypress="javascript:f_disabled_but_siguiente(true);" formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}');"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>
                                                <c:otherwise>
                                                
                                                     <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" onkeypress="javascript:f_disabled_but_siguiente(true);" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}">disabled</c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                             <input onkeypress="javascript:f_disabled_but_siguiente(true);" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASQUEST__visible || __configform.axisctr007__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                
                                                   
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                         <c:if test="${__configform.axisctr007__DSP_PREGUNTASRIESGO__modificable != 'false'}">
                                        
                                        <axis:visible f="axisctr007" c="BT_EDIT_PREG">
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
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    
                                                    </a>
                                                </div>
                                            </c:if>
                                        </display:column>
                                        </axis:visible>
                                        
                                        </c:if>
                                        
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
                <axis:ocultar f="axisctr007" c="DSP_PREGUNTASDESPESES" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr007" lit="9001509"/></b>
                    <table class="seccion">
                        <tr>
                            <td>
                            
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr007" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="LIT_103712" lit="103712"/></c:set>
                                <div id="DSP_PREGUNTASDESPESES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                <div id="Dt_PREGUNTASDESPESES" class="displayspace">
                                    <display:table name="${sessionScope.axisctr_pregDespeses}" id="miListaIdPreguntas" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:97%"
                                     requestURI="axis_${pantalla}.do?paginar=true">

                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr007" c="CPREGUN"> 
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column title="${title2}" media="html" autolink="false" headerClass="headwidth20 sortable">
                                            <div class="dspIcons">
                                            <c:choose>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                    <select onchange="javascript:f_disabled_but_siguiente(true);" <axis:atr f="axisctr007" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}"> disabled </c:if>>
                                                    	<%--<c:if test="${empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}"> --%>
                                                       <option value="null"> - <axis:alt f="axisctr007" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--</c:if>--%>
                                                        
                                                        <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                            <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>>  ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--26420#c149999
                                                     <c:if test="${!empty __configform.axisctr007__CRESPUE__modificable && __configform.axisctr007__CRESPUE__modificable == 'false'}">
                                                     <c:forEach items="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                        <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">
                                                            <input type="hidden" value="${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}">
                                                         </c:if>
                                                    </c:forEach>
                                                    </c:if>-->
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                    <input onkeypress="javascript:f_disabled_but_siguiente(true);" formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                    <c:if test="${(empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##' value='${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if>
                                                        class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}">obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}">onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if></c:if>
                                                    <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                </c:when>
                                                <c:when test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}');"> 
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr007" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>
                                                <c:otherwise>
                                                
                                                
                                                   <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" onkeypress="javascript:f_disabled_but_siguiente(true);" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}">obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>${fn:replace(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input onkeypress="javascript:f_disabled_but_siguiente(true);" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr007" c="RESPOSTA" lit="102740"/> ${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}">obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if></c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr007__DSP_PREGUNTASDESPESES__visible || __configform.axisctr007__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>
                                                            <c:if test="${miListaIdPreguntas.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                    
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>
                                         <c:if test="${__configform.axisctr007__DSP_PREGUNTASRIESGO__modificable != 'false'}">
                                        
                                        <axis:visible f="axisctr007" c="BT_EDIT_PREG">
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
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    
                                                    </a>
                                                </div>
                                            </c:if>
                                        </display:column>
                                        </axis:visible>
                                        
                                        </c:if>
                                        
                                    <% contador++; %>
                                    </display:table>
                                    </div>
                               
                            </td>
                        </tr>
                    </table>
                  </div>
                </axis:ocultar>
                </c:if>                

                
              
