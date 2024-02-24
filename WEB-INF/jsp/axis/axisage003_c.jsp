<%/* Revision:# JQCJnf1nfOwsOIzaFqGr2g== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<c:set var="modoModificable" value="${true}"/>
                      
                    
                        <axis:ocultar f="axisage003" c="DSP_ADN" dejarHueco="false">
                            <tr id="tr_DSP_ADN">
                                <td class="titulocaja" colspan = "6" id="td_DSP_ADN" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage003" c="DSP_ADN" lit="9902545"/>
                                        </div>
                                        <axis:ocultar f="axisage003" c="NEWADN" dejarHueco="false">
                                        <div align="right">
                                            <img border="0" src="images/new.gif" 
                                            alt="<axis:alt f='axisage003' c='NEW' lit='1000428'/>" title="<axis:alt f='axisage003' c='NEW' lit='1000428'/>"
                                            onclick="f_abrir_axisage015()"
                                            style="cursor:pointer"/>                                                            
                                        </div> 
                                        </axis:ocultar>
                                    </div>                                                           
                                    </div>                                
                                    <%-- ADN --%>
                                    <c:set var="title0"><axis:alt f="axisage003" c="IIMPORTE" lit="100563"/></c:set>   <%-- IIMPORTE --%>
                                    <c:set var="title1"><axis:alt f="axisage003" c="FINIVIG" lit="104095"/></c:set>  <%-- Nº FINIVIG --%>
                                    <c:set var="title2"><axis:alt f="axisage003" c="FFINVIG" lit="103051"/></c:set>  <%-- Nº FFINVIG --%>
               
                                    <div class="displayspaceGrande">
                                        <display:table name="${__formdata.SOPORTEARP}" id="SOPORTEARP" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisage003.do?paginar=true">
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
                                            
                                            <axis:ocultar f="axisage003" c="EDITADN" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_edit_soporte(${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.CAGENTE},'<fmt:formatDate pattern="dd/MM/yyyy" value="${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.FINIVIG}"/>')" alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" src="images/lapiz.gif"/>
                                                </div>
                                            </display:column>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisage003" c="DELADN" dejarHueco="false">
                                            <display:column title="" style="width:2%" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" style="cursor:pointer;" onclick="f_delete_soporte(${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.CAGENTE},'<fmt:formatDate pattern="dd/MM/yyyy" value="${SOPORTEARP.OB_IAX_SOPORTEARP_AGENTE.FINIVIG}"/>')" alt="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" src="images/delete.gif"/>
                                                </div>
                                            </display:column>
                                            </axis:ocultar>
                                        </display:table>                                                        
                                    </div>
                                </td> 
                            </tr>
                        </axis:ocultar>
                        
                         <%-- Contactos --%>
                        <axis:visible f="axisage003" c="DSP_CONTACTOS"> 
                        <tr onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','contactos');return true;">
                              <td class="campocaja" colspan="6">
                                <div style="float:left;"><a name="posicionPorColorcar__contactos" id="posicionPorColorcar__contactos" ></a>
                                  <img id="contactos_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('contactos', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','contactos');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="CONTACTOS" lit="101025"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWCONTACTOS"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF' lit='1000428'/>"
                                        onclick="f_abrir_axisage020()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="contactos_children" style="display:none">
                           <td align="left" colspan = "6">
                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Contratos --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="TIPO" lit="100565"/></c:set>   <%-- TIPO --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="NOMBRE" lit="105940"/></c:set>  <%-- NOMBRE --%>
                                <c:set var="title2"><axis:alt f="axisage003" c="CARGO" lit="9902638"/></c:set>  <%-- CARGO --%>
                                <c:set var="title3"><axis:alt f="axisage003" c="DOMICILIO" lit="101078"/></c:set>   <%-- DOMICILIO --%>
                                <c:set var="title4"><axis:alt f="axisage003" c="TELEFONO" lit="9000992"/></c:set>  <%-- TELEFONO --%>
                                <c:set var="title5"><axis:alt f="axisage003" c="MOBIL" lit="9903007"/></c:set>  <%-- MOBIL --%>
                                <c:set var="title6"><axis:alt f="axisage003" c="FAX" lit="9903323"/></c:set>   <%-- FAX --%>
                                <c:set var="title7"><axis:alt f="axisage003" c="WEB" lit="9903324"/></c:set>  <%-- WEB --%>
                                <c:set var="title8"><axis:alt f="axisage003" c="EMAIL" lit="9903325"/></c:set>  <%-- EMAIL --%>
           
                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.CONTACTOS}" id="CONTACTOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
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
                                        <axis:visible f="axisage003" c="EDITCONTACTOS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_abrir_axisage020(${CONTACTOS.NORDEN})" alt="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF' lit='9000552'/>" src="images/lapiz.gif"/>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="DELCONTACTOS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_del_contacto(${CONTACTOS.NORDEN})" alt="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE" lit="1000127" />" src="images/delete.gif"/>
                                            </div>
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
                        
                         <%-- Documentos --%>
                        <axis:visible f="axisage003" c="DSP_DOCUMENTOS"> 
                        <tr onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','documentos');return true;">
                              <td class="campocaja" colspan = "6">
                                <div style="float:left;"><a name="posicionPorColorcar__documentos" id="posicionPorColorcar__documentos" ></a>
                                  <img id="documentos_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('documentos', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','documentos');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="LIT_DSP_DOCUM" lit="1000431"/></b>
                                </div>
                                <axis:visible f="axisage003" c="NEWDOCUMENTOS">
                                <div align="right">
                                        <img onclick="f_but_1000615()" border="0" alt="<axis:alt f="axisage003" c="FILE" lit="1000615"/>" 
                                			title="<axis:alt f="axisage003" c="FILE" lit="1000615"/>" src="images/new.gif"/>                                                          
                                    </div> 
                                </axis:visible>
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="documentos_children" style="display:none">
                           <td align="left" colspan = "6">
                           
                           <table class="seccion" >
                            <tr>
                                <td class="titulocaja" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <c:set var="title0"><axis:alt f="axisage003" c="DESCRIPCION" lit="100588"></axis:alt></c:set>
                                    <c:set var="title1"><axis:alt f="axisage003" c="FICHERO" lit="105940"></axis:alt></c:set>
                                    <c:set var="title2"><axis:alt f="axisage003" c="TORIGEN" lit="101162"></axis:alt></c:set>
                                    <c:set var="title3"><axis:alt f="axisage003" c="TUSUARIO" lit="9001356"></axis:alt></c:set>
                                    <c:set var="title4"><axis:alt f="axisage003" c="FALTA" lit="105887"></axis:alt></c:set>
                                    <c:set var="title5"><axis:alt f="axisage003" c="TMOTMOV" lit="100565"></axis:alt></c:set>
                                    <c:set var="title6"><axis:alt f="axisage003" c="TAMANO" lit="9903351"></axis:alt></c:set>
                                    <div class="displayspaceGrande">
                                    <display:table name="${__formdata.DOCUMENTOS}" id="documento" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                requestURI="axis_axisage003.do?paginar=true">
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
                                        <axis:visible f="axisage003" c="EDITDOCUMENTOS">
                                        <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                           <div class="dspIcons"><img border="0"  src="images/lapiz.gif" width="15px" height="15px"
                                                style="cursor:pointer;" onclick="f_modifdocum('${documento.OB_IAX_DOCAGENTE.IDDOCGEDOX}')"/>
                                                </div>
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
						
						<!-- Inicio tarefa 4077 - Borduchi -->
                         <tr>
                        
                        <td class="titulocaja" colspan = "6" id="td_DSP_ADN" >
                                    <div class="separador">&nbsp; </div>                                                                                                                            
                                    <div class="titulo" >
                                        <div style="float:left">
                                            <img src="images/flecha.gif"/>
                                            <axis:alt f="axisage003" c="DSP_ADN" lit="89906314"/>
                                        </div>
                                        </div>
                        	
                        	<table class="area">  
                                <tr>
                                <td>
                                            <!-- DisplayTag datos parametros persona -->
                                            <c:set var="title1"><axis:alt f="axisage003" c="CODIGO" lit="109155"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisage003" c="NOMBRE" lit="101995"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisage003" c="TIPO" lit="100565"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisage003" c="ESTADO" lit="101510"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.USUARIOS}" id="usuario" export="false" class="dsptgtable" pagesize="-1"
                                                     defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisage003.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column headerClass="sortable" title="${title1}" sortable="true" 
                                                        sortProperty="CODIGO" media="html"  autolink="false">
                                                        <div class="dspText">${usuario.CUSUARI}</div>
                                                    </display:column>
                                                    <display:column headerClass="sortable" title="${title2}" sortable="true" 
                                                        sortProperty="NOMBRE" media="html"  autolink="false">
                                                        <div class="dspText">${usuario.TUSUNOM}</div>
                                                    </display:column>
                                                    <display:column headerClass="sortable" title="${title3}" sortable="true" 
                                                        sortProperty="TIPO" media="html"  autolink="false">
                                                        <div class="dspText">${usuario.TIPO}</div>
                                                    </display:column>
                                                    <display:column headerClass="sortable" title="${title4}" sortable="true" 
                                                        sortProperty="ESTADO" media="html"  autolink="false">
                                                        <div class="dspText">${usuario.ESTATUS}</div>
                                                    </display:column>
                                                </display:table>
                                            </div>
                                            </td>
                                            </tr>
                                            </table>
                        	
                        	</td>
                        </tr>
                        <!-- Fin tarefa 4077 - Borduchi -->
                    
                        <axis:visible c="DSP_PROPIEDADES" f="axisage003">
                              
                        <tr onclick="objSeccion.actualizarPosicionPorColocarCookie('axisage003','propiedades');return true;">
                            <td class="campocaja" colspan="6" id="DSP_PROPIEDADES">
                                <div style="float:left;"><a name="posicionPorColorcar__propiedades" id="posicionPorColorcar__propiedades" ></a>
                                  <img id="propiedades_parent" src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('propiedades', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','propiedades');" 
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="DSP_PARPER" lit="9000580"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWPROPIEDADES">
                                <div align="right">
                                        <img border="0" alt='<axis:alt f="axisage003" c="LIT_EDITAR" lit="100002"/>'
                                         title='<axis:alt f="axisage003" c="LIT_EDITAR" lit="100002"/>' src="images/lapiz.gif"
                                            onclick="f_abrir_axisage022()" style="cursor:pointer"/>                                                        
                                </div> 
                                </axis:visible>
                                <div style="clear:both;"><hr class="titulo"></hr></div>
                            </td>
                        </tr>
                        <tr id="propiedades_children" style="display:none">
                            <td align="left" colspan = "6">
			                           
			                           <table class="seccion" >
                                        <tr>
                                            <td align="right">
                                            <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right" >  
                                <tr>
                                <td>
                                            <!-- DisplayTag datos parametros persona -->
                                            <c:set var="title1"><axis:alt f="axisage003" c="TPARAM" lit="9001819"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisage003" c="TVALPAR" lit="101159"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.PROPIEDADES}" id="T_IAX_PARAGE" export="false" class="dsptgtable" pagesize="-1"
                                                     defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisage003.do?paginar=true">
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
                                                            <div class="dspText">
                                                                <fmt:formatDate value="${T_IAX_PARAGE.FVALPAR}" pattern="dd/MM/yyyy"/>
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
                        
                        <%-- Entidades --%>
                        <axis:visible f="axisage003" c="DSP_ENTIDADES"> 
                        
                         <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right">  
                        <tr>
                              <td class="campocaja" colspan="6" id="DSP_ENTIDADES">
                                <div style="float:left;">
                                  <img id="entidades_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('entidades', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','entidades');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="ENTIDADES" lit="106017"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWENTIDADES"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF_ENTIDADES' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF_ENTIDADES' lit='1000428'/>"
                                        onclick="f_abrir_axisage024()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="entidades_children" style="display:none">
                           <td align="left" colspan = "6">
                           
                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Entidades --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="TTIPENTIDADASEG" lit="9001624"/></c:set>   <%-- TIPO --%>

                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.ENTIDADESASEG}" id="ENTIDADESASEG" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_AGE_ENTIDADESASEG.CTIPENTIDADASEG"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">                     
                                                ${ENTIDADESASEG.OB_IAX_AGE_ENTIDADASEG.TTIPENTIDADASEG} 
                                            </div>
                                        </display:column>
                                      
                                        <axis:visible f="axisage003" c="EDITENTIDADES">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_abrir_axisage024(${ENTIDADESASEG.OB_IAX_AGE_ENTIDADASEG.CTIPENTIDADASEG})" alt="<axis:alt f='axisage003' c='MODIF_ENTIDADES' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF_ENTIDADES' lit='9000552'/>" src="images/lapiz.gif"/>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="DELENTIDADES">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">                                         
                                                <img border="0" style="cursor:pointer;" onclick="f_del_entidadaseg(${ENTIDADESASEG.OB_IAX_AGE_ENTIDADASEG.CTIPENTIDADASEG})" alt="<axis:alt f="axisage003" c="DELETE_ENTIDADES" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE_ENTIDADES" lit="1000127" />" src="images/delete.gif"/>
                                            </div>
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
                        </tr>
                        </axis:visible>
                        
                        <%-- Asociaciones --%>
                        <axis:visible f="axisage003" c="DSP_ASOCIACIONES"> 
                         <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right">  
                        <tr>
                              <td class="campocaja" colspan="6" id="DSP_ASOCIACIONES">
                                <div style="float:left;">
                                  <img id="asociaciones_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('asociaciones', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','asociaciones');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="ASOCIACIONES" lit="9903674"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWASOCIACIONES"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF_ASOCIACIONES' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF_ASOCIACIONES' lit='1000428'/>"
                                        onclick="f_abrir_axisage025()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="asociaciones_children" style="display:none">
                           <td align="left" colspan = "6">
                           
                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Asociaciones --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="TTIPASOCIACION" lit="9903675"/></c:set>   <%-- TIPO --%>
                                <c:set var="title1"><axis:alt f="axisage003" c="NUMCOLEGIADO" lit="9000534"/></c:set>   <%-- TIPO --%>

                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.ASOCIACIONES}" id="ASOCIACIONES" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_AGE_ASOCIACION.CTIPASOCIACION"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">                     
                                                ${ASOCIACIONES.OB_IAX_AGE_ASOCIACION.TTIPASOCIACION} 
                                            </div>
                                        </display:column>
                                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_AGE_ASOCIACION.NUMCOLEGIADO"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">                     
                                                ${ASOCIACIONES.OB_IAX_AGE_ASOCIACION.NUMCOLEGIADO} 
                                            </div>
                                        </display:column>
                                      
                                        <axis:visible f="axisage003" c="EDITASOCIACIONES">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_abrir_axisage025(${ASOCIACIONES.OB_IAX_AGE_ASOCIACION.CTIPASOCIACION},'${ASOCIACIONES.OB_IAX_AGE_ASOCIACION.NUMCOLEGIADO}')" alt="<axis:alt f='axisage003' c='MODIF_ASOCIACIONES' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF_ASOCIACIONES' lit='9000552'/>" src="images/lapiz.gif"/>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="DELASOCIACIONES">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">                                         
                                                <img border="0" style="cursor:pointer;" onclick="f_del_asociacion(${ASOCIACIONES.OB_IAX_AGE_ASOCIACION.CTIPASOCIACION})" alt="<axis:alt f="axisage003" c="DELETE_ASOCIACIONES" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE_ASOCIACIONES" lit="1000127" />" src="images/delete.gif"/>
                                            </div>
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
                        </tr>
                        </axis:visible>
                        
                        <%-- Bancos --%>
                     
                        <axis:visible c="DSP_BANCOS" f="axisage003" > 
                         <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right">  
                        <tr>
                              <td class="campocaja" colspan = "6" id="DSP_BANCOS">
                                <div style="float:left;">
                                  <img id="bancos_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('bancos', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','bancos');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="BANCOS" lit="9002273"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWBANCOS"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF_BANCOS' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF_BANCOS' lit='1000428'/>"
                                        onclick="f_abrir_axisage026()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="bancos_children" style="display:none">
                           <td align="left" colspan = "6">
                           
                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Bancos --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="TTIPBANCO" lit="9000964"/></c:set>   <%-- TIPO --%>

                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.BANCOS}" id="BANCOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_AGE_BANCO.CTIPBANCO"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">                     
                                                ${BANCOS.OB_IAX_AGE_BANCO.TTIPBANCO} 
                                            </div>
                                        </display:column>
                                      
                                        <axis:visible f="axisage003" c="EDITBANCOS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_abrir_axisage026(${BANCOS.OB_IAX_AGE_BANCO.CTIPBANCO})" alt="<axis:alt f='axisage003' c='MODIF_BANCOS' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF_BANCOS' lit='9000552'/>" src="images/lapiz.gif"/>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="DELBANCOS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">                                         
                                                <img border="0" style="cursor:pointer;" onclick="f_del_banco(${BANCOS.OB_IAX_AGE_BANCO.CTIPBANCO})" alt="<axis:alt f="axisage003" c="DELETE_BANCOS" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE_BANCOS" lit="1000127" />" src="images/delete.gif"/>
                                            </div>
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
                        </tr>
                        </axis:visible>
                        
                        <%-- Referencias --%>
                        <axis:visible f="axisage003" c="DSP_REFERENCIAS"> 
                         <tr>
                                <td class="campocaja">                              
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <div class="separador">&nbsp;</div>
                                
                                <table class="area" align="right">  
                        <tr>
                              <td class="campocaja" colspan = "6" id="DSP_REFERENCIAS">
                                <div style="float:left;">
                                  <img id="referencias_parent"
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('referencias', this);objSeccion.actualizarSeccionPorAbrirCookie('axisage003','referencias');"
                                       style="cursor:pointer"/>
                                   <b><axis:alt f="axisage003" c="REFERENCIAS" lit="9903676"/></b>
                                </div>  
                                <axis:visible f="axisage003" c="NEWREFERENCIAS"> 
                                <div align="right">
                                        <img border="0" src="images/new.gif" 
                                        alt="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='1000428'/>" title="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='1000428'/>"
                                        onclick="f_abrir_axisage027()"
                                        style="cursor:pointer"/>                                                            
                                    </div> 
                                </axis:visible> 
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                        </tr>
                        <tr id="referencias_children" style="display:none">
                           <td align="left" colspan = "6">

                           
                           <table class="seccion" >
                           <tr>
                            <td class="titulocaja" >
                                <div class="separador">&nbsp; </div>                                                                                                                            
                                
                                <%-- DisplayTag Referencias --%>
                                <c:set var="title0"><axis:alt f="axisage003" c="TREFERENCIA" lit="9001285"/></c:set>   <%-- TIPO --%>                                

                                <div class="displayspaceGrande">
                                    <display:table name="${__formdata.REFERENCIAS}" id="REFERENCIAS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisage003.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_AGE_REFERENCIA.NORDREFERENCIA"  headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">                     
                                                ${REFERENCIAS.OB_IAX_AGE_REFERENCIA.TREFERENCIA} 
                                            </div>
                                        </display:column>                                       
                                      
                                        <axis:visible f="axisage003" c="EDITREFERENCIAS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <img border="0" style="cursor:pointer;" onclick="f_abrir_axisage027(${REFERENCIAS.OB_IAX_AGE_REFERENCIA.NORDREFERENCIA},'${REFERENCIAS.OB_IAX_AGE_REFERENCIA.TREFERENCIA}')" alt="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='9000552'/>" title="<axis:alt f='axisage003' c='MODIF_REFERENCIAS' lit='9000552'/>" src="images/lapiz.gif"/>
                                            </div>
                                        </display:column>
                                        </axis:visible>
                                        <axis:visible f="axisage003" c="DELREFERENCIAS">
                                        <display:column title="" style="width:4%" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspIcons">                                         
                                                <img border="0" style="cursor:pointer;" onclick="f_del_referencia(${REFERENCIAS.OB_IAX_AGE_REFERENCIA.NORDREFERENCIA})" alt="<axis:alt f="axisage003" c="DELETE_REFERENCIAS" lit="1000127" />" title="<axis:alt f="axisage003" c="DELETE_REFERENCIAS" lit="1000127" />" src="images/delete.gif"/>
                                            </div>
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
                        </tr>
                        </axis:visible>
                        </td>
                        </tr>
                        </table>
                        
                        
                   <c:import url="axisage003_e.jsp"/>
                       
                        
                    </table>   
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage003</c:param><c:param name="__botones">salir<axis:visible f="axisage003" c="BT_PROD_USU" >,9905728</axis:visible><axis:visible f="axisage003" c="BT_PROD_USU" >,102177</axis:visible><axis:visible f="axisage003" c="BT_ACEPTAR">,aceptar</axis:visible></c:param></c:import>
        <div class="separador">&nbsp; </div>                                        
                                                                                
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FBAJAGE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FBAJAGE", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINIVIGCOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGCOM", 
            singleClick    :    true,
            firstDay       :    1
        });            
        
         Calendar.setup({
            inputField     :    "FFINVIGCOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIGCOM", 
            singleClick    :    true,
            firstDay       :    1
        });   
        
      Calendar.setup({
            inputField     :    "FINIVIGCOM_INDIRECT",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGCOM_INDIRECT", 
            singleClick    :    true,
            firstDay       :    1
        });  
       
        
        
        Calendar.setup({
            inputField     :    "FINIVIGSOBRECOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGSOBRECOM", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINVIGSOBRECOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIGSOBRECOM", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINIVIGDESC",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGDESC", 
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FFINVIGDESC",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIGDESC", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FRECEPCONTRA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FRECEPCONTRA", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FALTASOC",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "FALTASOC_ICO", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINSDGS",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINSDGS", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINCREDITO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINCREDITO", 
            singleClick    :    true,
            firstDay       :    1
        });
    
    Calendar.setup({
            inputField     :    "FULTREV",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FULTREV", 
            singleClick    :    true,
            firstDay       :    1
        });

    Calendar.setup({
            inputField     :    "FULTCKC",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FULTCKC", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>

</body>
</html> 
 
  
