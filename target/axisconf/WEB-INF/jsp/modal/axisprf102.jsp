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
            var STARIFA_OUT = "${__formdata.STARIFA_OUT}";
            var MODO = "${__formdata.MODO}";
            var pantalla = "${__formdata.pantalla}";
            if ((!objUtiles.estaVacio(aceptar))&&(aceptar=="0")){
               parent.f_aceptar_modal("axisprf102");
            }
            if (!objUtiles.estaVacio(STARIFA_OUT)) {
                parent.f_aceptar_modal("axisprf102", "STARIFA_OUT="+STARIFA_OUT);
            }
            if (MODO == "altaConvenio"){
                objUtiles.ejecutarFormulario("modal_axisprf102.do?pantalla=altaConvenio","busqueda_tarifa",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            $("#STARIFA").focus();
        }
                
        function f_but_cancelar() {
            parent.f_but_salir(); 
        }        
        
        function f_but_buscar() {
            var MODO = "${__formdata.MODO}";
            var pantalla = "${__formdata.pantalla}";
            if (MODO == "altaConvenio" || pantalla == "altaConvenio"){
                var qs="?pantalla=altaConvenio";   
            }else{
                var qs="";
            }
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf102.do"+qs,"busqueda_tarifa",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_seleccionar_tarifa (STARIFA,TDESCRI) {
            if (objUtiles.estaVacio(STARIFA))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("pSTARIFA", STARIFA);
                objDom.setValorPorId ("pTDESCRI", TDESCRI);
            }
         }
        
        function f_but_aceptar(){
            parent.f_aceptar_modal("axisprf102", "STARIFA_OUT="+$("#pSTARIFA").val()+"&TDESCRI="+$("#pTDESCRI").val());
        }
        
        function f_but_9904925(){
            var checkeado;
            $('input[name=STARIFA_sel]:radio').each(function(){
                if($(this).val()== $("#pSTARIFA").val()){
                    checkeado = true;                   
                }
            });
            if (checkeado){
                objAjax.invokeAsyncCGI("modal_axisprf102.do?", callbackAjaxCargarStarifa, "operation=ajax_busqueda_starifa",
                                   this, objJsMessages.jslit_cargando);
            }else{
                alert("Primero se debe seleccionar la tarifa.");
            }
        }
        
        function f_but_9904926(){
            var checkeado;
            $('input[name=STARIFA_sel]:radio').each(function(){
                if($(this).val()== $("#pSTARIFA").val()){
                    checkeado = true;                   
                }
            });
            if (checkeado){
                objUtiles.ejecutarFormulario("modal_axisprf102.do","traspaso_tarifa",document.miForm, "_self", objJsMessages.jslit_cargando);   
            }else{
                alert("Primero se debe seleccionar la tarifa.");
            }
        }
        function f_but_nuevo() {
        	$("#servicioNuevo").val(true);
            objAjax.invokeAsyncCGI("modal_axisprf102.do", callbackAjaxCargarStarifa, "operation=ajax_busqueda_starifa",
                                   this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarStarifa(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
			var servicioNuevo = $("#servicioNuevo").val();
			var pSTARIFA_selec="";
            
            if (servicioNuevo!='true'){
            	pSTARIFA_selec = $("#pSTARIFA").val();
            }
            
            var elementos = doc.getElementsByTagName("STARIFA");  
            for (i = 0; i < elementos.length; i++) {
                var STARIFA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("STARIFA"), i, 0);
                objDom.setValorPorId("pSTARIFA",STARIFA);
                parent.actualizaStarifa(STARIFA);
            }
            objAjax.invokeAsyncCGI("modal_axisprf102.do?STARIFA_new="+$("#pSTARIFA").val()+
                                                      "&STARIFA_sel="+pSTARIFA_selec, callbackAjaxCopiarTarifa, "operation=ajax_copiar_tarifa",
                                   this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCopiarTarifa(ajaxResponseText){
            parent.f_abrir_modal('axisprf103',null,'&STARIFA='+$("#pSTARIFA").val());
            $.reinitialiseScroll();
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
            <input type="hidden" name="pSTARIFA" id="pSTARIFA" value="" />
            <input type="hidden" name="pTDESCRI" id="pTDESCRI" value="" />
            <input type="hidden" name="servicioNuevo" id="servicioNuevo" value="" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisprf102" c="FORM" lit="9904887" /></c:param>
                <c:param name="producto"><axis:alt f="axisprf102" c="FORM" lit="9904887" /></c:param>
                <c:param name="form">axisprf102</c:param>
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
                                            <axis:ocultar f="axisprf102" c="STARIFA" dejarHueco="false"> 
                                                  <td class="titulocaja" >
                                                      <b><axis:alt f="axisprf102" c="STARIFA" lit="9901888"/></b>
                                                  </td>
                                            </axis:ocultar>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisprf102" c="TDESCRI" lit="100588"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisprf102" c="STARIFA" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['STARIFA']}" name="STARIFA" id="STARIFA" size="15" style="width:50%"/>
                                              </td>
                                        </axis:visible>
                                        <axis:visible f="axisprf102" c="TDESCRI" >
                                              <td class="campocaja">
                                                  <input type="text" class="campo campotexto" value="${__formdata['TDESCRI']}" name="TDESCRI" id="TDESCRI" size="15" style="width:150%"/>
                                              </td>
                                        </axis:visible>
                                       </tr>
                                    </table>
                    
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag ListaPersonas -->
                            <c:set var="title0"><axis:alt f="axisprf102" c="STARIFA" lit="9901888"/></c:set>
                            <c:set var="title1"><axis:alt f="axisprf102" c="TDESCRI" lit="100588"/></c:set>
                            <c:set var="title2"><axis:alt f="axisprf102" c="MOD" lit="9000724"/></c:set>
                            
                            <div class="seccion displayspaceTarifas">
                                <display:table name="${sessionScope.axisprf102_listaTarifas}" id="miListaId" export="false" class="dsptgtable" 
                                               pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisprf102.do?paginar=true" 
                                               sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="radio" id="STARIFA_sel" name="STARIFA_sel" value="${miListaId['STARIFA']}" 
                                           onchange="f_seleccionar_tarifa(${miListaId['STARIFA']}, '${miListaId['TDESCRI']}')"/>
                                    </div>
                                  </display:column>
                                    <display:column title="${title0}" sortable="true" style="width:15%;" sortProperty="STARIFA" headerClass="headwidth5 sortable"
                                                    media="html" autolink="false" >
                                        <div class="dspNumber">${miListaId['STARIFA']}</div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="TDESCRI" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText">
                                            ${miListaId['TDESCRI']}
                                        </div>
                                    </display:column>
                                    <axis:visible f="axisprf102" c="BT_MODIFICAR">
                                        <display:column title="${title2}" sortable="false" headerClass="sortable" media="html" autolink="false" style="width:5%">
                                            <div class="dspIcon">
                                                 <a href="javascript:parent.f_abrir_modal('axisprf103',null,'&STARIFA='+'${miListaId['STARIFA']}'+'&MODO=modificar')">
                                                 <img border="0" alt="<axis:alt f="axisprf102" c="EDITAR" lit="100002" />" 
                                                      title="<axis:alt f="axisprf102" c="EDITAR" lit="100002" />" src="images/lapiz.gif"/>
                                                 </a>
                                            </div>
                                        </display:column>
                                    </axis:visible>
                                </display:table>
                            </div>	
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf102</c:param>
                <c:param name="__botones">
                    <c:if test="${__formdata.pantalla == 'altaConvenio'}">
                    <axis:visible f="axisprf102" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisprf102" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisprf102" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisprf102" c="BT_ACEPTAR">,aceptar</axis:visible>
                    </c:if>
                     <c:if test="${__formdata.pantalla != 'altaConvenio'}">
                    <axis:visible f="axisprf102" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisprf102" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisprf102" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisprf102" c="BT_COPIAR">,9904925</axis:visible><axis:visible f="axisprf102" c="BT_VER">,9904926</axis:visible>
                    </c:if>
                </c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </div>
    </body>
    <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
      <script language="Javascript" type="text/javascript">  
        retocarPAGE_CSS('axisprf102');
      </script >                   
    </c:if>
</html>

