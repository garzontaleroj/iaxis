<%/*
*  Fichero: axisctr030.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 28/02/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


             <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    	<c:if test="${!empty __formdata.OB_IAX_GARANTIAS.IFRANQU && __formdata.OB_IAX_GARANTIAS.IFRANQU > 0}">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="IMG_TITULO_GO" lit="9904188"/> </div>
                        <!--campos-->
                        <table class="seccion">
                           <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>  
                                <th style="width:20%;height:0px"></th> 
                            </tr>
                            <tr>
                                <td align="left" colspan="5">
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr030" c="IFRANQU" dejarHueco="false">
                                                <td class="campocaja titulocampo">
                                                    <b id="label_IFRANQU"><axis:alt f="axisctr030" c="IFRANQU" lit="9001215"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                         
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr030" c="IFRANQU" dejarHueco="false">
                                                <td class="campocaja">
                                                      <input type="text" class="campowidthinput campo campotexto" size="15"  readonly="true"
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${__formdata.OB_IAX_GARANTIAS.IFRANQU}'/>" name="IFRANQU" id="IFRANQU"
                                                 title="<axis:alt f="axisctr030" c="IFRANQU" lit="9001215"/>"
                                                <axis:atr f="axisage006" c="IFRANQU" /> />
                                                </td>
                                            </axis:ocultar>
                                          
                                        </tr>
                                    </table>
                                    </td>
                                    </tr>
                                    </table>
                                  </c:if>
                                    
                                     <axis:visible f="axisctr030" c="DSP_TOT_FRANQUICIAS">
                                 <c:if test="${!empty __formdata.franq ||  !empty __formdata.bonusmalus ||  !empty __formdata.bonusmaluslibres || !empty __formdata.franqtecnicas|| !empty __formdata.franqtecnicaslibres||!empty __formdata.franqlibres}">
                                    <table class="seccion">
                                 
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left">
                                                   <table  >
                                                    <tr>
                                                            <td>
                                                              <div class="separador">&nbsp;</div>
               
                                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="TIT_FRANQ" lit="9001800" /></div>
                                                                <div class="separador">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                            
                                                     <c:if test="${!empty __formdata.franq || !empty __formdata.franqlibres}">
                                                        <axis:visible f="axisctr030" c="DSP_FRANQUICIAS">
                                                         <tr>
                                                            <td>
                                                             
                                                               <c:set var="title0"><axis:alt f="axisctr030" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr030" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                                
                                                              <c:if test="${!empty __formdata.franq}">
                                                                            <display:table name="${__formdata.franq}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="axis_${pantalla}.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr030" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr030" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                            </c:if>
                                                                            <c:if test="${!empty __formdata.franqlibres}">
                                                                            
<div id="DSP_FRANQUICIASLIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                              <c:set var="title3"><axis:alt f="axisctr013" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>
                                                                                              <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                              <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                              <b class="titulocaja"><axis:alt f="axisctr013" c="FRAQNQLIBRES" lit="9904502"></axis:alt></b>
                                                                                          <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                          <display:table name="${__formdata.franqlibres}" id="franquiciaslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                          requestURI="modal_axisctr013.do?paginar=true">
                                                                                             <%@ include file="../include/displaytag.jsp"%>
                                                                                             <axis:visible f="axisctr013" c="TGRUP">
                                                                                                 <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">${franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="CVALOR1">
                                                                                                 <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">
                                                                                                                <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 4}">
                                                                                                                    ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} -
                                                                                                                   <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                                 </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                  <axis:visible f="axisctr013" c="CVALOR2">
                                                                                                  <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                                <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} -
                                                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                                  <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                                        ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                  </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                                  <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="franquiciaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                      <div class="dspText">
                                                                                                           <c:if test="${!empty franquiciaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                                 ${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                                 
                                                                                                            </c:if>
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                             </axis:visible>     
                                                                                         </display:table>
                                                                                         </div>                                                                            
                                                                            </c:if>
                                                                         
                                                                         
                                                                         </td>
                                                                    </tr>
                                                                    </axis:visible>
                                                        </c:if>
                                                        
                                                         <c:if test="${!empty __formdata.franqtecnicas || !empty __formdata.franqtecnicaslibres }">
                                                            <axis:visible f="axisctr030" c="DSP_FRANQTECNICAS"> 
                                                         <tr>
                                                            <td class="titulocaja">
                                                              <div class="separador">&nbsp;</div>
                                                            <b class="titulocaja"><axis:alt c="LIT_FRANQTECNICAS" f="axisctr030" lit="9904198"/></b>
                                                               
                                                                <div class="separador">&nbsp;</div>
                                                               <c:set var="title0"><axis:alt f="axisctr030" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr030" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                                
                                                         <c:if test="${!empty __formdata.franqtecnicas}">     
                                                                            <display:table name="${__formdata.franqtecnicas}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="axis_${pantalla}.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr030" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr030" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </c:if>
                                                                                  <c:if test="${!empty __formdata.franqtecnicaslibres}">
                                                                                        <div id="DSP_FRANQUICIASTECNICASLIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                          <c:set var="title3"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
                                                                                          <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                          <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                     <b class="titulocaja"><axis:alt f="axisctr013" c="FRAQNQTECNICASLIBRES" lit="9904501"></axis:alt></b>
                                                                                         
                                                                                              <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                          <display:table name="${__formdata.franqtecnicaslibres}" id="franquiciastecnicaslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                          requestURI="modal_axisctr013.do?paginar=true">
                                                                                             <%@ include file="../include/displaytag.jsp"%>
                                                                                             <axis:visible f="axisctr013" c="TGRUP">
                                                                                                 <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     <div class="dspText">${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                                 </display:column>
                                                                                             </axis:visible>
                                                                                             <axis:visible f="axisctr013" c="CVALOR1">
                                                                                                 <display:column title="${title1}"  sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspText">
                                                                                                      
                                                                                                         
                                                                                                                <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 4}">
                                                                                                                        ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                            
                                                                                                                </c:if>
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CVALOR2">
                                                                                                  <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                      
                                                                                                                <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                                  ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                                </c:if>
                                                                                                     
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                                  <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                      
                                                                                                           <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                                ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                            </c:if>
                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                        </axis:visible>
                                                                                                 <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                                  <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                                     
                                                                                                      <div class="dspIcons">
                                                                                                           <c:if test="${!empty franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                                ${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${franquiciastecnicaslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                            </c:if>                                                                                                          
                                                                                                     </div>
                                                                                                 </display:column>
                                                                                                 
                                                                                             </axis:visible>     
                                                                                             
                                                                                         </display:table>
                                                                                         </div>
                                                                                                 </c:if>
                                                                         </td>
                                                                    </tr>
                                                                    </axis:visible>
                                                        </c:if>
                                                        </table>
                                                    
                                                    </c:if>
                                                    
                                                      
                                                           <axis:visible f="axisctr030" c="DSP_BONUSMALUS"> 
                                                           
                                                           
                                                           
                                                             <c:if test="${!empty __formdata.bonusmalus || !empty __formdata.bonusmaluslibres}">
                                    <table class="seccion">
                                 
                                    <!-- Campos -->
                                    <div class="separador">&nbsp;</div>        
                                        <tr>
                                            <td align="left">
                                                   <table  >
                                                    <tr>
                                                            <td>
                                          
                                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr030" c="TIT_BONUSMALUS" lit="9001799" /></div>
                                                                <div class="separador">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                            <td class="titulocaja">
                                                              <div class="separador">&nbsp;</div>
                                 <div class="separador">&nbsp;</div>
                                                                                <c:set var="title0"><axis:alt f="axisctr030" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                                                                <c:set var="title1"><axis:alt f="axisctr030" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                                                                
                                                         <c:if test="${!empty __formdata.bonusmalus}">     
                                                                            <display:table name="${__formdata.bonusmalus}" id="franquicias" style="width:60%" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="axis_${pantalla}.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr030" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr030" c="TNIVEL">
                                                                                         <display:column title="${title1}" sortable="false" sortProperty="franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                                ${franquicias.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TNIVEL}
                                                                                                
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </c:if>
                                                                            <c:if test="${!empty __formdata.bonusmaluslibres}">
                                                                                <div id="DSP_BONUMASNULIBRES" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                                                  <c:set var="title3"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
                                                                                  <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                                                  <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                                                <b  class="titulocaja"> <axis:alt f="axisctr013" c="BONUMASNULIBRES" lit="9904503"></axis:alt></b>
                                                                                 
                                                                                      <div id="Dt_FRANQUICIAS" class="displayspace">
                                                                                  <display:table name="${__formdata.bonusmaluslibres}" id="bonumaluslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                  requestURI="modal_axisctr013.do?paginar=true">
                                                                                     <%@ include file="../include/displaytag.jsp"%>
                                                                                     <axis:visible f="axisctr013" c="TGRUP">
                                                                                         <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             <div class="dspText">${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                                                         </display:column>
                                                                                     </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CVALOR1">
                                                                                         <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspText">
                                                                                              
                                                                                                 
                                                                                                        <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 4}">
                                                                                                          ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR1} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>
                                                                                                    </c:if>
                                                                                                    
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CVALOR2">
                                                                                          <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                        <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                                                          ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TVALOR2} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>
                                                                                                    </c:if>
                                                                                            
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CIMPMIN">
                                                                                          <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                   <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                                                         ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMIN} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>
                                                                                                    </c:if>
                                                                                             </div>
                                                                                         </display:column>
                                                                                         </axis:visible>
                                                                                     <axis:visible f="axisctr013" c="CIMPMAX">
                                                                                          <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                                                             
                                                                                              <div class="dspIcons">
                                                                                              
                                                                                                  
                                                                                                   <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                                                        ${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.TIMPMAX} - <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>
                                                                                                    </c:if>
                                                                                                  
                                                                                             </div>
                                                                                         </display:column>
                                                                                         
                                                                                         
                                                                                     </axis:visible>     
                                                                                     
                                                                                 </display:table>
                                                                                 </div>
                                                                                 </c:if>                                                                                    
                                                                         </td>
                                                                    </tr>
                                                               </c:if>   
                                                               </axis:visible>
                                                        
                                                   
                                                    
                                                  
                                                    </axis:visible>
                                            </td>
                                        </tr>
                                        
                                       
                                    </table>
