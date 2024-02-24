<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="tramitaciones"/>
<c:set var="nombreSeccion" value="preguntas"/>
<c:set var="formulari" value="axissin006"/>
<c:if test="${!empty param.f}">
    <c:set var="formulari">${param.f}</c:set>
</c:if>
<script type="text/javascript">
   
   
</script>

<form name="${nombrePantalla}${nombreSeccion}" action="" method="POST"> 
<!--  PREGUNTAS -->
    <table class="seccion">
    <% int contador = 0; %>
    <% int c_chec = 0; %>

<c:if test="${!empty sessionScope.axissin_preguntasSiniestro}">
    <axis:ocultar f="axissin032" c="DSP_PREG" dejarHueco="false">  
        <tr>
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
                            <div id="Dt_PREG" class="displayspace" style="max-height:none;height:auto;overflow:hidden;border: 1px solid #DDDDDD;border-right-width: 0px;"> 
                                <display:table name="${sessionScope.axissin_preguntasSiniestro}" id="LSTPREGUNTAS" export="false" class="dsptgtable" 
                                               pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               style="border:1px"  requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axissin032" c="DPS_CPREGUN">
                                    <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                        <display:column title="${title0}" sortable="true" sortProperty="CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${LSTPREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                    </axis:ocultar>
                                    </axis:visible>
                                    <display:column title="${title1}" sortable="true" sortProperty="TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText" id="mipregunta_<%=contador%>">${LSTPREGUNTAS.TPREGUN}</div>
                                        <c:if test="${LSTPREGUNTAS.TIMAGEN != null}">
                                            <img border="0" alt="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" src="images/${LSTPREGUNTAS.TIMAGEN}"/>
                                        </c:if>
                                    </display:column>
                                    <display:column style="width:25%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                        <c:choose>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '1' || LSTPREGUNTAS.CTIPPRE == '2'}"> 
                                                <div class="dspIcons">        
                                                    <select <axis:atr f="axissin032" c="CRESPUE" a="modificable=true&isInputText=false"/> disabled name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${LSTPREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto">
                                                    <option value="null"> - <axis:alt f="axissin032" c="COMBO_SNV" lit="108341"/> - </option> 
                                                        <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="valores_respuesta">
                                                        <c:if test="${LSTPREGUNTAS.CPREGUN==valores_respuesta.CPREGUN }">
                                                        <option value = "${valores_respuesta.CRESPUE}" 
                                                        <c:forEach items="${LSTPREGUNTAS.TRESPUESTAS}" var="respuesta">
                                                        <c:if test="${valores_respuesta.CRESPUE == respuesta.OB_IAX_SIN_RESPUESTAS.CRESPUE}">selected</c:if>
                                                        </c:forEach>>${valores_respuesta.TRESPUE}</option>
                                                        </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '3' || LSTPREGUNTAS.CTIPPRE == '5'}"> 
                                                <div class="dspIcons">        
                                                    <input <axis:atr f="axissin032" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" disabled
                                                           name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${LSTPREGUNTAS.CPREGUN}"
                                                           value="${LSTPREGUNTAS.TRESPUESTAS[0].OB_IAX_SIN_RESPUESTAS.TRESPUE}"
                                                           class="campowidthinput campo campotexto" title="<axis:alt f="axissin032" c="RESPOSTA" lit="102740"/> ${LSTPREGUNTAS.CPREGUN}"
                                                           <c:if test="${LSTPREGUNTAS.CTIPPRE == '3'}"> formato="decimal" </c:if>>
                                                    
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '9'}"> 
                                                <div class="dspIcons"> 
                                                    <table>
                                                            <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="respuesta">
                                                            <c:if test="${LSTPREGUNTAS.CPREGUN==respuesta.CPREGUN }">
                                                            <tr>
                                                                <td style="border:0px;width:10%;">
                                                                <input type="checkbox" value = "${respuesta.OB_IAX_SIN_RESPUESTAS.CRESPUE}" id="respuesta_<%= contador %>"  
                                                                       name="respuesta_<%= contador %>" class="respuesta_<%= contador %>" disabled 
                                                                       <c:forEach items="${LSTPREGUNTAS.TRESPUESTAS}" var="valores_respuesta">
                                                                       <c:if test="${respuesta.CRESPUE == valores_respuesta.OB_IAX_SIN_RESPUESTAS.CRESPUE}">checked</c:if>
                                                                       </c:forEach>/> 
                                                                </td>
                                                                <td style="text-align:left"><div id="<%= c_chec %>">${respuesta.TRESPUE} </div></td>
                                                            </tr>
                                                            <% c_chec++; %>
                                                            </c:if>
                                                            </c:forEach>
                                                    </table>
                                                </div>
                                            </c:when>
                                            <c:otherwise><div class="dspText">${LSTPREGUNTAS.TPREGUN}</div></c:otherwise> 
                                            </c:choose>
                                        </div>
                                    </display:column>
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
    </table>
</form>