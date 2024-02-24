<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
                 
                     <% int contador = 0; %>     
                        <axis:ocultar f="axisctr100" c="DSP_PREG" dejarHueco="false"> 
                        <c:if test="${!empty sessionScope.axisctr100_preguntasPoliza ||
                        !empty sessionScope.axisctr100_pregQuestSalut ||
                        !empty sessionScope.axisctr100_pregDespeses}" >                        	
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TITULO_PREG" lit="1000098" /></div>
                <axis:ocultar f="axisctr100" c="DSP_PREGUNTASRIESGO" dejarHueco="false"> 
                	 <c:if test="${!empty sessionScope.axisctr100_preguntasPoliza}">
                <div class="separador">&nbsp;</div>
                    <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisctr100" c="DESCRIPCION" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr100" c="TPREGUN" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr100" c="TRESPUE" lit="103712"/></c:set>
                                    <!-- <div class="displayspace">  -->
                                    <c:choose>
                                        <c:when test="${__formdata.CCOMPANI == 10}">
                                            <div class="displayspaceAGM">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="displayspace">
                                        </c:otherwise>
                                    </c:choose>									
                                       <display:table name="${sessionScope.axisctr100_preguntasPoliza}" id="miListaId" export="false" class="dsptgtable miListaId_preg1" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr100.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText" id="mipregunta_<%=contador%>">${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                            </display:column>
                                            <display:column  title="${title2}" sortable="false" sortProperty="pregunta" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                <div class="dspIcons">
                                               <c:choose>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:99%" class="campo campotexto" title="<axis:alt f="axisctr100" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> disabled </c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                       <c:if test="${empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}"> 
                                                       <option value="null"> - <axis:alt f="axisctr100" c="SELECCIONAR" lit="108341"/> - </option> 
                                                       </c:if>
                                                            <c:forEach items="${miListaId.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)" formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if>>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',null,this.value)" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        value="${miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto"  title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if>>
                                                    </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisctr100" c="BT_EDIT_PREG">
                                            <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                                 <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> 
                                                        <div class="dspIcons">
                                                            <c:set var="atributos" value=""/>
                                                            <c:choose>
                                                                <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                                    <c:set var="atributos" value="formato=-decimal-"/>        
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise> 
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true-"/>
                                                                    </c:if>
                                                                </c:otherwise>                                    
                                                            </c:choose>
                                                            <a href="javascript:void(0)" id="edit_<%= contador %>" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" title="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" src="images/lapiz.gif"/>
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
                      </c:if>
                </axis:ocultar>
 <c:if test="${!empty sessionScope.axisctr100_pregQuestSalut}">
                <axis:ocultar f="axisctr100" c="DSP_PREGUNTASQUEST" dejarHueco="false">  
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr100" lit="103672"/></b>
                    <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisctr100" c="DESCRIPCION" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr100" c="TPREGUN" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr100" c="TRESPUE" lit="103712"/></c:set>
                                    <div class="displayspace">                         
                                        <display:table name="${sessionScope.axisctr100_pregQuestSalut}" id="miListaId" export="false" class="dsptgtable miListaId_preg2" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr100.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText" id="mipregunta_<%=contador%>">${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                            </display:column>
                                            <display:column  title="${title2}" sortable="false" sortProperty="pregunta" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                <div class="dspIcons">
                                                <c:choose>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:99%" class="campo campotexto" title="<axis:alt f="axisctr100" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> disabled </c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                       <c:if test="${empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}"> 
                                                       <option value="null"> - <axis:alt f="axisctr100" c="SELECCIONAR" lit="108341"/> - </option> 
                                                       </c:if>
                                                            <c:forEach items="${miListaId.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)" formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if>>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',null,this.value)" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        value="${miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto"  title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if>>
                                                    </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisctr100" c="BT_EDIT_PREG">
                                            <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                                 <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> 
                                                        <div class="dspIcons">
                                                            <c:set var="atributos" value=""/>
                                                            <c:choose>
                                                                <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                                    <c:set var="atributos" value="formato=-decimal-"/>        
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise> 
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true-"/>
                                                                    </c:if>
                                                                </c:otherwise>                                    
                                                            </c:choose>
                                                            <a href="javascript:void(0)" id="edit_<%= contador %>" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" title="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" src="images/lapiz.gif"/>
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
<c:if test="${!empty sessionScope.axisctr100_pregDespeses}">                
                <axis:ocultar f="axisctr100" c="DSP_PREGDESPESES" dejarHueco="false"> 
                	<div>
                <div class="separador">&nbsp;</div>
                <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr100" lit="9001509"/></b> 
                    <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0"><axis:alt f="axisctr100" c="DESCRIPCION" lit="800440"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr100" c="TPREGUN" lit="102738"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr100" c="TRESPUE" lit="103712"/></c:set>
                                    <div class="displayspace">                         
                                        <display:table name="${sessionScope.axisctr100_pregDespeses}" id="miListaId" export="false" class="dsptgtable miListaId_preg3" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisctr100.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText" id="mipregunta_<%=contador%>">${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                            </display:column>
                                            <display:column  title="${title2}" sortable="false" sortProperty="pregunta" headerClass="headwidth30 sortable" media="html" autolink="false">
                                                <div class="dspIcons">
                                                <c:choose>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:99%" class="campo campotexto" title="<axis:alt f="axisctr100" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> disabled </c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                       <c:if test="${empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}"> 
                                                       <option value="null"> - <axis:alt f="axisctr100" c="SELECCIONAR" lit="108341"/> - </option> 
                                                       </c:if>
                                                            <c:forEach items="${miListaId.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',this.value)"  formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.##########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas_numericas(this, this.title, true)"</c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> onblur="f_onblur_respuestas_numericas(this, this.title, false)"</c:if>>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input onchange="f_ajax_grabar_preguntas('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}',null,this.value)" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        value="${miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto"  title="<axis:alt f="axisctr100" c="CPREGUN" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> obligatorio='true' onblur="f_onblur_respuestas(this, this.title)"</c:if>>
                                                    </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisctr100" c="BT_EDIT_PREG">
                                            <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                                 <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> 
                                                        <div class="dspIcons">
                                                            <c:set var="atributos" value=""/>
                                                            <c:choose>
                                                                <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                                    <c:set var="atributos" value="formato=-decimal-"/>        
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise> 
                                                                    <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                        <c:set var="atributos" value="obligatorio=-true-"/>
                                                                    </c:if>
                                                                </c:otherwise>                                    
                                                            </c:choose>
                                                            <a href="javascript:void(0)" id="edit_<%= contador %>" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" title="<axis:alt f="axisctr100" c="EDARTEXTO" lit="1000577"/>" src="images/lapiz.gif"/>
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
                 </c:if>       
             </axis:ocultar>
          