<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<style type="text/css">
tr.resaltar { 
    background-color: #F5FFD7; 
    cursor: pointer; 
} 
</style>
<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr028"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr207"/>
    </c:otherwise>
</c:choose>
 <c:if test="${!empty param.thijos}">
 
 <c:set var="title0"><axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="axisctr207" c="IPRITOT" lit="1000497"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr207" c="IPRITAR" lit="1000496"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr207" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="axisctr207" c="DETGARANT" lit="9901659"></axis:alt></c:set>
                                <c:set var="title6"><axis:alt f="axisctr207" c="PREGGARANT" lit="9901660"></axis:alt></c:set>
                                <c:set var="title7"><axis:alt f="axisctr207" c="FRANGARANT" lit="9901661"></axis:alt></c:set>
                                <c:set var="title8"><axis:alt f="axisctr207" c="CMONCAP" lit="108645"/></c:set>
          <tr id="DSP_DATOS_${param.CGARANTPADRE}_children" style="display:none" >
        <td colspan="10">
        
        <%--table class="area" align="right"  --%>
        <table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                   <tbody id="garantias" align="right">
                                       <tr>
                                        
                                                <th style="width:7%;height:0px"></th>
                                                <c:if test="${empty ppartidas || ppartidas eq '0'}">
                                            <axis:visible f="axisctr207" c="CTARMAN">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                          </c:if>
                                             
                                            <axis:visible f="axisctr207" c="DESCRIPCION">
                                                <th style="width:30%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="ICAPITAL">    
                                                <th style="width:15%;height:0px"></th>
                                             </axis:visible>  
                                             <c:if test="${!empty ppartidas && ppartidas eq '1'}">
                                               <axis:visible f="axisctr207" c="CAPRECOMEND"> 
                                                   <th style="width:8%;height:0px;"></th>
                                              </axis:visible>
                                             </c:if>
                                            <axis:visible f="axisctr207" c="CMONCAP">
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>
                                             <c:if test="${empty ppartidas || ppartidas eq '0'}">
                                             <axis:visible f="axisctr207" c="IPRITAR">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="IPRITOT">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                          </c:if>
                                            <axis:visible f="axisctr207" c="DETGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="PREGGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                             <c:if test="${empty ppartidas || ppartidas eq '0'}">
                                            <axis:visible f="axisctr207" c="FRANGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                          </c:if>
                                            
                                        </tr>
                                     <c:set var="tamanyo">${fn:length(hijos)}</c:set>
             <c:forEach items="${hijos}" var="miListaIdGarantiasHijos" varStatus="y"> 
                <tr tipo="ri" id="g_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}-${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.DESCRIPCION}"
                    onmouseover="this.className = 'resaltar'" onmouseout="this.className = null"
                  >
                  <td class="dspText">  
                  <div  >
                  	<c:set var="ultimo_nodo" value="0"/>
                  <c:choose>
                      <c:when test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                    
                      
                       <c:choose>
                         <c:when test="${tamanyo==(y.count)}">
                              <c:set var="imagen_mes">images/plusbottom.gif</c:set>
                              <c:set var="imagen_minus">images/minusbottom.gif</c:set>
                              <c:set var="ultimo_nodo" value="1"/>
                         </c:when>
                         <c:otherwise>
                             <c:set var="imagen_mes">images/plus.gif</c:set>
                             <c:set var="imagen_minus">images/minus.gif</c:set>
                         </c:otherwise>
                         </c:choose>
                     
                      <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CNIVGAR== 2}">
                        <img src="images/blank.gif"/>
                      </c:if>
                      
                        <img id="img_DSP_DATOS_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" src="${imagen_mes}" onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> 
                         <input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}');"
                        type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" 
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                          __configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                            />
                      </c:when>
                      <c:otherwise>
                     
                      <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CNIVGAR>2 && (empty param.ultimo_nodo_padre || param.ultimo_nodo_padre eq '0')}">
                      <%--c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CNIVGAR>2}"--%>
                        <img src="images/line.gif"/>
                      </c:if>
                      <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CNIVGAR== 2}">
                      <%--c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CNIVGAR== 2}"--%>
                        <img src="images/blank.gif"/>
                      </c:if>
                       <c:if test="${(!empty param.ultimo_nodo_padre && param.ultimo_nodo_padre eq '1')}">
                      	<img src="images/blank.gif"/><img src="images/blank.gif"/>
                      </c:if>
                         <c:choose>
                         <c:when test="${tamanyo==(y.count)}">
                          <img src="images/joinbottom.gif"/>
                         </c:when>
                         <c:otherwise>
                         <img src="images/join.gif"/>
                         </c:otherwise>
                         </c:choose>
                            <input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}');"
                            type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" 
                                <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                                <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                              __configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                />
                    </c:otherwise>
                    </c:choose>
             
                </div>   
        </td>
        <c:if test="${empty ppartidas || ppartidas eq '0'}">
     <axis:visible f="axisctr207" c="CTARMAN">
         <td class="dspText">   
            <div class="dspIcons"><input onclick="javascript:f_actualiza_manual_json(this, '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}');"
                type="checkbox" id="CTARMAN" name="CTARMAN" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN}" 
                    <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN == '1'}">checked='checked'</c:if> />
            </div> 
         </td>
     </axis:visible>
   </c:if>
      <axis:visible f="axisctr207" c="DESCRIPCION">
            <td class="dspText">   
                <div class="dspText">${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.DESCRIPCION}</div>
            </td>
      </axis:visible>
      
      <axis:visible f="axisctr207" c="ICAPITAL">
            <td class="dspText">   
                <c:set var="CAPITAL">
                    <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                        
                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPITAL}"/>
                    </c:if>
                </c:set>
                <div class="dspIcons">
                <c:set var="CLASS">
                    <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                    <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                </c:set>
                <c:choose>
                    <c:when test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                        <select id="ICAPITAL" name="ICAPITAL" onchange="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}');"
                        style="width:120px" class="${CLASS}" <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if>/>                                                                >
                            <c:forEach items="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
                                   <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPITAL==null}">
                                       <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
                                   </c:if>
                                   <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPITAL!=null}">
                                        <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
                                   </c:if>>
                                   ${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL} 
                                </option>
                            </c:forEach>
                        </select>
                    </c:when>
                    
                    <c:otherwise>
                        <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                            <input onfocus="javascript:f_on_focus_capital(this);"
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '3' || miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '5' }">
                                <c:if  test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP != '8'}">
                                onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}');"
                            </c:if>
                            </c:if>
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '3' ||miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '5'||miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '8'}"> readonly</c:if>
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                                                                
                            type="text" id="ICAPITAL" name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="${CLASS}"
                            formato="decimal" title="<axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr207" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                       <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                       <a onclick ="f_abrir_axisctr163('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT }')">
                               <img  src="images/lapiz.gif" title='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />'>
                       </a>
                       
                    </c:if>
                        </c:if>
                    </c:otherwise>
                </c:choose>
  
                </div>
                </td>
            </axis:visible>
             <c:if test="${!empty ppartidas && ppartidas eq '1'}">
             <axis:visible f="axisctr207" c="CAPRECOMEND"> 
             <td class="dspText">  
                  <div class="dspNumber">
                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
                  </div>
             </td>
         </axis:visible>
       </c:if>
             <axis:visible f="axisctr207" c="CMONCAP">
                    <td class="dspText">   
                        <div class="dspText" title="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TMONCAP}">
                          ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CMONCAPINT}
                         </div>
                    </td>
            </axis:visible>
            <c:if test="${empty ppartidas || ppartidas eq '0'}">
             <axis:visible f="axisctr207" c="IPRITAR">
                     <td class="dspText">  
                        <div class="dspNumber">
                            <c:choose>
                            <c:when test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN == 1}">
                             <input     type="text" id="IPRITAR_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" onchange="f_actualiza_imports('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}', this.value, '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITOT}"/>','1')" name="IPRITAR" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITAR}"/>" style="width:90px" class="${CLASS}"
                                        formato="decimal" />
                            </c:when>
                            <c:otherwise>
                            <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITAR}"/>
                            </c:otherwise>
                            </c:choose>
                        </div>
                        </td>
                </axis:visible>
                <axis:visible f="axisctr207" c="IPRITOT">
                    <td class="dspText">  
                        <div class="dspNumber">
                         <c:choose>
                        <c:when test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CTARMAN == 1}">
                         <input     type="text" id="IPRITOT"  name="IPRITOT" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITOT}"/>" style="width:90px" class="${CLASS}"
                                    formato="decimal" onchange="f_actualiza_imports('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}', '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITAR}"/>', this.value)" />
                        </c:when>
                        <c:otherwise>
                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.IPRITOT}"/>
                        </c:otherwise>
                        </c:choose>
                        </div>
                    </td>
                </axis:visible>
              </c:if>
                <axis:visible f="axisctr207" c="DETGARANT">
                         <td class="dspText">  
                            <c:choose>
                                <c:when test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                    <div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}')">D</a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="dspIcons">D</div>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        </axis:visible>
                        <axis:visible f="axisctr207" c="PREGGARANT">
                             <td class="dspText">  
                                <c:choose>
                                    <c:when test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                        <div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}')">P</a></div>
                                    </c:when>
                                <c:otherwise>
                                    <div class="dspIcons">P</div>
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </axis:visible>
                        <c:if test="${empty ppartidas || ppartidas eq '0'}">
                        <axis:visible f="axisctr207" c="FRANGARANT">
                            <td class="dspText">  
                                 <c:choose>
                                    <c:when test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                       <div class="dspIcons"><a onclick ="f_abrir_axisctr013('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}')">F</a></div>
                                    </c:when>
                                     <c:otherwise>
                                         <div class="dspIcons">F</div>
                                     </c:otherwise>
                                 </c:choose>  
                            </td>
                        </axis:visible>
                      </c:if>
                </tr>
                <c:if test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                 <c:set scope="session" var="hijos" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                    <c:import url="axisctr207_hijos.jsp">
                       <c:param name="thijos">
                            ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}
                       </c:param>
                       <c:param name="CGARANTPADRE" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" />
                       	  <c:param name="ppartidas" value="${param.ppartidas}" />
                         	<c:param name="ultimo_nodo_padre" value="${ultimo_nodo}" />
                       	
                    </c:import>
                </c:if>
        </c:forEach>
        </table>
        </td>
        </tr>
        </c:if>