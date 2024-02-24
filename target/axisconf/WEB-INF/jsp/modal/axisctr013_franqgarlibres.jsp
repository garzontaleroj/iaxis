<%/*
*  Fichero: axisctr013.jsp
*
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 19/11/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

                                      <c:set var="title1"><axis:alt f="axisctr013" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                     <c:if test="${!empty __formdata.franqgarlibres}">
                                      <table class="area" align="center">
                                     <tr>
                                            <th style="width:90%;height:0px"></th>
                                        </tr>
                                        <tr>
                                        <td class="titulocaja">
                                                <div id="DSP_franquiciasgarlibres" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                                  <c:set var="title3"><axis:alt f="axisctr013" c="IMPVALOR2" lit="101159"></axis:alt>2</c:set>
                                                  <c:set var="title4"><axis:alt f="axisctr013" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                                  <c:set var="title5"><axis:alt f="axisctr013" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                                  <b><axis:alt f="axisctr013" c="FRAQNQLIBRES" lit="9904502"></axis:alt></b>
                                              <div id="Dt_FRANQUICIAS" class="displayspace">
                                              
                                              
                                              <display:table name="${__formdata.franqgarlibres}" id="franquiciasgarlibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                              requestURI="axis_${pantalla}.do?paginar=true">
                                                 <%@ include file="../include/displaytag.jsp"%>
                                                 <axis:visible f="axisctr013" c="TGRUP">
                                                     <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         <div class="dspText">${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                     </display:column>
                                                 </axis:visible>
                                                 <axis:visible f="axisctr013" c="CVALOR1">
                                                     <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspText">
                                                          
                                                                    <c:if test="${!empty franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 4}">
                                                                         <select onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','',this.value,'','','','','','');"  
                                                                         <axis:atr f="axisctr013" c="CVALOR1" a="modificable=true&isInputText=false"/> 
                                                                         name = "CVALOR1_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CVALOR1_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                          title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                          <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr013" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                            <c:forEach items="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR1}" var="respuesta">
                                                                                <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                            </c:forEach>
                                                                         </select>
                                                                        
                                                                        <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR1_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                        onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                        title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                        <axis:atr f="axisctr013" c="IMPVALOR1" a="modificable=true"/>    style="width:30%"
                                                                        value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
                                                                        size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     </c:if>
                                                                
                                                         </div>
                                                     </display:column>
                                                     </axis:visible>
                                                      <axis:visible f="axisctr013" c="CVALOR2">
                                                      <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                                    <c:if test="${!empty franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                      <select onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"  <axis:atr f="axisctr013" c="CVALOR2" a="modificable=true&isInputText=false"/> name = "CVALOR2_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CVALOR2_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title3}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr013" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR2_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR2_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                    title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title3}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr013" c="IMPVALOR" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>"
                                                                      size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                     
                                                                     
                                                                </c:if>
                                                         
                                                              
                                                         </div>
                                                     </display:column>
                                                     </axis:visible>
                                                     <axis:visible f="axisctr013" c="CIMPMIN">
                                                      <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                               <c:if test="${!empty franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                     <select onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"  <axis:atr f="axisctr013" c="CVALOR2" a="modificable=true&isInputText=false"/> name = "CIMPMIN_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CIMPMIN_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title4}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr013" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPMIN_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPMIN_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                    title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title4}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr013" c="IMPMIN" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>"
                                                                      size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                </c:if>
                                                              
                                                         </div>
                                                     </display:column>
                                                      </axis:visible>
                                                     <axis:visible f="axisctr013" c="CIMPMAX">
                                                      <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                              
                                                               <c:if test="${!empty franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                     <select onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}',this.value,'${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','');"  <axis:atr f="axisctr013" c="CIMPMAX" a="modificable=true&isInputText=false"/> name = "CIMPMAX_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CIMPMAX_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title5}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr013" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPMAX_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPMAX_${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq('${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}',this.value);"
                                                                    title="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title5}" <c:if test="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr013" c="IMPMIN" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${franquiciasgarlibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>"
                                                                    size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                </c:if>
                                                              
                                                         </div>
                                                     </display:column>
                                                     
                                                 </axis:visible>     
                                                 
                                             </display:table>
                                             </div>
                                             </c:if>
