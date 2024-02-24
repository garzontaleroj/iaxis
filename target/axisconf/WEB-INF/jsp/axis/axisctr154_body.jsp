<%/**
*  Fichero: axisctr154.jsp
*  @author <a href = "mailto:rsangros@csi-ti.com">Ricard Sangrós</a>
*  
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". És el cuerpo 
*
*
*  Fecha: 12/01/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>




<%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    ArrayList garantiasProductoEntrada = null;
    if (request.getSession().getAttribute("garantiasProductoEntrada") != null){
        garantiasProductoEntrada = (ArrayList)request.getSession().getAttribute("garantiasProductoEntrada");
    }
    
    ArrayList garantiasProductoSalida = null;
    if (request.getSession().getAttribute("garantiasProductoSalida") != null){
        garantiasProductoSalida = (ArrayList)request.getSession().getAttribute("garantiasProductoSalida");
    }
    
    ArrayList garantias_salida = null;
    if (request.getSession().getAttribute("garantiasSalida") != null){
        garantias_salida= (ArrayList)request.getSession().getAttribute("garantiasSalida");
    }
    
    ArrayList garantias_entrada = null;
    if (request.getSession().getAttribute("garantiasEntrada") != null){
        garantias_entrada= (ArrayList)request.getSession().getAttribute("garantiasEntrada");
    }
    
    
%>


<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr032"/>
        <c:set var="literalPantalla" value="1000198"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr154"/>
        <c:set var="literalPantalla" value="9900939"/>
    </c:otherwise>
</c:choose>


<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<c:if test="${param.multiPantalla != 'true'}">        
    <form name="${pantalla}Form" action="" method="POST">
    <input type="hidden" name="operation" value=""/>
    <c:set var="modalidad">
    <c:choose>
        <c:when test="${sessionScope.MODO eq 'SIMULACION'}">
        <fmt:message key="108021" />
        </c:when>
        <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
        <fmt:message key="101110" />
        </c:when>
        <c:otherwise>
        <fmt:message key="104752" />
        </c:otherwise>
    </c:choose>
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">${modalidad}</c:param>
        <c:param name="titulo"></c:param>
        <c:param name="formulario"><fmt:message key="${literalPantalla}" /></c:param>
        <c:param name="form">${pantalla}</c:param>
    </c:import>
</c:if>
    <!--VARIABLES PARA SEGUIMIENTO FLUJO -->
    <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
    <!--INICI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="ICAPITALH" name="ICAPITALH" value=""/>
    <input type="hidden" id="IPRITARH" name="IPRITARH" value=""/>
    <!--<input type="hidden" id="PREVALI" name="PREVALI" value=""/>-->
    <input type="hidden" id="IREVALI" name="IREVALI" value=""/>
    
    <c:if test="${__configform.axisctr154__CREVALI__visible == 'false'}">
    <input type="hidden" id="CREVALI" name="CREVALI" value="${sessionScope.axisctr_CREVALI}"/>
    </c:if>
    <c:if test="${__configform.axisctr154__PREVALI__visible == 'false'}">
    <input type="hidden" id="PREVALI" name="PREVALI" value="<fmt:formatNumber pattern='###,##0.00' value='${sessionScope.axisctr_PREVALI}'/>"/>
    <input type = "hidden" id = "label_PREVALI" name = "label_PREVALI">
    </c:if>
    <!--FI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="listaSelectedGarantias" name="listaSelectedGarantias" value=""/>
    <input type="hidden" name="CGARANT" id="CGARANT" value=""/>
    <input type="hidden" name="SELGAR" id="SELGAR" value=""/>
    <input type="hidden" name="hayCambios" id="hayCambios" value="${sessionScope.hayCambios}"/>
    <input type="hidden" name="ICAPITALSELECTED" id="ICAPITALSELECTED" value=""/>
    <input type="hidden" name="ICAPITALSELECTED_CONPUNTOS" id="ICAPITALSELECTED_CONPUNTOS" value=""/>
    <input type="hidden" name="IPRITARSELECTED" id="IPRITARSELECTED" value=""/>
    <input type="hidden" name="IPRITARSELECTED_CONPUNTOS" id="IPRITARSELECTED_CONPUNTOS" value=""/>
    <input type="hidden" name="ICAPITAL_MODIFICADO_TEMPORAL" id="ICAPITAL_MODIFICADO_TEMPORAL" value=""/>    
    <input type="hidden" name="IPRITAR_MODIFICADO_TEMPORAL" id="IPRITAR_MODIFICADO_TEMPORAL" value=""/>    
    <input type="hidden" name="FILAS_IRREGULARES" id="FILAS_IRREGULARES" value=""/>
    <input type="hidden" name="ULTIMA_FILA" id="ULTIMA_FILA" value=""/>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000185" /></c:param>
        <c:param name="nid" value="axisctr011" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000186" /></c:param>
        <c:param name="nid" value="axisctr012" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>

    
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <c:if test="${param.multiPantalla != 'true'}">        
                    <table class="seccion">
                        <tr>
                            <td style="font-size: 11px;">
                            <font color="#FF8400" ><b>
                                <axis:visible c="ETIQ_RISC" f="axisctr154">
                                    <axis:alt f="axisctr154" c="ETIQ_RISC" lit="100649"></axis:alt> 
                                </axis:visible>
                                ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>                
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr154" c="DSP_GARANTIAS" lit="1000183" ></axis:alt></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td>
                            
                            <!-- DisplayTag Garantías -->
                            <c:if test="${! empty sessionScope.axisctr_garantias}">
                                <c:set var="title0"><fmt:message key="100559"/></c:set>
                                <c:set var="title1"><fmt:message key="1000073"/></c:set>
                                <c:set var="title2"><fmt:message key="102995"/></c:set>
                                <c:set var="title3"><fmt:message key="140531"/></c:set>
                                <c:if test="${empty sessionScope.num_garantias || sessionScope.num_garantias == 0}">
                                    <c:set var="num_gar">15</c:set>
                                </c:if>
                                <c:if test="${!empty sessionScope.num_garantias && sessionScope.num_garantias > 0 }">
                                    <c:set var="num_gar">${sessionScope.num_garantias}</c:set><!--  -->
                                </c:if>             
                                
                                <div id="DSP_GARANTIAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_gar*80+20+20}"/>px">&nbsp;</div>
                                    <div id="dt_garantias" class="displayspace" style="height:${num_gar*20+20+20}px;max-height: ${num_gar*20+20+20}px;">   
                                    <display:table name="${sessionScope.axisctr_garantias}" id="miListaIdGarantias" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <%--<c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}"> disabled </c:if> --%>
                                            <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspIcons"><input onclick="javascript:f_actualiza_checkbox(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                    type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}"> checked </c:if> 
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}"> disabled </c:if>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled </c:if> 
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPGAR == 2}"> disabled </c:if>
                                                        /></div>
                                            </display:column>
                                            <axis:ocultar f="axisctr154" c="DESCRIPCION">
                                                <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                                </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr154" c="ICAPITAL">
                                                <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                    <c:set var="CAPITAL">
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                        </c:if>
                                                    </c:set>
                                                    <div class="dspIcons">
                                                        <c:set var="CLASS">
                                                            <%--<c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}">campo campotexto campodisabled</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>--%>
                                                            campo campotexto campodisabled
                                                        </c:set>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <input onfocus="javascript:f_on_focus_capital(this);"
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '3' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5'}">                                                            	
                                                                onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                            </c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '3' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'}"> readonly</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                                                                
                                                            type="text" id="ICAPITAL" name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="${CLASS}"
                                                            formato="decimal" title="<fmt:message key="1000073"/> <fmt:message key="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"/>
                                                        </c:if>
                                                    </div>
                                                </display:column>
                                            </axis:ocultar>
                                            <axis:visible f="axisctr154" c="IPRITAR">
                                                <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRITAR" headerClass="sortable"  media="html" autolink="false" >
                                                    <%--<div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/></div>--%>
                                                    <c:set var="PRITAR">
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'}">
                                                            <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>
                                                        </c:if>
                                                    </c:set>
                                                    <div class="dspIcons">
                                                        <c:set var="CLASS">
                                                            <%--<c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}">campo campotexto campodisabled </c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                            --%>
                                                            campo campotexto campodisabled
                                                        </c:set>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'}">
                                                            <input onfocus="javascript:f_on_focus_ipritar(this);"
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '3' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'}">                                                            	
                                                                onblur="javascript:f_selecciona_garantia_ipritar(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                            </c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '3' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5'}"> readonly</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                       
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}">disabled </c:if>
                                                            type="text" id="IPRITAR" name="IPRITAR" value="${PRITAR}" style="width:90px" class="${CLASS}"
                                                            formato="decimal" title="<fmt:message key="1000073"/> <fmt:message key="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"/>
                                                        </c:if>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5'}">
                                                            <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/></div>
                                                        </c:if>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr154" c="DETGARANT">
                                            <display:column media="html" title="D" headerClass="headwidth5 sortable" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}"> 
                                                            <div class="dspIcons"><a href="#">D</a></div>
                                                        </c:if>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE != '0'}"> 
                                                            <div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">D</a></div>
                                                        </c:if>                                                            
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspIcons">D</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr154" c="PREGGARANT">
                                                <display:column media="html" title="P" headerClass="headwidth5 sortable" autolink="false" >
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE == '0'}"> 
                                                        <div class="dspIcons"><a href="#">P</a></div>
                                                    </c:if>
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.EDITABLE != '0'}"> 
                                                        <div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">P</a></div>
                                                    </c:if>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr154" c="FRANGARANT">
                                                <display:column media="html" title="F" headerClass="headwidth5 sortable" autolink="false" >
                                                    <div class="dspIcons"><a href="#">F</a></div>
                                                </display:column>
                                            </axis:visible>
                                    </display:table>
                                </div>
                            </c:if>                  
                        </td>
                    </tr>
                
          
            <tr>
                <axis:visible f="axisctr154" c="but_tarifar"> 
                    <td align="center">
                        <div class="separador">&nbsp;</div>
                        <input type="button" class="boton" id="but_tarifar" value="<axis:alt f="axisctr154" c="BT_TARIFAR" lit="101688"></axis:alt>" onclick="javascript:f_tarifar()" />
                    <td>
                </axis:visible>
            </tr>
            <tr>
                <td align="center"> <div class="separador">&nbsp;</div> <td>
            </tr>
            <tr>
                <td align="center"> <div class="separador">&nbsp;</div> <td>
            </tr>
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr154" c="DSP_DETGARANTIAS" lit="1000196" ></axis:alt></div>
                    <!-- DisplayTag Garantías -->
                    <c:if test="${! empty sessionScope.axisctr_estdetgaranseg}">
                        <c:set var="title0"><fmt:message key="1000109"/></c:set>   <%-- Garantía  --%>
                        <c:set var="title1"><fmt:message key="100561"/></c:set>   <%-- Garantía  --%>
                        <c:set var="title2"><fmt:message key="1000073" /></c:set>
                        <c:set var="title3"><fmt:message key="1000497" /></c:set>
                        <c:set var="title4"><fmt:message key="9001755" /></c:set>
                        <c:set var="title5"><fmt:message key="100883"/></c:set>
                        <c:set var="title6"><fmt:message key="9000814"/></c:set>
                        <c:set var="title7"><fmt:message key="9001984"/></c:set>
                        <div class="displayspaceGrande">
                            <display:table name="${sessionScope.axisctr_estdetgaranseg}" id="axisctr_estdetgaranseg" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisctr154.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title0}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT}
                                    </div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.TGARANT}
                                    </div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                        ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.ICAPITAL}
                                    </div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.PRIMAS.IPRIANU" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                         ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.PRIMAS.IPRIANU}
                                    </div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.NDETGAR" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">
                                         ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.NDETGAR}
                                    </div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.FEFECTO" headerClass="headwidth10 sortable"  media="html" autolink="false" >                                            
                                     <div class="dspDate">
                                        <fmt:formatDate value="${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.FEFECTO}" pattern="dd/MM/yyyy"/>
                                     </div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.NDURCOB" headerClass="headwidth10 sortable"  media="html" autolink="false" >                                            
                                   <div class="dspNumber"> ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.NDURCOB} </div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.NDURCOB" headerClass="headwidth10 sortable"  media="html" autolink="false" >                                            
                                   <div class="dspNumber"> ${axisctr_estdetgaranseg.OB_IAX_GARANTIAS.MASDATOS.TUNICA} </div>
                                </display:column>
                            </display:table>                                                        
                        </div>
                    </c:if>                  
                </td>
            </tr>
        </table>

        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
        
        <div class="titulo"><img src="images/flecha.gif"/><fmt:message key="1000345" /></div>
                    <!--campos-->
                    <table class="seccion">
                    <tr>
                        <td align="left">
                            <!-- DisplayTag detalle primas -->
                            <c:set var="title0"><fmt:message key="1000497"/></c:set>         <!-- IPRIANU / IPRITOT -->
                            <c:set var="title1"><fmt:message key="101515"/></c:set>            <!-- IIPS -->
                            <c:set var="title2"><fmt:message key="1000498"/></c:set>         <!-- IDGS -->
                            <c:set var="title3"><fmt:message key="103101"/></c:set>           <!-- ICONSOR -->                            
                            <c:set var="title4"><fmt:message key="1000341"/></c:set>            <!-- IRECFRA -->
                            <c:set var="title5"><fmt:message key="101671"/></c:set>         <!-- PRECARG -->
                            <c:set var="title6"><fmt:message key="101918"/></c:set>         <!-- IEXTRAP -->                                        
                            <c:set var="title7"><fmt:message key="1000119"/></c:set>            <!-- PDTOCOM -->
                            <c:set var="title8"><fmt:message key="140531"/></c:set>    <!-- ITOTALR -->       
                            <c:set var="title9"><fmt:message key="1000496"/></c:set>         <!-- IPRITAR -->
                            <c:set var="title10"><fmt:message key="9000837"/></c:set>    <!-- IPRIREB -->
                            <div class="displayspace">
                                 <display:table name="${sessionScope.axisctr_primasTotales}" id="axisctr_primasTotales" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                  requestURI="axis_${pantalla}.do?paginar=true">
                                     <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisctr031" c="CIPRITAR">
                                         <display:column title="${title9}" sortable="false" sortProperty="IPRITAR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IPRITAR}'/></div>
                                         </display:column>
                                     </axis:visible> 
                                     <axis:visible f="axisctr031" c="IRECARG">
                                         <display:column title="${title5}" sortable="false" sortProperty="IRECARG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IRECARG}'/></div>
                                         </display:column>
                                     </axis:visible>                                    
                                     <axis:visible f="axisctr031" c="ITOTDTO">
                                         <display:column title="${title7}" sortable="false" sortProperty="ITOTDTO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.ITOTDTO}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="IPRITOT">
                                         <display:column title="${title0}" sortable="false" sortProperty="IPRITOT" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IPRITOT}'/></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="ICONSOR">
                                        <display:column title="${title3}" sortable="false" sortProperty="ICONSOR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.ICONSOR}'/></div>
                                        </display:column>                     
                                     </axis:visible>  
                                     <axis:visible f="axisctr031" c="IRECFRA">
                                         <display:column title="${title4}" sortable="false" sortProperty="IRECFRA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IRECFRA}'/></div>
                                         </display:column>                                                                                                                           
                                     </axis:visible>   
                                     <axis:visible f="axisctr031" c="IIPS">
                                         <display:column title="${title1}" sortable="false" sortProperty="IIPS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IIPS}'/></div>
                                         </display:column>  
                                     </axis:visible>   
                                     <axis:visible f="axisctr031" c="IDGS">
                                         <display:column title="${title2}" sortable="false" sortProperty="IDGS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IDGS}'/></div>
                                         </display:column>
                                     </axis:visible> 
                                     <axis:visible f="axisctr031" c="ITOTALR">
                                         <display:column title="${title8}" sortable="false" sortProperty="ITOTALR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.ITOTALR}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr031" c="IPRIREB">
                                         <display:column title="${title10}" sortable="false" sortProperty="IPRIREB" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${axisctr_primasTotales.IPRIREB}'/></div>
                                         </display:column> 
                                     </axis:visible>                                                               
                                    </display:table>
                             </div>
                         </td>
                     </tr>
                </table>

    </table>
    <%--
    <table class="seccion">
    <tr>
        <td>
            
            <!-- DisplayTag Garantías -->
            <c:if test="${! empty sessionScope.axisctr_estdetgaranseg}">
                <c:set var="title0"><fmt:message key="100559"/></c:set>
                <c:set var="title1"><fmt:message key="1000073"/></c:set>
                <c:set var="title2"><fmt:message key="102995"/></c:set>
                <c:set var="title3"><fmt:message key="140531"/></c:set>
                   
                <div class="displayspaceGrande">
                    <display:table name="${sessionScope.axisctr_estdetgaranseg}" id="axisctr_estdetgaranseg" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr154.do?paginar=true">
                        <%@ include file="../include/displaytag.jsp"%>
                        <display:column title="${title0}" sortable="true" sortProperty="axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT" headerClass="sortable"  media="html" autolink="false" >
                            <div class="dspText">
                                ${sessionScope.axisctr_estdetgaranseg.OB_IAX_GARANTIAS.CGARANT}
                            </div>
                        </display:column>
                    </display:table>                                                        
                </div>
            </c:if>                  
        </td>
    </tr>
    </table>
    --%>
    
    
    <!-- Botonera -->
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr154</c:param>
        <c:param name="__botones"><axis:visible f="axisctr154" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisctr154" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr154" c="BT_SEG">,siguiente</axis:visible></c:param>
    </c:import>
</form>