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
        <c:set var="pantalla" value="${pantalla}"/>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr120"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
 <c:if test="${!empty param.thijos}">
 
 <c:set var="title0"><axis:alt f="${pantalla}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="${pantalla}" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="${pantalla}" c="IPRITOT" lit="1000497"/></c:set>
                                <c:set var="title3"><axis:alt f="${pantalla}" c="IPRITAR" lit="1000496"/></c:set>
                                <c:set var="title4"><axis:alt f="${pantalla}" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="${pantalla}" c="DETGARANT" lit="9901659"></axis:alt></c:set>
                                <c:set var="title6"><axis:alt f="${pantalla}" c="PREGGARANT" lit="9901660"></axis:alt></c:set>
                                <c:set var="title7"><axis:alt f="${pantalla}" c="FRANGARANT" lit="9901661"></axis:alt></c:set>
                                <c:set var="title8"><axis:alt f="${pantalla}" c="CMONCAP" lit="108645"/></c:set>
          <tr id="DSP_DATOS_${param.CGARANTPADRE}_children" style="display:none" >
        <td colspan="10">
        
        <%--table class="area" align="right"  --%>
        <table class="area" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                   <tbody id="garantias" align="right">
                                       <tr>
                                         <c:forEach items="${hijos}" var="miListaIdGarantias" varStatus="yy"> 
                                                  <c:set var = "NDET">${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}</c:set>
                                             </c:forEach>
                                            <axis:visible f="${pantalla}" c="CGARANT">
                                                <th style="width:4%;height:0px"></th>
                                            </axis:visible>
                                              
                                            <axis:visible f="${pantalla}" c="TGARANT">
                                                <th style="width:40%;height:0px"></th>
                                            </axis:visible>
                                            
                                           <axis:visible f="${pantalla}" c="GAR_ICAPITAL">    
                                                <th style="width:10%;height:0px"></th>
                                             </axis:visible>  
                                             <c:if test="${!empty ppartidas && ppartidas eq '1'}">
                                               <axis:visible f="${pantalla}" c="CAPRECOMEND"> 
                                                   <th style="width:8%;height:0px;"></th>
                                              </axis:visible>
                                             </c:if>
                                            <axis:visible f="${pantalla}" c="CMONCAP">
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>
                                             <c:if test="${empty ppartidas || ppartidas eq '0'}">
                                             <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            
                                            <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            
                                          
                                           <c:if test="${!empty NDET}">
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                            </c:if>  
                                            </c:if>
                                            <axis:visible f="${pantalla}" c="DETGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                           
                                           
                                            
                                        </tr>
                                     <c:set var="tamanyo">${fn:length(hijos)}</c:set>
             <c:forEach items="${hijos}" var="miListaIdGarantiasHijos" varStatus="y"> 
                <tr tipo="ri" id="g_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}-${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TGARANT}"
                    onmouseover="this.className = 'resaltar'" onmouseout="this.className = null">
                  <td class="dspText">  
                  <div class = "dspIcons" >
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
                      
                        <!--<img id="img_DSP_DATOS_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}" src="${imagen_mes}" onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}', this,'${imagen_mes}','${imagen_minus}')" style="cursor:pointer"/> -->
                       
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
                            
                    </c:otherwise>
                    </c:choose>
             
                </div>   
        </td>
        
        
      <axis:visible f="${pantalla}" c="TGARANT">
            <td class="dspText">   
                <div class="dspText">
                 ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT} - ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TGARANT}</div>
            </td>
      </axis:visible>
      
      <axis:visible f="axisctr120" c="GAR_ICAPITAL">
            <td class="dspNumber">   
                <div class="dspNumber">
                       <fmt:formatNumber value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPITAL}"
                      pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
              
                    <c:if test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.DESGLOSE  && miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CDETALLE == 1 && fn:length(miListaIdGarantiasHijos.OB_IAX_GARANTIAS.DESGLOSE) > 0}">
                           <!--<a onclick ="f_abrir_axisctr163('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT }')">
                             <img  src="images/mes.gif" title='<axis:alt f="${pantalla}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'   alt='<axis:alt f="${pantalla}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'>
                           </a>  -->
                    </c:if>      
  
                </div>
                </td>
            </axis:visible>
             <c:if test="${!empty ppartidas && ppartidas eq '1'}">
             <axis:visible f="${pantalla}" c="CAPRECOMEND"> 
             <td class="dspText">  
                  <div class="dspNumber">
                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
                  </div>
             </td>
         </axis:visible>
       </c:if>
             <axis:visible f="${pantalla}" c="CMONCAP">
                    <td class="dspText">   
                        <div class="dspText" title="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.TMONCAP}">
                          ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CMONCAPINT}
                         </div>
                    </td>
            </axis:visible>
            <c:if test="${empty ppartidas || ppartidas eq '0'}">
              <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                    <td class="dspNumber">  
                        <div class="dspNumber">
                          <fmt:formatNumber value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.PRIMAS.IPRITOT}"
                             pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                        </div>
                    </td>
                </axis:visible>
                <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                    <td class="dspNumber">  
                        <div class="dspNumber">
                            <fmt:formatNumber value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.PRIMAS.ITOTANU}"
              pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>
                        </div>
                    </td>
                </axis:visible>
                
                 <c:if test="${!empty NDETGAR}">
                     <td class="dspText">  
                            <div class="dspText">
                                ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.TESTADO} 
                            </div>
                        </td>
                    
                     <td class="dspText">  
                            <div class="dspText">
                                ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.NDETGAR} 
                            </div>
                        </td>
                        
                           <td class="dspText">  
                            <div class="dspDate">
                                ><fmt:formatDate value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.FEFECTO}" pattern="dd/MM/yyyy"/>
                            </div>
                        </td>
                        
                          <td class="dspNumber">  
                            <div class="dspNumber">
                                ${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.NDURCOB} 
                            </div>
                        </td>
                        
                        <td class="dspText">  
                            <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.CUNICA == 0}">
                            <div class="dspText"> <axis:alt f="${pantalla}" c="LIT_NO" lit="101779"></axis:alt></div>
                           </c:if>
                           <c:if test="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.CUNICA != 0}">
                            <div class="dspText"> <axis:alt f="${pantalla}" c="LIT_SI" lit="101778"></axis:alt> </div>
                           </c:if>
                        </td>

     
                    </c:if>                 
              </c:if>
                 <axis:visible f="${pantalla}" c="DETGARANT">
                         <td class="dspText">  
                                     <div class="dspIcons">
                                       <!--<img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DETGAR" lit="1000196"></axis:alt>'                                                        
                                         title1='<axis:alt f="${pantalla}" c="LIT_DETGAR" lit="1000196"></axis:alt>'
                                         src="images/mas.gif"
                                         width="11px" height="11px"
                                         style="cursor:pointer;"
                                         onclick="f_abrir_axisctr030('${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.CGARANT}', '${OB_IAX_RIESGOS.NRIESGO}', '${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}')"/>-->
                                    </div>
                              </td>
                        </axis:visible>
                       
                     
                </tr>
                <c:if test="${!empty miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                 <c:set scope="session" var="hijos" value="${miListaIdGarantiasHijos.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                    <c:import url="axisctr120_hijos.jsp">
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