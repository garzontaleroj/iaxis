<%/* Revision:# utrVWFlBkU9WlQmAQqVvZg== # */%>
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
                    <axis:visible  f="${pantalla}" c="LAPIZ1">
                    <div style="float:right;" id="RIESGOS" c="LAPIZ1"></div>
                    </axis:visible>
                    <div class="seccion_suplementos"  id="SECCION_RIESGOS"></div>                    
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
                    <c:set var="title6"><axis:alt f="${pantalla}" c="BT_DESC_RIE" lit="1000100"></axis:alt></c:set>  <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->       
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
              <axis:visible f="${pantalla}" c="DET_ITEMS_RIESGO">  
			   <display:column title="${title3}"
			   headerClass="headwidth5 sortable"
			   media="html" autolink="false">
			   <c:choose>
			   <c:when test="${datos_poliza.COBJASE==1}">
                           <axis:visible f="${pantalla}" c="LIT_DET_ASE">
			   <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000195"></axis:alt>'                                        
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000195"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                </div>
                            </axis:visible>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==2}">
                                <axis:visible f="${pantalla}" c="LIT_DET_ASE">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_riedireccion('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}');"/>
                                </div>
                                </axis:visible>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==3}">
                                <axis:visible f="${pantalla}" c="LIT_DET_ASE">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&CMODO=CONSULTA&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                                </div>
                                </axis:visible>
                            </c:when>
                            <c:when test="${datos_poliza.COBJASE==4}">
                                <axis:visible f="${pantalla}" c="LIT_DET_ASE">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_modal('axisctr043', false, '&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                                </div>
                                </axis:visible>
                            </c:when>
                            
                            <c:when test="${datos_poliza.COBJASE==5}">
                                <axis:visible f="${pantalla}" c="LIT_DET_ASE">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctrautos('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                </div>
                                </axis:visible>
                            </c:when>
                            <c:otherwise>
                                <axis:visible f="${pantalla}" c="LIT_DET_ASE">
                                <div class="dspIcons">
                                    <img border="0"
                                         alt='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         title='<axis:alt f="${pantalla}" c="LIT_DET_ASE" lit="1000199"></axis:alt>'
                                         src="images/mas.gif" width="11px"
                                         height="11px"
                                         style="vertical-align:middle;cursor:pointer;"
                                         onclick="f_abrir_axisctr029('${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO}')"/>
                                         
                                </div>
                                </axis:visible>                             
                        </c:otherwise>
                    </c:choose>
                    </display:column>
                    
                    <!-- INI BUG CONF-114 - 17/09/2016 - JAEG-->
                    <axis:visible f="${pantalla}" c="BT_DESC_RIE">
                    <display:column title="${title6}" headerClass="headwidth10 sortable" media="html" autolink="false">                        
                        <div class="dspIcons">
                            <img border="0"
                                 alt='<axis:alt f="${pantalla}" c="BT_DESC_RIE" lit="1000100"></axis:alt>'
                                 title='<axis:alt f="${pantalla}" c="BT_DESC_RIE" lit="1000100"></axis:alt>'
                                 src="images/firmar.gif" width="11px"
                                 height="11px"
                                 style="vertical-align:middle;cursor:pointer;"
                                 onclick="f_abrir_modal('axisctr044', false, '&CMODO=CONSULTA&NRIESGO=' + ${T_IAX_GESTRIESGOS.OB_IAX_GESTRIESGOS.NRIESGO});"/>
                        </div>                                                                    
                    </display:column>
                    </axis:visible>
                    <!-- FIN BUG CONF-114 - 17/09/2016 - JAEG-->
                    
                   </axis:visible>  
                    </display:table>
                    </div>
                    </axis:ocultar>

 <br />
<%--<axis:visible f="axisctr020" c="DSP_ASEGURADOS_INN">

<table class="area" align="center">
                 <td class="titulocaja" colspan="3">
                      <b><axis:alt f="axisctr019" c="CAGENTE" lit="108228"></axis:alt></b>
                 </td>
                <tr>   
                
                    <td class="campocaja" >
                       <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr020" c="NASE" lit="9907628" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr020" c="NOMASE" lit="9907629" /></c:set>
                         <c:set var="title2"><axis:alt f="axisctr020" c="FECASE" lit="9907630" /></c:set>
                         <c:set var="title3"><axis:alt f="axisctr020" c="SEXASE" lit="9907631" /></c:set>
                         <c:set var="title4"><axis:alt f="axisctr020" c="NIFASE" lit="9907632" /></c:set>
                          <display:table name="${ASEGURADOS_INNOM}" 
                                         id="ASEGURADOS" 
                                         export="false" 
                                         class="dsptgtable" 
                                         defaultsort="1"
                                         pagesize="6"  
                                         sort="list" 
                                         cellpadding="0" 
                                         cellspacing="0" 
                                        requestURI="axis_${pantalla}.do?paginar=true">
                                       
                               <%@ include file="../include/displaytag.jsp"%>
                              
                               <display:column title="${title0}" 
                                               sortable="false" 
                                               sortProperty="ASEGURADOS.NUM" 
                                               headerClass="headwidth5 sortable"  
                                               media="html" 
                                               autolink="false" >
                                          <div class="dspNumber">${ASEGURADOS.NUM}</div>
                               </display:column>
                               
                               <display:column title="${title1}" 
                                               sortable="false" 
                                               sortProperty="ASEGURADOS.NOMBRES" 
                                               headerClass="sortable"  
                                               media="html" 
                                               autolink="false" >
                                         <div class="dspText">${ASEGURADOS.NOMBRES}</div>
                               </display:column>
                               <display:column title="${title2}" 
                                               sortable="false" 
                                               headerClass="sortable"  
                                               media="html" 
                                               autolink="false" >
                                   
                                <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" 
                                    value="${ASEGURADOS.FNACIM}"/>
                                </div>
                                   
                                   
                               </display:column>    
                               <display:column title="${title3}" 
                                               sortable="false" 
                                               headerClass="sortable"  
                                               media="html" 
                                               autolink="false" >
                                          <div class="dspText">${ASEGURADOS.SEXO}</div>
                               </display:column>
                               <display:column title="${title4}" sortable="false" headerClass="sortable"  media="html" autolink="false" >
                                   <div class="dspText">${ASEGURADOS.NIF}</div>
                               </display:column>
                          </display:table>
                       </td>
                    </tr>
</table>
</axis:visible> --%>



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
                                
                                <axis:visible  f="${pantalla}" c="LAPIZ1">
                                <div style="float:right;" id="ASEGURADOS" c="LAPIZ1"></div>
                                </axis:visible>
                                
                                <div class="seccion_suplementos"  id="SECCION_ASEGURADOS"></div>                    
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
                                    <c:set var="title8"><axis:alt  f="${screenName}" c="ASSEGURADOS" lit="100899" /></c:set>
                                    <display:table name="${OB_IAX_RIESGOS.RIESGOASE}"
                                                   id="PROPIETARIO"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_${pantalla}.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        
                                         <display:column title="${title8}" 
                                                        style="width:15%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html" 
                                                        autolink="false">
                                             <div class="dspText">
                                                ${PROPIETARIO.OB_IAX_ASEGURADOS.NORDEN}
                                            </div>
                                        </display:column>
                                        
                                        
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
                                         <!-- INI CONF-1332_QT1987 - 23/03/2018 - JLTS Se condiciona la feccha de nacimeinto y género solo para los naturales 1-->
                                        <c:if test="${PROPIETARIO.OB_IAX_ASEGURADOS.CTIPPER == 1}">  
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
                                        </c:if>
                                        <!-- FIN CONF-1332_QT1987 - 23/03/2018 - JLTS Se condiciona la feccha de nacimeinto y género solo para los naturales 1-->
								<axis:visible f="axisctr020" c="FFECFIN">
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
								</axis:visible>
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
                                        <axis:visible f="axisctr020" c="BT_CON_FIND_ASE"> 
                                            <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img id="find" border="0" c = "BT_CON_FIND_ASE" src="images/find.gif" onclick="javascript:f_consultar_persona('${PROPIETARIO.OB_IAX_ASEGURADOS.SPERSON}');" style="cursor:pointer"/>
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
         <axis:visible c="DSP_CONDUCTORES" f="${pantalla}">  
        <c:if test="${!empty OB_IAX_RIESGOS.RIESAUTOS}">           
                <table class="area" align="center">                    
                        <tr>
                            <td class="campocaja">                               
                                <div style="float:left;">
                                    <img id="CONDUCTORES_RIESGO_parent"
                                         src="images/mes.gif"
                                         onclick="objEstilos.toggleDisplay('CONDUCTORES_RIESGO', this)"
                                         style="cursor:pointer"/>                                     
                                    <b><axis:alt f="${pantalla}" c="TIT_CONDUCT" lit="9001186"></axis:alt></b>
                                    &nbsp;&nbsp;<c:if test="${!empty OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0] && 
                                    OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.CPRINCIPAL == 1}" >
                                    <c:choose>
                                            <c:when test="${empty OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.SPERSON}">
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.FNACIMI} 
					    -
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.TSEXO} 
                                            </c:when>
                                            <c:otherwise>
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI1}
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI2}
					    ,
                                            ${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE}
                                            </c:otherwise>
                                            </c:choose>
                                            - 
					    <fmt:formatDate pattern="dd/MM/yyyy" 
					    value="${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES[0].OB_IAX_AUTCONDUCTORES.FCARNET}"/>
                                            </c:if>
                                </div>
                                
                                <axis:visible  f="${pantalla}" c="LAPIZ1">
                                <div style="float:right;" id="CONDUCTORES" c="LAPIZ1"></div>
                                </axis:visible>
                                
                                <div class="seccion_suplementos"  id="SECCION_CONDUCTORES"></div>
                                <div style="clear:both;">
                                    <hr class="titulo"></hr>
                                </div>
                            </td>
                        </tr>
                        <tr id="CONDUCTORES_RIESGO_children"
                            style="display:none">
                            <td class="campocaja">
                                <div class="displayspace">
                                    <c:set var="title0"><axis:alt f="${pantalla}" c="TIT_CONDUCT" lit="9001186"></axis:alt></c:set>
                                    <c:set var="title1"><axis:alt f="${pantalla}" c="FCARNET" lit="9001171"></axis:alt></c:set>
                                    <c:set var="title2"> <axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"></axis:alt></c:set>
                                    <c:set var="title3"><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940"></axis:alt></c:set>
                                    <c:set var="title4"><axis:alt f="${pantalla}" c="FNACIMI" lit="100959"></axis:alt></c:set>
                                    <c:set var="title5"><axis:alt f="${pantalla}" c="TEXPER" lit="100962"></axis:alt></c:set>
                                    <c:set var="title6"><axis:alt f="${pantalla}" c="TDOMICI" lit="105889"></axis:alt></c:set>
                                    <c:set var="title7"><axis:alt f="${pantalla}" c="EXPER_MANUAL" lit="9905038"></axis:alt></c:set>  
                                    <display:table name="${OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES}"
                                                   id="CONDUCTORES"
                                                   export="false"
                                                   class="dsptgtable"
                                                   pagesize="-1" 
                                                   sort="list"
                                                   cellpadding="0"
                                                   cellspacing="0"
                                                   requestURI="axis_${pantalla}.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                        <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" 
                                                        style="width:5%;position:center"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.CPRINCIPAL"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"  
                                                        autolink="false">
                                             <div class="dspIcons">
                                            <input type="checkbox"
                                                                       name="CPRINCIPAL"
                                                                       <c:if test="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.CPRINCIPAL == 1}"> checked</c:if>
                                                                       <axis:atr f="${pantalla}" c="CPRINCIPAL" a="modificable=false"/>
                                                                       disabled="disabled"/>                                               
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.FCARNET"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.FCARNET}"/>
                                            </div>
                                        </display:column>
                                        <axis:visible c="NPUNTOS_CONDUCTOR" f="${pantalla}">  
                                        <display:column title="${title2}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.NPUNTOS"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspNumber">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.NPUNTOS}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <display:column title="${title3}"
                                                        sortable="true" 
                                                        style="width:30%"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.TNOMBRE"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                            <c:choose>
                                            <c:when test="${empty CONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON}">
                                            <fmt:formatDate pattern="dd/MM/yyyy" 
					    value="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.FNACIMI}"/> 
					    - 
					    ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TSEXPER} 
                                            </c:when>
                                            <c:otherwise>
                                            	${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.NNUMIDE} - 
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI1}
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI2}
                                            ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE}
                                            </c:otherwise>
                                            </c:choose>                                                
                                            </div>
                                        </display:column>   
                                        <display:column title="${title4}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.PERSONA.FNACIMI"
                                                        headerClass="headwidth10 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                                <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.FNACIMI}"/> 
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.PERSONA.TSEXPER"
                                                        headerClass="headwidth10 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TSEXPER} 
                                            </div>
                                        </display:column>  
                                        <display:column title="${title6}" 
                                                        style="width:25%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.TDOMICI"
                                                        headerClass="headwidth10 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.TDOMICI} 
                                            </div>
                                        </display:column> 
                                        <display:column title="${title7}" 
                                                        style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.EXPER_MANUAL"
                                                        headerClass="headwidth10 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspText">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.EXPER_MANUAL} 
                                            </div>
                                        </display:column> 
                                        <axis:visible f="axisctr020" c="BT_CON_FIND_COND"> 
                                            <display:column title="Consultar" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img id="find" border="0" src="images/find.gif" onclick="javascript:f_consultar_persona('${CONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON}');" style="cursor:pointer"/>
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
                <axis:visible f="${pantalla}" c="DSP_TOT_PREGUNTAS_RIESGO" >
                    <%--c:if test="${!empty OB_IAX_RIESGOS.PREGUNTAS || !empty  OB_IAX_RIESGOS.pregQuestSalut || !empty  OB_IAX_RIESGOS.pregDespeses}"--%>
                      <c:import url="axisctr020_riesgo_preguntas.jsp"/>
                    <%--/c:if--%>
                    </axis:visible>
                </table>
                  
                        <table class="area" align="center">
                        	<axis:visible c="DSP_GARANTIAS" f="${pantalla}">  
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_GARANTIAS_parent" 
					src="images/mes.gif" 
					onclick="objEstilos.toggleDisplay('DSP_GARANTIAS', this)" 
					style="cursor:pointer"/> 
					
					<c:set var="temp1" value="${sessionScope.garantiasGeneral}" />
						  <c:forEach items="${temp1}" var="item" varStatus="status">
					   <!-- INI - IAXIS-15524 - JLTS - 12/08/2021 -->
					    <c:set var="crea" value="${sessionScope.creaseg}" />
					    <c:forEach items="${crea}" var="item" varStatus="theCount">
					    <c:if test="${temp1[status.count-1].OB_IAX_GARANTIAS.CGARANT == crea[theCount.count-1]}">
					      <c:set var="AcumuladoPago" value="${AcumuladoPago + temp1[status.count-1].OB_IAX_GARANTIAS.ICAPITAL}"/>
                        </c:if>
                        </c:forEach>
                        <!-- FIN - IAXIS-15524 - JLTS - 12/08/2021 -->
                      </c:forEach> 
   

                       <b><axis:alt f="${pantalla}" c="DSP_GARANTIAS" lit="1000183"/></b> <axis:alt f="${pantalla}" c="ICAPITAL" lit="9906516" />:&nbsp;&nbsp;
					   <fmt:formatNumber pattern="###,###,###,###,###,###.##" value="${AcumuladoPago}"/>
					</div>
                                     <axis:visible c="IMPDETALLE" f="${pantalla}">
                                     <div style="float:right;" id="IMPDETALLE">
                                   
                                          <a href="javascript:f_but_docdetalleprimas()"> <img border="0" onclick="javascript:f_but_docdetalleprimas()" alt="<axis:alt f="axisctr020" c="DOCPOL" lit="9002213"/>"   title="<axis:alt f="axisctr020" c="DOCPOL" lit="9903815"/>" src="images/print.gif"/></a>
                                       
                                        </div> </axis:visible>
                                    <axis:visible f="${pantalla}" c="LAPIZ1" >
                                    <div style="float:right;" id="GARANTIAS" c="LAPIZ1"></div>
                                    </axis:visible>
                                    <div class="seccion_suplementos" id="SECCION_GARANTIAS"></div>
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
                            
                            <!-- INI BUG 41143/229973 - 17/03/2016 - JAEG -->
                            <c:set var="title16"><axis:alt f="${pantalla}" c="FINIVIG" lit="9908885"/></c:set>     <!-- FINIVIG -->
                            <c:set var="title17"><axis:alt f="${pantalla}" c="FFINVIG" lit="9908886"/></c:set>     <!-- FFINVIG -->
                            <c:set var="title18"><axis:alt f="axisctr207" c="CCOBPRIMA" lit="9909252"/></c:set>    <!-- CCOBPRIMA -->
                            <c:set var="title19"><axis:alt f="axisctr207" c="IPRIDEV" lit="9909251"/></c:set>      <!-- IPRIDEV -->                              
                            <!-- FIN BUG 41143/229973 - 17/03/2016 - JAEG -->
                            
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
                             <!-- BUG: 0027953/0151258 - JSV 21/08/2013  - INI-->
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
                             <!-- BUG: 0027953/0151258 - JSV 21/08/2013  - FIN -->
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
                                                value="<fmt:formatNumber pattern='"###,###,###,###,###,###.##"' value='<%= ((HashMap)garantias_entrada.get(j)).get("ICAPITAL") %>'/>"/>
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
                                                value="<fmt:formatNumber pattern='###,###,###,###,###,###.##' value='<%= ((HashMap)garantias_entrada.get(j+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <% } %>  
                      <%}%>                        
                      <!--INI-CONF-209 - VLCG -->
                      <td align="right">
                                <axis:visible f="axisctr020" c="BT_CONVPESOS">
                                    <input type="button" class="boton" id="but_convpesos" value="<axis:alt f="axisctr020" c="BT_CONVPESOS" lit="9908899"></axis:alt>" onclick="f_convpesos()" />
                                </axis:visible>
                      </td>
                      <!--FIN-CONF-209 - VLCG -->
                      </table> 
                      <c:if test="${!empty sessionScope.garantiasGeneral}">
                  
                    	 <c:if test="${! empty sessionScope.axisctr_partidas  }">
					                  <c:import url="axisctr020_partidas.jsp"/>
					                </c:if>
                          <axis:ocultar f="axisctr020" c="GARANTIAS">
                        
                                
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
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:ocultar f="${pantalla}" c="FINIVIG" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:ocultar>                                            
                                            <axis:ocultar f="${pantalla}" c="FFINVIG" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:ocultar>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                                
                                            
                                            <axis:visible f="${pantalla}" c="GAR_ICAPITAL">    
                                                <th style="width:10%;height:0px"></th>
                                             </axis:visible>  
                                              <%--axis:visible f="axisctr020" c="CAPRECOMEND"> 
                                                <th style="width:10%;height:0px"></th>
                                              </axis:visible--%>
                                            <axis:visible f="${pantalla}" c="CMONCAP">
                                                <th style="width:8%;height:0px;"></th>
                                            </axis:visible>                                            
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                            
                                           <axis:visible f="${pantalla}" c="CCOBPRIMA" >
                                                <th style="width:3%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="IPRIDEV" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>                                             
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            
                                            <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                <th style="width:10%;height:0px"></th>
                                            </axis:visible>
                                            <c:if test="${!empty NDET && NDET==1}" >
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
                                                <th class="sortable"><b>${title0}</b></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="TGARANT">
                                                <th class="sortable"><b>${title1}</b></th>
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="${pantalla}" c="FINIVIG">
                                                <th class="sortable"><b>${title16}</b></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="FFINVIG">
                                                <th class="sortable"><b>${title17}</b></th>
                                            </axis:visible>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                                
                                            
                                            <axis:visible f="${pantalla}" c="GAR_ICAPITAL">
                                                <th class="sortable"><b>${title2}</b></th>                                        
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="CMONCAP">
                                                <th class="sortable"><b>${title11}</b></th>                                        
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="${pantalla}" c="CCOBPRIMA">
                                                <th class="sortable"><b>${title18}</b></th>
                                            </axis:visible>
                                            <axis:visible f="${pantalla}" c="IPRIDEV">
                                                <th class="sortable"><b>${title19}</b></th>
                                            </axis:visible>
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                             
                                            
                                            <axis:visible f="${pantalla}" c="GAR_IPRITOT">
                                                <th class="sortable"><b>${title3}</b></th>                                        
                                            </axis:visible>
                                               <axis:visible f="${pantalla}" c="GAR_ITOTANU">
                                                <th class="sortable"><b>${title10}</b></th>                                        
                                            </axis:visible>
                                            <c:if test="${!empty NDET && NDET==1}">
                                                 <th class="sortable"><b>${title7}</b></th>    
                                                 <th class="sortable"><b>${title5}</b></th>    
                                                 <th class="sortable"><b>${title6}</b></th>    
                                                 <th class="sortable"><b>${title8}</b></th>    
                                                 <th class="sortable"><b>${title9}</b></th>    
                                            </c:if>                 
                                            <axis:visible f="${pantalla}" c="DETGARANT">
                                                  <th class="sortable"><b>${title4}</b></th>                                        
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
                                                                    <img id="img_DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" src="images/mes.gif" onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this)" style="cursor:pointer"/> 
                                                                       
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                  <img id="img_DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" src="images/blank.gif"  style="cursor:pointer"/> 
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
                                                      
                                                      <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                      <axis:visible f="${pantalla}" c="FINIVIG">
                                                        <td class="dspText">   
                                                            <div class="dspText">
                                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FINIVIG}"/>
                                                            </div>
                                                        </td>
                                                      </axis:visible>
                                                      
                                                      <axis:visible f="${pantalla}" c="FFINVIG">
                                                        <td class="dspText">   
                                                            <div class="dspText">
                                                                <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FFINVIG}"/>
                                                            </div>
                                                        </td>
                                                      </axis:visible>                                                      
                                                      <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                      
                                                      
                                                      <axis:visible f="axisctr020" c="GAR_ICAPITAL">
                                                            <td class="dspNumber">   
                                                                <div class="dspNumber">
                                                                   <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"
                                                                                  pattern="###,###,###,###,###,###.##"/>
                                                                    <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE  && miListaIdGarantias.OB_IAX_GARANTIAS.CDETALLE == 1 && fn:length(miListaIdGarantias.OB_IAX_GARANTIAS.DESGLOSE) > 0}">
                                                                           <a onclick ="f_abrir_axisctr163('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT }')">
                                                                             <img  src="images/mes.gif" title='<axis:alt f="${pantalla}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'   alt='<axis:alt f="${pantalla}" c="LIT_DESGLOSE" lit="180183"></axis:alt>'>
                                                                           </a>  
                                                                    </c:if>      
                                                                </div>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axisctr020" c="CMONCAP">
                                                                <td class="dspText">   
                                                                    <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                                      ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                                     </div>
                                                                </td>
                                                        </axis:visible>
                                                        
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                          <axis:visible f="${pantalla}" c="CCOBPRIMA">
                                                            <td class="dspText">   
                                                                <input <axis:atr f="${pantalla}" c="CCOBPRIMA" a="modificable=false&isInputText=false"/>                                                                              
                                                                    type="checkbox"
                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CCOBPRIMA == '1'}">checked="true"</c:if> 
                                                                    id="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                    name="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"/>
                                                            </td>
                                                          </axis:visible>
                                                          
                                                          <axis:visible f="${pantalla}" c="IPRIDEV">
                                                            <td class="dspText">   
                                                                <div class="dspText">
                                                                    <fmt:formatNumber value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIDEV}" pattern="${__formatNumberPatterns[CMONPRODINT]}"/>
                                                                </div>
                                                            </td>
                                                          </axis:visible>                                                     
                                                          <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                                        
                                                        
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
                                                               
                                                        <c:if test="${!empty NDET  && NDET==1}">
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
                                                                             <axis:visible f="${pantalla}" c="LIT_DETGAR">
                                                                             <div class="dspIcons">
                                                                               <img border="0"
                                                                                 alt='<axis:alt f="${pantalla}" c="LIT_DETGAR" lit="1000196"></axis:alt>'                                                        
                                                                                 title1='<axis:alt f="${pantalla}" c="LIT_DETGAR" lit="1000196"></axis:alt>'
                                                                                 src="images/mas.gif"
                                                                                 width="11px" height="11px"
                                                                                 style="cursor:pointer;"
                                                                                 onclick="f_abrir_axisctr030('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', '${OB_IAX_RIESGOS.NRIESGO}', '${miListaIdGarantias.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}')"/>
                                                                            </div>
                                                                            </axis:visible>
                                                                      </td>
                                                            </axis:visible>
                                                                   
                                                        </tr>
                                                        <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                <c:set scope="session" var="hijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                                                                    <c:import url="axisctr020_hijos.jsp">
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
                                                    value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </axis:visible>
                                          
                                        <% } %> 
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_3}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" readonly
                                                    formato="decimal"  title="" size="15" 
                                                    value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </axis:visible>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("TGARANT")!=null ) { %>
                                            <axis:visible f="${pantalla}" c="${CGARANT_4}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" readonly
                                                    formato="decimal" title="" size="15" 
                                                    value="<fmt:formatNumber pattern="###,###,###,###,###,###.##" value='<%= ((HashMap)garantias_salida.get(h+2)).get("ICAPITAL") %>'/>"/>
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
                               <axis:visible f="axisctr020" c="DSP_TOT_FRANQUICIAS" >
                                  <%--c:if test="${!empty OB_IAX_RIESGOS.BONFRANSEG || !empty OB_IAX_RIESGOS.franqlibres || !empty  OB_IAX_RIESGOS.franqtecnicas || !empty  OB_IAX_RIESGOS.franqtecnicaslibres  || !empty  OB_IAX_RIESGOS.bonusmalus || !empty  OB_IAX_RIESGOS.bonusmaluslibres}"--%>
                                  <c:import url="axisctr020_riesgo_franquicias.jsp"/>
                                <%--/c:if--%>
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
                <!-- bug 24735.NMM.#6.i.02/2013 Afegir camps imports pagues extra -->
                <tr class="gridNotEven">
                <td>  <!-- Import paga renda mes Gener .i.-->
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
                <td>   <!-- Import paga renda mes Abril .i.-->
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
                     <td>   <!-- Check box Abril -->
                            <input type="checkbox" name="CPAGA4" id="CPAGA4"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES4 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Juliol .i.-->
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
                     <td> <!-- Check box Juliol -->
                            <input type="checkbox" name="CPAGA7" id="CPAGA7"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES7 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Octubre -->
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
                     <td> <!-- Check box Octubre -->
                            <input type="checkbox" name="CPAGA10" id="CPAGA10"
                            <c:if test="${datos_poliza.NMESEXTRA.NMES10 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>

                <tr class="gridEven">
                <td> <!-- Import paga renda mes Febrer .i.-->
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
                     <td> <!-- Check box Febrer -->
                        <input type="checkbox" name="CPAGA2" id="CPAGA2"
                         <c:if test="${datos_poliza.NMESEXTRA.NMES2 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
            
                <td> <!-- Import paga renda mes Maig .i.-->
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
                     <td> <!-- Check box Maig -->
                        <input type="checkbox" name="CPAG5" id="CPAGA5"
                        <c:if test="${datos_poliza.NMESEXTRA.NMES5 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Agost .i.-->
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
                     <td> <!-- Check box Agost -->
                          <input type="checkbox" name="CPAGA8" id="CPAGA8"
                           <c:if test="${datos_poliza.NMESEXTRA.NMES8 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Novembre .i.-->
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
                     <td> <!-- Check box Novembre -->
                          <input type="checkbox" name="CPAGA11" id="CPAGA11"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES11 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>
                
                <tr class="gridNotEven">
                <td> <!-- Import paga renda mes Març .i.-->
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
                     <td> <!-- Check box Març -->
                          <input type="checkbox" name="CPAGA3" id="CPAGA3"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES3 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Juny .i.-->
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
                     <td> <!-- Check box Juny -->
                          <input type="checkbox" name="CPAGA6" id="CPAGA6"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES6 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Setembre .i.-->
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
                     <td> <!-- Check box Setembre -->
                          <input type="checkbox" name="CPAGA9" id="CPAGA9"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES9 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>

                <td> <!-- Import paga renda mes Desembre .i.-->
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
                     <td> <!-- Check box Desembre -->
                          <input type="checkbox" name="CPAGA12" id="CPAGA12"
                          <c:if test="${datos_poliza.NMESEXTRA.NMES12 == 1}"> checked</c:if> disabled>
                     </td>
                    </tr>
                  </table>
                </td>
                </tr>
             </table>   
            </td>           
        </table>    
      </c:if>
    </axis:visible>       
    <div class="separador">&nbsp;</div> 
    <c:if test="${!empty sessionScope.rentasIrregulares}">
    <div class="separador">&nbsp;</div> 
                       
                             <tr>
                                 <td class="campocaja" >
                                    <div style="float:left;">
                                        <img id="DSP_RENTASIRR_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_RENTASIRR', this)" style="cursor:pointer"/> 
                                        <b><axis:alt f="${pantalla}" c="LIT_RENTASIRR" lit="1000344"></axis:alt></b>
                                    </div>
  
                                    <div style="clear:both;">
                                        <hr class="titulo">
                                    </div>
                                </td>
                             </tr>
                             <tr id="DSP_RENTASIRR_children" style="display:none">
                                <td>
                                  
                                  <table cellpadding="0" class="dsptgtable grid" cellspacing="0" style="border-width:1px;border-color:#CCCCCC;border-right-width: 0px;margin-right: 0px;padding-right: 0px;">
                                  <thead>                                 
                                    <tr>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="ANYO" lit="101606"></axis:alt></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES1" lit="1000278" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES2" lit="1000279" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES3" lit="1000280" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES4" lit="1000281" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES5" lit="1000282" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES6" lit="1000283" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES7" lit="1000284" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES8" lit="1000285" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES9" lit="1000286" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES10" lit="1000287" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES11" lit="1000288" /></b></td>
                                        <td class="headwidth10 sortable gridsorted gridasc" style="width:7.8%;"><b><axis:alt f="${pantalla}" c="MES12" lit="1000289" /></b></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.rentasIrregulares}" var="lista" varStatus="i">
                                    
                                      <tr  class="gridNotEven">
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.ANYO}                                              
                                        </td>
                                        <td class="campocaja"  align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES1}                                         
                                        </td>
                                        <td class="campocaja"  align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES2}                                         
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES3}                                         
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES4}                                           
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES5}                                         
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES6}                                           
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES7}                                          
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES8}                                        
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES9}                                           
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES10}                                          
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES11}                                          
                                        </td>
                                        <td class="campocaja" align="center">
                                            ${lista.OB_IAX_RENTAIRR.MES12}                                         
                                        </td>
                                    </tr>
                                    </c:forEach>
                                  </tbody>
                                  </table>                                 
                                </td>
                            </tr>                        
                    </c:if>
                    
       <axis:ocultar f="${pantalla}" c="DSP_CLAUSULASRIE" dejarHueco="false">
        <c:if test="${! empty clausulasespries}">
                <tr>
                    <td class="campocaja" >
                        <div style="float:left;">
                        <img id="DSP_CLAUSULASRIE_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_CLAUSULASRIE', this)" style="cursor:pointer"/>
                        <b><axis:alt f="${pantalla}" c="CLAUSULARIE_TIT" lit="101791"/></b>
                        </div>
                        
                        <axis:visible  f="${pantalla}" c="LAPIZ1">
                        <div style="float:right;" id="CLAUSULASRIE" c="LAPIZ1"></div>
                        </axis:visible>
                        
                        <div class="seccion_suplementos" id="SECCION_CLAUSULASRIE"></div>
                        <div style="clear:both;">
                        <hr class="titulo">
                        </div>

                    </td>
                </tr>
                <tr id="DSP_CLAUSULASRIE_children" style="display:none">
                    <td class="campocaja" >
                      
                       
                        <c:if test="${!empty clausulasespries}">
                        <b><axis:alt f="${pantalla}" c="CLAUSULASRIE_ESP" lit="1000084"/></b>
                        <!-- DisplayTag clausulasEspecificas -->
                        <c:set var="title1"><axis:alt f="${pantalla}" c="CLAUSULARIE_ESP_TIT1" lit="800440"/></c:set>
                        <c:set var="title2"><axis:alt f="${pantalla}" c="CLAUSULARIE_ESP_TIT2" lit="101805"/></c:set>
                        <div class="displayspace">

                            <%-- <axis:tabla name="${clausulasespries}" miid="clausulasespries" objeto="OB_IAX_CLAUSULAS" campos="CIDENTITY(O)#TCLAESP(O)" estilos="dspNumber#dspText" titulos="${title1}@@${title2}"
                                columnHeaderClass="headwidth5 sortable#sortable" cellpadding="0" cellspacing="0"/>
                                --%>
                            <display:table name="${clausulasespries}" id="clausulasespries" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                        <div class="dspNumber">${clausulasespries.OB_IAX_CLAUSULAS.CIDENTITY}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAXPAR_CLAUSULAS.TCLAESP" headerClass="sortable"  media="html" autolink="false" >
                                        <axis:visible f="${pantalla}" c="CLAU_TIT">
										<div class="dspText">${clausulasespries.OB_IAX_CLAUSULAS.TCLAGEN} - ${clausulasespries.OB_IAX_CLAUSULAS.TCLAESP}</div>
										</axis:visible>
										<axis:visible f="${pantalla}" c="CLAU_NO_TIT">
										<div class="dspText">- ${clausulasespries.OB_IAX_CLAUSULAS.TCLAESP}</div>
										</axis:visible>
                                    </display:column>
                                    
                                </display:table>    

                        </div>
                        <br />
                        </c:if>
                    </td>
                </tr>
        </c:if>
        </axis:ocultar>             
                    
                           </td>
                            </tr>
                        </table>
                  <c:if test="${GARANTIAS.OB_IAX_GARANTIAS.MASDATOS.NDETGAR != null}">
                    <c:import url="axisctr020_garantias_provision.jsp"/>
                  </c:if>     
                  <c:import url="axisctr020_riesgo_beneficiarios.jsp"/>
                  <c:import url="axisctr020_riesgo_siniestros.jsp"/>
                  	
</c:if>
