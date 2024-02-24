<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<c:set var="nombrePantalla" value="garantias_datosgenerales"/>

<script type="text/javascript">

</script>

<form name="${nombrePantalla}" action="" method="POST">
                <c:set var="title1"><axis:alt f="axispro001" c="LIT_TITLE1" lit="1000073"/></c:set>
                <c:set var="title2"><axis:alt f="axispro001" c="LIT_TITLE2" lit="500102"/></c:set>
                <c:set var="title3"><axis:alt f="axispro001" c="LIT_TITLE3" lit="100713"/></c:set>
                <c:set var="title4"><axis:alt f="axispro001" c="LIT_TITLE4" lit="103313"/></c:set>
    <table class="seccion" cellpadding="0" cellspacing="5" style="padding:1% 1% 1% 1%">
        <tr>
            <th style="width:15%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:20%;height:0px"></th>
            <th style="width:20%;height:0px"></th>
            <th style="width:15%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="NORDEN" lit="500102"/> </b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TGARANT" lit="110994"/> </b> 
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TTIPGAR" lit="102517"/> </b>
            </td>
            <c:choose>
            <c:when test="${mntgaran.CTIPGAR == 3 ||mntgaran.CTIPGAR == 4}"> 
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="TGARDEP" lit="1000489"/></b>
                </td>
            </c:when>
            <c:when test="${mntgaran.CTIPGAR == 5 ||mntgaran.CTIPGAR == 6}"> 
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="CPARDEP" lit="1000326"/>  </b>
                </td>
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="CVALPAR" lit="1000381"/>  </b>
                </td>
            </c:when>
        </c:choose> 
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="NORDEN" value="${mntgaran.NORDEN}" class="campowidthinput campo campotexto" style="width:40%"
                <axis:atr f="axispro001" c="NORDEN" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TGARANT" value="${mntgaran.TGARANT}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TGARANT" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TTIPGAR" value="${mntgaran.TTIPGAR}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="TTIPGAR" a="modificable=false"/> />
            </td>
            <c:choose>
                <c:when test="${mntgaran.CTIPGAR == 3 ||mntgaran.CTIPGAR == 4}"> 
                    <td align="left" class="campocaja">
                        <input type="text" name="TGARDEP" value="${mntgaran.TGARDEP}" class="campowidthinput campo campotexto" style="width:100%"
                        <axis:atr f="axispro001" c="TGARDEP" a="modificable=false"/> />
                    </td>
                </c:when>
                <c:when test="${mntgaran.CTIPGAR == 5 ||mntgaran.CTIPGAR == 6}"> 
                    <td align="left">
                        <input type="text" name="CPARDEP" value="${mntgaran.TPARDEP}" class="campowidthinput campo campotexto" style="width:60%"
                        <axis:atr f="axispro001" c="CPARDEP" a="modificable=false"/> />
                    </td>
                    <td align="left">
                        <input type="text" name="CVALPAR" value="${mntgaran.TVALPAR}" class="campowidthinput campo campotexto" style="width:60%"
                        <axis:atr f="axispro001" c="CVALPAR" a="modificable=false"/> />
                    </td>
                </c:when>
            </c:choose> 
        </tr>  
        <tr>
            <td class="titulocaja" align="left">
                <b><axis:alt f="axispro001" c="CTARJET" lit="104384"/></b>
                <input type="checkbox" name="CTARJET" value="${mntgaran.CTARJET}" 
                <c:if test="${mntgaran.CTARJET == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CTARJET" a="modificable=false"/> disabled/>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CBASICA" lit="1000490"/> </b>
                <input type="checkbox" name="CBASICA" value="${mntgaran.CBASICA}" 
                <c:if test="${mntgaran.CBASICA == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CBASICA" a="modificable=false"/> disabled/>
            </td>
        </tr>
        <tr>
            <fmt:formatNumber var="capmaxis" pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${mntgaran.ICAPMAX}"/>
            <fmt:formatNumber var="capmin" pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${mntgaran.ICAPMIN}"/>
            <fmt:formatNumber var="primin" pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${mntgaran.IPRIMIN}"/>
            <fmt:formatNumber var="primaxis" pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${mntgaran.IPRIMAX}"/>
            <fmt:formatNumber var="caprev" pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${mntgaran.ICAPREV}"/>
                
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TTIPCAP" lit="1000488"/> </b>
            </td>
            <c:choose>
               <c:when test="${mntgaran.CTIPCAP == 1}"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axispro001" c="ICAPMAX" lit="100563"/>  </b>
                    </td>
                </c:when>
                <c:when test="${mntgaran.CTIPCAP == 2 ||mntgaran.CTIPCAP == 3 || mntgaran.CTIPCAP == 6}"> 
                     <td class="titulocaja">
                            <b><axis:alt f="axispro001" c="TCAPMAX" lit="100563"/> </b>
                        </td>
                    <c:choose>
                        <c:when test="${mntgaran.CCAPMAX == 1}"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axispro001" c="ICAPMAX" lit="100563"/> </b>
                            </td>
                        </c:when>
                     <%--    <c:when test="${mntgaran.CCAPMAX == 2}"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axispro001" c="CCAPMAX" lit="1000489"/> </b>
                            </td>
                        </c:when>  
                        <c:when test="${mntgaran.CCAPMAX == 4}"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axispro001" c="CCAPMAX" lit="108347"/> </b>
                            </td>
                        </c:when>  --%>
                    </c:choose> 
                </c:when>
                <c:when test="${mntgaran.CTIPCAP == 5 ||mntgaran.CTIPCAP == 9}"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axispro001" c="CFORMUL" lit="108347"/> </b>
                    </td>
                </c:when>
                
            </c:choose> 
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="TCAPMIN" lit="1000493"/></b>
                </td>
                <td class="titulocaja">
                    <b><axis:alt f="axispro001" c="ICAPREV" lit="1000494"/> </b>
                </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="TTIPCAP" value="${mntgaran.TTIPCAP}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="TTIPCAP" a="modificable=false"/> />
            </td>
    <%--    </tr>
        <tr> 
            
       </tr>
       <tr>--%>
            <c:choose>
               <c:when test="${mntgaran.CTIPCAP == 1}"> 
                    <td align="left">
                        <input type="text" name="ICAPMAX" value="${capmaxis}" class="campowidthinput campo campotexto" style="width:60%"
                        <axis:atr f="axispro001" c="ICAPMAX" a="modificable=false"/> />
                    </td>
                </c:when>
                <c:when test="${mntgaran.CTIPCAP == 2 ||mntgaran.CTIPCAP == 3 || mntgaran.CTIPCAP == 6}"> 
                        <td align="left">
                            <input type="text" name="TCAPMAX" value="${mntgaran.TCAPMAX}" class="campowidthinput campo campotexto" style="width:60%"
                            <axis:atr f="axispro001" c="TCAPMAX" a="modificable=false"/> />
                        </td>
                    <c:choose>
                        <c:when test="${mntgaran.CCAPMAX == 1}"> 
                            <td align="left">
                                <input type="text" name="ICAPMAX" value="${capmaxis}"  class="campowidthinput campo campotexto" style="width:80%"
                                <axis:atr f="axispro001" c="ICAPMAX" a="modificable=false"/> />
                            </td>
                        </c:when>
                      <%--   <c:when test="${mntgaran.CCAPMAX == 2}"> 
                            <td align="left">
                                <input type="text" name="TGARDEP" value="${mntgaran.TGARDEP}" class="campowidthinput campo campotexto" style="width:80%"
                                <axis:atr f="axispro001" c="TGARDEP" a="modificable=false"/> />
                            </td>
                        </c:when>  
                        <c:when test="${mntgaran.CCAPMAX == 4}"> 
                            <td align="left">
                                <input type="text" name="CCLACAP" value="${mntgaran.CCLACAP}" class="campowidthinput campo campotexto" style="width:60%"
                                <axis:atr f="axispro001" c="CCLACAP" a="modificable=false"/> />
                            </td>
                        </c:when>  --%>
                    </c:choose> 
                </c:when>
                <c:when test="${mntgaran.CTIPCAP == 5 ||mntgaran.CTIPCAP == 9}"> 
                    <td align="left">
                        <input type="text" name="CFORMUL" value="${mntgaran.CFORMUL}" class="campowidthinput campo campotexto" style="width:60%"
                        <axis:atr f="axispro001" c="CFORMUL" a="modificable=false"/> />
                    </td>
                </c:when>
                
            </c:choose>
                <td align="left">
                    <input type="text" name="TCAPMIN" value="${capmin}" class="campowidthinput campo campotexto" style="width:80%"
                    <axis:atr f="axispro001" c="TCAPMIN" a="modificable=false"/> />
                </td>
                <td align="left">
                    <input type="text" name="ICAPREV" value="${caprev}" class="campowidthinput campo campotexto" style="width:80%"
                    <axis:atr f="axispro001" c="ICAPREV" a="modificable=false"/> />
                </td>
       </tr>
       <tr></tr>
       <c:choose>
        <c:when test="${mntgaran.CTIPCAP == 7}"> 
                <tr>
                    <td align="left" colspan="2">  
                        <c:set var="title1"><axis:alt f="axispro001" c="NORDEN" lit="500102"/></c:set>
                        <c:set var="title2"><axis:alt f="axispro001" c="ICAPITAL" lit="9001933"/></c:set>
                        <c:set var="title3"><axis:alt f="axispro001" c="CDEFECTO" lit="100713"/></c:set>
                        <display:table name="${__formdata.GARANPROCAP}" id="miListaIdGD" export="false" class="dsptgtable" pagesize="6"   cellpadding="0" cellspacing="0"  style="text-align:center;spacing-left:15%">
                                <%@ include file="../include/displaytag.jsp"%>
                            <display:column title="${title1}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.ICAPITAL" media="html" autolink="false" style="text-align:center; width:20%" sortable="true">
                                <div class="dspText" > ${miListaIdGD.OB_IAX_PRODGARANPROCAP.NORDEN}</div>
                            </display:column>
                            <display:column title="${title2}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.ICAPITAL" media="html" autolink="false" style="text-align:center; width:50%" sortable="true">
                                <div class="dspText" > <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGD.OB_IAX_PRODGARANPROCAP.ICAPITAL}"/></div>
                            </display:column>
                            <display:column title="${title3}" headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODGARANPROCAP.CDEFECTO" media="html" autolink="false" style="text-align:center; width:30%" sortable="true">
                                <c:choose>
                                    <c:when test="${miListaIdGD.OB_IAX_PRODGARANPROCAP.CDEFECTO == 1}"> 
                                        <input type="radio" name="CDEFECTO" checked disabled>              
                                    </c:when>
                                    <c:otherwise>
                                        <input type="radio" name="CDEFECTO" disabled>              
                                    </c:otherwise>
                                </c:choose>  
                            </display:column>
                        </display:table>   
                    </td>
                </tr>
                </c:when>
        </c:choose>
       
        <c:choose> 
            <c:when test="${mntgaran.CTIPCAP == 3 || mntgaran.CTIPCAP == 6}">
                <tr>     
                    <td class="titulocaja" colspan="2">
                        <b><axis:alt f="axispro001" c="TGARDEP" lit="1000489"/> </b>
                    </td>
                </tr>
                <tr>     
                     <td align="left">
                            <input type="text" name="TGARDEP" value="${mntgaran.TGARDEP}" class="campowidthinput campo campotexto" style="width:93%"
                            <axis:atr f="axispro001" c="TGARDEP" a="modificable=false"/> />
                            
                    </td>
                    <td align="left" class="campocaja">
                        <input type="text" name="PCAPDEP" value="${mntgaran.PCAPDEP}" class="campowidthinput campo campotexto" style="width:20%"
                        <axis:atr f="axispro001" c="PCAPDEP" a="modificable=false"/> /> %
                    </td>
                </tr>
            </c:when>
         </c:choose> 
         <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="IPRIMIN" lit="1000491"/> </b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="IPRIMAX" lit="1000492"/></b>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="IPRIMIN" value="${mntgaran.IPRIMIN}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="IPRIMIN" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="IPRIMAX" value="${mntgaran.IPRIMAX}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="IPRIMAX" a="modificable=false"/> />
            </td>
        <tr>
            
         <c:choose>
               <c:when test="${mntgaran.CCAPMIN == 0}">    
                <td align="left">
                <input type="text" name="ICAPMIN" value="${capmin}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="ICAPMIN" a="modificable=false"/> />
                </td>
               
               </c:when>
               
               <c:when test="${mntgaran.CCAPMIN == 1}">    
                <td align="left">
                <display:table name="${mntgaran.CAPITALMIN}" id="miListaIdGD2" export="false" class="dsptgtable" pagesize="6" cellpadding="0" cellspacing="0"  style="text-align:center;spacing-left:15%">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="${title4}"  headerClass="headwidth5 sortable" sortProperty="OB_IAX_PRODCAPITALMIN.TFORPAG" media="html" autolink="false" style="text-align:center; width:5%" sortable="true">
                        <div class="dspText" > ${miListaIdGD2.OB_IAX_PRODCAPITALMIN.TFORPAG }</div>
                        </display:column>
                        <display:column title="${title1}" headerClass="headwidth20 sortable" sortProperty="OB_IAX_PRODCAPITALMIN.ICAPITAL" media="html" autolink="false" style="text-align:center; width:30%" sortable="true">
                        <div class="dspText" > <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGD2.OB_IAX_PRODCAPITALMIN.ICAPITAL}"/> </div>
                        </display:column>
                </display:table> 
                </td>
               </c:when>
         </c:choose>
         </tr>
        
    </table>
</form>