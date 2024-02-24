<%/* Revision:# ADEWCUP9LePoc/1EuJrncQ== # */%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

						<!-- *************************  FICHA FINANCIERA  ****************** -->
                        <!-- *************************  FICHA TECNICA  ********************* -->
                        <axis:visible c="DSP_FICHATECNICA" f="axisper009">
                            <c:if test="${__formdata.T_IAX_FINANCIERA==null}">
 
                                <div class="titulo">
                                    <b><axis:alt f="axisper009" c="LIT10" lit="9909064"/></b>
                                </div>
                                
                                <table class="seccion">
                                    <!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
                                    <axis:visible f="axisper009" c="BT_NVFIC">
                                        <c:if test="${__formdata.fichaTecnica.lstGeneral==NULL}">
                                            <div style="float:right;">
                                                <img border="0"
                                                     alt='<axis:alt f="axisper009" c="LIT11" lit="9909133"/>'
                                                     title='<axis:alt f="axisper009" c="LIT12" lit="9909133"/>'
                                                     src="images/new.gif"
                                                     onclick="f_abrir_axisfic001(null, '${dades_persona.SPERSON}', 0, '${dades_persona.CTIPPER}')"/>                       
                                            </div>
                                        </c:if>
                                    </axis:visible> 
				    <!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
									
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisper009" c="LIT13" lit="1000109"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisper009" c="LIT14" lit="9909134"/></c:set>
                                            <div class="displayspace">
                                                <display:table name="${__formdata.fichaTecnica.lstGeneral}"
                                                               id="idLstGeneral"
                                                               export="false"
                                                               class="dsptgtable"
                                                               pagesize="-1"
                                                               defaultsort="1"
                                                               defaultorder="ascending"
                                                               sort="list"
                                                               cellpadding="0"
                                                               cellspacing="0"
                                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                                               <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title1}"
                                                                          sortable="true"
                                                                          sortProperty="SFINANCI"
                                                                          headerClass="headwidth5 sortable fixed"
                                                                          media="html"
                                                                          autolink="false">
                                                            <div class="dspText">
                                                              ${idLstGeneral.SFINANCI}
                                                            </div>
                                                         </display:column>
                                                         <display:column title="${title2}"
                                                                  sortable="true"
                                                                  sortProperty="TDESCRIP"
                                                                  headerClass="sortable fixed"
                                                                  media="html"
                                                                  autolink="false">
                                                                <div class="dspText">
                                                                  ${idLstGeneral.TDESCRIP}
                                                                </div>
                                                         </display:column>
							 <!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
                                                         <axis:visible f="axisper009" c="BT_EDITFIC"><!--IAXIS-4854-->
                                                            <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_DIRECCION__visible != 'false'}">
                                                                <display:column title=""
                                                                                sortable="false"
                                                                                sortProperty=""
                                                                                headerClass="headwidth5 sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspIcons">
                                                                    
                                                                      <img border="0"
                                                                           alt="<axis:alt f='axisper009' c='LIT20' lit='100002'/> <axis:alt f='axisper009' c='LIT20' lit='9909064'/>"
                                                                           title="<axis:alt f='axisper009' c='LIT21' lit='100002'/> <axis:alt f='axisper009' c='LIT21' lit='9909064'/>"
                                                                           src="images/lapiz.gif"
                                                                           onclick="f_abrir_axisfic001('${idLstGeneral.SFINANCI}','${idLstGeneral.SPERSON}', 2,'${dades_persona.CTIPPER}')"/>
                                                                    
                                                                    </div>
                                                                </display:column>
                                                            </c:if>
                                                        </axis:visible>
							<!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
							<!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
                                                        <axis:visible f="axisper009" c="BT_DETALLE">
                                                            <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_DIRECCION__visible != 'false'}">
                                                                <display:column title=""
                                                                                sortable="false"
                                                                                sortProperty=""
                                                                                headerClass="headwidth5 sortable fixed"
                                                                                media="html"
                                                                                autolink="false">
                                                                    <div class="dspIcons">
                                                                    
                                                                      <img border="0"
                                                                           alt="<axis:alt f='axisper009' c='LIT20' lit='1000113'/> <axis:alt f='axisper009' c='LIT20' lit='9909064'/>"
                                                                           title="<axis:alt f='axisper009' c='LIT21' lit='1000113'/> <axis:alt f='axisper009' c='LIT21' lit='9909064'/>"
                                                                           src="images/mas.gif"
                                                                           onclick="f_abrir_axisfic001('${idLstGeneral.SFINANCI}','${dades_persona.SPERSON}', 1, '${dades_persona.CTIPPER}')"/>
                                                                    
                                                                    </div>
                                                                </display:column>
                                                            </c:if>
                                                        </axis:visible>
							<!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
                                                </display:table>
                                            </div>  
                                        </td>
                                    </tr>  
                                </table>
                            </c:if>
                        </axis:visible>     
                        <!-- *************************  FICHA TECNICA  ********************* -->
                        <!-- *************************  FICHA FINANCIERA  ****************** -->

                        <div class="titulo">
                                  <b><axis:alt f="axisper009" c="LIT10" lit="9000411"/></b>
                                </div>
                                <table class="seccion">
                                  <axis:visible f="axisper009" c="BT_NVDIR">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_DIRECCION__visible != 'false'}">
                                    <div style="float:right;">
                                      
                                        <img border="0"
                                             alt='<axis:alt f="axisper009" c="LIT11" lit="1000437"/>'
                                             title='<axis:alt f="axisper009" c="LIT12" lit="1000437"/>'
                                             src="images/new.gif"
                                             onclick="f_abrir_axisper012(null,'${dades_persona.SPERSON}')"/>
                                      
                                    </div>
                                  </c:if>
                                  </axis:visible>
                                  
                                  <tr>
                                    <td>
                                      <c:set var="title1"> <axis:alt f="axisper009" c="LIT13" lit="1000082"/></c:set>
                                      <c:set var="title2"><axis:alt f="axisper009" c="LIT14" lit="1000375"/></c:set>
                                      <c:set var="title3"><axis:alt f="axisper009" c="LIT15" lit="101078"/></c:set>
                                      <c:set var="title4"><axis:alt f="axisper009" c="LIT16" lit="100823"/></c:set>
                                      <c:set var="title5"><axis:alt f="axisper009" c="LIT17" lit="100817"/></c:set>
                                      <c:set var="title6"><axis:alt f="axisper009" c="LIT18" lit="100756"/></c:set>
                                      <c:set var="title7"><axis:alt f="axisper009" c="LIT19" lit="100816"/></c:set>
                                      <c:set var="title8"><axis:alt f="axisper009" c="LIT19" lit="9910234"/></c:set>  <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                                      <div class="displayspace">
                                        <display:table name="${dades_persona.DIRECCIONES}"
                                                       id="T_IAX_DIRECCIONES"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="1"
                                                       defaultorder="ascending"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0"
                                                       requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                          <%@ include file="../include/displaytag.jsp"%>
                                          <display:column title="${title1}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.CDOMICI"
                                                          headerClass="headwidth5 sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}
                                            </div>
                                          </display:column>
                                          
                                          <display:column title="${title2}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TTIPDIR"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TTIPDIR}
                                            </div>
                                          </display:column>
                                          <display:column title="${title3}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TDOMICI"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TDOMICI}
                                            </div>
                                          </display:column>
                                          <axis:visible c="CPOSTAL" f="axisper009">
                                          <display:column title="${title4}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.CPOSTAL"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CPOSTAL}
                                            </div>
                                          </display:column>
                                          </axis:visible>
                                          <display:column title="${title5}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TPOBLAC"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPOBLAC}
                                            </div>
                                          </display:column>
                                          <display:column title="${title6}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TPROVIN"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPROVIN}
                                            </div>
                                          </display:column>
                                          <display:column title="${title7}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TPAIS"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TPAIS}
                                            </div>
                                          </display:column>
                                          <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                                          <axis:visible f="axisper009" c="TALIAS">
                                          <display:column title="${title8}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_DIRECCIONES.TALIAS"
                                                          headerClass="sortable fixed"
                                                          media="html"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.TALIAS}
                                            </div>
                                          </display:column>
                                          </axis:visible>
                                          <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                                          <axis:visible f="axisper009" c="BT_EDITDIR">
                                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_DIRECCION__visible != 'false'}">
                                            <display:column title=""
                                                            sortable="false"
                                                            sortProperty=""
                                                            headerClass="headwidth5 sortable fixed"
                                                            media="html"
                                                            autolink="false">
                                              <div class="dspIcons">
                                                
                                                  <img border="0"
                                                       alt="<axis:alt f='axisper009' c='LIT20' lit='100002'/> <axis:alt f='axisper009' c='LIT20' lit='105889'/>"
                                                       title="<axis:alt f='axisper009' c='LIT21' lit='100002'/> <axis:alt f='axisper009' c='LIT21' lit='105889'/>"
                                                       src="images/lapiz.gif"
                                                       onclick="f_abrir_axisper012('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}','${dades_persona.SPERSON}')"/>
                                                
                                              </div>
                                            </display:column>
                                          </c:if>
                                          </axis:visible>
                                          <axis:visible f="axisper009" c="BT_DELDIR">
                                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_DIRECCION__visible != 'false'}">
                                            <display:column title=""
                                                            sortable="false"
                                                            sortProperty=""
                                                            headerClass="headwidth5 sortable fixed"
                                                            media="html"
                                                            autolink="false">
                                              <div class="dspIcons">
                                                
                                                  <img border="0"
                                                       alt="<axis:alt f='axisper009' c='LIT22' lit='1000127'/> <axis:alt f='axisper009' c='LIT22' lit='105889'/>"
                                                       title="<axis:alt f='axisper009' c='LIT23' lit='1000127'/> <axis:alt f='axisper009' c='LIT23' lit='105889'/>"
                                                       src="images/delete.gif"
                                                       onclick="f_borrar_DIRECCION('${T_IAX_DIRECCIONES.OB_IAX_DIRECCIONES.CDOMICI}','${dades_persona.SPERSON}')"/>
                                                
                                              </div>
                                            </display:column>
                                          </c:if>
                                          </axis:visible>
                                        </display:table>
                                      </div>
                                      <axis:visible f="axisper009" c="DSP_DIRECCIONES_AUT"> 
                                     <table>                                     
                                         <tr>
                                            <td class="campocaja" >                                               
                                                <img id="DSP_DIRECCIONES_AUT_parent" src="images/mes.gif" 
                                                onclick="objEstilos.toggleDisplay('DSP_DIRECCIONES_AUT', this)" 
                                                style="cursor:pointer"/>                                                 
                                                <b id="label_DSP_DIRECCIONES_AUT"><axis:alt f="axisper009" c="LIT10" lit="9903217" /></b>   
                                             <div style="clear:both;">
                                                    <hr class="titulo"></hr>
                                             </div>
                                             </td>
                                        </tr>
                                        <tr id="DSP_DIRECCIONES_AUT_children" style="display:none"> 
                                            <td>
                                        <c:set var="title1"><axis:alt f="axisper009" c="CDOMICI" lit="1000082"/></c:set>
                                        <c:set var="title2"><axis:alt f="axisper009" c="TTIPDIR" lit="1000375"/> </c:set>
                                        <c:set var="title3"><axis:alt f="axisper009" c="TDOMICI" lit="101078"/></c:set>
                                        <c:set var="title4"><axis:alt f="axisper009" c="CPOSTAL" lit="100823"/></c:set>
                                        <c:set var="title5"><axis:alt f="axisper009" c="TPOBLAC" lit="100817"/></c:set>
                                        <c:set var="title6"><axis:alt f="axisper009" c="TPROVIN" lit="100756"/></c:set>
                                        <c:set var="title7"><axis:alt f="axisper009" c="TPAIS" lit="100816"/></c:set>
                                        <c:set var="title8"><axis:alt f="axisper009" c="CUSUMOD" lit="9903220"/></c:set>
                                        <c:set var="title9"><axis:alt f="axisper009" c="FBAJA" lit="9000447"/></c:set>
                                        <c:set var="title10"><axis:alt f="axisper009" c="FUSUMOD" lit="9903221"/></c:set>
                                              <c:set var="title11"><axis:alt f="axisper009" c="TESTADO" lit="100587"/></c:set>
                                             
                                              <div class="displayspace">
                                                <display:table name="${dades_persona.AUTORIZACIONES.DIRECCIONES_AUT}" id="T_IAX_AUTORIZACIONES" export="false" class="dsptgtable"
                                                               pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                                  <%@ include file="../include/displaytag.jsp"%>
                                                  <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CDOMICI"
                                                                  headerClass="headwidth5 sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.CDOMICI}</div>
                                                  </display:column>
                                                  <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TTIPDIR"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.TTIPDIR} </div>
                                                  </display:column>
                                                  <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TDOMICI"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.TDOMICI}</div>
                                                  </display:column>
                                                  <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CPOSTAL"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.CPOSTAL}</div>
                                                  </display:column>
                                                  <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPOBLAC"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.TPOBLAC}</div>
                                                  </display:column>
                                                  <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPROVIN"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.TPROVIN}</div>
                                                  </display:column>
                                                  <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPAIS"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.TPAIS} </div>
                                                  </display:column>
                                                   <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.CPOSTAL"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"> ${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.CUSUMOD}</div>
                                                  </display:column>
                                                  <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPOBLAC"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.FBAJA}"/></div>
                                                  </display:column>
                                                  <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPROVIN"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.FUSUMOD}"/></div>
                                                  </display:column>
                                                  <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_DIRECCIONES.TPAIS"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                    <div class="dspText">${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.TESTADO} </div>
                                                  </display:column>
                                                  <axis:visible f="axisper009" c="BT_EDITAUTDIR">
                                                    
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                                                    media="html" autolink="false">
                                                      <div class="dspIcons">
                                                            <c:if test="${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.CESTADO == 1}">
                                                            <img border="0"
                                                               alt="<axis:alt f='axisper009' c='BT_EDITAUTDIR' lit='9903263'/>"
                                                               title="<axis:alt f='axisper009' c='BT_EDITAUTDIR' lit='9903263'/>"
                                                               src="images/lapiz.gif"
                                                               onclick="f_abrir_axisper028('${dades_persona.SPERSON}','${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.CDOMICI}','${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.NORDEN}','NEW')"/>
                                                            </c:if>
                                                      </div>
                                                    </display:column>
                                                    
                                                  </axis:visible>
                                                  <axis:visible f="axisper009" c="BT_CONAUTDIR">
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                                                    media="html" autolink="false">
                                                      <div class="dspIcons">
                                                            <img border="0"
                                                               alt="<axis:alt f='axisper009' c='BT_CONAUTDIR' lit='9903264'/>"
                                                               title="<axis:alt f='axisper009' c='BT_CONAUTDIR' lit='9903264'/>"
                                                               src="images/mes.gif"
                                                               onclick="f_abrir_axisper028('${dades_persona.SPERSON}','${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.DIRECCION.CDOMICI}','${T_IAX_AUTORIZACIONES.OB_IAX_DIRECCIONES_AUT.NORDEN}','MODIF')"/>
                                                       </div>
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
                         
                        </table> 
                    
                        <div class="titulo">
                          <b><axis:alt f="axisper009" c="DSP_CONTACTOS" lit="101025"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisper009" c="BT_NVCONTACTO">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_CONTACTO__visible != 'false'}">
                            <div style="float:right;">
                              
                                <img border="0"
                                     alt='<axis:alt f="axisper009" c="LIT24" lit="9000422"/>'
                                     title='<axis:alt f="axisper009" c="LIT24" lit="9000422"/>'
                                     src="images/new.gif"
                                     onclick="f_abrir_axisper011_n('${dades_persona.SPERSON}', 'POL')"/>
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                            <td>
                              <c:set var="title1"><axis:alt f="axisper009" c="CMODCON" lit="1000109"/></c:set>
                              <c:set var="title2"><axis:alt f="axisper009" c="LIT26" lit="1000616"/></c:set>
                              <c:set var="title3"><axis:alt f="axisper009" c="LIT27" lit="1000617"/></c:set>
                              <c:set var="title4"><axis:alt f="axisper009" c="TCOMCON" lit="9000759"/></c:set>
                              <c:set var="title5"><axis:alt f="axisper009" c="CDOMICI" lit="105889"/></c:set>
                              <c:set var="title6"><axis:alt f="axisper009" c="CPREFIX" lit="9908159"/></c:set>
                              
                              <div class="displayspace">
                                <display:table name="${dades_persona.CONTACTOS}"
                                               id="T_IAX_CONTACTOS"
                                               export="false" class="dsptgtable"
                                               pagesize="-1" defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CMODCON"
                                                  headerClass="headwidth5 sortable fixed"
                                                  media="html" style="width:5%"
                                                  autolink="false">
                                    <div class="dspText">
                                          ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TTIPCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:25%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TTIPCON}
                                    </div>
                                  </display:column>
                                  
                                  <axis:visible f="axisper009" c="CPREFIX">
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CPREFIX"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:10%"
                                                  autolink="false">
                                    <div class="dspText">
                                      <c:if test="${!empty T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}">
                                      +
                                      </c:if>
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TVALCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:30%"
                                                  autolink="false">
                                    
                                    	<c:if test="${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CTIPCON==8}">
                                      			<a href="javascript:window.open('http://${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TVALCON}')">${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TVALCON}</a>
                                      </c:if>
                                      <c:if test="${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CTIPCON!=8}">
                                      		<div class="dspText">${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TVALCON}</div>
                                      </c:if>
                                    
                                  </display:column>
                                  <axis:visible f="axisper009" c="TCOMCON">
                                    <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.TCOMCON"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:20%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TCOMCON}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                
                                   <axis:visible f="axisper009" c="CDOMICI">
                                    <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CONTACTOS.CDOMICI"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:20%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.TDOMICI}
                                    
                                         </div>
                                  </display:column>
                                  </axis:visible>
                                   
                                  <axis:visible f="axisper009" c="BT_EDITCONTACTO">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_CONTACTO__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='LIT28' lit='9000423'/>"
                                               title="<axis:alt f='axisper009' c='LIT29' lit='9000423'/>"
                                               src="images/lapiz.gif"
                                               onclick="f_abrir_axisper011('${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CPREFIX}','${dades_persona.SPERSON}', 'POL')"/>
                                        
                                      </div>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  <axis:visible f="axisper009" c="BT_DELCONTACTO">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_CONTACTO__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='LIT30' lit='9000424'/>"
                                               title="<axis:alt f='axisper009' c='LIT31' lit='9000424'/>"
                                               src="images/delete.gif"
                                               onclick="f_borrar_CONTACTO('${T_IAX_CONTACTOS.OB_IAX_CONTACTOS.CMODCON}','${dades_persona.SPERSON}')"/>
                                        
                                      </div>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                </display:table>
                              </div>
                                <axis:visible f="axisper009" c="DSP_CONTACTOS_AUT"> 
                                      <table>
                                        <tr>                                         
                                            <td class="campocaja" >                                               
                                                <img id="DSP_CONTACTOS_AUT_parent" src="images/mes.gif" 
                                                onclick="objEstilos.toggleDisplay('DSP_CONTACTOS_AUT', this)" 
                                                style="cursor:pointer"/> 
                                                   <b id="label_DSP_CONTACTOS_AUT"><axis:alt f="axisper009" c="LIT10" lit="9903217" /></b>                                            
                                                <div style="clear:both;">
                                                    <hr class="titulo"></hr>
                                               </div>
                                            </td>
                                        </tr>
                                        <tr id="DSP_CONTACTOS_AUT_children" style="display:none">                                                                                
                                            <td>
                                              <c:set var="title1"> <axis:alt f="axisper009" c="CMODCON" lit="1000109"/></c:set>
                                              <c:set var="title2"><axis:alt f="axisper009" c="TTIPCON" lit="1000616"/> </c:set>
                                              <c:set var="title3"><axis:alt f="axisper009" c="TVALCON" lit="1000617"/> </c:set>
                                              <c:set var="title8"><axis:alt f="axisper009" c="CUSUMOD" lit="9903220"/></c:set>
                                              <c:set var="title9"><axis:alt f="axisper009" c="FBAJA" lit="9000447"/></c:set>
                                              <c:set var="title10"><axis:alt f="axisper009" c="FUSUMOD" lit="9903221"/></c:set>
                                              <c:set var="title11"><axis:alt f="axisper009" c="TESTADO" lit="100587"/></c:set>
                                              
                                              <div class="displayspace">
                                                <display:table name="${dades_persona.AUTORIZACIONES.CONTACTOS_AUT}" id="T_IAX_CONTACTOS" export="false" class="dsptgtable"
                                                            pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                            requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CONTACTOS.CMODCON"
                                                                    headerClass="headwidth5 sortable fixed" media="html" style="width:10%" autolink="false">
                                                        <div class="dspText"> ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CONTACTO.CMODCON}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CONTACTOS.TTIPCON"
                                                            headerClass="sortable fixed" media="html" style="width:35%" autolink="false">
                                                        <div class="dspText">${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CONTACTO.TTIPCON}</div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CONTACTOS.TVALCON"
                                                                    headerClass="sortable fixed" media="html" style="width:45%" autolink="false">
                                                        <div class="dspText">${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CONTACTO.TVALCON}</div>
                                                    </display:column>
                                                    <display:column title="${title8}" sortable="true" sortProperty="OB_IAX_CONTACTOS_AUT.CUSUMOD"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                     <div class="dspText"> ${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CUSUMOD}</div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="true" sortProperty="OB_IAX_CONTACTOS_AUT.FBAJA"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.FBAJA}"/></div>
                                                    </display:column>
                                                    <display:column title="${title10}" sortable="true" sortProperty="OB_IAX_CONTACTOS_AUT.FUSUMOD"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                      <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.FUSUMOD}"/></div>
                                                    </display:column>
                                                    <display:column title="${title11}" sortable="true" sortProperty="OB_IAX_CONTACTOS_AUT.TESTADO"
                                                                  headerClass="sortable fixed" media="html" autolink="false">
                                                      <div class="dspText">${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.TESTADO} </div>
                                                    </display:column>
                                                  <axis:visible f="axisper009" c="BT_EDITAUTOCON">
                                                    
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                                                    media="html" autolink="false">
                                                      <div class="dspIcons">
                                                            <c:if test="${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CESTADO == 1}">
                                                            <img border="0"
                                                               alt="<axis:alt f='axisper009' c='BT_EDITAUTOCON' lit='9903262'/>"
                                                               title="<axis:alt f='axisper009' c='BT_EDITAUTOCON' lit='9903262'/>"
                                                               src="images/lapiz.gif"
                                                               onclick="f_abrir_axisper029('${dades_persona.SPERSON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CONTACTO.CMODCON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.NORDEN}','NEW')"/>
                                                            </c:if>
                                                      </div>
                                                    </display:column>
                                                    
                                                  </axis:visible>
                                                  <axis:visible f="axisper009" c="BT_CONAUTOCON">
                                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable fixed"
                                                                    media="html" autolink="false">
                                                      <div class="dspIcons">
                                                            <img border="0"
                                                               alt="<axis:alt f='axisper009' c='BT_CONAUTOCON' lit='9903264'/>"
                                                               title="<axis:alt f='axisper009' c='BT_CONAUTOCON' lit='9903264'/>"
                                                               src="images/mes.gif"
                                                               onclick="f_abrir_axisper029('${dades_persona.SPERSON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.CONTACTO.CMODCON}','${T_IAX_CONTACTOS.OB_IAX_CONTACTOS_AUT.NORDEN}','MODIF')"/>
                                                       </div>
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
                        </table> 
