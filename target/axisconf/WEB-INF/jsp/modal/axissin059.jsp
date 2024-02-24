<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->    
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {            
            f_cargar_propiedades_pantalla();
            var aceptar = "${__formdata.aceptar}";
            var COFICI_OUT = "${__formdata.COFICI_OUT}";
            var MODO = "${__formdata.MODO}";
            if ((!objUtiles.estaVacio(aceptar))&&(aceptar=="0")){
               parent.f_aceptar_modal("axissin059");
            }
            if (!objUtiles.estaVacio(COFICI_OUT)) {
                parent.f_aceptar_modal("axissin059", "COFICI_OUT="+COFICI_OUT);
            }
            
            $("#COFICI").focus();
        }
                
        function f_but_cancelar() {
            parent.f_cerrar_modal("axissin059"); 
        }        
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axissin059.do","busqueda_oficinas",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_seleccionar_oficina (COFICI,TOFICI) {
            if (objUtiles.estaVacio(COFICI))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("pCOFICI", COFICI);
                objDom.setValorPorId ("pTOFICI", TOFICI);
            }
         }
        
        function f_but_aceptar(){
            parent.f_aceptar_modal("axissin059", "COFICI="+$("#pCOFICI").val()+"&TOFICI="+$("#pTOFICI").val());
        }
        
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="pCOFICI" id="pCOFICI" value="" />
            <input type="hidden" name="pTOFICI" id="pTOFICI" value="" />
            <input type="hidden" name="CBANCO" id="CBANCO" value="${__formdata.CBANCO}" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin059" c="FORM" lit="9906107" /></c:param>
                <c:param name="producto"><axis:alt f="axissin059" c="FORM" lit="9906107" /></c:param>
                <c:param name="form">axissin059</c:param>
            </c:import>
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:34%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axissin059" c="COFICI" dejarHueco="false"> 
                                                  <td class="titulocaja" >
                                                      <b><axis:alt f="axissin059" c="COFICI" lit="9906108"/></b>
                                                  </td>
                                            </axis:ocultar>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axissin059" c="TOFICI" lit="105940"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axissin059" c="COFICI" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['COFICI']}" name="COFICI" id="COFICI" size="15" style="width:50%"/>
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axissin059" c="TOFICI" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TOFICI']}" name="TOFICI" id="TOFICI" size="15" style="width:150%"/>
                                              </td>
                                        </axis:visible>
                                       </tr>
                                    </table>
                    
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title0"><axis:alt f="axissin059" c="COFICI" lit="103465"/></c:set>
                            <c:set var="title1"><axis:alt f="axissin059" c="TOFICI" lit="100588"/></c:set>
                            <c:set var="title2"><axis:alt f="axissin059" c="TDIRECCION" lit="105889"/></c:set>
                            
                            <div class="seccion displayspaceTarifas">
                                <display:table name="${sessionScope.axissin059_listaOficinas}" id="miListaId" export="false" class="dsptgtable" 
                                               pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axissin059.do?paginar=true" 
                                               sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="radio" id="COFICI_sel" name="COFICI_sel" value="${miListaId['COFICIN']}" 
                                           onchange="f_seleccionar_oficina(${miListaId['COFICIN']}, '${miListaId['TOFICIN']}')"/>
                                    </div>
                                  </display:column>
                                    <display:column title="${title0}" sortable="true" style="width:15%;" sortProperty="COFICIN" headerClass="sortable fixed"
                                                    media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['COFICIN']}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="TOFICIN" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['TOFICIN']}
                                        </div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="TDIRECC" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['TDIRECC']} - ${miListaId['CPOSTAL']} - ${miListaId['TPOBLA1']}
                                        </div>
                                    </display:column>
                                </display:table>
                            </div>	
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin059</c:param>
                <c:param name="__botones">
                    <axis:visible f="axissin059" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axissin059" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axissin059" c="BT_ACEPTAR">,aceptar</axis:visible>
                </c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axissin059');
      </script >                   
    </c:if>
</html>


