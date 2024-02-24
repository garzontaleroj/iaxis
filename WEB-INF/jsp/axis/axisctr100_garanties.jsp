<%/**
*  Fichero: axisctr100_body.jsp
*  
*
*  Pantalla de Simulacion de riesgos
*
*  Detalle:	
*  Campos: TNATRIE : Descripción del riesgo naturaleza riegso
*          FEFECTO : Fecha efecto
*          CDURACI : Tipo de duracion
*          NDURACI : Duracion
*          FVENCIM : Fecha vencimiento
*          CFORPAG : Forma de pago
*  xpl
*  Fecha: 20/05/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%
    ArrayList garantias_salida = null;
    if (request.getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getAttribute("garantiasSortida");
    }
    
    ArrayList garantias_entrada = null;
    if (request.getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getAttribute("garantiasEntrada");
    }
    
    
%>

<c:if test="${empty psu_critica }">
<div class="titulo"><img src="images/flecha.gif"/> <b><axis:alt f="axisctr100" c="DSP_GARANTIAS"
                                             lit="1000183"></axis:alt></b></div>
<!--table class="seccion"--> 

<tr>
<td>
<table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr100" c="CFORPAGGAR">
                                        <td class="titulocaja">
                                            <b id="label_CFORPAGGAR"><axis:alt f="axisctr100" c="CFORPAGGAR" lit="100712" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="CREVALI">
                                        <td class="titulocaja">
                                            <b id="label_CREVALI"><axis:alt f="axisctr100" c="CREVALI" lit="101432" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="PREVALI"> 
                                        <td class="titulocaja">
                                            <b id="label_PREVALI"><axis:alt f="axisctr100" c="PREVALI" lit="1000382" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr100" c="CFORPAGGAR">
                                        <td class="campocaja">
                                            <select  name = "CFORPAGGAR" id ="CFORPAGGAR" <axis:atr f="axisctr100" c="CFORPAGGAR" a="modificable=false&isInputText=false"/> size="1"  class="campo campotexto">&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_parametrosGarantias.formaPago}" var="formaPago">
                                                    <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_parametrosGarantias.CFORPAG}">selected</c:if>>${formaPago.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="CREVALI">
                                         <td class="campocaja">
                                            <select style="width:200px;" name = "CREVALI" id ="CREVALI" size="1" <axis:atr f="axisctr100" c="CREVALI" a="modificable=false&isInputText=false"/> 
                                            class="campo campotexto">&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_parametrosGarantias.tipoRevalorizacion}" var="tipoReval">
                                                    <option value = "${tipoReval.CATRIBU}" 
                                                    <c:if test="${sessionScope.axisctr_CREVALI==tipoReval.CATRIBU}">selected</c:if>> ${tipoReval.TATRIBU} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:ocultar f="axisctr100" c="PREVALI">
                                        <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="PREVALI" name="PREVALI"   <axis:atr f="axisctr100" c="PREVALI" a="modificable=false&isInputText=true"/>
                                            formato="decimal"  title="<axis:alt f="axisctr100" c="PREVALI" lit="1000382" />" size="15" value="<fmt:formatNumber pattern='###,##0.00' value='${sessionScope.axisctr_PREVALI}'/>"/>
                                        </td>
                                    </axis:ocultar>
                                    
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                            <hr/>
</td>
</tr>

                    <tr>
                        <td class="campocaja">
                            <c:set var="title0">
                                <axis:alt f="axisctr100" c="CODIGO" lit="1000109"/>
                            </c:set>
                            <c:set var="title1">
                                <axis:alt f="axisctr100" c="DESCRIPCION" lit="100588"/>
                            </c:set>
                            <c:set var="title2">
                                <axis:alt f="axisctr100" c="CAPITAL" lit="1000073"/>
                            </c:set>
                            <c:set var="title3">
                                <axis:alt f="axisctr100" c="PRIMAANUAL" lit="1000497"/>
                            </c:set>
                            <c:set var="title4">
                                <axis:alt f="axisctr100" c="DETALLE" lit="1000113"/>
                            </c:set>
                            
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                              <tr>
                              <% if (garantias_entrada!= null && garantias_entrada.size()>0){ %>

                                <% for (int j=0;j<garantias_entrada.size();j=j+2){ 
                                
                                    if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_0">CGARANT_<%=((HashMap)garantias_entrada.get(j)).get("CGARANT")%></c:set>
                                    <%}%>
                                     <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_1">CGARANT_<%=((HashMap)garantias_entrada.get(j+1)).get("CGARANT")%></c:set>
                                    <%}%>
                                    
                                    <axis:ocultar c="${CGARANT_0}" f="axisctr100" dejarHueco="false">
                                    <td>
                                          <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
                                                <td class="titulocaja" ><b><%= ((HashMap)garantias_entrada.get(j)).get("TGARANT") %></b></td>
                                            </tr>
                                            </table>
                                          <% } %>
                                          
                                    </td>
                                    </axis:ocultar>
                                    
                                    
                                     <axis:ocultar c="${CGARANT_1}" f="axisctr100" dejarHueco="false">
                                    <td>
                                         <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                              <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_entrada.get(j+1)).get("TGARANT") %></b></td>
                                             </tr>
                                            </table>
                                        <% } %>
                                        
                                    </td>
                                    </axis:ocultar>
                                    
                                </tr>
                                <tr>
                                <axis:ocultar c="${CGARANT_0}" f="axisctr100" dejarHueco="false">
                                    <td>
                                   
                                      <% if( j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="axisctr100" c="${CGARANT_0}" a="modificable=false"/>  class="campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" 
                                                formato="decimal"  title="<%= ((HashMap)garantias_entrada.get(j)).get("TGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='<%= ((HashMap)garantias_entrada.get(j)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="${CGARANT_1}" f="axisctr100" dejarHueco="false">
                                    <td>
                                    <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="axisctr100" c="${CGARANT_1}" a="modificable=false"/> class="campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" 
                                                formato="decimal"  title="<%= ((HashMap)garantias_entrada.get(j+1)).get("TGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='<%= ((HashMap)garantias_entrada.get(j+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <% } }%>  
                             </table>
                            <c:if test="${!empty garantiasGeneral}">
                                 <c:set var="title0"><axis:alt f="axisctr100" c="GARGEN_COL00" lit="100559"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr100" c="GARGEN_COL01" lit="1000073"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr100" c="GARGEN_COL02" lit="140531"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr100" c="GARGEN_COL03" lit="102995"/></c:set>
                                <c:set var="title8"><axis:alt f="axisctr100" c="CMONCAP" lit="108645"/></c:set>
                                <c:if test="${empty garantiasGeneral ||  fn:length(garantiasGeneral)== 0}">
                                    <c:set var="num_gar">6</c:set>
                                </c:if>
                                <c:if test="${!empty garantiasGeneral && fn:length(garantiasGeneral) > 0 }">
                                    <c:set var="num_gar">${fn:length(garantiasGeneral)}</c:set>                                 
                                </c:if>                                
                               
                                <div id="DSP_GARANTIAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_gar*20+20+20}"/>px">&nbsp;</div>
                                    <div id="dt_garantias" class="displayspacewomax" style="height:<c:out value="${num_gar*20+20+20}"/>px">   
                                    <display:table name="${garantiasGeneral}"
                                                   id="GARANTIAS" export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_axisctr100.do?paginar=true">
                                        <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <%--<display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons"><input type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${GARANTIAS.OB_IAX_GARANTIAS.CGARANT}" 
                                                    <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked</c:if> 
                                                    /></div>
                                        </display:column>--%>
                                        <axis:ocultar f="axisctr100" c="TGARANT">
                                            <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.TGARANT" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${GARANTIAS.OB_IAX_GARANTIAS.TGARANT}</div>
                                            </display:column>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr100" c="ICAPITAL">
                                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                <c:set var="CAPITAL">
                                                    <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPROD]}" value="${GARANTIAS.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                    </c:if>
                                                </c:set>
                                                <div class="dspIcons">
                                               
                                                <c:choose>
                                                    <c:when test="${GARANTIAS.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                                                        <select id="ICAPITAL" name="ICAPITAL" 
                                                        style="width:120px" class="campo campotexto" />                                                                >
                                                            <c:forEach items="${GARANTIAS.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                                                <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
                                                                   <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.ICAPITAL==null}">
                                                                       <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
                                                                   </c:if>
                                                                   <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.ICAPITAL!=null}">
                                                                        <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == GARANTIAS.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
                                                                   </c:if>>
                                                                   ${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <input type="text" id="ICAPITAL" disabled name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="campo campotexto"
                                                            formato="decimal" title="<axis:alt f="axisctr100" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr100" c="ICAPITAL2" lit="103455"/> ${GARANTIAS.OB_IAX_GARANTIAS.CGARANT}"/>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                        </axis:ocultar>
                                          <axis:visible f="axisctr100" c="CMONCAP">
                                            <display:column media="html" title="${title8}" headerClass="headwidth10 sortable" autolink="false" >
                                                <div class="dspText" title="${GARANTIAS.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                ${GARANTIAS.OB_IAX_GARANTIAS.CMONCAPINT}
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="IPRITAR">
                                            <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRITAR" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPROD]}" value="${GARANTIAS.OB_IAX_GARANTIAS.PRIMAS.IPRITAR}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="IPRIANU">
                                            <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRIANU" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPROD]}" value="${GARANTIAS.OB_IAX_GARANTIAS.PRIMAS.IPRIANU}"/></div>
                                            </display:column>
                                        </axis:visible>                      
                                    </display:table>
                                </div>
                            </c:if>
                            
                            <% if (garantias_salida!= null && garantias_salida.size()>0){ %>
                            
                             <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <% for (int h=0;h<garantias_salida.size();h=h+3 ){ %>
                                 <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                <c:set var="CGARANT_2">CGARANT_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %></c:set>
                                <%}%>
                                <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                <c:set var="CGARANT_3">CGARANT_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %></c:set>
                                <%}%>
                                <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                <c:set var="CGARANT_4">CGARANT_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %></c:set>
                                <%}%>
                                  <tr>
                                        
                                        <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                         <axis:ocultar c="${CGARANT_2}" f="axisctr100" dejarHueco="false">
                                            <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h)).get("TGARANT") %></b></td>
                                         </axis:ocultar>
                                        <% } %> 
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_3}" f="axisctr100" dejarHueco="false">
                                            <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+1)).get("TGARANT") %></b></td>
                                            </axis:ocultar>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_4}" f="axisctr100" dejarHueco="false">
                                            <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+2)).get("TGARANT") %></b></td>
                                            </axis:ocultar>
                                        <% } %> 
                                   </tr>
                                   <tr>
                                        <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                        <axis:ocultar c="${CGARANT_2}" f="axisctr100" dejarHueco="false">
                                            <td class="campocaja">
                                            <input type="text" <axis:atr f="axisctr100" c="${CGARANT_2}" a="modificable=false"/> class="campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" 
                                            formato="decimal" title="" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='<%= ((HashMap)garantias_salida.get(h)).get("ICAPITAL") %>'/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <% } %> 
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                             <axis:ocultar c="${CGARANT_3}" f="axisctr100" dejarHueco="false">
                                            <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" 
                                            formato="decimal" <axis:atr f="axisctr100" c="${CGARANT_3}" a="modificable=false"/> title="" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='<%= ((HashMap)garantias_salida.get(h+1)).get("ICAPITAL") %>'/>"/>
                                            </td>
                                            </axis:ocultar>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                             <axis:ocultar c="${CGARANT_4}" f="axisctr100" dejarHueco="false">
                                            <td class="campocaja">
                                            <input type="text" class="campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" 
                                            formato="decimal" title="" size="15" <axis:atr f="axisctr100" c="${CGARANT_4}" a="modificable=false"/> 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='<%= ((HashMap)garantias_salida.get(h+2)).get("ICAPITAL") %>'/>"/>
                                            </td>
                                            </axis:ocultar>
                                        <% } %> 
                                   </tr>
                                <% } %>
                            </table>
                            <%}%>
							
							</c:if>