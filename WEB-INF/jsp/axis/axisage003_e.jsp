<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <axis:visible f="axisage003" c="DSP_ACTORES"> 
 <tr  id="tr_DSP_ACTORES" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','actores');return true;">
   <td class="campocaja" colspan="6" id="DSP_ACTORES">
                                <div style="float:left;"><a name="posicionPorColorcar__propiedades" id="posicionPorColorcar__actores" ></a>
                                  <img id="actores_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('actores', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','actores');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="ACTORES_SINIESTROS" lit="9903405"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWREFERENCIAS"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='1000428'/>"
                                        onclick="f_abrir_axisage023()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="actores_children" style="display:none">
                            <td align="left" colspan = "6">
                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                           
                                <c:set var="title0"><axis:alt f="axisage003" c="TIPO" lit="9901195"/></c:set>   <%-- TIPO --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="CODIGO" lit="1000109"/></c:set>  <%-- CODIGO (CTRAMITAD | SPROFES) --%>
                                <c:set var="title2"><axis:alt f="axisage003" c="NOMBRE" lit="9000759"/></c:set>  <%-- Nombre y Apellidos  --%>
                                <c:set var="title3"><axis:alt f="axisage003" c="CRAMO" lit="100784"/></c:set>  <%--  RAMO --%>
                                <c:set var="title4"><axis:alt f="axisage003" c="CTRAMTE" lit="9001028"/></c:set>  <%-- Tramite --%>
                                <c:set var="title5"><axis:alt f="axisage003" c="VALORs" lit="101159"/></c:set>  <%-- VALOR --%>
                                <c:set var="title7"><axis:alt f="axisage003" c="FFIN" lit="9000527"/></c:set>  <%-- VALOR --%>
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.LSTACTORES}" id="LSTACTORES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                         <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.CODIGO" style="width:5%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.CODIGO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.TTIPO" style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.TTIPO}
                                            </div>
                                        </display:column>
                                       
                                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.NOMBRE"  style="width:25%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.NOMBRE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.RAMO"  style="width:15%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.RAMO}
                                            </div>
                                        </display:column>
                                        <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.TTRAMTE"  style="width:20%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.TTRAMTE}
                                            </div>
                                        </display:column>
                                        <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.VALOR"  style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTACTORES.VALOR}
                                            </div>
                                        </display:column>
                                          <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_SIN_AGENTES.FFIN"  style="width:10%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                <fmt:formatDate value='${LSTACTORES.FFIN}' pattern='dd/MM/yyyy'/>
                                            </div>
                                        </display:column>
                                         <axis:visible f="axisage003" c="NEWREFERENCIAS">
                                        <display:column title="" sortable="false" sortProperty=""  style="width:10%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <%--javascript:f_borrar__('${miListaId['CCODFON']}',this)--%>
                                           <div class="dspIcons"><a href="javascript:f_borrar('${LSTACTORES.ACTOR}','<fmt:formatDate value='${LSTACTORES.FFIN}' pattern='dd/MM/yyyy'/>');"><img onclick="javascript:f_borrar('${LSTACTORES.CODIGO}');" border="0"  src="images/delete.gif"/></a></div>
                                        </display:column>
                                        </axis:visible>
                                    </display:table>                                                        
                                </div>
                            </td> 
                        </tr> 
                        </table>
                        </td> 
                        </tr> 
                        </axis:visible>
                        <%-- BUG 27949 Añadir sección Clase de negocio --%>
                        <axis:visible f="axisage003" c="CCLANEG"> 
                        <tr >
                            <td class="titulocaja" colspan = "6">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <div class="titulo" >
                                    <div style="float:left">
                                        <img src="images/flecha.gif"/>
                                        <axis:alt f="axisage003" c="CCLANEG" lit="9906327"/>
                                    </div>
                                </div>
                               
                                <%-- DisplayTag Clase Negocio --%>
                                <c:set var="title0"></c:set>   <%-- check --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="CCLANEG" lit="9906327"/></c:set>  <%-- Clase Negocio --%>
                                
                                                       
           
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.LISTVALORES.LSTCLASNEGOCIO}" id="LSTCLASNEGOCIO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <axis:visible f="axisage003" c="CCLANEG">
                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            
                                            
                                            <div class="dspIcons">
                                                <input type="checkbox" name="radioCATRIBU"  id="radioCATRIBU"
                                                <c:if test="${LSTCLASNEGOCIO.LSTCLASNEGOCIO_RESULT}"> checked </c:if> />
                                            </div>
                                            
                                        </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisage003" c="CCLANEG">
                                        <display:column title="${title1}" sortable="true" sortProperty="" style="width:60%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${LSTCLASNEGOCIO.TATRIBU}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                       
                                    </display:table>                                                        
                                </div>
                            </td> 
                        </tr>    
                        </axis:visible>
                                               
                        
                        <c:choose>
                        <c:when test="${__configform.axisage003__DESPLEGABLE_DSP_REDCOMERCIAL__visible==true}">
                        
                         <tr  id="tr_DSP_REDCOMERCIAL" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','redcomercial');return true;">
                            <td class="campocaja" colspan="6" id="DSP_REDCOMERCIAL">
                                <div style="float:left;"><a name="posicionPorColorcar__redcomercial" id="posicionPorColorcar__redcomercial" ></a>
                                  <img id="redcomercial_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('redcomercial', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','redcomercial');"
                                       style="cursor:pointer"/>
                                   <b> <axis:alt f="axisage003" c="REDCOMERCIAL" lit="109452"/></b>
                                </div>  
                               <axis:visible f="axisage003" c="NEWREDCOMERCIAL">
                                 <div align="right">
                                        <img border="0" src="images/lapiz.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>"
                                        onclick="f_abrir_axisage004()"
                                        style="cursor:pointer"/>                                                            
                                    </div>  
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="redcomercial_children" style="display:none">
                            <td align="left" colspan = "6">
                           
                           </c:when>
                        <c:otherwise>
                        
                         <tr >
                            <td class="titulocaja" colspan = "6">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <div class="titulo" >
                                    <div style="float:left">
                                        <img src="images/flecha.gif"/>
                                        <axis:alt f="axisage003" c="REDCOMERCIAL" lit="9000520"/>
                                    </div>
                                    <axis:visible f="axisage003" c="NEWREDCOMERCIAL">
                                    <div align="right">
                                        <img border="0" src="images/lapiz.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>"
                                        onclick="f_abrir_axisage004()"
                                        style="cursor:pointer"/>                                                            
                                    </div>  
                                    </axis:visible>
                                </div>
                                </c:otherwise>
                                </c:choose>
                                <%-- DisplayTag Contratos --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="CEMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="NCONTRA" lit="9000536"/></c:set>  <%-- Nº Contrato --%>
                                <c:set var="title2"><axis:alt f="axisage003" c="FECCONT" lit="9000537"/></c:set>  <%-- F. Contrato --%>
           
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTRATOS}" id="CONTRATOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
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
                        
                        
                        
                         <c:choose>
                        <c:when test="${__configform.axisage003__DESPLEGABLE_DSP_REDCOMERCIAL__visible==true}">
                        
                         <tr  id="tr_DSP_MODIFREDCOMERCIAL" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','modifredcomercial');return true;">
                            <td class="campocaja" colspan="6" id="DSP_MODIFREDCOMERCIAL">
                                <div style="float:left;"><a name="posicionPorColorcar__modifredcomercial" id="posicionPorColorcar__modifredcomercial" ></a>
                                	<img id="modifredcomercial_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('modifredcomercial', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','modifredcomercial');"
                                       style="cursor:pointer"/>
                                   <b> <axis:alt f="axisage003" c="REDCOMERCIAL" lit="9000520"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="MODIFREDCOMERCIAL">
                                <div align="right">
                                    <img border="0" src="images/lapiz.gif" 
                                    alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>"
                                    onclick="f_abrir_axisage005()"
                                    style="cursor:pointer"/>                                                            
                                </div>
                                </axis:visible>
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="modifredcomercial_children" style="display:none">
                            <td align="left" colspan = "6">
                           <div class="separador">&nbsp; </div>   
                           </c:when>
                        <c:otherwise>
                        
                        <tr>
                            <td class="titulocaja" colspan = "6">
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                <axis:visible f="axisage003" c="MODIFREDCOMERCIAL">
                                <div align="right">
                                    <img border="0" src="images/lapiz.gif" 
                                    alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>"
                                    onclick="f_abrir_axisage005()"
                                    style="cursor:pointer"/>                                                            
                                </div>
                                </axis:visible>
                                </c:otherwise>
                                </c:choose>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                           
                        
                                <%-- DisplayTag Red Comercial --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="DESDE" lit="104095"/></c:set>  <%-- Desde --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="HASTA" lit="103051"/></c:set>  <%-- Hasta --%>
                                <c:set var="title2"><axis:alt f="axisage003" c="CTIPAGE" lit="9000519"/></c:set> <%-- Tipo Agente --%>
                                <c:set var="title3"><axis:alt f="axisage003" c="GESTOR" lit="1000566"/></c:set> <%-- Gestor --%>
                                <c:set var="title4"><axis:alt f="axisage003" c="NVISIO" lit="9000707"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title5"><axis:alt f="axisage003" c="TIPVISIO" lit="9000708"/></c:set>  <%-- Tipo de visión --%>
                                <c:set var="title6"><axis:alt f="axisage003" c="NVISIO_POL" lit="9902710"/></c:set>  <%-- Nivel de visión --%>
                                <c:set var="title7"><axis:alt f="axisage003" c="TIPVISIO_POL" lit="9902709"/></c:set>  <%-- Tipo de visión --%>
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.HISTORICO}" id="HISTORICO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
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
                                        <axis:visible f="axisage003" c="CPOLVISIO">
                                        <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_REDCOMERCIAL.CPOLVISIO" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">
                                                ${HISTORICO.OB_IAX_REDCOMERCIAL.CPOLVISIO} ${HISTORICO.OB_IAX_REDCOMERCIAL.TPOLVISIO}
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="TPOLNIVEL">
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