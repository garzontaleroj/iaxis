<%/* Revision:# Zi5V0nE2tFjVmxfWuAtEbQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
                     
        <input type="hidden" name="SPERSONID" id="SPERSONID" value="${__formdata.SPERSON}"/>
                                        
        <axis:visible c="DSP_RIESGOS" f="axisctr100">  
        <tr>
           <td>
                <!-- Datos Riesgo -->
                <c:set var="title1"><axis:alt f="axisctr100" c="NRIESGO" lit="100649" /></c:set>
                <c:set var="title2"><axis:alt f="axisctr100" c="TRIESGO" lit="100588" /></c:set>
                <c:set var="title3"><axis:alt f="axisctr100" c="PRIMATOTAL" lit="9908990" /></c:set>
                <c:set var="title4"><axis:alt f="axisctr100" c="RIESGOMODIFICAR" lit="1000183" /></c:set>                                
                <div class="displayspace">
                  <display:table name="${sessionScope.axisctr100_datosRiesgo}" id="miListaId_1" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                   requestURI="axis_axisctr100.do?paginar=true">
                    <%@ include file="../include/displaytag.jsp"%>
                    <axis:visible c="DSP_GARANTIES" f="axisctr100">
                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                        <div class="dspIcons"><input  <c:if test="${OB_IAX_RIESGOS.NRIESGO == miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO || miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO == __formdata.NRIESGO}">checked</c:if> onClick="javascript:f_getRiesgo('${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}')" 
                        value="${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}" type="radio" id="radioNRIESGO" name="radioNRIESGO"/></div>
                    </display:column>   
                    </axis:visible>                                 
                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.NRIESGO" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspText">${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}</div>
                    </display:column>
                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.TRIESGO" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspText" id="TRIESGO">${miListaId_1.OB_IAX_GESTRIESGOS.TRIESGO}</div>
                    </display:column>
                    <axis:visible f="axisctr100" c="PRIMATOTAL">
                     <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_GESTRIESGOS.PRIMATOTAL" headerClass="sortable" media="html" autolink="false" >
                        <div class="dspNumber" id="PRIMATOTAL"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='${miListaId_1.OB_IAX_GESTRIESGOS.PRIMATOTAL}'/></div>
                    </display:column>
                     </axis:visible> 
                    <display:column title="" sortable="false" sortProperty="esAsegurado" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspIcons"><a href="javascript:f_borrar_riesgo('${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}',this)" id="BT_DEL_RIESGO"><img border="0" alt="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                    </display:column>
                    <axis:visible f="axisctr100" c="BT_EDITRIESGO_MODIFICAR">
                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                      <%--  <div class="dspIcons"><a href="javascript:f_abrir_axisctr101('${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" title="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" src="images/lapiz.gif"/></a></div> --%>
                    <div class="dspIcons"><a href="javascript:f_modificar_riesgo('${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}')" id="BT_MODIF_RIESGO"><img border="0" alt="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" title="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" src="images/lapiz.gif"/></a></div>
                   
                    </display:column>
                    </axis:visible>
                    <axis:visible f="axisctr100" c="DSP_GARANTIES_MASDATOS">
                    <display:column title="${title4}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                        <div class="dspIcons"><a href="javascript:f_validar_garantias('${miListaId_1.OB_IAX_GESTRIESGOS.NRIESGO}');" id="BT_MASDAT_RIESGO"><img border="0" align = "middle" alt="<axis:alt f="axisctr100" c="MAS" lit="180183"/>"  title="<axis:alt f="axisctr100" c="MAS" lit="180183"/>" src="images/mas.gif"/></a></div>
                    </display:column>
                    </axis:visible>
                </display:table>
                </div>
            </td>
        </tr>
        <tr>
                                   <tr>
                            <td align="right" colspan="4">
                                <div class="separador">&nbsp;</div>
                                <axis:visible f="axisctr100" c="BT_EDITRIESGO_ANADIR">
                                    <input type="button" class="boton" id="but_anadir_riesgo" value="<axis:alt f="axisctr100" c="BUTANADIR" lit="104825" />" onclick="f_anyadir_riesgo('0','ASEGURADO')" />
                                </axis:visible>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>     

        </tr> 
        </axis:visible>  
        
        <axis:visible c="DSP_ASEGURADOS" f="axisctr100">
        <tr>
            <td>
                <table class="area" align="center">    
                    <tr>
                        <td>
                            <div style="clear:both;" class="titulo">
                            <div style="float:left;">
                                <img src="images/flecha.gif"/><axis:alt c="DSP_ASEGURADOS" f="axisctr100" lit="108228"/>&nbsp;&nbsp;&nbsp;<axis:visible c="PRIMATOTAL_RIESGO" f="axisctr100"><c:if test="${!empty sessionScope.axisctr100_datosRiesgo[0].OB_IAX_GESTRIESGOS.PRIMATOTAL}"><axis:alt c="ASEG_PRIMA" f="axisctr100" lit="102003"/><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPROD]}' value='${sessionScope.axisctr100_datosRiesgo[0].OB_IAX_GESTRIESGOS.PRIMATOTAL}'/></c:if></axis:visible>   
                            </div>
                            <axis:visible c="IMG_ASEG_GAR" f="axisctr100">
                            <div style="float:right;">
                                <c:if test="${!empty sessionScope.axisctr100_datosRiesgo[0].OB_IAX_GESTRIESGOS.NRIESGO}"><axis:alt f="axisctr100" c="IMG_ASEG_GAR" lit="180183"/>  <a href="javascript:f_prueba('${sessionScope.axisctr100_datosRiesgo[0].OB_IAX_GESTRIESGOS.NRIESGO}')"><img border="0" alt="<axis:alt f="axisctr100" c="IMG_ASEG_GAR" lit="180183"/>"   title="<axis:alt f="axisctr100" c="IMG_ASEG_GAR" lit="180183"/>" src="images/mas.gif"/></a></c:if>
                            </div>
                            </axis:visible></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="campocaja">
                            <div class="displayspace">
                                <c:set var="title0">
                                    <axis:alt f="axisctr100" c="RIESGOASE" lit="109774"/>
                                </c:set>                                 
                                <c:set var="title1">
                                    <axis:alt f="axisctr100" c="TTIPIDE" lit="105330"/>
                                </c:set>
                                 
                                <c:set var="title2">
                                    <axis:alt f="axisctr100" c="NNUMIDE" lit="105940"/>
                                </c:set>
                                <c:set var="title3">
                                    <axis:alt f="axisctr100" c="TNOMBRE" lit="1000064"/>
                                </c:set>
                                <c:set var="title4">
                                    <axis:alt f="axisctr100" c="TSEXPER" lit="100962"/>
                                </c:set>                                       
                                <c:set var="title5">
                                    <axis:alt f="axisctr100" c="FBAJA" lit="9001510" /><!-- Fecha baja -->
                                </c:set> 
                                <c:set var="title6">
                                    <axis:alt f="axisctr100" c="FNACIMI" lit="1000064" /><!-- Fecha nacimiento -->
                                </c:set> 
                                <display:table name="${OB_IAX_RIESGOS.RIESGOASE}"
                                               id="PROPIETARIO"
                                               export="false"
                                               class="dsptgtable"
                                               pagesize="-1" sort="list"
                                               cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisctr100.do?paginar=true&tabla=PREGUNTAS_RIESGO">
                                    <%@ include file="../include/displaytag.jsp"%>
                    <%--axis:visible c="DSP_ASEGPERSON" f="axisctr100">
                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                        <div class="dspIcons"><input  <c:if test="${OB_IAX_ASEGURADOS.SPERSON == radioSPERSON || PROPIETARIO.OB_IAX_ASEGURADOS.SPERSON == __formdata.SPERSONID}">checked</c:if> onClick="javascript:f_getPerson('${PROPIETARIO.OB_IAX_ASEGURADOS.SPERSON}')" 
                        value="${PROPIETARIO.OB_IAX_ASEGURADOS.SPERSON}" type="radio" id="radioSPERSON" name="radioSPERSON"/></div>
                    </display:column>   
                    </axis:visible--%>
                                    <axis:visible f="axisctr100" c="TTIPIDE">
                                    <display:column title="${title0}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TTIPIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html" 
                                                    autolink="false">
                                         <div class="dspText">${PROPIETARIO.OB_IAX_ASEGURADOS.TTIPIDE}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="NNUMIDE">
                                    <display:column title="${title1}" 
                                                    style="width:10%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.NNUMIDE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">
                                        
                                        <div class="dspText">${PROPIETARIO.OB_IAX_ASEGURADOS.NNUMIDE}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="TNOMBRE">
                                    <display:column title="${title2}" 
                                                    style="width:35%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TNOMBRE"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">
                                        
                                        <div class="dspText">${PROPIETARIO.OB_IAX_ASEGURADOS.TNOMBRE} ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI1} ${PROPIETARIO.OB_IAX_ASEGURADOS.TAPELLI2}</div>
                                    </display:column>  
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="FNACIMI">
                                    <display:column title="${title6}" 
                                        style="width:10%"
                                        sortable="true"
                                        sortProperty="OB_IAX_ASEGURADOS.FNACIMI"
                                        headerClass="headwidth5 sortable"
                                        media="html"
                                        autolink="false">
                                        
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${PROPIETARIO.OB_IAX_ASEGURADOS.FNACIMI}"/></div>
                                    </display:column>
                                    </axis:visible>
                                  <axis:visible f="axisctr100" c="TSEXPER">
                                  <display:column title="${title4}" 
                                                    style="width:15%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.TSEXPER"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">                                        
                                        <div class="dspText">${PROPIETARIO.OB_IAX_ASEGURADOS.TSEXPER}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="FFECFIN">
                                    <display:column title="${title5}" 
                                                    style="width:10%"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_ASEGURADOS.FFECFIN"
                                                    headerClass="headwidth5 sortable"
                                                    media="html"
                                                    autolink="false">
                                        
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${PROPIETARIO.OB_IAX_ASEGURADOS.FFECFIN}"/></div>
                                    </display:column> 
                                    </axis:visible>   
                                  
                                    <axis:visible f="axisctr100" c="BT_ASE_DEL">
                                    <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" style="width:5%" >
                                    
                                       <div class="dspIcons"><a href="javascript:f_borrar_aseg('${PROPIETARIO.OB_IAX_ASEGURADOS.SPERSON}',this)"><img border="0" alt="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                    </display:column>                        
                                    </axis:visible>
                                    <!-- Botones -->
                                </display:table>
                            </div>
                        </td>
                    </tr>                                                                        
                </table>
            </td>                                                    
        </tr>                                            
        <tr>

                            <td align="right" colspan="4">
                                <div class="separador">&nbsp;</div>
                                <axis:visible f="axisctr100" c="BT_EDITRIESGO_ANADIR">
                                    <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr100" c="BUTANADIR" lit="104825" />" onclick="f_anyadir_riesgo('0','ASEGURADO')" />
                                </axis:visible>
                                <div class="separador">&nbsp;</div>
                            </td>
                      

            </tr>
             
        </axis:visible>
        
        <axis:visible c="DSP_CONDUCTORES" f="axisctr100"> 
        <tr>
        <td colspan="10">
                <table class="area" align="center">
                    
                        <tr>
                            <td class="campocaja">
                                    <div style="clear:both;" class="titulo">
                            <div style="float:left;">
                                             <b><axis:alt f="axisctr009" c="CONDUCTORES_RIESGO" lit="9001186"/></b>
                            </div>
                            </div>
                       
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">
                                <div class="displayspace">
                                    <c:set var="title0">
                                        <axis:alt f="axisctr009" c="NORDEN" lit="9001168"/>
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
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.NORDEN"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"  
                                                        autolink="false">
                                             <div class="dspIcons">
                                            <input type="checkbox"
                                                                       name="NORDEN"
                                                                       <c:if test="${CONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN == 0}"> checked</c:if>
                                                                       <axis:atr f="axisctr009" c="NORDEN" a="modificable=false"/>
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
                                    <%--    <display:column title="${title2}" style="width:10%"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_AUTCONDUCTORES.NPUNTOS"
                                                        headerClass="headwidth5 sortable"
                                                        media="html"
                                                        autolink="false">
                                            <div class="dspNumber">
                                                ${CONDUCTORES.OB_IAX_AUTCONDUCTORES.NPUNTOS}
                                            </div>
                                        </display:column> --%>
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
                                        <axis:visible f="axisctr100" c="BT_EDITCONDUCTOR">
                                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons"><a href="javascript:f_anyadir_conductor('0')"><img border="0" alt="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" title="<axis:alt f="axisctr100" c="ABRIR" lit="100002"/>" src="images/lapiz.gif"/></a></div>
                                            </display:column>
                                        </axis:visible>
					<axis:visible f="axisctr100" c="BT_DELCONDUCTOR">		
                                        <display:column title="" sortable="false" sortProperty="esAsegurado" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                            <div class="dspIcons"><a href="javascript:f_borrar_conductor('${CONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON}',this)"><img border="0" alt="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" title="<axis:alt f="axisctr100" c="BORRAR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                        </display:column>
					</axis:visible>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                   </table>
                
        </td></tr>
        
                                          
        <tr>

                            <td align="right" colspan="4">
                                <div class="separador">&nbsp;</div>
                                <axis:visible f="axisctr100" c="BT_ANADIR_CONDUCTOR">
                                    <c:if test="${!empty OB_IAX_RIESGOS.NRIESGO && empty OB_IAX_RIESGOS.RIESAUTOS[0].OB_IAX_AUTRIESGOS.CONDUCTORES}"> 
                                        <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr100" c="CONDUCTORES_RIESGO" lit="104825"/>" onclick="f_anyadir_conductor('0')" />
                                    </c:if>
                                </axis:visible>
                                <div class="separador">&nbsp;</div>
                            </td>
                      

            </tr>
        </axis:visible>
        