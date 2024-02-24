<%/**
*  Fichero: axisctr031_body.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". És el cuerpo 
*
*
*  Fecha: 12/03/2007
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

<c:set var="pPregunta"><axis:alt f="axisctr031" c="LIT_PREGUNTA" lit="9906457"/></c:set>
<c:set var="pDetalle" ><axis:alt f="axisctr031" c="LIT_DETALLES" lit="9906458"/></c:set>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr032"/>
        <c:set var="literalPantalla">
            <axis:alt f="axisctr031" c="LIT_PANTALLA" lit="1000198"/>
        </c:set>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr031"/>
        <c:set var="literalPantalla">
            <axis:alt f="axisctr031" c="LIT_PANTALLA" lit="1000197"/>
        </c:set>
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
        <axis:alt f="axisctr031" c="MODO_SIMULACION" lit="108021" />
        </c:when>
        <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
        <axis:alt f="axisctr031" c="MODO_ALTA" lit="101110" />
        </c:when>
        <c:otherwise>
        <axis:alt f="axisctr031" c="MODO_OTROS" lit="104752" />
        </c:otherwise>
    </c:choose>
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">${modalidad}</c:param>
        <c:param name="titulo"></c:param>
        <c:param name="formulario">${literalPantalla}</c:param>
        <c:param name="form">${pantalla}</c:param>
    </c:import>
</c:if>
    <!--VARIABLES PARA SEGUIMIENTO FLUJO -->
    <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
    <!--INICI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="ICAPITALH" name="ICAPITALH" value=""/>
    <!--<input type="hidden" id="PREVALI" name="PREVALI" value=""/>-->
    <input type="hidden" id="IREVALI" name="IREVALI" value=""/>
    
    <c:if test="${__configform.axisctr031__CREVALI__visible == 'false'}">
    <input type="hidden" id="CREVALI" name="CREVALI" value="${sessionScope.axisctr_CREVALI}"/>
    </c:if>
    <c:if test="${__configform.axisctr031__PREVALI__visible == 'false'}">
    <!--<input type="hidden" id="PREVALI" name="PREVALI" value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr_PREVALI}'/>"/>-->
    <input type = "hidden" id = "label_PREVALI" name = "label_PREVALI">
    </c:if>
    <!--FI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="listaSelectedGarantias" name="listaSelectedGarantias" value=""/>
    <input type="hidden" name="CGARANT" id="CGARANT" value=""/>
    <input type="hidden" name="SELGAR" id="SELGAR" value=""/>
    <input type="hidden" name="CPARTIDA" id="CPARTIDA" value=""/>
    <input type="hidden" name="SELPARTIDA" id="SELPARTIDA" value=""/>
    <input type="hidden" name="hayCambios" id="hayCambios" value="${sessionScope.hayCambios}"/>
    <input type="hidden" name="EXISTE_52" id="EXISTE_52" value=""/>
    <input type="hidden" name="EXISTE_51" id="EXISTE_51" value=""/>
    <input type="hidden" name="EXISTE_48" id="EXISTE_48" value=""/>
    <input type="hidden" name="ICAPITALSELECTED" id="ICAPITALSELECTED" value=""/>
    <input type="hidden" name="ICAPITALSELECTED_CONPUNTOS" id="ICAPITALSELECTED_CONPUNTOS" value=""/>
    <input type="hidden" name="ICAPITAL_MODIFICADO_TEMPORAL" id="ICAPITAL_MODIFICADO_TEMPORAL" value=""/>    
    <input type="hidden" name="FILAS_IRREGULARES" id="FILAS_IRREGULARES" value=""/>
    <input type="hidden" name="ULTIMA_FILA" id="ULTIMA_FILA" value=""/>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_axisctr012" lit="9908333" /></c:param>
        <c:param name="nid" value="axisctr230" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_axisctr011" lit="1000185" /></c:param>
        <c:param name="nid" value="axisctr011" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_axisctr012" lit="1000186" /></c:param>
        <c:param name="nid" value="axisctr012" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_ESTANDAR" lit="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="DEFINREGLAS" lit="9901558" /></c:param>
        <c:param name="nid" value="axisctr160" />
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
                                <axis:visible c="ETIQ_RISC" f="axisctr031">
                                    <axis:alt f="axisctr031" c="ETIQ_RISC" lit="100649"></axis:alt> 
                                </axis:visible>
                                ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>                
                               <c:if test="${!empty sessionScope.axisctr_preguntasRiesgo ||
                                !empty sessionScope.axisctr_pregDespeses ||
                                !empty sessionScope.axisctr_pregQuestSalut}">
                
                <c:import url="axisctr031_preguntas.jsp">
                    <c:param name="multiPantalla" value="${multiPantalla}"/>
                </c:import>
                </c:if>
                <div class="separador">&nbsp;</div>
                <axis:ocultar f="axisctr031" c="PARTIDAS">
                <c:if test="${! empty __formdata.axisctr_partidas  }">
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="PARTIDES" lit="9901925" /></div>
                    <table class="seccion">
                    <tr>
                            <td>
                                <c:set var="title0"><axis:alt f="axisctr031" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr031" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="num_par">6</c:set>
                                <c:if test="${!empty __formdata.num_partidas && __formdata.num_partidas > 0 }">
                                    <c:set var="num_par">${__formdata.num_partidas}</c:set><!--  -->
                                </c:if>
                                <div id="DSP_PARTIDAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_par*20+20+20}"/>px">&nbsp;</div>
                                <div id="dt_partidas" class="displayspacewomax" style="height:<c:out value="${num_par*20+20+20}"/>px">   
                                    <display:table  name="${__formdata.axisctr_partidas}" id="miListaIdPartidas" export="false" class="dsptgtable" pagesize="${num_par}" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true" style="width:99%;">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons"><input onclick="javascript:f_actualiza_checkboxPartida(this, '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
                                                type="checkbox" id="selectedPartida" name="selectedPartida" value="${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}" 
                                                    <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                                                    <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                                                  __configform.axisctr031__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                                    /></div>            
                                        </display:column>
                                        <axis:visible f="axisctr031" c="DESCRIPCION">
                                            <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr031" c="ICAPITAL">
                                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                <c:set var="CAPITAL">
                                                    <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                        
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                    </c:if>
                                                </c:set>
                                                <div class="dspIcons">
                                                <c:set var="CLASS">
                                                    <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                    <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                </c:set>
                                                <c:choose>
                                                    <c:when test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                                                        <select id="ICAPITAL" name="ICAPITAL" onchange="javascript:f_selecciona_Partida(this.value, '1', '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
                                                        style="width:120px" class="${CLASS}" <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if>/>                                                                >
                                                            <c:forEach items="${miListaIdPartidas.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                                                <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
                                                                   <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL==null}">
                                                                       <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
                                                                   </c:if>
                                                                   <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL!=null}">
                                                                        <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == miListaIdPartidas.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
                                                                   </c:if>>
                                                                   ${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    
                                                    <c:otherwise>
                                                        <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <input onfocus="javascript:f_on_focus_capital(this);"
                                                            <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '3' || miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '5' }">
                                                            	<c:if  test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP != '8'}">
                                                                onblur="javascript:f_selecciona_Partida(this.value, '1', '${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT}');"
                                                            </c:if>
                                                            </c:if>
                                                            <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '3' ||miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '5'||miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '8'}"> readonly</c:if>
                                                            <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                                                                
                                                            type="text" id="ICAPITAL" name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="${CLASS}"
                                                            formato="decimal" title="<axis:alt f="axisctr031" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr031" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                       <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdPartidas.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                       <a onclick ="f_abrir_axisctr163('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT }')">
	                                                       <img  src="images/lapiz.gif" title='<axis:alt f="axisctr031" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr031" c="TITULO_DESGLOSE" lit="180183" />'>
                                                       </a>
                                                       
                                                    </c:if>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                  
                                                </div>
                                                </display:column>
                                            </axis:visible>
                                    </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="DSP_GARANTIAS" lit="1000183" ></axis:alt></div>
                    <c:set var="title0"><axis:alt f="axisctr031" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                    <c:set var="title1"><axis:alt f="axisctr031" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                    <c:set var="num_par">6</c:set>
                    <c:if test="${!empty __formdata.num_partidas && __formdata.num_partidas > 0 }">
                        <c:set var="num_par">${__formdata.num_partidas}</c:set><!--  -->
                    </c:if>
                    

                </c:if>
                </axis:ocultar>

                <!--campos-->
                <table class="seccion">
                    <tr>
                    <td align="left">
                    <axis:ocultar f="axisctr031" c="DSP_REVALORIZA">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr031" c="CFORPAG">
                                        <td class="titulocaja">
                                            <b id="label_CFORPAG"><axis:alt f="axisctr031" c="CFORPAG" lit="100712" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr031" c="CREVALI">
                                        <td class="titulocaja">
                                            <b id="label_CREVALI"><axis:alt f="axisctr031" c="CREVALI" lit="101432" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr031" c="PREVALI"> 
                                        <td class="titulocaja">
                                            <b id="label_PREVALI"><axis:alt f="axisctr031" c="PREVALI" lit="1000382" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr031" c="CFORPAG">
                                        <td class="campocaja">
                                            <select  name = "CFORPAG" id ="CFORPAG" <axis:atr f="axisctr031" c="CFORPAG" a="isInputText=false"/> size="1" onchange="javascript:f_cambia_tipo_pago(this)" class="campowidthselect campo campotexto_ob">&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_parametrosGarantias.formaPago}" var="formaPago">
                                                    <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_parametrosGarantias.CFORPAG}">selected</c:if>>${ formaPago.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>                                    
                                    <axis:visible f="axisctr031" c="CREVALI">
                                         <td class="campocaja">
                                            <select style="width:200px;" name = "CREVALI" id ="CREVALI" size="1" <axis:atr f="axisctr031" c="CREVALI" a="isInputText=false"/> onchange="guardar_revalorizacion_1()" 
                                            class="campowidthselect campo campotexto_ob">&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_parametrosGarantias.tipoRevalorizacion}" var="tipoReval">
                                                    <option value = "${tipoReval.CATRIBU}" 
                                                    <c:if test="${sessionScope.axisctr_CREVALI==tipoReval.CATRIBU}">selected</c:if>> ${tipoReval.TATRIBU} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:ocultar f="axisctr031" c="PREVALI">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PREVALI" name="PREVALI"  onchange="guardar_revalorizacion_2(this)" <axis:atr f="axisctr031" c="PREVALI" a="modificable=false&isInputText=true"/>
                                             obligatorio="true" formato="decimalNegativo" title="<axis:alt f="axisctr031" c="PREVALI" lit="1000382" />" size="15" value='<fmt:formatNumber pattern='###,##0.00'  value='${sessionScope.axisctr_PREVALI}'/>'/>
                                        </td>
                                    </axis:ocultar>
                                    
                                </tr>
                            </table>
                            </axis:ocultar>
                  <!--********************bug etm ******21657*******************-->
                   <axis:ocultar f="axisctr031" c="DTOSRECS" dejarHueco="false">                
                   <table>
                    <tr>
                    
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                </tr>
                            <tr>
                                    <axis:visible f="axisctr031" c="PDTOCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOCOM"><axis:alt f="axisctr031" c="LIT_103100" lit="103100" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr031" c="PRECCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PRECCOM"><axis:alt f="axisctr031" c="LIT_9903608" lit="9903608" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr031" c="PDTOTEC" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOTEC"><axis:alt f="axisctr031" c="LIT_9903609" lit="9903609" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr031" c="PRECARG" >
                                        <td class="titulocaja">
                                            <b id="label_PRECARG"><axis:alt f="axisctr031" c="LIT_9903610" lit="9903610" /></b>
                                        </td>
                                    </axis:visible>
                                 
                                    <axis:visible f="axisctr031" c="CRGGARDIF">
                                     <td class="campocaja">
                                      <b id="label_CRGGARDIF">
                                        <axis:alt f="axisctr031" c="LIT_9903611" lit="9903611" />
                                      </b>
                                      </td>
                                    </axis:visible>  
                                </tr>
                                <tr>
                                  <axis:visible f="axisctr031" c="PDTOCOM" >
                                  <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOCOM" name="PDTOCOM"  onchange="guardar_descuentos_recargos();"
                                       title="<axis:alt f="axisctr031" c="LIT_103100" lit="103100"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${requestScope.PDTOCOM}"/>"
                                      <axis:atr f="axisctr031" c="PDTOCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr031" c="PRECCOM" >
                                        <td class="campocaja">
                                         <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM"  onchange="guardar_descuentos_recargos();"
                                            title="<axis:alt f="axisctr031" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${requestScope.PRECCOM}"/>"
                                            <axis:atr f="axisctr031" c="PRECCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                         </td>
                                    </axis:visible>
                                   
                                     <axis:visible f="axisctr031" c="PDTOTEC" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange="guardar_descuentos_recargos();"
                                              title="<axis:alt f="axisctr031" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${requestScope.PDTOTEC}"/>"
                                            <axis:atr f="axisctr031" c="PDTOTEC" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr031" c="PRECARG" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="PRECARG" name="PRECARG" onchange="guardar_descuentos_recargos();"
                                            title="<axis:alt f="axisctr031" c="LIT_9903610" lit="9903610"/>" size="15" value ="${requestScope.PRECARG}"
                                            <axis:atr f="axisctr031" c="PRECARG" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>    
                               
                                        <axis:visible f="axisctr031" c="CRGGARDIF" >
                                        <td>
                                      <input  
                                        <c:if test="${__formdata.OB_IAX_RIESGOS.CRGGARDIF == '1'}">checked</c:if> onchange=""  type="checkbox" id="CRGGARDIF" name="CRGGARDIF" value="${__formdata.OB_IAX_RIESGOS.CRGGARDIF}"/>
                                         </td>
                                    </axis:visible>
                                </tr>
                            </table>
                            </axis:ocultar>
                            <!--fin bug etm *********************-->
                            <!-- **************************************************************************** -->
                       
                            <div class="separador">&nbsp;</div>
                            
                            <axis:ocultar f="axisctr031" c="HR1">
                                <hr/>
                            </axis:ocultar>

                            <%--/******************************CTIPO=3 y/o 4 para ahorros/rentas******************************************/--%>
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                  <axis:ocultar c="TIPOCALCUL" f="axisctr031" dejarHueco="false">                                 
                                    <tr>                               
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisctr031" c="ICAPITAL" lit="1000073" /></b>
                                        <input type="radio" name="radioICAPITAL" id="radioICAPITAL" value="1" <c:if test="${empty __formdata['TIPOCALCUL']}">checked</c:if> <c:if test="${__formdata['TIPOCALCUL'] == '1'}">checked</c:if> onClick="javascript:objDom.setValorPorId('TIPOCALCUL', this.value);inicializaCamposCalculCapital();revisarEstilos();" />
                                      </td>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisctr031" c="RENDA" lit="9001858" /></b>
                                        <input type="radio" name="radioRENDA" id="radioRENDA" value="2"   <c:if test="${__formdata['TIPOCALCUL'] == '2'}">checked</c:if> onClick="javascript:objDom.setValorPorId('TIPOCALCUL', this.value);inicializaCamposCalculCapital();revisarEstilos();"/>
                                      </td>
                                    </tr>
                                    <input type="hidden" id="TIPOCALCUL" name="TIPOCALCUL" value="${__formdata['TIPOCALCUL']}"/>                                    
                                </axis:ocultar>
                              <tr>
                                <% for (int j=0;j<garantias_entrada.size();j=j+2){ 
                                    if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("DESCRIPCION")!=null ) { %>
                                    <c:set var="CGARANT_0">CGARANT_<%=((HashMap)garantias_entrada.get(j)).get("CGARANT")%></c:set>
                                    <%}%>
                                     <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("DESCRIPCION")!=null ) { %>
                                    <c:set var="CGARANT_1">CGARANT_<%=((HashMap)garantias_entrada.get(j+1)).get("CGARANT")%></c:set>
                                    <%}%>
                                    <axis:ocultar c="${CGARANT_0}" f="axisctr031" dejarHueco="false">
                                    <td>
                                          <% if(j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("DESCRIPCION")!=null ) { %>
                                            <table>
                                            	<c:set var="CGARANT_0DESC"><%=((HashMap)garantias_entrada.get(j)).get("DESCRIPCION")%></c:set>
                                            <tr id="CAP_"<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>>
                                            <td class="titulocaja" ><b><axis:alt f="axisctr031" c="${CGARANT_0}" lit="${CGARANT_0DESC}"></axis:alt></b>
                                            </tr>
                                            </table>
                                          <% } %>
                                    </td>
                                    </axis:ocultar>

                                     <axis:ocultar c="${CGARANT_1}" f="axisctr031" dejarHueco="false">
                                    <td>
                                         <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("DESCRIPCION")!=null ) { %>
                                            <c:set var="CGARANT_1DESC"><%=((HashMap)garantias_entrada.get(j+1)).get("DESCRIPCION")%></c:set>
                                            <table>
                                              <tr id="CAP_"<%=((HashMap)garantias_entrada.get(j+1)).get("CGARANT")%>>
                                                <td class="titulocaja"><b><axis:alt f="axisctr031" c="${CGARANT_1}" lit="${CGARANT_1DESC}"></axis:alt></b></td>
                                             </tr>
                                            </table>
                                        <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                
                                <tr>
                                <axis:ocultar c="${CGARANT_0}" f="axisctr031" dejarHueco="false">
                                    <td>
                                      <% if( j< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j)).get("DESCRIPCION")!=null ) { %>
                                            <table>
                                            <tr id="CAG_"<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>>
                                            
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>"/>
                                                <input <axis:atr f="axisctr031" c="${CGARANT_0}" a="modificable=true"/> type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%> onchange="javascript:f_ejecutar_cambio_garantia2(document.${pantalla}Form.CAPITAL_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>.value,document.${pantalla}Form.CGARANT_<%= ((HashMap)garantias_entrada.get(j)).get("CGARANT") %>.value);f_carga_dependencias();revisarEstilos();" title="${fn:replace(CGARANT_0DESC,'/','-')}" size="15"                                                 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_entrada.get(j)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar c="${CGARANT_1}" f="axisctr031" dejarHueco="false">
                                    <td>
                                    <% if( (j+1)< garantias_entrada.size() &&((HashMap)garantias_entrada.get(j+1)).get("DESCRIPCION")!=null ) { %>
                                            <table>
                                            <tr id="CAG_"<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>>
                                            
                                                <td class="campocaja">
                                                <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" value="<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>"/>
                                                <input <axis:atr f="axisctr031" c="${CGARANT_1}" a="modificable=true"/> type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>" 
                                                formato="decimal" <% if (  (((HashMap)garantias_entrada.get(j+1)).get("CTIPGAR")+"").equals("2")  ) { %> obligatorio='true' <%}else{%> obligatorio='false' <%}%> onchange="javascript:f_ejecutar_cambio_garantia2(document.${pantalla}Form.CAPITAL_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>.value,document.${pantalla}Form.CGARANT_<%= ((HashMap)garantias_entrada.get(j+1)).get("CGARANT") %>.value);f_carga_dependencias();revisarEstilos();" title="${fn:replace(CGARANT_1DESC,'/','-')}" size="15" 
                                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_entrada.get(j+1)).get("ICAPITAL") %>'/>"/>
                                                </td>
                                            </tr>
                                            </table>
                                    <% } %>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <% } %>  
                             </table>
                            <%--/******************************FIN CTIPO=3 y/o 4 para ahorros/rentas******************************************/--%>
                        </td>
                    </tr>
                  <axis:ocultar f="axisctr031" c="DSP_GARANTIAS_T">        
                    <tr>
                        <td>
                            
                            <!-- DisplayTag Garantías -->
                            <c:if test="${! empty sessionScope.axisctr_garantias}">
                                <c:set var="title0"><axis:alt f="axisctr031" c="DESCRIPCIONGAR" lit="100559"/></c:set>
                                <c:set var="title1"><axis:alt f="axisctr031" c="ICAPITAL" lit="1000073"/></c:set>
                                <c:set var="title2"><axis:alt f="axisctr031" c="IPRIANU" lit="102995"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr031" c="IPRITAR_" lit="140531"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr031" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="axisctr031" c="CMONCAP" lit="108645"/></c:set>
                                <c:if test="${empty sessionScope.num_garantias || sessionScope.num_garantias == 0}">
                                    <c:set var="num_gar">6</c:set>
                                </c:if>
                                <c:if test="${!empty sessionScope.num_garantias && sessionScope.num_garantias > 0 }">
                                    <c:set var="num_gar">${sessionScope.num_garantias}</c:set><!--  -->
                                </c:if>                                
                                <div id="DSP_GARANTIAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_gar*20+20+20}"/>px">&nbsp;</div>
                                    <div id="dt_garantias" class="displayspacewomax" style="height:<c:out value="${num_gar*20+20+20}"/>px;max-height:<c:out value="${num_gar*20+20+20}"/>px">   
                                    <display:table name="${sessionScope.axisctr_garantias}" id="miListaIdGarantias" export="false" class="dsptgtable" pagesize="${num_gar}" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                    requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisctr031" c="COBLIGA">
                                            <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                <div class="dspIcons"><input onclick="javascript:f_actualiza_checkbox(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                    type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked</c:if> 
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPGAR == 2}">disabled</c:if>
                                                        /></div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr031" c="CTARMAN">
                                          <display:column title="${title4}" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons"><input onclick="javascript:f_actualiza_manual(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                type="checkbox" id="CTARMAN" name="CTARMAN" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN}" 
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == '1'}">checked='checked'</c:if> />
                                            </div>            
                                        </display:column>
                                        </axis:visible>                                        
                                        <axis:ocultar f="axisctr031" c="DESCRIPCION">
                                            <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                            </display:column>
                                        </axis:ocultar>
                                        <axis:visible f="axisctr031" c="ICAPITAL">
                                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                <c:set var="CAPITAL">
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                    </c:if>
                                                </c:set>
                                                <div class="dspIcons">
                                                <c:set var="CLASS">
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                </c:set>
                                                <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                                                        <select id="ICAPITAL" name="ICAPITAL" onchange="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                        style="width:120px" class="${CLASS}" <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if>/>                                                                >
                                                            <c:forEach items="${miListaIdGarantias.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                                                <option value = "<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"/>"
                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL==null || miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL==0}">
                                                                       <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
                                                                   </c:if>
                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL!=null}">
                                                                        <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
                                                                   </c:if>>
                                                                   <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"/>
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <input onfocus="javascript:f_on_focus_capital(this);"
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '3' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5'}">                                                            	
                                                                onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                            </c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '3' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'}"> readonly</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                                                                
                                                            type="text" id="ICAPITAL" name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="${CLASS}"
                                                            formato="decimal" title="<axis:alt f="axisctr031" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr031" c="PORGARANTIA" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr031" c="ICAPITALCOL">
                                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber"> 
                                                <c:choose>
                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                 <input     type="text" id="ICAPITAL" onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');" name="ICAPITAL" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>" style="width:90px" class="${CLASS}"
                                                            formato="decimal" />
                                                </c:when>
                                                <c:otherwise>
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                         <axis:visible f="axisctr031" c="CMONCAP">
                                            <display:column media="html" title="${title5}" headerClass="headwidth10 sortable" autolink="false" >
                                                <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr031" c="IPRITAR">
                                            <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRITAR" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">                                                
                                                <c:choose>
                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                 <input     type="text" id="IPRITAR" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this.value, '${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIANU}')" name="IPRITAR" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>" style="width:90px" class="${CLASS}"
                                                            formato="decimal" />
                                                </c:when>
                                                <c:otherwise>
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>
                                                </c:otherwise>
                                                </c:choose>                                                  
                                                </div>
                                            </display:column>
                                        </axis:visible>                                        
                                        <axis:visible f="axisctr031" c="IPRIANU">
                                            <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRIANU" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber"> 
                                                <c:choose>
                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                 <input     type="text" id="IPRIANU" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', '${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}', this.value)" name="IPRIANU" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIANU}"/>" style="width:90px" class="${CLASS}"
                                                            formato="decimal" />
                                                </c:when>
                                                <c:otherwise>
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIANU}"/>
                                                </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr031" c="DETGARANT">
                                        <display:column media="html" title="${fn:substring(pDetalle,0,1)}" headerClass="headwidth5 sortable" autolink="false" >
                                            <c:choose>
                                                <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                    <div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">${fn:substring(pDetalle,0,1)}</a></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="dspIcons">${fn:substring(pDetalle,0,1)}</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </display:column>
                                        </axis:visible>
                                         
                                          <axis:visible f="axisctr031" c="PREGGARANT">
                                            <display:column media="html" title="${fn:substring(pPregunta,0,1)}" headerClass="headwidth5 sortable" autolink="false" >
                                           
                                           <!-- TODOC: BUSCA LA P-->
                                                 <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                    <div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">${fn:substring(pPregunta,0,1)}
                                                                </a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspIcons">${fn:substring(pPregunta,0,1)}</div>
                                                    </c:otherwise>
                                                </c:choose>
                                           <!-- TODOC: BUSCA LA P-->  
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr031" c="FRANGARANT">
                                            <display:column media="html" title="F" headerClass="headwidth5 sortable" autolink="false" >
                                                <div class="dspIcons"><a href="#">F</a></div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr031" c="BREGLAS">
                                            <display:column media="html" title="" headerClass="headwidth5 sortable" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                        <div class="dspIcons">
                                                            <a onclick="f_abrir_axisctr160('${__formdata.OB_IAX_RIESGOS.NRIESGO}','${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">
                                                                <img border="0" alt="<axis:alt f='axisctr031' c='DEFINREGLAS' lit='9901558'/>" title="<axis:alt f='axisctr031' c='DEFINREGLAS' lit='9901558'/>" src="images/update.gif"/>
                                                            </a>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="dspIcons">
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                        </axis:visible>

                                    </display:table>
                                </div>
                            </c:if>                  
                        </td>
                    </tr>
                    </axis:ocultar>
                     <c:if test="${sessionScope.garantia_11 == 1}" >
                    <tr>
                        <td>
                            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr031" c="RENDESIRREGULARS" lit="1000344" /></div>
                            <table class="seccion" >
                            <tbody id="rentas_irregulares">
                            
                               
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
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="ANYO" lit="101606" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="ENERO" lit="1000278" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="FEBRERO" lit="1000279" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="MARZO" lit="1000280" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="ABRIL" lit="1000281" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="MAYO" lit="1000282" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="JUNIO" lit="1000283" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="JULIO" lit="1000284" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="AGOSTO" lit="1000285" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="SEPTIEMBRE" lit="1000286" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="OCTUBRE" lit="1000287" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="NOVIEMBRE" lit="1000288" /></b></td>
                                        <td class="campocaja" align="center"><b><axis:alt f="axisctr031" c="DICIEMBRE" lit="1000289" /></b></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    
                                    <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                    <c:if test="${empty sessionScope.rentasIrregulares}">
                                    <tr tipo="ri" id="fila_0">
                                        
                                        <td class="campocaja">
                                            <input type="hidden" class="campowidthinput campo campotexto" style="width:90%;" id="ESTADO_0" name="ESTADO_0" 
                                            size="15" value="1"/>
                                            <select  id="irr_anyo" name = "ANYO_0" id ="ANYO_0" size="1" onchange="javascript:f_disabled_but_siguiente(true);" class="campowidthselect campo campotexto_ob" style="width:90%;">
                                                <c:forEach items="${sessionScope.axisctr_lista_anyos}" var="anyo">
                                                    <option value = "${anyo.CODIGO}" <c:if test="${anyo.CODIGO  == sessionScope.axisctr_parametrosGarantias.CODIGO}">selected</c:if>>${anyo.DESCRIPCION}</option>
                                                </c:forEach>
                                                
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ENERO_0" name="ENERO_0" 
                                            formato="decimal" title="ENERO_0"  size="15" onclick="tengoelfocus(this)"                                            
                                            onchange="javascript:f_disabled_but_siguiente(true);f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="FEBRERO_0" name="FEBRERO_0" 
                                            formato="decimal" title="FEBRERO_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MARZO_0" name="MARZO_0" 
                                            formato="decimal" title="MARZO_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ABRIL_0" name="ABRIL_0" 
                                            formato="decimal" title="ABRIL_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MAYO_0" name="MAYO_0" 
                                            formato="decimal" title="MAYO_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JUNIO_0" name="JUNIO_0" 
                                            formato="decimal" title="JUNIO_0" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JULIO_0" name="JULIO_0" 
                                            formato="decimal" title="JULIO_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="AGOSTO_0" name="AGOSTO_0" 
                                            formato="decimal" title="AGOSTO_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="SEPTIEMBRE_0" name="SEPTIEMBRE_0" 
                                            formato="decimal" title="SEPTIEMBRE_0" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="OCTUBRE_0" name="OCTUBRE_0" 
                                            formato="decimal" title="OCTUBRE_0"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NOVIEMBRE_0" name="NOVIEMBRE_0" 
                                            formato="decimal" title="NOVIEMBRE_0" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="DICIEMBRE_0" name="DICIEMBRE_0" 
                                            formato="decimal" title="DICIEMBRE_0" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value=''/>"/>
                                        </td>
                
                                        <td class="campocaja">
                                            <a  href="javascript:borrar_fila_renta(0)")"><img border="0" alt="<axis:alt f="axisctr031" c="ELIMINAR" lit="1000127" />" title="<axis:alt f="axisctr031" c="ELIMINAR" lit="1000127" />" src="images/delete.gif"/></a>
                                        </td>
                                        
                                    </tr>
                                    </c:if>
                                    <c:if test="${!empty rentasIrregulares}">
                                                                      
                                    <c:forEach items="${sessionScope.rentasIrregulares}" var="lista" varStatus="i">
                                    
                                      <tr tipo="ri" id="fila_${i.count-1}">
                                        
                                        <td class="campocaja">
                                            <input type="hidden" class="campowidthinput campo campotexto" style="width:90%;" id="ESTADO_${i.count-1}" name="ESTADO_${i.count-1}" 
                                            size="15" value="1"/>
                                            <select   name = "ANYO_${i.count-1}" id ="ANYO_${i.count-1}" size="1" onchange="javascript:f_disabled_but_siguiente(true);" class="campowidthselect campo campotexto_ob" style="width:90%;">
                                                <c:forEach items="${sessionScope.axisctr_lista_anyos}" var="anyo">
                                                    <option value = "${anyo.CODIGO}" <c:if test="${anyo.CODIGO  == lista.OB_IAX_RENTAIRR.ANYO}">selected</c:if>>${anyo.DESCRIPCION}</option>
                                                </c:forEach>
                                                
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ENERO_${i.count-1}" name="ENERO_${i.count-1}" 
                                            formato="decimal" title="ENERO_${i.count-1}" size="15" onclick="tengoelfocus(this)" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES1}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="FEBRERO_${i.count-1}" name="FEBRERO_${i.count-1}" 
                                            formato="decimal" title="FEBRERO_${i.count-1}" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES2}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MARZO_${i.count-1}" name="MARZO_${i.count-1}" 
                                            formato="decimal" title="MARZO_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES3}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="ABRIL_${i.count-1}" name="ABRIL_${i.count-1}" 
                                            formato="decimal" title="ABRIL_${i.count-1}" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES4}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="MAYO_${i.count-1}" name="MAYO_${i.count-1}" 
                                            formato="decimal" title="MAYO_${i.count-1}" size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES5}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JUNIO_${i.count-1}" name="JUNIO_${i.count-1}" 
                                            formato="decimal" title="JUNIO_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES6}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="JULIO_${i.count-1}" name="JULIO_${i.count-1}" 
                                            formato="decimal" title="JULIO_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES7}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="AGOSTO_${i.count-1}" name="AGOSTO_${i.count-1}" 
                                            formato="decimal" title="AGOSTO_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES8}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="SEPTIEMBRE_${i.count-1}" name="SEPTIEMBRE_${i.count-1}" 
                                            formato="decimal" title="SEPTIEMBRE_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES9}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="OCTUBRE_${i.count-1}" name="OCTUBRE_${i.count-1}" 
                                            formato="decimal" title="OCTUBRE_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES10}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="NOVIEMBRE_${i.count-1}" name="NOVIEMBRE_${i.count-1}" 
                                            formato="decimal" title="NOVIEMBRE_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES11}'/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90%;" id="DICIEMBRE_${i.count-1}" name="DICIEMBRE_${i.count-1}" 
                                            formato="decimal" title="DICIEMBRE_${i.count-1}"  size="15" 
                                            onchange="javascript:f_disabled_but_siguiente(true);"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.OB_IAX_RENTAIRR.MES12}'/>"/>
                                        </td>
                
                                        <td class="campocaja">
                                            <a href="javascript:borrar_fila_renta(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<axis:alt f="axisctr031" c="ELIMINAR" lit="1000127" />"  title="<axis:alt f="axisctr031" c="ELIMINAR" lit="1000127"/>" src="images/delete.gif"/></a>
                                        </td>
                                    </tr>
                                   
                                    </c:forEach>
                                    
                                    </c:if>
                                    <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                
                                
                                <!-- ******************** fin filas: boton anyadir  ******************************** -->
                                
                                </tbody>
                                
                            </table>
                            </td>
                            </tr>
                            
                            
                            
                            <tr >
                                    <td >
                                    <table cellpadding="0" cellspacing="0">
                                    <tr>
                                    <td>
                                            <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr031" c="but_anadirMes" lit="9001596" />" onclick="copiarmes()" />
                                            <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr031" c="but_anadirAnyo" lit="9001597" />" onclick="copiaranyo()" />
                                    </td>
                                    <td style="text-align:right">
                                            <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr031" c="but_anadir" lit="104825" />" onclick="javascript:anaydir_fila_renta()" />
                                    </td>
                                    </tr>
                                    </table>
                                        </td>
                                        
                            </tr>
                            <!--
                        </td>
                    </tr>
                    -->
                   </c:if>
                   
                   
                   <tr>
                   <td>
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                               <axis:ocultar f="axisctr031" c="FVENCIMCAPGAR" dejarHueco="false">
                                <tr>
                                        <td class="titulocaja">
                                            <b id="label_FVENCIMCAPGAR"><axis:alt f="axisctr031" c="label_FVENCIMCAPGAR" lit="9900910" /></b>
                                        </td>
                                </tr>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr031" c="FVENCIMCAPGAR" dejarHueco="false">
                                <tr>
                                  
                                        <td class="campocaja">
                                             <input type="text" class="campowidthinput campo" id="FVENCIMCAPGAR" name="FVENCIMCAPGAR"   <axis:atr f="axisctr031" c="FVENCIMCAPGAR" a="modificable=false"/>
                                             title="<axis:alt f="axisctr031" c="label_FVENCIMCAPGAR" lit="9900910" />" size="15" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${DATOSBASICOS.FVENCIMCAPGAR}'/>"/>
                                        </td>
                                    
                                </tr>
                                </axis:ocultar>
                            </table>
                    </td>
                    </tr>
                    
                   <%--/******************************FIN AL SELECCIONAR EL CTIPO=11 (Renta irregular) en el multiregistro de garantias******************************************/--%>

                    <%--/******************************CTIPO=5 y/o 8 y/o 9 para ahorros/rentas******************************************/--%>
                    <tr>
                        <td>
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <% for (int h=0;h<garantias_salida.size();h=h+3 ){ %>
                                 <% if(((HashMap)garantias_salida.get(h)).get("DESCRIPCION")!=null ) { %>
                                <c:set var="CGARANT_2">CGARANT_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %></c:set>
                                <%}%>
                                <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("DESCRIPCION")!=null ) { %>
                                <c:set var="CGARANT_3">CGARANT_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %></c:set>
                                <%}%>
                                <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("DESCRIPCION")!=null ) { %>
                                <c:set var="CGARANT_4">CGARANT_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %></c:set>
                                <%}%>
                                  <tr>
                                        <% if(((HashMap)garantias_salida.get(h)).get("DESCRIPCION")!=null ) { %>
                                         <axis:ocultar c="${CGARANT_2}" f="axisctr031" dejarHueco="false">
                                            <c:set var="CGARANT_2DESC"><%= ((HashMap)garantias_salida.get(h)).get("DESCRIPCION") %></c:set>
                                            <td class="titulocaja"><b><axis:alt f="axisctr031" c="${CGARANT_2}" lit="${CGARANT_2DESC}"></axis:alt></b></td>                                            
                                         </axis:ocultar>
                                        <% } %> 
                                        
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("DESCRIPCION")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_3}" f="axisctr031" dejarHueco="false">
                                            <c:set var="CGARANT_3DESC"><%= ((HashMap)garantias_salida.get(h+1)).get("DESCRIPCION") %></c:set>
                                            <td class="titulocaja"><b><axis:alt f="axisctr031" c="${CGARANT_3}" lit="${CGARANT_3DESC}"></axis:alt></b></td>                                            
                                            </axis:ocultar>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("DESCRIPCION")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_4}" f="axisctr031" dejarHueco="false">
                                            <c:set var="CGARANT_4DESC"><%= ((HashMap)garantias_salida.get(h+2)).get("DESCRIPCION") %></c:set>
                                            <td class="titulocaja"><b><axis:alt f="axisctr031" c="${CGARANT_4}" lit="${CGARANT_4DESC}"></axis:alt></b></td>                                            
                                            </axis:ocultar>
                                        <% } %> 
                                   </tr>
                                   <tr>
                                        <% if(((HashMap)garantias_salida.get(h)).get("DESCRIPCION")!=null ) { %>
                                        <axis:ocultar c="${CGARANT_2}" f="axisctr031" dejarHueco="false">
                                            <td class="campocaja">       
                                        <%--    <input type="hidden" id="CGARANT_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" name="CGARANT_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" value="<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>"/> --%>
                                            <input <axis:atr f="axisctr031" c="${CGARANT_2}" a="modificable=false"/> type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" name="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" readonly title="${fn:replace(CGARANT_2DESC,'/','-')}"
                               <%--               onchange="javascript:f_ejecutar_cambio_garantia2(document.${pantalla}Form.CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>.value,document.${pantalla}Form.CGARANT_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>.value);f_carga_dependencias();revisarEstilos();" title="CAPITAL_<%= ((HashMap)garantias_salida.get(h)).get("CGARANT") %>" size="15"                                                 --%>
                                            formato="decimal" title="" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h)).get("ICAPITAL") %>'/>"/>
                                            
                                            
                                            </td>
                                        </axis:ocultar>
                                        <% } %> 
                                        
                                        <% if( (h+1)< garantias_salida.size() &&((HashMap)garantias_salida.get(h+1)).get("DESCRIPCION")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_3}" f="axisctr031" dejarHueco="false">
                                            <td class="campocaja">
                                            <input <axis:atr f="axisctr031" c="${CGARANT_3}" a="modificable=false"/> type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+1)).get("CGARANT") %>" readonly
                                            formato="decimal"  title="${fn:replace(CGARANT_3DESC,'/','-')}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h+1)).get("ICAPITAL") %>'/>"/>
                                            </td>
                                            </axis:ocultar>
                                        <% } %> 
                                        <% if((h+2)< garantias_salida.size()&&((HashMap)garantias_salida.get(h+2)).get("DESCRIPCION")!=null ) { %>
                                            <axis:ocultar c="${CGARANT_4}" f="axisctr031" dejarHueco="false">
                                            <td class="campocaja">
                                            <input <axis:atr f="axisctr031" c="${CGARANT_4}" a="modificable=false"/> type="text" class="campowidthinput campo campotexto" id="CAPITAL_<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" name="CAPITAL_$<%= ((HashMap)garantias_salida.get(h+2)).get("CGARANT") %>" readonly
                                            formato="decimal" title="${fn:replace(CGARANT_4DESC,'/','-')}" size="15" 
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='<%= ((HashMap)garantias_salida.get(h+2)).get("ICAPITAL") %>'/>"/>
                                            </td>
                                            </axis:ocultar>
                                        <% } %> 
                                   </tr>
                                <% } %>
                            </table>
                        </td>
                    </tr>
                    <%-- Bug 14598 --%>              
                    <axis:ocultar f="axisctr031" c="VALORESREV" dejarHueco="false">
                    <tr>
                    <td>
                        <table class="area" align="center">
                         <tr align="left">
                            <th class="titulocaja" style="width:25%;height:0px">
                                <b>
                                    <axis:alt f="axisctr031" c="FECREVI" lit="9901262"/>
                                    <fmt:formatDate value="${DATOSBASICOS.FECREVI}" pattern="dd/MM/yyyy"/>
                                </b>
                                
                                <hr class="titulo">
                            </th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr031" c="IMPPROVREVI" dejarHueco="false">
                            <td class="titulocaja">
                                <b>
                                    <axis:alt f="axisctr031" c="IMPPROVREVI" lit="9901252"></axis:alt>
                                </b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr031" c="IMPCAPGARREVI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr031" c="IMPCAPGARREVI" lit="9901254"/></b>&nbsp;
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr031" c="IMPCAPESTREVI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr031" c="IMPCAPESTREVI" lit="9901255"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <!-- Provisión -->
                            <axis:ocultar f="axisctr031" c="IMPPROVREVI" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="IMPPROVREVI" name="IMPPROVREVI" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datoseco.IMPPROVREVI}'/>" readonly="true"/>
                            </td>
                            </axis:ocultar>
                            <!-- Capital Garant. -->
                             <axis:ocultar f="axisctr031" c="IMPCAPGARREVI" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" id="IMPCAPGARREVI" name="IMPCAPGARREVI" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datoseco.IMPCAPGARREVI}'/>" readonly="true"/>
                            </td>
                            </axis:ocultar>
                            <!-- Capital Estimado. -->
                            <axis:ocultar f="axisctr031" c="IMPCAPESTREVI" dejarHueco="false">
                            <td> 
                                <input type="text" class="campowidthinput campo campotexto" id="IMPCAPESTREVI" name="IMPCAPESTREVI" size="15"
                                value="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${datoseco.IMPCAPESTREVI}'/>" readonly="true"/>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>     
                </td>
                </tr>
                </axis:ocultar>
                <%-- Fin Bug 14598 --%>
                    <tr>
                        <axis:visible f="axisctr031" c="PAGAS_EXTRA">
                         <c:if  test="${requestScope.CFORPAGREN == 12}">
                            <td>
                              <%-- NMM.02/2013.Bug 24735.Taula de mesos amb pagues extraordinàries --%>
                              <c:import url="axisctr031_body1.jsp"/>              
                            </td>
                         </c:if>  
                       </axis:visible>
                    </tr>
                    <%--/******************************FIN CTIPO=5 y/o 8 y/o 9 para ahorros/rentas******************************************/--%>
                </table>

        <c:import url="axisctr031_body2.jsp">
            <c:param name="multiPantalla" value="false"/>
        </c:import>                 

             

    </table>
    <!-- Botonera -->
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr031_body</c:param><c:param name="f">axisctr031</c:param>
        <c:param name="f">axisctr031</c:param>
        <c:param name="__botones"><axis:visible f="axisctr031" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisctr031" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr031" c="BT_SEG">,siguiente</axis:visible></c:param>
        
    </c:import>
</form>

