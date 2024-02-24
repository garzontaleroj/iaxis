<%/* Revision:# WsHBMMWUe1t48jRmBno8rw== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<input type="hidden" name="NOCONTINUA" id="NOCONTINUA" value="${__formdata.NOCONTINUA}"/>
<input type="hidden" name="NOVISIBLE" id="NOVISIBLE" value="${__formdata.NOVISIBLE}"/>

<tr>
    <td>
        <table class="seccion">
        <tr>
            <td align="left">
            <table class="area" align="center">
                <tr>
                    <th style="height:0px"></th>
                </tr>
<%--
---------------------------- 
--%>
<!-- BUG CONF-186 - 22/08/2016 - HRE -->
<c:if test="${!empty MARCAS}">
     <tr>
        <td class="campocaja" >
            <img id="DSP_MARCAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_MARCAS', this)" style="cursor:pointer"/> 
             <b><axis:alt f="axisctr009" c="DSP_MARCAS" lit="9909288"></axis:alt></b> 
            <hr class="titulo">
        </td>
     </tr>
    <tr id="DSP_MARCAS_children"  style="display:none">
        <td class="campocaja" >
            <div class="displayspace">
                 <c:set var="title0"><axis:alt f="axisctr009" c="AREA" lit="9909317" /></c:set>
                 <c:set var="title1"><axis:alt f="axisctr009" c="CODMARCA" lit="109155" /></c:set>                               
                 <c:set var="title2"><axis:alt f="axisctr009" c="DESCRIPCION" lit="101761" /></c:set>
                 <c:set var="title3"><axis:alt f="axisctr009" c="PERSONA" lit="111523" /></c:set>
                 <c:set var="title4"><axis:alt f="axisctr009" c="ROL" lit="9901939" /></c:set>
                 <c:set var="title5"><axis:alt f="axisctr009" c="TIPO" lit="9901195" /></c:set>                         
                 <c:set var="title6"><axis:alt f="axisctr009" c="ACCION" lit="9000844" /></c:set>
                 <c:set var="title7"><axis:alt f="axisctr009" c="DETALLE" lit="1000113" /></c:set>
                 
                 <display:table name="${MARCAS}" id="MARCAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                 requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                   <%@ include file="../include/displaytag.jsp"%>                         
                   
                   
                   <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.AREA}</div>
                   </display:column>
                   
                   <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.CMARCA}</div>
                   </display:column>
                   
                   <axis:visible f="axisctr009" c="TAUTREC">   
                   <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.DESCRIPCION}</div>
                   </display:column>
                   </axis:visible>
                  
                   <display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.PERSONA} </div>
                   </display:column>
                   
                   <display:column title="${title4}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.ROL} </div>
                   </display:column>
                   
                   
                   <display:column title="${title5}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.TIPO} </div>
                   </display:column>
                   
                   <display:column title="${title6}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                       <div class="dspText">${MARCAS.ACCION}</div>
                   </display:column>
                   
                   <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                        <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr009" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                        style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axisper046('${MARCAS.SPERSON}', '${MARCAS.CMARCA}')" title="<axis:alt f='axisctr009' c='INFO' lit='1000113'/>"/>
                        
                        
                        </div>
                   </display:column>                           
                </display:table>
            </div>
        </td>
    </tr>
</c:if>
<!-- BUG CONF-186 - 22/08/2016 - HRE -->

<c:if test="${!empty PTPSUS}">
     <tr>
                <td class="campocaja" >
                    <img id="DSP_PSU_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PSU', this)" style="cursor:pointer"/> 
                     <b><axis:alt f="axisctr009" c="DSP_PSU" lit="9002255"></axis:alt></b> ${PTESTPOL} ${PTNIVELBPM}
                    <hr class="titulo">
                </td>
            </tr>
            <tr id="DSP_PSU_children"  style="display:none">
                <td class="campocaja" >
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr009" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr009" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="axisctr009" c="TAUTREC" lit="9900977" /></c:set>
                         <c:set var="title5"><axis:alt f="axisctr009" c="TRIESGO" lit="100649" />&nbsp;-&nbsp;<axis:alt f="${pantalla}" c="TGARANT" lit="110994" /></c:set>                         
                         <c:set var="title6"><axis:alt f="axisctr009" c="TNIVELR" lit="9900978" /></c:set>
                         <c:set var="title7"><axis:alt f="axisctr009" c="INFO" lit="1000113" /></c:set>
                        <c:set var="title8"><axis:alt f="axisctr009" c="CCRITICO" lit="9905109" /></c:set>
                         
                         
                         <display:table name="${PTPSUS}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                           </display:column>
                           
                           <axis:visible f="axisctr009" c="TAUTREC">   
                           <display:column title="${title2}" sortable="true" sortProperty="" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>
                           
                           <%--display:column title="${title3}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.FAUTREC}</div>
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
                           <axis:visible f="axisctr009" c="CCRITICO" >
                            <display:column title="${title8}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText" >
                               <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${T_IAX_PSU.OB_IAX_PSU.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${T_IAX_PSU.OB_IAX_PSU.CCRITICO}"
                               <axis:atr f="axisctr100" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                               </div>
                           </display:column>
                         </axis:visible>
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr009" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.NOCURRE}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr009' c='INFO' lit='1000113'/>"/>
                                </div>
                           </display:column>                           
                        </display:table>
                    </div>
                </td>
            </tr>
           
        </tr>       
</c:if>

<%---------------Inspección de riesgo--------------%>
<axis:visible f="axisctr009" c="DSP_INSPECCION_RIESGO" >
        <c:if test="${!empty GESTION_IR && GESTION_IR == 1}">
                
                <tr>
                    <td class="campocaja" >                        
                        <img id="DSP_INSPECCION_RIESGO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_INSPECCION_RIESGO', this)" style="cursor:pointer"/>
                        <b><axis:alt f="axisctr009" c="DSP_INSPECCION_RIESGO" lit="9905241"/></b>
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
                        <axis:ocultar c="CINSPREQ" f="axisctr009" dejarHueco="false">
                            <select name = "CINSPREQ" id ="CINSPREQ" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr009" c="CINSPREQ" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CINSPREQ" lit="9905242"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr009" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec1}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CINSPREQ ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>
                        </axis:ocultar> 
                        </td>
                          <td class="campocaja" >  
                        <axis:ocultar c="CRESULTR" f="axisctr009" dejarHueco="false">
                            <select name = "CRESULTR" id ="CRESULTR" class="campowidthselect campo" style="width:200px;"
                                <axis:atr f="axisctr009" c="CRESULTR" a="modificable=false&isInputText=false&obligatorio=true"/> title="<axis:alt f="${pantalla}" c="CRESULTR" lit="9905243"/>">
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr009" c="SNV_COMBO" lit="108341" /> - </option>
                                <c:forEach items="${__formdata.listvalores.lstInspec2}" var="item">
                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CRESULTR ==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                </c:forEach>
                            </select>            
                        </axis:ocultar>
                        </td>
                        </tr>
                        <tr>
                        <td class="campocaja" colspan="4">
                        
                         <div class="displayspace">
                            <c:set var="title0"><axis:alt f="axisctr009" c="CNORDEN" lit="9905245" /></c:set>
                            <c:set var="title1"><axis:alt f="axisctr009" c="CNINSPECCION" lit="9905246" /></c:set>                               
                            <c:set var="title2"><axis:alt f="axisctr009" c="FSOLICITUD" lit="9905247" /></c:set>
                            <c:set var="title3"><axis:alt f="axisctr009" c="TESTADOORDEN" lit="9905248" /></c:set>                         
                            <c:set var="title4"><axis:alt f="axisctr009" c="TCLASE" lit="9905249" /></c:set>
                            <c:set var="title5"><axis:alt f="axisctr009" c="FVTOORDEN" lit="9905250" /></c:set>
                            <c:set var="title6"><axis:alt f="axisctr009" c="FINSPECCION" lit="9905251" /></c:set>
                            <c:set var="title7"><axis:alt f="axisctr009" c="TESTADOINSPECCION" lit="9905252" /></c:set>
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
                                    <display:column title="${title8}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr009" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px" onclick="javascript:f_consultar_inspeccion(${INSPECCION_RIESGO.SORDEN}, ${INSPECCION_RIESGO.NINSPECCION})"
                                    style="vertical-align:middle;cursor:pointer;"  title="<axis:alt f='axisctr009' c='INFO' lit='1000113'/>"/>
                                    </div>
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
<%----------------Fi Inspección de riesgo------------------%>

<c:if test="${! empty mvtretencion}">
                                       <tr>
                                            <td class="campocaja">
                                                <img src="images/mes.gif" id="DSP_MVTRETENCION_parent" onclick="objEstilos.toggleDisplay('DSP_MVTRETENCION', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr009" c="MVTRETENC" lit="1000297" /></b>&nbsp;&nbsp; ${mvtretencion[0].OB_IAX_POLMVTRETEN.TMOTRET} <c:if  test="${mvtretencion[0].OB_IAX_POLMVTRETEN.FRETEN!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr009" c="DATARETEN" lit="1000148" />&nbsp;<fmt:formatDate value="${mvtretencion[0].OB_IAX_POLMVTRETEN.FRETEN}" pattern="dd/MM/yyyy"/></c:if> <c:if  test="${mvtretencion[0].OB_IAX_POLMVTRETEN.FRETREV!=null}">&nbsp;-&nbsp;<axis:alt f="axisctr009" c="DATAREV" lit="105403" />&nbsp;<fmt:formatDate value="${mvtretencion[0].OB_IAX_POLMVTRETEN.FREVRET}" pattern="dd/MM/yyyy"/></c:if>
                                                <hr class="titulo">
                                            </td>
                                        </tr>
                                        <tr id="DSP_MVTRETENCION_children" style="display:none">
                                            <td class="campocaja">
                                                <div class="displayspace">
                                                  <c:set var="title0"><axis:alt f="axisctr009" c="MVTRETENC" lit="1000297" /></c:set>
                                                  <c:set var="title1"><axis:alt f="axisctr009" c="DATARETEN" lit="1000148" /></c:set>
                                                  <c:set var="title2"><axis:alt f="axisctr009" c="USUARIO" lit="100894" /></c:set>
                                                  <c:set var="title3"><axis:alt f="axisctr009" c="DATAREV" lit="105403" /></c:set>
                                                  <c:set var="title4"><axis:alt f="axisctr009" c="USERREV" lit="105404" /></c:set>
                                                  <c:set var="title5"><axis:alt f="axisctr009" c="RIESGO_RET" lit="100649"></axis:alt></c:set>
                                                  <c:set var="title6"><axis:alt f="axisctr009" c="RESULT" lit="1000345" /></c:set>
                                                   <axis:tabla name="${mvtretencion}" miid="mimvtretencion" objeto="OB_IAX_POLMVTRETEN" campos="TMOTRET(O)#FRETEN(O)#CUSURET(O)#FREVRET(O)#CUSUREF(O)#TRIESGO(O)#TRESULTA(O)" estilos="dspText#dspDate#dspText#dspDate#dspText#dspText#dspText" titulos="${title0}@@${title1}@@${title2}@@${title3}@@${title4}@@${title5}@@${title6}"  columnHeaderClass="sortable gridsorted gridasc#sortable#sortable#sortable#sortable#sortable#sortable" cellpadding="0" cellspacing="0"/>
                                                </div>
                                                <hr />
                                               
                                            </td>
                                        </tr>
</c:if>



<c:if test="${! empty datos_poliza}">
                                        <tr>
                                            <td class="campocaja">
                                                <img src="images/mes.gif" id="DSP_DATOSPOLIZA_parent" onclick="objEstilos.toggleDisplay('DSP_DATOSPOLIZA', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr009" c="DATOSPOLIZA" lit="104925" /></b>  &nbsp; ${datos_poliza.NPOLIZA}  <c:if test="${!empty datos_poliza.NCERTIF}" ><axis:visible f="axisctr009" c="NCERTIF" >&nbsp;-&nbsp;${datos_poliza.NCERTIF}</axis:visible></c:if><c:if test="${!empty datos_poliza.TSITUAC}" > &nbsp;-&nbsp;${datos_poliza.TSITUAC} </c:if> <c:if test="${!empty datos_poliza.TRETENI}" > &nbsp;-&nbsp;${datos_poliza.TRETENI} </c:if> <c:if test="${!empty datos_poliza.FEFECTO}"> &nbsp;-&nbsp;<axis:alt f="axisctr009" c="FEFECTO" lit="100883" />&nbsp;<fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy"/></c:if> <c:if test="${!empty datos_poliza.FVENCIM}"> &nbsp;-&nbsp;<axis:alt f="axisctr009" c="FVENCIM" lit="100885" />&nbsp;<fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy"/></c:if>
                                                <hr class="titulo">
                                            </td>
                                        </tr>
                                        
                                        <tr id="DSP_DATOSPOLIZA_children" style="display:none">
                                        <td align="left">
                         <table class="area" align="center">
                             <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axisctr009" c="NPOLIZA" dejarHueco="false">
                                <!-- Numero de poliza -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="NPOLIZA" lit="100624" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NCERTIF" dejarHueco="false">
                                <!-- Numero de cwertificado -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="NCERTIF" lit="101096" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="TPRODUC" dejarHueco="false">
                                <!-- Producto -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TPRODUC" lit="100681" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="FEFECTO" dejarHueco="false">
                                <!-- Fecha efecto -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="FEFECTO" lit="100883" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="CPOLCIA" dejarHueco="false">
                                <!-- Poliza Compañia -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="CPOLCIA" lit="9001766" /></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr009" c="NPOLIZA" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                    value="${datos_poliza.NPOLIZA}" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NCERTIF" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"
                                    value="${datos_poliza.NCERTIF}" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="TPRODUC" dejarHueco="false">
                                <td class="campocaja"  nowrap="nowrap">
                                    <input type="text" class="campowidthinput campo campotexto" id="TPRODUC" name="TPRODUC" size="15" style="width:200px"
                                    value="${datos_poliza.TPRODUC}" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="FEFECTO" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                    value=" <fmt:formatDate value="${datos_poliza.FEFECTO}" pattern="dd/MM/yyyy" />" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="CPOLCIA" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="CPOLCIA" name="CPOLCIA" size="15"
                                    value="${datos_poliza.CPOLCIA}" readonly="true" />
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr009" c="FVENCIM" dejarHueco="false">
                                <!-- Fecha vencimiento -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="FVENCIM" lit="100885" /></b>
                                </td>
                                </axis:ocultar>
                                <!-- TDuraci -->
                                <axis:ocultar f="axisctr009" c="TDURACI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TDURACI" lit="1000120" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NDURCOB" dejarHueco="false">
                                <!-- NDURCOB -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="NDURCOB" lit="9000814" /></b>
                                </td>  
                                </axis:ocultar>                                
                                <axis:ocultar f="axisctr009" c="TSITUAC" dejarHueco="false">
                                <!-- T situacion -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TSITUAC" lit="100874" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="POLISSA_INI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="POLISSA_INI" lit="1000017" /></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr009" c="FVENCIM" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15"
                                    value=" <fmt:formatDate value="${datos_poliza.FVENCIM}" pattern="dd/MM/yyyy" />" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="TDURACI" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TDURACI" name="TDURACI" size="15"
                                    value="${datos_poliza.TDURACI}" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NDURCOB" dejarHueco="false">
                                <!-- NDURCOB -->
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB" size="15" style="width:60%;"
                                    value="${datos_poliza.NDURCOB}" readonly="true" />
                                </td>                                    
                                </axis:ocultar>                                
                                <axis:ocultar f="axisctr009" c="TSITUAC" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="NNUMIDE" name="NNUMIDE" size="15"
                                    value="${datos_poliza.TSITUAC}" readonly="true" />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="POLISSA_INI" dejarHueco="false">
                                <td class="campocaja">
                                    <input readonly="true" type="text" class="campowidthinput campo campotexto" id="polissa_ini" name="polissa_ini" 
                                    title="<axis:alt f="axisctr009" c="POLISSA_INI" lit="1000017"/>" size="15" value ="${datos_poliza.POLISSA_INI}"/>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            
                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                            <tr>
                                <axis:ocultar f="axisctr009" c="PEJECUCION2"  >
                                    <td class="titulocaja" align="right">
                                    </td>
                                </axis:ocultar>
                                
                                <td class="titulocaja" style="white-space:nowrap">
                                    <axis:ocultar f="axisctr009" c="FEFEPLAZO" >
                                        <b id="label_FEFEPLAZO"><axis:alt f="axisctr009" c="LIT_9908885" lit="9908885" /></b>
                                        <b class="campocaja" style="white-space:nowrap"></b>
                                        <b class="campocaja" style="white-space:nowrap"></b>                                            
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axisctr009" c="FVENCPLAZO" >
                                        <b id="label_FVENCPLAZO"><axis:alt f="axisctr009" c="LIT_9908886" lit="9908886" /></b>
                                    </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr009" c="PEJECUCION"  >
                                    <td class="titulocaja" align="right">
                                        <b id="label_PEJECUCION"><axis:alt f="axisctr009" c="LIT_9908900" lit="9908900" /></b>
                                    </td>
                                </axis:ocultar>
                                
                                <td class="campocaja"  style="white-space:nowrap">
                                 <axis:ocultar f="axisctr009" c="FEFEPLAZO" >                                        
                                        <jsp:useBean id="today_FEFEPLAZO" class="java.util.Date" /> 
                                        <c:set var="FEFEPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFEPLAZO}"/></c:set>
                                        <input style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                        <axis:atr f="axisctr009" c="FEFEPLAZO" a="modificable=false&obligatorio=false&formato=fecha"/>
                                        value="${FEFEPLAZO} <c:if test="${empty FEFEPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FEFEPLAZO}"/></c:if>"
                                        title="<axis:alt f="axisctr009" c="LIT_9908885" lit="9908885"/>"/>
                                </axis:ocultar>                                    
                                
                                 <axis:ocultar f="axisctr009" c="FVENCPLAZO" >
                                        <b class="campocaja"  style="white-space:nowrap"></b>
                                        <jsp:useBean id="today_FVENCPLAZO" class="java.util.Date" /> 
                                        <c:set var="FVENCPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FVENCPLAZO}"/></c:set>
                                        <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FVENCPLAZO" name="FVENCPLAZO" size="15"
                                        <axis:atr f="axisctr009" c="FVENCPLAZO" a="modificable=false&obligatorio=false&formato=fecha"/>
                                        value="${FVENCPLAZO} <c:if test="${empty FVENCPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FVENCPLAZO}"/></c:if>"
                                        title="<axis:alt f="axisctr009" c="LIT_9908886" lit="9908886"/>"/>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                            
                            
                            
                            <tr>
                            <axis:ocultar f="axisctr009" c="CAGENTE" dejarHueco="false">
                            <!-- Agente -->
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr009" c="CAGENTE" lit="100584" /></b>
                            </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                            <axis:ocultar f="axisctr009" c="CAGENTE" dejarHueco="false">
                            <td class="campocaja" colspan="6" nowrap="nowrap">
                                <axis:visible f="axisctr009" c="CAGENTE1">
                                   <input type="text" class="campowidthinput campo campotexto" id="CAGENTE" name="CAGENTE" style="width:60px"
                                      value="${datos_poliza.CAGENTE}" readonly="true" />
                                </axis:visible>      
                                   <input type="text" class="campowidthinput campo campotexto" id="TAGENTE" name="TAGENTE" size="15"  style="width:420px" 
                                      value="${datos_poliza.axisctr009_agente.NOMBRE}" readonly="true" />
                                      
                            </td>
                            </axis:ocultar>
                            </tr>
                             <!--'Número de caso BPM' y 'Número de solicitud BPM'-->
                            <tr>
                                <axis:ocultar f="axisctr009" c="NCASO_BPM" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="NCASO_BPM" lit="9906097" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NSOLICI_BPM" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="NSOLICI_BPM" lit="9906098" /></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr009" c="NCASO_BPM" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <input type="text" class="campowidthinput campo campotexto" id="NCASO_BPM" name="NCASO_BPM" size="10"
                                        value="${casos_bpm.NCASO_BPM}" readonly="true" />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr009" c="NSOLICI_BPM" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <input type="text" class="campowidthinput campo campotexto" id="NSOLICI_BPM" name="NSOLICI_BPM" size="10"
                                        value="${casos_bpm.NSOLICI_BPM}" readonly="true" />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            <!-- BFP -->
                            <axis:ocultar f="axisctr009" c="CMONPROD" dejarHueco="false">
                                <!-- Moneda -->
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr009" c="CMONPROD" lit="9903008" /></b>
                                </td>
                            </axis:ocultar>
                            <!-- BFP -->
                            <axis:ocultar f="axisctr009" c="CPROMOTOR" dejarHueco="false">
                            <!-- Promotor -->
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr009" c="CPROMOTOR" lit="151522" /></b>
                            </td>
                            </axis:ocultar>
                            </tr>
                            <tr>
                            <!-- BFP -->
                            <axis:ocultar f="axisctr009" c="CMONPROD" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                       <input type="text" class="campowidthinput campo campotexto" id="CMONPROD" name="CMONPROD" size="15" style="width:95%"
                                          value="${CMONPRODINT} - ${TMONPROD}" readonly="true" />
                                </td>
                            </axis:ocultar>
                            <!-- BFP -->
                            <axis:ocultar f="axisctr009" c="CPROMOTOR" dejarHueco="false">
                            <td class="campocaja" colspan="4">
                                   <input type="text" class="campowidthinput campo campotexto" id="TPROMOTOR" name="TPROMOTOR" size="15" style="width:68%"
                                      value="${datos_poliza.axisctr009_promotor}" readonly="true" />
                            </td>
                            </axis:ocultar>
                            </tr>
                        </table>
                    </td> 
                      </tr>                  
                                        
</c:if>
<%-->INI Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos<--%>
<axis:visible c="DOC_REQUERIDA" f="axisctr009">
<c:if test="${ !empty docu_requerida}">
                                        <tr>
                                            <td class="campocaja">
                                                <img src="images/mes.gif" id="DSP_DOCU_REQUERIDA_parent" onclick="objEstilos.toggleDisplay('DSP_DOCU_REQUERIDA', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr009" c="DOCU_REQUERIDA" lit="9901998"/></b> 
                                                <axis:visible c="BT_EDITAR_DOC_REQUERIDA" f="axisctr009">
                                                <div style="float:right;" id="BT_EDITAR_DOC_REQUERIDA" name="BT_EDITAR_DOC_REQUERIDA">
                                                    <axis:visible f="axisctr009" c="BTIMPREDOC">
                                                    <b><font color="red"><axis:alt f="axisctr009" c="MENSAJEDOC" lit="9909028"></axis:alt></font></b>
                                                    <a href="javascript:f_but_docalta()"> <img border="0"
                                                            onclick="javascript:f_but_docalta()"
                                                            alt="<axis:alt f="axisctr009" c="DOCPOL" lit="9002213"/>"
                                                            title="<axis:alt f="axisctr009" c="DOCPOL" lit="9002213"/>"
                                                            src="images/print.gif" /></a>
                                                    </axis:visible>
                                                    <a href="javascript:f_abrir_axisctr173()">
                                                      <img border="0"
                                                      alt="<axis:alt f='axisctr009' c='LIT39' lit='9901998'/>"
                                                      title="<axis:alt f='axisctr009' c='LIT40' lit='9901998'/>"
                                                           src="images/lapiz.gif"/>
                                                    </a>
                                                </div>
                                                </axis:visible>
                                                <hr class="titulo">
                                                
                                                
                                                
                                            </td>
                                        </tr>
                                        <tr id="DSP_DOCU_REQUERIDA_children" style="display:none">
                                            <td align="left">
                                                <div class="displayspace">
                                                 <c:set var="title0"><axis:alt f="axisctr009" c="DESCRIPCION" lit="100588"/></c:set>
                                                 <c:set var="title1"><axis:alt f="axisctr009" c="OBLIGATORIO" lit="112347"/></c:set>
                                                 <c:set var="title2"><axis:alt f="axisctr009" c="ADJUNTADO" lit="9901999"/></c:set>
                                                  <display:table name="${docu_requerida}" id="T_IAX_DOCREQUERIDA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                  requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible c="TDESCRIP" f="axisctr009">
                                                       <display:column title="${title0}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.TDESCRIP}</div>
                                                       </display:column>
                                                      </axis:visible>
                                                       <display:column title="${title1}" sortable="true" sortProperty="T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CCLASE" headerClass="sortable"  media="html" autolink="false" >
                                                           <div class="dspText">
                                                                    <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA}" type="checkbox" 
                                                                    id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                    <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.COBLIGA == 1 }"> checked="checked" </c:if>
                                                                     disabled="disabled" />
                                                                </div>
                                                            
                                                       </display:column>
                                                       <display:column title="${title2}" headerClass="sortable" media="html" autolink="false">
                                                               <div class="dspText">
                                                                    <input value="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO}" type="checkbox" 
                                                                    id="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" name="CDOCUME_${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}" 
                                                                    <c:if test="${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.ADJUNTADO == 1 }"> checked="checked" </c:if>
                                                                    onclick="f_onclickCDOCUMCheck(this, '${T_IAX_DOCREQUERIDA.OB_IAX_DOCREQUERIDA.CDOCUME}')" disabled="disabled" />
                                                                </div>
                                                       </display:column>                                                    
                                                  </display:table>
                                               </div>
                                            </td>
                                        </tr>
</c:if>
</axis:visible>
<%-->FIN  Bug: 18351 LCOL003 - Documentación requerida en contratación y suplementos <--%>
<c:if test="${! empty datos_poliza}">
                  <axis:visible f="axisctr009" c="DSP_DATOSGESTION">
                    <tr>
                        <td class="campocaja">
                            <img src="images/mes.gif" id="DSP_DATOSGESTION_parent" onclick="objEstilos.toggleDisplay('DSP_DATOSGESTION', this)" style="cursor:pointer"/> 
                            <b><axis:alt f="axisctr009" c="DATOSGESTION" lit="140502" /></b>&nbsp; ${datos_poliza.TTIPCOB}&nbsp;<c:if test="${datos_poliza.CTIPCOB}=='2'"><c:if test="${!empty datos_poliza.CBANCAR}">&nbsp;-&nbsp;<axis:masc f="axisctr009" c="CBANCAR" value="${datos_poliza.CBANCAR}" /></c:if></c:if><c:if test="${!empty datos_poliza.TFORPAG}" > &nbsp;-&nbsp;<axis:alt f="axisctr009" c="FCARTERA" lit="100712" />&nbsp;${datos_poliza.TFORPAG }</c:if> 
                            <hr class="titulo">
                        </td>
                    </tr>
                    <!-- DATOS GESTION CHILDREN  **********************************************  -->
                    <tr id="DSP_DATOSGESTION_children" style="display:none">
                   <td align="left">
                         <table class="area" align="center">
                             <tr>
                             	  <!-- bug 20761 -->
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            
                            <tr>                        
                                <!-- FECHA EFECTO -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TIPCOBRO" lit="151348" /></b>
                                </td>
                                <!--FECHA EMISION -->
                                <c:if test="${datos_poliza.CTIPCOB}=='2'">
                                    <axis:ocultar f="axisctr009" c="FECEMISIO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="FECEMISIO" lit="100965" /></b>
                                    </td>
                                    </axis:ocultar>
                                    <!--F cartera proxima -->
                                    <axis:ocultar f="axisctr009" c="FCARTERA" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="FCARTERA" lit="100712" /></b>
                                    </td>
                                    </axis:ocultar>
                                </c:if>
                                <axis:ocultar f="axisctr009" c="CRECFRA" dejarHueco="false">
                                <!--recarrec fraccionament -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="CRECFRA" lit="1000483" /></b>
                                </td>
                                </axis:ocultar>                                  
                                
                                <!--cuotas tarjeta bug 20761 -->
                                <c:if test="${datos_poliza.CTIPCOB}=='2'">
                                    <axis:ocultar f="axisctr009" c="NCUOTAR" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="label_NCUOTAR"><axis:alt f="axisctr009" c="NCUOTAR" lit="9901245" /></b>
                                    </td>
                                    </axis:ocultar>                                  
                                </c:if>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TTIPCOB" name="TTIPCOB" size="15"
                                    value="${datos_poliza.TTIPCOB}" readonly="true"/>
                                </td>
                                <c:if test="${datos_poliza.CTIPCOB}=='2'">
                                        <td class="campocaja">
                                            <input type="text"  class="campowidthinput campo campotexto" id="CBANCAR" name="CBANCAR" size="15"
                                            <c:choose>
                                                <c:when test="${!empty datos_poliza.CBANCAR_FORMATEADO}">value="<axis:masc f="axisctr009" c="CBANCAR" value="${datos_poliza.CBANCAR_FORMATEADO}" />"</c:when>
                                                <c:otherwise>value="<axis:masc f="axisctr009" c="CBANCAR" value="${datos_poliza.CBANCAR}" />"</c:otherwise>
                                            </c:choose>
                                            readonly="true"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TFORPAG" name="TFORPAG" size="15"
                                            value="${datos_poliza.TFORPAG}"  readonly="true"/>
                                        </td>                                         
                                </c:if>
                                
                                
                               <!--<axis:ocultar f="axisctr009" c="CBANCAR">
                               <td class="campocaja">
                                    <input type="text"  class="campowidthinput campo campotexto" id="CBANCAR" name="CBANCAR" size="15"
                                    <c:choose>
                                        <c:when test="${!empty datos_poliza.CBANCAR_FORMATEADO}">value="<axis:masc f="axisctr009" c="CBANCAR" value="${datos_poliza.CBANCAR_FORMATEADO}" />"</c:when>
                                        <c:otherwise>value="<axis:masc f="axisctr009" c="CBANCAR" value="${datos_poliza.CBANCAR}" />"</c:otherwise>
                                    </c:choose>
                                    readonly="true"/>
                                </td>
                                </axis:ocultar>
				<axis:ocultar f="axisctr009" c="CFORPAG">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TFORPAG" name="TFORPAG" size="15"
                                    value="${datos_poliza.TFORPAG}"  readonly="true"/>
                                </td> 
				</axis:ocultar>-->
                                 <axis:ocultar f="axisctr009" c="CRECFRA">
                                  <td class="campocaja">
                                    <input  <c:if test="${datos_poliza.CRECFRA == '1'}">checked="true"</c:if>  
                                    type="checkbox" disabled id="CRECFRA" name="CRECFRA" value="${datos_poliza.CRECFRA}"/>
                                  </td>
                                </axis:ocultar>                                
                                 <!--bug 20761 -->
                                 <c:if test="${datos_poliza.CTIPCOB}=='2'">
                                     <axis:ocultar f="axisctr009" c="NCUOTAR">                                 
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" id="NCUOTAR" name="NCUOTAR" size="15"
                                        value="${datos_poliza.NCUOTAR}" readonly="true"/>
                                     </td>                                
                                    </axis:ocultar> 
                                </c:if>
                                 <!--bug 20761 -->
                                 <axis:ocultar f="axisctr009" c="TARJETA">                                 
                                 <td class="campocaja">
                                    <input type="hidden" class="campowidthinput campo campotexto" id="TARJETA" name="TARJETA" size="15"
                                    value="${datos_poliza.TARJETA}" readonly="true"/>
                                 </td>                                
                                </axis:ocultar>  
                            </tr>
                            <tr>
                                 <axis:visible f="axisctr009" c="TDURPER">
                                    <!-- Periodo de revisión -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="TDURPER" lit="1000558" /></b>
                                    </td>
                                 </axis:visible>
                                 <axis:visible f="axisctr009" c="PCAPFALL">
                                    <!-- Pct. Fallecimiento -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="PCAPFALL" lit="1000547" /></b>
                                    </td>
                                 </axis:visible>
                                 <axis:visible f="axisctr009" c="PDOSCAB">
                                    <!-- Pct. Reversión -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="PDOSCAB" lit="1000548" /></b>
                                    </td>
                                 </axis:visible>
                                 <axis:visible f="axisctr009" c="TFORPAGREN">
                                    <!-- Forma pago renta -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr009" c="TFORPAGREN" lit="1000180" /></b>
                                    </td>
                                 </axis:visible>
                                    </tr>
                                    <tr>
                                    <axis:visible f="axisctr009" c="TDURPER">
                                     <!-- Periodo de revisión -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="NDURPER" name="NDURPER" size="15"
                                            value="${datos_poliza.NDURPER}"  readonly="true"/>
                                        </td>  
                                    </axis:visible>
                                    <axis:visible f="axisctr009" c="PCAPFALL">
                                        <!-- Pct. Fallecimiento -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PCAPFALL " name="PCAPFALL " size="15"
                                            value="${datos_poliza.PCAPFALL}" readonly="true" />
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr009" c="PDOSCAB">
                                        <!-- Pct. Reversión -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PDOSCAB " name="PDOSCAB " size="15"
                                            value="${datos_poliza.PDOSCAB }" readonly="true" />
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr009" c="TFORPAGREN">
                                        <!-- Forma pago renta -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TFORPAGREN " name="TFORPAGREN " size="15"
                                            value="${datos_poliza.TFORPAGREN }" readonly="true" />
                                        </td>
                                    </axis:visible>
                                    </tr>
                                    
                                    <tr>
                                    <axis:visible f="axisctr009" c="FREVISIO">
                                       <!-- Fecha de revisión -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr009" c="DATAREV" lit="105403" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr009" c="NDURPRO">
                                          <!-- Duración próxima -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr009" c="NDURPRO" lit="1000549" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr009" c="INTPRO">
                                          <!--	Interés próximo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr009" c="INTPRO" lit="1000550" /></b>
                                        </td>
                                    </axis:visible>
                                    
                                     <axis:visible f="axisctr009" c="CMONPOL">
                                          <!--	Inter?s pr?ximo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr009" c="CMONPOL" lit="108645"/></b>
                                        </td>
                                    </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisctr009" c="FREVISIO">
                                     <!-- Fecha de revisión -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="FREVISIO " name="FREVISIO " size="15"
                                            value="<fmt:formatDate value="${datos_poliza.FREVISIO}" pattern="dd/MM/yyyy"/>"  readonly="true"/>
                                        </td>  
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="NDURPRO">
                                        <!-- Duración próxima -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="NDURPRO" name="NDURACI" size="15"
                                            value="${datos_poliza.NDURPRO}" readonly="true" />
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="INTPRO">
                                        <!--	Interés próximo -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="INTPRO" name="IPROX" size="15"
                                            value="${datos_poliza.INTPRO}" readonly="true" />
                                        </td>
                                        </axis:visible>
                                        
                                         <axis:visible f="axisctr009" c="CMONPOL">
                                        <!--	Moneda -->
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="TMONPOL" name="TMONPOL" size="15"
                                            value="${datos_poliza.TMONPOL}" readonly="true" />
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisctr009" c="CFOLNUM">
                                            <td class="titulocaja">
                                                <b id="label_CFOLNUM"><axis:alt f="axisctr009" c="CFOLNUM" lit="9906602" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr009" c="CFECMAN">
                                            <td class="titulocaja">
                                                <b id="label_CFECMAN"><axis:alt f="axisctr009" c="CFECMAN" lit="9906603" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr009" c="CSUCURSAL">
                                            <td class="titulocaja">
                                                <b id="label_CSUCURSAL"><axis:alt f="axisctr009" c="CSUCURSAL" lit="9002202" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr009" c="FFINVIG">
                                            <td class="titulocaja">
                                                <b id="label_FFINVIG"><axis:alt f="axisctr009" c="FFINVIG" lit="9905543" /></b>
                                            </td>
                                        </axis:visible>
                                   </tr>
                                    <tr>
                                        <axis:visible f="axisctr009" c="CFOLNUM">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CFOLNUM" name="CFOLNUM" size="15"
                                                value="${datos_poliza.CFOLNUM}" readonly="true" />
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="CFECMAN">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CFECMAN" name="CFECMAN" size="15"
                                                value="<fmt:formatDate value="${datos_poliza.CFECMAN}" pattern="dd/MM/yyyy"/>" readonly="true" />
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="CSUCURSAL">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CSUCURSAL" name="CSUCURSAL" size="15"
                                                value="${datos_poliza.CSUCURSAL}" readonly="true" />
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr009" c="FFINVIG">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINVIG" name="FFINVIG" size="15"
                                                value="<fmt:formatDate value="${datos_poliza.FFINVIG}" pattern="dd/MM/yyyy"/>" readonly="true" />
                                            </td>
                                        </axis:visible>
                                </tr>
                        </table>
                    </td> 
                </tr>     
                </axis:visible>
</c:if>
    <!-- Datos de Convenio -->     
    <axis:visible c="DSP_DATOSCONVENIO" f="axisctr009">
        <c:if test="${!empty datosconvenio}">
            <tr>
                <td class="campocaja">
                    <div style="float:left;">
                    <img src="images/mes.gif" id="DSP_DATOSCONVENIO_parent" onclick="objEstilos.toggleDisplay('DSP_DATOSCONVENIO', this)" style="cursor:pointer"/> 
                    <b><axis:alt f="axisctr009" c="DATOSCONVENIO" lit="9907598" /></b> 
                    </div>
                    <axis:visible f="${pantalla}" c="LAPIZ1" >
                        <div style="float:right;" id="DATOSCONVENIO" c="LAPIZ1"></div>
                    </axis:visible>
                    <div class="seccion_suplementos" id="SECCION_DATOSCONVENIO"></div>
                    <div style="clear:both;">
                    <hr class="titulo">
                    </div> 
                </td>
            </tr>  
            
            <tr id="DSP_DATOSCONVENIO_children" style="display:none">
                <td align="left" >
                        
                     <table class="area" align="center">
                         <tr>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                        </tr>
                         <tr>
                         
                            <!-- Identificador de Convenio -->
                            <axis:visible f="${pantalla}" c="IDCONV"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="IDCONV" lit="9907600" /></b> 
                                </td>
                            </axis:visible>
                                                    
                            <!-- Código de Convenio -->
                            <axis:visible f="${pantalla}" c="TCODCONV" >
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TCODCONV" lit="9907599" /></b>
                                </td>
                            </axis:visible>
                            
                            <!-- Descripcion de Convenio -->
                            <axis:visible f="${pantalla}" c="TDESCRI" >
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="TDESCRI" lit="9907603" /></b>
                                </td>
                            </axis:visible>
                            
                            <!-- Número de Versión -->
                            <axis:visible f="${pantalla}" c="NVERSION" >
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr009" c="NVERSION" lit="9907601" /></b>
                                </td>
                            </axis:visible>                
                            
                        </tr>
                        <tr>
                        
                            <!-- Identificador de Convenio -->
                            <axis:visible f="${pantalla}" c="IDCONV" > 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="IDCONV" name="IDCONV" size="15"
                                     value="${datosconvenio.IDCONV}"  readonly="true"/>
                                </td>
                            </axis:visible>
                        
                            <!-- Código de Convenio -->
                            <axis:visible f="${pantalla}" c="TCODCONV" >
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TCODCONV" name="TCODCONV" size="15"
                                    value="${datosconvenio.TCODCONV}"  readonly="true"/>
                                </td>  
                            </axis:visible>  
                            
                            <!-- Descripcion de Convenio -->
                            <axis:visible f="${pantalla}" c="TDESCRI" >
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TDESCRI" name="TDESCRI" size="15"
                                     value="${datosconvenio.TDESCRI}"  readonly="true"/>
                                </td>
                            </axis:visible>        
                            
                            <!-- Número de Versión -->
                            <axis:visible f="${pantalla}" c="NVERSION" >
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="NVERSION" name="NVERSION" size="15"
                                     value="${datosconvenio.NVERSION}"  readonly="true"/>
                                </td>
                            </axis:visible>
                            
                        </tr>
                    </table>

                    <div class="separador">&nbsp;</div>
                </td> 
            </tr>   
            
        </c:if>
    </axis:visible>

<axis:visible c="DSP_COASEGURO" f="axisctr009">
<c:if test="${! empty datos_poliza}">
        <tr>
            <td class="campocaja">
                <img src="images/mes.gif" id="DSP_COASEGURO_parent" onclick="objEstilos.toggleDisplay('DSP_COASEGURO', this)" style="cursor:pointer"/> 
                <b><axis:alt f="axisctr009" c="COASEGURO" lit="105387" /></b> 
                <hr class="titulo">
            </td>
        </tr>
        <tr id="DSP_COASEGURO_children" style="display:none">
            <td align="left" >
                <table class="area" align="center">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <axis:ocultar f="axisctr009" c="CTIPCOA" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_CTIPCOA"><axis:alt f="axisctr009" c="label_CTIPCOA" lit="105387"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisctr009" c="label_PLOCCOA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA != 0}">
                            <td class="titulocaja">
                                <b id="label_PLOCCOA"><axis:alt f="axisctr009" c="label_PLOCCOA" lit="9904141"/></b>
                            </td>
                            </c:if>
                        </axis:ocultar>
                        <axis:ocultar f="axisctr009" c="SCIACOA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                            <td class="titulocaja">
                                <b id="label_SCIACOA"><axis:alt f="axisctr009" c="label_SCIACOA" lit="9904142"/></b>
                            </td>
                            </c:if>
                        </axis:ocultar>
                        <axis:ocultar f="axisctr009" c="NPOLCIA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                            <td class="titulocaja">
                                <b id="label_NPOLCIA"><axis:alt f="axisctr009" c="label_NPOLCIA" lit="9904143"/></b>
                            </td>
                            </c:if>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar f="axisctr009" c="CTIPCOA" dejarHueco="false">
                            <td class="campocaja">
                               <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="TTIPCOA" name="TTIPCOA"  title="<axis:alt f="axisctr009" c="label_TTIPCOA" lit="105387"/>"
                                        size="15"  value ="${datos_poliza.TTIPCOA}"  <axis:atr f="axisctr009" c="TTIPCOA" a="modificable=false&obligatorio=false"/>/>
                            </td>
                        </axis:ocultar>
                        <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 Start  -->
                        <axis:ocultar f="axisctr009" c="PLOCCOA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA != 0}">
                            <td class="campocaja">
                                <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="PLOCCOA" name="PLOCCOA"  title="<axis:alt f="axisctr009" c="label_PLOCCOA" lit="9904141"/>"
                                        size="15"   value="<fmt:formatNumber pattern="###,####0.0000" value="${DATCOASEGURO.PLOCCOA}"/>" <axis:atr f="axisctr009"  c="PLOCCOA" a="modificable=false&obligatorio=false&formato=entero"/>/>
                        	</td>
                            </c:if>
                        </axis:ocultar>
                        <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 End  -->
                        <axis:ocultar f="axisctr009" c="SCIACOA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                            <td class="campocaja">
                                <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="SCIACOA" name="SCIACOA"  title="<axis:alt f="axisctr009" c="label_SCIACOA" lit="9904142"/>"
                                        size="15"  value ="${DATCOASEGURO.TCOMPAN}"  <axis:atr f="axisctr009" c="SCIACOA" a="modificable=false&obligatorio=false"/>/>
                            </td>
                            </c:if>
                        </axis:ocultar>
                        <axis:ocultar f="axisctr009" c="NPOLCIA" dejarHueco="false">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                            <td class="campocaja">
                                <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="NPOLCIA2" name="NPOLCIA2" title="<axis:alt f="axisctr009" c="label_NPOLCIA" lit="9904143"/>" alt="<axis:alt f="axisctr009" c="label_NPOLCIA" lit="9904143"/>"    
                                        size="15"  value ="${DATCOASEGURO.NPOLIZA}" <axis:atr f="axisctr009" c="NPOLCIA2" a="obligatorio=false&modificable=false"/>/>&nbsp;
                            </td>
                            </c:if>
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                            <axis:visible f="axisctr020" c="ENDOSO">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                                    <td class="titulocaja"><b id="label_ENDOSO"><axis:alt
                                                            f="axisctr004" c="label_ENDOSO" lit="9905423" /></b>
                                    
                                    </td>
                            </c:if>					
                            </axis:visible>
                            
                    </tr>
                            
                     <tr>
                            
                            <axis:visible f="axisctr020" c="ENDOSO">
                            <c:if test="${datos_poliza.CTIPCOA == 8}">
                                    <td class="campocaja"><input type="text"
                                            style="width: 100%"
                                            title="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
                                            alt="<axis:alt f="axisctr004" c="ENDOSO" lit="9904143"/>"
                                            class="campowidthinput campo campotexto" id="ENDOSO"
                                            name="ENDOSO" size="15"
                                            value="${DATCOASEGURO.ENDOSO}"
                                            <axis:atr f="axisctr020" c="NPOLCIA2" a="obligatorio=false&modificable=false"/> />&nbsp;
                                    </td>
                            </c:if>	
                            </axis:visible>
                     </tr>
                    
                    <c:if test="${datos_poliza.CTIPCOA == 1}">
                    <tr>
                        <td class="titulocaja" >
                            <div class="separador">&nbsp;</div>
                            <b id="label_TABLACOA"><axis:alt f="axisctr004" c="label_TABLACOA" lit="9002270"/></b>
                        </td> 
                    </tr>
                    <tr>
                        <td align="left" colspan="3" >
                                <div class="displayspace"  >
                                                     <c:set var="title1"><b><axis:alt f="axisctr004" c="label_TCOMPANI" lit="9000600"/></b> </c:set>
                                                     <c:set var="title2"><b><axis:alt f="axisctr004" c="label_PCESCOA" lit="104818"/></b> </c:set>
                                                     <c:set var="title3"><b><axis:alt f="axisctr004" c="label_PCOMCON" lit="9001923"/></b> </c:set>
                                                     <c:set var="title4"><b><axis:alt f="axisctr004" c="label_PCOMGAS" lit="9902215"/> </c:set>
                                                     <c:set var="title5"><b><axis:alt f="axisctr004" c="label_PCOMCOA" lit="9904150"/> </c:set>
                                                     <display:table name="${DATCOASEGURO.COACEDIDO}"  id="coa" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisctr020.do?paginar=true&tabla=tomador"> 
                                                       <%@ include file="../include/displaytag.jsp"%>
                                                       <axis:visible f="axisctr009" c="TCOMPAN"> 
                                                        <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:45%" media="html" autolink="false" >
                                                           <div class="dspText">${coa.OB_IAX_COACEDIDO.TCOMPAN}</div>
                                                        </display:column>
                                                       </axis:visible>
                                                     <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 Start  -->
                                                       <axis:visible f="axisctr009" c="PCESCOA"> 
                                                        <display:column title="${title2}" sortable="false" sortProperty="PCESCOA" headerClass="headwidth5 sortable"  style="width:12%" media="html" autolink="false" >
                                                           <div class="dspNumber"><fmt:formatNumber pattern="###,##0.0000" value="${coa.OB_IAX_COACEDIDO.PCESCOA}"/></div>
                                                        </display:column>
                                                       </axis:visible>
                                                     <!--  Added for value for 4 decimal places in IAXIS-4202 HB-16/06/2019 End  -->
                                                       <axis:visible f="axisctr009" c="PCOMCON">
                                                        <display:column title="${title3}" sortable="false" sortProperty="PCOMCON" headerClass="headwidth5 sortable"  style="width:12%" media="html" autolink="false" >
                                                           <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${coa.OB_IAX_COACEDIDO.PCOMCON}"/></div>
                                                        </display:column>
                                                       </axis:visible>
                                                       <axis:visible f="axisctr009" c="PCOMGAS">
                                                        <display:column title="${title4}" sortable="false" sortProperty="PCOMGAS" headerClass="headwidth5 sortable"  style="width:12%" media="html" autolink="false" >
                                                           <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${coa.OB_IAX_COACEDIDO.PCOMGAS}"/></div>
                                                        </display:column>
                                                       </axis:visible>
                                                       <axis:visible f="axisctr009" c="PCOMCOA">
                                                        <display:column title="${title5}" sortable="false" sortProperty="PCOMCOA" headerClass="headwidth5 sortable"  style="width:19%" media="html" autolink="false"  >    
                                                            <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value="${coa.OB_IAX_COACEDIDO.PCOMCOA}"/></div>
                                                        </display:column>  
                                                       </axis:visible> 
                                                    </display:table>
                                        </div>
                                        <div class="separador">&nbsp;</div>
                                    </td>
                                </tr>
                                </c:if>
                </table>
            </td> 
        </tr>
</c:if>
</axis:visible>

<c:import url="axisctr009_a1.jsp"/>
