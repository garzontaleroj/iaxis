<%/* Revision:# 0jW/bWHTnspWUr/W/suE/A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .displayspaceAGM{
                   -moz-border-bottom-colors: none;
                   -moz-border-left-colors: none;
                   -moz-border-right-colors: none;
                   -moz-border-top-colors: none;
                   border-color: #5B5B5B;
                   border-image: none;
                   border-style: solid;
                   border-width: 1px 0 1px 1px;
                   max-height: 100%;
                   overflow-x: hidden;
                   overflow-y: auto;
                   width: 100%;
                  }
 </style>

                <axis:ocultar f="axisctr004" c="GRPDRENTAS" dejarHueco="false">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_1000099" lit="1000099" /></div>
                <table class="seccion">
                    <tr> 
                        <td align="left">
                            <table class="area" align="center">
                            
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                            
                                <tr>
                                    <axis:ocultar f="axisctr004" c="PCAPFALL" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_PCAPFALL"><axis:alt f="axisctr004" c="LIT_152489" lit="152489" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="PDOSCAB" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_PDOSCAB"><axis:alt f="axisctr004" c="LIT_180148" lit="180148" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CFORPAGREN" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_NFORPAGREN"><axis:alt f="axisctr004" c="LIT_1000180" lit="1000180" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="FPPREN" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_FPPREN"><axis:alt f="axisctr004" c="LIT_9901167" lit="9901167" /></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                <axis:ocultar f="axisctr004" c="PCAPFALL" dejarHueco="false">
                                       <td class="campocaja">
                                           
                                            <c:choose>
                                              <c:when test="${!empty sessionScope.axisctr_datosGestion.PCAPFALL}">
                                            <input type="text" class="campowidt campo campotexto" id="PCAPFALL" name="PCAPFALL" obligatorio='true'  title="<axis:alt f="axisctr004" c="LIT_152489" lit="152489"/>"
                                            size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='${sessionScope.axisctr_datosGestion.PCAPFALL}' />" <axis:atr f="axisctr004" c="PCAPFALL" a="modificable=false&formato=decimal"/>/>&nbsp;
                                              </c:when>
                                              <c:otherwise>
                                                    <input type="text" class="campowidt campo campotexto" id="PCAPFALL" name="PCAPFALL" obligatorio='true'  title="<axis:alt f="axisctr004" c="LIT_152489" lit="152489"/>"
                                                    size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='0' />" <axis:atr f="axisctr004" c="PCAPFALL" a="modificable=false&formato=decimal"/>/>&nbsp;
                                              </c:otherwise>
                                            </c:choose>                                        
                                        
                                        </td>
                                 </axis:ocultar>                                                                    
                                 <axis:ocultar f="axisctr004" c="PDOSCAB" dejarHueco="false">
                                       <td class="campocaja">
                                            <c:choose>
                                              <c:when test="${!empty sessionScope.axisctr_datosGestion.PDOSCAB}">
                                                     <input type="text" class="campowidth campo campotexto" id="PDOSCAB" name="PDOSCAB" obligatorio='true'  title="<axis:alt f="axisctr004" c="LIT_180148" lit="180148"/>"
                                                     size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='${sessionScope.axisctr_datosGestion.PDOSCAB}' />" 
                                                    <c:if test="${sessionScope.axisctr_datosGestion.CPCTREV  == 1}">disabled</c:if>
                                                    <axis:atr f="axisctr004" c="PDOSCAB" a="modificable=false&formato=decimal"/>/>&nbsp;
                                              </c:when>
                                              <c:otherwise>
                                            <input type="text" class="campowidth campo campotexto" id="PDOSCAB" name="PDOSCAB" obligatorio='true'  title="<axis:alt f="axisctr004" c="LIT_180148" lit="180148"/>"
                                                     size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='${sessionScope.axisctr_datosGestion.NPCTREV}' />" 
                                                    <c:if test="${sessionScope.axisctr_datosGestion.CPCTREV  == 1}">disabled</c:if>
                                                    <axis:atr f="axisctr004" c="PDOSCAB" a="modificable=false&formato=decimal"/>/>&nbsp;
                                              </c:otherwise>
                                            </c:choose>
                                        </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr004" c="CFORPAGREN" dejarHueco="false">
                                   <td class="campocaja">
                                            <select name = "CFORPAGREN" style="width:85%" id ="CFORPAGREN" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidth campo campotexto" 
                                                <axis:atr f="axisctr004" c="CFORPAGREN" a="modificable=false&isInputText=false"/>>&nbsp;
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr004" c="LIT_108341" lit="108341"/> - </option>
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosRenta.CFORPAGREN}" var="cforpagren">                                                                                      
                                                    <option value = "${cforpagren.CATRIBU}" <c:if test="${cforpagren.CATRIBU  == sessionScope.axisctr_datosGestion.CFORPAGREN}">selected</c:if>>${cforpagren.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                    </td>
                                </axis:ocultar>    
                                
                                <axis:ocultar f="axisctr004" c="FPPREN" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="FPPREN" name="FPPREN" size="15" title="<axis:alt f="axisctr004" c="LIT_9901167" lit="9901167"/>"
                                        value="<fmt:formatDate value='${sessionScope.axisctr_datosGestion.FPPREN}' pattern='dd/MM/yyyy'/>"
                                        <axis:atr f="axisctr004" c="FPPREN" a="obligatorio=false&formato=fecha"/> /><a id="icon_FPPREN" style="vertical-align:middle;" href="#"><img  border="0" alt="<axis:alt f="axisctr004" c="LIT_9901167" lit="9901167" />" title="<axis:alt f="axisctr004" c="LIT_9901167" lit="9901167" />" src="images/calendar.gif"/></a>
                                    </td>                                  
                               </axis:ocultar>      
                                
                                
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>
                	<axis:ocultar f="axisctr004" c="DSP_PRESTAMOS" dejarHueco="false"> 
              
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_DSP_PRESTAMOS" f="axisctr004" lit="9900870"/></div>                       
                    <table class="seccion">
                    <tr>
                       <td>
                           <table class="area" align="center">
                           	<tr>
                                   <td class="titulocaja">
                                       <b><axis:alt c="LIT_PRESTAMOS" f="axisctr004" lit="9900870"/></b> <%-- Prestamos --%>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="campocaja">
                                       <select name="PRESTAMO" id="PRESTAMO" onchange="f_set_prestamo(this)" size="1" class="campowidthselect campo campotexto" style="width:55%;"
                                       obligatorio="true">&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr004" c="LIT_1000348" lit="1000348"/> - </option> 
                                           <c:forEach var="element" items="${sessionScope.prestamos}">
                                               <option value="${element.OB_IAX_PRESTAMOSEG.IDCUENTA}#${element.OB_IAX_PRESTAMOSEG.CTIPCUENTA}#${element.OB_IAX_PRESTAMOSEG.CTIPBAN}#${element.OB_IAX_PRESTAMOSEG.CTIPIMP}#${element.OB_IAX_PRESTAMOSEG.ISALDO}#${element.OB_IAX_PRESTAMOSEG.PORCEN}#${element.OB_IAX_PRESTAMOSEG.ILIMITE}#${element.OB_IAX_PRESTAMOSEG.ICAPMAX}#${element.OB_IAX_PRESTAMOSEG.CMONEDA}#${element.OB_IAX_PRESTAMOSEG.ICAPMAXPOL}#${element.OB_IAX_PRESTAMOSEG.ICAPASE}#${element.OB_IAX_PRESTAMOSEG.DESCRIPCION}#<fmt:formatDate pattern="dd/MM/yyyy" value="${element.OB_IAX_PRESTAMOSEG.FINIPREST}"/>#<fmt:formatDate pattern="dd/MM/yyyy" value="${element.OB_IAX_PRESTAMOSEG.FFINPREST}"/>"
                                               <c:if test="${1 == element.OB_IAX_PRESTAMOSEG.SELSALDO}"> selected="selected"</c:if>>
                                                   ${element.OB_IAX_PRESTAMOSEG.IDCUENTA} - ${element.OB_IAX_PRESTAMOSEG.DESCRIPCION} - <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${element.OB_IAX_PRESTAMOSEG.ISALDO}"/> - <fmt:formatDate pattern="dd/MM/yyyy" value="${element.OB_IAX_PRESTAMOSEG.FINIPREST}"/> - <fmt:formatDate pattern="dd/MM/yyyy" value="${element.OB_IAX_PRESTAMOSEG.FFINPREST}"/>
                                               </option>
                                           </c:forEach>
                                       </select>
                                       <axis:visible c="BT_HOST_PRESTAMOS" f="axisctr004">
					   <input type="button" class="boton" id="BT_HOST_PRESTAMOS" name ="BT_HOST_PRESTAMOS"   value="<axis:alt c="LIT_BT_HOST_PRESTAMOS" f="axisctr004" lit="9000509"/>" onclick="f_cercarPrestamsHost();" />                      
                                       </axis:visible>
                                        <axis:visible c="BT_NUEVO_PRESTAMO" f="axisctr004">
                                       <a id="icon_PRESTAMO" href="javascript:f_abrir_axisctr103()"><img border="0"  src="images/new.gif"/></a>
                                       </axis:visible>
                                   </td>            
                               </tr>
                           </table>
                       </td>
                   </tr>           
               </axis:ocultar>
               <% int contador = 0; %>

            <axis:ocultar f="axisctr004" c="DSP_DTAPOL" dejarHueco="false"> 
               <c:if test="${!empty sessionScope.axisctr_preguntasPoliza ||
                                !empty sessionScope.axisctr_pregDespeses ||
                                !empty sessionScope.axisctr_pregQuestSalut ||
                                !empty __formdata.CACTIVI}">
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_1000098" lit="1000098" /></div>                       
                    <table class="seccion">
               </c:if>                              
           </axis:ocultar>    
               <axis:ocultar f="axisctr004" c="CACTIVI" dejarHueco="false">                               
                    <tr>
                       <td>
                           <table class="area" align="center">
                               <tr>
                                   <td class="titulocaja">
                                       <b><axis:alt c="CACTIVI" f="axisctr004" lit="103481"/></b> <%-- Actividad --%>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="campocaja">
                                       <select name="CACTIVI" title="<axis:alt f="axisctr004" c="CACTIVI" lit="103481"/>" id="CACTIVI" size="1" class="campowidthselect campo campotexto" style="width:18%;"
                                       <axis:atr f="axisctr004" c="CACTIVI" a="obligatorio=true&isInputText=false"/> 
									   onchange="f_onchange_cactivi(this.value);">
                                            <option value="<%= Integer.MIN_VALUE %>"> - Seleccionar - </option> 
                                           <c:forEach var="element" items="${sessionScope.axisctr_opcionesDatosGestion.lstCactivi}">
                                               <option value="${element.CACTIVI}"
                                               <c:if test="${__formdata.CACTIVI == element.CACTIVI}" >  selected="selected"</c:if>>
                                                   ${element.TTITULO}   
                                               </option>
                                           </c:forEach>
                                       </select>
                                   </td>            
                               </tr>
                           </table>
                       </td>
                   </tr>           
               </axis:ocultar>
                   <% pageContext.setAttribute("newLineChar", "\n"); %>
               <c:if test="${!empty sessionScope.axisctr_preguntasPoliza}">
                    <axis:ocultar f="axisctr004" c="DSP_PREG" dejarHueco="false">  
                        <tr>
                            <td>
                            <table class="area" align="center">
                                <tr>
                                <div id="DSP_PREG" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                <td class="titulocaja">
                                    <b><axis:alt c="LIT_PREGUNTES" f="axisctr004" lit="102299"/></b>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr004" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr004" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr004" c="LIT_103712" lit="103712"/></c:set>

                               <c:choose>
                                   <c:when test="${__formdata.CCOMPANI == 300}">
                                       <div id="Dt_PREG" class="displayspaceAGM">
                                    </c:when>
                                    <c:otherwise>
                                        <div id="Dt_PREG" class="displayspace">
                                    </c:otherwise>
                               </c:choose>

                                    <display:table name="${sessionScope.axisctr_preguntasPoliza}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisctr004.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:ocultar>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column style="width:20%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                            <div class="dspIcons">
                                                <c:choose>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> disabled </c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN == '2913'}"> onchange="actualiza()" </c:if>>
                                                       <%--c:if test="${empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr004" c="COMBO_SNV" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                            <c:set var="isUnicoyObligatorio" value="${fn:length(miListaId.OB_IAXPAR_PREGUNTAS.RESPUESTAS) == 1 && miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}" />
                                                            <c:forEach items="${miListaId.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${((empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE) || isUnicoyObligatorio }">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.########' value='${miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> obligatorio='true'</c:if></c:if>
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> </c:if></c:if>
<c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if> 
                                                        <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> readonly="readonly"</c:if>>
                                                    </c:when>
                                                    <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaId.OB_IAXPAR_PREGUNTAS.CTABLA}');"> 
                                                       <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>
                                                    <c:otherwise>
                                               
                                                         <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                           <textarea cols="20" rows="1" <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/>  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> disabled</c:if>>${fn:replace(miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaId.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREG__visible || __configform.axisctr004__DSP_PREG__visible == 'true'))}"> readonly="readonly"</c:if>
<c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if> >

                                                        </c:otherwise>
                                                        </c:choose>
                                                        
                                                        
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </display:column>
                                        <c:if test="${__configform.axisctr004__DSP_PREG__modificable != 'false'}">
                                         <axis:ocultar f="axisctr004" c="BT_EDIT_PREG" dejarHueco="false">
                                        <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            
                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP != '1' && miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP != '3' }"> <%-- Mostrar icono de lapiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaId.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise> <%-- Formato: alfanumerico --%>
                                                            <c:if test="${miListaId.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'),  document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>

                                        </display:column>
                                        </axis:ocultar>
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

 <c:if test="${!empty sessionScope.axisctr_pregQuestSalut}">
                    <axis:ocultar f="axisctr004" c="DSP_PREGUNTASQUEST" dejarHueco="false">  
                        <tr>
                            <td>
                            <table class="area" align="center">
                                <tr>
                                <div id="DSP_PREGUNTASQUEST" class="displayspaceOver" style="visibility:hidden;height:75px;"></div>
                                <td class="titulocaja">
                                <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr004" lit="103672"/></b> 
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr004" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr004" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr004" c="LIT_103712" lit="103712"/></c:set>
                               
                               
                                <div id="Dt_PREGUNTASQUEST" class="displayspace"> 
                                                         
                                    <display:table name="${sessionScope.axisctr_pregQuestSalut}" id="miListaId2" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisctr004.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:ocultar>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaId2.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column style="width:20%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                            <div class="dspIcons">
                                                <c:choose>
                                                    <c:when test="${miListaId2.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> disabled </c:if>
                                                        <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                       <%--c:if test="${empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr004" c="LIT_108341" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                            <c:set var="isUnicoyObligatorio" value="${fn:length(miListaId2.OB_IAXPAR_PREGUNTAS.RESPUESTAS) == 1 && miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}" />
                                                            <c:forEach items="${miListaId2.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId2.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE || isUnicoyObligatorio}">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId2.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.########' value='${miListaId2.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.########' value='${miListaId2.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
                                                        <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> </c:if> </c:if>
                                                        <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                    </c:when>
                                                    <c:otherwise>
                                                       <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaId2.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1" <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaId2.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
<c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if> 
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> disabled </c:if>>${fn:replace(miListaId2.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaId2.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
<c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if> 
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId2.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId2.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASQUEST__visible || __configform.axisctr004__DSP_PREGUNTASQUEST__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                       
                                                       
                                                        
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </display:column>
                                        <c:if test="${__configform.axisctr004__DSP_PREG__modificable != 'false'}">
                                         <axis:ocultar f="axisctr004" c="BT_EDIT_PREG" dejarHueco="false">
                                        <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de lapiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaId2.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                    <c:when test="${miListaId2.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaId2.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaId2.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaId2.OB_IAXPAR_PREGUNTAS.CTABLA}');"> 
                                                       <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>

                                                        <c:otherwise> <%-- Formato: alfanumerico --%>
                                                            <c:if test="${miListaId2.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'), document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>

                                        </display:column>
                                        </axis:ocultar>
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
                
<c:if test="${!empty sessionScope.axisctr_pregDespeses}">
                <axis:ocultar f="axisctr004" c="DSP_PREGUNTASDESPESES" dejarHueco="false">  
                        <tr>
                            <td>
                            
                            <table class="area" align="center">
                                <tr>
                                <div id="DSP_PREGUNTASDESPESES" class="displayspaceOver" style="visibility:hidden;height:120px;">&nbsp;</div>
                                <td class="titulocaja">
                                <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr004" lit="9001509"/></b>
                                <!-- DisplayTag preguntas -->
                                <c:set var="title0"><axis:alt f="axisctr004" c="LIT_800440" lit="800440"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr004" c="LIT_102738" lit="102738"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr004" c="LIT_103712" lit="103712"/></c:set>
                               
                               
                                <div id="Dt_PREGUNTASDESPESES" class="displayspace"> 
								
                                                    
                                    <display:table name="${sessionScope.axisctr_pregDespeses}" id="miListaId3" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_axisctr004.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                        </axis:ocultar> 
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAXPAR_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" id="mipregunta_<%=contador%>">${miListaId3.OB_IAXPAR_PREGUNTAS.TPREGUN}</div>
                                        </display:column>
                                        <display:column style="width:20%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                            <div class="dspIcons">
                                                <c:choose>
                                                    <c:when test="${miListaId3.OB_IAXPAR_PREGUNTAS.CRESTIP == '1'}"> 
                                                        <select <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=false"/> name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}" size="1" style="width:95%" class="campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                        <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> disabled </c:if>
                                                        <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1')}"> obligatorio='true'</c:if></c:if>>
                                                       <%--c:if test="${empty miListaId.OB_IAXPAR_PREGUNTAS.CRESPUE && empty miListaId.OB_IAXPAR_PREGUNTAS.CRESDEF}"--%> 
                                                       <option value="null"> - <axis:alt f="axisctr004" c="LIT_108341" lit="108341"/> - </option> 
                                                       <%--/c:if--%>
                                                           <c:set var="isUnicoyObligatorio" value="${fn:length(miListaId3.OB_IAXPAR_PREGUNTAS.RESPUESTAS) == 1 && miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}" />
                                                            <c:forEach items="${miListaId3.OB_IAXPAR_PREGUNTAS.RESPUESTAS}" var="respuesta">
                                                                <option value = "${respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE}" <c:if test="${(empty miListaId3.OB_IAXPAR_PREGUNTAS.CRESPUE && miListaId3.OB_IAXPAR_PREGUNTAS.CRESDEF==respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE ) ||respuesta.OB_IAXPAR_RESPUESTAS.CRESPUE == miListaId3.OB_IAXPAR_PREGUNTAS.CRESPUE || isUnicoyObligatorio }">selected</c:if>> ${respuesta.OB_IAXPAR_RESPUESTAS.TRESPUE} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:when test="${miListaId3.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> 
                                                        <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> formato="decimal" type="text" name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                       <c:if test="${(empty miListaId3.OB_IAXPAR_PREGUNTAS.CRESPUE && !empty miListaId3.OB_IAXPAR_PREGUNTAS.CRESDEF)}">value="<fmt:formatNumber pattern='###.########' value='${miListaId3.OB_IAXPAR_PREGUNTAS.CRESDEF}'/>"</c:if>
                                                        <c:if test="${!empty miListaId3.OB_IAXPAR_PREGUNTAS.CRESPUE}">value="<fmt:formatNumber pattern='###.########' value='${miListaId3.OB_IAXPAR_PREGUNTAS.CRESPUE}'/>"</c:if> class="campowidthinput campo campotexto" style="width:95%"  title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                        <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
                                                        <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL != '1'}"> <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> </c:if></c:if>
                                                        <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                    </c:when>
                                                     <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${fn:containsIgnoreCase(miListaId3.OB_IAXPAR_PREGUNTAS.TRESPUE, '<br />')}">
                                                          <textarea cols="20" rows="1"  <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" style="width:95%"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaId3.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}">disabled</c:if>>${fn:replace(miListaId3.OB_IAXPAR_PREGUNTAS.TRESPUE,"<br />",newLineChar)}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input <axis:atr f="axisctr004" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" style="width:95%"  name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.TPREGUN}"
                                                            value="${miListaId3.OB_IAXPAR_PREGUNTAS.TRESPUE}"  class="campowidthinput campo campotexto" title="<axis:alt f="axisctr004" c="RESPOSTA" lit="102740"/> ${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}"
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}"> <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP != '2' && !(miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1' && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> obligatorio='true' </c:if></c:if>
<c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CTIPPRE == '4'}"> formato="fecha" </c:if>
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '2' || (miListaId3.OB_IAXPAR_PREGUNTAS.CPRETIP == '3' && miListaId3.OB_IAXPAR_PREGUNTAS.ISALTAC == '1'  && (empty __configform.axisctr004__DSP_PREGUNTASDESPESES__visible || __configform.axisctr004__DSP_PREGUNTASDESPESES__visible == 'true'))}"> readonly="readonly" </c:if>>
                                                        </c:otherwise>
                                                        </c:choose>
                                                    
                                                        
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </display:column>
                                        <c:if test="${__configform.axisctr004__DSP_PREGUNTASDESPESES__modificable != 'false'}">
                                         <axis:ocultar f="axisctr004" c="BT_EDIT_PREG" dejarHueco="false">
                                        <display:column title="" sortable="false" sortProperty="pregunta" headerClass="headwidth5 sortable" media="html" autolink="false">    
                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CRESTIP != '1'}"> <%-- Mostrar icono de lapiz si no es combo --%>
                                                <div class="dspIcons">
                                                    <c:set var="atributos" value=""/>
                                                    <c:choose>
                                                        <c:when test="${miListaId3.OB_IAXPAR_PREGUNTAS.CRESTIP == '2'}"> <%-- Formato: decimal --%>
                                                            <c:set var="atributos" value="formato=-decimal-"/>        
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true- formato=-decimal-"/>        
                                                            </c:if>
                                                        </c:when>
                                                    <c:when test="${miListaId3.OB_IAXPAR_PREGUNTAS.CRESTIP == '3'}"> 
                                                   <a href="javascript:void(0)" onClick="f_abrir_188('${miListaId3.OB_IAXPAR_PREGUNTAS.CPREGUN}','${miListaId3.OB_IAXPAR_PREGUNTAS.TPREGUN}','${miListaId3.OB_IAXPAR_PREGUNTAS.CTABLA}');"> 
                                                       <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.PREGTABLA == 0}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                       <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.PREGTABLA == 1}"> 
                                                            <%--img border="0" alt="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" title="<axis:alt f="axisctr007" c="EDITAR" lit="1000577"/>" src="images/lapiz.gif"/--%>
                                                            <b style="color:red"><axis:alt f="axisctr004" c="INFORMAR" lit="9903703"/></b>
                                                       </c:if>
                                                   </a>
                                                  
                                                  
                                                  
                                                  </c:when>

                                                        <c:otherwise> <%-- Formato: alfanumerico --%>
                                                            <c:if test="${miListaId3.OB_IAXPAR_PREGUNTAS.CPREOBL == '1'}">
                                                                <c:set var="atributos" value="obligatorio=-true-"/>
                                                            </c:if>
                                                        </c:otherwise>                                    
                                                    </c:choose>
                                                    <a href="javascript:void(0)" onClick="objEdicionTexto.abrirEditorTexto('respuesta_<%= contador %>', document.getElementById('respuesta_<%= contador %>'),  document.getElementById('mipregunta_<%= contador %>').innerText, '${atributos}');"> <img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axisctr004" c="LIT_1000577" lit="1000577"/>" src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                            </c:if>

                                        </display:column>
                                        </axis:ocultar>
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
