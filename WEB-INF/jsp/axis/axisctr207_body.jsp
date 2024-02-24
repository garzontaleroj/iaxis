<%/* Revision:# fFmLHmPl5ExpaqWU2FqDKQ== # */%>
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

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>

<!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_DET" lit="9908904" /></c:param>
    <c:param name="nid" value="axiscalculafecha" />
</c:import>
<!-- BUG 41143/229973 - 17/03/2016 - JAEG -->

<c:if test="${param.multiPantalla != 'true'}">        
    <form name="${pantalla}Form" action="" method="POST">
    <input type="hidden" name="operation" value=""/>
    <c:set var="modalidad">
    <c:choose>
        <c:when test="${sessionScope.MODO eq 'SIMULACION'}">
        <axis:alt f="axisctr207" c="TITULO_ADIC" lit="108021" />
        </c:when>
        <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA' || sessionScope.MODO eq 'ALTA_COLECTIVO'}">
        <axis:alt f="axisctr207" c="TITULO_ADIC" lit="101110" />
        </c:when>
        <c:otherwise>
        <axis:alt f="axisctr207" c="TITULO_ADIC2" lit="104752" />
        </c:otherwise>
    </c:choose>
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="modalidad">${modalidad}
         <axis:visible f="axisctr207" c="NPOLIZA"> 
           <axis:alt f="axisctr207" c="TITULO_FORM" lit="101779"/> 
           <axis:ocultar f="axisctr207" c="TITULO_COLECTIVO" dejarHueco="false">
            	<axis:alt f="axisctr207" c="TITULO_FORM" lit="102707"/> 
            </axis:ocultar>
            ${__formdata.NPOLIZA}
         </axis:visible>
         <axis:visible f="axisctr207" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
         </axis:visible>
        </c:param>
        <c:param name="titulo"></c:param>
        <c:param name="formulario"><axis:alt f="axisctr207" c="TITULO" lit="1000183"/></c:param>
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
    <input type="hidden" name="hayCambios" id="hayCambios" value="${empty hayCambios? sessionScope.hayCambios : hayCambios}"/>
    <input type="hidden" name="ICAPITALSELECTED" id="ICAPITALSELECTED" value=""/>
    <input type="hidden" name="ICAPITALSELECTED_CONPUNTOS" id="ICAPITALSELECTED_CONPUNTOS" value=""/>
    <input type="hidden" name="ICAPITAL_MODIFICADO_TEMPORAL" id="ICAPITAL_MODIFICADO_TEMPORAL" value=""/>
    <input type="hidden" name="IMPRESO" id="IMPRESO" value="${sessionScope.IMPRESO}">
    <input type="hidden" name="PCCUESTI" id="PCCUESTI" value="${sessionScope.PCCUESTI}">
    <input type="hidden" name="PREG_COND_TOMASEG" id="PREG_COND_TOMASEG" value="${__formdata.PREG_COND_TOMASEG}">
    <input type="hidden" name="CCRITICO" id="CCRITICO" value="${CCRITICO}">
    <input type="hidden" name="NOVISIBLE" id="NOVISIBLE" value="${NOVISIBLE}">
	
	<input type="hidden" name="VSUPLE" id="VSUPLE" value="${sessionScope.VSUPLE}">

    <!-- INI BUG 41143/229973 - 17/03/2016 - JAEG -->
    <input type="hidden" id="FINIVIGH" name="FINIVIGH" value=""/>
    <input type="hidden" id="FFINVIGH" name="FFINVIGH" value=""/>
    <input type="hidden" id="CCOBPRIMA" name="CCOBPRIMA" value=""/>
    <input type="hidden" id="IPRIDEV" name="IPRIDEV" value=""/>
    <!-- FIN BUG 41143/229973 - 17/03/2016 - JAEG -->
    
    <input type="hidden" id="SUPLEMENTO" name="SUPLEMENTO" value=""/>
    
    <!--MPC 14/01/2022 TASK 16563 Se adiciona campo-->
    <input type="hidden" name="MOD_CPARPRO_239" id="MOD_CPARPRO_239" value="${__formdata.MOD_CPARPRO_239}">
    
    <input type="hidden" name="NCERTIF" id="NCERTIF" value="${sessionScope.NCERTIF}">
    
    <!--VARS DE COMBOS DISABLED(MODIFICACION=false) CON VALOR-->
    <input type="hidden" id="CREVALI_CONFIG" name="CREVALI_CONFIG" value=""/>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr031" c="titulo_axisctr012" lit="9908333" /></c:param>
        <c:param name="nid" value="axisctr230" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_DET" lit="1000185" /></c:param>
        <c:param name="nid" value="axisctr011" />
    </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="PSU003" lit="9002255" /></c:param>
        <c:param name="nid" value="axispsu003" />
    </c:import>
       <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TIT_FRANQ" lit="9001800" /></c:param>
        <c:param name="nid" value="axisctr013" />
    </c:import>
    <!-- Bug 0027955/0152240 - JSV (17/09/2013) => Ponemos literal generico a axisctr074 -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TIT_FRANQ" lit="1000113" /></c:param>
        <c:param name="nid" value="axisctr074" />
    </c:import>
    
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_188" lit="9901369" /></c:param>
        <c:param name="nid" value="axisctr188" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_188" lit="9901369" /></c:param>
        <c:param name="nid" value="axisctr218" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_PREG" lit="1000186" /></c:param>
        <c:param name="nid" value="axisctr012" />
    </c:import>
    

      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" /></c:param>
        <c:param name="nid" value="axisctr163" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_EDIT" lit="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr207" c="TITULO_IMPRIMIR" lit="1000205" /></c:param>
    </c:import>    
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr207" c="TITULO_MODALMAX" lit="103672" /></c:param>
        <c:param name="nid" value="axisctr185" />
    </c:import>
   <!-- INI-CONF-209-ASDQ  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr222" c="TITULO_DET" lit="89905651" /></c:param>
        <c:param name="nid" value="axisctr222" />
    </c:import>
    <!-- FIN-CONF-209-ASDQ  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr508" c="TITULO_DEDUCIBLE" lit="9909784" /></c:param>
        <c:param name="nid" value="axisctr508" />
    </c:import>    
	
	<c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisrea052" c="TITULO_ACUMULAC" lit=""/>
      </c:param>
      <c:param name="nid" value="axisrea052"/>
    </c:import>
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <c:if test="${param.multiPantalla != 'true'}">        
                    <table class="seccion">
                        <tr>
                            <td style="font-size: 11px;">
                            <font color="#FF8400" ><b><axis:alt f="axisctr207" c="TITULO_RIESGO" lit="100649" /> ${__formdata.OB_IAX_RIESGOS.TRIESGO}</b></font>
                            </td>
                        </tr>
                    </table>
                    <div class="separador">&nbsp;</div>
                </c:if>    
                
   


                <c:if test="${!empty sessionScope.axisctr_preguntasRiesgo ||
                                !empty sessionScope.axisctr_pregDespeses ||
                                !empty sessionScope.axisctr_pregQuestSalut}">
                    <c:import url="axisctr207_preguntas.jsp">
                        <c:param name="multiPantalla" value="${multiPantalla}"/>
                    </c:import>
                </c:if>
                <div class="separador">&nbsp;</div>
               
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr207" c="TITULO" lit="1000183" /></div>
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
                                <c:if test="${__configform.axisctr207__CFORPAG__visible != 'false' || 
                                              __configform.axisctr207__CREVALI__visible != 'false' ||
                                              __configform.axisctr207__PREVALI__visible != 'false' ||
                                              __configform.axisctr207__BT_CUE_SALUT__visible != 'false'}">                                              
                                    <tr>
                                        <axis:ocultar f="axisctr207" c="CFORPAG" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CFORPAG"><axis:alt f="axisctr207" c="CFORPAG" lit="100712" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr207" c="CREVALI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CREVALI"><axis:alt f="axisctr207" c="CREVALI" lit="101432" /></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr207" c="PREVALI" dejarHueco="false"> 
                                            <td class="titulocaja">
                                                <b id="label_PREVALI"><axis:alt f="axisctr207" c="PREVALI" lit="1000382" /></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisctr207" c="CFORPAG" dejarHueco="false">
                                            <td class="campocaja">
                                                <select  name = "CFORPAG" id ="CFORPAG" size="1" onchange="javascript:f_cambia_tipo_pago(this)" class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr207" c="CFORPAG" a="modificable=false&isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${sessionScope.axisctr_parametrosGarantias.formaPago}" var="formaPago">
                                                        <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_parametrosGarantias.CFORPAG}">selected</c:if>>${ formaPago.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr207" c="CREVALI" dejarHueco="false">
                                             <td class="campocaja">
                                               <select style="width:200px;" name = "CREVALI" id ="CREVALI" size="1" onchange="guardar_revalorizacion_1()"  
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr207" c="CREVALI" a="modificable=false&isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${sessionScope.axisctr_parametrosGarantias.tipoRevalorizacion}" var="tipoReval">
                                                        <option value = "${tipoReval.CATRIBU}" 
                                                        <c:if test="${sessionScope.axisctr_CREVALI==tipoReval.CATRIBU}">selected</c:if>> ${tipoReval.TATRIBU} </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr207" c="PREVALI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="PREVALI" name="PREVALI" onchange="guardar_revalorizacion_2()"
                                                <axis:atr f="axisctr207" c="PREVALI" a="modificable=false&isInputText=true"/> obligatorio="true" title="<axis:alt f="axisctr207" c="PREVALI" lit="1000382" />" size="15" value="${sessionScope.axisctr_PREVALI}"/>
                                            </td>
                                        </axis:ocultar>  
                                        
                                   
                                        <axis:visible f="axisctr207" c="BT_CUE_SALUT"> <!-- TODO: C:but_cue_salut -->
                                           <td> 
                                            <input type="button" class="boton" id="but_cue_salut" value="<axis:alt f="axisctr207" c="BT_CUE_SALUT" lit="104734" />" onclick="f_but_cue_salud()" />
                                           </td>  
                                        </axis:visible>
                                          
                                    </tr>
                                </c:if>
                                
                                <axis:ocultar f="axisctr207" c="CMODALIDAD">
                                <tr>
                                    <td class="titulocaja">
                                            <b id="label_CMODALI"><axis:alt f="axisctr207" c="CMODALIDAD" lit="100943" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <!--AMC-Bug 9678 -->    
                                    <td class="campocaja">
                                        <!-- INI - CJAD - 06/NOV2019 - IAXIS4979 - Corrección de errores en el proceso de Emisión RC Profesional medica y clinica -->
										<!--<select style="width:200px;" name = "CMODALI" id ="CMODALI" size="1" onchange="f_guardadModalidad(this.value)"  
                                        class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr207" c="CMODALI" a="modificable=false&isInputText=true"/>-->
                                        <select style="width:200px;" name = "CMODALI" id ="CMODALI" size="1" onchange="f_guardadModalidad(this.value)"  
                                        class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr207" c="CMODALI" a="isInputText=true"/>>&nbsp;
                                        <!-- FIN - CJAD - 06/NOV2019 - IAXIS4979 - Corrección de errores en el proceso de Emisión RC Profesional medica y clinica -->
                                            <option value = ""> - <axis:alt f="axisctr207" c="SELECCIONAR" lit="108341"/> - </option>
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
                        <axis:visible f="axisctr207" c="DTOSRECS">    
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                </tr>
                                  <tr>
                                    <axis:visible f="axisctr207" c="PDTOCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOCOM"><axis:alt f="axisctr207" c="LIT_103100" lit="103100" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr207" c="PRECCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PRECCOM"><axis:alt f="axisctr207" c="LIT_9903608" lit="9903608" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr207" c="PDTOTEC" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOTEC"><axis:alt f="axisctr207" c="LIT_9903609" lit="9903609" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr207" c="PRECARG" >
                                        <td class="titulocaja">
                                            <b id="label_PRECARG"><axis:alt f="axisctr207" c="LIT_9903610" lit="9903610" /></b>
                                        </td>
                                    </axis:visible>
                                 
                                    <axis:visible f="axisctr207" c="CRGGARDIF">
                                     <td class="campocaja">
                                      <b id="label_CRGGARDIF">
                                        <axis:alt f="axisctr207" c="LIT_9903611" lit="9903611" />
                                      </b>
                                      </td>
                                    </axis:visible>  
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr207" c="PDTOCOM" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOCOM" name="PDTOCOM"  onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr207" c="LIT_103100" lit="103100"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PDTOCOM}"/>"
                                            <axis:atr f="axisctr207" c="PDTOCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr207" c="PRECCOM" >
                                        <td class="campocaja">
                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr207" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PRECCOM}"/>"
                                            <axis:atr f="axisctr207" c="PRECCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                       
                                             </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr207" c="PDTOTEC" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr207" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PDTOTEC}"/>"
                                            <axis:atr f="axisctr207" c="PDTOTEC" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr207" c="PRECARG" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="PRECARG" name="PRECARG" onchange="guardar_descuentos_recargos()"
                                            title="<axis:alt f="axisctr207" c="LIT_9903610" lit="9903610"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${requestScope.PRECARG}"/>"
                                            <axis:atr f="axisctr207" c="PRECARG" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>    
                                        <axis:visible f="axisctr207" c="CRGGARDIF" >
                                        <td>
                                      <input <axis:atr f="axisctr207" c="CRGGARDIF" a="modificable=true&isInputText=false"/>
                                        <c:if test="${__formdata.OB_IAX_RIESGOS.CRGGARDIF == '1'}">checked="true"</c:if>   type="checkbox" id="CRGGARDIF" name="CRGGARDIF" value="${__formdata.OB_IAX_RIESGOS.CRGGARDIF}"/>
                                        
                                      </td>
                                    </axis:visible>
                                     </tr>
                             </table>
                             </axis:visible>
                               <!--fin bug etm *********************-->
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                        	 <c:if test="${! empty sessionScope.axisctr_partidas  }">
					                  <c:import url="axisctr207_partidas.jsp"/>
					                </c:if>
                          <axis:ocultar f="axisctr207" c="GARANTIAS">
                            <!-- DisplayTag GarantÃ­as -->
                            <c:if test="${! empty sessionScope.axisctr_garantias  }">
							
                                <!-- INI BUG 41143/229973 - 17/03/2016 - JAEG -->
                                <c:set var="title16"><axis:alt f="axisctr207" c="FINIVIG" lit="9908885"/></c:set>     <!-- FINIVIG -->
                                <c:set var="title17"><axis:alt f="axisctr207" c="FFINVIG" lit="9908886"/></c:set>     <!-- FFINVIG -->
                                <c:set var="title18"><axis:alt f="axisctr207" c="CCOBPRIMA" lit="9909252"/></c:set>     <!-- CCOBPRIMA -->
                                <c:set var="title19"><axis:alt f="axisctr207" c="IPRIDEV" lit="9909251"/></c:set>     <!-- IPRIDEV -->                                
                                <!-- FIN BUG 41143/229973 - 17/03/2016 - JAEG -->											
							
                                <c:set var="title0"><axis:alt f="axisctr207" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                <c:set var="title1"><axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"></axis:alt></c:set>
                                <c:set var="title2"><axis:alt f="axisctr207" c="IPRITOT" lit="1000497"/></c:set>
                                <c:set var="title3"><axis:alt f="axisctr207" c="IPRITAR" lit="1000496"/></c:set>
                                <c:set var="title4"><axis:alt f="axisctr207" c="CTARMAN" lit="9000958"/></c:set>
                                <c:set var="title5"><axis:alt f="axisctr207" c="DETGARANT" lit="9901659"></axis:alt></c:set>
                                <c:set var="title6"><axis:alt f="axisctr207" c="PREGGARANT" lit="9901660"></axis:alt></c:set>
                                <c:set var="title7"><axis:alt f="axisctr207" c="FRANGARANT" lit="9901661"></axis:alt></c:set>
                                <c:set var="title8"><axis:alt f="axisctr207" c="CMONCAP" lit="108645"/></c:set>
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
                                <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%" id="miListaIdGarantias">
                                      <thead>
                                            <tr>
                                            
                                            
                                            <axis:visible f="axisctr207" c="selectedGarantia">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                               
                                            <axis:visible f="axisctr207" c="CTARMAN">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                            
                                            
                                            <axis:visible f="axisctr207" c="DESCRIPCION">
                                                <th style="width:30%;height:0px"></th>
                                            </axis:visible>
                                            
                                             
                                            <axis:visible f="axisctr207" c="ICAPITAL">    
                                                <th style="width:12%;height:0px"></th>
                                             </axis:visible>  
                                              <%--axis:visible f="axisctr207" c="CAPRECOMEND"> 
                                                <th style="width:10%;height:0px"></th>
                                              </axis:visible--%>
                                            <axis:visible f="axisctr207" c="CMONCAP">
                                                <th style="width:6%;height:0px;"></th>
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:ocultar f="axisctr207" c="FINIVIG" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:ocultar>                                            
                                            <axis:ocultar f="axisctr207" c="FFINVIG" >
                                                <th style="width:10%;height:0px"></th>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr207" c="CCOBPRIMA" >
                                                <th style="width:3%;height:0px"></th>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr207" c="IPRIDEV" >
                                                <th style="width:8%;height:0px"></th>
                                            </axis:ocultar>                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                                           
                                            
                                             <axis:visible f="axisctr207" c="IPRITAR">
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="IPRITOT">
                                                <th style="width:8%;height:0px"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="DETGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="PREGGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="FRANGARANT">
                                                <th style="width:5%;height:0px;"></th>
                                            </axis:visible>
                                            
                                        </tr>
                                        <tr>  
                                           <axis:visible f="axisctr207" c="selectedGarantia">
                                          <td class="sortable" align="center"></td>
                                           </axis:visible>
                                         <axis:visible f="axisctr207" c="CTARMAN">
                                                <td class="sortable"><b>${title4}</b></td>
                                            </axis:visible>
                                           <axis:visible f="axisctr207" c="DESCRIPCION">
                                                <td class="sortable"><b>${title0}</b></td>
                                            </axis:visible>
                                            
                                            <axis:visible f="axisctr207" c="ICAPITAL">
                                                <td class="sortable"><b>${title1}</b></td>                                        
                                            </axis:visible>
											
											<axis:visible f="axisctr207" c="CAPRECOMEND">
                                                <td class="sortable"><b>Capital Asegurable</b></td>                                        
                                            </axis:visible>

                                              <%--axis:visible f="axisctr207" c="CAPRECOMEND"> 
                                                  <td class="sortable"><b><axis:alt f="axisctr207" c="CAPRECOMEND" lit="9903813"/></b></td>     
                                              </axis:visible--%>
                                            <axis:visible f="axisctr207" c="CMONCAP">
                                                <td class="sortable"><b>${title8}</b></td>                                        
                                            </axis:visible>
                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            <axis:visible f="axisctr207" c="FINIVIG">
                                                <td class="sortable"><b>${title16}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="FFINVIG">
                                                <td class="sortable"><b>${title17}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="CCOBPRIMA">
                                                <td class="sortable"><b>${title18}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="IPRIDEV">
                                                <td class="sortable"><b>${title19}</b></td>                                        
                                            </axis:visible>                                            
                                            <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                            
                                            <axis:visible f="axisctr207" c="IPRITAR">
                                                <td class="sortable"><b>${title3}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="IPRITOT">
                                                <td class="sortable"><b>${title2}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="DETGARANT">
                                                  <td class="sortable"><b>${title5}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="PREGGARANT">
                                                 <td class="sortable"><b>${title6}</b></td>                                        
                                            </axis:visible>
                                            <axis:visible f="axisctr207" c="FRANGARANT">
                                                  <td class="sortable"><b>${title7}</b></td>                                        
                                            </axis:visible>
                                        </tr>   
                                        </thead>
                                           <tbody >
										   
										   
                                  
                                                   <c:forEach items="${sessionScope.axisctr_garantias}" var="miListaIdGarantias" varStatus="x"> 
                                                 
                                                      <tr  tipo="ri" id="g_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" title="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}-${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"
                                                        <c:if test="${x.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
                                                        <c:if test="${x.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>
                                                          >
                                        
                                        <axis:visible f="axisctr207" c="selectedGarantia">
                                        
                                                            <td class="dspText" align="left">   
                                                                  <div align="left" >
                                                                  
                                                                  <c:choose>
                                                                      <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                        <img id="img_DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" src="images/mes.gif" onclick="toggleDisplay2('DSP_DATOS_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this)" style="cursor:pointer"/> 
                                                                         <input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                                        type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                                                                          __configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                                                            />
                                                                           
                                                                      </c:when>
                                                                      <c:otherwise>
                                                                      
                                                                       <img src="images/blank.gif"/>
                                                                        <input onclick="javascript:f_actualiza_checkbox_json(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                                        type="checkbox" id="selectedGarantia" name="selectedGarantia" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked='checked'</c:if> 
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPGAR == 2 ||
                                                                                          __configform.axisctr207__COBLIGA__modificable == 'false'}">disabled='disabled'</c:if>
                                                                            />
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>   
                                                            </td>
                                                           </axis:visible>
                                                           
                                                             <axis:visible f="axisctr207" c="CTARMAN">
                                                             <td class="dspText">   
                                                                <div class="dspIcons"><input onclick="javascript:f_actualiza_manual_json(this, '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                                    type="checkbox" id="CTARMAN" name="CTARMAN" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN}" 
                                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == '1'}">checked='checked'</c:if> />
                                                                </div> 
                                                             </td>
                                                         </axis:visible>
                                                      
                                                          <axis:visible f="axisctr207" c="DESCRIPCION">
                                                                <td class="dspText">   
                                                                    <div class="dspText">${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}</div>
                                                                </td>
                                                          </axis:visible>
                                                          <axis:visible f="axisctr207" c="ICAPITAL">
                                                          	
                                                                <td class="dspText">   
																
                                                                    <c:set var="CAPITAL">
                                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '4'}">
                                                                            
                                                                            <fmt:formatNumber pattern="###,###,###,###,###,###.##" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL}"/>
                                                                        </c:if>
                                                                    </c:set>
                                                                    <div class="dspIcons">
                                                                    <c:set var="CLASS">
                                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                                        <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                                    </c:set>
                                                                    <c:choose>
                                                                        <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '7'}">
                                                                            <select id="ICAPITAL_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" name="ICAPITAL_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" onchange="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                                            style="width:120px; text-align:right" class="${CLASS}" <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}">disabled</c:if>/>                                                                >
                                                                                <c:forEach items="${miListaIdGarantias.OB_IAX_GARANTIAS.LISTACAPITALES}" var="capitales">                                                                    
                                                                                    <option value = "${capitales.OB_IAXPAR_GARANPROCAP.ICAPITAL}"
                                                                                       <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPITAL==null}">
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
																				<c:if test="${__formdata.SUPLEMENTO != '684'}">
                                                                                <input  onfocus="javascript:f_on_focus_capital(this);" 
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '1' && miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '3' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '5' }">
                                                                                    <c:if  test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP != '8'}">
                                                                                    onblur="javascript:f_selecciona_garantia(this.value, '1', '${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}');"
                                                                                	</c:if>
                                                                            	</c:if>
                                                                            	<c:if test="${__formdata.SUPLEMENTO == '685' && (SPRODUC == 8062 || SPRODUC == 8063)}">
                                                                            		readonly disabled='disabled'
                                                                            	</c:if>
                                                                            	<c:if test="${(SPRODUC >= 80038 && SPRODUC <= 80043)}">
                                                                                		readonly disabled='disabled'
                                                                                </c:if>
                                                                                
                                                                                <c:if test="${__formdata.SUPLEMENTO == '342' && (SPRODUC == 8066 || SPRODUC == 8069 || SPRODUC == 8070 || SPRODUC == 8073)}">
                                                                            		disabled
                                                                            	</c:if>
                                                                                
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '1' || miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '3' ||miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '5'||miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '8'}"> readonly</c:if>
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>                                                                
                                                                                type="text" id="ICAPITAL_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" name="ICAPITAL_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" value="${CAPITAL}" style="width:90px; text-align:right" class="${CLASS}"
                                                                                formato="decimal" title="<axis:alt f="axisctr207" c="ICAPITAL" lit="1000073"/> <axis:alt f="axisctr207" c="ICAPITAL_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                                           <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CTIPCAP == '8' && miListaIdGarantias.OB_IAX_GARANTIAS.CDETALLE == 1 && miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                                           <a onclick ="f_abrir_axisctr163('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT }')">
                                                                                   <img  src="images/lapiz.gif" title='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />' alt='<axis:alt f="axisctr207" c="TITULO_DESGLOSE" lit="180183" />'></c:if>
                                                                           </a>
                                                                           </c:if>
                                                                           </c:if>
                                                                           
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                      
                                                                    </div>
																	
                                                                    </td>
                                                                </axis:visible>
																
																
																<axis:visible f="axisctr207" c="CAPRECOMEND">
                                                                        <td class="dspText">   
                                                                            <div class="dspNumber">
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
                                                                            </div>
                                                                        </td>
                                                                </axis:visible>

                                                                     <%--axis:visible f="axisctr207" c="CAPRECOMEND"> 
                                                                         <td class="dspText">  
                                                                              <div class="dspNumber">
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.ICAPRECOMEND}"/>
                                                                              </div>
                                                                         </td>
                                                                     </axis:visible--%>
                                                                 <axis:visible f="axisctr207" c="CMONCAP">
                                                                        <td class="dspText">   
                                                                            <div class="dspText" title="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}" alt="${miListaIdGarantias.OB_IAX_GARANTIAS.TMONCAP}">
                                                                              ${miListaIdGarantias.OB_IAX_GARANTIAS.CMONCAPINT}
                                                                             </div>
                                                                        </td>
                                                                </axis:visible>
                                                                
                                                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                                <axis:visible f="axisctr207" c="FINIVIG">
                                                                    <td class="dspText">
                                                                        <div class="dspIcons">
                                                                            <c:set var="CLASS">
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                                            </c:set>
                                                                                                                                            
                                                                            <input  type="text" id="FINIVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"
                                                                                    <axis:atr f="axisctr207" c="FINIVIG" a="modificable=true&formato=fecha"/>
                                                                                    name="FINIVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FINIVIG}"/>" 
                                                                                    style="width:90%;" class="${CLASS}"
                                                                                    formato="fecha"
                                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>
                                                                                    onchange="f_onchange_fvigenciaini('FINIVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')"
                                                                                    title="<axis:alt f="axisctr207" c="FINIVIG" lit="9908885"/> <axis:alt f="axisctr207" c="FINIVIG_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"/>                                                          
                                                                        </div>                                                                                                                                            
                                                                    </td>
                                                                </axis:visible>
                                                                
                                                                <axis:visible f="axisctr207" c="FFINVIG">
                                                                    <td class="dspText">
                                                                        <div class="dspIcons">
                                                                            <c:set var="CLASS">
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">campo campotexto</c:if>
                                                                                <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">campo campotexto campodisabled</c:if>
                                                                            </c:set>
                                                                                                                                            
                                                                            <input  type="text" id="FFINVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                                    <axis:atr f="axisctr207" c="FFINVIG" a="modificable=true&formato=fecha"/>
                                                                                    name="FFINVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaIdGarantias.OB_IAX_GARANTIAS.FFINVIG}"/>"
                                                                                    style="width:80%;" class="${CLASS}"
                                                                                    formato="fecha"
                                                                                   <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '0'}"> disabled</c:if>  
                                                                                    onchange="f_onchange_fvigencia('FFINVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')"
                                                                                    title="<axis:alt f="axisctr207" c="FFINVIG" lit="9908886"/> <axis:alt f="axisctr207" c="FFINVIG_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"/>
                                                                                    
                                                                         <!--   <a id="icon_FFINVIG">
                                                                                <c:set var="CLASS">
                                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'}">width:12%; vertical-align:middle; visibility: hidden;</c:if>
                                                                                    <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">width:12%; vertical-align:middle; </c:if>
                                                                                </c:set>
                                                                                <img style="${CLASS}"
                                                                                     border="0"
                                                                                     title="<axis:alt f="axisctr207" c="FFINVIG" lit="9908886"/> <axis:alt f="axisctr207" c="FFINVIG_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"
                                                                                     onclick="f_calculadora('FFINVIG_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')" src="images/calculadora.gif"/>
                                                                            </a> -->                                                                           
                                                                        </div>                                                                                                                                            
                                                                    </td>
                                                                </axis:visible>
                                                                
                                                                <axis:visible f="axisctr207" c="CCOBPRIMA" >
                                                                    <td class="dspText" align="left">                                                                   
                                                                        <input <axis:atr f="axisctr207" c="CCOBPRIMA" a="modificable=true&isInputText=false"/>                                                                              
                                                                            type="checkbox"
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.CCOBPRIMA == '1' && miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">checked="true"</c:if> 
                                                                            <c:if test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA != '1'  || sessionScope.NMOVIMI eq 1}">disabled="disabled"</c:if> 
                                                                            id="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" 
                                                                            name="CCOBPRIMA_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}"
                                                                            onclick="f_ccobprima(this)"                                                                            
                                                                            title="<axis:alt f="axisctr207" c="CCOBPRIMA" lit="9909252"/> <axis:alt f="axisctr207" c="CCOBPRIMA_GAR" lit="103455"/> ${miListaIdGarantias.OB_IAX_GARANTIAS.DESCRIPCION}"
                                                                            value="${__formdata.OB_IAX_GARANTIAS.CCOBPRIMA}"/>
                                                                    </td>
                                                                </axis:visible>
                                                                
                                                               <axis:visible f="axisctr207" c="IPRIDEV" >
                                                                <td class="dspText">  
                                                                    <div class="dspNumber">
                                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRIDEV}"/>
                                                                    </div>
                                                                </td>
                                                                </axis:visible>
                                                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                                                
                                                                 <axis:visible f="axisctr207" c="IPRITAR">
                                                                         <td class="dspText">  
                                                                            <div class="dspNumber">
																			<c:if test="${empty psu_critica }">
                                                                                <c:choose>
                                                                                <c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
                                                                                 <input     type="text" id="IPRITAR_${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', this.value, '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>','1')" name="IPRITAR" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>" style="width:90px; text-align:right" class="${CLASS}"
                                                                                            formato="decimal" />
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>
                                                                                </c:otherwise>
                                                                                </c:choose>
																			</c:if>
                                                                            </div>
                                                                            </td>
                                                                    </axis:visible>
                                                                    <axis:visible f="axisctr207" c="IPRITOT">
                                                                        <td class="dspText">  
                                                                            <div class="dspNumber">
																			<c:if test="${empty psu_critica }">
																				 <c:choose>
																				<c:when test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN && miListaIdGarantias.OB_IAX_GARANTIAS.CTARMAN == 1}">
																				 <input     type="text" id="IPRITOT"  name="IPRITOT" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>" style="width:90px; text-align:right" class="${CLASS}"
																							formato="decimal" onchange="f_actualiza_imports('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}', '<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITAR}"/>', this.value)" />
																				</c:when>
																				<c:otherwise>
																				<fmt:formatNumber pattern="${__formatNumberPatterns[CMONPRODINT]}" value="${miListaIdGarantias.OB_IAX_GARANTIAS.IPRITOT}"/>
																				</c:otherwise>
																				</c:choose>
																				</c:if>
                                                                            </div>
                                                                        </td>
                                                                    </axis:visible>
                                                                    <axis:visible f="axisctr207" c="DETGARANT">
                                                                             <td class="dspText">  
                                                                                <c:choose>
                                                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1' && empty psu_critica }">
                                                                                        <div class="dspIcons"><a onclick ="f_abrir_axisctr011('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">D</a></div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <div class="dspIcons">D</div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            </axis:visible>
                                                                            <axis:visible f="axisctr207" c="PREGGARANT">
                                                                                 <td class="dspText">  
                                                                                    <c:choose>
                                                                                    <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1' && !(sessionScope.MODO eq 'SUPLEMENTO_918')}">
                                                                                        <div class="dspIcons"><a onclick ="f_abrir_axisctr012('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">P</a></div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <div class="dspIcons">P</div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                </td>
                                                                            </axis:visible>
                                                                            <axis:visible f="axisctr207" c="FRANGARANT">
                                                                                <td class="dspText">  
                                                                                    <c:choose>
                                                                                        <c:when test="${miListaIdGarantias.OB_IAX_GARANTIAS.COBLIGA == '1'}">
                                                                                           <div class="dspIcons"><a onclick ="f_abrir_axisctr013('${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}')">F</a></div>
                                                                                        </c:when>
                                                                                         <c:otherwise>
                                                                                             <div class="dspIcons">F</div>
                                                                                         </c:otherwise>
                                                                                     </c:choose>  
                                                                                </td>
                                                                            </axis:visible>
                                                                            </tr>
                                                                                <c:if test="${!empty miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}">
                                                                                        <c:set scope="session" var="hijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}"/>
                                                                                            <c:import url="axisctr207_hijos.jsp">
                                                                                                <c:param name="thijos" value="${miListaIdGarantias.OB_IAX_GARANTIAS.T_IAX_HIJOS}" />
                                                                                                	<c:param name="ppartidas" value="0" />
                                                                                                <c:param name="CGARANTPADRE" value="${miListaIdGarantias.OB_IAX_GARANTIAS.CGARANT}" />
                                                                                            </c:import>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            </tbody>
                                                                            </table>
                                                                            
                                
                            </c:if>
                            </axis:ocultar>
                          </td>
                    </tr>
                    
                       <axis:visible f="axisctr207" c="DSP_TOT_FRANQUICIAS">
                   <c:if test="${__formdata.PFRANQUICIAS > 0 || __formdata.PBONUSMALUS >0 }">
                        <tr>
                            <td>
                                  <c:import url="axisctr207_franquicias.jsp"/>
                            </td>
                        </tr>
                    </c:if>
                    </axis:visible>
                   
                </table>
                <div class="separador">&nbsp;</div>
                <axis:visible f="axisctr207" c="DSP_RESULTADO">
                <!-- INI-CONF-209-VLCG  -->
                <c:if test="${CMONPRODINT != 'COP'}">
                     <axis:visible f="axisctr207" c="BT_CONVPESOS">
                       <input type="button" class="boton" id="but_convpesos" value="<axis:alt f="axisctr207" c="BT_CONVPESOS" lit="9908899"></axis:alt>" onclick="f_convpesos()"/>
                     </axis:visible>
                </c:if>
                <!-- FIN-CONF-209-VLCG  -->
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr207" c="DSP_RESULTADO" lit="1000345" /><axis:visible c="CMONPROD" f="axisctr207">  <c:if test="${!empty CMONPROD}">  <axis:alt f="axisctr207" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${requestScope.TMONPROD} </c:if> </axis:visible></div>
                <!--campos-->
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <!-- DisplayTag detalle primas -->
                            <c:set var="title0"><axis:alt f="axisctr207" c="TIPRITAR" lit="1000496"/></c:set>         <!-- IPRITAR -->
                            <c:set var="title1"><axis:alt f="axisctr207" c="IIPS" lit="101515"/></c:set>            <!-- IIPS -->
                            <c:set var="title2"><axis:alt f="axisctr207" c="IDGS" lit="1000498"/></c:set>         <!-- IDGS -->
                            <c:set var="title3"><axis:alt f="axisctr207" c="ICONSOR" lit="103101"/></c:set>           <!-- ICONSOR -->                            
                            <c:set var="title4"><axis:alt f="axisctr207" c="IRECFRA" lit="1000341"/></c:set>            <!-- IRECFRA -->
                            <c:set var="title5"><axis:alt f="axisctr207" c="PRECARG" lit="101671"/></c:set>         <!-- PRECARG -->
                            <c:set var="title6"><axis:alt f="axisctr207" c="IEXTRAP" lit="101918"/></c:set>         <!-- IEXTRAP -->                                        
                            <c:set var="title7"><axis:alt f="axisctr207" c="PDTOCOM" lit="1000119"/></c:set>            <!-- PDTOCOM -->
                            <c:set var="title8"><axis:alt f="axisctr207" c="ITOTALR" lit="140531"/></c:set>    <!-- ITOTALR -->     
                            <c:set var="title9"><axis:alt f="axisctr207" c="IPRIANU" lit="1000497"/></c:set>  <!-- IPRIANU -->     
                            <c:set var="title10"><axis:alt f="axisctr207" c="IPRIREB" lit="9000837"/></c:set>      <!-- IPRIREB -->       
                            <c:set var="title11"><axis:alt f="axisctr207" c="IARBITR" lit="101705"/></c:set>       <!-- IARBRIT -->       
                            <c:set var="title12"><axis:alt f="axisctr207" c="ICDERREG" lit="9001509"/></c:set>     <!-- ICDERREG -->       
                            <c:set var="title13"><axis:alt f="axisctr207" c="IEXTRAP" lit="101918"/></c:set>       <!-- IEXTRAP -->   
                            <c:set var="title14"><axis:alt f="axisctr207" c="ITOTIMP" lit="1000580"/></c:set>       <!-- ITOTIMP -->       
                            <c:set var="title15"><axis:alt f="axisctr207" c="IPRIVIGENCIA" lit="9906625"/></c:set>
                            <c:set var="title16"><axis:alt f="axisctr207" c="ITOTDEV" lit="89906124"/></c:set>
                                                
                            
                            <div id="dt_resultados" class="displayspace">
                                  <display:table name="${sessionScope.axisctr_primasTotales}" id="axisctr_primasTotales" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                  requestURI="axis_${pantalla}.do?paginar=true">
                                     <%@ include file="../include/displaytag.jsp"%>
                                     <axis:visible f="axisctr207" c="TIPRITAR">
                                         <display:column title="${title0}" sortable="false" sortProperty="TIPRITAR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber">
											 <c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITAR}'/></c:if></div>
                                         </display:column>
                                     </axis:visible>
                                    <axis:visible f="axisctr207" c="IIEXTRAP">
                                         <display:column title="${title13}" sortable="false" sortProperty="IIEXTRAP" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIEXTRAP}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IRECARG">
                                         <display:column title="${title5}" sortable="false" sortProperty="ITOTREC" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTREC}'/></c:if></div>
                                         </display:column>
                                     </axis:visible>                                     
                                     
                                        <axis:visible f="axisctr207" c="ITOTDTO">
                                         <display:column title="${title7}" sortable="false" sortProperty="ITOTDTO" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDTO}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>
									 
									 <axis:visible f="axisctr207" c="ITOTDEV">
                                         <display:column title="${title16}" sortable="false" sortProperty="ITOTDEV" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <%--<div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDEV}'/></c:if></div>--%>
											 
											<div class="dspNumber">
                                             	<c:if test="${empty psu_critica }">
												 	<c:choose>
													    <c:when test="${__formdata.SUPLEMENTO != '239' ||  __formdata.MOD_CPARPRO_239== 1 }"> <%--MPC 14/01/2022 TASK 16563 Se adiciona condicion PARPRODUCTO--%>
													        <fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDEV}'/>
													    </c:when>
													    <c:otherwise>
													    	<c:choose>
														    	<c:when test="${VSUPLE == '1'}">
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDEV*-1}'/>
														        </c:when>
														        <c:otherwise>
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDEV}'/>
														        </c:otherwise>
													        </c:choose>
													    </c:otherwise>
													</c:choose>
											    </c:if>                
                                             </div> 
											 
											 
                                         </display:column> 
                                     </axis:visible>
									 
                                     <axis:visible f="axisctr207" c="IPRIANU">
                                         <display:column title="${title9}" sortable="false" sortProperty="IPRIANU" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRITOT}'/></c:if></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="ICONSOR">
                                        <display:column title="${title3}" sortable="false" sortProperty="ICONSOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICONSOR}'/></c:if></div>
                                        </display:column>                     
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IRECFRA">
                                         <display:column title="${title4}" sortable="false" sortProperty="IRECFRA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IRECFRA}'/></c:if></div>
                                         </display:column>                                                                                                                           
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IIPS">
                                         <display:column title="${title1}" sortable="false" sortProperty="IIPS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <%--<div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/></c:if></div>--%>
											 
											 <div class="dspNumber">

                                             <c:if test="${empty psu_critica }">
												 	<c:choose>
													    <c:when test="${__formdata.SUPLEMENTO != '239' || __formdata.MOD_CPARPRO_239== 1}"> <%--MPC 14/01/2022 TASK 16563 Se adiciona condicion PARPRODUCTO--%>
													    <%--IAXIS-16335 BJHB 27/10/2021 INICIO --%>
													    	<c:choose>
													    		<c:when test="${ISPROPERTY == 1}">
													        		<%--IAXIS-16493 BJHB 1/12/2021 INICIO --%>
													    			<c:choose>
															    		<c:when test="${ISCA == 0}">
															        		<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${VTIPIVA*axisctr_primasTotales.ITOTDEV}'/>
															        	</c:when>	
															        	<c:otherwise>
																        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='0'/>
																        </c:otherwise>
															        </c:choose>
															        <%--IAXIS-16493 BJHB 1/12/2021 FIN --%>  
													        	</c:when>	
													        	<c:otherwise>
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/>
														        </c:otherwise>
													        </c:choose>
													    <%--IAXIS-16335 BJHB 27/10/2021 FIN --%>    
													    </c:when>
													    <c:otherwise>
													    	<c:choose>
														    	<c:when test="${VSUPLE == '1'}">
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${VTIPIVA*-axisctr_primasTotales.ITOTDEV}'/>
														        </c:when>
														        <c:otherwise>
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IIPS}'/>
														        </c:otherwise>
													        </c:choose>
													    </c:otherwise>
													</c:choose>
											    </c:if>

                                             </div>
											 
											 
											 
                                         </display:column>  
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IDGS">
                                         <display:column title="${title2}" sortable="false" sortProperty="IDGS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IDGS}'/></c:if></div>
                                         </display:column>
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IARBITR">
                                         <display:column title="${title11}" sortable="false" sortProperty="IARBITR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IARBITR}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>                                                               
                                     <axis:visible f="axisctr207" c="ICDERREG">
                                         <display:column title="${title12}" sortable="false" sortProperty="ICDERREG" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ICDERREG}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>   
                                     <!-- bug 0025826 -->   
                                     <axis:visible f="axisctr207" c="ITOTIMP">
                                         <display:column title="${title14}" sortable="false" sortProperty="ITOTIMP" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTIMP}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="ITOTALR">
                                         <display:column title="${title8}" sortable="false" sortProperty="ITOTALR" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <%--<div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/></c:if></div>--%>
											 
											 <div class="dspNumber">    
											<c:if test="${empty psu_critica }">
												 	<c:choose>
													    <c:when test="${__formdata.SUPLEMENTO != '239' ||  __formdata.MOD_CPARPRO_239 == 1}"> <%--MPC 14/01/2022 TASK 16563 Se adiciona condicion PARPRODUCTO--%>
													         <%--IAXIS-16335 BJHB 27/10/2021 INICIO --%>
													    	<c:choose>
													    		<c:when test="${ISPROPERTY == 1}">
													        		<%--IAXIS-16493 BJHB 1/12/2021 INICIO --%>
													    			<c:choose>
															    		<c:when test="${ISCA == 0}">
															        		<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${(VTIPIVA*axisctr_primasTotales.ITOTDEV)+axisctr_primasTotales.ITOTDEV}'/>
															        	</c:when>	
															        	<c:otherwise>
																        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTDEV}'/>
																        </c:otherwise>
															        </c:choose>
															        <%--IAXIS-16493 BJHB 1/12/2021 FIN --%>  
													        	</c:when>	
													        	<c:otherwise>
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/>
														        </c:otherwise>
													        </c:choose>
													    <%--IAXIS-16335 BJHB 27/10/2021 FIN --%>
													    </c:when>
													    <c:otherwise>
													    	<c:choose>
														    	<c:when test="${VSUPLE == '1'}">
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${-(VTIPIVA*axisctr_primasTotales.ITOTDEV+axisctr_primasTotales.ITOTDEV)}'/>
														        </c:when>
														        <c:otherwise>
														        	<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.ITOTALR}'/>
														        </c:otherwise>
													        </c:choose>
													    </c:otherwise>
													</c:choose>
											    </c:if>
                                             </div>
											 
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IPRIVIGENCIA">
                                         <display:column title="${title15}" sortable="false" sortProperty="IPRIVIGENCIA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRIVIGENCIA}'/></c:if></div>
                                         </display:column> 
                                     </axis:visible>
                                     <axis:visible f="axisctr207" c="IPRIREB">
                                         <display:column title="${title10}" sortable="false" sortProperty="IPRIREB" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                             <div class="dspNumber"><c:if test="${empty psu_critica }"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${axisctr_primasTotales.IPRIREB}'/></c:if></div>
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
            <axis:visible f="axisctr207" c="but_tarifar"> 
                <td align="center">
                    <div class="separador">&nbsp;</div>
                    <input type="button" class="boton" id="but_tarifar" value="<axis:alt f="axisctr207" c="BT_TARIFAR" lit="101688"></axis:alt>" onclick="javascript:f_tarifar()" />
                    
                <td>
            </axis:visible>
        </tr>
<axis:visible f="axisctr207" c="DSP_PSU"> 
          <c:if test="${!empty PTPSUS}">
 
     <tr>
                <td class="campocaja" >
                          <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr207" c="DSP_PSU" lit="9002255" /> <b style="color:#333333;font-size: 9px;">${PTESTPOL} ${PTNIVELBPM}</b></div>
                      
                <!--campos-->
                <div class="separador">&nbsp;</div>
                </td>
            </tr>
            <tr>
                <td class="campocaja" >
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr207" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr207" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="axisctr207" c="TAUTREC" lit="9900977" /></c:set>
                                                 <c:set var="title5"><axis:alt f="axisctr207" c="TRIESGO" lit="9906106" /></c:set>                         
                         <c:set var="title6"><axis:alt f="axisctr207" c="TNIVELR" lit="9900978" /></c:set>
                         
                         <c:set var="title7"><axis:alt f="axisctr207" c="INFO" lit="1000113" /></c:set>
                         
                        
                             <c:set var="title8"><axis:alt f="axisctr100" c="CCRITICO" lit="9905109" /></c:set>
                      
                         
                         <display:table name="${PTPSUS}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr207.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PSU.TCONTROL" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PSU.FMOVIMI" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                           </display:column>
                           
                           <axis:visible f="axisctr207" c="TAUTREC">   
                           <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PSU.TAUTREC" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>
                             <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PSU.TRIESGO" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                           </display:column>
                           
                           <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PSU.TNIVELR" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                           </display:column>
                           <axis:visible f="axisctr207" c="CCRITICO">
                            <display:column title="${title8}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText" >
                               <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${T_IAX_PSU.OB_IAX_PSU.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${T_IAX_PSU.OB_IAX_PSU.CCRITICO}"
                               <axis:atr f="axisctr207" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                               </div>
                           </display:column>
                           </axis:visible>
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr207" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.NOCURRE}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr207' c='INFO' lit='1000113'/>"/>
                                </div>
                           </display:column>                           
                        </display:table>
                    </div>
                </td>
            </tr>
           
        </tr>      
       
</c:if>
</axis:visible>
    </table>
   

    <!-- Botonera -->
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisctr207</c:param>
        <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr207">cancelar</axis:visible><axis:visible f="axisctr207" c="BT_ANT">,anterior</axis:visible><c:if test="${validar_tarificacion == 'true'}">,guardar</c:if><axis:visible f="axisctr207" c="BT_SEG">,siguiente</axis:visible><axis:visible f="axisctr207" c="BT_CONTRATAR">,contratar</axis:visible></c:param>
    </c:import>
</form>
