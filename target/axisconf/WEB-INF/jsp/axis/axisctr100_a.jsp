<%/* Revision:# vTePZjcEV4gCUAtYSVMvvA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
                  <tr>
                    <td>
                        <table class="seccion">
                           <tr>
                           <td align="left">
                               <axis:visible c="DSP_CAB_SIMULACION" f="axisctr100">
                               <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TITULO_CABECERA" lit="108021" /></div>
                                <table class="area" align="center">
                                     <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr100" c="DESCRIPCION" lit="800440" /></b>
                                        </td>
                                        <axis:visible c="TSITUAC" f="axisctr100">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr100" c="TSITUAC" lit="9906479" /></b>
                                        </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" style="width:30%" class="campowidthinput campo campotexto" id="TNATRIE" name="TNATRIE" size="20"
                                            value="${axisctr100_SSEGURO}" readonly="true" />
                                        </td> 
                                        <axis:visible c="TSITUAC" f="axisctr100">
                                        <td class="campocaja">
                                            <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="20"
                                            value="${__formdata.TSITUAC}" readonly="true" />
                                        </td>  
                                        </axis:visible>
                                    </tr>
                                </table>
                                </axis:visible>
                               <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="TITULO_GESTION" lit="140502" /></div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>                                                                 
                                    </tr>
                                    <tr>
                                      <axis:ocultar c="CACTIVI" f="axisctr100" dejarHueco="false">
                                             <td class="titulocaja">
                                                    <b><axis:alt c="CACTIVI" f="axisctr100" lit="103481"/></b> <%-- Actividad --%>
                                             </td>
                                      </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar c="CACTIVI" f="axisctr100" dejarHueco="false">
                                           <td class="campocaja">
                                               <select name="CACTIVI" id="CACTIVI" size="1" class="campowidthselect campo campotexto" style="width:100%;"
                                               obligatorio="true" onchange="f_guardar_actividad(this);">&nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr100" c="SNV_COMBO" lit="1000348"/> - </option> 
                                                   <c:forEach var="element" items="${lstcactivi}">
                                                       <option value="${element.CACTIVI}"
                                                       <c:if test="${sessionScope.axisctr100_datosGestion.CACTIVI == element.CACTIVI}"> selected="selected"</c:if>>
                                                           ${element.TTITULO}   
                                                       </option>
                                                   </c:forEach>
                                               </select>
                                            </td>            
                                         </axis:ocultar>
                                    </tr>
                                    <tr>
                                          <axis:visible f="axisctr100" c="FEFECTO">
                                            <th style="width:17%;height:0px"></th>
                                          </axis:visible>
                                          <axis:visible f="axisctr100" c="CDURACI">
                                              <th style="width:17%;height:0px"></th>
                                          </axis:visible>
                                          <axis:visible f="axisctr100" c="NDURACI">
                                              <th style="width:17%;height:0px"></th>
                                          </axis:visible>
                                          <axis:visible f="axisctr100" c="NDURCOB" >
                                              <th style="width:17%;height:0px"></th>
                                          </axis:visible>
                                          <axis:visible f="axisctr100" c="FVENCIM">
                                             <th style="width:17%;height:0px"></th>  
                                          </axis:visible>
                                          <axis:visible f="axisctr100" c="FRENOVA">
                                             <th style="width:17%;height:0px"></th>  
                                          </axis:visible>                                          
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisctr100" c="FEFECTO">
                                            <td class="titulocaja">
                                                <b id="label_FEFECTO"><axis:alt f="axisctr100" c="FEFECTO" lit="100883" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="CDURACI">
                                            <td class="titulocaja">
                                                <b id="label_CDURACI"><axis:alt f="axisctr100" c="CDURACI" lit="1000376"/></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="NDURACI">
                                            <td class="titulocaja">
                                                <b id="label_NDURACI"><axis:alt f="axisctr100" c="NDURACI" lit="1000120" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="NDURCOB" >
                                        <td class="titulocaja">
                                            <b id="label_NDURCOB"><axis:alt f="axisctr100" c="NDURCOB" lit="9000814" /></b>
                                        </td>  
                                        </axis:visible> 
                                          <axis:ocultar f="axisctr100" c="NEDAMAR" >
                                        <td class="titulocaja">
                                            <b id="label_NEDAMAR"><axis:alt f="axisctr100" c="LIT_1000120" lit="1000120" /></b>
                                        </td>
                                    </axis:ocultar> 
                                        <axis:visible f="axisctr100" c="FVENCIM">
                                            <td class="titulocaja">
                                                <b id="label_FVENCIM"><axis:alt f="axisctr100" c="FVENCIM" lit="100885" /></b>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="FRENOVA">
                                            <td class="titulocaja">
                                                <b id="label_FRENOVA"><axis:alt f="axisctr100" c="FRENOVA" lit="102626" /></b>
                                            </td>
                                        </axis:visible>                                        
                                    </tr>
                                    <tr>
                                        <axis:visible f="axisctr100" c="FEFECTO">
                                            <td class="campocaja" style="white-space:nowrap;">
                                                <input type="text" style="width:60%" class="campowidthinput campo campotexto" onchange="f_grabar_datos();f_actualitza_fvencim(this);" id="FEFECTO" name="FEFECTO" size="15"
                                                value="<fmt:formatDate value='${sessionScope.axisctr100_datosGestion.FEFECTO}' pattern='dd/MM/yyyy'/>" style="width:90%"
                                                <axis:atr f="axisctr100" c="FEFECTO" a="obligatorio=true&formato=fecha"/> /><a id="icon_FEFECTO" style="vertical-align:middle;" href="#"><img id="popup_calendario_efecto" border="0" alt="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" title="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>                                  
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="CDURACI">
                                            <td class="campocaja">
                                                <select name = "CDURACI" id ="CDURACI" size="1" onchange="f_grabar_datos()" class="campowidthselect campo campotexto"
                                                    <axis:atr f="axisctr100" c="CDURACI" a="modificable=false&isInputText=false"/> >&nbsp;
                                                    <c:forEach items="${axisctr100_comboTipoDuracion}" var="tipoDuracion">
                                                        <option value = "${tipoDuracion.CATRIBU}" <c:if test="${tipoDuracion.CATRIBU  == sessionScope.axisctr100_datosGestion.CDURACI}">selected</c:if>>${tipoDuracion.TATRIBU}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="NDURACI">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" onchange="f_actualitza_fvencim2(this);" onkeyup="setTimeout('f_grabar_datos()',2500);" id="NDURACI" name="NDURACI" size="15"
                                                value="${sessionScope.axisctr100_datosGestion.DURACION}" <axis:atr f="axisctr100" c="NDURACI"/>/>
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axisctr100" c="NDURCOB" >
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto"  <axis:atr f="axisctr100" c="NDURCOB"/> id="NDURCOB" name="NDURCOB" onkeyup="f_grabar_datos()" size="15" style="width:60%;"
                                            value="${sessionScope.axisctr100_datosGestion.NDURCOB}" />
                                        </td>                                    
                                        </axis:visible>  
                                        
                                          <axis:visible f="axisctr100" c="NEDAMAR" >
                                        <td class="campocaja">
                                            <select name = "NEDAMAR" id ="NEDAMAR" size="1" onchange="f_grabar_datos_fp()"
                                            class="campowidthselect campo campotexto" <axis:atr f="axisctr100" c="NEDAMAR" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <axis:alt f="axisctr100" c="LIT_108341" lit="108341"/> - </option> 
                                                <c:forEach items="${sessionScope.lstNEDAMAR}" var="lstNEDAMAR">
                                                    <option value = "${lstNEDAMAR.CODI}" <c:if test="${lstNEDAMAR.CODI  == sessionScope.axisctr100_datosGestion.NEDAMAR}">selected</c:if>>${lstNEDAMAR.DESCRIPCION}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                        
                                       <axis:visible f="axisctr100" c="FVENCIM">
                                             <td class="campocaja"  style="white-space:nowrap;" >
                                                <c:set var="FVENCIM"><fmt:formatDate pattern="dd/MM/yyyy"  value="${sessionScope.axisctr100_datosGestion.FVENCIM}"/></c:set>
                                                <input type="text" class="campowidthinput campo campotexto" onchange="f_grabar_datos()" id="FVENCIM" name="FVENCIM" size="15" style="width:90%"
                                                value ="${FVENCIM}"  title="<axis:alt f="axisctr100" c="FVENCIM" lit="100885"/>" <axis:atr f="axisctr100" c="FVENCIM" a="formato=fecha"/>/>
                                                <a id="icon_FVENCIM" style="vertical-align:middle;" href="#"><img id="popup_calendario_vencimiento" border="0" alt="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" title="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" src="images/calendar.gif"/></a>
                                                <a id="icon_FVENCIM2" style="vertical-align:middle;">        <img border="0" alt="<axis:alt f="axisctr100" c="LIT_108341" lit="108341"/>"  title="<axis:alt f="axisctr100" c="LIT_100885" lit="100885" />" onclick="f_calculadora('FVENCIM')" src="images/calculadora.gif"/></a>
                                            </td>
                                        </axis:visible>
                                       <axis:visible f="axisctr100" c="FRENOVA">
                                             <td class="campocaja"  style="white-space:nowrap;">
                                                <c:set var="FRENOVA"><fmt:formatDate pattern="dd/MM/yyyy"  value="${sessionScope.axisctr100_datosGestion.FRENOVA}"/></c:set>
                                                <input type="text" class="campowidthinput campo campotexto" onchange="f_grabar_datos()" id="FRENOVA" name="FRENOVA" size="15" style="width:90%"
                                                value ="${FRENOVA}"  title="<axis:alt f="axisctr100" c="FRENOVA" lit="100885"/>" <axis:atr f="axisctr100" c="FRENOVA" a="formato=fecha"/>/><a id="icon_FRENOVA" style="vertical-align:middle;" href="#"><img id="popup_calendario_frenova" border="0" alt="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" title="<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:visible>                                        
                                    </tr>
                                    <tr>     
                                    <axis:visible f="axisctr100" c="CMONPOL" >
                                        <td class="titulocaja">
                                            <b id="label_CMONPOL"><axis:alt f="axisctr100" c="CMONPOL" lit="9903001" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:ocultar f="axisctr100" c="CFORPAG" dejarHueco="false">
                                       <td class="titulocaja">
                                            <b id="label_CFORPAG"><axis:alt f="axisctr100" c="CFORPAG" lit="100712" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr100" c="NDURPER" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_NDURPER"><axis:alt f="axisctr100" c="NDURPER" lit="1000328" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr100" c="INTTEC" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_INTTEC"><axis:alt f="axisctr100" c="INTTEC" lit="107049" /></b>
                                        </td>
                                    </axis:ocultar>
                                                                        
                                    
                                   <axis:ocultar f="axisctr100" c="CIDIOMA" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_CIDIOMA"><axis:alt f="axisctr100" c="CIDIOMA" lit="1000246" /></b>
                                        </td>
                                    </axis:ocultar> 
                                    </tr>                                    
                                    <tr>
                                     <tr>
                                    <axis:visible f="axisctr100" c="CMONPOL" >
                                        <td class="campocaja">
                                            <select name = "CMONPOL" id ="CMONPOL" size="1"  onchange="f_grabar_datos()"
                                                class="campowidthselect campo campotexto" <axis:atr f="axisctr004" c="CMONPOL" a="isInputText=false"/>>&nbsp;
                                                 <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr004" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                                <c:forEach items="${monedasPago}" var="monedaPago">
                                                    <option value = "${monedaPago.CMONEDA}" <c:if test="${monedaPago.CMONEDA  == sessionScope.axisctr100_datosGestion.CMONPOL}">selected</c:if>>${monedaPago.TMONEDA}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                        <axis:ocultar f="axisctr100" c="CFORPAG" dejarHueco="false">
                                             <td class="campocaja">                                         
                                                <select name = "CFORPAG" id ="CFORPAG" size="1" onchange="f_grabar_datos_fp()" class="campowidthselect campo campotexto"
                                                <axis:atr f="axisctr100" c="CFORPAG" a="modificable=false&isInputText=false" /> >&nbsp;
                                                    <option value = "0" selected >-<axis:alt f="axisctr100" c="SELECCIONAR" lit="108341"/>-</option>
                                                    <c:forEach var="formas" items="${axisctr100_comboFormaPago}">
                                                        <option value = "${formas.CATRIBU}"
                                                            <c:if test="${formas.CATRIBU == sessionScope.axisctr100_datosGestion_CFORPAG}">selected</c:if>>
                                                            ${formas.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:ocultar>
                                        <%--xpl 16/07/2009 10194        --%>
                                      <axis:ocultar f="axisctr100" c="NDURPER" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "NDURPER" id ="NDURPER" size="1" style="width:80%" onchange="f_carga_dependencias();f_grabar_datos();" 
                                            class="campowidthselect campo campotexto" title="<axis:alt f='axisctr100' c='NDURPER' lit='1000328' />"
                                            <axis:atr f="axisctr100" c="NDURPER" a="modificable=false&obligatorio=true&isInputText=false"/>>&nbsp;
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr100" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${sessionScope.lstperrevision}" var="ndurper">
                                                    <option value = "${ndurper.NDURPER}" <c:if test="${!empty sessionScope.axisctr100_datosGestion.NDURPER && ndurper.NDURPER  == sessionScope.axisctr100_datosGestion.NDURPER}">selected</c:if>>${ndurper.NDURPER}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisctr100" c="INTTEC" dejarHueco="false">
                                        <td class="campocaja">
                                         <input type="text" class="campowidth campo campotexto" id="INTTEC" name="INTTEC" title="<axis:alt f="axisctr100" c="PDOSCAB" lit="180148"/>" onchange ="f_grabar_datos()"
                                                             size="15" value ="<fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${sessionScope.axisctr100_datosGestion.INTTEC}'/>"                                                             
                                                            <axis:atr f="axisctr100" c="INTTEC" a="obligatorio=false&modificable=true&formato=decimal"/> />&nbsp;
                                        </td>
                                    </axis:ocultar>
                                                                       
                                    
                                     <axis:ocultar f="axisctr100" c="CIDIOMA" dejarHueco="false">
                                         <td class="campocaja">
                                            <select name = "CIDIOMA" id ="CIDIOMA" size="1" onchange="f_grabar_datos()"
                                                class="campowidth campo campotexto" <axis:atr f="axisctr100" c="CIDIOMA" a="isInputText=false"/>>&nbsp;
                                               <c:forEach items="${idiomas}" var="idioma">
                                                    <option value = "${idioma.CIDIOMA}" <c:if test="${idioma.CIDIOMA  == sessionScope.axisctr100_datosGestion.CIDIOMA}">selected</c:if>> ${idioma.TIDIOMA} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                      <axis:ocultar f="axisctr100" c="CRECFRA" dejarHueco="false" >
                                      <td class="campocaja">
                                      <b><axis:alt f="axisctr100" c="CRECFRA" lit="1000483" /></b>
                                        <input  <c:if test="${sessionScope.axisctr100_datosGestion.CRECFRA == '1'}">checked="true"</c:if> onclick="f_onclickCheckbox(this);"  
                                        type="checkbox" id="CRECFRA" name="CRECFRA" value="${sessionScope.axisctr100_datosGestion.CRECFRA}"/>
                                      </td>
                                    </axis:ocultar>
                                    <%--FI xpl 16/07/2009 10194        --%>
                                    </tr>
                                    
                                    
                                <!-- JAEG -->
                                <tr>
                                    <axis:ocultar f="axisctr100" c="PEJECUCION2"  >
                                        <td class="titulocaja" align="right">
                                        </td>
                                    </axis:ocultar>
                                    
                                    <td class="titulocaja" style="white-space:nowrap">
                                        <axis:ocultar f="axisctr100" c="FEFEPLAZO" >
                                            <b id="label_FEFEPLAZO"><axis:alt f="axisctr004" c="LIT_9908885" lit="9908885" /></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisctr100" c="FVENCPLAZO" >
                                            <b id="label_FVENCPLAZO"><axis:alt f="axisctr004" c="LIT_9908886" lit="9908886" /></b>
                                        </axis:ocultar>
                                    </td>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr100" c="PEJECUCION"  >
                                        <td class="titulocaja" align="right">
                                            <b id="label_PEJECUCION"><axis:alt f="axisctr004" c="LIT_9908900" lit="9908900" /></b>
                                        </td>
                                    </axis:ocultar>
                                    
                                    <td class="campocaja"  style="white-space:nowrap">
                                     <axis:ocultar f="axisctr100" c="FEFEPLAZO" >                                        
                                            <jsp:useBean id="today_FEFEPLAZO" class="java.util.Date" /> 
                                            <c:set var="FEFEPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFEPLAZO}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                            <axis:atr f="axisctr100" c="FEFEPLAZO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FEFEPLAZO} <c:if test="${empty FEFEPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FEFEPLAZO}"/></c:if>"
                                            title="<axis:alt f="axisctr004" c="LIT_9908885" lit="9908885"/>"/><a id="icon_FEFEPLAZO" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr004" c="LIT_9908885" lit="9908885" />" src="images/calendar.gif"/></a>
                                    </axis:ocultar>                                    
                                    
                                     <axis:ocultar f="axisctr100" c="FVENCPLAZO" >
                                            <b class="campocaja"  style="white-space:nowrap"></b>
                                            <jsp:useBean id="today_FVENCPLAZO" class="java.util.Date" /> 
                                            <c:set var="FVENCPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FVENCPLAZO}"/></c:set>
                                            <input style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);" type="text" class="campowidthinput campo campotexto" id="FVENCPLAZO" name="FVENCPLAZO" size="15"
                                            <axis:atr f="axisctr004" c="FVENCPLAZO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FVENCPLAZO} <c:if test="${empty FVENCPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FVENCPLAZO}"/></c:if>"
                                            title="<axis:alt f="axisctr100" c="LIT_9908886" lit="9908886"/>"/><a id="icon_FVENCPLAZO" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr100" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr004" c="LIT_9908886" lit="9908886" />" onclick="f_calculadora('FVENCPLAZO')" src="images/calculadora.gif"/></a>
                                    </axis:ocultar>
                                    </td>
                                </tr>
                                <!-- JAEG -->                                    
                                    
                                    
                                    
                                      <tr>
                                    <axis:visible f="axisctr100" c="PDTOCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOCOM"><axis:alt f="axisctr100" c="LIT_103100" lit="103100" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr100" c="PRECCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PRECCOM"><axis:alt f="axisctr100" c="LIT_9903608" lit="9903608" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="PDTOTEC" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOTEC"><axis:alt f="axisctr100" c="LIT_9903609" lit="9903609" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr100" c="PRECARG" >
                                        <td class="titulocaja">
                                            <b id="label_PRECARG"><axis:alt f="axisctr100" c="LIT_9903610" lit="9903610" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="CRGGARDIF">
                                     <td class="campocaja">
                                      <b id="label_CRGGARDIF">
                                        <axis:alt f="axisctr100" c="LIT_9903611" lit="9903611" />
                                      </b>
                                      </td>
                                    </axis:visible>  
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr100" c="PDTOCOM" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOCOM" name="PDTOCOM" onchange="f_grabar_datos()"
                                            title="<axis:alt f="axisctr100" c="LIT_103100" lit="103100"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${sessionScope.axisctr100_datosGestion.DTOCOM}"/>"
                                            <axis:atr f="axisctr100" c="PDTOCOM" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr100" c="PRECCOM" >
                                        <td class="campocaja">
                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM" onchange="f_grabar_datos()"
                                            title="<axis:alt f="axisctr100" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${sessionScope.axisctr100_datosGestion.PRECCOM}"/>"
                                            <axis:atr f="axisctr100" c="PRECCOM" a="modificable=true"/>/>&nbsp;
                                             </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr100" c="PDTOTEC" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange="f_grabar_datos()"
                                            title="<axis:alt f="axisctr100" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${sessionScope.axisctr100_datosGestion.PDTOTEC}"/>"
                                            <axis:atr f="axisctr100" c="PDTOTEC" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr100" c="PRECARG" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="PRECARG" name="PRECARG" onchange="f_grabar_datos()"
                                            title="<axis:alt f="axisctr100" c="LIT_9903610" lit="9903610"/>" size="15" value ="<fmt:formatNumber pattern="###,##0.00" value="${sessionScope.axisctr100_datosGestion.PRECARG}"/>"
                                            <axis:atr f="axisctr100" c="PRECARG" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>    
                                        <axis:visible f="axisctr100" c="CRGGARDIF" >
                                        <td>
                                      <input  
                                        <c:if test="${sessionScope.axisctr_datosGestion.CRGGARDIF == '1'}">checked</c:if> onchange="" <axis:atr f="axisctr100" c="CRGGARDIF" a="modificable=true&isInputText=false"/> type="checkbox" id="CRGGARDIF" name="CRGGARDIF" value="${sessionScope.axisctr100_datosGestion.CRGGARDIF}"/>
                                   </td>
                                    </axis:visible>
                                        </tr>
                                <tr>
                                    <tr>
                                 <axis:visible f="axisctr100" c="CTIPRETR" >
                                        <td class="titulocaja">
                                            <b id="label_CTIPRETR"><axis:alt f="axisctr100" c="LIT_9903613" lit="9903613" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr100" c="CINDREVFRAN" >
                                        <td class="titulocaja">
                                            <b id="label_CINDREVFRAN"><axis:alt f="axisctr100" c="LIT_9903612" lit="9903612" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr100" c="CTIPRETR" >
                                         <td class="campocaja">
                                         <select name = "CTIPRETR" id ="CTIPRETR" size="1" onchange=""
                                                class="campowidthselect campo campotexto" 
                                               <axis:atr f="axisctr100" c="CTIPRETR" a="modificable=true&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr100_datosGestion.tipoRetribu}" var="tipoRetribu">
                                                    <option value = "${tipoRetribu.CATRIBU}" <c:if test="${tipoRetribu.CATRIBU  == sessionScope.axisctr100_datosGestion.CTIPRETR}">selected</c:if>>${tipoRetribu.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                         </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr100" c="CINDREVFRAN" >
                                        <td class="campocaja">
                                           <select name = "CINDREVFRAN" id ="CINDREVFRAN" size="1" onchange=""
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisctr100" c="CINDREVFRAN" a="modificable=true&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr100_datosGestion.revalFran}" var="revalFran">
                                                    <option value = "${revalFran.CATRIBU}" <c:if test="${revalFran.CATRIBU  == sessionScope.axisctr100_datosGestion.CINDREVFRAN}">selected</c:if>>${revalFran.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                             </td>
                                    </axis:visible>
                                        </tr>
                                <tr>
                                </tr>
                                </table>
                                </td> 
                            </tr>
                        </table>
                        
                     <axis:ocultar f="axisctr100" c="DSP_CONVENIOS" >
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="LIT_9907578" lit="9907578" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                		<th style="width:20%;height:0px"></th>  
                                    <th style="width:38%;height:0px"></th>
                                    <th style="width:1%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>                                                                      
                                    <th style="width:21%;height:0px"></th>
                                </tr>
                                <tr> 
                                		<axis:visible f="axisctr100" c="TCODCONV" >
                                        <td class="titulocaja" id="tit_TCODCONV">
                                            <b id="label_TCODCONV"><axis:alt f="axisctr100" c="LIT_9907599" lit="9907599"/></b>
                                        </td>
                                    </axis:visible>                                                           
                                    <axis:ocultar f="axisctr100" c="CACTIVIDAD" dejarHueco="false">
                                        <td class="titulocaja" id="tit_CACTIVIDAD" colspan="2">
                                            <b id="label_CACTIVIDAD"><axis:alt f="axisctr100" c="LIT_9902590" lit="9902590"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr100" c="VERSION" dejarHueco="false" >
                                        <td class="titulocaja" id="tit_VERSION">
                                            <b id="label_VERSION"><axis:alt f="axisctr100" c="LIT_9001146" lit="9001146"/></b>
                                        </td>
                                    </axis:ocultar>                                     
                                     <axis:ocultar f="axisctr100" c="VERSIONANT" dejarHueco="false" >
                                        <td class="titulocaja" id="tit_VERSIONANT">
                                            <b id="label_VERSIONANT"><axis:alt f="axisctr100" c="LIT_9907574" lit="9907574"/></b>
                                        </td>
                                    </axis:ocultar>
                                    </tr>
                                    <tr>                 
                                    	<axis:ocultar f="axisctr100" c="TCODCONV" dejarHueco="false" >
                                        <td class="campocaja" id="td_TCODCONV">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="TCODCONV" name="TCODCONV" 
                                            title="<axis:alt f="axisctr100" c="LIT_9001146" lit="9001146"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr100_datosGestion.convempvers.TCODCONV}"
                                            <axis:atr f="axisctr100" c="TCODCONV" a="modificable=true&obligatorio=true"/>/>
                                        </td>
                                    </axis:ocultar>                                              
                                    <axis:ocultar f="axisctr100" c="CACTIVIDAD" dejarHueco="false">
                                        <td class="campocaja" id ="td_CACTIVIDAD">
                                            <input type="text" style="width:100%"  class="campowidth campo campotexto" id="CACTIVIDAD" name="CACTIVIDAD" 
                                            title="<axis:alt f="axisctr100" c="LIT_103481" lit="103481"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr100_datosGestion.convempvers.TDESCRI}"                                           
                                            <axis:atr f="axisctr100" c="CACTIVIDAD" a="modificable=true&obligatorio=true"/>/>                                                                                                                                                                                
                                        </td>                                                                                
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr100" c="BT_CONVENIOS" dejarHueco="false">
                                        <td class="campocaja" id ="td_BT_CONVENIOS">
                                            <a id="BT_CONVENIOS" href="javascript:f_abrir_axisctr503(${__formdata.SPRODUC})"><img border="0" alt="<axis:alt f="axisctr100" c="LIT_9907572" lit="9907572"/>" title="<axis:alt f="axisctr100" c="LIT_9907572" lit="9907572"/>" src="images/find.gif"/></a>                                   
                                        </td>                                        
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr100" c="VERSION" dejarHueco="false" >
                                        <td class="campocaja" id="td_VERSION">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="VERSION" name="VERSION" 
                                            title="<axis:alt f="axisctr100" c="LIT_9001146" lit="9001146"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr100_datosGestion.convempvers.NVERSION}"
                                            <axis:atr f="axisctr100" c="VERSION" a="modificable=true&obligatorio=true"/>/>
                                        </td>
                                    </axis:ocultar>                                    
                                     
                                    <axis:ocultar f="axisctr100" c="VERSIONANT" dejarHueco="false" >
                                        <td class="campocaja" id="td_VERSIONANT">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="VERSIONANT" name="VERSIONANT" 
                                            title="<axis:alt f="axisctr100" c="LIT_9907574" lit="9907574"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr100_datosGestion.convempvers.NVERSION_ANT}"
                                            <axis:atr f="axisctr100" c="VERSIONANT" a="modificable=true&obligatorio=false"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>     
                                    </tr>
                                </table>
                            <div class="separador">&nbsp;</div>
                      </td>
                   </tr>
                </table>
                </axis:ocultar>   
                        
                     <c:import url="axisctr100_preguntas.jsp"/>                                        
                     
             <axis:ocultar f="axisctr100" c="DSP_TOMADORES" dejarHueco="false"> 
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="DSP_TOMADORES" f="axisctr100" lit="1000181"/></div>
                <table class="seccion"> 
                    <tr>
                        <td>
                            <c:set var="title1"><axis:alt f="axisctr100" c="TOM_NOMBRE" lit="1000181"/></c:set>
                            <display:table name="${axisctr_tomadores}"
                                                           id="axisctr_tomadores"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="-1"
                                                           defaultsort="1"
                                                           defaultorder="ascending"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0"
                                                           requestURI="axis_${pantalla}.do?ordenar=true&tabla=axisctr_tomadores&campo=TNOMBRE&outerMap=OB_IAX_TOMADORES">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="TNOMBRE"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TAPELLI1}
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TAPELLI2},
                                                        ${axisctr_tomadores.OB_IAX_TOMADORES.TNOMBRE}
                                                    </div>
                                                </display:column>
                                                <axis:visible f="axisctr100"
                                                              c="BT_MODIF_TOMADOR">
                                                    <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_modificar_TOM('${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}', this)" id="BT_MODIF_TOMADOR">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr100" c="MODIFICAR" lit="1000295"/>'
                                                                     title='<axis:alt f="axisctr100" c="MODIFICAR" lit="1000295"/>'
                                                                     src="images/lapiz.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                                <axis:visible f="axisctr100"
                                                              c="BT_DEL_TOMADOR">
                                                    <display:column title=""
                                                                    headerClass="headwidth5 sortable"
                                                                    media="html"
                                                                    autolink="false">
                                                        <div class="dspIcons">
                                                            <a href="javascript:f_borrar_tomador('${axisctr_tomadores.OB_IAX_TOMADORES.SPERSON}', this)" id="BT_DEL_TOMADOR">
                                                                <img border="0"
                                                                     alt='<axis:alt f="axisctr100" c="BORRAR" lit="1000127" />'
                                                                     title='<axis:alt f="axisctr100" c="BORRAR" lit="1000127" />'
                                                                     src="images/delete.gif"/>
                                                            </a>
                                                        </div>
                                                    </display:column>
                                                </axis:visible>
                                            </display:table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="4">
                                <div class="separador">&nbsp;</div>
                                <axis:visible f="axisctr100" c="BT_EDITRIESGO_ANADIR">
                                    <input type="button" class="boton" id="BT_EDITRIESGO_ANADIR" name="BT_EDITRIESGO_ANADIR" value="<axis:alt f="axisctr100" c="BUTANADIR" lit="104825" />" onclick="f_abrir_axisctr101_TOM(null,'');" />
                                </axis:visible>
                                <div class="separador">&nbsp;</div>
                            </td>
                    </tr>
                </table>
             </axis:ocultar>
                      <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="DSP_RIESGOS" f="axisctr100" lit="1000100"/></div>
                      <table class="seccion">
                         <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                            <c:import url="axisctr100_b.jsp"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                        </tr>
                        <axis:visible c="DSP_GARANTIES" f="axisctr100">
                        <c:if test="${!empty isNeedTarificar && !isNeedTarificar}">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                        <tr>
                                            <td>
                                                            <table class="area" align="center">
                                                            <tr>
                                                                    <td>
                                                                <c:import url="axisctr100_garanties.jsp"/>
                                                                    </td>
                                                            </tr>
                                                            </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </c:if>
                        </axis:visible>
                        <axis:visible f="axisctr100" c="DSP_BENEFICIARIOS">
                          <c:if test="${!empty sessionScope.axisctr100_datosRiesgo}">
                             <tr>
                                <td>
                                <table class="area" align="center">
                                        <tr>
                                            <td>
                                             <c:import url="axisctr100_riesgo_beneficiarios.jsp"/>
                                             </td>
                                        </tr>
                                </table>
                                </td>
                            </tr>
                            </c:if>
                        </axis:visible>
                  </table> 
<axis:visible f="axisctr100" c="DSP_DTAECO">                   
                  <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="DSP_DTAECO" lit="1000097" /><axis:visible c="CMONPROD" f="axisctr100">  <c:if test="${!empty CMONPROD}">  <axis:alt f="axisctr100" c="CMONPROD" lit="108645"/> :  ${CMONPRODINT} - ${requestScope.TMONPROD} </c:if> </axis:visible></div>
                    <table class="seccion"> 
                        <tr>
                            <td>
                                <c:set var="title1"><axis:alt f="axisctr100" c="TIT01" lit="102995" /></c:set>
                                <c:set var="title2"><axis:alt f="axisctr100" c="IIPS" lit="101515" /></c:set>
                                <c:set var="title3"><axis:alt c="IDGS" f="axisctr100" lit="1000498" /></c:set>
                                <c:set var="title4"><axis:alt f="axisctr100" c="IRECFRA" lit="1000341" /></c:set>
                                <c:set var="title5"><axis:alt f="axisctr100" c="TIT5" lit="100916" /></c:set>
                                <c:set var="title6"><axis:alt f="axisctr100" c="ITOTALR" lit="140531" /></c:set>
                                <c:set var="title7"><axis:alt f="axisctr100" c="ITOTDTO" lit="1000119"/></c:set>                                       
                                <c:set var="title8"><axis:alt f="axisctr100" c="IRECARG" lit="101671"/></c:set>         
                                <c:set var="title9"><axis:alt f="axisctr100" c="IPRITAR" lit="1000496"/></c:set>       
                                <c:set var="title10"><axis:alt f="axisctr100" c="ICONSOR" lit="103101"/></c:set>                                      
                                <c:set var="title11"><axis:alt c="IPRIREB" f="axisctr100" lit="9000837"/></c:set>      
                                <c:set var="title0"><axis:alt f="axisctr100" c="IPRITOT" lit="1000497"/></c:set>  
                                <!-- bug 0025826 -->
                                <c:set var="title12"><axis:alt f="axisctr100" c="ICDERREG" lit="9001509"/></c:set>      
                                <c:set var="title13"><axis:alt f="axisctr100" c="ITOTIMP" lit="1000580"/></c:set>   
                                <c:set var="title14"><axis:alt f="axisctr100" c="IARBITR" lit="101705"/></c:set>
                                   
                                <div class="displayspace">
                                        <display:table name="${axisctr100_datosEconomicos}" id="lista" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                        requestURI="axis_axisctr100.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                           <axis:visible f="axisctr100" c="IPRITAR">
                                            <display:column title="${title9}" sortable="false" sortProperty="IPRITAR" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                <c:if test="${empty psu_critica }"><div id="IPRITAR" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IPRITAR}'/></div></c:if>
                                            </display:column>
                                            </axis:visible>
                                            <!-- bug 42429/237568 -->
                                             <axis:visible f="axisctr100" c="IRECARG">
                                            <display:column title="${title8}" sortable="false" sortProperty="IRECARG" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                 <%--<c:if test="${empty psu_critica }"><div id="IRECARG" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IRECARG}'/></div></c:if>--%>
                                                 <c:if test="${empty psu_critica }"><div id="IRECARG" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ITOTREC}'/></div></c:if>
                                             </display:column> 
                                             </axis:visible>
                                             <axis:visible f="axisctr100" c="ITOTDTO">
                                             <display:column title="${title7}" sortable="false" sortProperty="ITOTDTO" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                 <c:if test="${empty psu_critica }"><div id="ITOTDTO" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ITOTDTO}'/></div></c:if>
                                             </display:column> 
                                             </axis:visible>
                                            <axis:visible f="axisctr100" c="IPRITOT">
                                            <display:column title="${title0}" sortable="false" sortProperty="IPRITOT"  headerClass="headwidth10 sortable" media="html" autolink="false" >
                                               <c:if test="${empty psu_critica }"> <div id="IPRITOT" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IPRITOT}'/></div></c:if>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr100" c="ICONSOR">
                                            <display:column title="${title10}" sortable="false" sortProperty="ICONSOR"  headerClass="headwidth10 sortable" media="html" autolink="false" >
                                               <c:if test="${empty psu_critica }"> <div id="ICONSOR" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ICONSOR}'/></div></c:if>
                                            </display:column>
                                            </axis:visible> 
                                            <axis:visible f="axisctr100" c="IRECFRA">
                                                <display:column title="${title4}" sortable="false" sortProperty="IRECFRA" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                   <c:if test="${empty psu_critica }"> <div id="IRECFRA" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IRECFRA}'/></div></c:if>
                                                </display:column>   
                                             </axis:visible> 
                                             <!-- bug 0025826 -->
                                             <axis:visible f="axisctr100" c="ICDERREG">
                                                <display:column title="${title12}" sortable="false" sortProperty="ICDERREG" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                  <c:if test="${empty psu_critica }">  <div id="ICDERREG" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ICDERREG}'/></div></c:if>
                                                </display:column>
                                            </axis:visible>
                                             <axis:visible f="axisctr100" c="IIPS">
                                                <display:column title="${title2}" sortable="false" sortProperty="IIPS" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                  <c:if test="${empty psu_critica }">  <div id="IIPS" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IIPS}'/></div></c:if>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisctr100" c="IDGS">
                                                <display:column title="${title3}" sortable="false" sortProperty="IDGS"  headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                    <c:if test="${empty psu_critica }"><div id="IDGS" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IDGS}'/></div></c:if>
                                                </display:column>
                                            </axis:visible>
                                            
                                            <axis:visible f="axisctr100" c="IARBITR">
                                                <display:column title="${title14}" sortable="false" sortProperty="IARBITR"  headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                    <c:if test="${empty psu_critica }"><div id="IARBITR" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IARBITR}'/></div></c:if>
                                                </display:column>
                                            </axis:visible>
                                            
                                            
                                             
                                           <axis:visible f="axisctr100" c="ITOTIMP">
                                           <display:column title="${title13}" sortable="false" sortProperty="ITOTIMP" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                               <c:if test="${empty psu_critica }"><div id="ITOTIMP" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ITOTIMP}'/></div></c:if>
                                           </display:column> 
                                           </axis:visible>                                                               
                                            <display:column title="${title6}" sortable="false" sortProperty="ITOTALR" headerClass="headwidth10 sortable" media="html"  autolink="false" >
                                              <c:if test="${empty psu_critica }"> <div id="ITOTALR" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.ITOTALR}'/></div></c:if>
                                            </display:column>
                                           <axis:visible f="axisctr100" c="IPRIREB">
                                           <display:column title="${title11}" sortable="false" sortProperty="IPRIREB" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                              <c:if test="${empty psu_critica }"> <div id="IPRIREB" class="dspNumber"><fmt:formatNumber pattern='${__formatNumberPatterns[CMONPRODINT]}' value='${lista.IPRIREB}'/></div></c:if>
                                           </display:column> 
                                           </axis:visible>                                                               
                                        </display:table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </axis:visible>
                    <axis:visible c="DSP_PSU" f="axisctr100">
                    
          <c:if test="${!empty PTPSUS}">
             <div class="separador">&nbsp;</div>
 <table class="seccion"> 
     <tr>
                <td class="campocaja" >
                      <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="DSP_PSU" lit="9002255" /> <b style="color:#333333;font-size: 9px;">${PTESTPOL} ${PTNIVELBPM}</b></div>
                <!--campos-->
                <div class="separador">&nbsp;</div>
                </td>
            </tr>
            <tr>
                <td class="campocaja" >
                    <div class="displayspace">
                         <c:set var="title0"><axis:alt f="axisctr100" c="TCONTROL" lit="9900975" /></c:set>
                         <c:set var="title1"><axis:alt f="axisctr100" c="FMOVIMI" lit="9900976" /></c:set>                               
                         <c:set var="title2"><axis:alt f="axisctr100" c="TAUTREC" lit="9900977" /></c:set>
                                                 <c:set var="title5"><axis:alt f="axisctr100" c="TRIESGO" lit="9906106" /></c:set>                         
                         <c:set var="title6"><axis:alt f="axisctr100" c="TNIVELR" lit="9900978" /></c:set>
                         
                         <c:set var="title7"><axis:alt f="axisctr100" c="INFO" lit="1000113" /></c:set>
                         <c:set var="title8"><axis:alt f="axisctr100" c="CCRITICO" lit="9905109" /></c:set>
                         
                        
                         
                         
                         <display:table name="${PTPSUS}" id="T_IAX_PSU" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                         requestURI="axis_axisctr100.do?paginar=true"> <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre est? desplegada -->
                           <%@ include file="../include/displaytag.jsp"%>
                         
                           
                           
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PSU.TCONTROL" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TCONTROL}</div>
                           </display:column>
                           
                           <display:column title="${title1}" sortable="true" sortProperty="" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value="${T_IAX_PSU.OB_IAX_PSU.FMOVIMI}" pattern="dd/MM/yyyy" /></div>
                           </display:column>
                           
                           <axis:visible f="axisctr100" c="TAUTREC">   
                           <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PSU.TAUTREC" headerClass="fixed  sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TAUTREC}</div>
                           </display:column>
                           </axis:visible>
                           
                           <%--display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PSU.FAUTREC" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.FAUTREC}</div>
                           </display:column>
                           
                           <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_PSU.TUSUNOM" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TUSUNOM}</div>
                           </display:column--%>
                           
                           <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_PSU.TRIESGO" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TRIESGO}<c:if test="${!empty T_IAX_PSU.OB_IAX_PSU.CGARANT && T_IAX_PSU.OB_IAX_PSU.CGARANT!=0}"> - ${T_IAX_PSU.OB_IAX_PSU.TGARANT}</c:if></div>
                           </display:column>
                           
                           <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_PSU.TNIVELR" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText">${T_IAX_PSU.OB_IAX_PSU.TNIVELR}</div>
                           </display:column>
                           <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_PSU.CCRITICO" headerClass="fixed sortable"  media="html" autolink="false" >
                               <div class="dspText" >
                               <input type="checkbox"   id="CCRITICO" name="CCRITICO" <c:if test="${T_IAX_PSU.OB_IAX_PSU.CCRITICO == 1}">checked style="background-color: red;" </c:if> value="${T_IAX_PSU.OB_IAX_PSU.CCRITICO}"
                               <axis:atr f="axisctr100" c="CCRITICO" a="modificable=false&obligatorio=false&isInputText=false"/> />
                               </div>
                           </display:column>
                           <display:column title="${title7}" headerClass="headwidth5 fixed sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr100" c="INFO" lit="1000113"/>" src="images/mas.gif" width="11px" height="11px"
                                style="vertical-align:middle;cursor:pointer;" onclick="f_abrir_axispsu003('${T_IAX_PSU.OB_IAX_PSU.SSEGURO}','${T_IAX_PSU.OB_IAX_PSU.NMOVIMI}','${T_IAX_PSU.OB_IAX_PSU.NRIESGO}','${T_IAX_PSU.OB_IAX_PSU.CCONTROL}','${T_IAX_PSU.OB_IAX_PSU.NOCURRE}','${T_IAX_PSU.OB_IAX_PSU.CGARANT}')" title="<axis:alt f='axisctr100' c='INFO' lit='1000113'/>"/>
                                </div>
                           </display:column>                           
                        </display:table>
                    </div>
                </td>
            </tr>
           
        </tr>      
       </table>
</c:if>
</axis:visible>
                    <axis:ocultar f="axisctr100" c="GRPDRENTAS" dejarHueco="false">
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr100" c="GRPDRENTAS" lit="1000099" /></div>
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
                                        <tr>
                                            <axis:ocultar f="axisctr100" c="PCAPFALL" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_PCAPFALL"><axis:alt f="axisctr100" c="PCAPFALL" lit="152489" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr100" c="PDOSCAB" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_PDOSCAB"><axis:alt f="axisctr100" c="PDOSCAB" lit="180148" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr100" c="CFORPAGREN" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_NFORPAGREN"><axis:alt f="axisctr100" c="NFORPAGREN" lit="1000180" /></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr100" c="FPPREN" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b id="label_FPPREN"><axis:alt f="axisctr100" c="FPPREN" lit="9901167" /></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                        <axis:ocultar f="axisctr100" c="PCAPFALL" dejarHueco="false">
                                               <td class="campocaja">            
                                                    <input type="text" class="campowidth campo campotexto" id="PCAPFALL" name="PCAPFALL" obligatorio='true'  title="<axis:alt f="axisctr100" c="PCAPFALL" lit="152489"/>" onblur ="f_grabar_datos()"
                                                    size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='${sessionScope.axisctr100_datosGestion.PCAPFALL}' />" <axis:atr f="axisctr100" c="PCAPFALL" a="modificable=false&formato=decimal"/>/>&nbsp;
                                                </td>
                                         </axis:ocultar>                                                                    
                                         <axis:ocultar f="axisctr100" c="PDOSCAB" dejarHueco="false">
                                               <td class="campocaja">
                                                             <input type="text" class="campowidth campo campotexto" id="PDOSCAB" name="PDOSCAB" obligatorio='true'  title="<axis:alt f="axisctr100" c="PDOSCAB" lit="180148"/>" onblur ="f_grabar_datos()"
                                                             size="15" value ="<fmt:formatNumber pattern='###,#00.00' value='${sessionScope.axisctr100_datosGestion.PDOSCAB}' />" 
                                                            <c:if test="${sessionScope.axisctr100_datosGestion.CPCTREV  == 1}">disabled</c:if>
                                                            <axis:atr f="axisctr100" c="PDOSCAB" a="modificable=false&formato=decimal"/>/>&nbsp;                                                            
                                                </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr100" c="CFORPAGREN" dejarHueco="false">
                                           <td class="campocaja">
                                                    <select name = "CFORPAGREN" style="width:85%" id ="CFORPAGREN" size="1" onchange="f_carga_dependencias();f_grabar_datos()" 
                                                        class="campowidth campo campotexto"  title="<axis:alt f='axisctr100' c='CFORPAGREN' lit='1000180' />"
                                                        <axis:atr f="axisctr100" c="CFORPAGREN" a="modificable=false&obligatorio=true&isInputText=false"/>>&nbsp;
                                                        	<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr100" c="SNV_COMBO" lit="1000348"/> - </option>
                                                        <c:forEach items="${sessionScope.axisctr_opcionesDatosRenta.CFORPAGREN}" var="cforpagren">
                                                            <option value = "${cforpagren.CATRIBU}" <c:if test="${cforpagren.CATRIBU  == sessionScope.axisctr100_datosGestion.CFORPAGREN}">selected</c:if>>${cforpagren.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                            </td>                                       
                                       </axis:ocultar>      
                                         <axis:ocultar f="axisctr100" c="FPPREN" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" style="width:40%" class="campowidthinput campo campotexto" onchange="f_grabar_datos();" id="FPPREN" name="FPPREN" size="15" title="<axis:alt f="axisctr100" c="FPPREN" lit="9901167"/>"
                                                value="<fmt:formatDate value='${sessionScope.axisctr100_datosGestion.FPPREN}' pattern='dd/MM/yyyy'/>"
                                                <axis:atr f="axisctr100" c="FPPREN" a="obligatorio=false&formato=fecha"/> /><a id="icon_FPPREN" style="vertical-align:middle;" href="#"><img id="popup_calendario_revision" border="0" alt="<axis:alt f="axisctr100" c="FPPREN" lit="9901167" />" title="<axis:alt f="axisctr100" c="FPPREN" lit="9901167" />" src="images/calendar.gif"/></a>
                                            </td>                                  
                                       </axis:ocultar>      
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>
                </td> 
            </tr>
