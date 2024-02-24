<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr028"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr207"/>
    </c:otherwise>
</c:choose>
    <div class="separador">&nbsp;</div>   
<% pageContext.setAttribute("newLineChar", "\n"); %>
    <div id = "bonusmalusG_hidden" <c:if test="${empty __formdata.bonusmalus && empty __formdata.bonusmaluslibres}">style="visibility:false;display:none"  </c:if>>
                  <div class="titulo">
                    <div style="float:left;">
                     <img src="images/flecha.gif"/>
                    <axis:alt f="axisctr207" c="TIT_FRANQ" lit="9001799" />
                </div>
                <div style="float:right;">
                	   <axis:visible f="axisctr207" c="BT_DETFRANQ" >
               <!-- Bug 0027955/0152240 - JSV (17/09/2013) => Añadimos parametro a  f_abrir_axisctr074 -->
                 <input type="button" class="boton" id="but_detfranq" value="<axis:alt f="axisctr207" c="BT_DETBONUSMALUS" lit="1000113"></axis:alt>" onclick="javascript:f_abrir_axisctr074(1)" />
               </axis:visible>
                 </div>
                </div>
                <!--campos-->
                <axis:visible f="axisctr207" c="DSP_BONUSMALUS"> 
                <div id = "bonusmalus_hidden" <c:if test="${empty __formdata.bonusmalus && empty __formdata.bonusmaluslibres }">style="visibility:false;display:none"  </c:if>>	
                    <table>
                      <tr>
                            <th style="width:60%;height:0px" align="left"> </th>
                            <th style="width:40%;height:0px"></th>
                      </tr>  
                      <tr>
                            <td class="titulocaja">
                           
                             <c:set var="title0"><axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr207" c="IIMPORT" lit="101159"></axis:alt></c:set>
                                <div id="DSP_BONUSMALUS" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                <div id="Dt_BONUSMALUS" class="displayspace">
                                    
                                           <div id = "bonusmalus_area_hidden" <c:if test="${empty __formdata.bonusmalus }">style="visibility:false;display:none"  </c:if>>	
                                             <display:table name="${__formdata.bonusmalus}" id="bonusmalus"   export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                              requestURI="axis_${pantalla}.do?paginar=true">
                                                 <%@ include file="../include/displaytag.jsp"%>
                                                 <axis:visible f="axisctr207" c="TGRUP">
                                                     <display:column title="${title0}" sortable="false" sortProperty="bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                         <div class="dspText">${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                         <input type="hidden" id="${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" value="${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}">
                                                     </display:column>
                                                 </axis:visible>
                                                 <axis:visible f="axisctr207" c="TNIVEL">
                                                     <display:column title="${title1}" sortable="false" sortProperty="bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                         <c:choose>
                                                               <c:when test="${!empty bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 1}">
                                                            
                                                                <select onchange="f_actualizar_franq(1,this.value,'${bonusmalus.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonusmalus.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}');"  <axis:atr f="axisctr207" c="TNIVEL" a="modificable=true&isInputText=false"/> name = "TNIVELDESPESES" id="TNIVELDESPESES"  size="1" style="width:100%" class="campo campotexto"
                                                                 title="${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonusmalus.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if> >
                                                                   <option value="null"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                    <c:forEach items="${bonusmalus.OB_IAX_BF_PROACTGRUP.LNIVELES}" var="respuesta">
                                                                        <option value = "${respuesta.OB_IAX_BF_DETNIVEL.CNIVEL}" <c:if test="${bonusmalus.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL == respuesta.OB_IAX_BF_DETNIVEL.CNIVEL }"> selected </c:if> >  ${respuesta.OB_IAX_BF_DETNIVEL.TNIVEL} </option>
                                                                    </c:forEach>
                                                                </select>
                                                               </c:when>
                                                                   <c:otherwise>
                                                                    <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR_${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR_${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" onchange="f_actualizar_franq(1,'${bonusmalus.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonusmalus.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonusmalus.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value);" 
                                                                    title="${bonusmalus.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonusmalus.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>    style="width:60%" 
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonusmalus.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
                                                                     title="<axis:alt f="axisctr207" c="PREVALI" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                  </c:otherwise>
                                                                  </c:choose>
                                                         </div>
                                                     </display:column>
                                                     
                                                     
                                                 </axis:visible>     
                                                 
                                             </display:table>
                                             </div></div>
                                             
                                             
                                             
                                              <div id = "bonumaluslibres_area_hidden" <c:if test="${empty __formdata.bonusmaluslibres }">style="visibility:false;display:none"  </c:if>>	
                                               <c:set var="title3"><axis:alt f="axisctr207" c="IIMPORT" lit="101159"></axis:alt>2</c:set>
                                              <c:set var="title4"><axis:alt f="axisctr207" c="VALORMIN" lit="9904477"></axis:alt></c:set>
                                              <c:set var="title5"><axis:alt f="axisctr207" c="VALORMAX" lit="9904478"></axis:alt></c:set>
                                            <b> <axis:alt f="axisctr207" c="BONUMASNULIBRES" lit="9904503"></axis:alt></b>
                                             
                                             
                                              <display:table name="${__formdata.bonusmaluslibres}" id="bonumaluslibres"  export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                              requestURI="axis_${pantalla}.do?paginar=true">
                                                 <%@ include file="../include/displaytag.jsp"%>
                                                 <axis:visible f="axisctr207" c="TGRUP">
                                                     <display:column title="${title0}" sortable="false" style="width:15%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         <div class="dspText">${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP}</div>
                                                         <input type="hidden" id="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}">
                                                     </display:column>
                                                 </axis:visible>
                                                 <axis:visible f="axisctr207" c="CVALOR1">
                                                     <display:column title="${title1}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspText">
                                                          
                                                              <c:choose>
                                                                  <c:when test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 1}">
                                                               
                                                                    <select onchange="f_actualizar_franq(2,this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}');"  <axis:atr f="axisctr207" c="TNIVEL" a="modificable=true&isInputText=false"/> name = "TNIVEL" id="TNIVEL"  size="1" style="width:100%" class="campo campotexto"
                                                                     <title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                       <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_DETNIVEL.CNIVEL}" <c:if test="${ bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CNIVEL == respuesta.OB_IAX_BF_DETNIVEL.CNIVEL }"> selected </c:if> >  ${respuesta.OB_IAX_BF_DETNIVEL.TNIVEL} </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:when>
                                                                  <c:when test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 2}">
                                                                    <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value);" 
                                                                    title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>    style="width:60%" 
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
                                                                     title="<axis:alt f="axisctr207" c="IMPVALOR" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                  </c:when> 
                                                                    <c:when test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS && bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.LSUBGRUPOS[0].OB_IAX_BF_GRUPSUBGRUP.CTIPGRUPSUBGRUP == 3}">
                                                                      <select onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','',this.value,'','','','','','');"  <axis:atr f="axisctr207" c="CVALOR1" a="modificable=true&isInputText=false"/> name = "CVALOR1_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CVALOR1_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR1}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                    title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}"/>"
                                                                     title="<axis:alt f="axisctr207" c="IMPVALOR" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                </c:when>
                                                                </c:choose>
                                                              
                                                         </div>
                                                     </display:column>
                                                     </axis:visible>
                                                 <axis:visible f="axisctr207" c="CVALOR2">
                                                      <display:column title="${title3}" sortable="false"  style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                                    <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}">
                                                                      <select onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"  <axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/> name = "CVALOR2_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CVALOR2_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACVALOR2}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2 == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPVALOR2_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPVALOR2_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                    title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPVALOR" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}"/>"
                                                                     title="<axis:alt f="axisctr207" c="IMPVALOR2" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                     
                                                                     
                                                                </c:if>
                                                         
                                                              
                                                         </div>
                                                     </display:column>
                                                     </axis:visible>
                                                 <axis:visible f="axisctr207" c="CIMPMIN">
                                                      <display:column title="${title4}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                               <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}">
                                                                     <select onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"  <axis:atr f="axisctr207" c="CVALOR2" a="modificable=true&isInputText=false"/> name = "CIMPMIN_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CIMPMIN_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMIN}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPMIN_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPMIN_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}');"
                                                                    title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}"/>"
                                                                     title="<axis:alt f="axisctr207" c="IMPMIN" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                </c:if>
                                                              
                                                         </div>
                                                     </display:column>
                                                     </axis:visible>
                                                 <axis:visible f="axisctr207" c="CIMPMAX">
                                                      <display:column title="${title5}" sortable="false" style="width:22%" sortProperty="bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP" headerClass="sortable"  media="html" autolink="false" >
                                                         
                                                          <div class="dspIcons">
                                                          
                                                              
                                                               <c:if test="${!empty bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}">
                                                                     <select onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}',this.value,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}','');"  <axis:atr f="axisctr207" c="CIMPMAX" a="modificable=true&isInputText=false"/> name = "CIMPMAX_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" id="CIMPMAX_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}"  size="1" style="width:60%" class="campo campotexto"
                                                                      <title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA eq 'S'}">obligatorio=true</c:if> >
                                                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr207" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                        <c:forEach items="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.LISTACIMPMAX}" var="respuesta">
                                                                            <option value = "${respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX == respuesta.OB_IAX_BF_LISTLIBRE.CATRIBU }"> selected </c:if> >  ${respuesta.OB_IAX_BF_LISTLIBRE.TATRIBU} </option>
                                                                        </c:forEach>
                                                                     </select>
                                                                     
                                                                      <input type="text" class="campowidthinput campo campotexto" id="IMPMAX_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" name="IMPMAX_${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CGRUP}" 
                                                                    onchange="f_actualizar_franq(2,'${bonumaluslibres.OB_IAX_BF_PROACTGRUP.LNIVELES[0].OB_IAX_BF_DETNIVEL.CNIVEL}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CGRUP}', '${bonumaluslibres.OB_IAX_BF_PROACTGRUP.CSUBGRUPUNIC}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.CVERSION}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR1}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMIN}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.CIMPMAX}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPVALOR2}','${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMIN}',this.value);"
                                                                    title="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.GRUPO.TGRUP} - ${title1}" <c:if test="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.COBLIGA  eq 'S'}">obligatorio=true</c:if>
                                                                    <axis:atr f="axisctr207" c="IMPMIN" a="modificable=true"/>    style="width:30%"
                                                                    value="<fmt:formatNumber pattern="###,##0.00" value="${bonumaluslibres.OB_IAX_BF_PROACTGRUP.FRANQCONTRATADA.IMPMAX}"/>"
                                                                     title="<axis:alt f="axisctr207" c="IMPMAX" lit="1000382" />" size="15" onfocus="javascript:f_on_focus_impvalor(this)" />
                                                                     
                                                                     
                                                                </c:if>
                                                              
                                                         </div>
                                                     </display:column>
                                                     
                                                     
                                                 </axis:visible>     
                                                 
                                             </display:table>
                                             </div>
                                            
                                       
                         </td>
                        </tr>
                    </table>
                    </div>
                </axis:visible>
