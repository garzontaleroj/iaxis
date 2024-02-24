<p>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<p>

  <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:16%;height:0px"></th>
                                    <th style="width:16%;height:0px"></th>
                                    <th style="width:16%;height:0px"></th>
                                    <th style="width:16%;height:0px"></th>
                                    <th style="width:16%;height:0px"></th>
                                    <th style="width:16%;height:0px"></th>
                                </tr>
                                <!-- Fila 1 -->
                                <tr>
                                    <axis:ocultar f="axisctr004" c="FEFECTO" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_FEFECTO"><axis:alt f="axisctr004" c="label_FEFECTO" lit="100883"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CDURACI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_CDURACI"><axis:alt f="axisctr004" c="label_CDURACI" lit="1000376"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURACI" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_NDURACI"><axis:alt f="axisctr004" c="label_NDURACI" lit="1000120"/></b>
                                        </td>
                                    </axis:ocultar>  

                                    <axis:ocultar f="axisctr004" c="NDURCOB" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_NDURCOB"><axis:alt f="axisctr004" c="label_NDURCOB" lit="9000814"/></b>
                                        </td>
                                    </axis:ocultar>                                      

                                    <axis:ocultar f="axisctr004" c="FVENCIM" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_FVENCIM"><axis:alt f="axisctr004" c="label_FVENCIM" lit="100885"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURPER" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_NDURPER"><axis:alt f="axisctr004" c="label_NDURPER" lit="1000328"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="INTTEC" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_INTTEC"><axis:alt f="axisctr004" c="label_INTTEC" lit="107049"/></b>
                                        </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr004" c="FEFECTO" dejarHueco="false">
                                        <td class="campocaja">
                                            <jsp:useBean id="today" class="java.util.Date" /> 
                                            <c:set var="FEFECTO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFECTO}"/></c:set>
                                            <input style="width:85%" onchange="f_actualitza_fvencim(this)" type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15" 
                                            <axis:atr f="axisctr004" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FEFECTO} <c:if test="${empty FEFECTO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                            title="<axis:alt f="axisctr004" c="FEFECTO" lit="100883"/>"/><a id="icon_FEFECTO" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr004" c="FEFECTO" lit="108341"/>" title="<axis:alt f="axisctr004" c="FEFECTO" lit="100883"/>" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CDURACI" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CDURACI" id ="CDURACI" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisctr004" c="CDURACI" a="modificable=false&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoDuracion}" var="tipoDuracion">
                                                    <option value = "${tipoDuracion.CATRIBU}" <c:if test="${tipoDuracion.CATRIBU  == sessionScope.axisctr_datosGestion.CDURACI}">selected</c:if>>${tipoDuracion.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURACI" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="NDURACI" name="NDURACI"  title="<axis:alt f="axisctr004" c="NDURACI" lit="1000120"/>"
                                            size="15" onchange="f_actualitza_fvencim2(this)"   value ="${sessionScope.axisctr_datosGestion.DURACION}" <axis:atr f="axisctr004" c="NDURACI" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>  

                                    <axis:ocultar f="axisctr004" c="NDURCOB" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB"  title="<axis:alt f="axisctr004" c="NDURCOB" lit="1000120"/>"
                                            size="15"  value ="${sessionScope.axisctr_datosGestion.NDURCOB}" <axis:atr f="axisctr004" c="NDURCOB" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>  

                                     <axis:ocultar f="axisctr004" c="FVENCIM" dejarHueco="false">
                                         <td class="campocaja">
                                            <c:set var="FVENCIM"><fmt:formatDate pattern="dd/MM/yyyy" value="${axisctr_datosGestion.FVENCIM}"/></c:set>
                                            <input style="width:85%" type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15"
                                            value ="${FVENCIM}" title="<axis:alt f="axisctr004" c="FVENCIM" lit="100885"/>" <axis:atr f="axisctr004" c="FVENCIM" a="modificable=true&obligatorio=true&formato=fecha"/>/><a id="icon_FVENCIM" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisctr004" c="FVENCIM" lit="108341"/>" title="<axis:alt f="axisctr004" c="FVENCIM" lit="108341"/>" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURPER" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "NDURPER" id ="NDURPER" size="1" 
                                            class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr004" c="NDURPER" a="modificable=false&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosRenta.NDURPER}" var="ndurper">
                                                    <option value = "${ndurper.NDURPER}" <c:if test="${ndurper.NDURPER  == sessionScope.axisctr_datosGestion.NDURPER}">selected</c:if>>${ndurper.NDURPER}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>                                    
                                     <axis:ocultar f="axisctr004" c="INTTEC" dejarHueco="false">
                                        <td class="campocaja">
                                         <input type="text" class="campowidth campo campotexto" id="INTTEC" name="INTTEC" title="<axis:alt f="axisctr004" c="INTTEC" lit="180148"/>" 
                                                             size="15" value ="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${sessionScope.axisctr_datosGestion.INTTEC}'/>"                                                             
                                                            <axis:atr f="axisctr100" c="INTTEC" a="obligatorio=false&modificable=true&formato=decimal"/> />&nbsp;
                                        </td>
                                    </axis:ocultar>
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="titulo" lit="1000097"/></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>                                
                                </tr>

                                <tr>
                                    <axis:ocultar f="axisctr004" c="CFORPAG" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_CFORPAG"><axis:alt f="axisctr004" c="label_CFORPAG" lit="100712"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CTIPCOB" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_CTIPCOB"><axis:alt f="axisctr004" c="label_CTIPCOB" lit="151348"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CBANCAR" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b id="label_CBANCAR"><axis:alt f="axisctr004" c="label_CBANCAR" lit="1000092"/></b>
                                        </td>
                                     </axis:ocultar>

                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr004" c="CFORPAG" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CFORPAG" id ="CFORPAG" size="1" onchange="f_OnChange()" 
                                                class="campowidthselect campo campotexto" <axis:atr f="axisctr004" c="CFORPAG" a="isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.formaPago}" var="formaPago">
                                                    <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_datosGestion.CFORPAG}">selected</c:if>>${formaPago.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CTIPCOB" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name = "CTIPCOB" id ="CTIPCOB" size="1" onchange="f_OnChange()" 
                                                class="campowidthselect campo campotexto" title="<axis:alt f="axisctr004" c="CTIPCOB" lit="151348"/>" <axis:atr f="axisctr004" c="CTIPCOB" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <axis:alt f="axisctr004" c="CTIPCOB" lit="108341"/> - </option> 
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoCobro}" var="tipoCobro">
                                                    <option value = "${tipoCobro.CATRIBU}" <c:if test="${tipoCobro.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOB}">selected</c:if>>${tipoCobro.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    
                                         <td class="campocaja"  colspan="4">
                                         <axis:ocultar f="axisctr004" c="CBANCAR" dejarHueco="false">
                                            <select name = "CBANCAR" style="width:50%" id ="CBANCAR" size="1"  
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr004" c="CBANCAR" a="isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.cuentasTomador}" var="cuentaTomador">
                                                    <option value = "${cuentaTomador.CBANCAR}" <c:if test="${cuentaTomador.CBANCAR  == sessionScope.axisctr_datosGestion.CBANCAR}">selected</c:if>>${cuentaTomador.TCBANCAR}</option>
                                                </c:forEach>
                                            </select>
                                             </axis:ocultar> 
                                            
                                            <axis:visible f="axisctr004" c="BT_CBANCAR">
                                                 <a id="icon_CBANCAR" href="javascript:f_abrir_axisper007(${__formdata.SPERSON})"><img border="0" alt="<axis:alt f="axisctr004" c="CBANCAR" lit="1000124"/>" title="<axis:alt f="axisctr004" c="CBANCAR" lit="1000124"/>" src="images/lapiz.gif"/></a>
                                            </axis:visible>
                                            <axis:ocultar f="axisctr004" c="BT_BUSCAR" dejarHueco="false">
                                                 <input type="button" class="boton" id="BT_BUSCAR" name="BT_BUSCAR"  value="<axis:alt f="axisctr004" c="BT_BUSCAR" lit="9000508"></axis:alt>" onclick="f_Get_CCC(${__formdata.SPERSON},'${__formdata.SNIP}')" />
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr004" c="BT_BUSCARHOST" dejarHueco="false">
                                                
                                                    <input type="button" class="boton" id="BT_BUSCARHOST" name="BT_BUSCARHOST"  value="<axis:alt f="axisctr004" c="BT_BUSCARHOST" lit="9000509"></axis:alt>" onclick="f_Get_CCC_HOST(${__formdata.SPERSON},'${__formdata.SNIP}')" />
                                              
                                            </axis:ocultar>
                                            
                                        </td>
                                                                       
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                    <axis:visible f="axisctr004" c="CRECFRA">
                                      <b id="label_CRECFRA">
                                        <axis:alt f="axisctr004" c="label_CRECFRA" lit="1000483"/>
                                      </b>
                                    </axis:visible>  
                                    <axis:ocultar f="axisctr004" c="CRECFRA" dejarHueco="false" >
                                      <input  
                                        <c:if test="${sessionScope.axisctr_datosGestion.CRECFRA == '1'}">checked="true"</c:if> onchange="f_onclickCheckbox(this);"  
                                      type="checkbox" id="CRECFRA" name="CRECFRA" value="${sessionScope.axisctr_datosGestion.CRECFRA}"/>
                                    </axis:ocultar>
                                    </td>
                                </tr>                                
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>