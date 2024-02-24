<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>


<!-- *************************  DATOS TARJETAS BANCARIAS  ********************* -->
    <axis:visible c="DSP_TARJETAS" f="axisper009"> 
                        <div class="titulo">
                          <b><axis:alt f="axisper009" c="LIT32" lit="9902645"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisper009" c="BT_NVTARJETA">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_CUENTA__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_axisper014(null,'${dades_persona.SPERSON}','2','NEW')">
                                <img border="0"
                                     alt='<axis:alt f="axisper009" c="LIT33" lit="9902652"/>'
                                     title='<axis:alt f="axisper009" c="LIT34" lit="9902652"/>'
                                     src="images/new.gif"/>
                              </a>
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                            <td>
                              <!-- DisplayTag CCC -->
                               <!-- Banco -->
                              <c:set var="title0"> 
                                <axis:alt f="axisper009" c="LIT_BANCO" lit="9000964"/>
                              </c:set>
                              <!-- Franquicia -->
                              <c:set var="title1"> 
                                <axis:alt f="axisper009" c="LIT_FRANQ" lit="9000940"/>
                              </c:set>
                              <!-- Num. tarjeta -->
                              <c:set var="title2"> 
                                <axis:alt f="axisper009" c="LIT_COD_TARJ" lit="9902646"/>
                              </c:set>
                               <!-- Fecha alta -->
                              <c:set var="title3"> 
                                <axis:alt f="axisper009" c="LIT_FALTA" lit="9001192"/>
                              </c:set> 
                               <!-- Fecha baja -->
                              <c:set var="title4">
                                <axis:alt f="axisper009" c="LIT_FBAJA" lit="9001510"/>
                              </c:set>
                               <!-- usuario alta -->
                              <c:set var="title5">
                                <axis:alt f="axisper009" c="LIT_USUALTA" lit="9001630"/>
                              </c:set>
                               <!-- Fecha vencimiento -->
                              <c:set var="title6">
                                <axis:alt f="axisper009" c="LIT_FVENCIM" lit="102526"/>
                              </c:set>
                               <!-- Cod. Seguridad -->
                              <c:set var="title7">
                                <axis:alt f="axisper009" c="LIT_CODSEG" lit="9902634"/>
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${dades_persona.TARJETAS}"
                                               id="T_IAX_CCC" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  
                                  <axis:visible f="axisper009" c="BANCO_TARJ">
                                      <display:column title="${title0}"
                                                      sortable="true"
                                                      sortProperty="OB_IAX_CCC.TBANCO"
                                                      headerClass="sortable fixed"
                                                      media="html" autolink="false">
                                        <div class="dspText">
                                          ${T_IAX_CCC.OB_IAX_CCC.TBANCO}
                                        </div>
                                      </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TTIPBAN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.TTIPTARJ}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.CBANCAR"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <axis:masc f="axisper009" c="CBANCAR" value="${T_IAX_CCC.OB_IAX_CCC.CBANCAR}" />
                                    </div>
                                  </display:column>CBANCAR
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.FALTA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatDate pattern="dd/MM/yyyy"
                                                      value="${T_IAX_CCC.OB_IAX_CCC.FALTA}"/>
                                    </div>
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.FBAJA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatDate pattern="dd/MM/yyyy"
                                                      value="${T_IAX_CCC.OB_IAX_CCC.FBAJA}"/>
                                    </div>
                                  </display:column>
                                  
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.CUSUALTA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.CUSUALTA}
                                    </div>
                                  </display:column>
                                  
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.FVENCIM"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatDate pattern="MM/yyyy"
                                                      value="${T_IAX_CCC.OB_IAX_CCC.FVENCIM}"/>
                                    </div>
                                  </display:column>
                                  
                                  <axis:visible f="axisper009" c="TSEGURI">
                                  <display:column title="${title7}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TSEGURI"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.TSEGURI}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <axis:visible f="axisper009" c="BT_EDITTARJETA">
                                              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_CUENTA__visible != 'false'}">
                                                <display:column title="" sortable="false"
                                                                sortProperty=""
                                                                headerClass="headwidth5 sortable fixed"
                                                                media="html"
                                                                autolink="false">
                                                  <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}"> <!--validacion FBAJA informada -->              
                                                  <div class="dspIcons">
                                                    <a href="javascript:f_abrir_axisper014('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','${dades_persona.SPERSON}','2','MODIF')">
                                                      <img border="0"
                                                           alt="<axis:alt f='axisper009' c='LIT39_F' lit='9902658'/>"
                                                           title="<axis:alt f='axisper009' c='LIT40_F' lit='9902658'/>"
                                                           src="images/lapiz.gif"/>
                                                    </a>
                                                  </div>
                                                  </c:if><!--validacion FBAJA informada -->
                                                  
                                                </display:column>
                                              </c:if>
                                              </axis:visible>
                                              <axis:visible f="axisper009" c="BT_DELTARJETA">
                                              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_CUENTA__visible != 'false'}">
                                                <display:column title="" sortable="false"
                                                                sortProperty=""
                                                                headerClass="headwidth5 sortable fixed"
                                                                media="html"
                                                                autolink="false">
                                                  <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}"> <!--validacion FBAJA informada -->                
                                                  <div class="dspIcons">
                                                    <a href="javascript:f_borrar_CCC('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','${dades_persona.SPERSON}')">
                                                      <img border="0"
                                                           alt="<axis:alt f='axisper009' c='LIT41_T' lit='9902659'/>"
                                                           title="<axis:alt f='axisper009' c='LIT42_T' lit='9902659'/>"
                                                           src="images/delete.gif"/>
                                                    </a>
                                                  </div>
                                                  </c:if>  
                                                </display:column>
                                              </c:if>
                                              </axis:visible>
                                  
                                  
                                  
                                  
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
        </axis:visible>
<!-- *************************  DATOS TARJETAS BANCARIAS  ********************* -->

<!-- *************************  DATOS CUENTAS BANCARIAS  ********************* -->
        <axis:visible c="DSP_CUENTAS" f="axisper009"> 
                        <div class="titulo">
                          <b><axis:alt f="axisper009" c="LIT32" lit="1000091"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisper009" c="BT_NVCUENTA">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_ANADIR_CUENTA__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_abrir_axisper014(null,'${dades_persona.SPERSON}','1','NEW')">
                                <img border="0"
                                     alt='<axis:alt f="axisper009" c="LIT_NVCUENTA" lit="1000438"/>'
                                     title='<axis:alt f="axisper009" c="LIT_NVCUENTA_TIT" lit="1000438"/>'
                                     src="images/new.gif"/>
                              </a>
                            </div>
                          </c:if>
                          </axis:visible>
                          <tr>
                            <td>
                              
                              <!-- DisplayTag CCC -->
                               <!-- Banco -->
                              <c:set var="title0"> 
                                <axis:alt f="axisper009" c="LIT_BANCO_CCC" lit="9000964"/>
                              </c:set>
                              <!-- Tipo Cuenta Bancaria -->
                              <c:set var="title1"> 
                                <axis:alt f="axisper009" c="LIT_CTIPBAN_CCC" lit="1000374"/>
                              </c:set>
                               <!-- Cuenta Bancaria -->
                              <c:set var="title2"> 
                                <axis:alt f="axisper009" c="LIT_CBANCAR_CCC" lit="100965"/>
                              </c:set> 
                               <!-- Fecha baja -->
                              <c:set var="title3">
                                <axis:alt f="axisper009" c="LIT_FBAJA_CCC" lit="9001510"/>
                              </c:set>
                               <!-- Por defecto -->
                              <c:set var="title4">
                                <axis:alt f="axisper009" c="LIT_PDEFECTO_CCC" lit="100713"/>
                              </c:set>
                               <!-- Validado -->
                              <c:set var="title5">
                                <axis:alt f="axisper009" c="LIT_CVALIDA_CCC" lit="9901620"/>
                              </c:set>
                               <!-- Siniestros -->
                              <c:set var="title6">
                                <axis:alt f="axisper009" c="LIT_CPAGSIN_ALT" lit="100592"/>
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${dades_persona.CCC}"
                                               id="T_IAX_CCC" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisper009" c="BANCO_CCC">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TBANCO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.TBANCO}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <axis:visible f="axisper009" c="TTIPTARJ">
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TTIPTARJ"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.TTIPTARJ}
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TTIPBAN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                       <axis:masc f="axisper009" c="CBANCAR" value="${T_IAX_CCC.OB_IAX_CCC.CBANCAR}" />
                                    </div>
                                  </display:column>
                        <!--Modificacion para bug  29599   15/01/2014-->
                                <axis:visible f="axisper009" c="FBAJA">
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.FBAJA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <fmt:formatDate pattern="dd/MM/yyyy"
                                                      value="${T_IAX_CCC.OB_IAX_CCC.FBAJA}"/>
                                    </div>
                                  </display:column>
                                  </axis:visible>
                        <!--Modificacion para bug 29599  15/01/2014-->
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.CDEFECTO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspIcons">
                                      <input onclick="javascript:void(0)"
                                             <c:if test="${T_IAX_CCC.OB_IAX_CCC.CDEFECTO == 1}">checked="true"</c:if>
                                             type="checkbox" id="CDEFECTO"
                                             name="CDEFECTO" value=""
                                             disabled="disabled"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axisper009" c="CVALIDA">
                                  <display:column title="${title5}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.CVALIDA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                  
                                     <div class="dspText">
                                      ${T_IAX_CCC.OB_IAX_CCC.TVALIDA}
                                    </div>
                                    
                                  </display:column>
                                  </axis:visible>
                                  <axis:visible f="axisper009" c="CPAGSIN">
                                  <display:column title="${title6}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.CPAGSIN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspIcons">
                                      <input onclick="javascript:void(0)"
                                             <c:if test="${T_IAX_CCC.OB_IAX_CCC.CPAGSIN == 1}">checked="true"</c:if>
                                             type="checkbox" id="CPAGSIN"
                                             name="CPAGSIN" value=""
                                             disabled="disabled"/>
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  
                                  <axis:visible f="axisper009" c="BT_EDITCUENTA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                                    
                                      <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">              
                                      <div class="dspIcons">
                                        <a href="javascript:f_abrir_axisper014('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','${dades_persona.SPERSON}','1','MODIF')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='LIT39_D' lit='100002'/> <axis:alt f='axisper009' c='LIT39_S' lit='100965'/>"
                                               title="<axis:alt f='axisper009' c='LIT40_D' lit='100002'/> <axis:alt f='axisper009' c='LIT40_S' lit='100965'/>"
                                               src="images/lapiz.gif"/>
                                        </a>
                                      </div>
                                      </c:if>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  <axis:visible f="axisper009" c="BT_DELCUENTA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_BORRAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">     
                                      <div class="dspIcons">
                                        <a href="javascript:f_borrar_CCC('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','${dades_persona.SPERSON}','${T_IAX_CCC.OB_IAX_CCC.CPAGSIN}')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper009' c='LIT41' lit='1000127'/> <axis:alt f='axisper009' c='LIT41_G' lit='100965'/>"
                                               title="<axis:alt f='axisper009' c='LIT42' lit='1000127'/> <axis:alt f='axisper009' c='LIT42_G' lit='100965'/>"
                                               src="images/delete.gif"/>
                                        </a>
                                      </div>
                                       </c:if>     
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
        </axis:visible>
<!-- *************************  DATOS CUENTAS BANCARIAS  ********************* -->