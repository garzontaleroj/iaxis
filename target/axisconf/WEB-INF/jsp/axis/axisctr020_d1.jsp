<%/* Revision:# wI61jmK6MiTUOeS+Zc5OLQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr020"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="${param.f}"/>
    </c:otherwise>
</c:choose>

<%---------------------Inspección de riesgo------------------------%>
<axis:visible f="${pantalla}" c="DSP_INSPECCION_RIESGO" >        
        <c:if test="${!empty INSPECCION_RIESGO}">
                
                <tr>
                    <td class="campocaja" >                        
                        <img id="DSP_INSPECCION_RIESGO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_INSPECCION_RIESGO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="DSP_INSPECCION_RIESGO" lit="9905241"/></b>
                        <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_inspecciones('${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CTIPMAT}', '${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CMATRIC}');" style="cursor:pointer" align="right"/>
                        <hr class="titulo"></hr>
                    </td>
                </tr>                
                
                <tr id="DSP_INSPECCION_RIESGO_children" style="display:none">        
                <td>
                  <table class="area" align="center">
                             <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                        <axis:visible c="CINSPREQ" f="${pantalla}">
                               <td class="titulocaja"> 
                               <b><axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/></b><br>
                               </td>
                               </axis:visible>
                                <axis:visible c="CRESULTR" f="${pantalla}">
                                <td class="titulocaja"> 
                                <b><axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/></b><br>
                               </td>
                               </axis:visible>
                   </tr>
                   <tr>
                    <td class="campocaja">                        
                        <axis:ocultar c="CINSPREQ" f="axisctr020" dejarHueco="false">
                            <select name = "CINSPREQ" id ="CINSPREQ" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr020" c="CINSPREQ" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr020" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${listvalores.lstInspec1}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CINSPREQ ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>
                        </axis:ocultar> 
                        </td>
                          <td class="campocaja" >  
                       
                        <axis:ocultar c="CRESULTR" f="axisctr020" dejarHueco="false">
                            <select name = "CRESULTR" id ="CRESULTR" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr020" c="CRESULTR" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr020" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${listvalores.lstInspec2}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CRESULTR ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>            
                        </axis:ocultar>
                        </td>
                        </tr>
                        <tr>
                        <td class="campocaja" colspan="4">
                        
                        <div class="separador" style="align:right">&nbsp;</div>
                        <div class="displayspace">
                            <c:set var="title0"><axis:alt f="${pantalla}" c="CNORDEN" lit="9905245" /></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="CNINSPECCION" lit="9905246" /></c:set>                               
                            <c:set var="title2"><axis:alt f="${pantalla}" c="FSOLICITUD" lit="9905247" /></c:set>
                            <c:set var="title3"><axis:alt f="${pantalla}" c="TESTADOORDEN" lit="9905248" /></c:set>                         
                            <c:set var="title4"><axis:alt f="${pantalla}" c="TCLASE" lit="9905249" /></c:set>
                            <c:set var="title5"><axis:alt f="${pantalla}" c="FVTOORDEN" lit="9905250" /></c:set>
                            <c:set var="title6"><axis:alt f="${pantalla}" c="FINSPECCION" lit="9905251" /></c:set>
                            <c:set var="title7"><axis:alt f="${pantalla}" c="TESTADOINSPECCION" lit="9905252" /></c:set>                           
                            <c:set var="title8"><axis:alt f="${pantalla}" c="MES" lit="1000113" /></c:set>
                             
                             <display:table name="${INSPECCION_RIESGO}" id="INSPECCION_RIESGO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>
                               
                               <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.SORDEN}</div>
                               </display:column>
                               
                               <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.NINSPECCION}</div>
                               </display:column>
                               
                               <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                               </display:column>                           
                               
                               <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOORDEN}</div>
                               </display:column>                         
                               
                               <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TCLASE}</div>
                               </display:column>
                               
                               <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FVTORDEN}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FINSPECCION}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title7}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO.TESTADOINSPECCION}</div>
                               </display:column>
                               <c:if test="${!empty INSPECCION_RIESGO.NINSPECCION}" >                               
                                    <display:column title="${title8}"  headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <axis:visible f="${pantalla}" c="INFO_DETALLE">
                                        <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="INFO_DETALLE" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px" onclick="javascript:f_consultar_inspeccion(${INSPECCION_RIESGO.SORDEN}, ${INSPECCION_RIESGO.NINSPECCION})"
                                    style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='${pantalla}' c='INFO_DETALLE' lit='1000113'/>"/>
                                    </div>
                                    </axis:visible>
                                    </display:column>
                               </c:if>
                           </display:table>
                        </div>
                        
                        </td>
                        </tr>
                        </table>
                        
                        
                    </td>
                </tr>
    </c:if>
</axis:visible>
<%------------------Fi Inspección de riesgo --------------%>
<axis:visible f="${pantalla}" c="DSP_MVTPOLIZA" >      
<c:if test="${! empty mvtpoliza}">
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_MVTPOLIZA_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MVTPOLIZA', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="${pantalla}" c="DSP_MVTPOLIZA" lit="1000298"></axis:alt></b>
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_MVTPOLIZA_children" style="display:none">
                    <td class="campocaja" >
                        <c:set var="title0"><axis:alt f="${pantalla}" c="FMOVIMI" lit="101006"></axis:alt></c:set>
                        <c:set var="title10"><axis:alt f="${pantalla}" c="NCERTDIAN" lit="101168"></axis:alt></c:set>
                        <c:set var="title1"><axis:alt f="${pantalla}" c="TTIPMOV" lit="102421"></axis:alt></c:set>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="TMOTMOV" lit="102577" /></c:set>
                        <c:set var="title3"><axis:alt f="${pantalla}" c="FEFECTO" lit="100883" /></c:set>
                        <c:set var="title33"><axis:alt f="${pantalla}" c="FEMISIO" lit="1000562" /></c:set>
                        <c:set var="title4"><axis:alt f="${pantalla}" c="BT_GEDOX" lit="1000116" /></c:set>
                        <c:set var="title5"><axis:alt f="${pantalla}" c="MES" lit="1000113" /></c:set>
                        <c:set var="title6"><axis:alt f="${pantalla}" c="CUSUMOV" lit="100894" /></c:set>
                        <c:set var="title7"><axis:alt f="${pantalla}" c="ELIMINAR" lit="100648" /></c:set><!-- Borrar -->
                        <c:set var="title8"><axis:alt f="${pantalla}" c="TESTADOCOL" lit="101510" /></c:set>
                        <c:set var="title9"><axis:alt f="${pantalla}" c="NMOVIMI" lit="9001954" /></c:set>
                        <div class="displayspace">
                        <display:table name="${mvtpoliza}" id="mvtpoliza" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_${pantalla}.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                    <div class="dspIcons"><input  <c:if test="${mvtpoliza.NMOVIMI == __formdata.NMOVIMI}">checked</c:if> onClick="javascript:f_getMotivo('${datos_poliza.SSEGURO}', '${mvtpoliza.NMOVIMI}')" 
                                    value="${mvtpoliza.NMOVIMI}" type="radio" id="radioNMOVIMI" name="radioNMOVIMI"/></div>
                                </display:column>
                                
                                <display:column title="${title9}" sortable="true" sortProperty="NMOVIMI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.NMOVIMI}</div>
                                </display:column>
                                <display:column title="${title10}" sortable="true" sortProperty="NCERTDIAN" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.NCERTDIAN}</div>
                                </display:column>                                
                                <display:column title="${title0}" sortable="true" sortProperty="FMOVIMI" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FMOVIMI}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="TTIPMOV" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.TTIPMOV}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.TMOTMOV}</div>
                                </display:column>
                                <c:if test="${datos_poliza.NCERTIF == 0}">
                                    <axis:visible f="${pantalla}" c="TESTADOCOL">
                                        <display:column title="${title8}" sortable="true" sortProperty="TESTADOCOL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${mvtpoliza.TESTADOCOL}</div>
                                        </display:column>
                                    </axis:visible>
                                </c:if>
                                <axis:visible f="${pantalla}" c="CUSUMOV_MOV">
                                <display:column title="${title6}" sortable="true" 
                                    style="width:8%;" sortProperty="TMOTMOV" headerClass="sortable"  
                                    media="html" autolink="false" >
                                    <div class="dspText">${mvtpoliza.CUSUMOV}</div>
                                </display:column>
                                </axis:visible>
                                <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FEFECTO}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <axis:visible f="${pantalla}" c="FEMISIO">
                                    <display:column title="${title33}" sortable="true" sortProperty="FEMISIO" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspDate"><fmt:formatDate value="${mvtpoliza.FEMISIO}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                </axis:visible>
                                <axis:visible f="${pantalla}" c="BT_GEDOX">
                                    <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <axis:visible f="${pantalla}" c="GEDOX">
                                     <div class="dspIcons" id="BT_GEDOX_IMP"><img border="0" alt="<axis:alt f="${pantalla}" c="GEDOX" lit="100002"/>" title="<axis:alt f="${pantalla}" c="GEDOX" lit="100002"/>" src="images/gdocumental.gif"
                                     style="cursor:pointer;vertical-align:middle" onclick="f_but_gedox('${mvtpoliza.NMOVIMI}')"/></div>
                                     </axis:visible>
                                    </display:column>
                                </axis:visible>
                                <display:column title="${title5}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <axis:visible f="${pantalla}" c="MAS">   
                                 <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="MAS" lit="140280"/>" title="<axis:alt f="${pantalla}" c="MAS" lit="140280"/>" src="images/mas.gif" width="11px" height="11px"
                                 style="cursor:pointer;vertical-align:middle;" onclick="f_but_detailmov(${mvtpoliza.NMOVIMI}, ${mvtpoliza.CMOTMOV},${datos_poliza.NCERTIF} )"/></div>
                                 </axis:visible>
                                </display:column>
                                <axis:visible f="${pantalla}" c="BT_ELIMINAR_MOV">
                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                 <axis:visible f="${pantalla}" c="BT_ELIMINAR">
                                 <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="BT_ELIMINAR" lit="100648"/>" title="<axis:alt f="${pantalla}" c="BT_ELIMINAR" lit="100648"/>" src="images/delete.gif" width="14px" height="14px"
                                 style="cursor:pointer;vertical-align:middle;" onclick="f_but_deletemov(${mvtpoliza.NMOVIMI}, ${mvtpoliza.CMOTMOV} , '${mvtpoliza.TTIPMOV}' )"/></div>
                                 </axis:visible>
                                </display:column>
                                </axis:visible>
                            </display:table>
                        </div>
                        <axis:visible c="DSP_MVTRETx" f="${pantalla}">
                        <c:if test="${! empty mvtretencion}">
                            <div class="separador">&nbsp;</div>
                            <table class="area" align="center">
                                <tr>
                                    <td class="campocaja" >
                                        <img id="mvtretencion_parent" <c:if test="${empty datos_poliza.CRETENI || datos_poliza.CRETENI == 0}"> src="images/mes.gif"  </c:if> 
                                        <c:if test="${!empty datos_poliza.CRETENI && datos_poliza.CRETENI != 0}">src="images/menys.gif" </c:if> 
                                        onclick="objEstilos.toggleDisplay('mvtretencion', this)" style="cursor:pointer"/> 
                                        <c:choose>
                                        <c:when test="${!empty datos_poliza.CRETENI && datos_poliza.CRETENI != 0}">
                                            <b><axis:alt f="${pantalla}" c="CRETENI" lit="1000297" /></b>  &nbsp;&nbsp; ${mvtretencion[0].OB_IAX_POLMVTRETEN.TMOTRET}<c:if test="${mvtretencion[0].OB_IAX_POLMVTRETEN.FRETEN!=null}">&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="FRETEN" lit="1000148" />&nbsp;<fmt:formatDate value="${mvtretencion[0].OB_IAX_POLMVTRETEN.FRETEN}" pattern="dd/MM/yyyy"/></c:if> <c:if test="${mvtretencion[0].OB_IAX_POLMVTRETEN.FREVRET!=null}">&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="FREVRET" lit="105403" />&nbsp;<fmt:formatDate value="${mvtretencion[0].OB_IAX_POLMVTRETEN.FREVRET}" pattern="dd/MM/yyyy"/></c:if>
                                        </c:when>
                                        <c:otherwise>
                                        <b><axis:alt f="${pantalla}" c="RETINGUDA" lit="9000653" /></b> 
                                        </c:otherwise>
                                        </c:choose>
                                        <hr class="titulo">
                                    </td>
                                </tr>
                                <tr id="mvtretencion_children" <c:if test="${empty datos_poliza.CRETENI || datos_poliza.CRETENI == 0}"> style="display:none" </c:if> >
                                    <td class="campocaja" >
                                          <c:set var="title0"><axis:alt f="${pantalla}" c="TMOTRET" lit="1000297" /></c:set>
                                          <c:set var="title1"><axis:alt f="${pantalla}" c="TESTGEST" lit="9002157" /></c:set>
                                          <c:set var="title2"><axis:alt f="${pantalla}" c="FRETEN" lit="1000148" /></c:set>
                                          <c:set var="title3"><axis:alt f="${pantalla}" c="CUSURET" lit="100894" /></c:set>
                                          <c:set var="title4"><axis:alt f="${pantalla}" c="FUSUAUTO" lit="105403" /></c:set>
                                          <c:set var="title5"><axis:alt f="${pantalla}" c="CUSUAUTO" lit="105404" /></c:set>
                                          <c:set var="title6"><axis:alt f="${pantalla}" c="TRIESGO" lit="100649" /></c:set>
                                          <c:set var="title7"><axis:alt f="${pantalla}" c="TOBSERVA" lit="1000345" /></c:set>
                                          <div class="displayspace">
                                           <axis:tabla name="${mvtretencion}" miid="mvtretencion" objeto="OB_IAX_POLMVTRETEN" campos="TMOTRET(O)#TESTGEST(O)#FRETEN(O)#CUSURET(O)#FUSUAUTO(O)#CUSUAUTO(O)#TRIESGO(O)#TOBSERVA" estilos="dspText#dspText#dspDate#dspText#dspDate#dspText#dspText#dspText" columnHeaderClass="sortable gridsorted gridasc#sortable#sortable#sortable#sortable#sortable#sortable#sortable" titulos="${title0}@@${title1}@@${title2}@@${title3}@@${title4}@@${title5}@@${title6}@@${title7}" cellpadding="0" cellspacing="0"/>
                                          </div>
                                        </div>
                                    </td>
                                </tr>                             
                            </table>
                        </c:if>
                      </axis:visible>
             

<c:if test="${!empty PTPSUS_HIST}" >
                    
                

 <div class="separador">&nbsp;</div>
                            <table class="area" align="center">
                                <tr>
                                    <td class="campocaja" >
                    <img id="DSP_PSU_HIST_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PSU_HIST', this)" style="cursor:pointer"/> 
                      <b><axis:alt f="axisctr020" c="DSP_PSU_HIST" lit="9903021"></axis:alt></b> ${PTESTPOL_HIST} ${TNIVELBPM_HIST} <c:if test="${!empty POBPSU_RETENIDAS_HIST.TUSUAUT}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <axis:alt f="axisctr020" c="USU_AUT" lit="9902808" />&nbsp;&nbsp;  ${POBPSU_RETENIDAS_HIST.TUSUAUT}&nbsp;&nbsp;&nbsp; <axis:alt f="axisctr020" c="FECHA_AUT" lit="100562" />&nbsp;&nbsp;<fmt:formatDate pattern="dd/MM/yyyy" value="${POBPSU_RETENIDAS_HIST.FFECAUT}"/> </c:if>
                    <hr class="titulo">
                </td>
            </tr>
            <tr id="DSP_PSU_HIST_children"  style="display:none">
                <td class="campocaja" >
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="${pantalla}" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="${pantalla}" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="${pantalla}" c="TAUTREC" lit="9900977" /></c:set>
                         <c:set var="title5"><axis:alt f="${pantalla}" c="TRIESGO" lit="100649" />&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="TGARANT" lit="110994" /></c:set>                         
                         <c:set var="title6"><axis:alt f="${pantalla}" c="TNIVELR" lit="9900978" /></c:set>
                         <c:set var="title7"><axis:alt f="${pantalla}" c="INFO" lit="1000113" /></c:set>
                        
                         
                         
                         <display:table name="${PTPSUS_HIST}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}"/></div>                               
                           </display:column>
                           
                           <axis:visible f="${pantalla}" c="TAUTREC">   
                           <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>
                           
                           <%--display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PSU.OB_IAX_PSU.FAUTREC}"/></div>                               
                           </display:column>
                           
                           <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TUSUNOM}</div>
                           </display:column--%>
                           
                           <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                           </display:column>
                           
                           <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                           </display:column>
                           
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <axis:visible f="${pantalla}" c="INFO_DETALLE2">
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="INFO_DETALLE2" lit="1000113"/>" src="images/informacion.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.NOCURRE}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='${pantalla}' c='INFO' lit='1000113'/>"/>
                                </div>
                                </axis:visible>
                           </display:column>                           
                        </display:table>
                    </div>
                    <div class="separador" style="align:right">&nbsp;</div>
              
                 </td>
               </tr>
               
                    
       </table>
</c:if>

<!--Fin PSU-->

<!-- Ini HIST INSPECCION_RIESGO-->
<c:if test="${!empty INSPECCION_RIESGO_HIST}" >

 <div class="separador">&nbsp;</div>
        <table class="area" align="center">
            <tr>
                <td class="campocaja" >
                    <img id="DSP_INSPECCION_RIESGO_HIST_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_INSPECCION_RIESGO_HIST', this)" style="cursor:pointer"/> 
                      <b><axis:alt f="axisctr020" c="DSP_INSPECCION_RIESGO_HIST" lit="9901313"/>&nbsp;<axis:alt f="axisctr020" c="DSP_INSPECCION_RIESGO_HIST" lit="9905410"/></b>
                    <hr class="titulo">
                </td>
            </tr>
            <tr id="DSP_INSPECCION_RIESGO_HIST_children"  style="display:none">
                <td>
                  <table class="area" align="center">                            
                   <tr>             
                        <td class="campocaja" colspan="4">                        
                        <div class="separador" style="align:right">&nbsp;</div>
                        <div class="displayspace">
                            <c:set var="title0"><axis:alt f="${pantalla}" c="CNORDEN" lit="9905245" /></c:set>
                            <c:set var="title1"><axis:alt f="${pantalla}" c="CNINSPECCION" lit="9905246" /></c:set>                               
                            <c:set var="title2"><axis:alt f="${pantalla}" c="FSOLICITUD" lit="9905247" /></c:set>
                            <c:set var="title3"><axis:alt f="${pantalla}" c="TESTADOORDEN" lit="9905248" /></c:set>                         
                            <c:set var="title4"><axis:alt f="${pantalla}" c="TCLASE" lit="9905249" /></c:set>
                            <c:set var="title5"><axis:alt f="${pantalla}" c="FVTOORDEN" lit="9905250" /></c:set>
                            <c:set var="title6"><axis:alt f="${pantalla}" c="FINSPECCION" lit="9905251" /></c:set>
                            <c:set var="title7"><axis:alt f="${pantalla}" c="TESTADOINSPECCION" lit="9905252" /></c:set>
                            <c:set var="title8"><axis:alt f="${pantalla}" c="MES" lit="1000113" /></c:set>
                            
                             <display:table name="${INSPECCION_RIESGO_HIST}" id="INSPECCION_RIESGO_HIST" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_${pantalla}.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                               <%@ include file="../include/displaytag.jsp"%>
                               
                               <display:column title="${title0}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO_HIST.SORDEN}</div>
                               </display:column>
                               
                               <display:column title="${title1}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO_HIST.NINSPECCION}</div>
                               </display:column>
                               
                               <display:column title="${title2}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO.FSOLICITUD}" pattern="dd/MM/yyyy"/></div>
                               </display:column>                           
                               
                               <display:column title="${title3}" sortable="false" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO_HIST.TESTADOORDEN}</div>
                               </display:column>                         
                               
                               <display:column title="${title4}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO_HIST.TCLASE}</div>
                               </display:column>
                               
                               <display:column title="${title5}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO_HIST.FVTORDEN}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title6}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspDate"><fmt:formatDate value="${INSPECCION_RIESGO_HIST.FINSPECCION}" pattern="dd/MM/yyyy"/></div>
                               </display:column>
                               
                               <display:column title="${title7}" sortable="false" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                                   <div class="dspText">${INSPECCION_RIESGO_HIST.TESTADOINSPECCION}</div>
                               </display:column>
                               <c:if test="${!empty INSPECCION_RIESGO_HIST.NINSPECCION}" >
                               <axis:visible f="${pantalla}" c="MASDETALL" >
                                    <display:column title="${title8}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="${pantalla}" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px" onclick="javascript:f_consultar_inspeccion(${INSPECCION_RIESGO_HIST.SORDEN}, ${INSPECCION_RIESGO_HIST.NINSPECCION})"
                                    style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='${pantalla}' c='INFO' lit='1000113'/>"/>
                                    </div>
                                    </display:column>
                                </axis:visible>
                                </c:if>
                           </display:table>
                        </div>
                        
                        </td>
                        </tr>
                        </table>
                        
                        
                    </td>
               </tr>
               
                    
       </table>
</c:if>
<!-- Fi HIST INSPECCION_RIESGO-->
       </td>
    </tr>
</c:if>
</axis:visible>
<!-- Pledge Nueva seccion -->
<c:if test="${! empty datos_poliza}">
<axis:visible f="${pantalla}" c="DSP_MOVPOLPIG" >   
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_MOVPOLPIG_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MOVPOLPIG', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="${pantalla}" c="DSP_MOVPOLPIG" lit="152211"></axis:alt></b>
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_MOVPOLPIG_children" style="display:none">
                                        <td>
                                            <c:set var="title0"><axis:alt f="${pantalla}" c="FECMOVIMI" lit="101006"/></c:set>   <%-- Fecha movimiento --%>
                                            <c:set var="title1"><axis:alt f="${pantalla}" c="BENEF" lit="9906366"/></c:set>  <%-- Beneficiario Pignoración--%>                                 
                                            <c:set var="title2"><axis:alt f="${pantalla}" c="MOTIV" lit="100588" /></c:set>  <%-- Descripción --%> 
                                            <c:set var="title3"><axis:alt f="${pantalla}" c="RANK" lit="9906365" /></c:set>  <%-- Rank --%> 
                                            <c:set var="title4"><axis:alt f="${pantalla}" c="USU" lit="100894" /></c:set>  <%-- Usuario --%>              
                                            <c:set var="title5"><axis:alt f="${pantalla}" c="FEFECTO" lit="100883" /></c:set>  <%-- Fecha efecto --%>
                                            <c:set var="title6"><axis:alt f="${pantalla}" c="FFINPIG" lit="9001198"/></c:set> <%-- Fecha finalización --%>
                                            <c:set var="title7"><axis:alt f="${pantalla}" c="TESTREC"  lit="100874" /></c:set>
                                           
                                            
                                            <div id="dt_polizas" class="seccion displayspace"> 
                                                <display:table name="${__formdata.T_IAX_MVTPOLIZAPIGNORADA}" id="T_IAX_MVTPOLIZAPIGNORADA" export="false" class="dsptgtable" pagesize="-1" 
                                                    sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr068.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <display:column title="${title0}" sortable="true" sortProperty="FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZAPIGNORADA.FMOVIMI}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                     
                                                   
                                                    <display:column title="${title1}" sortable="true" sortProperty="TTIPMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TNOMBRE}    
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TTEXTO}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TMOTMOV" headerClass="fixed sortable"  media="html" autolink="false" >
               
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TRANGO}
                                                        </div>
                                                      
                                                    </display:column>
													
                                                    <display:column title="${title4}" sortable="true" sortProperty="CUSUMOV" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.CUSUMOV}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title5}" sortable="true" sortProperty="FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZAPIGNORADA.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    
                                                    <axis:visible f="${pantalla}" c="TTIPOCAUSA">
                                                    <display:column title="${title7}" sortable="true" sortProperty="TTYPE" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            ${T_IAX_MVTPOLIZAPIGNORADA.TTIPOCAUSA}
                                                        </div>
                                                    </display:column>   
                                                    </axis:visible>
                                                    
                                                    <axis:visible f="${pantalla}" c="FFINAL">
                                                    <display:column title="${title6}" sortable="true" sortProperty="FFINAL" headerClass="fixed sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <fmt:formatDate value="${T_IAX_MVTPOLIZAPIGNORADA.FFINAL}" pattern="dd/MM/yyyy"/>
                                                        </div>
                                                    </display:column>
                                                    </axis:visible>
                                                </display:table>                                                        
                                            </div>
                </td>     
            </tr>            
     </axis:visible>
 </c:if>
<!-- Bug 10024-11/05/2009-AMC -->
<c:if test="${! empty diferidos}"> 
<axis:visible c="DSP_DIFERIDOS" f="${pantalla}">
                <tr>
                    <td class="campocaja" >
                        <img id="DSP_DIFERIDOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_DIFERIDOS', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="${pantalla}" c="DSP_DIFERIDOS" lit="9001543"></axis:alt></b>
                        <hr class="titulo">
                    </td>
                </tr>
                <tr id="DSP_DIFERIDOS_children" style="display:none">
                    <td class="campocaja" >
                        <c:set var="title0"><axis:alt f="${pantalla}" c="FECSUPL" lit="1000149" /></c:set> 
                        <c:set var="title1"><axis:alt f="${pantalla}" c="FALTA" lit="9001192" /></c:set>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="TMOTMOV" lit="102577" /></c:set>
                        <c:set var="title3"><axis:alt f="${pantalla}" c="TVALORD_DIF" lit="9000594" /></c:set>
                        <c:set var="title4"><axis:alt f="${pantalla}" c="CUSUARI" lit="100894" /></c:set>
                        <c:set var="title5"><axis:alt f="${pantalla}" c="TESTADO" lit="100587" /></c:set>
                        <c:set var="title6"><axis:alt f="${pantalla}" c="FANULA" lit="140214" /></c:set>
                        <c:set var="title7"><axis:alt f="${pantalla}" c="CANVI_ESTAT" lit="9001552" /></c:set>
                        <div class="displayspace">
                        <display:table name="${diferidos}" id="diferidos" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_${pantalla}.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="FECSUPL" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${diferidos.FECSUPL}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                 <display:column title="${title1}" sortable="true" sortProperty="FALTA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${diferidos.FALTA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TMOTMOV" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                    <div class="dspText">${diferidos.TMOTMOV}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" 
                                    style="width:8%;" sortProperty="TVALORD" headerClass="headwidth30 sortable"  
                                    media="html" autolink="false" >
                                    <div class="dspText">${diferidos.TVALORD}</div>
                               </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="CUSUARI" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                                    <div class="dspText">${diferidos.CUSUARI} </div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="TESTADO" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                                    <div class="dspText">${diferidos.TESTADO}</div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="FANULA" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                                    <div class="dspDate"><fmt:formatDate value="${diferidos.FANULA}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="CANVI_ESTAT" headerClass="headwidth3 sortable"  media="html" autolink="false" >
                                    <div class="dspIcons" align="center"><c:if test="${diferidos.CANVI_ESTAT == 'P'}"><img src="images/formulap.gif" onclick="f_cambiar_estado_diferido(${diferidos.CMOTMOV},${diferidos.ESTADO})"  style="cursor:pointer"/> </c:if> 
                                    <c:if test="${diferidos.CANVI_ESTAT == 'A'}"><img src="images/delete.gif" onclick="f_cambiar_estado_diferido(${diferidos.CMOTMOV},${diferidos.ESTADO})"  style="cursor:pointer"/> </c:if> </div>
                                </display:column> 
                            </display:table>
                        </div>
                        
                    </td>
                </tr>
</axis:visible>                
</c:if> 

<axis:visible f="${pantalla}" c="DSP_SUSCRIPTION" >
    <tr>
      <td class="campocaja" >
         <div style="float:left;">
         <img id="DSP_SUSCRIP_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_SUSCRIP', this)" style="cursor:pointer"/> 
         <b><axis:alt f="${pantalla}" c="DSP_SUSCRIP" lit="9908380"></axis:alt></b>
         </div>
         <div style="clear:both;">
           <hr class="titulo">
         </div>             
      </td>
    </tr>
    <tr id="DSP_SUSCRIP_children" style="display:none"> 
    <td class="campocaja">    
    <axis:visible f="${pantalla}" c="DSP_BASEQUESTION" >
    <div class="separador">&nbsp;</div>
    <table class="area" align="center">
      <tr>
        <td class="campocaja" >
          <div style="float:left;">
            <img id="DSP_BASEQUES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_BASEQUES', this)" style="cursor:pointer"/>
               <b><axis:alt f="${pantalla}" c="LIT_DSP_BASEQUES" lit="104734"/></b>&nbsp;&nbsp;
          </div>
          <div style="clear:both;">
            <hr class="titulo">
          </div>           
        </td>
      </tr>
      <tr id="DSP_BASEQUES_children" style="display:none">
        <td class="campocaja" >
           <c:set var="title0"><axis:alt f="${pantalla}" c="POSITION" lit="9901591" /></c:set> 
           <c:set var="title1"><axis:alt f="${pantalla}" c="CODE" lit="9908028" /></c:set> 
           <c:set var="title2"><axis:alt f="${pantalla}" c="CATEGORY" lit="9904258" /></c:set> 
           <c:set var="title3"><axis:alt f="${pantalla}" c="QUESTION" lit="9906457" /></c:set> 
           <c:set var="title4"><axis:alt f="${pantalla}" c="ANSWER" lit="9903853" /></c:set> 
           <div class="displayspace">
           <display:table name="${preguntasundw}"  id="dsppreguntas" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
              requestURI="axis_${pantalla}.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title0}" sortable="true" sortProperty="POSITION" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsppreguntas.OB_IAX_BASEQUESTION_UNDW.POSITION}</div>
                    </display:column>
                    <display:column title="${title1}" sortable="true" sortProperty="CODE" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsppreguntas.OB_IAX_BASEQUESTION_UNDW.CODE}</div>
                    </display:column>
                    <display:column title="${title2}" sortable="true" sortProperty="CATEGORY" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsppreguntas.OB_IAX_BASEQUESTION_UNDW.CATEGORY}</div>
                    </display:column>
                    <display:column title="${title3}" sortable="true" sortProperty="QUESTION" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsppreguntas.OB_IAX_BASEQUESTION_UNDW.QUESTION}</div>
                    </display:column>
                    <display:column title="${title4}" sortable="true" sortProperty="ANSWER" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsppreguntas.OB_IAX_BASEQUESTION_UNDW.ANSWER}</div>
                    </display:column>                          
           </display:table>
           </div>
        </td>
      </tr>
    </table>
    </axis:visible> 
    <axis:visible f="${pantalla}" c="DSP_ENFERMEDADES" >
    <div class="separador">&nbsp;</div>    
    <table class="area" align="center">
      <tr>
        <td class="campocaja" >
          <div style="float:left;">
            <img id="DSP_ENFERME_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_ENFERME', this)" style="cursor:pointer"/>
               <b><axis:alt f="${pantalla}" c="LIT_DSP_ENFERME" lit="9908344"/></b>&nbsp;&nbsp;
          </div>
          <div style="clear:both;">
            <hr class="titulo">
          </div>             
        </td>
      </tr>
      <tr id="DSP_ENFERME_children" style="display:none">
        <td class="campocaja" >
           <c:set var="title0"><axis:alt f="${pantalla}" c="CODENF" lit="1000109" /></c:set> 
           <c:set var="title1"><axis:alt f="${pantalla}" c="DESENF" lit="101761" /></c:set> 
           <div class="displayspace">
           <display:table name="${enfermedadesundw}"  id="dspenfermedades" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
              requestURI="axis_${pantalla}.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title0}" sortable="true" sortProperty="CODENF" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dspenfermedades.OB_IAX_ENFERMEDADES_UNDW.CODENF}</div>
                    </display:column>
                    <display:column title="${title1}" sortable="true" sortProperty="DESENF" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dspenfermedades.OB_IAX_ENFERMEDADES_UNDW.DESENF}</div>
                    </display:column>    
           </display:table>
           </div>
        </td>
      </tr>                    
    </table>
    </axis:visible>
    <axis:visible f="${pantalla}" c="DSP_ACCIONES" >
    <div class="separador">&nbsp;</div>    
    <table class="area" align="center">
      <tr>
        <td class="campocaja" >
          <div style="float:left;">
            <img id="DSP_ACCIO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_ACCIO', this)" style="cursor:pointer"/>
               <b><axis:alt f="${pantalla}" c="LIT_DSP_ACCIO" lit="9908383"/></b>&nbsp;&nbsp;
          </div>
          <div style="clear:both;">
            <hr class="titulo">
          </div>             
        </td>
      </tr>
      <tr id="DSP_ACCIO_children" style="display:none">
        <td class="campocaja" >
           <c:set var="title0"><axis:alt f="${pantalla}" c="ACTION" lit="9908384" /></c:set> 
           <c:set var="title1"><axis:alt f="${pantalla}" c="NASEG"  lit="9908385" /></c:set> 
           <c:set var="title2"><axis:alt f="${pantalla}" c="NOMBRE" lit="9907629" /></c:set>            
           <div class="displayspace">
           <display:table name="${accionesundw}"  id="dspacciones" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
              requestURI="axis_${pantalla}.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title0}" sortable="true" sortProperty="ACTION" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dspacciones.OB_IAX_ACTIONS_UNDW.ACTION}</div>
                    </display:column>
                    <axis:visible f="${pantalla}" c="PERCUBIERTA">
                    <display:column title="${title1}" sortable="true" sortProperty="NASEG" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dspacciones.OB_IAX_ACTIONS_UNDW.NASEG}</div>
                    </display:column>
                    </axis:visible>
                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="headwidth15 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dspacciones.OB_IAX_ACTIONS_UNDW.NOMBRE}</div>
                    </display:column>                    
           </display:table>
           </div>
        </td>
      </tr>                    
    </table>
    </axis:visible>   
    <axis:visible f="${pantalla}" c="DSP_EXCLUSIONES" >
    <div class="separador">&nbsp;</div>
    <table class="area" align="center">
      <tr>
        <td class="campocaja" >
          <div style="float:left;">
            <img id="DSP_EXLUSIONES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_EXCLUSIONES', this)" style="cursor:pointer"/>
               <b><axis:alt f="${pantalla}" c="LIT_DSP_EXCLUSIONES" lit="9908389"/></b>&nbsp;&nbsp;
          </div>
          <div style="clear:both;">
            <hr class="titulo">
          </div>           
        </td>
      </tr>
      <tr id="DSP_EXCLUSIONES_children" style="display:none">
        <td class="campocaja" >
           <c:set var="title0"><axis:alt f="${pantalla}" c="CODEEXC" lit="9908394" /></c:set> 
           <c:set var="title1"><axis:alt f="${pantalla}" c="NAMEEXC" lit="9908395" /></c:set> 
           <c:set var="title2"><axis:alt f="${pantalla}" c="DESCEXC" lit="9908397" /></c:set> 

           <div class="displayspace">
           <display:table name="${exclusionesundw}"  id="dsexlusiones" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
              requestURI="axis_${pantalla}.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                    <display:column title="${title0}" sortable="true" sortProperty="CODEEXC" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsexlusiones.OB_IAX_EXCLUSIONES.CODEXCLUS}</div>
                    </display:column>
                    <display:column title="${title1}" sortable="true" sortProperty="NAMEEXC" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsexlusiones.OB_IAX_EXCLUSIONES.TEXCLUS}</div>
                    </display:column>
                    <display:column title="${title2}" sortable="true" sortProperty="DESCEXC" headerClass="headwidth7 sortable"  media="html" autolink="false" >
                        <div class="dspText">${dsexlusiones.OB_IAX_EXCLUSIONES.TEXCLUSDET}</div>
                    </display:column>
                              
           </display:table>
           </div>
        </td>
      </tr>
    </table>
    </axis:visible> 
    </td>
    </tr>     
</axis:visible> 

         <axis:visible c="DSP_MOVCASH" f="${pantalla}">
                  <tr>
                   <td class="campocaja">
                    <div style="float:left;">
                     <img id="DSP_MOVIMIENTOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MOVIMIENTOS', this)" style="cursor:pointer"/>
                     <b><axis:alt f="axisctr020" c="LIT_DSP_MOVI" lit="9908576"/></b>
                    </div>   
                    <div style="clear:both;">
                     <hr class="titulo">
                    </div>                 
                   </td>
                  </tr>
                  <tr id="DSP_MOVIMIENTOS_children" style="display:none">
                    <td class="campocaja">
                      <%-- DisplayTag Facturas--%>
                      <c:set var="title0">
                        <axis:alt f="axisctr020" c="NNUMLIN" lit="100899"/><!-- 100899 Número -->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axisctr020" c="FFECMOV" lit="1000597"/><!--1000597 Fecha día -->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axisctr020" c="FFECVAL" lit="1000590"/><!-- 1000590 Fecha valor -->
                      </c:set>
                       <c:set var="title3">
                        <axis:alt f="axisctr020" c="CMOVIMI" lit="1000591"/><!--1000591 Tipo movimiento -->
                      </c:set>
                      <c:set var="title30">
                        <axis:alt f="axisctr020" c="TDESCRI" lit="101761"/><!--101761 Descripción-->
                      </c:set>
                      <c:set var="title4">
                        <axis:alt f="axisctr020" c="CMEDMOV" lit="9902444"/><!-- 9902444 Medio de Pago -->
                      </c:set>
                      <c:set var="title5">
                        <axis:alt f="axisctr020" c="NCHEQUE" lit="9905071"/><!-- 9905071 Cheque -->
                      </c:set>
                       <c:set var="title6">
                        <axis:alt f="axisctr020" c="IIMPPRO"   lit="9905111"/><!-- 9905111 Importe Moneda Producto  -->
                      </c:set>
                       <c:set var="title7">
                        <axis:alt f="axisctr020" c="CMONEDA" lit="108645"/><!--108645 Moneda -->
                      </c:set>
                       <c:set var="title8">
                        <axis:alt f="axisctr020" c="IIMPOPE" lit="100563"/><!-- 100563 Importe -->
                      </c:set>
                      <c:set var="title9">
                        <axis:alt f="axisctr020" c="IIMPINS" lit="9905112"/><!-- 9905112 Importe Moneda Sistema -->
                      </c:set>
                      <c:set var="title10">
                        <axis:alt f="axisctr020" c="FCAMBIO" lit="9900897"/><!-- 9900897 Fecha cambio -->
                      </c:set>
                      <c:set var="title11">
                        <axis:alt f="axisctr020" c="ISALDO" lit="9001942"/><!-- 9001942 Saldo -->
                      </c:set>
                      <c:set var="title12">
                        <axis:alt f="axisctr020" c="TMOVIMI" lit="1000591"/><!--1000591 Tipo movimiento -->
                      </c:set>
                      <c:set var="title13">
                        <axis:alt f="axisctr020" c="TMEDMOV" lit="9902444"/><!-- 9902444 Medio de Pago -->
                      </c:set>
                       <c:set var="title14">
                        <axis:alt f="axisctr020" c="TMEDMOV" lit="9001285"/><!-- REFERENCIA DEPOSITO-->
                      </c:set>
                      
                      <c:set var="title15">
                        <axis:alt f="axisctr020" c="NSEQCAJA" lit="1000559"/>
                      </c:set>
                      
                      <div id="dt_recibos" class="seccion displayspaceGrande" style="overflow-x:auto">
                        <display:table name="${__formdata.OBTENERMOVIMIENTOS}" id="lstMov" export="false" class="dsptgtable" pagesize="-1" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axisctr020.do?paginar=true" style="width:100%" >
                          <%@ include file="../include/displaytag.jsp"%>
                            <axis:visible f="axisctr020" c="NREFDEPOSITO" >
                            <display:column title="${title14}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.NREFDEPOSITO}
                              </div>
                            </display:column>
                            </axis:visible>
                            
                            <axis:visible f="axisctr020" c="NSEQCAJA" >
                            <display:column title="${title15}" headerClass="sortable" 
                                            media="html"  
                                            style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.SEQCAJA}
                              </div>
                            </display:column>
                            </axis:visible>
                            
                            <axis:visible f="axisctr020" c="DATE" >
                             <display:column title="${title1}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECMOV}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                             <axis:visible f="axisctr020" c="VALUE_DATE" >
                             <display:column title="${title2}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECVAL}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                            <axis:visible f="axisctr020" c="TMOVIMI" >
                            <display:column title="${title12}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.TMOVIMI}
                              </div>
                            </display:column>
                            </axis:visible>
                             <display:column title="${title30}" headerClass="sortable" media="html">
                              <div class="dspText">
                                ${lstMov.TDESCRI}
                              </div>
                            </display:column>
                             <display:column title="${title8}" headerClass="sortable" media="html" style="white-space:nowrap; " >
                              <div class="dspNumber">
                                <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDA]}" value="${lstMov.IIMPOPE}"/> ${lstMov.CMONEDA} 
                              </div>
                            </display:column>
                             <display:column title="${title6}" headerClass="sortable" media="html" style="white-space:nowrap; " >
                               <div class="dspNumber">
                                    <fmt:formatNumber pattern="${__formatNumberPatterns[lstMov.CMONEDAPRO]}" value="${lstMov.IIMPPRO}"/> ${lstMov.CMONEDAPRO}
                              </div>
                            </display:column>
                            <display:column title="${title9}" headerClass="sortable" media="html" style="white-space:nowrap;">
                               <div class="dspNumber">
                                  <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.IIMPINS}"/> ${lstMov.CMONEDAINS}
                              </div>
                            </display:column>
                            <axis:visible f="${pantalla}" c="FCAMBIOTAB" >
                             <display:column title="${title10}" sortable="true" sortProperty="FCAMBIO" headerClass="sortable" media="html" autolink="false">
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FCAMBIO}'/> 
                              </div> 
                            </display:column>
                            </axis:visible>
                             <display:column title="${title11}" headerClass="sortable" media="html" style="white-space:nowrap; ">
                             <div class="dspNumber">
                              <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.ISALDO}"/> ${lstMov.CMONEDAINS}
                              </div>
                            </display:column>
                            
                            <display:column title="" sortable="true" 
                                            sortProperty="" headerClass="sortable fixed" 
                                            media="html"  autolink="false" >
                                <div class="dspIcons" >
                                <img border="0" alt="<axis:alt c="BT_CONSULTAR" f="axisctr020" lit="1000113"/>" 
                                    title="<axis:alt c="BT_CONSULTAR" f="axisctr020" lit="1000113"/>" src="images/informacion.gif" width="12px" height="12px"
                                    style="cursor:pointer;" onClick="javascript:f_seleccionar('${lstMov.SEQCAJA}', '${lstMov.NNUMLIN2}')" />
                                </div>
                            </display:column>
                        </display:table>
                      </div>
                    </td>
                  </tr>
              </axis:visible>

<axis:visible f="${pantalla}" c="DSP_PSU_RETENIDAS_HIST">
	<div id="gridPSU_OBSERV">
		<table class="area" align="center" cellpadding="0" cellspacing="0">

			<tr>
				<td class="campocaja"><img id="DSP_PSU_RETENIDAS_HIST_parent"
					src="images/mes.gif"
					onclick="objEstilos.toggleDisplay('DSP_PSU_RETENIDAS_HIST', this)"
					style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
							c="DSP_PSU_RETENIDAS_HIST " lit="9903021" /></b>
					<hr class="titulo"></hr></td>
			</tr>
			<tr id="DSP_PSU_RETENIDAS_HIST_children" style="display: none">

				<c:set var="title14">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909285" />
				</c:set>
				<c:set var="title15">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
				</c:set>
				<c:set var="title16">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100894" />
				</c:set>
				<c:set var="title17">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
				</c:set>
				<c:set var="title18">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909287" />
				</c:set>
				
				<c:set var="title20">
					<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
				</c:set>


				<td class="campocaja"><display:table
						name="${__formdata.P_TPSU}" id="lstPsuRetenidas"
						export="false" class="dsptgtable" pagesize="-1" sort="list"
						cellpadding="0" cellspacing="0"
						requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
						<%@ include file="../include/displaytag.jsp"%>

						<display:column title="" sortable="true" sortProperty="CMOVIMI"
							headerClass="sortable" media="html" autolink="false"
							style="white-space:nowrap; width:15px">
							<input
								onClick="javascript:f_cargar_lstPsuControl('${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.SSEGURO}','${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}','${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NMOVIMI}')"
								value="" type="radio" id="radioNMOVIMI" name="radioNMOVIMI" />
						</display:column>

						<display:column title="${title14}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">
								<fmt:formatDate
									value="${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.FFECAUT}"
									pattern="dd/MM/yyyy" />
							</div>

						</display:column>



						<display:column title="${title15}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.NVERSION}</div>
						</display:column>



						<display:column title="${title16}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.CUSUAUT}</div>
						</display:column>

						<display:column title="${title17}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.TESTPOL}</div>
						</display:column>

						<display:column title="" sortable="true" sortProperty=""
							headerClass="sortable" media="html" autolink="false"
							style="white-space:nowrap; width:15px">

							<div class="dspIcons">
								${lstPsuRetenidas.OB_IAX_PSU_RETENIDAS.TSUBESTADO}</div>

						</display:column>
						
						


					</display:table></td>


			</tr>
		</table>
	</div>
</axis:visible>

<axis:visible f="${pantalla}" c="DSP_PSUCONTROLSEG_HIST">


	<c:set var="title24">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900975" />
	</c:set>
	<c:set var="title25">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9909286" />
	</c:set>
	<c:set var="title26">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900976" />
	</c:set>
	<c:set var="title27">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="100587" />
	</c:set>

	<c:set var="title29">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9906106" />
	</c:set>
	<c:set var="title30">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="101162" />
	</c:set>
	<c:set var="title31">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="9900978" />
	</c:set>
	<c:set var="title32">
		<axis:alt f="${pantalla}" c="FSOLICITUD" lit="1000113" />
	</c:set>





	<div id="gridPSU_OBSERV">

		<table class="area" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="campocaja"><img id="DSP_PSUCONTROLSEG_HIST_parent"
					src="images/mes.gif"
					onclick="objEstilos.toggleDisplay('DSP_PSUCONTROLSEG_HIST', this)"
					style="cursor: pointer" /> <b><axis:alt f="${pantalla}"
							c="DSP_PSUCONTROLSEG_HIST" lit="9904548" /></b>
					<hr class="titulo"></hr></td>
			</tr>
			<tr id="DSP_PSUCONTROLSEG_HIST_children" style="display: none">


				<td class="campocaja"><display:table
						name="${__formdata.P_TPSUCONTRSEG_HIST}" id="lstPsuControl"
						export="false" class="dsptgtable" pagesize="-1" sort="list"
						cellpadding="0" cellspacing="0"
						requestURI="axis_axisctr020.do?paginar=true" style="width:100%">
						<%@ include file="../include/displaytag.jsp"%>


						<display:column title="${title24}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.TCONTROL}</div>
						</display:column>

						<display:column title="${title25}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.NVERSION}</div>
						</display:column>

						<display:column title="${title26}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">
								<fmt:formatDate value="${lstPsuControl.OB_IAX_PSU.FAUTREC}"
									pattern="dd/MM/yyyy" />
							</div>
						</display:column>

						<display:column title="${title27}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.TAUTREC}</div>
						</display:column>


						<display:column title="${title29}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.NRIESGO}
								"-" ${lstPsuControl.OB_IAX_PSU.CGARANT}</div>
						</display:column>

						<display:column title="${title30}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.OBSERV}</div>
						</display:column>

						<display:column title="${title31}" sortable="true"
							sortProperty="CMOVIMI" headerClass="sortable" media="html"
							autolink="false" style="white-space:nowrap; width:15px">
							<div class="dspText">${lstPsuControl.OB_IAX_PSU.TNIVELR}</div>
						</display:column>


						<display:column title="${title32}" sortable="true" sortProperty=""
							headerClass="sortable" media="html" autolink="false"
							style="white-space:nowrap; width:15px">
							<div class="dspIcons">
								<img border="0" src="images/informacion.gif" width="12px"
									height="12px" style="cursor: pointer;"
									onClick="javascript:f_axispsu016('${lstPsuControl.OB_IAX_PSU.SSEGURO}','${lstPsuControl.OB_IAX_PSU.NVERSION}',
								'${lstPsuControl.OB_IAX_PSU.NMOVIMI}','${lstPsuControl.OB_IAX_PSU.CCONTROL}')" />
							</div>
						</display:column>


					</display:table></td>
			</tr>

		</table>
	</div>
</axis:visible>
<c:if test="${! empty documentacion}">
                <tr>
                    <td class="campocaja" >
                        <img id="documentacion_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('documentacion', this)" style="cursor:pointer"/> 
                        <b><axis:alt f="${pantalla}" c="DOC_PARENT" lit="1000117" /></b> (${fn:length(documentacion)}) - 1. ${documentacion[0]}
                        <hr class="titulo">
                    </td>
                </tr>                                        
</c:if>
                                    <!--/table>
                                </td>
                            </tr-->
                        </table>
                    </td>
                </tr>
                
                
