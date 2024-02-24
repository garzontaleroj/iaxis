<p>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
</p>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="pantalla" value="axisctr120"/>
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
<!-- FIN SECCION CAPITALES ASEGURADOS / CAPITALS ASSEGURATS-->
<c:if test="${!empty T_IAX_GESTRIESGOS}">
    <tr>
        <td class="campocaja">
            <div style="float:left;">
                    <img id="DSP_RIESGOS_parent" src="images/mes.gif" 
		    	onclick="objEstilos.toggleDisplay('DSP_RIESGOS', this)" 
			style="cursor:pointer"/> 
                     <b id="label_DSP_RIESGOS"><axis:alt f="${pantalla}" c="DSP_RIESGOS" lit="102500"></axis:alt></b>
                    </div>                   
                    <div style="clear:both;">
                        <hr class="titulo">
                    </div>                      
                </td>
            </tr>
            <tr id="DSP_RIESGOS_children" style="display:none">           
                <td class="campocaja" > 
                    <axis:ocultar c="DSP_RIESGOSCAB" f="${pantalla}" dejarHueco="false">                    
                    <div class="displayspace">
		    <c:set var="title0"><axis:alt f="${pantalla}" c="NRIESGO" lit="800440"></axis:alt></c:set>  
		    <c:set var="title1"><b id="label_TRIESGO"><axis:alt f="${pantalla}" c="TRIESGO" lit="102500"></b> </axis:alt></c:set>   
		    <c:set var="title2"><axis:alt f="${pantalla}" c="RIE_PRIMATOTAL" lit="140531"></axis:alt></c:set>
		    <c:set var="title3"><axis:alt f="${pantalla}" c="LIT_DETALLE" lit="1000113"></axis:alt></c:set>                    
                    <c:set var="title4"><axis:alt f="${pantalla}" c="RIE_FEFECTO" lit="100883"></axis:alt></c:set>                    
                    <c:set var="title5"><axis:alt f="${pantalla}" c="ITOTANU" lit="9902047"></axis:alt></c:set>
                    <display:table name="${T_IAX_GESTRIESGOS}" 
		    id="T_IAX_GESTRIESGOS" export="false" 
		    class="dsptgtable" pagesize="-1" defaultsort="1" 
		    defaultorder="ascending" sort="list" 
		    cellpadding="0" cellspacing="0"
		    requestURI="axis_${pantalla}.do?paginar=true"> 
		          <%@ include file="../include/displaytag.jsp"%>
                           <display:column title="" sortable="false" sortProperty="" 
			   headerClass="headwidth5 sortable"  
			   media="html" autolink="false" >
			   <div class="dspIcons">
			   <input  <c:if test="${OB_IAX_RIESGOS.NRIESGO == T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO || T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO == __formdata.NRIESGO}">checked</c:if> 
			   onClick="javascript:f_getRiesgo('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" 
                           value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}" 
			   type="radio" id="radioNRIESGO" 
			   name="radioNRIESGO"/>
			   </div>
                           </display:column>
                           <display:column title="${title0}" sortable="true" 
			   sortProperty="NRIESGO" 
			   headerClass="headwidth5 sortable"  
			   media="html" autolink="false" >
			   <div class="dspText">
			   ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}
			   </div>
                           </display:column>
                           <display:column title="${title1}" sortable="true" 
			   sortProperty="TRIESGO" 
			   headerClass="sortable"  media="html" 
			   autolink="false" >
			   <div class="dspText">
			   ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.TRIESGO}
			   </div>
                           </display:column>
                           <axis:visible f="${pantalla}" c="RIE_FEFECTO">
                            <display:column title="${title4}" sortable="true" 
                                sortProperty="FEFECTO"  
                                headerClass="headwidth10 sortable"
                                media="html"
                                autolink="false">
                                <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" 
                                    value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.FEFECTO}"/>
                                </div>
                           </display:column> 
                           </axis:visible>                       
                           <axis:visible f="${pantalla}" c="RIE_PRIMATOTAL">
                           <display:column title="${title2}" sortable="true" 
			   sortProperty="PRIMATOTAL" 
			   headerClass="headwidth10 sortable"  
			   media="html" autolink="false" >
			   <div class="dspNumber">
			   <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" 
			   value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.PRIMATOTAL}"/>
			   </div>
                           </display:column>    
                           </axis:visible>
                           <axis:visible f="${pantalla}" c="RIE_ITOTANU">
                           <display:column title="${title5}" sortable="true" 
			   sortProperty="PRIMATOTAL" 
			   headerClass="headwidth10 sortable"  
			   media="html" autolink="false" >
			   <div class="dspNumber">
			   <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" 
			   value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.ITOTANU}"/>
			   </div>
                           </display:column>
                           </axis:visible>  

                    </display:table>
                    </div>
                    </axis:ocultar>

<axis:visible c="DSP_ASEGURADOS" f="${pantalla}">  

<c:if test="${!empty OB_IAX_RIESGOS.RIESGOASE}">
<div class="separador">&nbsp;</div>
            <table class="area" align="center">
                        <tr>
                            <td class="campocaja">
                              
                                <div style="float:left;">
                                    <img id="PROPIETARIOS_RIESGO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('PROPIETARIOS_RIESGO', this)"
                                         style="cursor:pointer"/>
                                     
                                    <b id="label_DSP_ASEGURADOS"><axis:alt c="DSP_ASEGURADOS" f="${pantalla}" lit="108228"/></b>
                                </div>
       
                                <div style="clear:both;">
                                    <hr class="titulo"></hr>
                                </div>
                            </td>
                        </tr>
                        <tr id="PROPIETARIOS_RIESGO_children"
                            style="display:none">
                            <td class="campocaja">
                                <div class="displayspace">
                                    <c:set var="title0"><axis:alt f="${pantalla}" c="TTIPIDE" lit="109774"></axis:alt></c:set>
                                    <c:set var="title1"><axis:alt f="${pantalla}" c="NNUMIDE" lit="105330"></axis:alt></c:set>
                                    <c:set var="title2"><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940"></axis:alt></c:set>
                                    <c:set var="title3"><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064"></axis:alt></c:set>
                                    <c:set var="title4"><axis:alt f="${pantalla}" c="TSEXPER" lit="100962"></axis:alt></c:set>                                       
                                    <c:set var="title5"><axis:alt f="${pantalla}" c="FFECFIN" lit="9001510"></axis:alt></c:set> 
                                    <c:set var="title6"><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064"></axis:alt></c:set> 
                                    <c:set var="title7"><axis:alt f="${pantalla}" c="FECRETROACT" lit="9903825"></axis:alt></c:set> 
                                    <display:table name="${OB_IAX_RIESGOS.RIESGOASE}"
                                                   id="PROPIETARIO"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_${pantalla}.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" 
                                                        style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html" 
                                                        autolink="false">
                                             <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TTIPIDE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.NNUMIDE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">                                            
                                            <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.NNUMIDE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" 
                                                        style="width:35%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TNOMBRE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">                                            
                                            <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TNOMBRE} 
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI1} 
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI2} 
                                            </div>
                                        </display:column>   
                                          <display:column title="${title6}" 
                                            style="width:10%"
                                            sortable="true"
                                            sortProperty="OB_IAX_ASEGURADOS.FNACIMI"
                                            headerClass="headwidth5 sortable"
                                            media="html"
                                            autolink="false">
                                            <div class="dspText">
					    <fmt:formatDate pattern="dd/MM/yyyy" 
					    value="${PROPIETARIO.OB_IAX_ASEGURADOS.FNACIMI}"/>
                                            </div>
                                        </display:column> 
                                      <display:column title="${title4}" 
                                                        style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TSEXPER"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">                                            
                                            <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TSEXPER} 
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.FFECFIN"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">                                            
                                            <div class="dspText">
					    <fmt:formatDate pattern="dd/MM/yyyy" 
					    value="${PROPIETARIO.OB_IAX_ASEGURADOS.FFECFIN}"/>
                                            </div>
                                        </display:column> 
                                       <display:column title="${title7}" 
                                            style="width:10%"
                                            sortable="true"
                                            sortProperty="OB_IAX_ASEGURADOS.FECRETROACT"
                                            headerClass="headwidth5 sortable"
                                            media="html"
                                            autolink="false">
                                            <div class="dspText">
					    <fmt:formatDate pattern="dd/MM/yyyy" 
					    value="${PROPIETARIO.OB_IAX_ASEGURADOS.FECRETROACT}"/>
                                            </div>
                                        </display:column>      
                                        <axis:visible f="axisctr120" c="BT_CON_FIND_ASE"> 
                                            <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                </div>
                                            </display:column>  
                                        </axis:visible>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                        </table>
                    </c:if>
         </axis:visible>         

<div class="separador">&nbsp;</div>
           <table class="area" align="center">
                  
                        <table class="area" align="center">
                        	<axis:visible c="DSP_GARANTIAS" f="${pantalla}">  
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_GARANTIAS_parent" 
					src="images/mes.gif" 
					onclick="objEstilos.toggleDisplay('DSP_GARANTIAS', this)" 
					style="cursor:pointer"/> 
                                       <b><axis:alt f="${pantalla}" c="DSP_GARANTIAS" 
				       lit="1000183"></axis:alt></b>
                                    </div>
                                     <axis:visible c="IMPDETALLE" f="${pantalla}">
                                     <div style="float:right;" id="IMPDETALLE">
                                          </div> </axis:visible>
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                             </tr>
                         
                             <tr id="DSP_GARANTIAS_children" style="display:none">
                                <td class="campocaja" >
                                                            
				<c:set var="title0">
                                 <axis:alt f="${pantalla}" c="CGARANT" lit="1000109"></axis:alt>                                        
				</c:set>
				<c:set var="title1">
                                 <axis:alt f="${pantalla}" c="TGARANT" lit="100588"></axis:alt> 
				</c:set>
				<c:set var="title2">
                                    <axis:alt f="${pantalla}" c="GAR_ICAPITAL" lit="1000073"></axis:alt> 				
				</c:set>
				<c:set var="title3">
                                    <axis:alt f="${pantalla}" c="GAR_IPRITOT" lit="1000497"></axis:alt>    
				</c:set>
				<c:set var="title4">                                
                                    <axis:alt f="${pantalla}" c="DETGARANT" lit="1000113"></axis:alt> 				
				</c:set>
                             <c:set var="title5">
                                <axis:alt f="${pantalla}" c="NDETGAR" lit="9001755"></axis:alt>                                 
                            </c:set>
                            <c:set var="title6">
                                <axis:alt f="${pantalla}" c="FEFECTO" lit="100883"></axis:alt>                                 
                            </c:set>
                             <c:set var="title7">
                                <axis:alt f="${pantalla}" c="TESTADO" lit="100587"></axis:alt>                                 
                            </c:set>
                            <c:set var="title8">
                                <axis:alt f="${pantalla}" c="NDURCOB" lit="9000814"></axis:alt>                                 
                            </c:set>
                            <c:set var="title9">
                                <axis:alt f="${pantalla}" c="CUNICA" lit="9001984"></axis:alt>                                 
                            </c:set>
                            <c:set var="title10">
                                <axis:alt f="${pantalla}" c="ITOTANU" lit="9902047"></axis:alt>                                 
                            </c:set>
                            <c:set var="title11"><axis:alt f="axisctr031" c="CMONCAP" lit="108645"/></c:set>
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                </tr>   
                           
                            <axis:visible f="${pantalla}" c="AREA_REVALI" >
                                <c:if test="${!empty datos_poliza.TREVALI && !empty datos_poliza.CREVALI}">
                                        <tr>
                                            <axis:ocultar f="${pantalla}"
                                                          c="TREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b>
                                                    <axis:alt f="${pantalla}" c="label_trevali" lit="101432"></axis:alt> 
                                                    </b>
                                                </td>
                                            </axis:ocultar>
                                            <c:if test="${datos_poliza.CREVALI != 1}">
                                            <axis:ocultar f="${pantalla}"
                                                          c="PREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_PREVALI">
                                                    <axis:alt f="${pantalla}" c="label_PREVALI" lit="9001317"></axis:alt> 
                                                    </b>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            <c:if test="${datos_poliza.CREVALI == 1}">
                                            <axis:ocultar f="${pantalla}"
                                                          c="IREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_IREVALI">
                                                    <axis:alt f="${pantalla}" c="label_IREVALI" lit="9001316"></axis:alt>
                                                    </b>
                                                </td>
                                            </axis:ocultar>     
                                            </c:if>                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="${pantalla}"
                                                          c="TREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="hidden"
                                                           id="CREVALI"
                                                           name="CREVALI"
                                                           value="${datos_poliza.CREVALI}"
                                                           <axis:atr f="${pantalla}" c="CREVALI" a="modificable=false&isInputText=false"/>/>
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="TREVALI"
                                                           name="TREVALI"
                                                           size="15"
                                                           value="${datos_poliza.TREVALI}"
                                                           <axis:atr f="${pantalla}" c="TREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            <c:if test="${datos_poliza.CREVALI != 1}">
                                            <axis:ocultar f="${pantalla}"
                                                          c="PREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="PREVALI"
                                                           name="PREVALI"
                                                           size="15"
                                                           value="${datos_poliza.PREVALI} %"
                                                           <axis:atr f="${pantalla}" c="PREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            <c:if test="${datos_poliza.CREVALI == 1}">
                                            <axis:ocultar f="${pantalla}"
                                                          c="IREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="IREVALI"
                                                           name="IREVALI"
                                                           size="15"
                                                           value="<fmt:formatNumber value="${datos_poliza.IREVALI}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/>"
                                                           <axis:atr f="${pantalla}" c="IREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            
                                        </tr>
                                    </c:if>
                            </axis:visible>      
                             <axis:visible f="${pantalla}" c="TMODALIDAD" >
                            <c:if test="${!empty TMODALIDAD}">
                                <tr>
                                    <td class="titulocaja">
                                            <b id="label_CMODALI"><axis:alt f="axisctr207" c="TMODALIDAD" lit="100943" /></b>
                                    </td>
                                </tr>
                                <tr>
                                      <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" id="TMODALIDAD" name="TMODALIDAD" size="15"
                                    value="${TMODALIDAD}" readonly="true"/>
                                </td>
                                </tr>
                             </c:if>
                             </axis:visible>
                <% if (garantias_entrada!= null && garantias_entrada.size()>0){ %>  
                              <tr>
                                <% for (int j=0;j<garantias_entrada.size();j=j+2){ %>
                                    <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_0">CGARANT_<%=((HashMap)garantias_entrada.get(j)).get("CGARANT")%></c:set>
                                    <%}%>
                                     <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_1">CGARANT_<%=((HashMap)garantias_entrada.get(j+1)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <axis:ocultar c="${CGARANT_0}" f="${pantalla}" dejarHueco="false">                                 
                                    <td>
                                          <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <c:set var="CGARANT_0DESC"><%=((HashMap)garantias_entrada.get(j)).get("TGARANT")%></c:set>
                                            <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
					    <td class="titulocaja" >
					    <b><axis:alt f="${pantalla}" c="${CGARANT_0}" lit="${CGARANT_0DESC}"></axis:alt></b>
					    </td>
                                            </tr>
                                            </table>
                                          <% } %>
                                    </td>
                                    </axis:ocultar>                                
                                    <axis:ocultar c="${CGARANT_1}" f="${pantalla}" dejarHueco="false">
                                    <td>
                                         <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <c:set var="CGARANT_1DESC"><%=((HashMap)garantias_entrada.get(j+1)).get("TGARANT")%></c:set>
                                              <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
					      <td class="titulocaja">
					      <b><axis:alt f="${pantalla}" c="${CGARANT_1}" lit="${CGARANT_1DESC}"></axis:alt></b>
					      </td>
                                             </tr>
                                            </table>
                                        <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                <axis:ocultar c="${CGARANT_0}" f="${pantalla}" dejarHueco="false">
                                    <td>
                                      <% if( j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="${pantalla}" c="${CGARANT_0}" a="modificable=true"/> class="campowidthinput campo campotexto"  readonly id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%>  title="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_entrada.get(j)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar c="${CGARANT_1}" f="${pantalla}" dejarHueco="false">
                                    <td>
                                    <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" readonly name="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="${pantalla}" c="${CGARANT_1}" a="modificable=true"/> class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j+1)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%>  title="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_entrada.get(j+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <% } %>  
                      <%}%>                        
                      </table> 
                      <c:if test="${!empty sessionScope.garantiasGeneral}">
                              <axis:ocultar f="axisctr120" c="GARANTIAS">
                        
                                
					 <c:if test="${! empty sessionScope.garantiasGeneral}">
                        <div class="displayspace" >
                                	 <table class="seccion" cellpadding="0" cellspacing="0" align="left" style="width:98%" id="miListaIdGarantias">
                                      <thead>
                                            <tr>
                                              <c:forEach items="${sessionScope.garantiasGeneral}" var="miListaIdGarantias" varStatus="yy"> 
                                                  <c:set var = "NDET">${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}</c:set>
                                             </c:forEach>
                                            <axis:visible f="${pantalla}" c="CGARANT">
                                                <th style="width:6%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="TGARANT">
                                                <th style="width:40%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_ICAPITAL">    
                                                <th style="width:10%;height:0px"></th>
                                             </axis:visible>  
                                              <%--axis:visible f="axisctr120" c="CAPRECOMEND"> 
                                                <th style="width:10%;height:0px"></th>
                                              </axis:visible--%>
                                            <axis:visible f="${pantalla}" c="CMONCAP">
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            <c:if test="${!empty NDET}">
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                                  <th style="width:10%;height:0px"></th>
                                            </c:if>  
                                            <axis:visible f="${pantalla}" c="DETGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                        </tr>
                                        <tr>   
                                            <axis:visible f="${pantalla}" c="CGARANT">
                                                <td class="sortable"><b>${title0}</b></td>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="TGARANT">
                                                <td class="sortable"><b>${title1}</b></td>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_ICAPITAL">
                                                <td class="sortable"><b>${title2}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="CMONCAP">
                                                <td class="sortable"><b>${title11}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                <td class="sortable"><b>${title3}</b></td>                                        
                                            </axis:visible>
                                               <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                <td class="sortable"><b>${title10}</b></td>                                        
                                            </axis:visible>
                                            <c:if test="${!empty NDET}">
                                                 <td class="sortable"><b>${title7}</b></td>    
                                                 <td class="sortable"><b>${title5}</b></td>    
                                                 <td class="sortable"><b>${title6}</b></td>    
                                                 <td class="sortable"><b>${title8}</b></td>    
                                                 <td class="sortable"><b>${title9}</b></td>    
                                            </c:if>                 
                                            <axis:visible f="${pantalla}" c="DETGARANT">
                                                  <td class="sortable"><b>${title4}</b></td>                                        
                                            </axis:visible>
                                        </tr>   
                                        </thead>
                                           <tbody >
                                               <c:forEach items="${sessionScope.garantiasGeneral}" var="miListaIdGarantias" varStatus="x"> 
                                                 <tr  tipo="ri" id="g_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}-${miListaIdGarantias.OB_IAX_GARANTIAS.TGARANT}"
                                                    <c:if test="${x.count mod 2 ==0}">                                                                      
                                                        class="gridEven"                                                        
                                                    </c:if>
                                                    <c:if test="${x.count mod 2 !=0}">                                                                      
                                                        class="gridNotEven"                                                        
                                                    </c:if>
                                                   >
                                                
                                                    <axis:visible f="${pantalla}" c="CGARANT">
                                                            <td class="dspNumber" nowrap>   
                                                             <div class="dspNumber">
                                                             <c:choose>
                                                                  <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                       
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                  </c:otherwise>
                                                                  </c:choose>
                                                               ${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}</div>
                                                               
                                                            </td>
                                                      </axis:visible>
                                                      <axis:visible f="${pantalla}" c="TGARANT">
                                                            <td class="dspText">   
                                                                <div class="dspText">
                                                                ${miListaIdGarantias.OB_IAX_GARANTIAS.TGARANT}</div>
                                                            </td>
                                                      </axis:visible>
                                                      <axis:visible f="axisctr120" c="GAR_ICAPITAL">
                                                            <td class="dspNumber">   
                                                                <div class="dspNumber">
                                                                   <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"
                                                                                  pattern="${__formatNumberPatterns[miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT]}"/>
                                                                    <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE  && miListaIdGarantias.OB_IAX_GARANTIAS.CDETALLE == 1 && fn:length(miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE) > 0}">
                                                                    </c:if>      
                                                                </div>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisctr120" c="CMONCAP">
                                                                <td class="dspText">   
                                                                    <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                                      ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                                     </div>
                                                                </td>
                                                        </axis:visible>
                                                        <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                            <td class="dspNumber">  
                                                                <div class="dspNumber">
                                                                  <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.PRIMAS.IPRITOT}"
                                                                     pattern="${__formatNumberPatterns[miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT]}"/>
                                                                </div>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                            <td class="dspNumber">  
                                                                <div class="dspNumber">
                                                                    <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.PRIMAS.ITOTANU}"
                                                              pattern="${__formatNumberPatterns[miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT]}"/>
                                                                </div>
                                                            </td>
                                                        </axis:visible>
                                                               
                                                        <c:if test="${!empty NDETGAR}">
                                                             <td class="dspText">  
                                                                    <div class="dspText">
                                                                        ${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.TESTADO} 
                                                                    </div>
                                                                </td>
                                                            
                                                             <td class="dspText">  
                                                                    <div class="dspText">
                                                                        ${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDETGAR} 
                                                                    </div>
                                                                </td>
                                                                
                                                                   <td class="dspText">  
                                                                    <div class="dspDate">
                                                                        ><fmt:formatDate value="${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.FEFECTO}" pattern="dd/MM/yyyy"/>
                                                                    </div>
                                                                </td>
                                                                
                                                                  <td class="dspNumber">  
                                                                    <div class="dspNumber">
                                                                        ${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDURCOB} 
                                                                    </div>
                                                                </td>
                                                                
                                                                <td class="dspText">  
                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.CUNICA == 0}">
                                                                    <div class="dspText"> <axis:alt f="${pantalla}" c="LIT_NO" lit="101779"></axis:alt></div>
                                                                   </c:if>
                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.CUNICA != 0}">
                                                                    <div class="dspText"> <axis:alt f="${pantalla}" c="LIT_SI" lit="101778"></axis:alt> </div>
                                                                   </c:if>
                                                                </td>
                                                            </c:if>                 
                                                                
                                                            <axis:visible f="${pantalla}" c="DETGARANT">
                                                                     <td class="dspText">  
                                                                             <div class="dspIcons">
                                                                            </div>
                                                                      </td>
                                                            </axis:visible>
                                                                   
                                                        </tr>
                                                        <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                <c:set scope="session" var="hijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                                                                    <c:import url="axisctr120_hijos.jsp">
                                                                        <c:param name="thijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}" />
                                                                            <c:param name="ppartidas" value="0" />
                                                                        <c:param name="CGARANTPADRE" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" />
                                                                    </c:import>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                </div>
                            </c:if>
                        </axis:ocultar>
                    </c:if>
           <% if (garantias_salida!= null && garantias_salida.size()>0){ %>    
              <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                    <th style="width:25%;height:0px">
                                        &nbsp;
                                    </th>
                                </tr>
                                <% for (int h=0;h<garantias_salida.size();h=h+3 ){ %>
                                    <% if(h < garantias_entrada.size() &&((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_2">CGARANT_<%=((HashMap)garantias_salida.get(h)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <% if(h+1 < garantias_entrada.size() &&((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_3">CGARANT_<%=((HashMap)garantias_salida.get(h)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <% if(h+2 < garantias_entrada.size() &&((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_4">CGARANT_<%=((HashMap)garantias_salida.get(h)).get("CGARANT")%></c:set>
                                    <%}%>

                                    <tr>
                                        <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_2}">
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h)).get("TGARANT") %></b></td>
                                            </axis:visible>
                                        <% } %> 
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="{CGARANT_3}">
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+1)).get("TGARANT") %></b></td>
                                            </axis:visible>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="{CGARANT_4}">
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+2)).get("TGARANT") %></b></td>
                                            </axis:visible>
                                        <% } %> 
                                        <axis:ocultar f="${pantalla}"
                                                          c="PERIODICITAT"
                                                          dejarHueco="false">
                                                <td class="titulocaja">
                                                     <b id="label_IREVALI"><axis:alt f="${pantalla}" c="label_IREVALI1" lit="9001838"></axis:alt></b>
                                                </td>
                                        </axis:ocultar>   
                                   </tr>
                                   <tr>
                                        <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_2}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" readonly
                                                    formato="decimal" title="" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </axis:visible>
                                          
                                        <% } %> 
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_3}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" readonly
                                                    formato="decimal"  title="" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </axis:visible>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_4}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" readonly
                                                    formato="decimal" title="" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h+2)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </axis:visible>
                                        <% } %> 
                                        <axis:ocultar f="${pantalla}"
                                                          c="PERIODICITAT"
                                                          dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="PERIODICITAT"
                                                           name="PERIODICITAT"
                                                           size="15"
                                                           value="${datos_poliza.TFORPAGREN}"
                                                           <axis:atr f="${pantalla}" c="PERIODICITAT"/>
                                                           readonly/>
                                                </td>
                                        </axis:ocultar>
                                   </tr>
                                <% } %>
                            </table>
                            <%}%>   
                           </axis:visible> 
    <axis:visible f="${pantalla}" c="MESESEXTRA">
        <c:if test="${!empty datos_poliza.NMESEXTRA}">
        <table  cellpadding="0" cellspacing="5" class="seccion">      
        <tr><td>
                  &nbsp;
            </td>
            <td class="titulocaja">
                  &nbsp;&nbsp;<u><b><axis:alt f="${pantalla}" c="MESESEXTRA" lit="9000670"></axis:alt>
                  </b></u>
            </td>
        </tr>
        <tr><td>
                &nbsp;
            </td>
            <td align="left" class="titulocaja">   
            <div class="separador">&nbsp;</div>
             <table class="seccion" style="width:75%;" >
                <tr>
                  <th style="width:20%;height:0%;"/>   
                  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                  <th style="width:20%;height:0%;"/>
                </tr>
                <tr class="gridNotEven">
                <td> 
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_ENE" lit="9000674"></axis:alt> </td>
                     <td> <input type="text"   class="campowidthinput campo campotexto" id="IMP_CPAGA1" name="IMP_CPAGA1" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES1}'/>" />
                     </td>
                     <td>  <input type="checkbox" name="CPAGA1" id="CPAGA1"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES1 == 1}"> checked</c:if>
                          <axis:atr f="${pantalla}" c="OB_IAX_PRODFORPAGREN.COBLIGA" a="modificable=false"/> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                <td>   
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_ABR" lit="9000677"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA4" name="IMP_CPAGA4" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES4}'/>" />
                     </td>
                     <td>  
                            <input type="checkbox" name="CPAGA4" id="CPAGA4"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES4 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_JUL" lit="9000680"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA7" name="IMP_CPAGA7" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES7}'/>" />
                     </td>
                     <td> 
                            <input type="checkbox" name="CPAGA7" id="CPAGA7"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES7 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> 
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_OCT" lit="9000683"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA10" name="IMP_CPAGA10" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES10}'/>" />
                     </td>
                     <td> 
                            <input type="checkbox" name="CPAGA10" id="CPAGA10"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES10 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>

                <tr class="gridEven">
                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_FEB" lit="9000675"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA2" name="IMP_CPAGA2" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES2}'/>" />
                     </td>
                     <td>
                        <input type="checkbox" name="CPAGA2" id="CPAGA2"
                         <c:if test="${datos_poliza.NMESEXTRA.NMES2 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
            
                <td> 
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_MAY" lit="9000678"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA5" name="IMP_CPAGA5" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES5}'/>" />
                     </td>
                     <td> 
                        <input type="checkbox" name="CPAG5" id="CPAGA5"
                        <c:if test="${datos_poliza.NMESEXTRA.NMES5 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_AGO" lit="9000681"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA8" name="IMP_CPAGA8" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES8}'/>" />
                     </td>
                     <td>
                          <input type="checkbox" name="CPAGA8" id="CPAGA8"
                           <c:if test="${datos_poliza.NMESEXTRA.NMES8 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_NOV" lit="9000684"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA11" name="IMP_CPAGA11" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES11}'/>" />
                     </td> 
                     <td> 
                          <input type="checkbox" name="CPAGA11" id="CPAGA11"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES11 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>
                
                <tr class="gridNotEven">
                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_MAR" lit="9000676"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA3" name="IMP_CPAGA3" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES3}'/>" />
                     </td> 
                     <td> 
                          <input type="checkbox" name="CPAGA3" id="CPAGA3"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES3 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td>
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_JUN" lit="9000679"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA6" name="IMP_CPAGA6" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES6}'/>" />
                     </td> 
                     <td> 
                          <input type="checkbox" name="CPAGA6" id="CPAGA6"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES6 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> 
                  <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_SEP" lit="9000682"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA9" name="IMP_CPAGA9" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES9}'/>" />
                     </td> 
                     <td>
                          <input type="checkbox" name="CPAGA9" id="CPAGA9"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES9 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                 <td>
                 <table>
                    <tr>
                      <th style="width:50%;height:0%;"/>   
                      <th style="width:20%;height:0%;"/>
                      <th style="width:20%;height:0%;"/>
                    </tr>
                    <tr>
                     <td> <axis:alt f="${pantalla}" c="LIT_DIC" lit="9000685"></axis:alt> </td>
                     <td> <input type="text" class="campowidthinput campo campotexto" id="IMP_CPAGA12" name="IMP_CPAGA12" size="7" disabled
                          value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datos_poliza.NMESEXTRA.IMP_NMES12}'/>" />
                     </td> 
                     <td> 
                          <input type="checkbox" name="CPAGA12" id="CPAGA12"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES12 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>
             </table>   
            </td>         
            </TR>
        </table>    
                
      </c:if>
                        </td>
                    </tr>
</TABLE>      
</td>
</tr>
</table>
    </axis:visible>       
    <div class="separador">&nbsp;</div> 

</c:if>
