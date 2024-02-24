<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="modoModificable" value="${true}"/>

                        
                        <axis:ocultar f="axisage007" c="DSP_SUBVENCION" dejarHueco="false">
                            <tr>
                                <td class="titulocaja" colspan = "4" id="td_DSP_SUBVENCION">
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage007" c="DSP_SUBVENCION" lit="9902546"/>
                                        </div>
                                    </div>                                                           
                                    </div>                                
                                    <%-- SUBVENCION --%>
                                    <c:set var="title0"><axis:alt f="axisage007" c="SPRODUC" lit="100829"/></c:set>  <%-- TPRODUC --%>
                                    <c:set var="title1"><axis:alt f="axisage007" c="CACTIVI" lit="103481"/></c:set>  <%-- TACTIVI --%>
                                    <c:set var="title2"><axis:alt f="axisage007" c="IIMPORTE" lit="100563"/></c:set>   <%-- IIMPORTE --%>
                                    <c:set var="title3"><axis:alt f="axisage007" c="ESTADO" lit="100587"/></c:set>
                                    <c:set var="title4"><axis:alt f="axisage007" c="NPLANPAGO" lit="9902547"/></c:set>
               
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.SUBVENCION}" id="SUBVENCION" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage007.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.TSPRODUC" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.TPRODUC}
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisage007" c="TACTIVI">
                                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.TACTIVI" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                        ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.TACTIVI}
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisage007" c="NPLANPAGO">
                                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.NPLANPAGO" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">
                                                        ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.NPLANPAGO}
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.IIMPORTE" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.IIMPORTE}
                                                </div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.IIMPORTE" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.TESTADO}
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                        
                        <tr>
                            <%-- NPLANPAGO --%>
                            <axis:ocultar f="axisage007" c="NPLANPAGO" dejarHueco="false">
                                <td class="titulocaja" id="tit_NPLANPAGO" >
                                    <b><axis:alt f="axisage007" c="NPLANPAGO" lit="9902547"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- NNOTARIA --%>
                            <axis:ocultar f="axisage007" c="NNOTARIA" dejarHueco="false">
                                <td class="titulocaja" id="tit_NNOTARIA" >
                                    <b><axis:alt f="axisage007" c="NNOTARIA" lit="9902548"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- CPROVIN --%>
                            <axis:ocultar f="axisage007" c="CPROVIN" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPROVIN" >
                                    <b><axis:alt f="axisage007" c="CPROVIN" lit="9902549"/></b>   
                                </td>
                                <td class="titulocaja" id="tit_CPOBLAC" >
                                    <b><axis:alt f="axisage007" c="TPOBLACNOT" lit="9902694"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- NPLANPAGO --%>
                            <axis:ocultar f="axisage007" c="NPLANPAGO" dejarHueco="false">
                                <td class="campocaja" id="td_NPLANPAGO" > 
                                    <input type="text" name="NPLANPAGO" id="NPLANPAGO" value="${__formdata.NPLANPAGO}" class="campowidthinput campo campotexto" style="width:75%" readonly="true"
                                    formato="entero" title="<axis:alt f="axisage007" c="NPLANPAGO" lit="9902547"/>" alt="<axis:alt f="axisage007" c="NPLANPAGO" lit="9902547"/>" />
                                </td>
                            </axis:ocultar>
                            <%-- NNOTARIA --%>
                            <axis:ocultar f="axisage007" c="NNOTARIA" dejarHueco="false">
                                <td class="campocaja" id="td_NNOTARIA" >
                                    <input type="text" name="NNOTARIA" id="NNOTARIA" value="${__formdata.NNOTARIA}" class="campowidthinput campo campotexto" style="width:75%" readonly="true"
                                    formato="entero" title="<axis:alt f="axisage007" c="NNOTARIA" lit="9902548"/>" alt="<axis:alt f="axisage007" c="NNOTARIA" lit="9902548"/>" />
                                </td>
                            </axis:ocultar>
                            <%-- CPROVIN --%>
                            <axis:ocultar f="axisage007" c="CPROVIN" dejarHueco="false">
                                <td class="campocaja" id="td_CPROVIN" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN"  style="width:18%;"  
                                           readonly="true" title="<axis:alt f="axisage007" c="CPROVIN" lit="9902549"/>"/>
                                           &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                
                                <td class="campocaja" id="td_CPOBLAC">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC"  style="width:18%;"
                                           title="<axis:alt f="axisage007" c="CPOBLAC" lit="100817"/>" readonly="true"/>
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- NESCRITURA --%>
                            <axis:ocultar f="axisage007" c="NESCRITURA" dejarHueco="false">
                                <td class="titulocaja" id="tit_NESCRITURA" >
                                    <b><axis:alt f="axisage007" c="NESCRITURA" lit="9902551"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FALTASOC --%>
                            <axis:ocultar f="axisage007" c="FALTASOC" dejarHueco="false">
                                <td class="titulocaja" id="tit_FALTASOC" >
                                    <b><axis:alt f="axisage007" c="FALTASOC" lit="9902552"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- TGERENTE --%>
                            <axis:ocultar f="axisage007" c="TGERENTE" dejarHueco="false">
                                <td class="titulocaja" id="tit_TGERENTE" >
                                    <b><axis:alt f="axisage007" c="TGERENTE" lit="9902553"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- TCAMARACOMERCIO --%>
                            <axis:ocultar f="axisage007" c="TCAMARACOMERCIO" dejarHueco="false">
                                <td class="titulocaja" id="tit_TCAMARACOMERCIO" >
                                    <b><axis:alt f="axisage007" c="TCAMARACOMERCIO" lit="9902554"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>

                        <tr>
                           <%-- NESCRITURA --%>
                            <axis:ocultar f="axisage007" c="NESCRITURA" dejarHueco="false">
                                <td class="campocaja" id="td_NESCRITURA" >
                                    <input type="text" name="NESCRITURA" id="NESCRITURA" value="${__formdata.NESCRITURA}" class="campowidthinput campo campotexto" style="width:75%"
                                    readonly="true" formato="entero" title="<axis:alt f="axisage007" c="NESCRITURA" lit="9902551"/>" alt="<axis:alt f="axisage007" c="NESCRITURA" lit="9902551"/>" />
                                </td>
                            </axis:ocultar>
                            <%-- FALTASOC --%>
                            <axis:ocultar f="axisage007" c="FALTASOC" dejarHueco="false">
                                <td class="campocaja" id="td_FALTASOC" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                                
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTASOC}"/>" 
                                    <c:if test="${!empty __formdata.FALTASOC}"> value="${__formdata.FALTASOC}"</c:if>
                                    name="FALTASOC" id="FALTASOC" readonly="true"
                                    title="<axis:alt f='axisage007' c='FALTASOC' lit='9902552'/>" />
                                </td>
                            </axis:ocultar>
                            <%-- TGERENTE --%>
                            <axis:ocultar f="axisage007" c="TGERENTE" dejarHueco="false">
                                <td class="campocaja" id="td_TGERENTE" >
                                    <input type="text" name="TGERENTE" id="TGERENTE" value="${__formdata.TGERENTE}" class="campowidthinput campo campotexto" style="width:75%"
                                    title="<axis:alt f="axisage007" c="TGERENTE" lit="9902553"/>" alt="<axis:alt f="axisage007" c="TGERENTE" lit="9902553"/>" readonly="true" />
                                </td>
                            </axis:ocultar>
                            <%-- TCAMARACOMERCIO --%>
                            <axis:ocultar f="axisage007" c="TCAMARACOMERCIO" dejarHueco="false">
                                <td class="campocaja" id="td_TCAMARACOMERCIO" >
                                    <input type="text" name="TCAMARACOMERCIO" id="TCAMARACOMERCIO" value="${__formdata.TCAMARACOMERCIO}" class="campowidthinput campo campotexto" style="width:75%"
                                    title="<axis:alt f="axisage007" c="TCAMARACOMERCIO" lit="9902554"/>" alt="<axis:alt f="axisage007" c="TCAMARACOMERCIO" lit="9902554"/>" readonly="true"/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                        <tr>
                            <%-- Tipo ADN --%>
                            <axis:ocultar f="axisage007" c="CTIPADN" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="td_CTIPADN">
                                    <b><axis:alt f="axisage007" c="CTIPADN" lit="9902526"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- ADN Depende --%>
                            <axis:ocultar f="axisage007" c="CAGEDEP" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="td_CAGEDEP" >
                                    <b><axis:alt f="axisage007" c="CAGEDEP" lit="9902527"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- Tipo ADN --%>
                            <axis:ocultar f="axisage007" c="CTIPADN" dejarHueco="false">
                                <td class="campocaja" colspan="2"> 
                                    <select name="CTIPADN" id="CTIPADN" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"
                                    	title="<axis:alt f='axisage007' c='CTIPADN' lit='9902526'/>" disabled="disabled">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage007" c="SELEC" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPADN}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CTIPADN == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CTIPADN == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- ADN Depende --%>
                            <axis:ocultar f="axisage007" c="CAGEDEP" dejarHueco="false">
                                    <td class="campocaja" id="td_ICO_CAGEDEP" colspan="2">
                                        <input type="text" name="CAGEDEP" id="CAGEDEP" value="${__formdata.CAGEDEP}" class="campowidthinput campo campotexto" style="width:30%" 
                                        readonly="true" obligatorio="false" formato="entero" title="<axis:alt f="axisage007" c="CAGEDEP" lit="9902527"/>" alt="<axis:alt f="axisage007" c="CAGEDEP" lit="9902527"/>" />
                                        <input readonly="true" type="text" name="TAGEDEP" id="TAGEDEP" value="${__formdata.TAGEDEP}" style="width:60%" class="campowidthinput campo campotexto"/>
                                    </td>
                                </td>  
                            </axis:ocultar>
                        </tr>

                        <axis:ocultar f="axisage007" c="DSP_ADN" dejarHueco="false">
                            <tr id="tr_DSP_ADN">
                                <td class="titulocaja" colspan = "4" id="td_DSP_ADN" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage007" c="DSP_ADN" lit="9902545"/>
                                        </div>
                                    </div>                                                           
                                    </div>                                
                                    <%-- ADN --%>
                                    <c:set var="title0"><axis:alt f="axisage007" c="IIMPORTE" lit="100563"/></c:set>   <%-- IIMPORTE --%>
                                    <c:set var="title1"><axis:alt f="axisage007" c="FINIVIG" lit="104095"/></c:set>  <%-- Nº FINIVIG --%>
                                    <c:set var="title2"><axis:alt f="axisage007" c="FFINVIG" lit="103051"/></c:set>  <%-- Nº FFINVIG --%>
               
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.SOPORTEARP}" id="SOPORTEARP" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage007.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SOPORTEARP_AGENTE.IIMPORTE" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.IIMPORTE}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SOPORTEARP_AGENTE.FINIVIG" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.FINIVIG}"/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_SOPORTEARP_AGENTE.FFINVIG" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.FFINVIG}"/>
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                        
                         <%-- Contactos --%>
                        <axis:visible f="axisage007" c="DSP_CONTACTOS"> 
                        <tr>
                              <td class="campocaja" colspan="4">
                                <div style="float:left;">
                                  <img id="contactos_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('contactos', this)"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage007" c="CONTACTOS" lit="101025"/></b>
                                </div>  
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="contactos_children" style="display:none">
                           <td align="left" colspan = "4">
                           
                           <table class="seccion">
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Contratos --%>
                                <c:set var="title0"><axis:alt f="axisage007" c="TIPO" lit="100565"/></c:set>   <%-- TIPO --%>
                                <c:set var="title1"><axis:alt f="axisage007" c="NOMBRE" lit="105940"/></c:set>  <%-- NOMBRE --%>
                                <c:set var="title2"><axis:alt f="axisage007" c="CARGO" lit="9902638"/></c:set>  <%-- CARGO --%>
                                <c:set var="title3"><axis:alt f="axisage007" c="DOMICILIO" lit="101078"/></c:set>   <%-- DOMICILIO --%>
                                <c:set var="title4"><axis:alt f="axisage007" c="TELEFONO" lit="9000992"/></c:set>  <%-- TELEFONO --%>
                                <c:set var="title5"><axis:alt f="axisage007" c="MOBIL" lit="9903007"/></c:set>  <%-- MOBIL --%>
                                <c:set var="title6"><axis:alt f="axisage007" c="FAX" lit="9903323"/></c:set>   <%-- FAX --%>
                                <c:set var="title7"><axis:alt f="axisage007" c="WEB" lit="9903324"/></c:set>  <%-- WEB --%>
                                <c:set var="title8"><axis:alt f="axisage007" c="EMAIL" lit="9903325"/></c:set>  <%-- EMAIL --%>
           
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTACTOS}" id="CONTACTOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage007.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="CONTACTOS.TTIPO"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${CONTACTOS.TTIPO} 
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="CONTACTOS.NOMBRE"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                             ${CONTACTOS.NOMBRE} 
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="CONTACTOS.CARGO"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                               ${CONTACTOS.CARGO} 
                                            </div>
                                        </display:column>
                                        <%--
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CONTRATOS.FFIRCON"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                               
                                            </div>
                                        </display:column> --%>
                                        <display:column title="${title4}" sortable="true" sortProperty="CONTACTOS.TELEFONO"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                               ${CONTACTOS.TELEFONO} 
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="CONTACTOS.TELEFONO2"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                               ${CONTACTOS.TELEFONO2}
                                            </div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="CONTACTOS.FAX"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                              ${CONTACTOS.FAX}
                                            </div>
                                        </display:column>
                                        <display:column title="${title7}" sortable="true" sortProperty="CONTACTOS.WEB"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                              ${CONTACTOS.WEB}
                                            </div>
                                        </display:column>
                                        <display:column title="${title8}" sortable="true" sortProperty="CONTACTOS.EMAIL"   headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                              ${CONTACTOS.EMAIL}
                                            </div>
                                        </display:column>
                                    </display:table>                                                        
                                </div>
                            </td> 
                            </tr>
                            </table>
                            </td>
                        </tr>   
                        </axis:visible>
                        <axis:visible f="axisage007" c="DSP_DOCUMENTOS"> 
                        <tr>
                              <td class="campocaja" colspan="4">
                                <div style="float:left;">
                                  <img id="documentos_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('documentos', this)"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage007" c="LIT_DSP_DOCUM" lit="9001358"/></b>
                                </div>  
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="documentos_children" style="display:none">
                           <td align="left" colspan = "4">
                           <table class="seccion">
                            <tr>
                                <td class="titulocaja" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <c:set var="title0"><axis:alt f="axisage007" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                    <c:set var="title1"><axis:alt f="axisage007" c="FICHERO" lit="105940"></axis:alt></c:set>
                                    <c:set var="title2"><axis:alt f="axisage007" c="TORIGEN" lit="101162"></axis:alt></c:set>
                                    <c:set var="title3"><axis:alt f="axisage007" c="TUSUARIO" lit="9001356"></axis:alt></c:set>
                                    <c:set var="title4"><axis:alt f="axisage007" c="FALTA" lit="105887"></axis:alt></c:set>
                                    <c:set var="title5"><axis:alt f="axisage007" c="TMOTMOV" lit="100565"></axis:alt></c:set>
                                    <c:set var="title6"><axis:alt f="axisage007" c="TAMANO" lit="9903351"></axis:alt></c:set>
                                    <div class="displayspaceGrande">
                                    <display:table name="${__formdata.DOCUMENTOS}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="modal_axisage007.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="TDESCRIP" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${documento.OB_IAX_DOCAGENTE.TDESCRIP}</div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="FICHERO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText" onclick="f_ver_doc('${documento.OB_IAX_DOCAGENTE.IDDOCGEDOX}');"><a hrefx="#">${documento.OB_IAX_DOCAGENTE.FICHERO}</a></div>
                                        </display:column>
                                        <display:column title="${title6}" sortable="true" sortProperty="TOBSERVA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${documento.OB_IAX_DOCAGENTE.TAMANO}</div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="FALTA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_DOCAGENTE.FALTA}" pattern="dd/MM/yyyy"/></div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TOBSERVA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${documento.OB_IAX_DOCAGENTE.TOBSERVA}</div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="FCADUCA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspDate"><fmt:formatDate value="${documento.OB_IAX_DOCAGENTE.FCADUCA}" pattern="dd/MM/yyyy"/></div>
                                        </display:column>
                                    </display:table>
                                    </div>
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("documento");</script>
                                    </c:if>
                               </td> 
                            </tr>
                           </table>
                           </td>
                        </tr>   
                        </axis:visible>
                        <axis:visible c="DSP_PROPIEDADES" f="axisage007">
                        <tr>
                            <td class="campocaja" colspan="4">
                                <div style="float:left;">
                                  <img id="propiedades_parent" src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('propiedades', this)" style="cursor:pointer"/>
                                   <b><axis:alt f="axisage007" c="DSP_PARPER" lit="9001817"/></b>
                                </div>  
                                <div style="clear:both;"><hr class="titulo"></hr></div>
                            </td>
                        </tr>
                        <tr id="propiedades_children" style="display:none">
                            <td align="left" colspan = "2">
                                <table class="seccion">
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisage007" c="TPARAM" lit="9001819"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisage007" c="TVALPAR" lit="101159"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.PROPIEDADES}" id="T_IAX_PARAGE" export="false" class="dsptgtable" pagesize="-1"
                                                     defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisage007.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column headerClass="sortable" title="${title1}" sortable="true" 
                                                        sortProperty="TPARAM" media="html"  autolink="false">
                                                        <div class="dspText">${T_IAX_PARAGE.TPARAM}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="XVALPAR" headerClass="sortable"
                                                        media="html"  autolink="false">
                                                        <c:if test="${T_IAX_PARAGE.CTIPO==1}">
                                                            <div class="dspText"> ${T_IAX_PARAGE.TVALPAR}</div>
                                                        </c:if>
                                                        <c:if test="${T_IAX_PARAGE.CTIPO==2}">
                                                            <div class="dspText"> ${T_IAX_PARAGE.NVALPAR}</div>
                                                        </c:if>
                                                        <c:if test="${T_IAX_PARAGE.CTIPO==3}">
                                                            <%-- TCS_2 ACL 09/01/2018 Se ajusta linea a comilla sencilla --%>
							    <div class="dspText">
                                                                <fmt:formatDate value='${T_IAX_PARAGE.FVALPAR}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${T_IAX_PARAGE.CTIPO==4}">
                                                            <div class="dspText"> ${T_IAX_PARAGE.RESP} </div>
                                                        </c:if>
                                                    </display:column>
                                                </display:table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </axis:visible>
                        <tr>
                            <td class="titulocaja" colspan = "4">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <div class="titulo" >
                                    <div style="float:left">
                                        <img src="images/flecha.gif"/>
                                        <axis:alt f="axisage007" c="REDCOMERCIAL" lit="9000520"/>
                                    </div>                       
                                </div>
                                <%-- DisplayTag Contratos --%>
                                <c:set var="title0"><axis:alt f="axisage007" c="CEMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                <c:set var="title1"><axis:alt f="axisage007" c="NCONTRA" lit="9000536"/></c:set>  <%-- Nº Contrato --%>
                                <c:set var="title2"><axis:alt f="axisage007" c="FECCONT" lit="9000537"/></c:set>  <%-- F. Contrato --%>
           
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTRATOS}" id="CONTRATOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage007.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input type="radio" name="radioCEMPRES"  
                                                value="${CONTRATOS.OB_IAX_CONTRATOS.CEMPRES}" 
                                                onclick="f_actualizar_redcomercial(this.value)"
                                                <c:if test="${__formdata.CEMPRES == CONTRATOS.OB_IAX_CONTRATOS.CEMPRES}"> checked="checked"</c:if>/>
                                            </div>
                                        </display:column>

                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_CONTRATOS.TEMPRES" style="width:60%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${CONTRATOS.OB_IAX_CONTRATOS.TEMPRES}
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CONTRATOS.NCONTRATO" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${CONTRATOS.OB_IAX_CONTRATOS.NCONTRATO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CONTRATOS.FFIRCON"  style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${CONTRATOS.OB_IAX_CONTRATOS.FFIRCON}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                    </display:table>                                                        
                                </div>
                            </td> 
                        </tr>       
                        <tr>
                            <td class="titulocaja" colspan = "4">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <%-- DisplayTag Red Comercial --%>
                                <c:set var="title0"><axis:alt f="axisage007" c="DESDE" lit="104095"/></c:set>  <%-- Desde --%>
                                <c:set var="title1"><axis:alt f="axisage007" c="HASTA" lit="103051"/></c:set>  <%-- Hasta --%>
                                <c:set var="title2"><axis:alt f="axisage007" c="CTIPAGE" lit="9000519"/></c:set> <%-- Tipo Agente --%>
                                <c:set var="title3"><axis:alt f="axisage007" c="GESTOR" lit="1000566"/></c:set> <%-- Gestor --%>
                                <c:set var="title4"><axis:alt f="axisage007" c="NVISIO" lit="9000707"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title5"><axis:alt f="axisage007" c="TIPVISIO" lit="9000708"/></c:set>  <%-- Tipo de visión --%>
                                <c:set var="title6"><axis:alt f="axisage007" c="NVISIO_POL" lit="9902710"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title7"><axis:alt f="axisage007" c="TIPVISIO_POL" lit="9902709"/></c:set>  <%-- Tipo de visión --%>
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage007.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVINI" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVINI}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.FMOVFIN" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${HISTORICO.OB_IAX_REDCOMERCIAL.FMOVFIN}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TCTIPAGE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TCTIPAGE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPADRE" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPADRE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERVISIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.CPERVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERVISIO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPERNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPERNIVEL}
                                            </div>
                                        </display:column>
                                        <axis:visible f="axisage007" c="CPOLVISIO">
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.CPOLVISIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.CPOLVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPOLVISIO}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage007" c="TPOLNIVEL">
                                        <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.TPOLNIVEL" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.TPOLNIVEL}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>                                                        
                                </div>
                            </td> 
                        </tr>     
                        
                         <axis:visible f="axisage007" c="DSP_AGENDA">
               
                      <%--   <c:import url="axisage007.jsp">
                        <c:param name="f">axisage007</c:param>
                        </c:import> --%>

                 
                        
                        </axis:visible>
                        
                        
                        
                               <axis:visible c="DSP_TAREAS_USUARIO" f="axisage007">
                               
                               
                                <tr>
                                
                                    <td class="campocaja" colspan = "4" >
                                        <div class="separador">&nbsp;</div>                   
                                        <div style="float:left;">
                                        <img id="DSP_TAREAS_USUARIO_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_TAREAS_USUARIO', this)" style="cursor:pointer"/>
                                        <b><axis:alt f="axisage007" c="DSP_TAREAS_USUARIO_LIT" lit="9901963"/></b>
                                        </div>
                                        
                                        <axis:visible c="BT_SIN_NUEVO_AGD_AGENDA" f="axisage007">
                                        <div style="float:right;">
                                            <a href="javascript:f_agd_gestioagenda_alta(null,'${miListaId['IDAGENDA']}','ALTA')"><img border="0" alt="<axis:alt f="axisage007" c="AGENDA_LIT" lit="9901437"/>" title="<axis:alt f="axisage007" c="AGENDA_LIT" lit="9901437"/>" src="images/new.gif"/></a>
                                        </div>
                                        </axis:visible>
                                        
                                        <div style="clear:both;">
                                        <hr class="titulo">
                                        </div>
                
                                    </td>
                                </tr>
                                
                                <tr id="DSP_TAREAS_USUARIO_children" style="display:none">
                                    <td class="campocaja" colspan = "4"  >
                                    
                                    
                                    <c:import url="./axisage007_b_z.jsp" />                                    
                                   
                                    </td>
                                </tr>
                        </axis:visible>
                        
                        
                    </table>   
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage007</c:param><c:param name="__botones">salir</c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />
</body>
</html> 
