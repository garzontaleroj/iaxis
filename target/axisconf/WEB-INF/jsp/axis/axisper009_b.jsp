<%-- 
  Fichero: axisper009.jsp
  Fecha: 23/07/2008
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
 <!-- *************************  DATOS NACIONALIDADES       ********************* -->
                     <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                         <axis:visible c="DSP_NACIONALIDADES" f="axisper009">                         	
                        <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','NACIONALIDADES');return true;">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_NACIONALIDAD__visible != 'false'}">
                            <axis:visible f="axisper009" c="BT_NVNACIONALIDAD">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_axisper013(null,'${dades_persona.SPERSON}')">
                                <img border="0"
                                     alt="<axis:alt f='axisper009' c='IMG_PER013' lit='9000425'/>"
                                     title="<axis:alt f='axisper009' c='IMG_PER013' lit='9000425'/>"
                                     src="images/new.gif"/>
                              </a>
                            </div>
                            </axis:visible>
                          </c:if>
                          <tr>
                            <td>
                              <!-- DisplayTag NACIONALIDADES -->
                              <c:set var="title1">
                                <axis:alt f="axisper009" c="CPAIS" lit="1000109"/>
                              </c:set>
                              <c:set var="title2">
                                <axis:alt f="axisper009" c="TPAIS" lit="100816"/>
                              </c:set>
                              <c:set var="title3">
                                <axis:alt f="axisper009" c="CDEFECTO" lit="100713"/>
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${dades_persona.NACIONALIDADES}"
                                               id="T_IAX_NACIONALIDADES"
                                               export="false" class="dsptgtable"
                                               pagesize="-1" defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_NACIONALIDADES.CPAIS"
                                                  headerClass="headwidth5 sortable fixed"
                                                  media="html" style="width:10%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_NACIONALIDADES.OB_IAX_NACIONALIDADES.CPAIS}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_NACIONALIDADES.TPAIS"
                                                  headerClass="sortable fixed"
                                                  media="html" style="width:50%"
                                                  autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_NACIONALIDADES.OB_IAX_NACIONALIDADES.TPAIS}
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_NACIONALIDADES.CDEFECTO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspIcons">
                                      <input onclick="javascript:void(0)"
                                             <c:if test="${T_IAX_NACIONALIDADES.OB_IAX_NACIONALIDADES.CDEFECTO == 1}">checked="true"</c:if>
                                             type="checkbox" id="CDEFECTO"
                                             name="CDEFECTO" value=""
                                             disabled="disabled"/>
                                    </div>
                                  </display:column>
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_NACIONALIDAD__visible != 'false'}">
                                    <axis:visible f="axisper009" c="BT_EDITNACIONALIDAD">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        <a href="javascript:f_abrir_axisper013('${T_IAX_NACIONALIDADES.OB_IAX_NACIONALIDADES.CPAIS}','${dades_persona.SPERSON}')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='EDIT_NAC' lit='9000426'/>"
                                               title="<axis:alt f='axisper009' c='EDIT_NAC' lit='9000426'/>"
                                               src="images/lapiz.gif"/>
                                        </a>
                                      </div>
                                    </display:column>
                                    </axis:visible>
                                  </c:if>
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_NACIONALIDAD__visible != 'false'}">
                                   <axis:visible f="axisper009" c="BT_BORRARNACIONALIDAD">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        <a href="javascript:f_borrar_NACIONALIDAD('${T_IAX_NACIONALIDADES.OB_IAX_NACIONALIDADES.CPAIS}','${dades_persona.SPERSON}')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='BORRAR_NAC' lit='9000427'/>"
                                               title="<axis:alt f='axisper009' c='BORRAR_NAC' lit='9000427'/>"
                                               src="images/delete.gif"/>
                                        </a>
                                      </div>
                                    </display:column>
                                    </axis:visible>
                                  </c:if>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
                        </axis:visible>
                        </c:if>
                        <!-- ************************* FIN DATOS NACIONALIDADES  ********************* -->
                               <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                          <axis:visible c="DSP_IDENTIFICADORES" f="axisper009">
                          <div class="titulo">
                            <b><axis:alt f="axisper009" c="DSP_IDENT" lit="9000431"/></b>
                          </div>
                         
                         <a name="posicionPorColorcar__IDENTIFICADORES" id="posicionPorColorcar__IDENTIFICADORES"></a>           
                          <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','IDENTIFICADORES');return true;">
                            <axis:visible f="axisper009" c="BT_NVIDENT">
                            <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_IDENTIFICADOR__visible != 'false'}">
                              <div style="float:right;">
                                <a href="javascript:f_abrir_axisper015(null,'${dades_persona.SPERSON}','${dades_persona.CTIPPER}','NEW')">
                                  <img border="0"
                                       alt='<axis:alt f="axisper009" c="ANADIR_CNT" lit="9000422"/>'
                                       title='<axis:alt f="axisper009" c="ANADIR_DOC" lit="9902890"/>'
                                       src="images/new.gif"/>
                                </a>
                              </div>
                            </c:if>
                            </axis:visible>
                            <tr>
                              <td>
                                <!-- DisplayTag identificadores -->
                                <c:set var="title1">
                                  <axis:alt f="axisper009" c="CTIPIDE" lit="1000109"/>
                                </c:set>
                                <c:set var="title2">
                                  <axis:alt f="axisper009" c="TTIPIDE" lit="109774"/>
                                </c:set>
                                <c:set var="title3">
                                  <axis:alt f="axisper009" c="NNUMIDE" lit="105330"/>
                                </c:set>
                                 <axis:visible c="CPAISEXP" f="axisper009">
                                     <c:set var="title5">
                                      <axis:alt f="axisper009" c="CPAISEXP" lit="9903741"/>
                                    </c:set>
                                </axis:visible>
                                 <axis:visible c="CDEPARTEXP" f="axisper009">
                                    <c:set var="title6">
                                      <axis:alt f="axisper009" c="CDEPARTEXP" lit="9903953"/>
                                    </c:set>
                                </axis:visible>
                                 <axis:visible c="CCIUDADEXP" f="axisper009">
                                    <c:set var="title7">
                                      <axis:alt f="axisper009" c="CCIUDADEXP" lit="9903740"/>
                                    </c:set>
                                </axis:visible>
                                 <axis:visible c="FECHADEXP" f="axisper009">
                                     <c:set var="title8">
                                      <axis:alt f="axisper009" c="FECHADEXP" lit="9903739"/>
                                    </c:set>
                                </axis:visible>
                                <c:set var="title4">
                                  <axis:alt f="axisper009" c="SWIDEPRI" lit="100713"/>
                                </c:set>
                                <div class="displayspace">
                                  <display:table name="${dades_persona.IDENTIFICADORES}"
                                                 id="T_IAX_IDENTIFICADORES"
                                                 export="false"
                                                 class="dsptgtable"
                                                 pagesize="-1" defaultsort="1"
                                                 defaultorder="ascending"
                                                 sort="list" cellpadding="0"
                                                 cellspacing="0"
                                                 requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="${title1}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.CTIPIDE"
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    style="width:5%"
                                                    autolink="false">
                                      <div class="dspText">
                                        ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.CTIPIDE}
                                      </div>
                                    </display:column>
                                    <display:column title="${title2}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.TTIPIDE"
                                                    headerClass="headwidth25 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspText">
                                        ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.TTIPIDE}
                                      </div>
                                    </display:column>
                                    <display:column title="${title3}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.NNUMIDE"
                                                    headerClass="headwidth50 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspText">
                                        ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.NNUMIDE}
                                      </div>
                                    </display:column>
                              
                                     <axis:visible c="CPAISEXP" f="axisper009">
                                          <display:column title="${title5}"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_IDENTIFICADORES.TPAISEXP"
                                                        headerClass="headwidth50 sortable fixed"
                                                        media="html"
                                                        autolink="false">
                                          <div class="dspText">
                                            ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.TPAISEXP}
                                          </div>
                                        </display:column>
                                    </axis:visible>
                                     <axis:visible c="CDEPARTEXP" f="axisper009">
                                         <display:column title="${title6}"
                                                        sortable="true"
                                                        sortProperty="OB_IAX_IDENTIFICADORES.TDEPARTEXP"
                                                        headerClass="headwidth50 sortable fixed"
                                                        media="html"
                                                        autolink="false">
                                          <div class="dspText">
                                            ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.TDEPARTEXP}
                                          </div>
                                        </display:column>
                                    </axis:visible>
                                      <axis:visible c="CCIUDADEXP" f="axisper009">
                                           <display:column title="${title7}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.TCIUDADEXP"
                                                    headerClass="headwidth50 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspText">
                                        ${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.TCIUDADEXP}
                                      </div>
                                    </display:column>
                                    </axis:visible>
                                      <axis:visible c="FECHADEXP" f="axisper009">
                                           <display:column title="${title8}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.FECHADEXP"
                                                    headerClass="headwidth50 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                          <div class="dspText" >
                                             <fmt:formatDate value='${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.FECHADEXP}' pattern='dd/MM/yyyy'/>
                                           </div>
                                        </display:column>
                                    </axis:visible>
                        
                                     <display:column title="${title4}"
                                                    sortable="true"
                                                    sortProperty="OB_IAX_IDENTIFICADORES.SWIDEPRI"
                                                    headerClass="headwidth10 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <div class="dspIcons">
                                        <input onclick="javascript:void(0)"
                                               <c:if test="${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.SWIDEPRI == 1}">checked="true"</c:if>
                                               type="checkbox" id="SWIDEPRI"
                                               name="SWIDEPRI" value=""
                                               disabled="disabled"/>
                                      </div>
                                    </display:column>
                                    
                                    <axis:visible f="axisper009" c="BT_EDITIDENT">
                                    <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_IDENTIFICADOR__visible != 'false'}">
                                      <display:column title="" sortable="false"
                                                      sortProperty=""
                                                      headerClass="headwidth5 sortable fixed"
                                                      media="html"
                                                      autolink="false">
                                        <div class="dspIcons">
                                          <a href="javascript:f_abrir_axisper015('${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.CTIPIDE}','${dades_persona.SPERSON}','${dades_persona.CTIPPER}','MODIF')">
                                            <img border="0"
                                                 alt="<axis:alt f='axisper009' c='EDIT' lit='9902891'/>"
                                                 title="<axis:alt f='axisper009' c='EDIT' lit='9902891'/>"
                                                 src="images/lapiz.gif"/>
                                          </a>
                                        </div>
                                      </display:column>
                                    </c:if>
                                    </axis:visible>
                                    <axis:visible f="axisper009" c="BT_DELIDENT">
                                    <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_IDENTIFICADOR__visible != 'false'}">
                                      <display:column title="" sortable="false"
                                                      sortProperty=""
                                                      headerClass="headwidth5 sortable fixed"
                                                      media="html"
                                                      autolink="false">
                                        <div class="dspIcons">
                                          <a href="javascript:f_borrar_IDENTIFICADOR('${T_IAX_IDENTIFICADORES.OB_IAX_IDENTIFICADORES.CTIPIDE}','${dades_persona.SPERSON}')">
                                            <img border="0"
                                                 alt="<axis:alt f='axisper009' c='BORRAR' lit='9902892'/>"
                                                 title="<axis:alt f='axisper009' c='BORRAR' lit='9902892'/>"
                                                 src="images/delete.gif"/>
                                          </a>
                                        </div>
                                      </display:column>
                                    </c:if>
                                    </axis:visible>
                                  </display:table>
                                </div>
                              </td>
                            </tr>
                          </table>
                          </axis:visible>
                          </c:if>