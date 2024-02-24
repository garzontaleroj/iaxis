<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>
<p>
    <%@ page import="java.util.ArrayList"%><%@ page import="java.util.HashMap"%><%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
    }
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
%>
</p>
<axis:ocultar f="${pantalla}" c="DSP_DATOSECONOMICOS" dejarHueco="false">
<c:if test="${ !empty OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS}">
                <tr>
                     <td class="campocaja" >
                    	<div class="separador">&nbsp;</div>   
                         <div style="float:left;">
                          <img id="DSP_CTASEGURO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CTASEGURO', this)" style="cursor:pointer"/>
                          <b><axis:alt f="${pantalla}" c="DSP_APORTACIONES" lit="1000593"></axis:alt></b>
                        </div>
                          
                          <axis:visible  f="${pantalla}" c="LAPIZ1">
                          <div style="float:right;" id="DTOECONOMICOS" c="LAPIZ1"></div>
                          </axis:visible>
                          
                          <div class="seccion_suplementos" id="SECCION_DTOECONOMICOS"></div>
                          <div style="clear:both;">
                               <hr class="titulo">
                          </div>
                          
                    </td>
                </tr>
                <tr id="DSP_CTASEGURO_children" style="display:none">

                    <td class="campocaja" >
                      <axis:ocultar f="${pantalla}" c="DSP_DATOSECON" dejarHueco="false">
                         <table class="area" align="center">
                             <tr>
                                <td class="campocaja" >
                                    <img id="DSP_DTAECO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DTAECO', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisctr020" c="LIT_DSP_DTAECO" lit="1000097"/></b>&nbsp;&nbsp;
                                        <hr class="titulo">
                                </td>
                            </tr>

                            <tr id="DSP_DTAECO_children" style="display:none">
                                <td class="campocaja" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                            <th style="width:33.33%;height:0px">
                                        &nbsp;
                                    </th>
                                        </tr>
                                        <tr>
                                          <axis:visible f="${pantalla}" c="IMPPRIMAPER">
                                            <td class="titulocaja">
                                               
                                                <b><axis:alt f="${pantalla}" c="IMPPRIMAPER" lit="1000588"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="${pantalla}" c="IMPPRIMAINICIAL">
                                            <td class="titulocaja">
                                                
                                                <b><axis:alt f="${pantalla}" c="IMPPRIMAINICIAL" lit="1000589"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="${pantalla}" c="IMPPRIMAACTUAL">
                                            <td class="titulocaja">
                                           
                                                <b><axis:alt f="${pantalla}" c="IMPPRIMAACTUAL" lit="1000516"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                        </tr>
                                        <tr>
                                            <!-- Aport. / Prima perióde -->
                                          <axis:visible f="${pantalla}" c="IMPPRIMAPER">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaPer" name="ImpPrimaPer" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAPER}'/>" readonly="true"/>
                                            </td>
                                          </axis:visible>
                                            <!-- Aport./Prima ejercicio -->
                                          <axis:visible f="${pantalla}" c="IMPPRIMAINICIAL">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaInicial" name="IMPPRIMAINICIAL" size="15"
                                                formato="decimal"  size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAINICIAL}'/>" readonly="true"/>

                                            </td>
                                          </axis:visible>
                                            <!-- Prima Actual -->
                                          <axis:visible f="${pantalla}" c="IMPPRIMAACTUAL">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaActual" name="ImpPrimaActual" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPPRIMAACTUAL}'/>" readonly="true"/>
                                            </td>
                                          </axis:visible>
                                        </tr>
                                        <tr>
                                          <axis:visible f="${pantalla}" c="IMPAPORTACUM">
                                            <td class="titulocaja">
                                              
                                                <b><axis:alt f="${pantalla}" c="IMPAPORTACUM" lit="1000513"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="${pantalla}" c="IMPAPORTMAX">
                                            <td class="titulocaja">
                                              
                                                <b><axis:alt f="${pantalla}" c="IMPAPORTMAX" lit="1000515"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="${pantalla}" c="IMPAPORTPEND">
                                            <td class="titulocaja">
                                             
                                                <b><axis:alt f="${pantalla}" c="IMPAPORTPEND" lit="1000517"></axis:alt></b>
                                            </td>
                                          </axis:visible>
                                        </tr>
                                        <tr>
                                            <!-- Aportaciones Acum. -->
                                          <axis:visible f="${pantalla}" c="IMPAPORTACUM">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpAportAcum" name="ImpAportAcum" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTACUM}'/>" readonly="true"/>
                                            </td>
                                          </axis:visible>
                                            <!-- Aportación Máxima -->
                                          <axis:visible f="${pantalla}" c="IMPAPORTMAX">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaInicial" name="ImpAportMax" size="15"
                                                formato="decimal"  size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTMAX}'/>" readonly="true"/>
                                            </td>
                                          </axis:visible>
                                            <!-- Aportaciones Pend. -->
                                          <axis:visible f="${pantalla}" c="IMPAPORTPEND">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="ImpPrimaActual" name="ImpAportPend" size="15"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${OB_IAX_RIESGOS.OB_IAX_DATOSECONOMICOS.IMPAPORTPEND}'/>" readonly="true"/>
                                            </td>
                                          </axis:visible>
                                        </tr>

                                </td>
                            </tr>
                        </table>
                     </axis:ocultar>
                  </td>
                </tr>
                        <%-- Provisiones --%>
                        <c:import url="axisctr020_c1.jsp"/>                          
                       
                        <table class="area" align="center">
                         <tr>
                            <td class="campocaja" >
                               <div style="float:left;">
                                <img id="DSP_MOVDTASEG_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MOVDTASEG', this)" style="cursor:pointer"/>
                                    <b><axis:alt f="axisctr020" c="LIT_DSP_MOVD" lit="1000594"/></b>&nbsp;&nbsp;
                               </div>

                               <%-- <axis:visible f="${pantalla}" c="BT_CTASEGURO"> --%>
                                  <c:choose>
                                    <c:when test="${oculimpre == 1}">
                                    <axis:visible f="${pantalla}" c="LIT_BT_SEGURO" >
                                    <div style="float:right;">
                                        <img border="0" id="BT_CTASEGURO" alt="<axis:alt f="axisctr020" c="LIT_BT_SEGURO" lit="100001"/>"  onclick="javascript:f_but_ctaseguro();" title="<axis:alt f="axisctr020" c="LIT_BT_CTASEGURO" lit="100001"/>" src="images/print.gif" style="cursor:pointer"/>
                                    </div>
                                    </axis:visible>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="float:right;">
                                            <b style="color:red">  ${litimpresion} </b>
                                        </div>
                                    </c:otherwise>
                                 </c:choose>
                               <%-- </axis:visible> --%>

                                <div style="clear:both;">
                                        <hr class="titulo">
                                </div>
                            </td>
                        </tr>

                        <tr id="DSP_MOVDTASEG_children" style="display:none">
                            
                            <td class="campocaja" >
                            

                                <table>
                                <tr>
                                <td>
                                 <div class="displayspace">
                                              <c:set var="title0"><axis:alt f="axisctr020" c="MOVDTASEG_LIT1" lit="100883"/></c:set>
                                              <c:set var="title1"><axis:alt f="axisctr020" c="MOVDTASEG_LIT2" lit="1000590"/></c:set>
                                              <c:set var="title2"><axis:alt f="axisctr020" c="MOVDTASEG_LIT3" lit="1000591"/></c:set>
                                              <c:set var="title3"><axis:alt f="axisctr020" c="MOVDTASEG_LIT4" lit="100563"/></c:set>
                                              <c:set var="title4"><axis:alt f="axisctr020" c="MOVDTASEG_LIT5" lit="1000592"/></c:set>
                                              <c:set var="title5"><axis:alt f="axisctr020" c="MOVDTASEG_LIT6" lit="9001310"/></c:set>
                                              <c:set var="title6"><axis:alt f="axisctr020" c="MOVDTASEG_LIT7" lit="108490"/></c:set>
                                              <c:set var="title7"><axis:alt f="axisctr020" c="MOVDTASEG_LIT8" lit="9002014"/></c:set>
                                              <c:set var="title8"><axis:alt f="axisctr020" c="MOVDTASEG_LIT9" lit="9906967"/></c:set>
                                              <c:set var="title9"><axis:alt f="axisctr020" c="MOVDTASEG_LIT10" lit="9001192"/></c:set>
                                              <display:table name="${OB_IAX_RIESGOS.T_IAX_DATOSCTASEGURO}" id="MOVCTASEGURO" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:98.4%"
                                               requestURI="axis_${pantalla}.do?paginar=true&subpantalla=ctaseguro&subpantalla_b=movdtaseg&operation=form"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   <axis:visible f="${pantalla}" c="FALTA">
                                                    <display:column title="${title9}" sortable="true" sortProperty="FALTA" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText"><fmt:formatDate value='${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.FALTA}' pattern='dd/MM/yyyy HH:mm'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                   <axis:visible f="${pantalla}" c="FFECMOV">
                                                    <display:column title="${title0}" sortable="true" sortProperty="FFECMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText"><fmt:formatDate value='${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.FFECMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                   </axis:visible>
                                                    <display:column title="${title1}" sortable="true" sortProperty="FVALMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate value='${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.FVALMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.TMOVIMI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.IMOVIMI}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TMOVANU" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.TMOVANU}</div>
                                                    </display:column>
                                                    <axis:visible f="${pantalla}" c="MOVCTA_VALORLIQCMP">
                                                    <display:column title="${title8}" sortable="true" sortProperty="VALORLIQCMP" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.VALORLIQCMP}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div>
                                                    </display:column>
                                                    </axis:visible> 
                                                    <axis:visible f="${pantalla}" c="MOVCTA_VALORLIQ">
                                                    <display:column title="${title5}" sortable="true" sortProperty="VALORLIQ" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.VALORLIQ}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div>
                                                    </display:column>
                                                    </axis:visible>                                                   
                                                    <display:column title="${title6}" sortable="true" sortProperty="NUNIDAD" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.NUNIDAD}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div></div>
                                                    </display:column>
                                                    <axis:visible f="${pantalla}" c="MOVCTA_SALDOACUM">
                                                    <display:column title="${title7}" sortable="true" sortProperty="SALDOACUM" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGURO.OB_IAX_DATOSCTASEGURO.SALDOACUM}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div></div>
                                                    </display:column>
                                                    </axis:visible>
                                              </display:table>
                                </div>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                             <tr>
                                <td>
                             <axis:visible f="${pantalla}" c="DSP_MOVDTASEG_SHW">
                             <b><axis:alt f="axisctr020" c="MOVDTASEG_LIT1" lit="9906973"/></b>
                              <div class="displayspace">
                                              <c:set var="title0"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT1" lit="100883"/></c:set>
                                              <c:set var="title1"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT2" lit="1000590"/></c:set>
                                              <c:set var="title2"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT3" lit="1000591"/></c:set>
                                              <c:set var="title3"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT4" lit="100563"/></c:set>
                                              <c:set var="title4"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT5" lit="1000592"/></c:set>
                                              <c:set var="title5"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT6" lit="9906967"/></c:set>
                                              <c:set var="title6"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT7" lit="108490"/></c:set>
                                              <c:set var="title7"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT8" lit="9002014"/></c:set>
                                              <c:set var="title8"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT9" lit="9001310"/></c:set>
                                              <c:set var="title9"><axis:alt f="axisctr020" c="MOVDTASEGSHW_LIT10" lit="9001192"/></c:set>
                                              <display:table name="${OB_IAX_RIESGOS.T_IAX_DATOSCTASEGURO_SHW}" id="MOVCTASEGUROSHW" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:98.4%"
                                               requestURI="axis_${pantalla}.do?paginar=true&subpantalla=ctaseguro&subpantalla_b=movdtaseg&operation=form"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   <axis:visible f="${pantalla}" c="FALTASHW">
                                                    <display:column title="${title9}" sortable="true" sortProperty="FALTASHW" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText"><fmt:formatDate value='${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.FALTA}' pattern='dd/MM/yyyy HH:mm'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="${pantalla}" c="FFECMOVSHW">
                                                    <display:column title="${title0}" sortable="true" sortProperty="FFECMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                      <div class="dspText"><fmt:formatDate value='${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.FFECMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title1}" sortable="true" sortProperty="FVALMOV" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatDate value='${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.FVALMOV}' pattern='dd/MM/yyyy'/></div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.TMOVIMI}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspNumber"><fmt:formatNumber value="${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.IMOVIMI}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                    </display:column>
                                                    <display:column title="${title4}" sortable="true" sortProperty="TMOVANU" headerClass="sortable fixed"  media="html" autolink="false" >
                                                        <div class="dspText">${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.TMOVANU}</div>
                                                    </display:column>
                                                    <axis:visible f="${pantalla}" c="MOVCTA_VALORLIQCMPSHW">
                                                    <display:column title="${title5}" sortable="true" sortProperty="VALORLIQCMPSHW" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.VALORLIQCMPSHW}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div>
                                                    </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="${pantalla}" c="MOVCTA_VALORLIQVTASHW">
                                                    <display:column title="${title8}" sortable="true" sortProperty="VALORLIQVTASHW" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.VALORLIQVTASHW}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div>
                                                    </display:column>
                                                    </axis:visible>                                                    
                                                    <display:column title="${title6}" sortable="true" sortProperty="NUNIDAD" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.NUNIDAD}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div></div>
                                                    </display:column>
                                                    <axis:visible f="${pantalla}" c="MOVCTA_SALDOACUM">
                                                    <display:column title="${title7}" sortable="true" sortProperty="SALDOACUM" headerClass="sortable fixed" media="html" autolink="false" >
                                                        <div class="dspText"><fmt:formatNumber value="${MOVCTASEGUROSHW.OB_IAX_DATOSCTASEGURO_SHW.SALDOACUM}" pattern="${__formatNumberPatterns[__defaultCMONINT]}" maxFractionDigits="6"/></div></div>
                                                    </display:column>
                                                    </axis:visible>
                                              </display:table>
                                              </div>
                                </axis:visible>
                                 
                                 </td>
                                 
                            </tr>
                            </table>
                         </td>
                        </tr>
                        
                    </table>
             <c:if test="${ !empty perfil_inv.MODINVFONDO}">
                <axis:visible f="${pantalla}" c="DSP_PERINVERSION">
                    <table class="area" align="center">
                         <tr>
                            <td class="campocaja" >
                               <div style="float:left;">
                                <img id="DSP_PERINVERSION_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PERINVERSION', this)" style="cursor:pointer"/>
                                    
                                    <b><axis:alt f="${pantalla}" c="DSP_PERINVERSION" lit="9001351"></axis:alt></b>
                                    &nbsp;&nbsp;
                               </div>
                               <div class="separador">&nbsp;</div>                                     
                               <div style="float:right;" id="LST_FONDOS" c="LAPIZ1"></div>
                               <div class="seccion_suplementos" id="SECCION_LST_FONDOS"></div>
                               <div style="clear:both;">
                                 <hr class="titulo">
                               </div>
                            </td>
                        </tr>

                        <tr id="DSP_PERINVERSION_children" style="display:none">
                            <td>
                                <table>
                                    <tr>
                                            <th style="width:2%;height:0px">&nbsp;</th>
                                            <th style="width:15%;height:0px">&nbsp;</th>
                                            <th style="width:43%;height:0px">&nbsp;</th>
                                            <th style="width:30%;height:0px">&nbsp;</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="titulocaja">
                                           
                                            <b><axis:alt f="${pantalla}" c="DSP_MODELOSINV" lit="9001350"></axis:alt></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" id="PERFIL" name="PERFIL" size="15"
                                                    value="${perfil_inv.TMODINV}" readonly="true"/>
                                        </td>
                                    </tr>
                                    <axis:visible f="${pantalla}" c="DSP_MODELOSINV">
                                    <tr>
                                        <td></td>
                                        <td class="campocaja" colspan="2">
                                            <div class="displayspace">
                                              <c:set var="title1"><axis:alt f="axisctr020" c="MODELOSINV_LIT1" lit="9001352"/></c:set>
                                              <c:set var="title2"><axis:alt f="axisctr020" c="MODELOSINV_LIT2" lit="1000179"/></c:set>
                                              <c:set var="title3"><axis:alt f="axisctr020" c="MODELOSINV_LIT3" lit="9001353"/></c:set>

                                              <display:table name="${perfil_inv.MODINVFONDO}" id="PRODULKMODINVFONDO" export="false" class="dsptgtable" pagesize="15" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="axis_${pantalla}.do?paginar=true&subpantalla=ctaseguro&subpantalla_b=movdtaseg&operation=form"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="CCODFON" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:20%">
                                                        <div class="dspText">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOVIMI" headerClass="headwidth60 sortable"  media="html" autolink="false" style="width:65%">
                                                        <div class="dspText">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="IMOVIMI" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:15%">
                                                        <div class="dspNumber">${PRODULKMODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}</div>
                                                    </display:column>
                                              </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                   </axis:visible>     
                                   </table>
                                </td>
                        </tr>

                    </table>
                </axis:visible>    
             </c:if>

                        <!-- ******************** *****************  ******************   -->
                        <!-- ******************** SECCION RENTAS  ******************   -->
                        <!-- ******************** *****************  ******************   -->
             <c:if test="${ !empty __formdata.IBRUREN}">       
                <axis:visible f="${pantalla}" c="DSP_DATOSRENTA">
                        <table class="area" align="center"> 
                            <tr>
                                <td class="campocaja" >
                                    <img  id="DSP_DATOSRENTA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DATOSRENTA', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axisctr020" c="LIT_DATOSRENTA" lit="1000099"/></b>
                                    <hr class="titulo">
                                </td>
                            </tr>
                            <tr id="DSP_DATOSRENTA_children" style="display:none">
                                <td align="left" >
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:8%;height:0px"></th>
                                            <th style="width:8%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:12%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:13%;height:0px"></th>
                                        </tr>
                                        <!-- Datos Gesti?n -->
                                        <tr>
                                            <!-- Import Brut Renda -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_IBRUREN" lit="9001897"/></b>
                                            </td>
                                            <!-- Data 1º periode -->
                                            <axis:visible f="axisctr020" c="FDURA">
                                            <td class="titulocaja" >
                                                <b><axis:alt f="axisctr020" c="LIT_FDURA" lit="9001898"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Tipo int. -->
                                            <axis:visible f="axisctr020" c="PINTTEC">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_PINTTEC" lit="9001899"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Int. Gar. -->
                                            <axis:visible f="axisctr020" c="PTIPOINT">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_PTIPOINT" lit="9001900"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Data 1º pagament -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_F1PAREN" lit="9001901"/></b>
                                            </td>
                                            <!-- Data Prox. Gen. -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_FPPREN" lit="9901396"/></b>
                                            </td>
                                            <!-- Data Ven. Pagament -->
                                            <axis:visible f="axisctr020" c="FUPAREN">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_FUPAREN" lit="9001903"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Actiu -->
                                            <axis:visible f="axisctr020" c="TCODACT">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_TCODACT" lit="9901979"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Descripció de l'actiu -->
                                            <axis:visible f="axisctr020" c="TACTIVO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_TACTIVO" lit="9901980"/></b>
                                            </td>
                                            </axis:visible>                                            
                                        </tr>
                                        <tr>
                                            <!-- Import Brut Renda -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="IBRUREN" name="IBRUREN" size="15"
                                                        value="${__formdata.IBRUREN}" <axis:atr f="${pantalla}" c="IBRUREN" a="modificable=false"/>/>
                                            </td>
                                            <!-- Data 1º periode -->
                                            <axis:visible f="axisctr020" c="FDURA">
                                            <td class="campocaja" >
                                                <input type="text" style="width:100%" class="campowidthinput campo campotexto" id="FDURA" name="FDURA" size="15"
                                                        value="<fmt:formatDate value="${__formdata.FDURA}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="FDURA" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                            <!-- Tipo int. -->
                                            <axis:visible f="axisctr020" c="PINTTEC">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="PINTTEC" name="PINTTEC" size="15"
                                                        value="${__formdata.PINTTEC}" <axis:atr f="${pantalla}" c="PINTTEC" a="modificable=false"/> />
                                            </td>
                                            </axis:visible>
                                            <!-- Int.Gar. -->
                                            <axis:visible f="axisctr020" c="PTIPOINT">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="PTIPOINT" name="PTIPOINT" size="15"
                                                        value="${__formdata.PTIPOINT}" <axis:atr f="${pantalla}" c="PTIPOINT" a="modificable=false"/> />
                                            </td>
                                            </axis:visible>
                                            <!-- Data 1º pagament -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="F1PAREN" name="F1PAREN" size="15"
                                                        value="<fmt:formatDate value="${__formdata.F1PAREN}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="F1PAREN" a="modificable=false"/>/>
                                            </td>
                                            <!-- Data Prox. Gen. -->
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FPPREN" name="FPPREN" size="15"
                                                        value="<fmt:formatDate value="${__formdata.FPPREN}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="FPPREN" a="modificable=false"/>/>
                                            </td>
                                            <!-- Data Ven. Pagament -->
                                            <axis:visible f="axisctr020" c="FUPAREN">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FUPAREN" name="FUPAREN" size="15"
                                                        value="<fmt:formatDate value="${__formdata.FUPAREN}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="FUPAREN" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                            <!-- Actiu -->
                                            <axis:visible f="axisctr020" c="TCODACT">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TCODACT" name="TCODACT" size="15"
                                                        value="<fmt:formatDate value="${__formdata.TCODACT}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="TCODACT" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axisctr020" c="TACTIVO">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="TACTIVO" name="TACTIVO" size="15"
                                                        value="<fmt:formatDate value="${__formdata.TACTIVO}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="TACTIVO" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <!-- Data Fi Renda -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_FFINREN" lit="9001904"/></b>
                                            </td>
                                            <!-- Motiu -->
                                            <td class="titulocaja" colspan="3">
                                                <b><axis:alt f="axisctr020" c="LIT_TMOTMOV" lit="102577"/></b>
                                            </td>
                                            <!--Data Adq. -->
                                            <axis:visible f="axisctr020" c="FCOMPRA">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_FCOMPRA" lit="9001905"/></b>
                                            </td>
                                            </axis:visible>
                                            <!--Preu Adq. -->
                                            <axis:visible f="axisctr020" c="IPREADQ">
                                            <td class="titulocaja" colspan="1">
                                                <b><axis:alt f="axisctr020" c="LIT_IPREADQ" lit="9001906"/></b>
                                            </td>
                                            </axis:visible>
                                            <!-- Forma Pag. Renda -->
                                            <axis:visible f="axisctr020" c="FORPAQ">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr020" c="LIT_FORPAQ" lit="9001907"/></b>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <!-- Data Fi Renda -->
                                            <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINREN" name="FFINREN" size="15"
                                                        value="<fmt:formatDate value="${__formdata.FFINREN}" pattern="dd/MM/yyyy"/>"  
                                                        <axis:atr f="${pantalla}" c="FFINREN" a="modificable=false"/>/>
                                            </td>  
                                            <!-- Motiu -->
                                            <td class="campocaja" colspan="3">
                                                <input type="text" class="campowidthinput campo campotexto" id="TMOTMOV" name="TMOTMOV" size="15"
                                                       value="${__formdata.TMOTMOV}" <axis:atr f="${pantalla}" c="TMOTMOV" a="modificable=false"/> />
                                            </td>
                                            <!--Data Adq. -->
                                            <axis:visible f="axisctr020" c="FCOMPRA">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FCOMPRA" name="FCOMPRA" size="15"
                                                        value="<fmt:formatDate value="${__formdata.FCOMPRA}" pattern="dd/MM/yyyy"/>" 
                                                        <axis:atr f="${pantalla}" c="FCOMPRA" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                            <!--Preu Adq. -->
                                            <axis:visible f="axisctr020" c="IPREADQ">
                                            <td class="campocaja" colspan="1">
                                                <input type="text" class="campowidthinput campo campotexto" id="IPREADQ" name="IPREADQ" size="15"
                                                        value="${__formdata.IPREADQ}"   
                                                        <axis:atr f="${pantalla}" c="IPREADQ" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                            <!-- Forma Pag. Renda -->
                                            <axis:visible f="axisctr020" c="FORPAQ">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FORPAQ" name="FORPAQ" size="15"
                                                        value="${__formdata.FORPAQ}"  <axis:atr f="${pantalla}" c="FORPAQ" a="modificable=false"/>/>
                                            </td>
                                            </axis:visible>
                                        </tr>
                                    </table>
                                    <div class="separador">&nbsp;</div>
                                </td> 
                            </tr>
                        </table> 
                        <table class="area" align="center"> 
                        <tr>
                            <td class="campocaja" >
                                <img  id="DSP_PAGOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PAGOS', this)" style="cursor:pointer"/> 
                                <b><axis:alt f="axisctr020" c="LIT_DSP_PAGOS" lit="9001908"/>
                                <hr class="titulo">
                            </td>
                        </tr>
                        <tr id="DSP_PAGOS_children" style="display:none">
                            <td align="left" >
                                <div class="displayspace">
                                <c:set var="title0"><axis:alt f="axisctr020" c="PAGOS_LIT1" lit="9001909"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr020" c="PAGOS_LIT2" lit="9001910"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr020" c="PAGOS_LIT3" lit="101332"/></c:set>                               
                                <c:set var="title3"><axis:alt f="axisctr020" c="PAGOS_LIT4" lit="9000938"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr020" c="PAGOS_LIT5" lit="100587"/></c:set>
                                <c:set var="title5"><axis:alt f="axisctr020" c="PAGOS_LIT6" lit="9001911"/></c:set>
                                <c:set var="title6"><axis:alt f="axisctr020" c="PAGOS_LIT7" lit="1000113"/></c:set>
                                <c:set var="title7"><axis:alt f="axisctr020" c="PAGOS_LIT8" lit="100913"/></c:set>
                                
                                <display:table name="${PAGOS_REN}" id="PAGOS_REN" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:98.4%"
                                                requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:10%">
                                        <div class="dspText">${PAGOS_REN.SRECREN}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:15%">
                                        <div class="dspText"><fmt:formatDate value="${PAGOS_REN.FFECEFE}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:15%">
                                        <div class="dspText"><fmt:formatDate value="${PAGOS_REN.FFECPAG}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>                                   
                                    <display:column title="${title3}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:15%">
                                        <div class="dspText">${PAGOS_REN.ISINRET}</div>
                                    </display:column>                                                                      
                                    <display:column title="${title4}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:15%">
                                        <div class="dspText">${PAGOS_REN.ESTADO}</div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:15%">
                                        <div class="dspText">${PAGOS_REN.BENEFI}</div>
                                    </display:column>
                                    <display:column title="${title6}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%">
                                        <axis:visible f="${pantalla}" c="SRECREN_ALT">
                                        <div class="dspIcons">
                                            <img border="0"
                                                alt='<axis:alt f="axisctr020" c="SRECREN_ALT" lit="9001944"/>'
                                                title1='<axis:alt f="axisctr020" c="SRECREN_ALT" lit="9001944"/>'
                                                src="images/mas.gif"
                                                width="11px" height="11px"
                                                style="cursor:pointer;"
                                                onclick="f_abrir_axisctr086(${PAGOS_REN.SRECREN})"/>
                                        </div>
                                        </axis:visible>
                                    </display:column>
                                    <display:column title="${title7}" sortable="true" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" style="width:5%">
                                        <axis:visible f="${pantalla}" c="SRECREN_TIT">
                                        <div class="dspIcons">
                                            <img border="0"
                                                alt='<axis:alt f="axisctr020" c="SRECREN_TIT" lit="140360"/>'
                                                title1='<axis:alt f="axisctr020" c="SRECREN_TIT" lit="140360"/>'
                                                src="images/mas.gif"
                                                width="11px" height="11px"
                                                style="cursor:pointer;"
                                                onclick="f_abrir_axisctr087(${PAGOS_REN.SRECREN})"/>
                                        </div>
                                        </axis:visible>
                                    </display:column>
                                </display:table>
                                </div>
                                <div class="separador">&nbsp;</div>
                            </td> 
                        </tr>
                     </table> 
                </axis:visible>                    
                </c:if>
                        <!-- ******************** Fin SECCION RENTAS  ******************   -->


                    </td>
                </tr>
</c:if>
</axis:ocultar>
<!-- ******************************************** Carga procesos *************************************** -->

<axis:ocultar f="${pantalla}" c="DSP_CARGAPROCESO" dejarHueco="false">
<c:if test="${! empty carga_fichero_datos }">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_CARGAPROCESO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CARGAPROCESO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="axisctr020" c="CARGAPROCESO_TIT" lit="9900748"/></b>
                        </div>
                        
                        <axis:visible  f="${pantalla}" c="LAPIZ1">
                        <div style="float:right;" id="CLAUSULAS" c="LAPIZ1"></div>
                        </axis:visible>
                        
                        <!--div id="SECCION_CARGAPROCESO"></div-->
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>

                </tr>
                <tr id="DSP_CARGAPROCESO_children" style="display:none">
                    <td class="campocaja" >
                      <div class="displayspace">
                                <c:set var="title0"><axis:alt f="axisctr020" c="CARGAPROCESO_LIT1" lit="1000576"/></c:set>
                                 <display:table name="${carga_fichero_datos}" id="lista_fichero" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                requestURI="axis_${pantalla}.do?paginar=true&tabla=tomador"> 
                                                <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">${lista_fichero.LINEA}</div>
                                    </display:column>
                                </display:table>    
                     </div>
                    </td>
                </tr>

</c:if>
</axis:ocultar>
<!-- ******************************************* ******** *************************************************-->
<!-- ******************************************* RETORNOS *************************************************-->
<!-- ******************************************* ******** *************************************************-->
<axis:ocultar f="${pantalla}" c="DSP_RETORNOS" dejarHueco="false">
<c:if test="${! empty lista_retornos}">
                
                
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_RETORNOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RETORNOS', this)" style="cursor:pointer"/>
                            <b><axis:alt f="${pantalla}" c="RETORNOS_TIT" lit="9904182"/></b>
                            </div>
                           <%-- ${recibos[0].OB_IAX_DETRECIBO.IMPORTE}</c:if> --%>                            
                            
                            <axis:visible  f="${pantalla}" c="LAPIZ1">
                            <div style="float:right;" id="DATOS_RETORNO"></div>
                            </axis:visible>
                            
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

<c:import url="axisctr020_c0.jsp"/>
