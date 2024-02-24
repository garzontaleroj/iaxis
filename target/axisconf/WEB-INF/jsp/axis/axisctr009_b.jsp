<%/* Revision:# ld4MUSWs1POt4+1tpz8JmQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSortida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSortida");
    }
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
%>
<c:choose>
    <c:when test="${empty param.f}">
        <c:set var="formulari" value="axisctr009"/>
    </c:when>
    <c:otherwise>
        <c:set var="formulari" value="${param.f}"/>
    </c:otherwise>
</c:choose>

<c:if test="${!empty T_IAX_GESTRIESGOS}">
            <tr>
                <td class="campocaja" >
                    <img id="DSP_GESTRIESGOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_GESTRIESGOS', this)" style="cursor:pointer"/> 
                     <b><axis:alt f="axisctr009" c="DSP_RIESGOS" lit="102500"></axis:alt></b>
                    <hr class="titulo">
                </td>
            </tr>
            <tr id="DSP_GESTRIESGOS_children"  style="display:none">
                <td class="campocaja" >
				<axis:ocultar c="DSP_RIESGOSCAB" f="axisctr009" dejarHueco="false">
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr009" c="NRIESGO" lit="800440" /></c:set>
						 <c:set var="title1"><axis:alt f="axisctr009" c="TRIESGO" lit="102500"></axis:alt></c:set>
                         <c:set var="title2"><axis:alt f="axisctr009" c="RIE_PRIMATOTAL" lit="140531" /></c:set>
                         <c:set var="title3"><axis:alt f="axisctr009" c="DETALL" lit="1000113" /></c:set>
                         <display:table name="${T_IAX_GESTRIESGOS}" id="T_IAX_GESTRIESGOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre está desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                           <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspIcons"><input  <c:if test="${OB_IAX_RIESGOS.NRIESGO == T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO || T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO == __formdata.NRIESGO}">checked</c:if> onClick="javascript:f_getRiesgo('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" 
                               value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}" type="radio" id="radioNRIESGO" name="radioNRIESGO"/></div>
                           </display:column>
                           <display:column title="${title0}" sortable="true" sortProperty="NRIESGO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}</div>
                           </display:column>
                           <display:column title="${title1}" sortable="true" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.TRIESGO}</div>
                           </display:column>
                           <axis:visible f="axisctr009" c="RIE_PRIMATOTAL">
                           <display:column title="${title2}" sortable="true" sortProperty="PRIMATOTAL" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                               <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.PRIMATOTAL}"/></div>
                           </display:column>
                           </axis:visible>
                           <axis:visible f="axisctr009" c="BUT_DETGARANT">
                           <display:column title="${title3}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr009" c="DETALL_ASSEGUR" lit="1000195"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" 
                                <c:if test="${COBJASE == 1}"> onclick="f_abrir_axisctr029('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" title="<axis:alt f='axisctr009' c='DETALL_ASSEGUR' lit='1000195'/>" </c:if>
                                <c:if test="${COBJASE == 2}"> onclick="f_abrir_riedireccion('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" title="<axis:alt f='axisctr009' c='DETALL_RIESGO' lit='1000199'/>" </c:if>
                                <c:if test="${COBJASE == 3}"> onclick="f_abrir_axisctr043('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" title="<axis:alt f='axisctr009' c='DETALL_RIESGO' lit='1000199'/>" </c:if>
                                <c:if test="${COBJASE == 5}"> onclick="f_abrir_axisctrautos('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" title="<axis:alt f='axisctr009' c='DETALL_RIESGO' lit='1000199'/>" </c:if>/>
                                </div>
                           </display:column>
                           </axis:visible>
			   <!-- INI BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS-->
			   <axis:visible c="BT_DESC_RIE" f="axisctr009">
			      <display:column title="${title4}"
				headerClass="headwidth5 sortable" media="html" autolink="false">
				<div class="dspIcons">
					<img border="0"
						alt="<axis:alt f="axisctr009" c="BT_DESCRIPCION" lit="1000199"/>"
						src="images/firmar.gif" 
						style="vertical-align: middle; cursor: pointer;"
						<c:if test="${__formdata.SPRODUC == 8063}">  
							onclick="f_abrir_axisctr043('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" 
						</c:if>
						
						<c:if test="${__formdata.SPRODUC != 8063}">  
							onclick="f_abrir_axisctr044('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')" 
						</c:if>
						
						title="<axis:alt f='axisctr009' c="BT_DESCRIPCION" lit='1000199'/>"/>
				</div>
			      </display:column>
			   </axis:visible>
			   <!-- FIN BUG CONF-1325_QT_1983 - 21/03/2016 - JLTS-->
                        </display:table>
                    </div>
			    </axis:ocultar>
       <axis:visible c="DSP_ASEGURADOS" f="axisctr009"> 
           <c:if test="${!empty OB_IAX_RIESGOS.RIESGOASE}">
            <div class="separador">&nbsp;</div>
            <table class="area" align="center">
                <tr>
                    <td>
                <table class="area" align="center">
                    
                        <tr>
                            <td class="campocaja">
                              
                                <div style="float:left;">
                                    <img id="PROPIETARIOS_RIESGO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('PROPIETARIOS_RIESGO', this)"
                                         style="cursor:pointer"/>
                                     
                                    <b id="label_DSP_ASEGURADOS"><axis:alt c="DSP_ASEGURADOS" f="axisctr009" lit="108228"/></b>
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
                                    <c:set var="title0">
                                        <axis:alt f="axisctr009" c="TTIPIDE" lit="109774"/>
                                    </c:set>
                                     
                                    <c:set var="title1">
                                        <axis:alt f="axisctr009" c="NNUMIDE" lit="105330"/>
                                    </c:set>
                                     
                                    <c:set var="title2">
                                        <axis:alt f="axisctr009" c="TNOMBRE" lit="108228"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axisctr009" c="TSEXPER" lit="1000064"/>
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt f="axisctr009" c="FNACIMI" lit="100962"/>
                                    </c:set>                                       
                                     
                                    <display:table name="${OB_IAX_RIESGOS.RIESGOASE}"
                                                   id="PROPIETARIO"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_axisctr009.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html" 
                                                        autolink="false">
                                             <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TTIPIDE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.NNUMIDE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            
                                            <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.NNUMIDE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" style="width:40%"
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
					<!-- INI CONF-1332_QT1987 - 23/03/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->
                                        <c:if test="${PROPIETARIO.OB_IAX_ASEGURADOS.CTIPPER == 1}">  
                                          <display:column title="${title4}" style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TSEXPER"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            
                                            <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.TSEXPER} 
                                            </div>
                                          </display:column>                                         
                                          <display:column title="${title3}" style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.FNACIMI"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${PROPIETARIO.OB_IAX_ASEGURADOS.FNACIMI}"/>
                                            </div>
                                           </display:column>
					 </c:if>
					 <!-- FIN CONF-1332_QT1987 - 23/03/2018 - JLTS Se condiciona la feccha de nacimiento y género solo para los naturales 1-->
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    
                          </table>
                   </td>
                </tr>
             </table>
            </c:if>   
         </axis:visible>
         <axis:visible c="DSP_CONDUCTORES" f="axisctr009">  
        <c:if test="${!empty OB_IAX_RIESGOS.RIESAUTOS}">
            <div class="separador">&nbsp;</div>
            <table class="area" align="center">
              <tr>
                 <td>
                <table class="area" align="center">
                    
                        <tr>
                            <td class="campocaja">
                               
                                <div style="float:left;">
                                    <img id="CONDUCTORES_RIESGO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('CONDUCTORES_RIESGO', this)"
                                         style="cursor:pointer"/>
                                     
                                    <b><axis:alt f="axisctr009" c="CONDUCTORES_RIESGO" lit="9001186"/></b>
                                    &nbsp;&nbsp;<c:if test="${!empty OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0] && 
                                    OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.CPRINCIPAL == 1}" >
                                    <c:choose>
                                            <c:when test="${empty OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.SPERSON}">
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.FNACIMI} -
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.TSEXPER} 
                                            </c:when>
                                            <c:otherwise>
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI1}
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI2},
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE}

                                            </c:otherwise>
                                            </c:choose>
                                            
                                            - <fmt:formatDate pattern="dd/MM/yyyy" value="${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.FCARNET}"/>
                                            </c:if>
                                </div>

                                <div style="clear:both;">
                                    <hr class="titulo"></hr>
                                </div>
                            </td>
                        </tr>
                        <tr id="CONDUCTORES_RIESGO_children"
                            style="display:none">
                            <td class="campocaja">
                                <div class="displayspace">
                                    <c:set var="title0">
                                        <axis:alt f="axisctr009" c="CPRINCIPAL" lit="9001168"/>
                                    </c:set>
                                     
                                    <c:set var="title1">
                                        <axis:alt f="axisctr009" c="FCARNET" lit="9001171"/>
                                    </c:set>
                                     
                                    <c:set var="title2">
                                        <axis:alt f="axisctr009" c="NPUNTOS" lit="9001173"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axisctr009" c="CONDUCTOR" lit="9001027"/>
                                    </c:set>                                    
                                     <display:table name="${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES}"
                                                   id="CONDUCTORES"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_axisctr009.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" style="width:15%;position:center"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.CPRINCIPAL"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"  
                                                        autolink="false">
                                             <div class="dspIcons">
                                            <input type="checkbox"
                                                                       name="CPRINCIPAL"
                                                                       <c:if test="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.CPRINCIPAL == 1}"> checked</c:if>
                                                                       <axis:atr f="axisctr009" c="CPRINCIPAL" a="modificable=false"/>
                                                                       disabled="disabled"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.FCARNET"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.FCARNET}"/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.NPUNTOS"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspNumber">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.NPUNTOS}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}"
                                                        sortable="true" style="width:60%"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.TNOMBRE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                            <c:choose>
                                            <c:when test="${empty CONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON}">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.FNACIMI}"/> - ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.TSEXPER} 
                                            </c:when>
                                            <c:otherwise>
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI1}
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI2},
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE}
                                           </c:otherwise>
                                            </c:choose>
                                            </div>
                                        </display:column>                                        
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                   </table>
                </td>
            </tr>
        </table>            
       </c:if>
       </axis:visible>
            <div class="separador">&nbsp;</div>
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
                               <axis:visible f="axisctr009" c="AREA_REVALI" >
                                <c:if test="${!empty datos_poliza.TREVALI && !empty datos_poliza.CREVALI}">
                                        <tr>
                                            <axis:ocultar f="${formulari}"
                                                          c="TREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja" style="width:25%;">
                                                    <b>
                                                    <axis:alt f="${formulari}" c="label_trevali" lit="101432"></axis:alt> 
                                                    </b>
                                                </td>
                                            </axis:ocultar>
                                            <c:if test="${datos_poliza.CREVALI != 1}">
                                            <axis:ocultar f="${formulari}"
                                                          c="PREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja" style="width:25%;">
                                                    <b id="label_PREVALI">
                                                    <axis:alt f="${formulari}" c="label_PREVALI" lit="9001317"></axis:alt> 
                                                    </b>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            <c:if test="${datos_poliza.CREVALI == 1}">
                                            <axis:ocultar f="${formulari}"
                                                          c="IREVALI"
                                                          dejarHueco="false">
                                                <td class="titulocaja" style="width:25%;">
                                                    <b id="label_IREVALI">
                                                    <axis:alt f="${formulari}" c="label_IREVALI" lit="9001316"></axis:alt>
                                                    </b>
                                                </td>
                                            </axis:ocultar>     
                                            </c:if>                                            
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="${formulari}"
                                                          c="TREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja" style="width:25%;">
                                                    <input type="hidden"
                                                           id="CREVALI"
                                                           name="CREVALI"
                                                           value="${datos_poliza.CREVALI}"
                                                           <axis:atr f="${formulari}" c="CREVALI" a="modificable=false&isInputText=false"/>/>
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="TREVALI"
                                                           name="TREVALI"
                                                           size="15"
                                                           value="${datos_poliza.TREVALI}"
                                                           <axis:atr f="${formulari}" c="TREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            <c:if test="${datos_poliza.CREVALI != 1}">
                                            <axis:ocultar f="${formulari}"
                                                          c="PREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja" style="width:25%;">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="PREVALI"
                                                           name="PREVALI"
                                                           size="15"
                                                           value="${datos_poliza.PREVALI} %"
                                                           <axis:atr f="${formulari}" c="PREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            <c:if test="${datos_poliza.CREVALI == 1}">
                                            <axis:ocultar f="${formulari}"
                                                          c="IREVALI"
                                                          dejarHueco="false">
                                                <td class="campocaja" style="width:25%;">
                                                    <input type="text"
                                                           class="campowidthinput campo campotexto"
                                                           id="IREVALI"
                                                           name="IREVALI"
                                                           size="15"
                                                           value="<fmt:formatNumber value="${datos_poliza.IREVALI}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/>"
                                                           <axis:atr f="${formulari}" c="IREVALI"/>
                                                           readonly="true"/>
                                                </td>
                                            </axis:ocultar>
                                            </c:if>
                                            
                                        </tr>
                                        <!-- BUG: 0027953/0151258 - JSV 21/08/2013  - INI-->
                            <axis:visible f="${pantalla}" c="TMODALIDAD" >
                            <c:if test="${!empty TMODALIDAD}">
                            
                                <tr>
                                    <td class="titulocaja" >
                                            <b id="label_CMODALI"><axis:alt f="axisctr207" c="TMODALIDAD" lit="100943" /></b>
                                    </td>
                                </tr>
                                <tr >
                                      <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo campotexto" id="TMODALIDAD" name="TMODALIDAD" size="15"
                                    value="${TMODALIDAD}" readonly="true"/>
                                </td>
                                </tr>
                               
                             </c:if>
                             </axis:visible>
                              <!-- BUG: 0027953/0151258 - JSV 21/08/2013  - FIN -->
                                    </c:if>
                       </axis:visible> 
                        <!-- INI-CONF-209-VLCG  -->
                        <c:if test="${CMONPRODINT ne 'COP'}">
                        <td align="left">
                            <axis:visible f="axisctr009" c="BT_CONVPESOS">
                                <input type="button" class="boton" id="but_convpesos" value="<axis:alt f="axisctr009" c="BT_CONVPESOS" lit="9908899"></axis:alt>" onclick="f_convpesos()"/>
                            </axis:visible>
                        </td>
                        </c:if>
                         <!-- FIN-CONF-209-VLCG  -->
                      
                        </table>
            
                        <table class="area" align="center">
                        	<c:if test="${!empty sessionScope.garantiasGeneral || !empty sessionScope.garantiasSortida || !empty sessionScope.garantiasEntrada}">
                        	 
                             <tr>
                                 <td class="campocaja" >
                                    <img id="DSP_GARANTIAS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_GARANTIAS', this)" style="cursor:pointer"/> 
                                    <b><axis:alt f="axisctr009" c="DSP_GARANTIAS" lit="1000183"></axis:alt></b>
                                    <hr class="titulo">
                                </td>
                                 <td>
                                </td>
                             </tr>
                            </c:if>
                           
                            
                             <tr id="DSP_GARANTIAS_children"  style="display:none">
                                <td class="campocaja" >
                                      <c:set var="title0"><axis:alt f="axisctr009" c="CGARANT" lit="1000109" /></c:set>
                                      <c:set var="title1"><axis:alt f="axisctr009" c="TGARANT" lit="100588" /></c:set>
                                      <c:set var="title2"><axis:alt f="axisctr009" c="ICAPITAL" lit="1000073" /></c:set>
                                      <c:set var="title3"><axis:alt f="axisctr009" c="IPRITOT" lit="1000497" /></c:set>
                                      <c:set var="title4"><axis:alt f="axisctr009" c="DETALL" lit="1000113" /></c:set>       
                                      <c:set var="title8"><axis:alt f="axisctr009" c="CMONCAP" lit="108645"/></c:set>
                                      
                                      <!-- INI BUG 41143/229973 - 17/03/2016 - JAEG -->
                                      <c:set var="title16"><axis:alt f="axisctr009" c="FINIVIG" lit="9908885"/></c:set>     <!-- FINIVIG -->
                                      <c:set var="title17"><axis:alt f="axisctr009" c="FFINVIG" lit="9908886"/></c:set>     <!-- FFINVIG -->
                                      <c:set var="title18"><axis:alt f="axisctr207" c="CCOBPRIMA" lit="9909252"/></c:set>   <!-- CCOBPRIMA -->
                                      <c:set var="title19"><axis:alt f="axisctr207" c="IPRIDEV" lit="9909251"/></c:set>     <!-- IPRIDEV -->                                       
                                      <!-- FIN BUG 41143/229973 - 17/03/2016 - JAEG -->
                                      
                        <% if (garantias_entrada!= null && garantias_entrada.size()>0){ %>             
                           <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                              <tr>
                                <% for (int j=0;j<garantias_entrada.size();j=j+2){ %>
                                    <!-- IF VALORES INICIO LCF -->
                                    <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_0">CGARANT_<%=((HashMap)garantias_entrada.get(j)).get("CGARANT")%></c:set>
                                    <%}%>
                                     <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_1">CGARANT_<%=((HashMap)garantias_entrada.get(j+1)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <!-- FIN VALORES LCF -->
                                    <!-- TITULO 0 -->
                                    <axis:ocultar c="${CGARANT_0}" f="axisctr009" dejarHueco="false">
                                    <td>
                                          <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <c:set var="CGARANT_0DESC"><%=((HashMap)garantias_entrada.get(j)).get("TGARANT")%></c:set>
                                            <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
                                                <td class="titulocaja" ><b><axis:alt f="axisctr009" c="${CGARANT_0}" lit="${CGARANT_0DESC}"></axis:alt></b></td>
                                            </tr>
                                            </table>
                                          <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <!-- FIN TITULO 0-->
                                    <!-- TITULO 1 -->
                                    <axis:ocultar c="${CGARANT_1}" f="axisctr009" dejarHueco="false">
                                    <td>
                                         <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <c:set var="CGARANT_1DESC"><%=((HashMap)garantias_entrada.get(j+1)).get("TGARANT")%></c:set>
                                              <tr id="CAP_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
                                                <td class="titulocaja"><b><axis:alt f="axisctr009" c="${CGARANT_1}" lit="${CGARANT_1DESC}"></axis:alt></b></td>
                                             </tr>
                                            </table>
                                        <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <!-- FIN TITULO 1 -->
                                </tr>
                                <tr>
                                    <!-- CAMPO 0 -->
                                    <axis:ocultar c="${CGARANT_0}" f="axisctr009" dejarHueco="false">
                                    <td>
                                      <% if( j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="axisctr009" c="${CGARANT_0}" a="modificable=true"/> class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%>  title="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_entrada.get(j)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <!-- FIN CAMPO 0 -->
                                    <!-- CAMPO 1 -->
                                    <axis:ocultar c="${CGARANT_1}" f="axisctr009" dejarHueco="false">
                                    <td>
                                    <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("TGARANT")!=null ) { %>
                                            <table>
                                            <tr id="CAG_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>">
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>"/>
                                                <input type="text" <axis:atr f="axisctr009" c="${CGARANT_1}" a="modificable=true"/> class="campowidthinput campo campotexto"  id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j+1)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%>  title="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" size="15" 
                                                value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_entrada.get(j+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <!-- FIN CAMPO 1 -->
                                    <!-- FIN CAMBIOS GARANTIAS SUELTAS LCF -->
                                </tr>
                                <% } %>  
                             </table>      
                          <%}%>  
                          <c:if test="${!empty sessionScope.garantiasGeneral}">
                           <c:if test="${! empty sessionScope.axisctr_partidas  }">
					                  <c:import url="axisctr009_partidas.jsp"/>
					                </c:if>
                                                       
                               <div class="displayspace" >
                                      <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdGarantias">
                                      <thead>
                                            <tr>
                                          
                                            <axis:visible f="${formulari}" c="CGARANT">
                                                <th style="width:6%;height:0px"></th>
                                            </axis:visible>
                                            
                                          
                                            <axis:visible f="${formulari}" c="TGARANT">
                                                <th style="width:40%;height:0px"></th>
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="${formulari}" c="FINIVIG" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>                                            
                                            <axis:visible f="${formulari}" c="FFINVIG" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                             
                                             
                                            <axis:visible f="${formulari}" c="GAR_ICAPITAL">    
                                                <th style="width:10%;height:0px"></th>
                                             </axis:visible>  
                                              <%--axis:visible f="axisctr009" c="CAPRECOMEND"> 
                                                <th style="width:10%;height:0px"></th>
                                              </axis:visible--%>
                                            <axis:visible f="${formulari}" c="CMONCAP">
                                            
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                            
                                           <axis:visible f="${formulari}" c="CCOBPRIMA" >
                                                <th style="width:3%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="IPRIDEV" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>                                             
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            
                                            <axis:visible f="${formulari}" c="GAR_IPRITOT">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            
                                            
                                          
                                            <axis:visible f="${formulari}" c="DETGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                          
                                            
                                        </tr>
                                        <tr>   
                                         
                                            <axis:visible f="${formulari}" c="CGARANT">
                                                <td class="sortable"><b>${title0}</b></td>
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="TGARANT">
                                                <td class="sortable"><b>${title1}</b></td>
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="${formulari}" c="FINIVIG">
                                                <th class="sortable"><b>${title16}</b></th>
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="FFINVIG">
                                                <th class="sortable"><b>${title17}</b></th>
                                            </axis:visible>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                            
                                            
                                            <axis:visible f="${formulari}" c="GAR_ICAPITAL">
                                                <td class="sortable"><b>${title2}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="CMONCAP">
                                                <td class="sortable"><b>${title8}</b></td>                                        
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="${formulari}" c="CCOBPRIMA">
                                                <th class="sortable"><b>${title18}</b></th>
                                            </axis:visible>
                                            <axis:visible f="${formulari}" c="IPRIDEV">
                                                <th class="sortable"><b>${title19}</b></th>
                                            </axis:visible>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                              
                                           
                                            <axis:visible f="${formulari}" c="GAR_IPRITOT">
                                                <td class="sortable"><b>${title3}</b></td>                                        
                                            </axis:visible>
                                            
                                            <axis:visible f="${formulari}" c="DETGARANT">
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
                                                             <axis:visible f="${formulari}" c="CGARANT">
                                                                <td class="dspNumber" nowrap>   
                                                                 <div class="dspNumber">
                                                                 <c:choose>
                                                                      <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                        <img id="img_DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" src="images/mes.gif" onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this)" style="cursor:pointer"/> 
                                                                           
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                      <img id="img_DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" src="images/blank.gif"  style="cursor:pointer"/> 
                                                                      </c:otherwise>
                                                                      </c:choose>
                                                                   ${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}</div>
                                                                   
                                                                </td>
                                                          </axis:visible>
                                                            
                                                      
                                                          <axis:visible f="${formulari}" c="TGARANT">
                                                                <td class="dspText">   
                                                                    <div class="dspText">
                                                                     
                                                                    
                                                                    
                                                                    ${miListaIdGarantias.OB_IAX_GARANTIAS.TGARANT}</div>
                                                                </td>
                                                          </axis:visible>
                                                          
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                          <axis:visible f="${formulari}" c="FINIVIG">
                                                            <td class="dspText">   
                                                                <div class="dspText">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FINIVIG}"/>
                                                                </div>
                                                            </td>
                                                          </axis:visible>
                                                          
                                                          <axis:visible f="${formulari}" c="FFINVIG">
                                                            <td class="dspText">   
                                                                <div class="dspText">
                                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FFINVIG}"/>
                                                                </div>
                                                            </td>
                                                          </axis:visible>                                                      
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                                          
                                                          
                                                          <axis:visible f="axisctr009" c="GAR_ICAPITAL">
                                                                <td class="dspNumber">   
                                                                    <div class="dspNumber">
                                                                           <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"
                                                                          pattern="###,###,###,###,###,###.##"/>
                                                                  
                                                                        <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE  && miListaIdGarantias.OB_IAX_GARANTIAS.CDETALLE == 1 && fn:length(miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE) > 0}">
                                                                               <a onclick ="f_abrir_axisctr163('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT }')">
                                                                                 <img  src="images/mes.gif" title='<axis:alt f="${formulari}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'   alt='<axis:alt f="${formulari}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'>
                                                                               </a>  
                                                                        </c:if>      
                                                      
                                                                    </div>
                                                                    </td>
                                                                </axis:visible>
                                                                   
                                                                 <axis:visible f="axisctr009" c="CMONCAP">
                                                                        <td class="dspText">   
                                                                            <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                                              ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                                             </div>
                                                                        </td>
                                                                </axis:visible>
                                                                
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                          <axis:visible f="${formulari}" c="CCOBPRIMA">
                                                            <td class="dspText">   
                                                                <input <axis:atr f="${formulari}" c="CCOBPRIMA" a="modificable=false&isInputText=false"/>                                                                              
                                                                    type="checkbox"
                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CCOBPRIMA == '1'}">checked="true"</c:if> 
                                                                    id="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                    name="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"/>
                                                            </td>
                                                          </axis:visible>
                                                          
                                                          <axis:visible f="${formulari}" c="IPRIDEV">
                                                            <td class="dspText">   
                                                                <div class="dspText">
                                                                    <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIDEV}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/>
                                                                </div>
                                                            </td>
                                                          </axis:visible>                                                     
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                                                
                                                                    
                                                                             
                                        
                                                                     <axis:visible f="${formulari}" c="GAR_IPRITOT">
                                                                        <td class="dspNumber">  
                                                                            <div class="dspNumber">
                                                                              <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.PRIMAS.IPRITOT}"
                                                                                 pattern="${__formatNumberPatterns[CMONPRODINT]}"/>
                                                                            </div>
                                                                        </td>
                                                                    </axis:visible>
                                                                            
                                                                    
                                                                    <axis:visible f="${formulari}" c="DETGARANT">
                                                                             <td class="dspText">  
                                                                                         <div class="dspIcons">
                                                                                           <img border="0"
                                                                                             alt='<axis:alt f="${formulari}" c="LIT_DETGAR" lit="1000196"></axis:alt>'                                                        
                                                                                             title1='<axis:alt f="${formulari}" c="LIT_DETGAR" lit="1000196"></axis:alt>'
                                                                                             src="images/mas.gif"
                                                                                             width="11px" height="11px"
                                                                                             style="cursor:pointer;"
                                                                                             onclick="f_abrir_axisctr030('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', '${OB_IAX_RIESGOS.NRIESGO}', '${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}')"/>
                                                                                        </div>
                                                                                  </td>
                                                                            </axis:visible>
                                                                       
                                                                            </tr>
                                                                                <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                                        <c:set scope="session" var="hijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                                                                                            <c:import url="axisctr009_hijos.jsp">
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
                       <% if (garantias_salida!= null && garantias_salida.size()>0){ %>    
                      <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <% for (int h=0;h<garantias_salida.size();h=h+3 ){ %>
                                    <% if(h < garantias_salida.size() &&((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_2">CGARANT_<%=((HashMap)garantias_salida.get(h)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <% if(h+1 < garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_3">CGARANT_<%=((HashMap)garantias_salida.get(h+1)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <% if(h+2 < garantias_salida.size() &&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                    <c:set var="CGARANT_4">CGARANT_<%=((HashMap)garantias_salida.get(h+2)).get("CGARANT")%></c:set>
                                    <%}%>

                                    <tr>
                                        <axis:ocultar c="${CGARANT_2}" f="axisctr009" dejarHueco="false">
                                            <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h)).get("TGARANT") %></b></td>
                                            <% } %> 
                                        </axis:ocultar>
                                        <axis:ocultar c="${CGARANT_3}" f="axisctr009" dejarHueco="false">
                                            <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+1)).get("TGARANT") %></b></td>
                                            <% } %> 
                                        </axis:ocultar>
                                        <axis:ocultar c="${CGARANT_4}" f="axisctr009" dejarHueco="false">
                                            <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                                <td class="titulocaja"><b><%= ((HashMap)garantias_salida.get(h+2)).get("TGARANT") %></b></td>
                                            <% } %> 
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar c="${CGARANT_2}" f="axisctr009" dejarHueco="false">
                                            <% if(((HashMap)garantias_salida.get(h)).get("TGARANT")!=null ) { %>
                                                <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" readonly
                                                formato="decimal" title="" size="15" 
                                                value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            <% } %> 
                                        </axis:ocultar>
                                        <axis:ocultar c="${CGARANT_3}" f="axisctr009" dejarHueco="false">
                                            <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                                <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" readonly
                                                formato="decimal"  title="" size="15" 
                                                value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            <% } %> 
                                        </axis:ocultar>
                                        <axis:ocultar c="${CGARANT_4}" f="axisctr009" dejarHueco="false">
                                            <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                                <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" readonly
                                                formato="decimal" title="" size="15" 
                                                value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h+2)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            <% } %> 
                                        </axis:ocultar>
                                    </tr>
                                <% } %>
                                
                                
                                
                            </table>
                            <%}%>
                            
                              <axis:visible f="axisctr009" c="DSP_TOT_FRANQUICIAS" >
                                <%--c:if test="${!empty OB_IAX_RIESGOS.BONFRANSEG || !empty OB_IAX_RIESGOS.franqlibres || !empty  OB_IAX_RIESGOS.franqtecnicas || !empty  OB_IAX_RIESGOS.franqtecnicaslibres  || !empty  OB_IAX_RIESGOS.bonusmalus || !empty  OB_IAX_RIESGOS.bonusmaluslibres}"--%>
                                  <c:import url="axisctr009_riesgo_franquicias.jsp"/>
                                <%--/c:if--%>
                          </axis:visible>
                       <c:if test="${ !empty evoluprovmatseg}">
                            <axis:ocultar f="axisctr009" c="DSP_EVOLUPROVMAT" dejarHueco="false">
                            <div class="separador">&nbsp;</div>
                            <tr>
                            <td class="campocaja" >
                            <img id="DSP_EVOLUPROVMAT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_EVOLUPROVMAT', this)" style="cursor:pointer"/>
                                <b><axis:alt f="axisctr009" c="DSP_EVOLUPROVMAT" lit="9901259"></axis:alt></b>
                                <hr class="titulo">
                            </td>
                            </tr>
                            <tr id="DSP_EVOLUPROVMAT_children" style="display:none">
                            <td class="campocaja" >
                                 <div class="displayspace">
                                       <c:set var="title0"><axis:alt f="axisctr009" c="NANYO" lit="101606"></axis:alt></c:set>
                                       <c:set var="title1"><axis:alt f="axisctr009" c="FPROVMAT" lit="100562"></axis:alt></c:set>
                                       <c:set var="title2"><axis:alt f="axisctr009" c="IPROVMAT" lit="1000518"></axis:alt></c:set>
                                       <c:set var="title3"><axis:alt f="axisctr009" c="PRESCATE" lit="1000522"></axis:alt></c:set>
                                       <c:set var="title4"><axis:alt f="axisctr009" c="PINTTEC" lit="9901247"></axis:alt></c:set>
                                       <c:set var="title5"><axis:alt f="axisctr009" c="IVALRES" lit="102731"></axis:alt></c:set>
                                       <c:set var="title6"><axis:alt f="axisctr009" c="IPRIMA" lit="101368"></axis:alt></c:set>
                                    
                                  <display:table name="${evoluprovmatseg}" id="evoluprovmatseg" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:100%"
                                   requestURI="axis_axisctr009.do?paginar=true"> 
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr009" c="NANYO">
                                        <display:column title="${title0}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.NANYO" headerClass="sortable fixed"  media="html" autolink="false" >
                                          <div class="dspNumber"><fmt:formatNumber value='${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.NANYO}' pattern="###,##0"/></div>
                                        </display:column>
                                        </axis:visible>    
                                        <axis:visible f="axisctr009" c="FPROVMAT">
                                        <display:column title="${title1}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.FPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspText"><fmt:formatDate value='${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.FPROVMAT}' pattern='dd/MM/yyyy'/></div>
                                        </display:column>
                                        </axis:visible>    
                                        <axis:visible f="axisctr009" c="IPROVMAT">
                                        <display:column title="${title2}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IPROVMAT}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/></div>
                                        </display:column>
                                        </axis:visible>    
                                        <axis:visible f="axisctr009" c="PRESCATE">
                                        <display:column title="${title3}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.PRESCATE" headerClass="sortable fixed" media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.PRESCATE}" pattern="###,##0.00"/></div>
                                        </display:column>
                                        </axis:visible>    
                                        <axis:visible f="axisctr009" c="PINTTEC">
                                            <display:column title="${title4}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.PINTTEC" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.PINTTEC}" pattern="###,##0.00"/></div></div>
                                            </display:column>
                                        </axis:visible>    
                                        <axis:visible f="axisctr009" c="IPRIMA">
                                            <display:column title="${title6}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IPRIMA" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IPRIMA}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/></div></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr009" c="IVALRES">
                                            <display:column title="${title5}" sortable="true" sortProperty="evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IVALRES" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.OB_IAX_EVOLUPROVMAT.IVALRES}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/></div></div>
                                            </display:column>
                                        </axis:visible>
                                  </display:table>
                                  </div>
                            </td>
                            </tr>
                            </axis:ocultar>
                        </c:if>
			
                        <c:import url="axisctr009_b1.jsp"/>
			
			 <c:if test="${!empty sessionScope.rentasIrregulares}">
            <div class="separador">&nbsp;</div>   
                       
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_RENTAIRR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RENTAIRR', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="axisctr009" c="DSP_RENTAIRR" lit="1000344" /></b>
                                    </div>
  
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                             </tr>
                             <tr id="DSP_RENTAIRR_children" style="display:none">
                                <td class="seccion"  >
                                  
                                  <table  >
                                  <tr>
                                        <th style="width:12%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>   
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>
                                        <th style="width:7%;height:0px"></th>   
                                        <th style="width:5%;height:0px"></th>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="CODIGO" lit="101606" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO1" lit="1000278" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO2" lit="1000279" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO3" lit="1000280" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO4" lit="1000281" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO5" lit="1000282" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO6" lit="1000283" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO7" lit="1000284" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO8" lit="1000285" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO9" lit="1000286" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO10" lit="1000287" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO11" lit="1000288" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr009" c="ANYO12" lit="1000289" /></b></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    

                                    <c:forEach items="${sessionScope.rentasIrregulares}" var="lista" varStatus="i">
                                    
                                      <tr tipo="ri" >
                                        
                                        <td class="campocaja" align="center">
                                                <c:forEach items="${sessionScope.axisctr_lista_anyos}" var="anyo">
                                                      <c:if test="${lista.OB_IAX_RENTAIRR.ANYO == anyo.CODIGO}">
                                                        <input type="text" class="campowidthinput campo campotexto" align="middle" style="width:50%;" id="ENERO_${i.count-1}" name="ENERO_${i.count-1}" 
                                                        value="${anyo.CODIGO}"/>
                                                    </c:if>
                                                </c:forEach>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ENERO_${i.count-1}" name="ENERO_${i.count-1}" 
                                            formato="decimal" title="ENERO_${i.count-1}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES1}'/>"/>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="FEBRERO_${i.count-1}" name="FEBRERO_${i.count-1}" 
                                            formato="decimal" title="FEBRERO_${i.count-1}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES2}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MARZO_${i.count-1}" name="MARZO_${i.count-1}" 
                                            formato="decimal" title="MARZO_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES3}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ABRIL_${i.count-1}" name="ABRIL_${i.count-1}" 
                                            formato="decimal" title="ABRIL_${i.count-1}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES4}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MAYO_${i.count-1}" name="MAYO_${i.count-1}" 
                                            formato="decimal" title="MAYO_${i.count-1}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES5}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JUNIO_${i.count-1}" name="JUNIO_${i.count-1}" 
                                            formato="decimal" title="JUNIO_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES6}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JULIO_${i.count-1}" name="JULIO_${i.count-1}" 
                                            formato="decimal" title="JULIO_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES7}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="AGOSTO_${i.count-1}" name="AGOSTO_${i.count-1}" 
                                            formato="decimal" title="AGOSTO_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES8}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="SEPTIEMBRE_${i.count-1}" name="SEPTIEMBRE_${i.count-1}" 
                                            formato="decimal" title="SEPTIEMBRE_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES9}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="OCTUBRE_${i.count-1}" name="OCTUBRE_${i.count-1}" 
                                            formato="decimal" title="OCTUBRE_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES10}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NOVIEMBRE_${i.count-1}" name="NOVIEMBRE_${i.count-1}" 
                                            formato="decimal" title="NOVIEMBRE_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES11}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="DICIEMBRE_${i.count-1}" name="DICIEMBRE_${i.count-1}" 
                                            formato="decimal" title="DICIEMBRE_${i.count-1}"  size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES12}'/>"/>
                                        </td>
                
                                    
                                        
                                    </tr>
                                   
                                    </c:forEach>
                                  
                                  </table>
                                 
                                </td>
                            </tr>
                        
                        </c:if>       
                    </td>
                </tr>
                            <axis:visible f="axisctr009" c="DSP_EVOLUPROVMAT">
                            <div class="separador">&nbsp;</div>
                            <tr>
                            <td class="campocaja" >
                            <img id="DSP_EVOLUPROVMAT_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_EVOLUPROVMAT', this)" style="cursor:pointer"/>
                                <b><axis:alt f="axisctr009" c="DSP_EVOLUPROVMAT" lit="9901259"></axis:alt></b>
                                <hr class="titulo">
                            </td>
                            </tr>
                            <tr id="DSP_EVOLUPROVMAT_children" style="display:none">
                            <td>
                            <table class="area" align="left">
                              <tr>
                                 <td>
                                  <table class="area" align="left" cellspacing="0"  cellpadding="0" style="width:200px">
                                  <tr>
                                   <axis:visible f="axisctr009" c="CESCENA">
                                     <td class="titulocaja"  width="10%">
                                       <b><axis:alt f="axisctr009" c="LESCENA" lit="9908029"></axis:alt></b>
                                     </td>
                                   </axis:visible>
                                   <axis:visible f="axisctr009" c="CESCENA">
                                     <td class="campocaja" width="90%">
                                       <select name = "NESCENA" id ="NESCENA" onchange="f_actualiza_evoluprov(${__formdata.SSEGURO},this.value,null);"  style="width:90%"
                                         class="campowidthselect campo campotexto_ob"  
                                         <axis:atr f="axisctr009" c="NESCENA" a="obligatorio=false&modificable=true&isInputText=false"/>;
                                         <option value="null"><axis:alt f="axisctr009" c="SEL" lit="1000348"/></option>
                                         <c:forEach var="element" items="${__formdata.listValores.tipEscen}">
                                         <option value = "${element.CATRIBU}">${element.TATRIBU}</option>
                                         </c:forEach>
                                       </select>
                                    </td>
                                   </axis:visible>
                                  </tr>
                                 </table>
                                </td>
                            </tr>                                
                            <tr>
                            <td class="campocaja" >
                                 <div class="fixedHeaderTable">
                                       <c:set var="title0"><axis:alt f="axisctr009" c="NANYO" lit="101606"></axis:alt></c:set>
                                       <c:set var="title1"><axis:alt f="axisctr009" c="FPROVMAT" lit="100562"></axis:alt></c:set>
                                       <c:set var="title2"><axis:alt f="axisctr009" c="IPROVMAT" lit="1000518"></axis:alt></c:set>
                                       <c:set var="title3"><axis:alt f="axisctr009" c="PRESCATE" lit="1000522"></axis:alt></c:set>
                                       <c:set var="title4"><axis:alt f="axisctr009" c="PINTTEC" lit="9901247"></axis:alt></c:set>
                                       <c:set var="title5"><axis:alt f="axisctr009" c="IVALRES" lit="102731"></axis:alt></c:set>
                                       <c:set var="title6"><axis:alt f="axisctr009" c="IPRIMA" lit="101368"></axis:alt></c:set>
                                    
                                      <display:table name="${evoluprovmatseg}" id="evoluprovmatseg" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:100%"
                                       requestURI="axis_axisctr009.do?paginar=true&tabla=tomador"> 
                                            <%@ include file="../include/displaytag.jsp"%>
											<axis:visible f="axisctr009" c="NANYO">
                                            <display:column title="${title0}" sortable="true" sortProperty="evoluprovmatseg.NANYO" headerClass="sortable fixed"  media="html" autolink="false" >
                                              <div class="dspNumber"><fmt:formatNumber value='${evoluprovmatseg.NANYO}' pattern="###,##0"/></div>
                                            </display:column>
											</axis:visible>
											<axis:visible f="axisctr009" c="FPROVMAT">
                                            <display:column title="${title1}" sortable="true" sortProperty="evoluprovmatseg.FPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate value='${evoluprovmatseg.FPROVMAT}' pattern='dd/MM/yyyy'/></div>
                                            </display:column>
											</axis:visible>
											<axis:visible f="axisctr009" c="IPROVMAT">
                                            <display:column title="${title2}" sortable="true" sortProperty="evoluprovmatseg.IPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPROVMAT}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                            </display:column>
											</axis:visible>
											<axis:visible f="axisctr009" c="PRESCATE">
                                            <display:column title="${title3}" sortable="true" sortProperty="evoluprovmatseg.PRESCATE" headerClass="sortable fixed" media="html" autolink="false" >
                                                <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PRESCATE}" pattern="###,##0.00"/></div>
                                            </display:column>
											</axis:visible> 
                                            <axis:visible f="axisctr009" c="PINTTEC">
                                                <display:column title="${title4}" sortable="true" sortProperty="evoluprovmatseg.PINTTEC" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PINTTEC}" pattern="###,##0.00"/></div>
                                                </display:column>
                                            </axis:visible>    
                                            <axis:visible f="axisctr009" c="IPRIMA">
                                                <display:column title="${title6}" sortable="true" sortProperty="evoluprovmatseg.IPRIMA" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPRIMA}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr009" c="IVALRES">
                                                <display:column title="${title5}" sortable="true" sortProperty="evoluprovmatseg.IVALRES" headerClass="sortable fixed" media="html" autolink="false" >
                                                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IVALRES}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                                                </display:column>
                                            </axis:visible>
                                       </display:table>
                                  </div>
                            </td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            </axis:visible>
              <axis:visible f="axisctr009" c="DSP_TOT_PREGUNTAS_RIESGO" >
                     <c:if test="${!empty OB_IAX_RIESGOS.PREGUNTAS || !empty  OB_IAX_RIESGOS.pregQuestSalut || !empty  OB_IAX_RIESGOS.pregDespeses}">
                      <c:import url="axisctr009_riesgo_preguntas.jsp"/>
                    </c:if>
              </axis:visible>
              <axis:visible c="DSP_BENEFICIARIOS" f="axisctr009">
                <div class="separador">&nbsp;</div> 
                         <tr>
                             <td class="campocaja" >
                                <img id="DSP_BENEFICIARIOS_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_BENEFICIARIOS', this)" style="cursor:pointer"/> 
                                <b><axis:alt f="axisctr009" c="DSP_BENEFICIARIOS" lit="1000079" /></b>
                                <hr class="titulo">
                            </td>
                         </tr>
                         <tr id="DSP_BENEFICIARIOS_children" style="display:none">
                            <td class="campocaja" >
                             <axis:visible c="DSP_BENEFICIARIOS_1" f="axisctr009">
                                 <div class="displayspace">
                                  <c:set var="title0"><axis:alt f="axisctr009" c="SCLABEN" lit="800440" /></c:set>
                                  <c:set var="title1"><axis:alt f="axisctr009" c="DESCRIPCION" lit="101805" /></c:set>                               
                                    <display:table name="${OB_IAX_RIESGOS.OB_IAX_BENEFICIARIOS}" id="lista_bene" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="axis_axisctr009.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre estÃ¡ desplegada -->
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <axis:visible f="axisctr009" c="SCLABEN">
                                                <display:column title="${title0}" sortable="false"  headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                  <div class="dspText">${lista_bene.SCLABEN}</div>  
                                                </display:column>
                                                </axis:visible>
                                                <display:column title="${title1}" sortable="false"  headerClass="headwidth sortable"  media="html" autolink="false" >
                                                  <div class="dspText">${lista_bene.DESCRIPCION}</div>  
                                                </display:column>
                                    </display:table>
                                    
                                 </div>
                                 </axis:visible>
                                 
                                        <axis:visible c="BEN_IDENT" f="axisctr009">
                                            <c:import url="axisctr009_beneficiarios_identificados.jsp"/>
                                        </axis:visible>
                                    </td>
                        </tr>
                        </axis:visible>  
                                 
              
           </table>
        </c:if>
<axis:visible c="DSP_CONTRAGARAN" f="axisctr009">

	<c:if test="${__formdata.T_IAX_CONTRAGARAN!=null}">
	<tr>
		<td class="campocaja">
		<img src="images/mes.gif" id="DSP_CONTRAGARAN_parent" onclick="objEstilos.toggleDisplay('DSP_CONTRAGARAN', this)" style="cursor: pointer" /> 
			<b><axis:alt f="axisctr009" c="CGAR" lit="9908805" /></b>
			<hr class="titulo">
		</td>
	</tr>
	<tr id="DSP_CONTRAGARAN_children" style="display: none">
		<td class="campocaja">
		<c:import url="../include/modal_estandar.jsp">
				<c:param name="titulo">
					<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9908805" />
				</c:param>
				<c:param name="nid" value="axiscga002" />
			</c:import>
			<script type="text/javascript">
			function f_consultar_contragarantia(SCONTGAR,NMOVIMI,SPERSON) {
				objUtiles.abrirModal("axiscga002", "src","modal_axiscga002.do?operation=detalle_consulta&SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&SSEGUROPRODUCCION=${sessionScope.SSEGURO}");			
			}
			function f_but_cerrar_axiscga002(){
		    	objUtiles.cerrarModal("axiscga002");		    	
		   }
			</script>
		<div class="displayspace">
						<c:set var="title0"><axis:alt f="axisctr009" c="SCONTGAR" lit="9908801"/></c:set>
                       <c:set var="title1"><axis:alt f="axisctr009" c="TDESCRIP" lit="100588"/></c:set>
                       <c:set var="title2"><axis:alt f="axisctr009" c="TTIPO" lit="9907700"/></c:set>
                       <c:set var="title3"><axis:alt f="axisctr009" c="TCLASE" lit="9904874"/></c:set>
                       <c:set var="title4"><axis:alt f="axisctr009" c="TTENEDOR" lit="9908802"/></c:set>
                       <c:set var="title5"><axis:alt f="axisctr009" c="TESTADO" lit="101510"/></c:set>
                       <c:set var="title6"><axis:alt f="axisctr009" c="IVALOR" lit="101159"/></c:set> 
                       <c:set var="title7"><axis:alt f="axisctr009" c="CONSULTAR" lit="1000439"/></c:set>
                       <c:set var="axisctr009_lista_contragaran" value="${__formdata.T_IAX_CONTRAGARAN}" />    
                       <div class="separador">&nbsp;</div>
                       
                       <display:table name="${axisctr009_lista_contragaran}" id="miLCC" export="false" class="dsptgtable"
							pagesize="-1" defaultsort="2" defaultorder="ascending"
							requestURI="axis_axisctr009.do?paginar=true" sort="list"
							cellpadding="0" cellspacing="0">
							<%@ include file="../include/displaytag.jsp"%>
                        	
                        	<display:column title="${title0}" sortProperty="SCONTGAR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.SCONTGAR}</div>
                            </display:column>
                            <display:column title="${title1}" sortProperty="TDESCRIP" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TDESCRIP}</div>
                            </display:column>
                            <display:column title="${title2}" sortProperty="TTIPO" headerClass="sortable" media="html" sortable="true" autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TTIPO}</div>
                            </display:column>
                            <display:column title="${title3}" sortProperty="TCLASE" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TCLASE}</div>
                            </display:column>
                            <display:column title="${title4}" sortProperty="TTENEDOR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TTENEDOR}</div>
                            </display:column>
                            <display:column title="${title5}" sortProperty="TESTADO" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.TESTADO}</div>
                            </display:column>
                            <display:column title="${title6}" sortProperty="IVALOR" headerClass="sortable" media="html" sortable="true"
								autolink="false">
                                <div class="dspText">${miLCC.OB_IAX_CONTRAGARAN.IVALOR}</div>
                            </display:column>
                            
                            <display:column title="${title7}" headerClass="sortable" media="html" sortable="false"
								autolink="false">
								<div class="dspIcons">
									<img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_contragarantia('${miLCC.OB_IAX_CONTRAGARAN.SCONTGAR}','${miLCC.OB_IAX_CONTRAGARAN.SPERSON}','${miLCC.OB_IAX_CONTRAGARAN.NMOVIMI}');"style="cursor: pointer" />
								</div>
							</display:column>
                            
		                                    
                        </display:table>     
                        </div>
                         
		</td>
		</tr>
</c:if>		
</axis:visible>
