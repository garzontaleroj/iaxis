<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="modoModificable" value="${true}"/>
 <axis:visible f="axisage003" c="DSP_FINANZAS"> 
                                <tr onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','finanzas');return true;">
                                      <td class="campocaja" colspan="6" id="DSP_FINANZAS">
                                        <div style="float:left;"><a name="posicionPorColorcar__finanzas" id="posicionPorColorcar__finanzas" ></a>
                                          <img id="finanzas_parent"
                                               src="images/mes.gif"
                                               onclick="objEstilos.toggleDisplay('finanzas', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','finanzas');"
                                               style="cursor:pointer"/>
                                           <b><axis:alt f="axisage003" c="FINANZAS" lit="9903480"/></b>
                                        </div>  
                                        <div style="clear:both;">
                                          <hr class="titulo"></hr>
                                        </div>
                                      </td>
                                </tr>
                                <tr id="finanzas_children" style="display:none">
                                   <td align="left" colspan = "6">

						                           <table class="seccion" >
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr> 
                                            <tr>
                                                <axis:ocultar f="axisage003" c="CTIPOACTIV" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CTIPOACTIV" >
                                                    <b><axis:alt f="axisage003" c="CTIPOACTIV" lit="103481"/></b>   
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="CINCIDENCIA" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CINCIDENCIA" >
                                                    <b><axis:alt f="axisage003" c="CINCIDENCIA" lit="9903486"/></b>   
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="CRATING" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CRATING" >
                                                    <b><axis:alt f="axisage003" c="CRATING" lit="9903487"/></b>   
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="CRETENC_FIN" dejarHueco="false">
                                                 <td class="titulocaja" colspan="2" id="tit_CRETENC_FIN" >
                                                    <b><axis:alt f="axisage003" c="CRETENC_FIN" lit="101714"/> </b>  
                                                </td>                 
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisage003" c="CTIPOACTIV" dejarHueco="false">
                                                <td class="campocaja"  id="td_CTIPOACTIV" >
                                                    <select name="CTIPOACTIV" id="CTIPOACTIV" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                                    	 title="<axis:alt f="axisage003" c="CTIPOACTIV" lit="103481"/>"
                                                    <axis:atr f="axisage003" c="CTIPOACTIV" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTACTIVIMED}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CTIPOACTIV == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="CINCIDENCIA" dejarHueco="false">
                                                <td class="campocaja"  id="td_CINCIDENCIA" >
                                                   <select name="CINCIDENCIA" id="CINCIDENCIA" size="1" class="campowidthselect campo campotexto" 
                                                   	style="width:40%;" title="<axis:alt f="axisage003" c="CINCIDENCIA" lit="9903486"/>"
                                                   <axis:atr f="axisage003" c="CINCIDENCIA" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTINCIDENCIAS}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CINCIDENCIA == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="CRATING" dejarHueco="false">
                                                <td class="campocaja"  id="td_CRATING" >
                                                    <select name="CRATING" id="CRATING" size="1" class="campowidthselect campo campotexto" 
                                                    	style="width:79%;" title="<axis:alt f="axisage003" c="CRATING" lit="9903487"/>"
                                                     <axis:atr f="axisage003" c="CRATING" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRATING}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CRATING == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:ocultar>
                                                   <axis:ocultar f="axisage003" c="CRETENC_FIN" dejarHueco="false">
                                                    <td class="campocaja" colspan="2" id="td_CRETENC_FIN" >
                                                        <select name="CRETENC_FIN" id="CRETENC_FIN" size="1" class="campowidthselect campo campotexto"
                                                        	 style="width:79%;"  title="<axis:alt f="axisage003" c="CRETENC_FIN" lit="101714"/>"
                                                        <axis:atr f="axisage003" c="CRETENC_FIN" a="obligatorio=true&isInputText=false"/> 
                                                        title="<axis:alt f="axisage003" c="CRETENC_FIN" lit="101714"/>" alt="<axis:alt f="axisage003" c="CRETENC_FIN" lit="101714"/>">&nbsp;
                                                            <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                            <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRETENCION}">
                                                                <option value = "${element.CRETENC}"
                                                                <c:if test="${__formdata.CRETENC_FIN == element.CRETENC ||__formdata.CRETENC == element.CRETENC }"> selected = "selected"</c:if>>
                                                                    ${element.TTIPRET} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:ocultar>
                                            </tr>
                                            <tr>
                                             <axis:ocultar f="axisage003" c="TVALORACION" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_TVALORACION" >
                                                    <b><axis:alt f="axisage003" c="TVALORACION" lit="9903488"/></b>   
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                             
                                                <axis:ocultar c="TVALORACION" f="axisage003" dejarHueco="false">
                                                    <td colspan="2" class="campocaja"> <!-- colspan="5" -->
                                                        <input type="text" class="campowidthinput campo campotexto" size="15"  
                                                            value="${__formdata.TVALORACION}" name="TVALORACION" id="TVALORACION" 
                                                            title="<axis:alt f="axisage003" c="TVALORACION" lit="9903488"/>" 
                                                            <axis:atr f="axisage003" c="TVALORACION" a="obligatorio=false"/>/>
                                                    </td>
                                                     
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                              
                                                <axis:ocultar f="axisage003" c="CRESOLUCION" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CRESOLUCION">
                                                    <b><axis:alt f="axisage003" c="CRESOLUCION" lit="9903489"/></b>   
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="FFINCREDITO" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_FFINCREDITO" >
                                                    <b><axis:alt f="axisage003" c="FFINCREDITO" lit="9903490"/></b>   
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="LIMCREDITO" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_LIMCREDITO" >
                                                    <b><axis:alt f="axisage003" c="LIMCREDITO" lit="9903491"/></b>   
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                            
                                                <axis:ocultar f="axisage003" c="CRESOLUCION" dejarHueco="false">
                                                <td class="campocaja"  id="td_CRESOLUCION" >
                                                    <select name="CRESOLUCION" id="CRESOLUCION" size="1" 
                                                    	class="campowidthselect campo campotexto" style="width:79%;"
                                                    	title="<axis:alt f="axisage003" c="CRESOLUCION" lit="9903489"/>"
                                                     <axis:atr f="axisage003" c="CRESOLUCION" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRESOLUCION}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CRESOLUCION == element.CATRIBU}"> selected = "selected"</c:if>>
                                                            ${element.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="FFINCREDITO" dejarHueco="false">
                                                <td class="campocaja" id="td_FFINCREDITO" >
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" name="FFINCREDITO" id="FFINCREDITO"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINCREDITO}"/>" 
                                                    <c:if test="${!empty __formdata.PCREDITO}"> value="${__formdata.FFINCREDITO}"</c:if>
                                                     <axis:atr f="axisage003" c="FFINCREDITO" a="formato=fecha&obligatorio=false"/>
                                                    title="<axis:alt f='axisage003' c='FFINCREDITO' lit='9903490'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                                    id="icon_FFINCREDITO" alt="<axis:alt f="axisage003" c="FFINCREDITO" lit="9903490"/>" title="<axis:alt f="axisage003" c="FFINCREDITO" lit="9903490" />" src="images/calendar.gif"/></a></c:if>
                                                </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="NLIMCREDITO" dejarHueco="false">
                                                <td class="campocaja" id="td_NLIMCREDITO" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:79%;" 
                                                    value="${__formdata.NLIMCREDITO}" name="NLIMCREDITO" id="NLIMCREDITO" 
                                                     title="<axis:alt f="axisage003" c="LIMCREDITO" lit="9903491"/>" 
                                                     <axis:atr f="axisage003" c="NLIMCREDITO" a="obligatorio=false"/>/>
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar f="axisage003" c="TCOMENTARIOS" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_TCOMENTARIOS" >
                                                    <b><axis:alt f="axisage003" c="TCOMENTARIOS" lit="9901586"/></b>   
                                                </td>
                                                </axis:ocultar>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="TCOMENTARIOS" f="axisage003" dejarHueco="false">
                                                    <td colspan="3"  class="campocaja"> <!-- colspan="5" -->
                                                        <input type="text" class="campowidthinput campo campotexto" size="15"  
                                                            value="${__formdata.TCOMENTARIOS}" name="TCOMENTARIOS" id="TCOMENTARIOS" 
                                                            title="<axis:alt f="axisage003" c="TCOMENTARIOS" lit="9901586"/>"
                                                            <axis:atr f="axisage003" c="TCOMENTARIOS" a="obligatorio=false"/>/>
                                                    </td>
                                                </axis:ocultar>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>   
                        </axis:visible>
       <axis:visible f="axisage003" c="DSP_DGS"> 
                                <tr onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','dgs');return true;">
                                    <td class="campocaja" colspan="6" id="DSP_DGS">
                                        <div style="float:left;"><a name="posicionPorColorcar__dgs" id="posicionPorColorcar__dgs" ></a>
                                          <img id="dgs_parent"
                                               src="images/mes.gif"
                                               onclick="objEstilos.toggleDisplay('dgs', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','dgs');"
                                               style="cursor:pointer"/>
                                           <b><axis:alt f="axisage003" c="DGS" lit="9903065"/></b>
                                        </div>  
                                        <div style="clear:both;">
                                          <hr class="titulo"></hr>
                                        </div>
                                    </td>
                                </tr>
                                <tr id="dgs_children" style="display:none">
                                   <td align="left" colspan = "6">
                                   
                                    <table class="seccion">
                                        <tr>
                                            <axis:ocultar f="axisage003" c="NREGDGS" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_NREGDGS" >
                                                    <b><axis:alt f="axisage003" c="NREGDGS" lit="9903481"/> </b>  
                                                </td>                 
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="FINSDGS" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_FINSDGS" >
                                                    <b><axis:alt f="axisage003" c="FINSDGS" lit="9903482"/> </b>  
                                                </td>                 
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="CREBCONTDGS" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CREBCONTDGS" >
                                                    <b><axis:alt f="axisage003" c="CREBCONTDGS" lit="9903484"/> </b>  
                                                </td>                 
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisage003" c="NREGDGS" dejarHueco="false">
                                            <td class="campocaja"  id="td_NREGDGS" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                value="${!empty __formdata.NREGDGS ? __formdata.NREGDGS : __formdata.NREGDGS}" name="NREGDGS" id="NREGDGS"
                                                title="<axis:alt f='axisage003' c='NREGDGS' lit='9903481'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>
                                                <axis:atr f="axisage003" c="NREGDGS" a="obligatorio=false"/>/>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="FINSDGS" dejarHueco="false">
                                            <td class="campocaja" id="td_FINSDGS" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:20%;" 
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINSDGS}"/>"  <axis:atr f="axisage003" c="FINSDGS" a="formato=fecha&modificable=true&obligatorio=false"/>
                                                <c:if test="${!empty __formdata.FINSDGS}"> value="${__formdata.FINSDGS}"</c:if>
                                                name="FINSDGS" id="FINSDGS"
                                                title="<axis:alt f='axisage003' c='FINSDGS' lit='9903482'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                                id="icon_FINSDGS" alt="<axis:alt f="axisage003" c="FINSDGS" lit="9903482"/>" title="<axis:alt f="axisage003" c="FINSDGS" lit="9903482" />" src="images/calendar.gif"/></a></c:if>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="CREBCONTDGS" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="checkbox" name="CREBCONTDGS" id="CREBCONTDGS" onclick="actualitzarCheckbox(this)" 
                                                 title="<axis:alt f='axisage003' c='CREBCONTDGS' lit='9903484'/>"
                                                 <c:if test="${__formdata.CREBCONTDGS == 1}">checked</c:if> value="${__formdata.CREBCONTDGS}"  
                                                    <axis:atr f="axisage003" c="CREBCONTDGS" a="modificable=true&isInputText=false"/>/></td>
                                            </td>   
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                   </td>
                                </tr>   
                                </axis:visible>
 <axis:ocultar f="axisage003" c="DSP_PRODPART" dejarHueco="false">
                            <tr>
                                <td class="titulocaja" colspan = "6" id="td_DSP_PRODPART">
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage003" c="DSP_PRODPART" lit="9902544"/>
                                        </div>
                                        <axis:ocultar f="axisage003" c="NEWPRODPART" dejarHueco="false">
                                        <div align="right">
                                            <img border="0" src="images/new.gif" 
                                            alt="<axis:alt f='axisage003' c='NEW' lit='1000428'/>" title="<axis:alt f='axisage003' c='NEW' lit='1000428'/>"
                                            onclick="f_abrir_axisage014()"
                                            style="cursor:pointer"/>                                                            
                                        </div> 
                                        </axis:ocultar>
                                    </div>
                                    <%-- DisplayTag Participacion utilidades --%>
                                    <c:set var="title0"><axis:alt f="axisage003" c="SPRODUC" lit="100829"/></c:set>   <%-- Empresa --%>
                                    <c:set var="title1"><axis:alt f="axisage003" c="CACTIVI" lit="103481"/></c:set>  <%-- Nº Contrato --%>
               
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.PRODPARTICIPACION}" id="PRODPARTICIPACION" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage003.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TPRODUC" style="width:64%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.TPRODUC}
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODPARTICIPACION_AGE.TACTIVI" style="width:34%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.TACTIVI}
                                                </div>
                                            </display:column>
                                            <axis:ocultar f="axisage003" c="DELPRODPART" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_delete_prodpart(${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.CAGENTE},${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.SPRODUC},${PRODPARTICIPACION.OB_IAX_PRODPARTICIPACION_AGE.CACTIVI})" alt="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" src="images/delete.gif"/>
                                                </div>
                                            </display:column>
                                            </axis:ocultar>
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                             <tr>
                            <%-- CTIPINT --%>
                            <axis:ocultar f="axisage003" c="CTIPINT" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="tit_CTIPINT" >
                                    <b><axis:alt f="axisage003" c="CTIPINT" lit="9902531"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- CAGECLAVE --%>
                            <axis:ocultar f="axisage003" c="CAGECLAVE" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="tit_CAGECLAVE" >
                                    <b><axis:alt f="axisage003" c="CAGECLAVE" lit="9902534"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- CTIPINT --%>
                            <axis:ocultar f="axisage003" c="CTIPINT" dejarHueco="false">
                                <td class="campocaja" colspan="2"  id="td_CTIPINT" >
                                    <select name="CTIPINT" id="CTIPINT" size="1" class="campowidthselect campo campotexto" style="width:79%;"  
                                    	title="<axis:alt f='axisage003' c='CTIPINT' lit='9902531'/>"
                                        <axis:atr f="axisage003" c="CTIPINT" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPINT}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CTIPINT == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- CAGECLAVE --%>
                            <axis:ocultar f="axisage003" c="CAGECLAVE" dejarHueco="false">
                            
                                    <td class="campocaja" id="td_CAGECLAVE" colspan="2">
                                        <input type="text" name="CAGECLAVE" id="CAGECLAVE" value="${__formdata.CAGECLAVE}" class="campowidthinput campo campotexto" style="width:30%"
                                        onchange="f_actualizar_agente(this.value)" formato="entero" 
                                        title="<axis:alt f="axisage003" c="CAGECLAVE" lit="9902534"/>" 
                                        	alt="<axis:alt f="axisage003" c="CAGECLAVE" lit="9902534"/>"
                                        <axis:atr f="axisage003" c="CAGECLAVE" a="obligatorio=false"/>/>
                                        
                                        <axis:ocultar f="axisage003" c="ICO_CAGECLAVE" dejarHueco="false">
                                        <img id="ICO_CAGECLAVE" border="0" src="images/find.gif" onclick="f_abrir_axisctr014k()" style="cursor:pointer"
                                        alt="<axis:alt f='axisage003' c='ICO_CAGECLAVE' lit='9000508'/>" title="<axis:alt f='axisage003' c='ICO_CAGECLAVE' lit='9000508'/>"/>
                                        </axis:ocultar>
                                    <axis:ocultar f="axisage003" c="TAGECLAVE" dejarHueco="false">
                                        <input readonly="true" type="text" name="TAGECLAVE" id="TAGECLAVE" value="${__formdata.TAGECLAVE}" class="campowidthinput campo campotexto" style="width:60%" />
                                    </axis:ocultar>
                                    </td> 
                            </axis:ocultar>
                        </tr>
                        
                        <tr>
                            <%-- CLIQUIDO --%>
                            <axis:ocultar f="axisage003" c="CLIQUIDO" dejarHueco="false">
                                <td class="titulocaja" id="tit_CLIQUIDO" > 
                                    <b><axis:alt f="axisage003" c="CLIQUIDO" lit="9902535"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- COFERMERCAN --%>
                            <axis:ocultar f="axisage003" c="COFERMERCAN" dejarHueco="false">
                                <td class="titulocaja" id="tit_COFERMERCAN" >
                                    <b><axis:alt f="axisage003" c="COFERMERCAN" lit="9902536"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- FRECEPCONTRA --%>
                            <axis:ocultar f="axisage003" c="FRECEPCONTRA" dejarHueco="false">
                                <td class="titulocaja" id="tit_FRECEPCONTRA" >
                                    <b><axis:alt f="axisage003" c="FRECEPCONTRA" lit="9902537"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- CIDONEIDAD --%>
                            <axis:ocultar f="axisage003" c="CIDONEIDAD" dejarHueco="false">
                                <td class="titulocaja" id="tit_CIDONEIDAD" >
                                    <b><axis:alt f="axisage003" c="CIDONEIDAD" lit="9902538"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- CLIQUIDO --%>
                            <axis:ocultar f="axisage003" c="CLIQUIDO" dejarHueco="false">
                                <td class="campocaja" id="td_CLIQUIDO" >
                                    <select name="CLIQUIDO" id="CLIQUIDO" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	title="<axis:alt f='axisage003' c='CLIQUIDO' lit='9902535'/>"
                                        <axis:atr f="axisage003" c="CLIQUIDO" a="obligatorio=false&isInputText=false"/>>&nbsp; 
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCLIQUIDO}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CLIQUIDO == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CLIQUIDO == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- COFERMERCAN --%>
                            <axis:ocultar f="axisage003" c="COFERMERCAN" dejarHueco="false">
                                <td class="campocaja" id="td_COFERMERCAN" >
                                    <input type="checkbox" id="COFERMERCAN" name="COFERMERCAN" value="${__formdata.COFERMERCAN}" 
                                    title="<axis:alt f='axisage003' c='COFERMERCAN' lit='9902536'/>"
                                    onclick="f_cofermercan();" <axis:atr f="axisage003" c="COFERMERCAN" a="obligatorio=false&isInputText=false"/>
                                    <c:if test="${__formdata.COFERMERCAN == '1'}">checked</c:if> />
                                </td>  
                            </axis:ocultar>
                            <%-- FRECEPCONTRA --%>
                            <axis:ocultar f="axisage003" c="FRECEPCONTRA" dejarHueco="false">
                                <td class="campocaja" id="td_FRECEPCONTRA" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                               
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRECEPCONTRA}"/>" 
                                    <c:if test="${!empty __formdata.FRECEPCONTRA}"> value="${__formdata.FRECEPCONTRA}"</c:if>
                                    name="FRECEPCONTRA" id="FRECEPCONTRA" <axis:atr f="axisage003" c="FRECEPCONTRA" a="obligatorio=false"/>
                                    title="<axis:alt f='axisage003' c='FRECEPCONTRA' lit='9902537'/>" <c:if test="${!modoModificable}">readonly="readonly"</c:if>/><c:if test="${modoModificable}"><a style="vertical-align:middle;"><img
                                    id="icon_FRECEPCONTRA" alt="<axis:alt f="axisage003" c="FRECEPCONTRA" lit="9902537"/>" title="<axis:alt f="axisage003" c="FRECEPCONTRA" lit="9902537" />" src="images/calendar.gif"/></a></c:if>
                                </td>
                            </axis:ocultar>
                            <%-- CIDONEIDAD --%>
                            <axis:ocultar f="axisage003" c="CIDONEIDAD" dejarHueco="false">
                                <td class="campocaja" id="td_CIDONEIDAD" >
                                    <select name="CIDONEIDAD" id="CIDONEIDAD" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage003' c='CIDONEIDAD' lit='9902538'/>"
                                        <axis:atr f="axisage003" c="CIDONEIDAD" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCIDONEIDAD}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CIDONEIDAD == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                        </tr>
 <tr>
                            <%-- CCOMPANI --%>
                            <axis:ocultar f="axisage003" c="CCOMPANI" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCOMPANI" >
                                    <b><axis:alt f="axisage003" c="CCOMPANI" lit="9902541"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- COFIPROPIA --%>
                            <axis:ocultar f="axisage003" c="COFIPROPIA" dejarHueco="false">
                                <td class="titulocaja" id="tit_COFIPROPIA" >
                                    <b><axis:alt f="axisage003" c="COFIPROPIA" lit="9902542"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- CCLASIF --%>
                            <axis:ocultar f="axisage003" c="CCLASIF" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCLASIF" >
                                    <b><axis:alt f="axisage003" c="CCLASIF" lit="9902543"/></b>   
                                </td>
                            </axis:ocultar>
                              <%-- CCODCON  --%>
                            <axis:ocultar f="axisage003" c="CCODCON" dejarHueco="false">
                                <td class="titulocaja" id="tit_CCLASIF" >
                                    <b><axis:alt f="axisage003" c="CCODCON" lit="9905956"/></b>   
                                </td>
                            </axis:ocultar>
                            
                            <%-- CEXPIDE  --%>
                            <axis:ocultar f="axisage003" c="CEXPIDE" dejarHueco="false">
                                <td class="titulocaja" id="tit_CEXPIDE" >
                                    <b><axis:alt f="axisage003" c="CEXPIDE" lit="9908452"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>

                        <tr>
                           <%-- CCOMPANI --%>
                            <axis:ocultar f="axisage003" c="CCOMPANI" dejarHueco="false">
                                <td class="campocaja" id="td_CCOMPANI" >
                                    <select name="CCOMPANI" id="CCOMPANI" size="1" class="campowidthselect campo campotexto" style="width:79%;"  
                                    	title="<axis:alt f='axisage003' c='CCOMPANI' lit='9902541'/>"
                                        <axis:atr f="axisage003" c="CCOMPANI" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCOMPANI}">
                                            <option value = "${element.CCOMPANI}"
                                            <c:if test="${__formdata.CCOMPANI == element.CCOMPANI}"> selected = "selected"</c:if>>
                                                ${element.TCOMPANI} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- COFIPROPIA --%>
                            <axis:ocultar f="axisage003" c="COFIPROPIA" dejarHueco="false">
                                <td class="campocaja" id="td_COFIPROPIA" >
                                    <select name="COFIPROPIA" id="COFIPROPIA" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage003' c='COFIPROPIA' lit='9902542'/>"
                                        <axis:atr f="axisage003" c="COFIPROPIA" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCOFIPROPIA}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.COFIPROPIA == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <%-- CCLASIF --%>
                            <axis:ocultar f="axisage003" c="CCLASIF" dejarHueco="false">
                                <td class="campocaja" id="td_CCLASIF" >
                                    <select name="CCLASIF" id="CCLASIF" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false" 
                                    	title="<axis:alt f='axisage003' c='CCLASIF' lit='9902543'/>"
                                        <axis:atr f="axisage003" c="CCLASIF" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCLASIF}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CCLASIF == element.CATRIBU}"> selected = "selected"</c:if> 
                                            <c:if test="${__formdata.CCLASIF == element.CATRIBU}"> selected = "selected"</c:if>>
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                             <axis:visible f="axisage003" c="CCODCON" >
                            <td class="campocaja"  id="td_CCODCON" >
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="${__formdata.CCODCON}" name="CCODCON" id="CCODCON"
                                
                                <axis:atr f="axisage003" c="NCOLEGI" a="obligatorio=false"/> <c:if test="${!modoModificable}">readonly="readonly"</c:if>/>
                            </td>
                            </axis:visible>
                            <axis:ocultar f="axisage003" c="CEXPIDE" dejarHueco="false" >
                            <td class="campocaja"  id="td_CEXPIDE" >
                                <input onclick="f_check(this)" type="checkbox"
                                   id="CEXPIDE" name="CEXPIDE"
                                   <c:if test="${__formdata.CEXPIDE == 1}">checked</c:if>
                                   value="${__formdata.CEXPIDE}" 
                                    <axis:atr f="axisage003" c="COFERMERCAN" a="obligatorio=false&isInputText=false"/>/>
 
                            </td>
                            </axis:ocultar>
                        </tr>
                        <axis:ocultar f="axisage003" c="DSP_SUBVENCION" dejarHueco="false">
                            <tr>
                                <td class="titulocaja" colspan = "6" id="td_DSP_SUBVENCION">
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage003" c="DSP_SUBVENCION" lit="9902546"/>
                                        </div>
                                        <axis:ocultar f="axisage003" c="NEWSUBVENCION" dejarHueco="false">
                                        <div align="right">
                                            <img border="0" src="images/new.gif" 
                                            alt="<axis:alt f='axisage003' c='NEW' lit='1000428'/>" title="<axis:alt f='axisage003' c='NEW' lit='1000428'/>"
                                            onclick="f_abrir_axisage017()"
                                            style="cursor:pointer"/>                                                            
                                        </div> 
                                        </axis:ocultar>
                                    </div>                                                           
                                    </div>                                
                                    <%-- SUBVENCION --%>
                                    <c:set var="title0"><axis:alt f="axisage003" c="SPRODUC" lit="100829"/></c:set>  <%-- TPRODUC --%>
                                    <c:set var="title1"><axis:alt f="axisage003" c="CACTIVI" lit="103481"/></c:set>  <%-- TACTIVI --%>
                                    <c:set var="title2"><axis:alt f="axisage003" c="IIMPORTE" lit="100563"/></c:set>   <%-- IIMPORTE --%>
                                    <c:set var="title3"><axis:alt f="axisage003" c="ESTADO" lit="100587"/></c:set>
                                    <c:set var="title4"><axis:alt f="axisage003" c="NPLANPAGO" lit="9902547"/></c:set>
                                    
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.SUBVENCION}" id="SUBVENCION" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage003.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            
                                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.TSPRODUC" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.TPRODUC}
                                                </div>
                                            </display:column>
                                            <axis:visible f="axisage003" c="TACTIVI">
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SUBVENCION_AGENTE.TACTIVI" style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspText">
                                                    ${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.TACTIVI}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisage003" c="NPLANPAGO">
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
                                          
                                            <axis:ocultar f="axisage003" c="EDITSUBVENCION" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="sortable"  media="html" autolink="false" >
                                                <c:if test="${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CESTADO == 0 }">
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_edit_sub('${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CAGENTE}','${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.SPRODUC}','${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CACTIVI}')" alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" src="images/lapiz.gif"/>
                                                </div>
                                                </c:if>
                                            </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="DELSUBVENCION" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="sortable"  media="html" autolink="false" >
                                                <c:if test="${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CESTADO == 0 }">
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_delete_sub('${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CAGENTE}','${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.SPRODUC}','${SUBVENCION.OB_IAX_SUBVENCION_AGENTE.CACTIVI}')" alt="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" src="images/delete.gif"/>
                                                </div>
                                                </c:if>
                                            </display:column>
                                            </axis:ocultar>
                                            
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                        <tr>
                            <td colspan="3"></td>
                            <axis:ocultar f="axisage003" c="BTN_TRASPASARSUB" dejarHueco="false">
                            <td align="right">
                                <input type="button" name="BTN_TRASPASARSUB" id="BTN_TRASPASARSUB"  class="boton" 
                                     title="<axis:alt f="axisage003" c="NPLANPAGO" lit=""/>" value="<axis:alt f="axisage003" c="BTN_TRASPASARSUB" lit="9900788"/>" 
                                     onclick="f_traspasar_sub()"/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <%-- NPLANPAGO --%>
                            <axis:ocultar f="axisage003" c="NPLANPAGO" dejarHueco="false">
                                <td class="titulocaja" id="tit_NPLANPAGO" >
                                    <b><axis:alt f="axisage003" c="NPLANPAGO" lit="9902547"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- NNOTARIA --%>
                            <axis:ocultar f="axisage003" c="NNOTARIA" dejarHueco="false">
                                <td class="titulocaja" id="tit_NNOTARIA" >
                                    <b><axis:alt f="axisage003" c="NNOTARIA" lit="9902548"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- CPROVIN --%>
                            <axis:ocultar f="axisage003" c="CPROVIN" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPROVIN" >
                                    <b><axis:alt f="axisage003" c="CPROVIN" lit="9902549"/></b>   
                                </td>
                                <td class="titulocaja" id="tit_CPOBLAC" >
                                    <b><axis:alt f="axisage003" c="TPOBLACNOT" lit="9902694"/></b>   
                                </td>
                            </axis:ocultar>
							<!--AAC_INI-CONF_379-20160927 -->
                            <axis:ocultar f="axisage003" c="CORTEPROD" dejarHueco="false">
                                <td class="titulocaja" id="tit_CORTEPROD" >
                                    <b><axis:alt f="axisage003" c="CORTEPROD" lit="9909824"/></b>   
                                </td>
                            </axis:ocultar>
                            <!--AAC_FI-CONF_379-20160927 -->
                        </tr>
                        <tr>
                           <%-- NPLANPAGO --%>
                            <axis:ocultar f="axisage003" c="NPLANPAGO" dejarHueco="false">
                                <td class="campocaja" id="td_NPLANPAGO" > 
                                    <input type="text" name="NPLANPAGO" id="NPLANPAGO" value="${__formdata.NPLANPAGO}" class="campowidthinput campo campotexto" style="width:75%"
                                    formato="entero" title="<axis:alt f="axisage003" c="NPLANPAGO" lit="9902547"/>" alt="<axis:alt f="axisage003" c="NPLANPAGO" lit="9902547"/>" 
                                    <axis:atr f="axisage003" c="NPLANPAGO" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                            <%-- NNOTARIA --%>
                            <axis:ocultar f="axisage003" c="NNOTARIA" dejarHueco="false">
                                <td class="campocaja" id="td_NNOTARIA" >
                                    <input type="text" name="NNOTARIA" id="NNOTARIA" value="${__formdata.NNOTARIA}" class="campowidthinput campo campotexto" style="width:75%"
                                    formato="entero" title="<axis:alt f="axisage003" c="NNOTARIA" lit="9902548"/>" alt="<axis:alt f="axisage003" c="NNOTARIA" lit="9902548"/>" 
                                    <axis:atr f="axisage003" c="NNOTARIA" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                            <%-- CPROVIN --%>
                            <%-- codi original substituit per Johnny
                            <axis:ocultar f="axisage003" c="CPROVIN" dejarHueco="false">
                                <td class="campocaja" id="td_CPROVIN" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  
                                           title="<axis:alt f="axisage003" c="CPROVIN" lit="9902549"/>"
					   <axis:atr f="axisage003" c="CPROVIN" a="obligatorio=false"/>/>
                                    &nbsp;<img id="CPROVIN_ICO" style="cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', null)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                
                                <td class="campocaja" id="td_CPOBLAC">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                           title="<axis:alt f="axisage003" c="CPOBLAC" lit="100817"/>"/>
                                    &nbsp;<img id="CPOBLAC_ICO" style="visibility:${empty __formdata.CPOBLAC ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, null)"/>                
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>
                            </axis:ocultar>
                            --%>
                            <axis:ocultar f="axisage003" c="CPROVIN" dejarHueco="false">
                                <td class="campocaja" id="td_CPROVIN" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  
                                           title="<axis:alt f="axisage003" c="CPROVIN" lit="9902549"/>"
                                           <axis:atr f="axisage003" c="CPROVIN" a="obligatorio=false"/>/>
                                    &nbsp;
                                    <axis:ocultar f="axisage003" c="CPROVIN_ICO" dejarHueco="false">
                                    <img id="CPROVIN_ICO" style="cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', null)"/>                
                                    </axis:ocultar>
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                <td class="campocaja" id="td_CPOBLAC">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                           title="<axis:alt f="axisage003" c="CPOBLAC" lit="9902694"/>"
                                           <axis:atr f="axisage003" c="CPOBLAC" a="obligatorio=false"/>/>
                                    &nbsp;
                                    <axis:ocultar f="axisage003" c="CPOBLAC_ICO" dejarHueco="false">
                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPOBLAC ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, null)"/>                
                                    </axis:ocultar>
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>
                            </axis:ocultar>
                            <!--AAC_INI-CONF_379-20160927 -->
                                            <axis:ocultar f="axisage003" c="CORTEPROD" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="checkbox" name="CORTEPROD" id="CORTEPROD" onclick="actualitzarCheckbox(this)" 
                                                 title="<axis:alt f='axisage003' c='CORTEPROD' lit='9909824'/>"
                                                 <c:if test="${__formdata.CORTEPROD == 1}">checked</c:if> value="${__formdata.CORTEPROD}"  
                                                    <axis:atr f="axisage003" c="CORTEPROD" a="modificable=true&isInputText=false"/>/></td>
                                            </td>   
                                            </axis:ocultar>
                           <!--AAC_FI-CONF_379-20160927 -->
						   </tr>
                        <tr>
                            <%-- NESCRITURA --%>
                            <axis:ocultar f="axisage003" c="NESCRITURA" dejarHueco="false">
                                <td class="titulocaja" id="tit_NESCRITURA" >
                                    <b><axis:alt f="axisage003" c="NESCRITURA" lit="9902551"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- FALTASOC --%>
                            <axis:ocultar f="axisage003" c="FALTASOC" dejarHueco="false">
                                <td class="titulocaja" id="tit_FALTASOC" >
                                    <b><axis:alt f="axisage003" c="FALTASOC" lit="9902552"/> </b>
                                </td>  
                            </axis:ocultar>
                            <%-- TGERENTE --%>
                            <axis:ocultar f="axisage003" c="TGERENTE" dejarHueco="false">
                                <td class="titulocaja" id="tit_TGERENTE" >
                                    <b><axis:alt f="axisage003" c="TGERENTE" lit="9902553"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- TCAMARACOMERCIO --%>
                            <axis:ocultar f="axisage003" c="TCAMARACOMERCIO" dejarHueco="false">
                                <td class="titulocaja" id="tit_TCAMARACOMERCIO" >
                                    <b><axis:alt f="axisage003" c="TCAMARACOMERCIO" lit="9902554"/></b>   
                                </td>
                            </axis:ocultar>
                        </tr>

                        <tr>
                           <%-- NESCRITURA --%>
                            <axis:ocultar f="axisage003" c="NESCRITURA" dejarHueco="false">
                                <td class="campocaja" id="td_NESCRITURA" >
                                    <input type="text" name="NESCRITURA" id="NESCRITURA" value="${__formdata.NESCRITURA}" class="campowidthinput campo campotexto" style="width:75%"
                                    formato="entero" title="<axis:alt f="axisage003" c="NESCRITURA" lit="9902551"/>" alt="<axis:alt f="axisage003" c="NESCRITURA" lit="9902551"/>" 
                                    <axis:atr f="axisage003" c="NESCRITURA" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                            <%-- FALTASOC --%>
                            <axis:ocultar f="axisage003" c="FALTASOC" dejarHueco="false">
                                <td class="campocaja" id="td_FALTASOC" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;"                                
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FALTASOC}"/>" 
                                    <c:if test="${!empty __formdata.FALTASOC}"> value="${__formdata.FALTASOC}"</c:if>
                                    name="FALTASOC" id="FALTASOC"
                                    <axis:atr f="axisage003" c="FALTASOC" a="obligatorio=false"/>
                                    title="<axis:alt f='axisage003' c='FALTASOC' lit='9902552'/>" 
                                    <c:if test="${!modoModificable}">readonly="readonly"</c:if> />
                                    <axis:ocultar f="axisage003" c="FALTASOC_ICO" dejarHueco="false">
                                    <c:if test="${modoModificable}">
                                    <a style="vertical-align:middle;">
                                        <img id="FALTASOC_ICO" alt="<axis:alt f="axisage003" c="FALTASOC" lit="9902552"/>" title="<axis:alt f="axisage003" c="FALTASOC" lit="9902552" />" src="images/calendar.gif"/>
                                    </a>
                                    </c:if>
                                    </axis:ocultar>
                                </td>
                            </axis:ocultar>
                            <%-- TGERENTE --%>
                            <axis:ocultar f="axisage003" c="TGERENTE" dejarHueco="false">
                                <td class="campocaja" id="td_TGERENTE" >
                                    <input type="text" name="TGERENTE" id="TGERENTE" value="${__formdata.TGERENTE}" class="campowidthinput campo campotexto" style="width:75%"
                                    title="<axis:alt f="axisage003" c="TGERENTE" lit="9902553"/>" alt="<axis:alt f="axisage003" c="TGERENTE" lit="9902553"/>" 
                                    <axis:atr f="axisage003" c="TGERENTE" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                            <%-- TCAMARACOMERCIO --%>
                            <axis:ocultar f="axisage003" c="TCAMARACOMERCIO" dejarHueco="false">
                                <td class="campocaja" id="td_TCAMARACOMERCIO" >
                                    <input type="text" name="TCAMARACOMERCIO" id="TCAMARACOMERCIO" value="${__formdata.TCAMARACOMERCIO}" class="campowidthinput campo campotexto" style="width:75%"
                                    title="<axis:alt f="axisage003" c="TCAMARACOMERCIO" lit="9902554"/>" alt="<axis:alt f="axisage003" c="TCAMARACOMERCIO" lit="9902554"/>" 
                                    <axis:atr f="axisage003" c="TCAMARACOMERCIO" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                        <tr>
                            <%-- Tipo ADN --%>
                            <axis:ocultar f="axisage003" c="CTIPADN" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="td_CTIPADN">
                                    <b><axis:alt f="axisage003" c="CTIPADN" lit="9902526"/></b>   
                                </td>
                            </axis:ocultar>
                            <%-- ADN Depende --%>
                            <axis:ocultar f="axisage003" c="CAGEDEP" dejarHueco="false">
                                <td class="titulocaja" colspan="2" id="td_CAGEDEP" >
                                    <b><axis:alt f="axisage003" c="CAGEDEP" lit="9902527"/> </b>
                                </td>  
                            </axis:ocultar>
                        </tr>
                        <tr>
                           <%-- Tipo ADN --%>
                            <axis:ocultar f="axisage003" c="CTIPADN" dejarHueco="false">
                                <td class="campocaja" colspan="2"> 
                                    <select name="CTIPADN" id="CTIPADN" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"
                                    	title="<axis:alt f='axisage003' c='CTIPADN' lit='9902526'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();"
                                        <axis:atr f="axisage003" c="CTIPADN" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
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
                            <axis:ocultar f="axisage003" c="CAGEDEP" dejarHueco="false">
                                    <td class="campocaja" id="td_ICON_CAGEDEP" colspan="2">
                                        <input type="text" name="CAGEDEP" id="CAGEDEP" value="${__formdata.CAGEDEP}" class="campowidthinput campo campotexto" style="width:30%" 
                                        onchange="f_actualizar_agentek(this.value)"  formato="entero" title="<axis:alt f="axisage003" c="CAGEDEP" lit="9902527"/>" alt="<axis:alt f="axisage003" c="CAGEDEP" lit="9902527"/>" 
                                        <axis:atr f="axisage003" c="CAGEDEP" a="obligatorio=false"/>/>
                                        <axis:ocultar f="axisage003" c="ICO_CAGEDEP" dejarHueco="false">
                                        <img border="0" id="ICO_CAGEDEP" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"
                                        alt="<axis:alt f='axisage003' c='ICO_CAGEDEP' lit='9000508'/>" title="<axis:alt f='axisage003' c='ICO_CAGEDEP' lit='9000508'/>"/>
                                        </axis:ocultar>
                                        <input readonly="true" type="text" name="TAGEDEP" id="TAGEDEP" value="${__formdata.TAGEDEP}" style="width:60%" class="campowidthinput campo campotexto"/>
                                    </td>
                                </td>  
                            </axis:ocultar>
                        </tr>

                    <axis:visible f="axisage003" c="DSP_COMIEXTRA" >
                        <tr>
                             <td>
                                &nbsp;
                             </td>
                         </tr>
                         <tr>
                         <td colspan="5">
                            <div class="seccion" id="DSP_COMIEXTRA" name="DSP_COMIEXTRA" style="width:100%">
                                 <b><axis:alt f="axisage003" c="txt_DSP_COMIEXTRA" lit="9907006"/> </b>
                                
                                <table style="margin-left:10px">
                                <tr>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisage003" c="tit_BIS" lit="9907011"/></b>
                                    </td>
                                </tr>
                                <tr>

                                <td>
                                    <table style="width:50%">
                                        <tr>
                                        <axis:ocultar f="axisage003" c="CTIPCALB" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CTIPCALB" >
                                                    <b><axis:alt f="axisage003" c="CTIPCALB" lit="9907008"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                 <axis:ocultar f="axisage003" c="CFORCALB" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CFORCALB" >
                                                    <b><axis:alt f="axisage003" c="CFORCALB" lit="9907009"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                   <axis:ocultar f="axisage003" c="CMESPAGB" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CMESPAGB" >
                                                    <b><axis:alt f="axisage003" c="CMESPAGB" lit="9907010"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                             <axis:ocultar f="axisage003" c="IOBJETIVO" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_IOBJETIVO" >
                                                    <b><axis:alt f="axisage003" c="IOBJETIVO" lit="9906976"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="PCOMBUSI" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_PCOMBUSI" >
                                                    <b><axis:alt f="axisage003" c="PCOMBUSI" lit="9907007"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                   <axis:ocultar f="axisage003" c="IBONIFICA" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_IBONIFICA" >
                                                    <b><axis:alt f="axisage003" c="IBONIFICA" lit="9903066"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                <axis:ocultar f="axisage003" c="ILIMITEB" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_ILIMITEB" >
                                                    <b><axis:alt f="axisage003" c="ILIMITEB" lit="9901562"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                        </tr>
    
                                        <tr>
                                        <axis:visible c="CTIPCALB" f="axisage003" >
                                            <td class="campocaja"  id="td_CTIPCALB" >
                                                    <select name="CTIPCALB" id="CTIPCALB" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CTIPCALB' lit='9907008'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();"
                                                        <axis:atr f="axisage003" c="CTIPCALB" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstCtipcalB}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CTIPCALB == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                               </td>
                                         </axis:visible>
                                       <axis:visible c="CFORCALB" f="axisage003" >
                                                <td class="campocaja"  id="td_CFORCALB" >
                                                     <select name="CFORCALB" id="CFORCALB" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CFORCALB' lit='9907009'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();"
                                                        <axis:atr f="axisage003" c="CFORCAL" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstCforcalB}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CFORCALB == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                   </td>
                                          </axis:visible>
                                          <axis:visible c="CMESPAGB" f="axisage003" >
                                            <td class="campocaja"  id="td_CMESPAGB" >    
                                                     <select name="CMESPAGB" id="CMESPAGB" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CMESPAGB' lit='9907010'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();" 
                                                        <axis:atr f="axisage003" c="CMESPAGB" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstMesesB}"> 
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CMESPAGB == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                               </td>
                                         </axis:visible>
                                          <axis:visible c="IOBJETIVO" f="axisage003" >
                                                <td class="campocaja"  id="td_IOBJETIVO" >
                                                    
                                                          <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                        value="${__formdata.IOBJETIVO}" name="IOBJETIVO" id="IOBJETIVO"  
                                                        style="width:95%;" title="<axis:alt f="axisage003" c="IOBJETIVO" lit="9906976"/>"/>                                    
                                                   </td>
                                          </axis:visible>
                                          <axis:visible c="PCOMBUSI" f="axisage003" >
                                            <td class="campocaja"  id="td_PCOMBUSI" >
                                                
                                                      <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                    value="${__formdata.PCOMBUSI}" name="PCOMBUSI" id="PCOMBUSI"  
                                                    style="width:95%;" title="<axis:alt f="axisage003" c="PCOMBUSI" lit="9903066"/>"/>                                    
                                               </td>
                                         </axis:visible>
                                          <axis:visible c="IBONIFICA" f="axisage003" >
                                            <td class="campocaja"  id="td_IBONIFICA" >
                                                
                                                      <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                    value="${__formdata.IBONIFICA}" name="IBONIFICA" id="IBONIFICA"  
                                                    style="width:95%;" title="<axis:alt f="axisage003" c="IBONIFICA" lit="9903066"/>"/>                                    
                                               </td>
                                         </axis:visible>
                                         <axis:visible c="ILIMITEB" f="axisage003" >
                                            <td class="campocaja"  id="td_ILIMITEB" >
                                                
                                                      <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                    value="${__formdata.ILIMITEB}" name="ILIMITEB" id="ILIMITEB"  
                                                    style="width:95%;" title="<axis:alt f="axisage003" c="ILIMITEB" lit="9901562"/>"/>                                    
                                               </td>
                                         </axis:visible>
                                        </tr>
                                    </table>
                                </td>
                               </tr>
                               <tr>
                                    <td class="titulocaja">
                                       
                                        <b><axis:alt f="axisage003" c="tit_MA" lit="9907012"/></b>
                                    </td>
                                </tr>
                                
                               <tr>

                                <td>
                                    <table >
                                        <tr>
                                             <axis:ocultar f="axisage003" c="PCOMEXTR" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_PCOMEXTR"  >
                                                    <b><axis:alt f="axisage003" c="PCOMEXTR" lit="9907007"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                   <axis:ocultar f="axisage003" c="CTIPCAL" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CTIPCAL" >
                                                    <b><axis:alt f="axisage003" c="CTIPCAL" lit="9907008"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                 <axis:ocultar f="axisage003" c="CFORCAL" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CFORCAL" >
                                                    <b><axis:alt f="axisage003" c="CFORCAL" lit="9907009"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                   <axis:ocultar f="axisage003" c="CMESPAG" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_CMESPAG" >
                                                    <b><axis:alt f="axisage003" c="CMESPAG" lit="9907010"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                        </tr>
    
                                        <tr>
                                          <axis:visible c="PCOMEXTR" f="axisage003" >
                                                <td class="campocaja"  id="td_PCOMEXTR" >
                                                    
                                                          <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                        value="${__formdata.PCOMEXTR}" name="PCOMEXTR" id="PCOMEXTR" 
                                                        style="width:95%;" title="<axis:alt f="axisage003" c="PCOMEXTR" lit="9907007"/>"/>                                    
                                                   </td>
                                          </axis:visible>
                                          <axis:visible c="CTIPCAL" f="axisage003" >
                                            <td class="campocaja"  id="td_CTIPCAL" >
                                                    <select name="CTIPCAL" id="CTIPCAL" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CTIPCAL' lit='9907008'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();"
                                                        <axis:atr f="axisage003" c="CTIPCAL" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstCtipcal}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CTIPCAL == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                               </td>
                                         </axis:visible>
                                       <axis:visible c="CFORCAL" f="axisage003" >
                                                <td class="campocaja"  id="td_CFORCAL" >
                                                     <select name="CFORCAL" id="CFORCAL" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CFORCAL' lit='9907009'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();"
                                                        <axis:atr f="axisage003" c="CFORCAL" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstCforcal}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CFORCAL == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                   </td>
                                          </axis:visible>
                                          <axis:visible c="CMESPAG" f="axisage003" >
                                            <td class="campocaja"  id="td_CMESPAG" >    
                                                     <select name="CMESPAG" id="CMESPAG" size="1" class="campowidthselect campo campotexto" style="width:79%;" obligatorio="false"  
                                                        title="<axis:alt f='axisage003' c='CMESPAG' lit='9907010'/>" onchange="f_cargar_propiedades_pantalla();f_actualizar_tnombre();" 
                                                        <axis:atr f="axisage003" c="CMESPAG" a="obligatorio=false&isInputText=false"/>>&nbsp;
                                                        <c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage003" c="SELEC" lit="1000348"/> - </option></c:if>
                                                        <c:forEach var="element" items="${__formdata.lstMeses}">
                                                            <option value = "${element.CATRIBU}"
                                                            <c:if test="${__formdata.CMESPAG == element.CATRIBU}"> selected = "selected"</c:if> >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                               </td>
                                         </axis:visible>
                                        </tr>
                                    </table>
                                
                                
                                </td>
                               </tr>
                                <tr><axis:ocultar f="axisage003" c="TIT_PCOMEX" dejarHueco="false">
                                    <td class="titulocaja">
                                       
                                        <b><axis:alt f="axisage003" c="tit_OV" lit="9907482"/></b>
                                    </td>
									</axis:ocultar>
                                </tr>
                                
                               <tr>
                                 <td>
                                    <table >
                                        <tr>
                                             <axis:ocultar f="axisage003" c="PCOMEXTROVER" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_PCOMEXTROVER"  >
                                                    <b><axis:alt f="axisage003" c="PCOMEXTROVER" lit="9907007"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                        </tr>
                                        <tr>
                                             <axis:visible c="PCOMEXTROVER" f="axisage003" >
                                                 <td class="campocaja"  id="td_PCOMEXTROVER" >
                                                    
                                                          <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                        value="${__formdata.PCOMEXTROV}" name="PCOMEXTROV" id="PCOMEXTROV" 
                                                        style="width:20%;" title="<axis:alt f="axisage003" c="PCOMEXTROV" lit="9907007"/>"/>                                    
                                                   </td>
                                          </axis:visible>
                                        </tr>
                                    </table>
                                 
                               </tr>
                                                               <tr>
									<axis:ocultar f="axisage003" c="TIT_PPERSIS" dejarHueco="false">
                                    <td class="titulocaja">
                                       
                                        <b><axis:alt f="axisage003" c="tit_PERSAWARD" lit="9907486"/></b>
                                    </td>
									</axis:ocultar>
                                </tr>
                                
                               <tr>
                                 <td>
                                    <table >
                                        <tr>
                                             <axis:ocultar f="axisage003" c="PPERSISTEN" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_PPERSISTEN"  >
                                                    <b><axis:alt f="axisage003" c="PPERSISTEN" lit="9907488"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                                 <axis:ocultar f="axisage003" c="PCOMPERS" dejarHueco="false">
                                                <td class="titulocaja"  id="tit_PCOMPERS"  >
                                                    <b><axis:alt f="axisage003" c="PCOMPERS" lit="9907487"/> </b>  
                                                </td>  
                                                </axis:ocultar>
                                        </tr>
                                        <tr>
                                             <axis:visible c="PPERSISTEN" f="axisage003" >
                                                 <td class="campocaja"  id="td_PPERSISTEN" >
                                                    
                                                  <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                        value="${__formdata.PPERSISTEN}" name="PPERSISTEN" id="PPERSISTEN" 
                                                        style="width:20%;" title="<axis:alt f="axisage003" c="PPERSISTEN" lit="101467"/>"/>                                    
                                                   </td>
                                          </axis:visible>
                                            <axis:visible c="PCOMPERS" f="axisage003" >
                                                 <td class="campocaja"  id="td_PCOMPERS" >
                                                    
                                                    <input type="text" class="campowidthinput campo campotexto" size="10" 
                                                        value="${__formdata.PCOMPERS}" name="PCOMPERS" id="PCOMPERS" 
                                                        style="width:20%;" title="<axis:alt f="axisage003" c="PCOMPERS" lit="9907489"/>"/>                                    
                                                   </td>
                                          </axis:visible>
                                        </tr>
                                    </table>
                                 
                               </tr>
                            </table>
                            </div>
                         </td>
                        </tr>  
                    </axis:visible>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
