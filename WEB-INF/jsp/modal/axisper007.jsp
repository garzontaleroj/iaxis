<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%-- 
*  Fichero: axisper007.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 24/04/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    <c:set var="isAxisper004Embedded" value="true"/>
    	 <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_but_anadir_CCC() {            
            f_abrir_axisper004();
            
        }
        
        function f_but_salir() {
            parent.f_cerrar_axisper007();
        }                
        
        function f_borrar_CCC(CNORDBAN) {
            objUtiles.ejecutarFormulario("modal_axisper007.do?CNORDBAN=" + CNORDBAN, "eliminarCCC",  document.axisper007Form, "_self", objJsMessages.jslit_cargando);   
        }
        
        /****************************************************************************************/
        /********************************* MODAL AXPER004 ***************************************/
        /****************************************************************************************/
        
        function f_abrir_axisper004(CNORDBAN,TIPCCC) {
            //var isAxisper004Embedded = "${isAxisper004Embedded}";
            //if (isAxisper004Embedded == "true") 
            //    objUtiles.ejecutarFormulario("modal_axisper007.do?CNORDBAN=" + CNORDBAN, "editarCCC",  document.axisper007Form, "_self", objJsMessages.jslit_cargando);   
            //else
                objUtiles.abrirModal("axisper004", "src", "modal_axisper004.do?operation=form&SPERSON=${__formdata.SPERSON}&CNORDBAN=" + CNORDBAN+"&TIPCCC="+TIPCCC, 1200, 300);        
        }
        
        function f_nuevo_axisper004(CNORDBAN,TIPCCC,CBANCAR) {
            //var isAxisper004Embedded = "${isAxisper004Embedded}";
            //if (isAxisper004Embedded == "true") 
            //    objUtiles.ejecutarFormulario("modal_axisper007.do?CNORDBAN=" + CNORDBAN, "editarCCC",  document.axisper007Form, "_self", objJsMessages.jslit_cargando);   
            //else
           
                objUtiles.abrirModal("axisper004", "src", "modal_axisper004.do?operation=form&SPERSON=${__formdata.SPERSON}&TIPCCC="+TIPCCC+"&CBANCAR="+CBANCAR+"&MODO_IN=NUEVO", 1200, 300);        
        }
        
        function f_cerrar_axisper004() {
            //var isAxisper004Embedded = "${isAxisper004Embedded}";
            //if (isAxisper004Embedded == "true")
            //    objUtiles.ejecutarFormulario("modal_axisper007.do?esconderAxisper004Embed=true", "form", document.axisper007Form, "_self", objJsMessages.jslit_cargando);   
            //else
                objUtiles.cerrarModal("axisper004");
        }
        
        function f_aceptar_axisper004() {
            // Cerrar modal y recargar la pantalla
            //var isAxisper004Embedded = "${isAxisper004Embedded}";
            //if (isAxisper004Embedded == "true") {
            //    objUtiles.ejecutarFormulario("modal_axisper007.do?esconderAxisper004Embed=true", "form", document.axisper007Form, "_self", objJsMessages.jslit_cargando);                   
            //} else {
                f_cerrar_axisper004();
                objUtiles.ejecutarFormulario("modal_axisper007.do", "form", document.axisper007Form, "_self", objJsMessages.jslit_cargando, 1200, 300);   
            //}
        }
        

    </script>
  </head>
  <body onload="try { f_onload_axisper004() } catch (e) {}">
  	<%--div id="wrapper" class="wrapper"--%>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisper004|<axis:alt f="axisper007" c="nid" lit="1000213"/></c:param>
    </c:import>
    
    <form name="axisper007Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
    </form>
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><axis:alt f="axisper007" c="formulario" lit="1000216"/></c:param>
        <c:param name="producto"><axis:alt f="axisper007" c="producto" lit="1000216"/></c:param>
        <c:param name="form">axisper007</c:param>
    </c:import>

    <!-- Area de campos  -->
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <td>
                            
                            <%--c:set var="title1"><axis:alt f="axisper007" c="TIPOCCC" lit="1000374"/></c:set>
                            <c:set var="title2"><axis:alt f="axisper006" c="CBANCAR" lit="100965"/></c:set>
                            <c:set var="title3"><axis:alt f="axisper006" c="FBAJA"   lit="102853"/></c:set> 
                            <c:set var="title4"><axis:alt f="axisper006" c="CDEFECT" lit="100713"/></c:set>                                 
                            <div class="displayspace" style="width:100%;height:100%">
                              <display:table name="${__formdata.T_IAX_CCC}" id="T_IAX_CCC" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                               requestURI="modal_axisper007.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_CCC.TTIPBAN" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_CCC.OB_IAX_CCC.TTIPBAN}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_CCC.CBANCAR" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_CCC.OB_IAX_CCC.CBANCAR}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_CCC.FBAJA" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspText">${T_IAX_CCC.OB_IAX_CCC.FBAJA}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_CCC.CDEFECTO" headerClass="sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><input onClick="javascript:void(0)" <c:if test="${T_IAX_CCC.OB_IAX_CCC.CDEFECTO == 1}">checked="true"</c:if> 
                                        type="checkbox" id="CDEFECTO1" name="CDEFECTO1" value="" disabled="disabled"/></div>
                                </display:column>
                                <axis:visible c="BT_EDITAR" f="axisper006">
                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><a href="javascript:f_abrir_axisper004('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}')"><img border="0" alt="<axis:alt f='axisper007' c='lapiz1' lit='100002'/> <axis:alt f='axisper007' c='lapiz2' lit='105503'/>" title="<axis:alt f='axisper007' c='lapiz3' lit='100002'/> <axis:alt f='axisper007' c='lapiz4' lit='105503'/>" src="images/lapiz.gif"/></a></div>
                                </display:column> 
                                </axis:visible>
                                <axis:visible c="BT_BORRAR" f="axisper006">                                   
                                <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                    <div class="dspIcons"><a href="javascript:f_borrar_CCC('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}')"><img border="0" alt="<axis:alt f='axisper007' c='delete1' lit='1000127'/> <axis:alt f='axisper007' c='delete2' lit='105889'/>" title="<axis:alt f='axisper007' c='delete3' lit='1000127'/> <axis:alt f='axisper007' c='delete4' lit='105889'/>" src="images/delete.gif"/></a></div>
                                </display:column>
                                </axis:visible>
                            </display:table>
                            </div--%>
                            
                            
                            <!-- *************************  DATOS TARJETAS BANCARIAS  ********************* -->
              <axis:visible c="DSP_TARJETAS" f="axisper007">  
                        <div class="titulo">
                          <b><axis:alt f="axisper007" c="LIT_NV_TIT" lit="9902645"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisper007" c="BT_NVTARJETA">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_ANADIR_CUENTA__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_nuevo_axisper004('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','2','')">
                                <img border="0"
                                     alt='<axis:alt f="axisper007" c="LIT33" lit="9902652"/>'
                                     title='<axis:alt f="axisper007" c="LIT34" lit="9902652"/>'
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
                                <axis:alt f="axisper007" c="LIT_BANCO" lit="9000964"/>
                              </c:set>
                              <!-- Franquicia -->
                              <c:set var="title1"> 
                                <axis:alt f="axisper007" c="LIT_FRANQ" lit="9000940"/>
                              </c:set>
                              <!-- Num. tarjeta -->
                              <c:set var="title2"> 
                                <axis:alt f="axisper007" c="LIT_COD_TARJ" lit="9902646"/>
                              </c:set>
                               <!-- Fecha alta -->
                              <c:set var="title3"> 
                                <axis:alt f="axisper007" c="LIT_FALTA" lit="9001192"/>
                              </c:set> 
                               <!-- Fecha baja -->
                              <c:set var="title4">
                                <axis:alt f="axisper007" c="LIT_FBAJA" lit="9001510"/>
                              </c:set>
                               <!-- usuario alta -->
                              <c:set var="title5">
                                <axis:alt f="axisper007" c="LIT_USUALTA" lit="9001630"/>
                              </c:set>
                               <!-- Fecha vencimiento -->
                              <c:set var="title6">
                                <axis:alt f="axisper007" c="LIT_FVENCIM" lit="102526"/>
                              </c:set>
                               <!-- Cod. Seguridad -->
                              <c:set var="title7">
                                <axis:alt f="axisper007" c="LIT_CODSEG" lit="9902634"/>
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${__formdata.T_IAX_TARJETA}"
                                               id="T_IAX_CCC" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="modal_axisper007.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisper007" c="BANCO_TARJ">
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
                                      <axis:masc f="axisper007" c="CBANCAR" value="${T_IAX_CCC.OB_IAX_CCC.CBANCAR}" />
                                    </div>
                                  </display:column>
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
                                  
                                  <axis:visible f="axisper007" c="TSEGURI">
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
                                   
                                  <axis:visible f="axisper007" c="BT_EDITTARJETA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_EDITAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">   
                                      <div class="dspIcons">
                                        <a href="javascript:f_abrir_axisper004('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','2')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper007' c='LIT39_T' lit='9902658'/>"
                                               title="<axis:alt f='axisper007' c='LIT40_T' lit='9902658'/>"
                                               src="images/lapiz.gif"/>
                                        </a>
                                      </div>
                                      </c:if>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  <axis:visible f="axisper007" c="BT_DELTARJETA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_BORRAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">   
                                      <div class="dspIcons">
                                        <a href="javascript:f_borrar_CCC('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper007' c='LIT41_T' lit='9902659'/>"
                                               title="<axis:alt f='axisper007' c='LIT42_T' lit='9902659'/>"
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
            <axis:visible c="DSP_CUENTAS" f="axisper007"> 
                        <div class="titulo">
                          <b><axis:alt f="axisper007" c="LIT_NV_ALT" lit="1000091"/></b>
                        </div>
                        <table class="seccion">
                          <axis:visible f="axisper007" c="BT_NVCUENTA">
                          <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_ANADIR_CUENTA__visible != 'false'}">
                            <div style="float:right;">
                              <a href="javascript:f_nuevo_axisper004('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','1','')">
                                <img border="0"
                                     alt='<axis:alt f="axisper007" c="LIT_BT_NV" lit="1000438"/>'
                                     title='<axis:alt f="axisper007" c="LIT_BT_NV_TIT" lit="1000438"/>'
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
                                <axis:alt f="axisper007" c="LIT_BANCO_CCC" lit="9000964"/>
                              </c:set>
                              <!-- Tipo Cuenta Bancaria -->
                              <c:set var="title1"> 
                                <axis:alt f="axisper007" c="LIT_CTIPBAN_CCC" lit="1000374"/>
                              </c:set>
                               <!-- Cuenta Bancaria -->
                              <c:set var="title2"> 
                                <axis:alt f="axisper007" c="LIT_CBANCAR_CCC" lit="100965"/>
                              </c:set> 
                               <!-- Fecha baja -->
                              <c:set var="title3">
                                <axis:alt f="axisper007" c="LIT_FBAJA_CCC" lit="9001510"/>
                              </c:set>
                               <!-- Por defecto -->
                              <c:set var="title4">
                                <axis:alt f="axisper007" c="LIT_PDEFECTO_CCC" lit="100713"/>
                              </c:set>
                               <!-- Validado -->
                              <c:set var="title5">
                                <axis:alt f="axisper007" c="LIT_CVALIDA_CCC" lit="9901620"/>
                              </c:set>
                               <!-- Siniestros -->
                              <c:set var="title6">
                                <axis:alt f="axisper007" c="LIT_CPAGSIN_ALT" lit="100592"/>
                              </c:set>
                              <div class="displayspace">
                                <display:table name="${__formdata.T_IAX_CCC}"
                                               id="T_IAX_CCC" export="false"
                                               class="dsptgtable" pagesize="-1"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="modal_axisper007.do?paginar=true&subpantalla=datosgenerales">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <axis:visible f="axisper007" c="BANCO_CCC">
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
                                      ${T_IAX_CCC.OB_IAX_CCC.TTIPBAN}
                                    </div>
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="OB_IAX_CCC.TTIPBAN"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      <axis:masc f="axisper007" c="CBANCAR" value="${T_IAX_CCC.OB_IAX_CCC.CBANCAR}" />
                                    </div>
                                  </display:column>
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
                                  <axis:visible f="axisper007" c="CVALIDA">
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
                                  <axis:visible f="axisper007" c="CPAGSIN">
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
                                  <axis:visible f="axisper007" c="BT_EDITCUENTA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_EDITAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                       <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">      
                                      <div class="dspIcons">
                                        <a href="javascript:f_abrir_axisper004('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}','1')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper007' c='LIT39' lit='100002'/> <axis:alt f='axisper007' c='LIT39_BIS' lit='105503'/>"
                                               title="<axis:alt f='axisper007' c='LIT40' lit='100002'/> <axis:alt f='axisper007' c='LIT40_BIS' lit='105503'/>"
                                               src="images/lapiz.gif"/>
                                        </a>
                                      </div>
                                      </c:if>
                                    </display:column>
                                  </c:if>
                                  </axis:visible>
                                  <axis:visible f="axisper007" c="BT_DELCUENTA">
                                  <c:if test="${! ocultarIconosEdicion && __configform.axisper007__BT_BORRAR_CUENTA__visible != 'false'}">
                                    <display:column title="" sortable="false"
                                                    sortProperty=""
                                                    headerClass="headwidth5 sortable fixed"
                                                    media="html"
                                                    autolink="false">
                                      <c:if test="${empty T_IAX_CCC.OB_IAX_CCC.FBAJA}">               
                                      <div class="dspIcons">
                                        <a href="javascript:f_borrar_CCC('${T_IAX_CCC.OB_IAX_CCC.CNORDBAN}')">
                                          <img border="0"
                                               alt="<axis:alt f='axisper007' c='LIT41' lit='1000127'/> <axis:alt f='axisper007' c='LIT41_BIS' lit='105503'/>"
                                               title="<axis:alt f='axisper007' c='LIT42' lit='1000127'/> <axis:alt f='axisper007' c='LIT42_BIS' lit='105503'/>"
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

                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        </td>
                    <tr>
                </table>
            </td>
        </tr>
        <%--tr>
            <td>
                <c:if test="${isAxisper004Embedded == 'true' && !empty sessionScope.mostrarAxisper004Embed}">
                <div id="axisper004_embed">
                    <jsp:include page="axisper004.jsp">
                        <jsp:param name="embedded" value="${isAxisper004Embedded}"/>
                    </jsp:include>
                </div>
                </c:if>
            </td>
        </tr--%>
    </table>			
    <!--,anadir_CCC -->
    <c:if test="${isAxisper004Embedded == 'false' || empty sessionScope.mostrarAxisper004Embed}">
    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axisper007</c:param>
        <c:param name="__botones">salir</c:param>
    </c:import>
    </c:if>
    
    <c:import url="../include/mensajes.jsp" />
    <%--/div--%>
   </body>
</html>

