<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<c:choose>
    <c:when test="${param.multiformulari == 'true'}">
        <c:set var="formulari" value="axisctr028"/>
    </c:when>
    <c:otherwise>
        <c:set var="formulari" value="${formulari}"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="formulari" value="axisctr009"/>
    </c:when>
    <c:otherwise>
        <c:set var="formulari" value="${param.f}"/>
    </c:otherwise>
</c:choose>
 <axis:visible f="${formulari}" c="PARTIDAS">
 	
 													 <div class="titulo" style="color:black" >
                                  <div style="float:left;">
                                  <b ><axis:alt f="${formulari}" c="PARTIDES" lit="9901925" /></b>
                                </div>
                                     
                                  </div>
                <table class="area">
                    <tr>
                        <td>
                           
                            <!-- DisplayTag Partidas -->
                            <c:if test="${! empty sessionScope.axisctr_partidas  }">
                            <c:set var="title00">
                                 <axis:alt f="${formulari}" c="CGARANT" lit="1000109"></axis:alt>                                        
				</c:set>
                                <c:set var="title0"><axis:alt f="${formulari}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="${formulari}" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                               
                                <c:if test="${!empty __formdata.num_partidas && __formdata.num_partidas > 0 }">
                                    <c:set var="num_par"> <fmt:formatNumber pattern="###,###,###,###,###,###.##" value= ${__formdata.num_partidas}/></c:set><!--  -->
                                </c:if>
                            <c:set var="title0"><axis:alt f="${formulari}" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="${formulari}" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="${formulari}" c="IPRITOT" lit="1000497"/></c:set>
                                <c:set var="title3"><axis:alt f="${formulari}" c="IPRITAR" lit="1000496"/></c:set>
                                <c:set var="title4"><axis:alt f="${formulari}" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="${formulari}" c="DETGARANT" lit="9901659"></axis:alt></c:set>
                                <c:set var="title6"><axis:alt f="${formulari}" c="PREGGARANT" lit="9901660"></axis:alt></c:set>
                                <c:set var="title7"><axis:alt f="${formulari}" c="FRANGARANT" lit="9901661"></axis:alt></c:set>
                                <c:set var="title8"><axis:alt f="${formulari}" c="CMONCAP" lit="108645"/></c:set>
                                <c:set var="title44">                                
                                    <axis:alt f="${formulari}" c="DETGARANT" lit="1000113"></axis:alt> 				
				</c:set>
                                
                                          
                                         
                                            
                                        
                             <div class="displayspace" >
                                  <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdPartidas">
                                      <thead>
                                            <tr>
                                                <th style="width:7%;height:0px"></th>
                                            <%--axis:visible f="${formulari}" c="CTARMAN">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible--%>
                                            
                                             
                                            <axis:visible f="${formulari}" c="TGARANT">
                                                <th style="width:30%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="ICAPITAL">    
                                                <th style="width:15%;height:0px"></th>
                                             </axis:visible>  
                                              <axis:visible f="${formulari}" c="CAPRECOMEND"> 
                                                <th style="width:10%;height:0px"></th>
                                              </axis:visible>
                                            <axis:visible f="${formulari}" c="CMONCAP">
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>
                                           
                                            <axis:visible f="${formulari}" c="DETGARANT_PARTIDAS">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                          
                                        </tr>
                                        <tr>   
                                                <td class="sortable" align="center"><b>${title00}</b></td>
                                         
                                              
                                            <axis:visible f="${formulari}" c="TGARANT">
                                                <td class="sortable"><b>${title0}</b></td>
                                            </axis:visible>
                                            
                                            <axis:visible f="${formulari}" c="ICAPITAL">
                                                <td class="sortable"><b>${title1}</b></td>                                        
                                            </axis:visible>
                                             <axis:visible f="${formulari}" c="CAPRECOMEND"> 
                                                  <td class="sortable"><b><axis:alt f="${formulari}" c="CAPRECOMEND" lit="9903813"/></b></td>     
                                              </axis:visible>
                                            <axis:visible f="${formulari}" c="CMONCAP">
                                                <td class="sortable"><b>${title8}</b></td>                                        
                                            </axis:visible>
                                           
                                            <axis:visible f="${formulari}" c="DETGARANT_PARTIDAS">
                                                  <td class="sortable"><b>${title44}</b></td>                                        
                                            </axis:visible>
                                            
                                            
                                          
                                        </tr>   
                                        </thead>
                                           <tbody >
                                                
                                                   <c:forEach items="${sessionScope.axisctr_partidas}" var="miListaIdPartidas" varStatus="x"> 
                                                 
                                                      <tr  tipo="ri" id="g_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}-${miListaIdPartidas.OB_IAX_GARANTIAS.TGARANT}"
                                                        <c:if test="${x.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
                                                        <c:if test="${x.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>
                                                          >
                                        
                                                            <td class="dspText" align="left">   
                                                                  <div align="left" >
                                                                  
                                                                  <c:choose>
                                                                      <c:when test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                        <img id="img_DSP_DATOS_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" src="images/mes.gif" onclick="toggleDisplay2('DSP_DATOS_${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}', this)" style="cursor:pointer"/> 
                                                                        
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                      
                                                                       <img src="images/blank.gif"/>
                                                                      
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    
                                                                    ${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}
                                                                </div>   
                                                            </td>
                                                        
                                                          
                                                          <axis:visible f="${formulari}" c="TGARANT">
                                                                <td class="dspText">   
                                                                    <div class="dspText">${miListaIdPartidas.OB_IAX_GARANTIAS.TGARANT}</div>
                                                                </td>
                                                          </axis:visible>
                                                          <axis:visible f="${formulari}" c="ICAPITAL">
                                                                <td class="dspNumber">  
                                                                     <div class="dspNumber">
                                                                        <fmt:formatNumber pattern="###,###,###,###,###,###.##" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                                     </div>
                                                                </td>
                                                                </axis:visible>
                                                        <axis:visible f="${formulari}" c="CAPRECOMEND"> 
                                                             <td class="dspNumber">  
                                                                  <div class="dspNumber">
                                                                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
                                                                  </div>
                                                             </td>
                                                         </axis:visible>
                                                             <axis:visible f="${formulari}" c="CMONCAP">
                                                                    <td class="dspText">   
                                                                        <div class="dspText" title="${miListaIdPartidas.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdPartidas.OB_IAX_GARANTIAS.TMONCAP}">
                                                                          ${miListaIdPartidas.OB_IAX_GARANTIAS.CMONCAPINT}
                                                                         </div>
                                                                    </td>
                                                            </axis:visible>
                                                                
                                                                    <axis:visible f="${formulari}" c="DETGARANT_PARTIDAS">
                                                                             <td class="dspText">  
                                                                                 <div class="dspIcons">
                                                                                           <img border="0"
                                                                                             alt='<axis:alt f="${formulari}" c="LIT_DETGAR" lit="1000196"></axis:alt>'                                                        
                                                                                             title1='<axis:alt f="${formulari}" c="LIT_DETGAR" lit="1000196"></axis:alt>'
                                                                                             src="images/mas.gif"
                                                                                             width="11px" height="11px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="f_abrir_axisctr030('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}', '${OB_IAX_RIESGOS.NRIESGO}', '${miListaIdPartidas.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}')"/>
                                                                                        </div>
                                                                            </td>
                                                                            </axis:visible>
                                                                           
                                                                            </tr>
                                                                                <c:if test="${!empty miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                                        <c:set scope="session" var="hijos" value="${miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                                                                                            <c:import url="axisctr009_hijos.jsp">
                                                                                                <c:param name="thijos" value="${miListaIdPartidas.OB_IAX_GARANTIAS.T_IAX_HIJOS}" />
                                                                                                	<c:param name="ppartidas" value="1" />
                                                                                                <c:param name="CGARANTPADRE" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" />
                                                                                            </c:import>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                            </table>
                                    </div>
                              
                            </c:if>
                       
                        </td>
                    </tr>
                </table>
                <div class="separador">&nbsp;</div>
            </axis:visible>
                   