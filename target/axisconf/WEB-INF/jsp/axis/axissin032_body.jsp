<%/* Revision:# xOYqt3kHZ9RKD0yP2J5u0w== # */%>
<%/**
*  Pantalla principal de 'Alta Siniestro'
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
                      
                        <!-- Datos Siniestro -->
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="DATOSSINI" lit="104929" /></div>
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
                                            <!-- bug 0024964 lista Tramitador -->
                                            <axis:visible f="axissin032" c="CTRAMITAD">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CTRAMITAD" lit="100555" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Descripcion tramitador -->
                                           <axis:visible f="axissin032" c="TRAMITADOR">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="TRAMITADOR" lit="9910018" /></b>
                                                </td>
                                            </axis:visible>
                                              <axis:ocultar f="axissin032" c="CAGENTE_SEL" dejarHueco="false"> <!-- TODO C -->
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axissin032" c="CAGENTE" lit="100584"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                          </tr>
                                          <tr>                                          
                                            <!-- bug 0024964 lista Tramitador -->
                                            <axis:visible f="axissin032" c="CTRAMITAD">
                                                <td class="campocaja"><!--  -->
                                              <select name = "CTRAMITAD" id="CTRAMITAD" style="width:160px;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_CTRAMITAD" f="axissin032" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listValores.listaTramitadores}">
                                                                <option value = "${element.CTRAMITAD}"
                                                                    <c:if test="${element.CTRAMITAD == __formdata.CTRAMITAD || (element.CDEFECTO == 1 && empty __formdata.CTRAMITAD) }">selected</c:if>>
                                                                    ${element.TTRAMITAD}
                                                                </option>
                                                            </c:forEach>
                                                </select>
                                                
					                            <axis:visible c="BT_FIND_PJ" f="axissin032"> 
						                        	<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axissin067()" style="cursor:pointer"/>      
						                        </axis:visible>
                                                </td>
                                            </axis:visible>

                                            <axis:ocultar f="axissin032" c="CAGENTE_SEL" dejarHueco="false"> <!-- TODO C -->
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE_SEL}" name="CAGENTE_SEL" id="CAGENTE_SEL"  title="<axis:alt f="axisctr019" c="CAGENTE_SEL" lit="100584"/>"  style="width:15%"
                                                    title="<axis:alt f="axissin032" c="CAGENTE_SEL" lit="100584" />" onchange="f_actualizar_agente_sel(this.value)"/>
                                                    
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    
                                                    <input type="text" class="campo campotexto" value="${__formdata.TAGENTE_SEL}" name="TAGENTE_SEL" id="TAGENTE_SEL" title="<axis:alt f="axisctr019" c="TAGENTE_SEL" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                                    title="<axis:alt f="axissin032" c="TAGENTE_SEL" lit="100584"/>"/>
                                                </td>
                                            </axis:ocultar>      
                                          </tr>
                                        <!-- Fila 3 -->
                                         <tr>
                                            <!-- Fecha ocurrencia -->
                                            <axis:visible f="axissin032" c="FSINIES">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="FSINIES" lit="1000510" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Hora ocurrencia -->
                                            <axis:visible f="axissin032" c="HSINIES">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="HSINIES" lit="1000242" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- fecha_recepcion -->
                                            <axis:visible f="axissin032" c="FNOTIFI">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="FNOTIFI" lit="102913" /></b>
                                                </td>
                                            </axis:visible>                                            
                                            <!-- Responsabilidad -->
                                            <axis:visible f="axissin032" c="RESPONSABILIDAD">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="RESPONSABILIDAD" lit="1000511" /></b>
                                                </td>
                                            </axis:visible>
                                            <axis:visible c="CEVENTO" f="axissin032">
                                            <!-- Evento -->
                                                <td class="titulocaja" ><!-- colspan="2" -->
                                                    <b><axis:alt f="axissin032" c="CEVENTO" lit="9000973" /></b>
                                                </td>
                                            </axis:visible>
                                                 
                                         </tr>
                                         <tr>
                                            <!-- Fecha ocurrencia -->
                                            <axis:visible f="axissin032" c="FSINIES">
                                                <td class="campocaja"> <!--  -->
                                                    <input tabindex="13" onblur="f_actData(this);" onchange="javascript:f_actData(this);f_call_asistencia();f_carga_garantias(this.value,document.miForm.causas.value,document.miForm.motivos.value);" type="text" class="campowidthinput campo" id="FSINIES" title="<axis:alt f='axissin032' c='FOCURRENCIA' lit='700362' />" name="FSINIES" size="15"
                                                     <c:if test="${!empty __formdata.T_IAX_RIESGOS}">obligatorio="true"</c:if>
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FSINIES']}"/>" <axis:atr f="axissin032" c="FSINIES" a="modificable=true&formato=fecha"/> style="width:60%"/><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_ocurrencia" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="FCURRENCIA" lit="700362" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
                                            <!-- Hora ocurrencia -->
                                            <axis:visible f="axissin032" c="HSINIES">
                                                <td class="campocaja">
                                                    <input tabindex="14" type="text" class="campowidthinput campo" id="HSINIES" name="HSINIES" maxislength="5" size="15" style="width:30%"
                                                    value="${__formdata['HSINIES']}" title="<axis:alt f='axissin032' c='HORA' lit='102790' />" <axis:atr f="axissin032" c="HSINIES" a="formato=hora&obligatorio=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- fecha_recepcion -->
                                            <axis:visible f="axissin032" c="FNOTIFI">
                                                <td class="campocaja">
                                                    <input tabindex="15" onblur="f_actData(this)" style="width:60%" type="text" class="campowidthinput campo campotexto" id="FNOTIFI" name="FNOTIFI" size="15" title="<axis:alt f='axissin032' c='FNOTIFI' lit='102913' />" 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FNOTIFI']}"/>" <axis:atr f="axissin032" c="FNOTIFI" a="modificable=true&obligatorio=true&formato=fecha"/> /><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_recepcion" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="FNOTIFI" lit="102913" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
                                            
                                              <!-- Responsabilidad 'RESPONSABILIDAD' oculta el campo por scg's-->
                                            <axis:visible f="axissin032" c="RESPONSABILIDAD">
                                                <td class="campocaja"> 
                                                    <select tabindex="16" name = "responsabilidad" id ="responsabilidad" size="1" class="campowidthselect campo campotexto">                                                    
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="SEL_RESPONSABILIDAD" lit="1000351"/> - </option>
                                                    <c:forEach var="responsOp" items="${__formdata.T_IAX_RESPONSABILIDAD}">
                                                        <option value = "${responsOp.CATRIBU}" <c:if test="${ !empty __formdata.responsabilidad && responsOp.CATRIBU == __formdata.responsabilidad}">selected</c:if>>
                                                                ${responsOp.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            
                                            <!-- Evento -->
                                            <axis:ocultar c="CEVENTO" f="axissin032" dejarHueco="false">
                                                <td class="campocaja" > <!-- colspan="2" -->
                                                    <input tabindex="17" type="text" class="campowidthinput campo"  value="${__formdata.CEVENTO}"        name="CEVENTO" id="CEVENTO" onchange="f_onchange_CEVENTO()" style="width:30%;" />&nbsp;
                                                    <img id="findEvento"  border="0" src="images/find.gif" style="cursor:pointer" onclick="f_abrir_axissin035()"/><%--${__formdata.CEVENTO}--%>
                                                        &nbsp;<span id="TEVENTO_span"><b>${__formdata.TEVENTO}</b></span>
                                                </td>    
                                            </axis:ocultar>
                                         </tr>
                                         <tr>
                                            <!-- Causas -->
                                            <axis:visible f="axissin032" c="CAUSAS">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CAUSAS" lit="180580" /></b>
                                                </td>
                                            </axis:visible>                                            
                                            <!-- Motivo -->
                                            <axis:visible f="axissin032" c="MOTIVOS">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="MOTIVOS" lit="102577" /></b>
                                                </td>
                                            </axis:visible>    
                                            <axis:ocultar f="axissin032" c="FDETECCION" dejarHueco="false">
                                                <td class="titulocaja" colspan="2">
                                                
                                                    <b><axis:alt f="axissin032" c="FDETECCION" lit="9908703" /></b>
                                                
                                                </td>
                                            </axis:ocultar>  
                                             <!-- Reclamación -->
                                            <axis:ocultar c="CRECLAMA" f="axissin032" dejarHueco="false">                                           
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CRECLAMA" lit="9000974" /></b>
                                                </td>   
                                            </axis:ocultar>
                                         </tr>
                                         <tr>
                                            <!-- Causas -->
                                            <axis:visible f="axissin032" c="CAUSAS">
                                                <td class="campocaja"><!--  -->
                                                   <select tabindex="18" name = "causas" id ="causas" size="1" onchange="f_cambia_causa(this);" class="campowidthselect campo"
                                                   	<axis:atr f="axissin032" c="CAUSAS" a="obligatorio=false"/>>                                                    
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="SEl_CAUSAS" lit="1000349"/> - </option>
                                                    <c:forEach var="causasOp" items="${__formdata.T_IAX_CAUSAS}">
                                                        <option value = "${causasOp.CCAUSIN}" <c:if test="${ causasOp.CCAUSIN == __formdata.causas}">selected</c:if>>
                                                                ${causasOp.TCAUSIN}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <!-- Motivo -->
                                            <!-- bug 0022674 -->
                                            <axis:visible f="axissin032" c="MOTIVOS">
                                                <td class="campocaja"> <!--  -->
                                                   <select tabindex="19" name="motivos" onchange="f_cambia_motivo(document.miForm.FSINIES.value,document.miForm.causas.value,this.value);" id="motivos" size="1" class="campowidthselect campo campotexto"
                                                   	<axis:atr f="axissin032" c="MOTIVOS" a="obligatorio=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="SEL_MOTIVOS" lit="1000440"/> - </option>
                                                    <c:forEach var="motivosOp" items="${sessionScope.T_IAX_MOTIVOS}">
                                                        <option value = "${motivosOp.CMOTSIN}" <c:if test="${ motivosOp.CMOTSIN == __formdata.motivos}">selected</c:if>>
                                                                ${motivosOp.TMOTSIN} 
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>  
                                            
                                            
                                                 <!-- Fecha deteccion -->
                                          <axis:ocultar f="axissin032" c="FDETECCION" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                            
                                             <input tabindex="13" type="text" class="campowidthinput campo" id="FDETECCION" title="<axis:alt f='axissin032' c='FDETECCION' lit='700362' />" name="FDETECCION" size="15"
                                                  
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FDETECCION']}"/>" <axis:atr f="axissin032" c="FSINIES" a="modificable=true&formato=fecha"/> style="width:30%"/><a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_deteccion" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="FDETECCION" lit="9908703" />" src="images/calendar.gif"/></a>
                                                    
                                                    
      
                                              
                                            </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar c="CRECLAMA" f="axissin032" dejarHueco="false">
                                                 <!-- Reclamación -->
                                                <td class="campocaja">
                                                    <select tabindex="20" name = "CRECLAMA" id="CRECLAMA" style="width:130px" size="1"  class="campowidthselect campo" >
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>
                                                                <c:forEach var="reclam" items="${__formdata.listValores.lstreclama}">
                                                                    <option value = "${reclam.CATRIBU}"
                                                                        <c:if test="${reclam.CATRIBU == __formdata.CRECLAMA}">selected</c:if>>
                                                                        ${reclam.TATRIBU}
                                                                    </option>
                                                                </c:forEach>
                                                    </select>
                                                </td>  
                                          </axis:ocultar>
                                        </tr>                                                                                                                         
                                        <tr>
                                            <axis:visible f="axissin032" c="REFEXTERNA">
                                           <td class="titulocaja" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="axissin032" c="REFEXTERNA" lit="9902448" /></b>
                                                        </td>
                                                        <axis:visible f="axissin032" c="REF_ICON_MAS">
                                                        
                                                        <td class="titulocaja" align="right">
                                                            <img border="0" title="<axis:alt f="axissin032" c="REF_ICON_MAS" lit="9902448"/>" src="images/new.gif" onclick="f_alta_referencia()" style="cursor:pointer"/>                                                            
                                                        </td>
                                                        </axis:visible>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="CFRAUDE">
                                              <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CFRAUDE" lit="9902124" /></b>
                                                      
                                                      <axis:visible f="axissin032" c="ALTA_FRAUDE"> 
                                                      <div>
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                      <a href="javascript:f_alta_defraudador();" ><img border="0" alt="<axis:alt f="axissin032" c="ALTA_DEFRAU" lit="9903632"/>" title="<axis:alt f="axissin032" c="ALTA_DEFRAU" lit="9903632"/>" src="images/new.gif"></a>
                                                      </div>
                                                      </axis:visible>
                                              </td>
                                            </axis:visible>
                                            
                                            <axis:visible f="axissin032" c="CCARPETA">
                                              <td class="titulocaja">
                                                    <b><axis:alt f="axissin006" c="CCARPETA" lit="9902601" /></b>
                                              </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="ASISTENCIA">
                                              <td class="titulocaja">
                                                    <b id="label_ASISTENCIA"><axis:alt f="axissin032" c="ASISTENCIA" lit="9903527" /></b>
                                              </td>
                                            </axis:visible>
                                            <!-- ini bug 0024675 -->
                                            <axis:visible f="axissin032" c="CSALVAM">
                                              <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CSALVAM" lit="9904530" /></b>
                                              </td>
                                            </axis:visible>
                                            <!-- fin bug 0024675 -->
                                            
                                        </tr>
                                       
                                        <tr>
                                            <axis:visible f="axissin032" c="REFEXTERNA">
                                            <td class="campocaja" colspan="2">
                                                <table class="seccion">
                                                    <tr>
                                                        <td align="left" >
                                                            <table class="area" align="center" tabindex="38">
                                                                <th style="width:100%;height:0px"></th>
                                                                <tr>
                                                                    <td align="left" class="campocaja">
                                                                        <c:set var="title1"><axis:alt f="axissin032" c="TIPOREF" lit="9902449"/></c:set>
                                                                        <c:set var="title2"><axis:alt f="axissin032" c="CODIGO" lit="1000109"/></c:set>
                                                                        <c:set var="title3"><axis:alt f="axissin032" c="FINI" lit="9000526"/></c:set>
                                                                        <c:set var="title6"><axis:alt f="axissin032" c="FFIN" lit="9000527"/></c:set>
                                                                        <c:set var="title4"><axis:alt f="axissin032" c="MODIFICAR" lit="9000552"/></c:set>
                                                                        <c:set var="title5"><axis:alt f="axissin032" c="ELIMINAR" lit="1000127"/></c:set>
                                                                        <div class="displayspace" style="border: solid 0;width:100%" >                         
                                                                            <display:table name="${__formdata.REFERENCIAS}" id="miListaRef" export="false"  class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:98.5%;border:1px" 
                                                                             requestURI="axis_axissin032.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <axis:visible f="axissin032" c="TIPOREF">
                                                                                <display:column title="${title1}" sortable="false" sortProperty="radioGarant" headerClass="headwidth20 sortable fixed"  media="html" autolink="false"  >
                                                                                    <a srefext="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}" ></a><div class="dspNumber">${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TTIPREF}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin032" c="CODIGO">
                                                                                <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                                                    <div class="dspNumber">${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT}</div>
                                                                                </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin032" c="FINI">
                                                                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFINI" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFINI}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin032" c="FFIN">
                                                                                    <display:column title="${title6}" sortable="false" sortProperty="OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspNumber"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN}"/></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin032" c="MODIFICAR">
                                                                                    <display:column title="${title4}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons">
                                                                                            <a href="javascript:f_modificar_ref('${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.CTIPREF}','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.TREFEXT}','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFINI}"/>','<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.FREFFIN}"/>','${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}');"><img border="0" alt="<axis:alt f="axissin032" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin032" c="EDITAR" lit="100002"/>" src="images/lapiz.gif">
                                                                                            </a>
                                                                                        </div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                                <axis:visible f="axissin032" c="ELIMINAR">
                                                                                    <display:column title="${title5}" sortable="false" sortProperty="ICAPITAL" headerClass="headwidth5 sortable fixed"  media="html" autolink="false">
                                                                                        <div class="dspIcons"><a href="javascript:f_eliminar_ref('${miListaRef.OB_IAX_SINIESTRO_REFERENCIAS.SREFEXT}');"><img border="0" alt="<axis:alt f="axissin032" c="EDITAR" lit="100002"/>" title="<axis:alt f="axissin032" c="EDITAR" lit="100002"/>" src="images/delete.gif"></a></div>
                                                                                    </display:column>  
                                                                                </axis:visible>
                                                                            </display:table>
                                                                        </div>
                                                                   </td>
                                                                 </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="CFRAUDE">
                                            <td class="campocaja">
                                              
                                              <select name = "CFRAUDE" id="CFRAUDE" style="width:160px;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin032" lit="1000348"/> - </option>
                                                            <c:forEach var="meddec" items="${lsfraudes}">
                                                                <option value = "${meddec.CATRIBU}"
                                                                    <c:if test="${meddec.CATRIBU == __formdata.CFRAUDE}">selected</c:if>>
                                                                    ${meddec.TATRIBU}
                                                                </option>
                                                            </c:forEach>
                                                </select>
                                                <axis:visible f="axissin032" c="DET_FRAUDE"> 
                                                <div style="position:absolute">
                                                            <a href="javascript:f_detalle_fraude();" ><img  border="0" alt="<axis:alt f="axissin032" c="DET_FRAUDE" lit="9903634"/>" title="<axis:alt f="axissin032" c="DET_FRAUDE" lit="9903634"/>" src="images/mas.gif"/> </a>
                                                </div>
                                                </axis:visible>
                                            </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="CCARPETA">
                                                <td class="campocaja">
                                                    <input type="checkbox" id="CCARPETA" name="CCARPETA"  value="${__formdata.CCARPETA}" onclick="f_onclickCheckbox(this)" 
                                                    <c:if test="${__formdata.CCARPETA == 1}">checked</c:if>
                                                    <axis:atr f="axissin006" c="CCARPETA" a="modificable=true"/> />
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="ASISTENCIA">
                                                <td class="campocaja">
                                                    <input type="checkbox" id="ASISTENCIA" name="ASISTENCIA"  value="${__formdata.ASISTENCIA}" onclick="f_onclickCheckbox(this)" 
                                                    <c:if test="${__formdata.ASISTENCIA == 1}">checked</c:if>
                                                    <axis:atr f="axissin032" c="ASISTENCIA" a="modificable=true&isInputText=false"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- ini bug 0024675 -->
                                            <axis:visible f="axissin032" c="CSALVAM">
                                                <td class="campocaja">
                                                    <input type="checkbox" id="CSALVAM" name="CSALVAM"  value="${__formdata.CSALVAM}" onclick="f_onclickCheckbox(this)" 
                                                    <c:if test="${__formdata.CSALVAM == 1}">checked</c:if>
                                                    <axis:atr f="axissin032" c="CSALVAM" a="modificable=true"/> />
                                                </td>
                                            </axis:visible>
                                            <!-- fin bug 0024675 -->                                               
                                            
                                        </tr>
                                        <axis:visible c="CTIPDEC" f="axissin032">   
                                         <tr>
                                            <td align="left" colspan="5">
                                           <b class="campocaja"><axis:alt f="axissin032" c="CTIPDEC" lit="9901032" /></b>
                                    <table class="seccion" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                       
                                            
                                <tr>
                                <axis:ocultar c="CMEDDEC" f="axissin032" dejarHueco="false">                           
                                <!-- Medio Declaración -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="CMEDDEC" lit="9000975" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <!-- Tipo Declarante -->
                                <axis:ocultar c="CTIPDEC" f="axissin032" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TIPO_DECLARANTE" lit="9001163" /></b>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                    
                                <!-- Medio Declaración -->
                                <axis:ocultar c="CMEDDEC" f="axissin032" dejarHueco="false">
                                <td class="campocaja">
                                    <select tabindex="21" name = "CMEDDEC" id="CMEDDEC" style="width:200px;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>
                                                <c:forEach var="meddec" items="${__formdata.listValores.lstmediodec}">
                                                    <option value = "${meddec.CATRIBU}"
                                                        <c:if test="${meddec.CATRIBU == __formdata.CMEDDEC}">selected</c:if>>
                                                        ${meddec.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Tipo Declarante -->
                                <axis:ocultar c="CTIPDEC" f="axissin032" dejarHueco="false">
                                <td class="campocaja">
                                    <select tabindex="22" name = "CTIPDEC" id="CTIPDEC" style="width:200px;"  size="1" onchange="f_cargar_declarante()" class="campowidthselect campo campotexto" <axis:atr f="axissin032" c="CTIPDEC" a="modificable=true&isInputText=true"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>
                                                <c:forEach var="tipdec" items="${__formdata.listValores.lsttipodec}">
                                                    <option value = "${tipdec.CATRIBU}"
                                                        <c:if test="${tipdec.CATRIBU == __formdata.CTIPDEC}">selected</c:if>>
                                                        ${tipdec.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>   
                                </axis:ocultar>
                            </tr>
                             <c:if test="${__formdata.CTIPDEC == 0}">
                                 <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <b><axis:alt f="axissin032" c="PRENADORS" lit="1000181"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                        <select tabindex="23" name = "SPERSONDEC" id="SPERSONDEC" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                            <c:if test="${fn:length(__formdata.T_IAX_TOMADORES) != 1}">
                                                   <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>                                          
                                                    <c:forEach items="${__formdata.T_IAX_TOMADORES}" var="miListaId">
                                                        <option value = "${miListaId.OB_IAX_TOMADORES.SPERSON}" <c:if test="${miListaId.OB_IAX_TOMADORES.SPERSON == __formdata.SPERSONDEC}">selected</c:if>>
                                                            ${miListaId.OB_IAX_TOMADORES.NNUMIDE} - ${miListaId.OB_IAX_TOMADORES.TNOMBRE} ${miListaId.OB_IAX_TOMADORES.TAPELLI1} ${miListaId.OB_IAX_TOMADORES.TAPELLI2}
                                                        </option>
                                                    </c:forEach>
                                            </c:if>
                                            <c:if test="${fn:length(__formdata.T_IAX_TOMADORES) == 1}">
                                                        <option value = "${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.SPERSON}"  selected>
                                                            ${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.NNUMIDE} - ${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.TNOMBRE} ${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.TAPELLI1} ${__formdata.T_IAX_TOMADORES[0].OB_IAX_TOMADORES.TAPELLI2}
                                                        </option>
                                            </c:if>

                                        </select>
                                    </td>
                                </tr>
                             </c:if>

                             <c:if test="${__formdata.CTIPDEC == 2 || __formdata.CTIPDEC == 1}">
                            
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                    <c:choose>
                                        <c:when test="${__formdata.CTIPDEC == 2}">
                                             <b><axis:alt f="axissin032" c="TIT_SPERSONDEC" lit="9001271"/></b>
                                        </c:when>
                                        <c:when test="${__formdata.CTIPDEC == 1}">
                                             <b><axis:alt f="axissin032" c="TIT_SPERSONDEC_1" lit="108228"/></b>
                                        </c:when>
                                    </c:choose>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     <select tabindex="24" name = "SPERSONDEC" id="SPERSONDEC" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                                                                           
                                                        <c:if test="${fn:length(__formdata.T_IAX_ASEGURADOS) != 1}">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>                                          
                                                                <c:forEach items="${__formdata.T_IAX_ASEGURADOS}" var="miListaId">
                                                                   <option value = "${miListaId.OB_IAX_ASEGURADOS.SPERSON}"
                                                                    <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.SPERSONDEC}">selected</c:if>>
                                                                    ${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}
                                                            </option>
                                                                </c:forEach>
                                                        </c:if>
                                                        <c:if test="${fn:length(__formdata.T_IAX_ASEGURADOS) == 1}">
                                                                    <option value = "${__formdata.T_IAX_ASEGURADOS[0].T_IAX_ASEGURADOS.SPERSON}"  selected>
                                                                        ${__formdata.T_IAX_ASEGURADOS[0].OB_IAX_ASEGURADOS.NNUMIDE} - ${__formdata.T_IAX_ASEGURADOS[0].OB_IAX_ASEGURADOS.TNOMBRE} ${__formdata.T_IAX_ASEGURADOS[0].OB_IAX_ASEGURADOS.TAPELLI1} ${__formdata.T_IAX_ASEGURADOS[0].OB_IAX_ASEGURADOS.TAPELLI2}
                                                                    </option>
                                                        </c:if>
                                                        
                                                        
                                                        
                                                        
                                            </select>
                                            </td>
                                </tr>
                              </c:if>  
                             <c:if test="${__formdata.CTIPDEC == 3}">
                             <tr>
                                    <td class="titulocaja" colspan="2"> 
                                             <b><axis:alt f="axissin032" c="CONDUCTORES" lit="9001186"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="2">
                                     <select tabindex="25" name = "SPERSONDEC" id="SPERSONDEC" style="width:100%;"  size="1" onchange="" class="campowidthselect campo campotexto" >
                                                       <c:if test="${fn:length(__formdata.T_IAX_CONDUCTORES) != 1}">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>                                          
                                                                <c:forEach items="${__formdata.T_IAX_CONDUCTORES}" var="miListaId">
                                                                   <option value = "${miListaId.OB_IAX_ASEGURADOS.SPERSON}"
                                                                    <c:if test="${miListaId.OB_IAX_ASEGURADOS.SPERSON == __formdata.SPERSONDEC}">selected</c:if>>
                                                                    ${miListaId.OB_IAX_ASEGURADOS.NNUMIDE} - ${miListaId.OB_IAX_ASEGURADOS.TNOMBRE} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI1} ${miListaId.OB_IAX_ASEGURADOS.TAPELLI2}
                                                            </option>
                                                                </c:forEach>
                                                        </c:if>
                                                        <c:if test="${fn:length(__formdata.T_IAX_CONDUCTORES) == 1}">
                                                                    <option value = "${__formdata.T_IAX_CONDUCTORES[0].OB_IAX_ASEGURADOS.SPERSON}"  selected>
                                                                        ${__formdata.T_IAX_CONDUCTORES[0].OB_IAX_ASEGURADOS.NNUMIDE} - ${__formdata.T_IAX_CONDUCTORES[0].OB_IAX_ASEGURADOS.TNOMBRE} ${__formdata.T_IAX_CONDUCTORES[0].OB_IAX_ASEGURADOS.TAPELLI1} ${__formdata.T_IAX_CONDUCTORES[0].OB_IAX_ASEGURADOS.TAPELLI2}
                                                                    </option>
                                                        </c:if>
                                            </select>
                                            </td>
                                </tr>
                             </c:if>  
                            <c:if test="${__formdata.CTIPDEC >= 4}">
                            <axis:ocultar c="TDECLARANTE" f="axissin032" dejarHueco="false">
                            
                            <tr>
                            <td class="titulocaja">
                            <input type="hidden" id="SPERSONDEC" name="SPERSONDEC" value="${__formdata.SPERSONDEC}">
                                  <b><axis:alt f="axissin032" c="SPERSONDEC" lit="102844"/></b>
                                </td>
                            <!-- NNUMIDE -->
                                <td class="titulocaja">
                                <axis:visible f="axissin032" c="NNUMIDE">
                                    <b><axis:alt f="axissin032" c="NNUMIDE" lit="102999" /></b>
                                </axis:visible>
                                </td>  
                                </tr>
                                <tr>
                                
                                   <td class="campocaja">
                                <c:choose>
                                    <c:when test="${__formdata.CTIPDEC == 4}">
                                    <select tabindex="26" name="CTIPIDEDEC" id="CTIPIDEDEC" onchange=""  size="1" title="<axis:alt f="axissin032" c="CTIPIDEDEC" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                        <axis:atr f="axisper010" c="CTIPIDEDEC" a="isInputText=false&modificable=false"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDEDEC}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    </c:when>
                                    <c:otherwise>
                                    <select tabindex="26" name="CTIPIDEDEC" id="CTIPIDEDEC" onchange=""  size="1" title="<axis:alt f="axissin032" c="CTIPIDEDEC" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                            <axis:atr f="axisper010" c="CTIPIDEDEC" a="isInputText=false&modificable=true"/>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SV" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CTIPIDEDEC}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:otherwise>
                                </c:choose>
                                
                                    </td>
                             <td class="campocaja">
                                <axis:visible f="axissin032" c="NNUMIDE">
                                    <c:choose>
                                        <c:when test="${__formdata.CTIPDEC == 4}">
                                            <input tabindex="27"  type="text" class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                            id="NNUMIDEDEC" name="NNUMIDEDEC" size="15"  value="${__formdata.NNUMIDEDEC}"
                                            <axis:atr f="axisper010" c="CTIPIDEDEC" a="modificable=false"/>/>
                                        </c:when>
                                        <c:otherwise>
                                            <input tabindex="27"  type="text" class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" 
                                            id="NNUMIDEDEC" name="NNUMIDEDEC" size="15"  value="${__formdata.NNUMIDEDEC}"/>
                                        </c:otherwise>
                                    </c:choose>
                                </axis:visible>
                                </td>  
                                
                                <td class="campocaja">
                                <img tabindex="28"  id="BUSCAR_PER" border="0" title="<axis:alt f="axissin032" c="BUSCAR_PER" lit="9904600"/>" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                               
                                <img tabindex="29"  id="BORRAR_PER" border="0" title="<axis:alt f="axissin032" c="BORRAR_PER" lit="9904601"/>" src="images/update.gif" onclick="f_actualizar_campos(1)" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                                <%--
                                <img tabindex="30" border="0" src="images/new.gif" onclick="f_alta_persona()" style="cursor:pointer"/>
                                &nbsp;&nbsp; --%>
                                
                                <img tabindex="31" border="0" id="INFO_PERSONA" name="INFO_PERSONA" src="images/informacion.gif" onclick="f_consulta_persona()" style="cursor:pointer"/>
                                &nbsp;&nbsp;
                                
                                </td>
                            </tr>
                            <tr>
                                <!-- Nombre -->
                                 
                                  <axis:visible f="axissin032" c="TNOMDEC">
                                  	<td class="titulocaja"> 
                                    <b><axis:alt f="axissin032" c="TNOMDEC" lit="105940" /></b>
                                     </td>	
                                  </axis:visible>
                               
                                <!-- Nombre 1-->
                                
                                  <axis:visible f="axissin032" c="TNOM1DEC">
                                  	 <td class="titulocaja"> 
                                    <b><axis:alt f="axissin032" c="TNOM1DEC" lit="105940" /></b>
                                    	 </td>
                                  </axis:visible>
                                 <!-- Nombre2 -->
                              
                                   <axis:visible f="axissin032" c="TNOM2DEC">
                                      <td class="titulocaja"> 
																			<b><axis:alt f="axissin032" c="TNOM2DEC" lit="9902260" /></b>
										 								</td>
                                  </axis:visible>
                               
                                <!-- 1r Apellido -->
                               
                                <axis:visible f="axissin032" c="TAPE1DEC">
                                	 <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TAPE1DEC" lit="108243" /></b>
                                     </td>	
                                </axis:visible>
                               
                                <!-- 2n Apellido -->
                                
                                <axis:visible f="axissin032" c="TAPE2DEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TAPE2DEC" lit="108246" /></b>
                                      </td>	
                                </axis:visible>
                              
                                 <!-- Telefono -->
                                
                                <axis:visible f="axissin032" c="TTELDEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TTELDEC" lit="9000992" /></b>
                                   </td> 	
                                </axis:visible>
                                </tr>
               
                            <tr>
                                <!-- Nombre -->
                                
                                <axis:visible f="axissin032" c="TNOMDEC">
                                	<td class="campocaja">
                                    <input tabindex="32"  type="text" class="campowidthinput campo campotexto" id="TNOMDEC" name="TNOMDEC" 
                                    <axis:atr f="axissin032" c="TNOMDEC" a="obligatorio=false"/>
                                    size="7"  value="${__formdata.TNOMDEC}"/>
                                             </td>
                                </axis:visible>
                       
                                 <!-- Nombre 1 -->
                               
                                <axis:visible f="axissin032" c="TNOM1DEC">
                                	 <td class="campocaja">
                                    <input tabindex="32"  type="text" class="campowidthinput campo campotexto" id="TNOM1DEC" name="TNOM1DEC" 
                                    <axis:atr f="axissin032" c="TNOM1DEC" a="obligatorio=false"/>
                                    size="7"  value="${__formdata.TNOM1DEC}"/>
                                    </td>
                                </axis:visible>
                                
                                   <!-- Nombre 2-->
                               
                                <axis:visible f="axissin032" c="TNOM2DEC">
                                	 <td class="campocaja">
                                    <input tabindex="33"  type="text" 
                                    class="campowidthinput campo campotexto" id="TNOM2DEC" name="TNOM2DEC" 
                                    <axis:atr f="axissin032" c="TNOM2DEC" a="obligatorio=false"/>
                                    size="7"  value="${__formdata.TNOM2DEC}"/>
                                      </td>
                                </axis:visible>
                              
                                <!-- 1r Apellido -->
                              
                                <axis:visible f="axissin032" c="TAPE1DEC">
                                	  <td class="campocaja">
                                    <input  tabindex="34" type="text" class="campowidthinput campo campotexto" id="TAPE1DEC" name="TAPE1DEC" 
                                     <axis:atr f="axissin032" c="TAPE1DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TAPE1DEC}"/>
                                    </td>
                                </axis:visible>
                                
                                <!-- 2n Apellido -->
                               
                                <axis:visible f="axissin032" c="TAPE2DEC">
                                	 <td class="campocaja">
                                    <input  tabindex="35" type="text" class="campowidthinput campo campotexto" id="TAPE2DEC" name="TAPE2DEC"
                                      <axis:atr f="axissin032" c="TAPE2DEC" a="obligatorio=false"/>
                                    size="10"  value="${__formdata.TAPE2DEC}"/>
                                    </td> 
                                </axis:visible>
                                
                                <!-- Telefono -->
                                
                                <axis:visible f="axissin032" c="TTELDEC">
                                	<td class="campocaja">
                                    <input  tabindex="35" type="text" class="campowidthinput campo campotexto" id="TTELDEC" name="TTELDEC"
                                   <axis:atr f="axissin032" c="TTELDEC" a="obligatorio=false"/>
                                    size="8"  value="${__formdata.TTELDEC}"/>
                                     </td> 
                                </axis:visible>
                                  
                            </tr>
               
                         
                             <tr>   
                                </td>  
                                 <!-- Telefono movil-->
                               
                                <axis:visible f="axissin032" c="TMOVILDEC">
                                	 <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TMOVILDEC" lit="9903007" /></b>
                                    </td> 	
                                </axis:visible>
                                
                                   <!-- email -->
                                
                                <axis:visible f="axissin032" c="TEMAILDEC">
                                	<td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TEMAILDEC" lit="109792" /></b>
                                    	 </td>  
                                </axis:visible>
                                       
                                
                            </tr>
                              <tr>
                                <!-- Telefono mov-->
                              
                                                          
                                <axis:visible f="axissin032" c="TMOVILDEC">
                                	  <td class="campocaja">
                                    <input  tabindex="36" type="text" class="campowidthinput campo campotexto" id="TMOVILDEC" name="TMOVILDEC"
                                    <axis:atr f="axissin032" c="TMOVILDEC" a="obligatorio=false"/>
                                    size="8"  value="${__formdata.TMOVILDEC}"/>
                                     </td> 
                                </axis:visible>
                               
                                
                                   <!-- email -->
                                
                                <axis:visible f="axissin032" c="TEMAILDEC">
                                	<td class="campocaja">
                                    <input  tabindex="37" type="text" class="campowidthinput campo campotexto" id="TEMAILDEC" name="TEMAILDEC" 
                                     <axis:atr f="axissin032" c="TEMAILDEC" a="obligatorio=false"/>
                                    size="15"  value="${__formdata.TEMAILDEC}"/>
                                    </td>  
                                </axis:visible>
                                
                            </tr>   
                            
                            </axis:ocultar>
                            </c:if>
                            </tr>
                                </table>
                                </td>
                                </tr>
                              </axis:visible>
                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>                              
                                </tr> 
                             <axis:visible f="axissin032" c="TZONAOCU">
                                <tr>
                                     <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="TZONAOCU" lit="110492" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5"  class="campocaja">
                                        <textarea  tabindex="38" class="campo campotexto" style="width:100%;" maxlength="100" name="TZONAOCU" id="TZONAOCU" <axis:atr f="axissin032" c="TZONAOCU" a="obligatorio=true"/> title="<axis:alt f="axissin032" c="TZONAOCU" lit="110492" />" onkeyup="f_val_longitud_campo(this, 100)">${__formdata.TZONAOCU}</textarea>
                                    </td>
                                </tr>
                            </axis:visible>
                          
                           <axis:visible f="axissin032" c="TZONAOCUDIREC">
                           <c:import url="axissin032_body_b.jsp"/>
                           </axis:visible>
                           
                            <tr>
                            <axis:visible f="axissin032" c="NSINCIA">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="NSINCIA" lit="9901399" /></b>
                                  </td>
                            </axis:visible>
                            <axis:visible f="axissin032" c="CCOMPANI">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="CCOMPANI" lit="9000600" /></b>
                                  </td>
                            </axis:visible>
                            <axis:visible f="axissin032" c="CPOLCIA">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="CPOLCIA" lit="9001766" /></b>
                                  </td>
                            </axis:visible>
                            </tr>
                            <tr>
                            <axis:visible f="axissin032" c="NSINCIA">
                                  <td class="campocaja">
                                        <input  tabindex="39" type="text" class="campowidthinput campo campotexto" id="NSINCIA" name="NSINCIA" 
                                        <axis:atr f="axissin032" c="NSINCIA" a="modificable=true"/> size="15"  value="${__formdata.NSINCIA}"/>
                                  </td>
                            </axis:visible>
                            <axis:visible f="axissin032" c="CCOMPANI">
                                  <td class="campocaja">
                                        <select name="CCOMPANI" id ="CCOMPANI" size="1" class="campowidthselect campo campotexto" onchange="" style="width:180px">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="COMBO_SVN" lit="1000348"/> - </option>
                                            <c:forEach var="CIA" items="${__formdata.CIAS}">
                                                <option value="${CIA.CCOMPANI}"
                                                <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                                ${CIA.TCOMPANI}
                                                </option>
                                    </c:forEach>
                                </select>
                                  </td>
                            </axis:visible>
                            <axis:visible f="axissin032" c="CPOLCIA">
                                  <td class="campocaja">
                                         <input  tabindex="38" type="text" class="campowidthinput campo campotexto" id="CPOLCIA" name="CPOLCIA"
                                         <axis:atr f="axissin032" c="CPOLCIA" a="modificable=true"/>size="15"  value="${__formdata.CPOLCIA}"/>
                                  </td>
                            </axis:visible>
                            </tr>
                            <tr>
                            <axis:visible f="axissin032" c="NPRESIN">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="NPRESIN" lit="9901400" /></b>
                                  </td>
                            </axis:visible>
                            </tr>
                            <tr>
                            <!-- bug 24774 formato antes campotexto -->
                            <axis:visible f="axissin032" c="NPRESIN">
                                  <td class="titulocaja">
                                        <input  tabindex="40" type="text" class="campowidthinput campo campotexto" id="NPRESIN" name="NPRESIN" 
                                        <axis:atr f="axissin032" c="NPRESIN" a="modificable=true"/> size="15"  value="${__formdata.NPRESIN}"/>
                                  </td>
                            </axis:visible>
                            </tr>
                            <axis:visible f="axissin032" c="TSINIES">
                                <tr>
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="TSINIES" lit="1000112" /></b>
                                  </td>
                                </tr>
                                <tr>
                                  <td colspan="5" class="campocaja">
                                        <textarea tabindex="38" class="campo campotexto" onblur="f_ponerFocus('TSINIES');" style="width:100%;" name="TSINIES" id="TSINIES" maxlength="3000" onkeyup="f_val_longitud_campo(this, 3000)" onkeydown=" if(this.value.length>= 2000 && event.keyCode != 8 && event.keyCode != 46){return false;}" <axis:atr f="axissin032" c="TSINIES" a="obligatorio=true"/> title="<axis:alt f="axissin032" c="TSINIES" lit="1000112" />">${__formdata.TSINIES}</textarea>
                                  </td>
                                </tr>  
                            </axis:visible>  
                            <axis:visible c="DSP_ASEGURADO_INNOMINADO" f="axissin032">   
                                <tr id="DSP_ASEGURADO_INNOMINADO">
                                    <td align="left" colspan="5">
                                        <b class="campocaja"><axis:alt f="axissin032" c="CTIPDEC" lit="9906698" /></b>
                                        <table class="seccion" align="center">
                                            <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="TTIPIDEASEG_IN" lit="109774"/></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="NNUMIDEASEG_IN" lit="105330"/></b>
                                                </td>
                                                <td class="titulocaja" c="FNACIMIASEG_IN">
                                                    <b id="label_FNACIMIASEG_IN"><axis:alt f="axissin032" c="FNACIMIASEG_IN" lit="1000064"/></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="campocaja">
                                                  <input type="text" name="TTIPIDEASEG_IN"
                                                         value="${__formdata.TTIPIDEASEG_IN}"
                                                         class="campowidthinput campo campotexto"
                                                         style="width:90%"
                                                         <axis:atr f="axissin032" c="TTIPIDEASEG_IN" a="modificable=false"/>/>
                                                </td>
                                                <td class="campocaja">
                                                <axis:visible f="axissin032" c="NNUMIDEASEG_IN">
                                                    <input tabindex="27"  type="text" class="campowidthinput campo campotexto" style="width:88%" onchange="f_valida_aseg_in(this.value)" 
                                                           id="NNUMIDEASEG_IN" name="NNUMIDEASEG_IN" size="15"  value="${__formdata.NNUMIDEASEG_IN}"
                                                           <axis:atr f="axisper010" c="NNUMIDEASEG_IN" a="modificable=false"/>/>
                                                    <input type="hidden" id="SPERSONASEG_IN" name="SPERSONASEG_IN" value="${__formdata.SPERSONASEG_IN}">
                                                    <input type="hidden" id="CTIPIDEASEG_IN" name="CTIPIDEASEG_IN" value="${__formdata.CTIPIDEASEG_IN}">
                                                    <img tabindex="28"  id="BUSCAR_PER" border="0" title="<axis:alt f="axissin032" c="BUSCAR_PER" lit="9904600"/>" src="images/find.gif" onclick="f_abrir_axisper021_aseg_in()" style="cursor:pointer"/>
                                                    <input type="hidden" id="BUSQUEDA_ASEG_IN" name="BUSQUEDA_ASEG_IN" value="0">
                                                </axis:visible>
                                                </td>  
                                                <axis:ocultar c="FNACIMIASEG_IN" f="axissin032" dejarHueco="false">
                                                    <td class="campocaja" id="td_FNACIMIASEG_IN">
                                                        <input type="text" name="FNACIMIASEG_IN"
                                                               id="FNACIMIASEG_IN"
                                                               value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMIASEG_IN}"/>'
                                                               class="campowidthinput campo campotexto"
                                                               style="width:70%"
                                                               <axis:atr f="axissin032" c="FNACIMIASEG_IN" a="modificable=false&formato=fecha"/>
                                                               title='<axis:alt f="axissin032" c="FNACIMIASEG_IN_ALT" lit="100959"/>'/>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <!-- Nombre 1-->
                                                <axis:visible f="axissin032" c="TNOM1ASEG_IN">
                                                    <td class="titulocaja"> 
                                                        <b><axis:alt f="axissin032" c="TNOM1ASEG_IN" lit="105940" /></b>
                                                    </td>
                                                </axis:visible>
                                                <!-- Nombre2 -->
                                                <axis:visible f="axissin032" c="TNOM2ASEG_IN">
                                                    <td class="titulocaja"> 
                                                        <b><axis:alt f="axissin032" c="TNOM2ASEG_IN" lit="9902260" /></b>
                                                    </td>
                                                </axis:visible>
                                                <!-- 1r Apellido -->
                                                <axis:visible f="axissin032" c="TAPE1ASEG_IN">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="TAPE1ASEG_IN" lit="108243" /></b>
                                                    </td>	
                                                </axis:visible>
                                                <!-- 2n Apellido -->
                                                <axis:visible f="axissin032" c="TAPE2ASEG_IN">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="TAPE2ASEG_IN" lit="108246" /></b>
                                                    </td>	
                                                </axis:visible>
                                            </tr>
                                            <tr>
                                                <!-- Nombre 1 -->
                                                <axis:visible f="axissin032" c="TNOM1ASEG_IN">
                                                    <td class="campocaja">
                                                        <input tabindex="32"  type="text" class="campowidthinput campo campotexto" id="TNOM1ASEG_IN" name="TNOM1ASEG_IN" 
                                                        <axis:atr f="axissin032" c="TNOM1ASEG_IN" a="obligatorio=false&modificable=false"/>
                                                        size="7"  value="${__formdata.TNOM1ASEG_IN}"/>
                                                    </td>
                                                </axis:visible>
                                                <!-- Nombre 2-->
                                                <axis:visible f="axissin032" c="TNOM2ASEG_IN">
                                                    <td class="campocaja">
                                                        <input tabindex="33"  type="text" 
                                                        class="campowidthinput campo campotexto" id="TNOM2ASEG_IN" name="TNOM2ASEG_IN" 
                                                        <axis:atr f="axissin032" c="TNOM2ASEG_IN" a="obligatorio=false&modificable=false"/>
                                                        size="7"  value="${__formdata.TNOM2ASEG_IN}"/>
                                                    </td>
                                                </axis:visible>
                                                <!-- 1r Apellido -->
                                                <axis:visible f="axissin032" c="TAPE1ASEG_IN">
                                                    <td class="campocaja">
                                                        <input  tabindex="34" type="text" class="campowidthinput campo campotexto" id="TAPE1ASEG_IN" name="TAPE1ASEG_IN" 
                                                         <axis:atr f="axissin032" c="TAPE1ASEG_IN" a="obligatorio=false&modificable=false"/>
                                                        size="10"  value="${__formdata.TAPE1ASEG_IN}"/>
                                                    </td>
                                                </axis:visible>
                                                <!-- 2n Apellido -->
                                                <axis:visible f="axissin032" c="TAPE2ASEG_IN">
                                                    <td class="campocaja">
                                                        <input  tabindex="35" type="text" class="campowidthinput campo campotexto" id="TAPE2ASEG_IN" name="TAPE2ASEG_IN"
                                                          <axis:atr f="axissin032" c="TAPE2ASEG_IN" a="obligatorio=false&modificable=false"/>
                                                        size="10"  value="${__formdata.TAPE2ASEG_IN}"/>
                                                    </td> 
                                                </axis:visible>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </axis:visible>
                            <axis:visible f="axissin032" c="SINIES_PRESTACIONES">
                                <tr>
                                  <axis:visible f="axissin032" c="CNIVEL">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="NIVELLSINISTRE" lit="9901374" /></b>
                                  </td>
                                  </axis:visible>
                            <axis:visible f="axissin032" c="SPERSON2">
                                  <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin032" c="SPERSON2_" lit="9901375" /></b>
                                  </td>
                                  </axis:visible>
                                  
                                  <axis:visible f="axissin032" c="FECHAPP">
                                  <td class="titulocaja">
                                        <b><axis:alt f="axissin032" c="FECHAPP" lit="9901534" /></b>
                                  </td>
                                  </axis:visible>
                                <tr>
                                </tr>
                                <axis:visible f="axissin032" c="CNIVEL">
                                  <td  class="campocaja">
                                        <select name="CNIVEL" id="CNIVEL" onchange="f_validar_nivel(); f_cargar_personas();"  size="1" title="<axis:alt f="axissin032" c="CNIVEL" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                        <axis:atr f="axisper010" c="NIVSINIES" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="nivSinies" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.nivSinies}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CNIVEL}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                        </select>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin032" c="SPERSON2">
                                  <td  class="campocaja" colspan="2">
                                        <select name="SPERSON2" id="SPERSON2"  size="1" title="<axis:alt f="axissin032" c="SPERSON2" lit="109774"/>" class="campowidthselect campo campotexto"  style="width:100%;"
                                        <axis:atr f="axissin032" c="SPERSON2" a="isInputText=false&modificable=true"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="lstPersRen" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${sessionScope.lstPersRen}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.SPERSON2}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                        </select>
                                  </td>
                                </axis:visible>
                                <axis:visible f="axissin032" c="FECHAPP">
                                <td class="campocaja">  
                                     <input style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FECHAPP" name="FECHAPP" size="15"  title="<axis:alt f='axissin032' c='FECHAPP' lit='9901534' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FECHAPP']}"/>" <axis:atr f="axissin032" c="FECHAPP" a="modificable=true&obligatorio=false&formato=fecha"/> 
                                                        onchange="f_calcula_dias()"/>
                                                        <a style="vertical-align:middle;"><img id="icon_FECHAPP" alt="<axis:alt f="axissin032" c="icon_FECHAPP" lit="9901534"/>" title="<axis:alt f="axissin032" c="icon_FECHAPP" lit="9901534" />" src="images/calendar.gif"/></a>
                                </td>
                                </axis:visible>  
                                </tr>  
                            </axis:visible>
                            
                            
                            
                          <!-- ZONA PRESTACIONES -->  
                          </table>
                          <div class="separador">&nbsp;</div>
                         </td>
                        </tr>
                       </table>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="flecha" lit="153053" /></div>
                        <!--campos-->
                        <table class="seccion">
                             <tr>
                                    <td align="left" >
                                      <table class="area" align="center" tabindex="38">
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <tr>
                                            <axis:visible f="axissin032" c="IPERIT">
                                              <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="IPERIT" lit="9000904" /></b>
                                              </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axissin032" c="IPERIT">
                                              <td class="campocaja">
                                                    <input  tabindex="39" type="text" onchange="f_actualizar_imp(this)" class="campowidthinput campo dspNumber" id="IPERIT" name="IPERIT" title="<axis:alt f="axissin032" c="IPERIT" lit="9000904"/>"
                                                    <axis:atr f="axissin032" c="IPERIT" a="modificable=true&formato=decimal"/> size="15"  
                                                        value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPERIT}'/>"/>
                                              </td>
                                            </axis:visible>
                                        </tr>
                                        <tr>
                                            <td align="left" class="campocaja" colspan="3">
                                                <axis:visible f="axissin032" c="DSP_GARANTIAS">
                                                <c:set var="title0">&nbsp;</c:set>
                                                <c:set var="title1"><axis:alt f="axissin032" c="TGARANT" lit="100588"/></c:set>
                                                <c:set var="title2"><axis:alt f="axissin032" c="ICAPITAL" lit="1000073"/></c:set>
                                                
                                                <div class="displayspace" style="border: solid 0;" >                         
   
                                                
                                                    <display:table name="${sessionScope.T_IAX_GARANTIAS}" id="miListaId3" export="false"  class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="width:98.5%;border:1px" 
                                                     requestURI="axis_axissin032.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" sortable="false" sortProperty="radioGarant" headerClass="headwidth5 sortable fixed"  media="html" autolink="false"  >
                                                            <div class="dspIcons"><input onClick="f_tipogarant(this)" value="${miListaId3.CGARANT}" type="checkbox" id="radioGarant" name="radioGarant"
                                                            <c:if test="${miListaId3.SELECTEDGARANTIA}"> checked </c:if>/></div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="true" sortProperty="TGARANT" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaId3.TGARANT}</div>
                                                        </display:column>
                                                        <axis:visible f="axissin032" c="ICAPITAL">
                                                            <display:column title="${title2}" sortable="true" sortProperty="ICAPITAL" headerClass="headwidth20 sortable fixed"  media="html" autolink="false">
                                                                <div  class="dspNumber" style="padding-right:20px;"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId3.ICAPITAL}"/></div>
                                                            </display:column>  
                                                        </axis:visible>
                                                    </display:table>
                                                </div>
                                                </axis:visible>
                                           </td>
                                         </tr>
                                         <tr>    
                                            <axis:visible c="FINIBAJA" f="axissin032">
                                                <td class="titulocaja" id="TINIBAJA">
                                                     <b id="label_FRESINI"><axis:alt f="axissin032" c="TINIBAJA" lit="100890"/></b><!-- F.Inicio -->
                                                </td>
                                            </axis:visible>
                                            <td class="titulocaja" id="TFINBAJA">
                                                 <b id="label_FRESFIN"><axis:alt f="axissin032" c="TFINBAJA" lit="9001159"/></b><!-- F.Fin -->
                                            </td>
                                                                                              
                                            <td class="titulocaja" id="TDIA">
                                                 <b id="label_DIAS"><axis:alt f="axissin032" c="TDIA" lit="9900972"/></b><!-- F.Fin -->
                                            </td>
                                        </tr>
                                                <!-- F.Fin -->
                                        <tr>   
                                            <axis:visible c="FINIBAJA" f="axissin032">
                                                <td class="campocaja" id="INIBAJA">
                                                        <input tabindex="39" style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FINIBAJA" name="FINIBAJA" size="15"  title="<axis:alt f='axissin032' c='FINIBAJA' lit='100890' />" 
                                                            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FINIBAJA']}"/>" <axis:atr f="axissin032" c="FINIBAJA" a="modificable=true&obligatorio=true&formato=fecha"/> 
                                                            onchange="f_clclar_diasinib()"/>
                                                            <a style="vertical-align:middle;"><img id="icon_FINIBAJA" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="icon_FINIBAJA" lit="100890" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:visible>
                                            <td class="campocaja" id="FINBAJA">
                                                    <input tabindex="39" style="width:40%;" type="text" class="campowidthinput campo campotexto" id="FFINBAJA" name="FFINBAJA" size="15"  title="<axis:alt f='axissin032' c='FFINBAJA' lit='9001159' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${FFINBAJA}"/>" <axis:atr f="axissin032" c="FFINBAJA" a="modificable=true&obligatorio=true&formato=fecha"/> 
                                                        onchange="f_clclar_diasfinb()"/>
                                                        <a style="vertical-align:middle;"><img id="icon_FFINBAJA" alt="<axis:alt f="axissin032" c="SELECCIONAR" lit="108341"/>" title="<axis:alt f="axissin032" c="icon_FFINBAJA" lit="9001159" />" src="images/calendar.gif"/></a>
                                            </td>
                                             <td class="campocaja" id="DIA">
                                                    <input tabindex="40" type="text" name="DIAS" id="DIAS" value="${__formdata['DIAS']}" class="campowidthinput campo campotexto" style="width:20%"
                                                        <axis:atr f="axissin032" c="DIAS" a="modificable=true&obligatorio=false&formato=decimal"/>
                                                        onchange="f_calcula_ffin()"/>
                                            </td>
                                            <axis:visible c="NDIASBAJA" f="axissin032">
                                                <td class="campocaja" id="NDIABAJA">
                                                    <input tabindex="40" type="text" name="NDIASBAJA" id="NDIASBAJA" value="${__formdata['NDIASBAJA']}" class="campowidthinput campo campotexto" style="width:20%"
                                                        <axis:atr f="axissin032" c="NDIASBAJA" a="modificable=true&obligatorio=true&formato=decimal"/>
                                                        />
                                                </td>
                                            </axis:visible>
                                         </tr>
										  <!-- *****************PREGUNTAS****************** -->
                                         <c:import url="axissin032_body2.jsp"></c:import>
                                         <!-- FIN PREGUNTAS -->
                                       </table>
                                    </td>
                                </tr>
                        </table>


                        <!-- ini bug 0022153 -->
                        <%-- Documentos --%>
                        <axis:visible f="axissin032" c="DSP_DOCUMENTOS"> 
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin032" c="flecha" lit="9001358" /></div>
                        <tr>
                                    <td class="campocaja">
                                    <c:if test="${!empty __formdata.NSINIES}">
                                    <div style="float:right;" id="BT_SIN_NUEVO_TRAM_DOC">
                                            <axis:visible f="axissin032" c="BT_SIN_NUEVO_TRAM_DOC"> <!-- tramitaciones documentos -->
                                            <a href="javascript:f_abrir_modal('axissin026',null,'&isNew=yes&SPRODUC='+document.miForm.SPRODUC.value+
                                                    '&CACTIVI='+document.miForm.CACTIVI.value+
                                                    '&indexTramitacio=0'+
                                                    '&SSEGURO='+document.miForm.SSEGURO.value+
                                                    '&CAGENTE='+document.miForm.CAGENTE.value+
                                                    '&NSINIES='+document.miForm.NSINIES.value+
                                                    '&NTRAMIT=0'
                                                    );"><img border="0" alt="<axis:alt f="axissin032" c="BT_SIN_NUEVO_TRAM_DOC" lit="9001358"/>" title="<axis:alt f="axissin032" c="BT_SIN_NUEVO_TRAM_DOC" lit="9001358"/>" src="images/document.gif"/></a>
                                            </axis:visible>
                                    </c:if>         
                                    </div>
                                    </td>
                        </tr>
                        <tr id="documentos_children" >
                           <td align="left" colspan = "4">
                           <table class="seccion">
                            <tr>
                                <td class="titulocaja" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <c:set var="title0"><axis:alt f="axissin006" c="NDOCUME" lit="100899" /></c:set><!-- Num -->
                                    <c:set var="title1"><axis:alt f="axissin006" c="TDANO" lit="100588" /></c:set><!--Descripcion-->
                                    <c:set var="title2"><axis:alt f="axissin006" c="FRECLAMA" lit="9001355" /></c:set> <!-- D. Reclamació-->
                                    <c:set var="title3"><axis:alt f="axissin006" c="FRECIBE" lit="9000452" /></c:set> <!-- D. Recepció -->
                                    <c:set var="title4"><axis:alt f="axissin006" c="FCADUCA" lit="9001356" /></c:set> <!-- D. Caducitat -->
                                    <c:set var="title5"><axis:alt f="axissin006" c="COBLIGA" lit="112347" /></c:set>  <!-- Obligatori -->
                                    <c:set var="title6"><axis:alt f="axissin006" c="IDDOC" lit="9001357" /></c:set>  <!-- Doc. Gedox -->
                                    <c:set var="title7"><axis:alt f="axissin006" c="EDITAR" lit="100002" /></c:set><!--Editar-->
                                    <c:set var="title8"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                    <c:set var="title9"><axis:alt f="axissin006" c="ELIMINAR" lit="1000127" /></c:set><!--Eliminar-->
                                    <c:set var="title10"><axis:alt f="axissin006" c="TTITDOC_SECDOC" lit="105330" /></c:set><!--Eliminar-->

                                    <div class="displayspaceGrande">
                                    <display:table name="${__formdata.DOCUMENTOS}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="axis_axissin032.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>

                                                <display:column title="${title0}" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                     <div class="dspText">${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME}</div>    
                                                </display:column>
                                                <display:column title="${title10}" sortable="false" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.TTITDOC}</div>    
                                                </display:column>
                                                <display:column title="${title2}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECLAMA}"/></div>
                                                </display:column>                                                
                                                <display:column title="${title3}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.FRECIBE}"/></div>
                                                </display:column>                                                   
                                                <display:column title="${title4}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.FCADUCA}"/></div>
                                                </display:column>   
                                                <display:column title="${title5}" sortable="false" sortProperty="COBLIGA" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcons">  <input type="checkbox" disabled id="COBLIGA" name="COBLIGA" value="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.COBLIGA}" 
                                                    <c:if test="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.COBLIGA == '1'}">checked</c:if> ></div>    
                                                </display:column>                                                 
                                                <display:column title="${title6}" sortable="false" sortProperty="IDDOC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspIcons">  <input type="checkbox" disabled id="IDDOC" name="IDDOC" value="${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}" 
                                                    <c:if test="${!empty documento.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}">checked</c:if> ></div>    
                                                </display:column>                                                                                               
                                                <axis:visible f="axissin032" c="BT_SIN_EDITAR_TRAM_DOC"> <!--boton editar tram documentos -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <div class="dspIcons" id="BT_SIN_EDITAR_TRAM_DOC"><img border="0" alt="<axis:alt f="axissin032" c="BT_SIN_EDITAR_TRAM_DOC" lit="100002"/>" title1="<axis:alt f="axissin032" c="BT_SIN_EDITAR_TRAM_DOC" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" 
                                                    onclick="javascript:f_abrir_modal('axissin026',null,
                                                          '&isNew=no'+
                                                          '&indexTramitacio=0'+
                                                          '&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+
                                                          '&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT=0'+
                                                          '&NDOCUME='+${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.NDOCUME});"/>
                                                    </div>
                                                </display:column> 
                                                </axis:visible>
                                                <axis:visible f="axissin032" c="BT_SIN_PRINT_TRAM_DOC"> <!--boton editar tram documentos -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty documento.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}">
                                                    <div class="dspIcons"><img border="0"  src="images/file.gif" width="15px" height="15px"
                                                    style="cursor:pointer;" onclick="f_ver_doc('${documento.OB_IAX_SIN_TRAMI_DOCUMENTO.IDDOC}');"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>

                                    </display:table>
                                    </div>
                                    <script language="javascript">objUtiles.retocarDsptagtable("documento");</script>
                                </td> 
                            </tr>
                           </table>
                           </td>
                        </tr>   
                        </axis:visible>
                        <!-- fin bug 0022153 -->
                     
                    </td>
                </tr>
            </table>
            <!-- bug 0022444 -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin032</c:param><c:param name="f">axissin032</c:param>
            <c:param name="f">axissin032</c:param>
                <c:param name="__botones">salir,<axis:visible c="BT_CARTARECHAZO" f="axissin032">,9903767</axis:visible>,151477,100009</c:param>
            </c:import>
        
        </form>

        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_ocurrencia", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FDETECCION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_deteccion", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "popup_calendario_recepcion",  
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
            inputField     :    "FINIBAJA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FINIBAJA",  
            singleClick    :    true,
            firstDay       :    1
            });
            
            Calendar.setup({
            inputField     :    "FFINBAJA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FFINBAJA",  
            singleClick    :    true,
            firstDay       :    1
            });
           
             Calendar.setup({
            inputField     :    "FECHAPP",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FECHAPP",  
            singleClick    :    true,
            firstDay       :    1
            });
        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html> 
 
 
