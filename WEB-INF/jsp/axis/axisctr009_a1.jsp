<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<axis:visible c="DSP_TOMADOR" f="axisctr009">
<c:if test="${!empty tomadores && fn:length(tomadores)>0}">
        <tr>
            <td class="campocaja">
                <img src="images/mes.gif" id="DSP_TOMADOR_parent" onclick="objEstilos.toggleDisplay('DSP_TOMADOR', this)" style="cursor:pointer"/> 
                <b><axis:alt f="axisctr009" c="TOMADOR" lit="1000380" /></b> <!-- (${fn:length(tomadores)}) - 1. ${tomadores[0].OB_IAX_TOMADORES.TAPELLI1}, ${tomadores[0].OB_IAX_TOMADORES.TNOMBRE} --> ${tomadores[0].OB_IAX_TOMADORES.TTIPIDE} -  ${tomadores[0].OB_IAX_TOMADORES.NNUMIDE} - ${tomadores[0].OB_IAX_TOMADORES.TAPELLI1}, ${tomadores[0].OB_IAX_TOMADORES.TNOMBRE} 
                <hr class="titulo">
            </td>
        </tr>
        <tr id="DSP_TOMADOR_children" style="display:none">
            <td align="left" >
                <div class="displayspace">
                     <c:set var="title0"><axis:alt f="axisctr009" c="TIPODOC" lit="109774" /></c:set>
                     <c:set var="title1"><axis:alt f="axisctr009" c="CODUME" lit="105330" /></c:set>
                     <c:set var="title2"><axis:alt f="axisctr009" c="TNOM" lit="105940" /></c:set>                               
                     <c:set var="title3"><axis:alt f="axisctr009" c="CSEXE" lit="100962" /></c:set>
                     <c:set var="title4"><axis:alt f="axisctr009" c="DNACIMI" lit="1000064" /></c:set>
                     <c:set var="title5"><axis:alt f="axisctr009" c="CDOMICI" lit="101078" /></c:set>
                     <c:set var="title6"><axis:alt f="axisctr009" c="TAGRUPA" lit="111471" /></c:set>
                     <display:table name="${tomadores}" id="tomadores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axisctr009.do?paginar=true&tabla=tomador"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:11%" media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TTIPIDE}</div>
                       </display:column>
                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
                       </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:23%" media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TNOMBRE} ${tomadores.OB_IAX_TOMADORES.TAPELLI1} ${tomadores.OB_IAX_TOMADORES.TAPELLI2}</div>
                       </display:column>
                       <!-- INI CONF-1347_QT_2002 - 11/04/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->
                       <c:if test="${PROPIETARIO.OB_IAX_ASEGURADOS.CTIPPER == 1}"> 
                         <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TOMADORES.TSEXPER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TSEXPER}</div>
                         </display:column>                                   
                         <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                           <div class="dspText"><fmt:formatDate value='${tomadores.OB_IAX_TOMADORES.FNACIMI}' pattern='dd/MM/yyyy'/></div>
                         </display:column>
                       </c:if>
                       <!-- FIN CONF-1347_QT_2002 - 11/04/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->                                                                     
                       <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" style="width:33%" media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}</div>
                       </display:column>
                       <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_TOMADORES.TAGRUPA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspText">${tomadores.OB_IAX_TOMADORES.TAGRUPA}</div>
                       </display:column>                                               
                    </display:table>
                </div>
            </td> 
        </tr>
</c:if>
</axis:visible>

<axis:visible c="DSP_TOT_PREGUNTAS" f="axisctr009">
<c:if test="${!empty T_IAX_PREGUNTAS || !empty pregQuestSalut || !empty pregDespeses}">
            <tr>
                <td class="campocaja" >
                    <div style="float:left;">
                        <img id="DSP_TOT_PREGUNTAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TOT_PREGUNTAS', this)" style="cursor:pointer"/> 
                        <b><axis:alt c="LIT_TOT_PREGUNTAS" f="axisctr020" lit="102299"/></b>
                    </div>
                    <div style="clear:both;">
                        <hr class="titulo">
                    </div>    
               </td>
            </tr>
            <tr id="DSP_TOT_PREGUNTAS_children" style="display:none">
               <td class="campocaja" >
                
                 <c:if test="${!empty T_IAX_PREGUNTAS}">
                    <axis:visible c="DSP_PREGUNTAS" f="axisctr009">
                    <table class="area" align="center">
                <tr>
                <td class="campocaja" >
               </td>
            </tr>
            <tr id="DSP_PREGUNTAS_children">   
                           <td class="campocaja" >
                   <div class="displayspace">
                     <c:set var="title0"><axis:alt f="axisctr009" c="NUM" lit="800440" /></c:set>
                     <c:set var="title1"><axis:alt f="axisctr009" c="PREGUNTA" lit="102738" /></c:set>
                     <c:set var="title2"><axis:alt f="axisctr009" c="RESPOSTAS" lit="103712" /></c:set>
                      <display:table name="${T_IAX_PREGUNTAS}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                      requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                           <%@ include file="../include/displaytag.jsp"%>
                           <axis:visible c="CPREGUN" f="axisctr009">
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                           </display:column>
                           </axis:visible>
                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                           </display:column>
                           <display:column title="${title2}" sortable="false" headerClass="headwidth30 sortable"  media="html" autolink="false" >
                               <div class="dspText">
                                   <c:choose>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                            ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                        </c:when>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                             ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                        </c:when>
                                         <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                         <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
                                            <b style="color:red"><axis:alt f="axisctr004" c="VERDETALLE" lit="9000968"/></b>
                                          </a>
                                         </c:when>
                                       
                                    </c:choose>
                               </div>
                           </display:column>                                                    
                      </display:table>
                   </td>
            </tr>
            </table>
            </axis:visible>
</c:if>

<c:if test="${!empty pregQuestSalut}">
<axis:visible c="DSP_PREGUNTAS_QUESTSALUT" f="axisctr009">
<table class="area" align="center">            
            <tr>
                <td class="campocaja" >
                   <img id="DSP_PREGUNTAS_QUESTSALUT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_QUESTSALUT', this)" style="cursor:pointer"/> 
                   <b><axis:alt c="LIT_PREG_QUESTSALUT" f="axisctr009" lit="103672"/></b>  
                   <hr class="titulo">
               </td>
            </tr>
            <tr id="DSP_PREGUNTAS_QUESTSALUT_children" style="display:none">
               <td class="campocaja" >
                   <div class="displayspace">
                     <c:set var="title0"><axis:alt f="axisctr009" c="NUM" lit="800440" /></c:set>
                     <c:set var="title1"><axis:alt f="axisctr009" c="PREGUNTA" lit="102738" /></c:set>
                     <c:set var="title2"><axis:alt f="axisctr009" c="RESPOSTAS" lit="103712" /></c:set>
                      <display:table name="${pregQuestSalut}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                      requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                           <%@ include file="../include/displaytag.jsp"%>
                           <axis:visible c="CPREGUN" f="axisctr009">
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                           </display:column>
                          </axis:visible>
                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                           </display:column>
                           <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                               <div class="dspText">
                                  <c:choose>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                            ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                        </c:when>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                             ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                        </c:when>
                                         <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                         <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
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

<c:if test="${!empty pregDespeses}">
<axis:visible c="DSP_PREGUNTAS_DESPESES" f="axisctr009">
<table class="area" align="center">
            <tr>
                <td class="campocaja" >
                   <img id="DSP_DSP_PREGUNTAS_DESPESES_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_PREGUNTAS_DESPESES', this)" style="cursor:pointer"/> 
                   <b><axis:alt c="LIT_PREG_DESPESES" f="axisctr009" lit="9001509"/></b>   
                   <hr class="titulo">
               </td>
            </tr>
            <tr id="DSP_PREGUNTAS_DESPESES_children" style="display:none">
               <td class="campocaja" >
                   <div class="displayspace">
                     <c:set var="title0"><axis:alt f="axisctr009" c="NUM" lit="800440" /></c:set>
                     <c:set var="title1"><axis:alt f="axisctr009" c="PREGUNTA" lit="102738" /></c:set>
                     <c:set var="title2"><axis:alt f="axisctr009" c="RESPOSTAS" lit="103712" /></c:set>
                      <display:table name="${pregDespeses}" id="T_IAX_PREGUNTAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                      requestURI="axis_axisctr009.do?paginar=true&tabla=T_IAX_PREGUNTAS">
                           <%@ include file="../include/displaytag.jsp"%>
                           <axis:visible c="CPREGUN" f="axisctr009">
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspNumber">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}</div>
                           </display:column>
                          </axis:visible>
                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PREGUNTAS.TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}</div>
                           </display:column>
                           <display:column title="${title2}" headerClass="headwidth30 sortable" media="html" autolink="false">
                               <div class="dspText">
                                 <c:choose>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE != null}">
                                            ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TRESPUE}
                                        </c:when>
                                        <c:when test="${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE != null}">
                                             ${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CRESPUE}
                                        </c:when>
                                         <c:when test="${!empty T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUNTASTAB}">
                                         <a href="javascript:void(0)" onClick="f_abrir_188('${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.CPREGUN}','${T_IAX_PREGUNTAS.OB_IAX_PREGUNTAS.TPREGUN}','P');"> 
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
<axis:visible c="DSP_CITAMEDICA" f="axisctr009">
<c:if test="${!empty T_IAX_CITAMEDICA && fn:length(T_IAX_CITAMEDICA)>0}">
        <tr>
            <td class="campocaja">
                <img src="images/mes.gif" id="DSP_CITAMEDICA_parent" onclick="objEstilos.toggleDisplay('DSP_CITAMEDICA', this)" style="cursor:pointer"/> 
                <b><axis:alt f="axisctr009" c="CITA" lit="9908315" /></b> 
                <hr class="titulo">
            </td>
        </tr>
        <tr id="DSP_CITAMEDICA_children" style="display:none">
            <td class="campocaja">
            <table class="area" align="center">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 9px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_DSP_BENEIDENT" lit="9908458"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                <div class="displayspace">
		                            <c:set var="title0"><axis:alt f="axisctr009" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
		                            <c:set var="title1"><axis:alt f="axisctr009" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
		                            <c:set var="title2"><axis:alt f="axisctr009" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
		                            <c:set var="title3"><axis:alt f="axisctr009" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                            <c:set var="title4"><axis:alt f="axisctr009" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                            <c:set var="title5"><axis:alt f="axisctr009" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                            <c:set var="title6"><axis:alt f="axisctr009" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                            <c:set var="title7"><axis:alt f="axisctr009" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr009_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                            <div class="separador">&nbsp;</div>
		                            
                                            
		                                <display:table name="${axisctr009_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr009.do">
		                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title3}" sortable="true" sortProperty="NOMMEDI" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMMEDI}</div>
                                                    </c:if>
		                                    </display:column>

		                                      <display:column title="${title4}" sortable="true" sortProperty="TESTADO" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TESTADO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title5}" sortable="true" sortProperty="FEVIDEN" headerClass="sortable"  style="width:10%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.FEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>
 		                                      <display:column title="${title6}" sortable="true" sortProperty="TPAGO" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TPAGO}</div>
                                                      </c:if>
		                                      </display:column>
                                         
		                                      <display:column title="${title7}" sortable="true" sortProperty="IEVIDEN" headerClass="sortable"  style="width:5%;" media="html" autolink="false" >
		                                      <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 0}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.IEVIDEN}</div>
                                                      </c:if>
		                                      </display:column>                                        

                                                        
                                                    </display:table>        
                </div>
                </td>
                </tr>
                <axis:visible c="DSP_CITA_NOMED" f="axisctr009">
                <tr>
                    <td align="left">
                        <div class="titulo" style="margin-left:10px;font-size: 9px;"><img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="TIT_DSP_BENEIDENT" lit="9908459"/>    </div>
                       
                
                            </td>
                </tr>
                <tr>
                    <td>
                       <div class="displayspace">
		                    <c:set var="title0"><axis:alt f="axisctr009" c="CODEVID" lit="9908314"/></c:set><%--Codigo cita medica--%>
                                    <c:set var="title1"><axis:alt f="axisctr009" c="TEVIDEN" lit="9908312"/></c:set><%--Tipo cita medica--%>
                                    <c:set var="title2"><axis:alt f="axisctr009" c="NOMASEG" lit="100645"/></c:set><%--Nombre Asegurado--%>
                                    <c:set var="title3"><axis:alt f="axisctr009" c="NOMMEDI" lit="9908313"/></c:set><%--Nombre medico--%>
                                    <c:set var="title4"><axis:alt f="axisctr009" c="TESTADO" lit="9905523"/></c:set><%--Estado--%>
                                    <c:set var="title5"><axis:alt f="axisctr009" c="FEVIDEN" lit="9908311"/></c:set><%--Fecha cita medica--%>
                                    <c:set var="title6"><axis:alt f="axisctr009" c="CPAGO" lit="9908320"/></c:set><%--Estado--%>
                                    <c:set var="title7"><axis:alt f="axisctr009" c="IEVIDEN" lit="9908321"/></c:set><%--Fecha cita medica--%>            
                                    <c:set var="axisctr009_lista_citasmedicas" value="${__formdata.T_IAX_CITAMEDICA}" />
		                    <div class="separador">&nbsp;</div>
		                                <display:table name="${axisctr009_lista_citasmedicas}" id="miL01" export="false" class="dsptgtable" defaultsort="1" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_axisctr009.do">
		                                    
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
		                                    <display:column title="${title0}" sortable="true" sortProperty="CODEVID" headerClass="sortable" style="width:5%;"  media="html" autolink="false" >
                                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
		                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.CODEVID}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title1}" sortable="true" sortProperty="TEVIDEN" headerClass="sortable" style="width:20%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.TEVIDEN}</div>
                                                    </c:if>
		                                    </display:column>
		                                    <display:column title="${title2}" sortable="true" sortProperty="NOMASEG" headerClass="sortable" style="width:10%;"  media="html" autolink="false" >
		                                    <c:if test="${miL01.OB_IAX_CITAMEDICA.CTIPEVI == 1}">
                                                        <div class="dspText">${miL01.OB_IAX_CITAMEDICA.NOMASEG}</div>
                                                    </c:if>
		                                    </display:column>   
                                                </display:table>
                      </div> 
                  </td>
                </tr>
                </axis:visible>
              </table>
            </td> 

        </tr>
</c:if>
</axis:visible>