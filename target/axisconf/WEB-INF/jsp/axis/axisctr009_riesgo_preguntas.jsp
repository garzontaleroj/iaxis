<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
    }
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
%>
<axis:visible c="DSP_TOT_PREGUNTAS_RIESGO" f="axisctr009">
 <c:if test="${!empty OB_IAX_RIESGOS.PREGUNTAS || !empty  OB_IAX_RIESGOS.pregQuestSalut || !empty  OB_IAX_RIESGOS.pregDespeses}">
                        <tr>
                            <td class="campocaja">
                                <div style="float:left;">
                                    <img id="DSP_TOT_PREGUNTAS_RIESGO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('DSP_TOT_PREGUNTAS_RIESGO', this)"
                                         style="cursor:pointer"/>
                                   <b><axis:alt c="LIT_TOT_PREGUNTAS_RIESGO" f="axisctr009" lit="102299"/></b>
                                </div>
                                <div style="clear:both;">
                                    <hr class="titulo"></hr>
                                </div>
                            </td>
                        </tr>
                        <tr id="DSP_TOT_PREGUNTAS_RIESGO_children"
                            style="display:none">
                            <td class="campocaja">
                                <c:if test="${!empty OB_IAX_RIESGOS.PREGUNTAS}">
                                    <axis:visible c="PREGUNTAS_RIESGO"
                                                  f="axisctr009">
                                        <table class="area" align="center">
                                            <tr>
                                                <td class="campocaja">
                                                   
                                                </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_RIESGO_children">
                                                <td class="campocaja">
                                                    <div class="displayspace">
                                                        <c:set var="title0">                                                            
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTAS_RIESGO_children" lit="800440" />
                                                        </c:set>
                                                         
                                                        <c:set var="title1">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTAS_title1" lit="102738" />
                                                        </c:set>
                                                         
                                                        <c:set var="title2">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTAS_title2" lit="103712" />
                                                        </c:set>
                                                         
                                                        <display:table name="${OB_IAX_RIESGOS.PREGUNTAS}"
                                                                       id="PREGUNTAS_RIESGO"
                                                                       export="false"
                                                                       class="dsptgtable"
                                                                       pagesize="-1"
                                                                       sort="list"
                                                                       cellpadding="0"
                                                                       cellspacing="0"
                                                                       requestURI="axis_axisctr009.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible f="axisctr009"
                                                                          c="CPREGUNRIES">
                                                                <display:column title="${title0}"
                                                                                sortable="true"
                                                                                sortProperty="OB_IAX_PREGUNTAS.CPREGUN"
                                                                                headerClass="headwidth5 sortable"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <display:column title="${title1}"
                                                                            sortable="true"
                                                                            sortProperty="OB_IAX_PREGUNTAS.TPREGUN"
                                                                            headerClass="sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title2}"
                                                                            sortable="false"
                                                                            headerClass="headwidth30 sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    <c:choose>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                            ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE}
                                                                        </c:when>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                             ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE}
                                                                        </c:when>
                                                                         <c:when test="${!empty PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                         <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}','R');"> 
                                                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                          </a>
                                                                         </c:when>
                                                                       
                                                                    </c:choose>
                                                                     
                                                                </div>
                                                            </display:column>
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </axis:visible>
                                </c:if>
                                <c:if test="${! empty OB_IAX_RIESGOS.pregQuestSalut}">
                                    <axis:visible c="DSP_PREGUNTAS_RIESGO_QUESTSALUT"
                                                  f="axisctr009">
                                        <table class="area" align="center">
                                            <div class="separador">&nbsp;</div>
                                            <tr>
                                                <td class="campocaja">
                                                    <img id="DSP_PREGUNTAS_RIESGO_QUESTSALUT_parent"
                                                         src="images/mes.gif"
                                                         onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_RIESGO_QUESTSALUT', this)"
                                                         style="cursor:pointer"/>
                                                    <b><axis:alt c="LIT_RISC_PREG_QUESTSALUT"
                                                                 f="axisctr009"
                                                                 lit="103672"/></b>
                                                    <hr class="titulo"></hr>
                                                </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_RIESGO_QUESTSALUT_children"
                                                style="display:none">
                                                <td class="campocaja">
                                                    <div class="displayspace">
                                                        <c:set var="title0">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASQUESTSALUT_title0" lit="800440" />
                                                        </c:set>
                                                         
                                                        <c:set var="title1">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASQUESTSALUT_title1" lit="102738" />                                                            
                                                        </c:set>
                                                         
                                                        <c:set var="title2">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASQUESTSALUT_title0" lit="103712" />                                                                                                                        
                                                        </c:set>
                                                         
                                                        <display:table name="${OB_IAX_RIESGOS.pregQuestSalut}"
                                                                       id="PREGUNTAS_RIESGO"
                                                                       export="false"
                                                                       class="dsptgtable"
                                                                       pagesize="-1"
                                                                       sort="list"
                                                                       cellpadding="0"
                                                                       cellspacing="0"
                                                                       requestURI="axis_axisctr009.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible f="axisctr009"
                                                                          c="CPREGUNRIES">
                                                                <display:column title="${title0}"
                                                                                sortable="true"
                                                                                sortProperty="OB_IAX_PREGUNTAS.CPREGUN"
                                                                                headerClass="headwidth5 sortable"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <display:column title="${title1}"
                                                                            sortable="true"
                                                                            sortProperty="OB_IAX_PREGUNTAS.TPREGUN"
                                                                            headerClass="sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title2}"
                                                                            sortable="false"
                                                                            headerClass="headwidth30 sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    <c:choose>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                            ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE}
                                                                        </c:when>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                             ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE}
                                                                        </c:when>
                                                                         <c:when test="${!empty PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                         <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}','R');"> 
                                                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                          </a>
                                                                         </c:when>
                                                                       
                                                                    </c:choose>
                                                                </div>
                                                            </display:column>
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </axis:visible>
                                </c:if>
                                <c:if test="${! empty OB_IAX_RIESGOS.pregDespeses}">
                                    <axis:visible c="DSP_PREGUNTAS_RIESGO_DESPESES"
                                                  f="axisctr009">
                                        <table class="area" align="center">
                                            <div class="separador">&nbsp;</div>
                                            <tr>
                                                <td class="campocaja">
                                                    <img id="DSP_PREGUNTAS_RIESGO_DESPESES_parent"
                                                         src="images/mes.gif"
                                                         onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_RIESGO_DESPESES', this)"
                                                         style="cursor:pointer"/>
                                                    <b><axis:alt c="LIT_RISC_PREG_DESPESES"
                                                                 f="axisctr009"
                                                                 lit="9001509"/></b>
                                                    <hr class="titulo"></hr>
                                                </td>
                                            </tr>
                                            <tr id="DSP_PREGUNTAS_RIESGO_DESPESES_children"
                                                style="display:none">
                                                <td class="campocaja">
                                                    <div class="displayspace">
                                                        <c:set var="title0">      
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASDESPESES_title0" lit="800440" />
                                                        </c:set>
                                                         
                                                        <c:set var="title1">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASDESPESES_title1" lit="102738" />
                                                        </c:set>
                                                         
                                                        <c:set var="title2">
                                                            <axis:alt f="axisctr009" c="DSP_PREGUNTASDESPESES_title2" lit="103712" />
                                                        </c:set>
                                                         
                                                        <display:table name="${OB_IAX_RIESGOS.pregDespeses}"
                                                                       id="PREGUNTAS_RIESGO"
                                                                       export="false"
                                                                       class="dsptgtable"
                                                                       pagesize="-1"
                                                                       sort="list"
                                                                       cellpadding="0"
                                                                       cellspacing="0"
                                                                       requestURI="axis_axisctr009.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                                            <%@ include file="../include/displaytag.jsp"%>
                                                            <axis:visible f="axisctr009"
                                                                          c="CPREGUNRIES">
                                                                <display:column title="${title0}"
                                                                                sortable="true"
                                                                                sortProperty="OB_IAX_PREGUNTAS.CPREGUN"
                                                                                headerClass="headwidth5 sortable"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspNumber">
                                                                        ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}
                                                                    </div>
                                                                </display:column>
                                                            </axis:visible>
                                                            <display:column title="${title1}"
                                                                            sortable="true"
                                                                            sortProperty="OB_IAX_PREGUNTAS.TPREGUN"
                                                                            headerClass="sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}
                                                                </div>
                                                            </display:column>
                                                            <display:column title="${title2}"
                                                                            sortable="false"
                                                                            headerClass="headwidth30 sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                <div class="dspText">
                                                                    <c:choose>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                                                            ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TRESPUE}
                                                                        </c:when>
                                                                        <c:when test="${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                                                             ${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CRESPUE}
                                                                        </c:when>
                                                                         <c:when test="${!empty PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                                                         <a href="javascript:void(0)" onClick="f_abrir_188('${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.CPREGUN}','${PREGUNTAS_RIESGO.OB_IAX_PREGUNTAS.TPREGUN}','R');"> 
                                                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                                                          </a>
                                                                         </c:when>
                                                                       
                                                                    </c:choose>
                                                                </div>
                                                            </display:column>
                                                        </display:table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </axis:visible>
                                </c:if>
                            </td>
                        </tr>
                    </c:if>
                    </axis:visible>