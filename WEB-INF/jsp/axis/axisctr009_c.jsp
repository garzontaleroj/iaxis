<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>





<c:if test="${! empty clausulasprod || ! empty clausulasesp || !empty clausulasprodmult}">
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_CLAUSULAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CLAUSULAS', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="axisctr009_c" c="LIT_DSP_CLAUSULAS" lit="101791" /></b>
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_CLAUSULAS_children" style="display:none">
                    <td class="campocaja" >
                      <c:if test="${!empty clausulasprod}">
                        <b><axis:alt f="axisctr009_c" c="LIT_TIT_PANTALLA" lit="1000083" /></b>
                         <c:set var="title0"><axis:alt f="axisctr009_c" c="LIT_TIT_1" lit="800440"/></c:set>
                        <c:set var="title1"><axis:alt f="axisctr009_c" c="LIT_TIT_2" lit="101805"/></c:set>
                       <div class="displayspace">
                            <axis:tabla name="${clausulasprod}" miid="clausulasprod" objeto="OB_IAX_CLAUSULAS" campos="SCLAGEN(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title0}@@${title1}" cellpadding="0" cellspacing="0"/> 
                        </div>
                       
                        </c:if>
                        <br />
                        <c:if test="${!empty clausulasesp}">
                        <b><axis:alt f="axisctr009_c" c="LIT_SEC_CLAU" lit="1000084" /></b>
                        <!-- DisplayTag clausulasEspecificas -->
                        <c:set var="title1"><axis:alt f="axisctr009_c" c="LIT_SEC_CLAU_1" lit="800440"/></c:set>
                        <c:set var="title2"><axis:alt f="axisctr009_c" c="LIT_SEC_CLAU_2" lit="101805"/></c:set>
                        <div class="displayspace">
                            <axis:tabla name="${clausulasesp}" miid="clausulasesp" objeto="OB_IAX_CLAUSULAS" campos="CIDENTITY(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title1}@@${title2}"  
                                columnHeaderClass="headwidth5 sortable#sortable" cellpadding="0" cellspacing="0"/>
                        </div>
                        </c:if>
                  <c:if test="${!empty clausulasprodmult}">
                        
                           <c:set var="title1"><axis:alt f="axisctr009" c="SCLAGEN" lit="800440"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr009" c="TCLATIT" lit="101805"/></c:set>
                            <div class="separador">&nbsp;</div>      
                             <div id="DSP_CLAUSUMULT" class="displayspaceOver" style="visibility:hidden;height:0px">&nbsp;</div>
                                <div id="Dt_CLAUSUMULT" class="displayspace">
                                <display:table name="${clausulasprodmult}" id="dspTagClausulasMultiples" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_CLAUSULAS.SCLAGEN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.SCLAGEN}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_CLAUSULAS.TCLAGEN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText" id="TCLAGEN_${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.SCLAGEN}" >${dspTagClausulasMultiples.OB_IAX_CLAUSULAS.TCLAGEN}</div>
                                    </display:column>
                                  

                                </display:table>
                             
                               </div> 

                        </c:if>
                        
                        
                
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    </td>
                </tr>         
</c:if>
<!-- ******************************************* ******** *************************************************-->
<!-- ******************************************* RETORNOS *************************************************-->
<!-- ******************************************* ******** *************************************************-->
<axis:ocultar f="axisctr009" c="DSP_RETORNOS" dejarHueco="false">
<c:if test="${! empty lista_retornos}">
                
                
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_RETORNOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RETORNOS', this)" style="cursor:pointer"/>
                            <b><axis:alt f="${pantalla}" c="RETORNOS_TIT" lit="9904182"/></b>
                            </div>
                           <%-- ${recibos[0].OB_IAX_DETRECIBO.IMPORTE}</c:if> --%>                            
                            <div style="float:right;" id="DATOS_CORRETAJE"></div>
                            <div class="seccion_retornos" id="SECCION_RETORNOS"></div>
                            <div style="clear:both;">
                            <hr class="titulo">
                            </div>
                            
                    </td>                    
                </tr>
                <tr id="DSP_RETORNOS_children" style="display:none">
                    <td class="campocaja" >
                          <c:set var="title0"><axis:alt f="${pantalla}" c="TDESCRIP_NOMBRE" lit="9001911"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="PPERCENT_NOMBRE" lit="101467"/></c:set>
                          <div class="displayspace">
                            <display:table name="${lista_retornos}" id="retorno" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title0}" sortable="false" sortProperty="v" headerClass="sortable"  media="html" autolink="false" >
                                      <div class="dspText">${retorno.OB_IAX_RETORNO.TNOMBRE} ${retorno.OB_IAX_RETORNO.TAPELLI1} ${retorno.OB_IAX_RETORNO.TAPELLI2}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_RETORNO.PPARTICI" headerClass="headwidth110 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${retorno.OB_IAX_RETORNO.PRETORNO}</div>
                                </display:column>
                                                                                           
                            </display:table>
                        </div>
                    </td>
                </tr>

</c:if>
</axis:ocultar>


 <!--CORRETAJE, INTERMEDIARIOS -->
<axis:ocultar f="axisctr009" c="DSP_CORRETAJE" dejarHueco="false">
<c:if test="${! empty lista_corretaje}">
                
                
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_CORRETAJE_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CORRETAJE', this)" style="cursor:pointer"/>
                            <b><axis:alt f="${pantalla}" c="CORRETAJE_TIT" lit="9902530"/></b>
                            </div>
                           <%-- ${recibos[0].OB_IAX_DETRECIBO.IMPORTE}</c:if> --%>                            
                            <div style="float:right;" id="DATOS_CORRETAJE"></div>
                            <div class="seccion_suplementos" id="SECCION_CORRETAJE"></div>
                            <div style="clear:both;">
                            <hr class="titulo">
                            </div>
                            
                    </td>                    
                </tr>
                <tr id="DSP_CORRETAJE_children" style="display:none">
                    <td class="campocaja" >
                          <c:set var="title0"><axis:alt f="${pantalla}" c="TAGENTE" lit="9902363"/></c:set>
                          <c:set var="title4"><axis:alt f="${pantalla}" c="TSUCURSAL" lit="9002202"/></c:set>
                          <c:set var="title1"><axis:alt f="${pantalla}" c="PCOMISI" lit="9001923"/></c:set>
                          <c:set var="title2">%<axis:alt f="${pantalla}" c="PPARTICI" lit="101467"/></c:set>
                          <c:set var="title3"><axis:alt f="${pantalla}" c="ISLIDER" lit="9902425"/></c:set>                         
                          
                          <div class="displayspace">
                            <display:table name="${lista_corretaje}" id="corretaje" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>

                                <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TAGENTE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${corretaje.OB_IAX_CORRETAJE.TAGENTE}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CORRETAJE.TSUCURSAL" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                                      <div class="dspText">${corretaje.OB_IAX_CORRETAJE.TSUCURSAL}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PCOMISI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${corretaje.OB_IAX_CORRETAJE.PCOMISI}" /></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CORRETAJE.PPARTICI" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                     <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${corretaje.OB_IAX_CORRETAJE.PPARTICI}" /></div>
                                </display:column>
                                
                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CORRETAJE.NORDEN" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                   <div class="dspIcons">
                                  <input disabled type="checkbox" id="checked_ISLIDER" name="checked_ISLIDER" <c:if test="${corretaje.OB_IAX_CORRETAJE.ISLIDER == 1}">checked</c:if>                                        
                                        value=""/>
                                   </div>
                                </display:column>                                                            
                            </display:table>
                        </div>
                    </td>
                </tr>

</c:if>
</axis:ocultar>

<axis:visible f="axisctr009" c="DSP_PRIMAS">   
<c:if test="${! empty primas }">
                                        <tr>
                                            <td class="campocaja">
                                                <img src="images/mes.gif" id="DSP_PRIMAS_parent" onclick="objEstilos.toggleDisplay('DSP_PRIMAS', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr009" c="LIT_IMG_SEARCH" lit="102728" /> <axis:visible c="CMONPROD" f="axisctr009">  <c:if test="${!empty CMONPROD}"> -   <axis:alt f="axisctr009" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${TMONPROD}</c:if> </axis:visible></b>
                                                <hr class="titulo">
                                            </td>
                                        </tr>
                                        
                                        <tr id="DSP_PRIMAS_children" style="display:none">
                                          
                                                        <td align="left">
                                                            <table class="seccion">
                                                                <tr>
                                                                    <td align="left">
                                                                    
                                                                        <!-- DisplayTag detalle primas -->
                                               
                                               
                                                                        
                                                                        <c:set var="title0"><axis:alt f="axisctr009" c="LIT_IPRIANU_TIT" lit="1000497"/></c:set>       <!-- IPRIANU / IPRITOT-->
                                                                        <c:set var="title1"><axis:alt f="axisctr009_c" c="LIT_IIPS_TIT" lit="101515"/></c:set>           <!-- IIPS -->
                                                                        <c:set var="title2"><axis:alt f="axisctr009_c" c="LIT_IDGS_TIT" lit="1000498"/></c:set>          <!-- IDGS -->
                                                                        <c:set var="title3"><axis:alt f="axisctr009_c" c="LIT_ICONSOR_TIT" lit="103101"/></c:set>        <!-- ICONSOR -->                            
                                                                        <c:set var="title4"><axis:alt f="axisctr009_c" c="LIT_IRECFRA_TIT" lit="1000341"/></c:set>       <!-- IRECFRA -->
                                                                        <c:set var="title5"><axis:alt f="axisctr009_c" c="LIT_PRECARG_TIT" lit="101671"/></c:set>        <!-- PRECARG -->
                                                                        <c:set var="title6"><axis:alt f="axisctr009_c" c="LIT_IEXTRAP_TIT" lit="101918"/></c:set>        <!-- IEXTRAP -->                                        
                                                                        <c:set var="title7"><axis:alt f="axisctr009_c" c="LIT_PDTOCOM_TIT" lit="1000119"/></c:set>       <!-- PDTOCOM -->
                                                                        <c:set var="title8"><axis:alt f="axisctr009_c" c="LIT_ITOTALR_TIT" lit="140531"/></c:set>        <!-- ITOTALR -->    
                                                                        <c:set var="title9"><axis:alt f="axisctr009_c" c="LIT_IPRITAR_TIT" lit="1000496"/></c:set>       <!-- IPRITAR -->
                                                                        <c:set var="title10"><axis:alt f="axisctr009_c" c="LIT_IPRIREB_TIT" lit="9000837"/></c:set>      <!-- IPRIREB -->       
                                                                        <c:set var="title11"><axis:alt f="axisctr007" c="IARBRIT" lit="101705"/></c:set>                 <!-- IARBRIT -->       
                                                                        <c:set var="title12"><axis:alt f="axisctr007" c="ICDERREG" lit="9001509"/></c:set>               <!-- ICDERREG -->       
                                                                        <c:set var="title13"><axis:alt f="axisctr007" c="IEXTRAP" lit="101918"/></c:set>                 <!-- IEXTRAP --> 
                                                                        <!-- bug 0025826 -->
                                                                        <c:set var="title14"><axis:alt f="axisctr009" c="ITOTIMP" lit="1000580"/></c:set>                    <!-- ITOTIMP --> 
                                                          
                                                                        <!-- ipritar, iextrap, irecarg, idtocom, ipritot, iconsor,irecfra, iips,idgs, itotalr-->

                                                                        <div class="displayspace">
                                                                             <display:table name="${primastotals}" id="axisctr_primasTotales" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                              requestURI="axis_axisctr009.do?paginar=true&tabla=primas">
                                                                                 <%@ include file="../include/displaytag.jsp"%>
                                                                                 <axis:visible f="axisctr009" c="IPRITAR">
                                                                                 <display:column title="${title9}" sortable="true" sortProperty="IPRITAR" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITAR}'/></div>
                                                                                 </display:column>
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IIEXTRAP">
                                                                                     <display:column title="${title13}" sortable="true" sortProperty="IIEXTRAP" headerClass="sortable"  media="html" autolink="false" >
                                                                                         <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIEXTRAP}'/></div>
                                                                                     </display:column> 
                                                                                 </axis:visible>
                                                                                 <!-- bug 42429/237568 -->
                                                                                 <axis:visible f="axisctr009" c="IRECARG">
                                                                                <display:column title="${title5}" sortable="true" sortProperty="IRECARG" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <%--<div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECARG}'/></div>--%>
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTREC}'/></div>
                                                                                 </display:column>
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="ITOTDTO">
                                                                                 <display:column title="${title7}" sortable="true" sortProperty="ITOTDTO" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDTO}'/></div>
                                                                                 </display:column>  
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IPRITOT">
                                                                                 <display:column title="${title0}" sortable="true" sortProperty="IPRITOT" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITOT}'/></div>
                                                                                 </display:column>
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="ICONSOR">
                                                                                 <display:column title="${title3}" sortable="true" sortProperty="ICONSOR" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICONSOR}'/></div>
                                                                                 </display:column>  
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IRECFRA">
                                                                                 <display:column title="${title4}" sortable="true" sortProperty="IRECFRA" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECFRA}'/></div>
                                                                                 </display:column>                                                                                      
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IIPS">
                                                                                 <display:column title="${title1}" sortable="true" sortProperty="IIPS" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/></div>
                                                                                 </display:column>                                                                                                  
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IDGS">
                                                                                 <display:column title="${title2}" sortable="true" sortProperty="IDGS" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IDGS}'/></div>
                                                                                 </display:column>                                                                                                                        
                                                                                 </axis:visible>
                                                                                 <axis:visible f="axisctr009" c="IARBITR">
                                                                                     <display:column title="${title11}" sortable="true" sortProperty="IARBITR" headerClass="sortable"  media="html" autolink="false" >
                                                                                         <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IARBITR}'/></div>
                                                                                     </display:column> 
                                                                                 </axis:visible>                                                               
                                                                                 <axis:visible f="axisctr009" c="ICDERREG">
                                                                                     <display:column title="${title12}" sortable="true" sortProperty="ICDERREG" headerClass="sortable"  media="html" autolink="false" >
                                                                                         <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICDERREG}'/></div>
                                                                                     </display:column> 
                                                                                 </axis:visible>   
                                                                                 
                                                                                 <!-- bug 0025826 -->
                                                                                 <axis:visible f="axisctr009" c="ITOTIMP">
                                                                                 <display:column title="${title14}" sortable="true" sortProperty="ITOTIMP" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTIMP}'/></div>
                                                                                 </display:column>                                                                                                                                                                
                                                                                 </axis:visible>

                                                                                 <axis:visible f="axisctr009" c="ITOTALR">
                                                                                 <display:column title="${title8}" sortable="true" sortProperty="ITOTALR" headerClass="sortable"  media="html" autolink="false" >
                                                                                     <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/></div>
                                                                                 </display:column>                                                                                                                                                                
                                                                                 </axis:visible>
                                                                                <axis:visible f="axisctr009" c="IPRIREB">
                                                                                <display:column title="${title10}" sortable="true" sortProperty="IPRIREB" headerClass="sortable"  media="html" autolink="false" >
                                                                                    <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRIREB}'/></div>
                                                                                </display:column> 
                                                                                </axis:visible>  
                                                                               
                                                                             </display:table>
                                                                         </div>
                                                                     </td>
                                                                 </tr>
                                                            </table>
                                                        </td>
                                             
                                        </tr>                                               
</c:if>
</axis:visible>
<%--
<c:if test="${! empty __formdata.T_IAX_DOCUMENTACION}">
                                        <tr>
                                            <td class="campocaja">
                                                <img src="images/mes.gif" id="DSP_DOCUMENTACION_parent" onclick="objEstilos.toggleDisplay('DSP_DOCUMENTACION', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr009_c" c="LIT_X" lit="1000117" /></b>
                                                <hr class="titulo">
                                            </td>
                                        </tr>
                                        <tr id="DSP_DOCUMENTACION_children" style="display:none">
                                            <td class="campocaja">
                                                <div class="displayspace">
                                                    <c:set var="title0">ccc</c:set>
                                                    <c:set var="title1"><axis:alt f="axisctr009_c" c="LIT_DOC" lit="112347" /></c:set>                                                                                               
                                                    <display:table name="${__formdata.T_IAX_DOCUMENTACION}" id="T_IAX_DOCUMENTACION" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                    requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" sortProperty="CAMPO1" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                        <div class="dspIcon"><input <c:if test="${T_IAX_DOCUMENTACION.CSELEC == 1}">checked</c:if>
                                                        onclick="f_seleccionar_documentacion(this, ${T_IAX_DOCUMENTACION.NVERSION}, ${T_IAX_DOCUMENTACION.CMOTMOV}, ${T_IAX_DOCUMENTACION.CTIPDOC})"
                                                        type="checkbox" id="CSELEC" name="CSELEC" value="${T_IAX_DOCUMENTACION.CDOCUMENT}"/></div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="TDOCUMENT" headerClass="sortable"  media="html" autolink="false" >
                                                        <div <c:choose>
                                                                <c:when test="${T_IAX_DOCUMENTACION.CTIPDOC == 1 && (T_IAX_DOCUMENTACION.CSELEC == null || T_IAX_DOCUMENTACION.CSELEC != 1)}">class="dspTextAviso"</c:when> 
                                                                <c:otherwise>class="dspText"</c:otherwise>
                                                             </c:choose>>
                                                            ${T_IAX_DOCUMENTACION.TDOCUMENT}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TTIPDOC" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">${T_IAX_DOCUMENTACION.TTIPDOC}</div>
                                                    </display:column>
                                                    </display:table>
                                                </div>
                                            </td>
                                        </tr>    
                                        <hr />
</c:if>
--%>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>