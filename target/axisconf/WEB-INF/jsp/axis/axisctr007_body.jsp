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
        <c:set var="pantalla" value="axisctr007"/>
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
        <axis:alt f="axisctr007" c="TITULO_ADIC" lit="108021" />
        </c:when>
        <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
        <axis:alt f="axisctr007" c="TITULO_ADIC" lit="101110" />
        </c:when>
        <c:otherwise>
        <axis:alt f="axisctr007" c="TITULO_ADIC2" lit="104752" />
        </c:otherwise>
    </c:choose>
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">${modalidad}
         <axis:visible f="axisctr007" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
         </axis:visible>
        </c:param>
        <c:param name="titulo"></c:param>
        <c:param name="formulario"><axis:alt f="axisctr007" c="TITULO" lit="1000183"/></c:param>
        <c:param name="form">${pantalla}</c:param>
    </c:import>
</c:if>
    <!--VARIABLES PARA SEGUIMIENTO FLUJO -->
    <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
    <!--INICI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="ICAPITALH" name="ICAPITALH" value=""/>
    <!--<input type="hidden" id="PREVALI" name="PREVALI" value=""/>-->
    <input type="hidden" id="IREVALI" name="IREVALI" value=""/>
    <!--FI PER BORRAR QUAN FUNCIONI AJAX DE SELECCIO GARANTIES-->
    <input type="hidden" id="listaSelectedGarantias" name="listaSelectedGarantias" value=""/>
    <input type="hidden" name="CGARANT" id="CGARANT" value=""/>
    <input type="hidden" name="SELGAR" id="SELGAR" value=""/>
    <input type="hidden" name="CPARTIDA" id="CPARTIDA" value=""/>
    <input type="hidden" name="SELPARTIDA" id="SELPARTIDA" value=""/>
    <input type="hidden" name="hayCambios" id="hayCambios" value="${sessionScope.hayCambios}"/>
    <input type="hidden" name="ICAPITALSELECTED" id="ICAPITALSELECTED" value=""/>
    <input type="hidden" name="ICAPITALSELECTED_CONPUNTOS" id="ICAPITALSELECTED_CONPUNTOS" value=""/>
    <input type="hidden" name="ICAPITAL_MODIFICADO_TEMPORAL" id="ICAPITAL_MODIFICADO_TEMPORAL" value=""/>
    <input type="hidden" name="IMPRESO" id="IMPRESO" value="${sessionScope.IMPRESO}">
    <input type="hidden" name="PCCUESTI" id="PCCUESTI" value="${sessionScope.PCCUESTI}">
    
    <!--VARS DE COMBOS DISABLED(MODIFICACION=false) CON VALOR-->
    <input type="hidden" id="CREVALI_CONFIG" name="CREVALI_CONFIG" value=""/>
    
    <input type="hidden" name="NCERTIF" id="NCERTIF" value="${sessionScope.NCERTIF}">
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_axisctr012" lit="9908333" /></c:param>
        <c:param name="nid" value="axisctr230" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_DET" lit="1000185" /></c:param>
        <c:param name="nid" value="axisctr011" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_DET" lit="9901369" /></c:param>
        <c:param name="nid" value="axisctr188" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_PREG" lit="1000186" /></c:param>
        <c:param name="nid" value="axisctr012" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_DESGLOSE" lit="180183" /></c:param>
        <c:param name="nid" value="axisctr163" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_EDIT" lit="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr007" c="TITULO_IMPRIMIR" lit="1000205" /></c:param>
    </c:import>    
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr007" c="TITULO_MODALMAX" lit="103672" /></c:param>
        <c:param name="nid" value="axisctr185" />
    </c:import>
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <c:if test="${param.multiPantalla != 'true'}">        
                    <table class="seccion">
                        <tr>
                            <td style="font-size: 11px;">
                            <font color="#FF8400" ><b><axis:alt f="axisctr007" c="TITULO_RIESGO" lit="100649" /> ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>    
                <c:if test="${!empty sessionScope.axisctr_preguntasRiesgo ||
                                !empty sessionScope.axisctr_pregDespeses ||
                                !empty sessionScope.axisctr_pregQuestSalut}">
                    <c:import url="axisctr007_preguntas.jsp">
                        <c:param name="multiPantalla" value="${multiPantalla}"/>
                    </c:import>
                </c:if>
                <div class="separador">&nbsp;</div>
                <c:if test="${! empty __formdata.axisctr_partidas  }">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr007" c="PARTIDES" lit="9901925" /></div>
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <td>
                            <axis:ocultar f="axisctr007" c="PARTIDAS">
                            <!-- DisplayTag Partidas -->
                            <c:if test="${! empty __formdata.axisctr_partidas  }">
                                <c:set var="title0"><axis:alt f="axisctr007" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
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
                                                                  __configform.axisctr007__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                                    /></div>            
                                        </display:column>
                                        <axis:visible f="axisctr007" c="DESCRIPCION">
                                            <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr007" c="ICAPITAL">
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
                                                            formato="decimal" title="<axis:alt f="axisctr007" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr007" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdPartidas.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                       <c:if test="${miListaIdPartidas.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdPartidas.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdPartidas.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                       <a onclick ="f_abrir_axisctr163('${miListaIdPartidas.OB_IAX_GARANTIAS.CGARANT }')">
	                                                       <img  src="images/lapiz.gif" title='<axis:alt f="axisctr007" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr007" c="TITULO_DESGLOSE" lit="180183" />'>
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
                              
                            </c:if>
                            </axis:ocultar>
                        </td>
                    </tr>
                </table>
                <div class="separador">&nbsp;</div>
                </c:if>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr007" c="TITULO" lit="1000183" /></div>
                <div class="separador">&nbsp;</div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                    <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <c:if test="${__configform.axisctr007__CFORPAG__visible != 'false' || 
                                              __configform.axisctr007__CREVALI__visible != 'false' ||
                                              __configform.axisctr007__PREVALI__visible != 'false' ||
                                              __configform.axisctr007__BT_CUE_SALUT__visible != 'false'}">                                              
                                    <tr>
                                        <axis:ocultar f="axisctr007" c="CFORPAG" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CFORPAG"><axis:alt f="axisctr007" c="CFORPAG" lit="100712" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr007" c="CREVALI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CREVALI"><axis:alt f="axisctr007" c="CREVALI" lit="101432" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr007" c="PREVALI" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_PREVALI"><axis:alt f="axisctr007" c="PREVALI" lit="1000382" /></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr007" c="CFORPAG" dejarHueco="false">
                                            <td class="campocaja">
                                                <select  name = "CFORPAG" id ="CFORPAG" size="1" onchange="javascript:f_cambia_tipo_pago(this)" class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr007" c="CFORPAG" a="modificable=false&isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${sessionScope.axisctr_parametrosGarantias.formaPago}" var="formaPago">
                                                        <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_parametrosGarantias.CFORPAG}">selected</c:if>>${ formaPago.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr007" c="CREVALI" dejarHueco="false">
                                             <td class="campocaja">
                                               <select style="width:200px;" name = "CREVALI" id ="CREVALI" size="1" onchange="guardar_revalorizacion_1()"  
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr007" c="CREVALI" a="modificable=false&isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${sessionScope.axisctr_parametrosGarantias.tipoRevalorizacion}" var="tipoReval">
                                                        <option value = "${tipoReval.CATRIBU}" 
                                                        <c:if test="${sessionScope.axisctr_CREVALI==tipoReval.CATRIBU}">selected</c:if>> ${tipoReval.TATRIBU} </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr007" c="PREVALI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="PREVALI" name="PREVALI" onchange="guardar_revalorizacion_2()"
                                                <axis:atr f="axisctr007" c="PREVALI" a="modificable=false&isInputText=true"/> obligatorio="true" title="<axis:alt f="axisctr007" c="PREVALI" lit="1000382" />"
												size="15"  value="<fmt:formatNumber pattern="###,##0.00" value="${sessionScope.axisctr_PREVALI}"/>">
                                            </td>
                                        </axis:ocultar>                                
                                   
                                        <axis:visible f="axisctr007" c="BT_CUE_SALUT"> <!-- TODO: C:but_cue_salut -->
                                           <td> 
                                            <input type="button" class="boton" id="but_cue_salut" value="<axis:alt f="axisctr007" c="BT_CUE_SALUT" lit="104734" />" onclick="f_but_cue_salud()" />
                                           </td>  
                                        </axis:visible>
                                    </tr>
                                </c:if>
                                
                                <axis:ocultar f="axisctr007" c="CMODALIDAD">
                                <tr>
                                    <td class="titulocaja">
                                            <b id="label_CMODALI"><axis:alt f="axisctr007" c="CMODALIDAD" lit="100943" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <!--AMC-Bug 9678 -->    
                                    <td class="campocaja">
                                        <select style="width:200px;" name = "CMODALI" id ="CMODALI" size="1" onchange="f_guardadModalidad(this.value)"  
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr007" c="CMODALI" a="modificable=false&isInputText=true"/>>&nbsp;
                                            <option value = ""> - <axis:alt f="axisctr007" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach items="${sessionScope.axisctr_CMODALI}" var="MODALIDAD">
                                              <option value = "${MODALIDAD.CMODALIDAD}"
                                                <c:if test="${__formdata.CMODALI==MODALIDAD.CMODALIDAD}">selected</c:if>> ${MODALIDAD.TMODALIDAD}</option>
                                            </c:forEach>
                                        </select>
                                     </td>   
                                </tr>
                                </axis:ocultar>
                            </table>
                            
                           <!--********************bug etm ******21657*******************-->
                        <axis:ocultar f="axisctr007" c="DTOSRECS" dejarHueco="false">    
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
                                    <axis:visible f="axisctr007" c="PDTOCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOCOM"><axis:alt f="axisctr007" c="LIT_103100" lit="103100" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr007" c="PRECCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PRECCOM"><axis:alt f="axisctr007" c="LIT_9903608" lit="9903608" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr007" c="PDTOTEC" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOTEC"><axis:alt f="axisctr007" c="LIT_9903609" lit="9903609" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr007" c="PRECARG" >
                                        <td class="titulocaja">
                                            <b id="label_PRECARG"><axis:alt f="axisctr007" c="LIT_9903610" lit="9903610" /></b>
                                        </td>
                                    </axis:visible>
                                 
                                    <axis:visible f="axisctr007" c="CRGGARDIF">
                                     <td class="campocaja">
                                      <b id="label_CRGGARDIF">
                                        <axis:alt f="axisctr007" c="LIT_9903611" lit="9903611" />
                                      </b>
                                      </td>
                                    </axis:visible>  
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr007" c="PDTOCOM" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOCOM" name="PDTOCOM"  onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr007" c="LIT_103100" lit="103100"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PDTOCOM}"/>"
                                            <axis:atr f="axisctr007" c="PDTOCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr007" c="PRECCOM" >
                                        <td class="campocaja">
                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr007" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PRECCOM}"/>"
                                            <axis:atr f="axisctr007" c="PRECCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                       
                                             </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr007" c="PDTOTEC" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr007" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PDTOTEC}"/>"
                                            <axis:atr f="axisctr007" c="PDTOTEC" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr007" c="PRECARG" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="PRECARG" name="PRECARG" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr007" c="LIT_9903610" lit="9903610"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PRECARG}"/>"
                                            <axis:atr f="axisctr007" c="PRECARG" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>    
                                        <axis:visible f="axisctr007" c="CRGGARDIF" >
                                        <td>
                                      <input  
                                        <c:if test="${__formdata.OB_IAX_RIESGOS.CRGGARDIF == '1'}">checked="true"</c:if>   type="checkbox" id="CRGGARDIF" name="CRGGARDIF" value="${__formdata.OB_IAX_RIESGOS.CRGGARDIF}"/>
                                       
                                      </td>
                                    </axis:visible>
                                     </tr>
                             </table>
                             </axis:ocultar>
                               <!--fin bug etm *********************-->
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <axis:ocultar f="axisctr007" c="GARANTIAS">
                            <!-- DisplayTag Garantías -->
                            <c:if test="${! empty sessionScope.axisctr_garantias  }">
                                <c:set var="title0"><axis:alt f="axisctr007" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr007" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="axisctr007" c="IPRITOT" lit="1000497"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr007" c="IPRITAR" lit="1000496"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr007" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="axisctr007" c="DETGARANT" lit="9901659"></axis:alt></c:set>
                                <c:set var="title6"><axis:alt f="axisctr007" c="PREGGARANT" lit="9901660"></axis:alt></c:set>
                                <c:set var="title7"><axis:alt f="axisctr007" c="FRANGARANT" lit="9901661"></axis:alt></c:set>
                                <c:set var="title8"><axis:alt f="axisctr007" c="CMONCAP" lit="108645"/></c:set>
                                <c:if test="${empty sessionScope.num_garantias || sessionScope.num_garantias == 0}">
                                    <c:set var="num_gar">6</c:set>
                                </c:if>
                                <c:if test="${!empty sessionScope.num_garantias && sessionScope.num_garantias > 0 }">
                                    <c:set var="num_gar">${sessionScope.num_garantias}</c:set><!--  -->
                                </c:if>
                                <c:if test="${ fn:length(sessionScope.axisctr_garantias) < num_gar }">
                                    <c:set var="num_gar">${ fn:length(sessionScope.axisctr_garantias)}</c:set><!--  -->
                                </c:if>	
                             <div id="DSP_GARANTIAS" class="displayspaceOver" style="visibility:hidden;height:<c:out value="${num_gar*20+20+20}"/>px">&nbsp;</div>
                                <div id="dt_garantias" class="displayspacewomax" style="height:<c:out value="${num_gar*20+20+20}"/>px">   
                                    <display:table name="${sessionScope.axisctr_garantias}" id="miListaIdGarantias" export="false" class="dsptgtable" pagesize="${num_gar}" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true" style="width:99%;">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons"><input onclick="javascript:f_actualiza_checkbox(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                                                  __configform.axisctr007__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                                    /></div>            
                                        </display:column>
                                        <axis:visible f="axisctr007" c="CTARMAN">
                                         <display:column title="${title4}" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons"><input onclick="javascript:f_actualiza_manual(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                type="checkbox" id="CTARMAN" name="CTARMAN" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN}" 
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == '1'}">checked='checked'</c:if> />
                                            </div>            
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr007" c="DESCRIPCION">
                                            <display:column title="${title0}" sortable="false" sortProperty="OB_IAX_GARANTIAS.DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr007" c="ICAPITAL">
                                            <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_GARANTIAS.ICAPITAL" headerClass="sortable"  media="html" autolink="false" >
                                                <c:set var="CAPITAL">
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                        
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                    </c:if>
                                                </c:set>
                                                <div class="dspIcons">
                                                <c:set var="CLASS">
                                                 <c:choose>
                                                 <c:when test="${__configform.axisctr007__ICAPITAL__modificable == 'false'}">
                                                    campo campotexto campodisabled
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                   </c:otherwise>
                                                   
                                                   </c:choose>
                                                </c:set>
                                                <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                                                        <select id="ICAPITAL" name="ICAPITAL" onchange="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                        style="width:120px" class="${CLASS}"  <c:choose> <c:when test="${__configform.axisctr007__ICAPITAL__modificable == 'false'}"> disabled </c:when> <c:otherwise> <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if> </c:otherwise>  </c:choose> />  
                                                            <c:forEach items="${miListaIdGarantias.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                                                <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL==null || miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL==0}">
                                                                       <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.CDEFECTO == 1}">selected</c:if>
                                                                   </c:if>
                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL!=null}">
                                                                        <c:if test="${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL == miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}">selected</c:if>
                                                                   </c:if>>
                                                                   ${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:when>
                                                    
                                                    <c:otherwise>
                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                            <input onfocus="javascript:f_on_focus_capital(this);"
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '3' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5' }">
                                                            	<c:if  test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '8'}">
                                                                onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                            </c:if>
                                                            </c:if>
                                                            <c:choose> <c:when test="${__configform.axisctr007__ICAPITAL__modificable == 'false'}"> disabled </c:when> <c:otherwise> 
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '3' ||miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'||miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '8'}"> readonly</c:if>
                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>  
                                                            
                                                            </c:otherwise>  </c:choose>
                                                            type="text" id="ICAPITAL" name="ICAPITAL" value="${CAPITAL}" style="width:90px" class="${CLASS}"
                                                            formato="decimal" title="<axis:alt f="axisctr007" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr007" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                       <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdGarantias.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                       <a onclick ="f_abrir_axisctr163('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT }')">
	                                                       <img  src="images/lapiz.gif" title='<axis:alt f="axisctr007" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr007" c="TITULO_DESGLOSE" lit="180183" />'>
                                                       </a>
                                                       
                                                    </c:if>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                  
                                                </div>
                                                </display:column>
                                            </axis:visible>
                                              <axis:visible f="axisctr007" c="CMONCAP">
                                            <display:column media="html" title="${title8}" headerClass="headwidth10 sortable" autolink="false" >
                                            
                                                <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                        <!-- OJO -->
                                            <axis:visible f="axisctr007" c="IPRITAR">
                                            <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRITAR" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                <c:choose>
                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                 <input     type="text" id="IPRITAR_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this.value, '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>','1')" name="IPRITAR" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>" style="width:90px" class="${CLASS}"
                                                            formato="decimal" />
                                                </c:when>
                                                <c:otherwise>
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>
                                                </c:otherwise>
                                                </c:choose>
                                                
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        
                                        <axis:visible f="axisctr007" c="IPRITOT">
                                            <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_GARANTIAS.IPRITOT" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                 <c:choose>
                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                 <input     type="text" id="IPRITOT"  name="IPRITOT" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>" style="width:90px" class="${CLASS}"
                                                            formato="decimal" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>', this.value)" />
                                                </c:when>
                                                <c:otherwise>
                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>
                                                </c:otherwise>
                                                </c:choose>
                                                </div>
                                            </display:column>
                                        </axis:visible>
                                      
                                        <axis:visible f="axisctr007" c="DETGARANT">
                                        <display:column media="html" title="${title5}" headerClass="headwidth5 sortable" autolink="false" >
                                            <c:choose>
                                                <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                    <div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">D</a></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="dspIcons">D</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr007" c="PREGGARANT">
                                            <display:column media="html" title="${title6}" headerClass="headwidth5 sortable" autolink="false" >
                                                <c:choose>
                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                        <div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">P</a></div>
                                                     </c:when>
                                                    <c:otherwise>
                                                        <div class="dspIcons">P</div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisctr007" c="FRANGARANT">
                                        <display:column media="html" title="${title7}" headerClass="headwidth5 sortable" autolink="false" >
                                            <div class="dspIcons"><a href="#">F</a></div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>
                                    </div>
                            
                                
                            </c:if>
                            </axis:ocultar>
                        </td>
                    </tr>
                </table>
                <div class="separador">&nbsp;</div>
                <axis:visible f="axisctr007" c="DSP_RESULTADO">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr007" c="DSP_RESULTADO" lit="1000345" /><axis:visible c="CMONPROD" f="axisctr007">  <c:if test="${!empty CMONPROD}">  <axis:alt f="axisctr007" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${requestScope.TMONPROD} </c:if> </axis:visible></div>
                <!--campos-->
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <!-- DisplayTag detalle primas -->
                            <c:set var="title0"><axis:alt f="axisctr007" c="IPRITAR" lit="1000496"/></c:set>         <!-- IPRITAR -->
                            <c:set var="title1"><axis:alt f="axisctr007" c="IIPS" lit="101515"/></c:set>            <!-- IIPS -->
                            <c:set var="title2"><axis:alt f="axisctr007" c="IDGS" lit="1000498"/></c:set>         <!-- IDGS -->
                            <c:set var="title3"><axis:alt f="axisctr007" c="ICONSOR" lit="103101"/></c:set>           <!-- ICONSOR -->                            
                            <c:set var="title4"><axis:alt f="axisctr007" c="IRECFRA" lit="1000341"/></c:set>            <!-- IRECFRA -->
                            <c:set var="title5"><axis:alt f="axisctr007" c="PRECARG" lit="101671"/></c:set>         <!-- PRECARG -->
                            <c:set var="title6"><axis:alt f="axisctr007" c="IEXTRAP" lit="101918"/></c:set>         <!-- IEXTRAP -->                                        
                            <c:set var="title7"><axis:alt f="axisctr007" c="PDTOCOM" lit="1000119"/></c:set>            <!-- PDTOCOM -->
                            <c:set var="title8"><axis:alt f="axisctr007" c="ITOTALR" lit="140531"/></c:set>    <!-- ITOTALR -->     
                            <c:set var="title9"><axis:alt f="axisctr007" c="IPRIANU" lit="1000497"/></c:set>  <!-- IPRIANU -->     
                            <c:set var="title10"><axis:alt f="axisctr007" c="IPRIREB" lit="9000837"/></c:set>      <!-- IPRIREB -->       
                            <c:set var="title11"><axis:alt f="axisctr007" c="IARBITR" lit="101705"/></c:set>       <!-- IARBRIT -->       
                            <c:set var="title12"><axis:alt f="axisctr007" c="ICDERREG" lit="9001509"/></c:set>     <!-- ICDERREG -->       
                            <c:set var="title13"><axis:alt f="axisctr007" c="IEXTRAP" lit="101918"/></c:set>       <!-- IEXTRAP -->       
                            <div id="dt_resultados" class="displayspace">
                                  <display:table name="${sessionScope.axisctr_primasTotales}" id="axisctr_primasTotales" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                  requestURI="axis_${pantalla}.do?paginar=true">
                                     <%@ include file="../include/displaytag.jsp"%>
                                     <axis:visible f="axisctr007" c="CIPRITAR">
                                         <display:column title="${title0}" sortable="false" sortProperty="IPRITAR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITAR}'/></div>
                                         </display:column>
                                     </axis:visible>
                                    <axis:visible f="axisctr007" c="IIEXTRAP">
                                         <display:column title="${title13}" sortable="false" sortProperty="IIEXTRAP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIEXTRAP}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IRECARG">
                                         <display:column title="${title5}" sortable="false" sortProperty="IRECARG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECARG}'/></div>
                                         </display:column>
                                     </axis:visible>                                     
                                     <axis:visible f="axisctr007" c="ITOTDTO">
                                         <display:column title="${title7}" sortable="false" sortProperty="ITOTDTO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDTO}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IPRITOT">
                                         <display:column title="${title9}" sortable="false" sortProperty="IPRITOT" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITOT}'/></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="ICONSOR">
                                        <display:column title="${title3}" sortable="false" sortProperty="ICONSOR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICONSOR}'/></div>
                                        </display:column>                     
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IRECFRA">
                                         <display:column title="${title4}" sortable="false" sortProperty="IRECFRA" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECFRA}'/></div>
                                         </display:column>                                                                                                                           
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IIPS">
                                         <display:column title="${title1}" sortable="false" sortProperty="IIPS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/></div>
                                         </display:column>  
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IDGS">
                                         <display:column title="${title2}" sortable="false" sortProperty="IDGS" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IDGS}'/></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IARBITR">
                                         <display:column title="${title11}" sortable="false" sortProperty="IARBITR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IARBITR}'/></div>
                                         </display:column> 
                                     </axis:visible>                                                               
                                     <axis:visible f="axisctr007" c="ICDERREG">
                                         <display:column title="${title12}" sortable="false" sortProperty="ICDERREG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICDERREG}'/></div>
                                         </display:column> 
                                     </axis:visible>   
                                     <axis:visible f="axisctr007" c="ITOTALR">
                                         <display:column title="${title8}" sortable="false" sortProperty="ITOTALR" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr007" c="IPRIREB">
                                         <display:column title="${title10}" sortable="false" sortProperty="IPRIREB" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRIREB}'/></div>
                                         </display:column> 
                                     </axis:visible>                                                               
                                 </display:table>
                              
                             </div>
                         </td>
                     </tr>
                </table>
                </axis:visible>
            </td>
        </tr>
        <tr>
            <axis:visible f="axisctr007" c="but_tarifar"> 
                <td align="center">
                    <div class="separador">&nbsp;</div>
                    <input type="button" class="boton" id="but_tarifar" value="<axis:alt f="axisctr007" c="BT_TARIFAR" lit="101688"></axis:alt>" onclick="javascript:f_tarifar()" />
                    
                <td>
            </axis:visible>
        </tr>

    </table>
    <!-- Botonera -->
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr007</c:param>
        <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr007">cancelar</axis:visible><axis:visible f="axisctr007" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr007" c="BT_SEG">,siguiente</axis:visible></c:param>
    </c:import>
</form>