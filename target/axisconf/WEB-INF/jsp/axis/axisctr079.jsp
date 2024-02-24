<%/*
*  Fichero: axisctr079.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*
*  Fecha: 04/07/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr079" c="LIQUIDACION_COMISIONES" lit="9001776"/></title> <%-- LIQUIDACION DE COMISIONES --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <style type="text/css">
        .displayspaceMaximo {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>
    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
            var haySPROLIQ_ = ${!empty __formdata.SPROLIQ_SEL};
            if (!haySPROLIQ_) {
                f_abrir_modal("axisctr078");
            }
            f_revisarChecks();
            f_revisarCheckProducto();
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            // Borrar parámetros de session en servidor
            //objAjax.invokeAsyncCGI("axis_axisctr079.do", callbackSalir, "operation=salir", this);
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr100", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function callbackSalir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr079", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9001771() {
            document.getElementById('NEW').value = "0";
            objUtiles.ejecutarFormulario("axis_axisctr079.do", "acceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_108341() {
            objAjax.invokeAsyncCGI("axis_axisctr079.do", callbackSalir, "operation=liquidar", this);
        }
         
        function f_ver_detalle(NRECIBO) {
            // Guardar desplazamiento barra scroll
            var miOffsetRecibos = document.getElementById("dt_recibos").scrollTop;
            objUtiles.ejecutarFormulario ('axis_axisadm003.do?NRECIBO=' + NRECIBO + '&miOffsetRecibos=' + miOffsetRecibos, 
                'form', document.miForm, '_self', objJsMessages.jslit_cargando);
        } 
        
        function f_detrecibos(NRECIBO) {
            objUtiles.ejecutarFormulario("axis_axisctr079.do?NRECIBO="+NRECIBO, "consultarDetRecibos", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
        
        function f_but_aceptar_modal078(sproces, cempres, index) {
            f_cerrar_modal('axisctr078');
            document.getElementById('SPROLIQ_SEL').value = sproces;
            document.getElementById('CEMPRES').value = cempres;
            objUtiles.ejecutarFormulario("axis_axisctr079.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onclickCheckbox(thiss,params) {
           thiss.value =  ((thiss.checked)?1:0);
           //alert(thiss.checked+' / ' + thiss.value);
           objDom.setValorPorId(thiss.id, thiss.value);
           //llamar a Pac_iax_liquida.F_SetObjetoRecLiqui con pnrecibo, psmovrec y pliqselec
           
           vars=params.split('#');
           
            objUtiles.ejecutarFormulario("axis_axisctr079.do?liqnrec="+vars[0]+
            "&liqsmov="+vars[1]+ "&liqpliq="+thiss.value
            , "recliqui", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onclickCheckboxall(thiss) {
               thiss.value =  ((thiss.checked)?1:0);
               objDom.setValorPorId(thiss.id, thiss.value);
               items =(document.getElementsByTagName("INPUT"));
               if (items != null){
                    for (i=0;i<items.length;i++)  {
                        if (items[i].id.indexOf("CSELECC_")!=-1){
                            if(items[i].checked != thiss.value){
                                var subid= items[i].id.substring(items[i].id.indexOf('_')+1);
                                if (subid){
                                    items[i].checked = thiss.checked;
                                    objDom.setValorPorId(items[i].id, thiss.value);
                                }
                            }
                        }
                    }

                    param = "operation=ajax_recliquiall";
                    param += "&SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
                    if (thiss.checked){
                        param +="&SELEC=1";
                    }else{
                        param +="&SELEC=0";
                    }
                    objAjax.invokeAsyncCGI("axis_axisctr079.do", f_callbackrecliqui, param, this);
                }
        }
        



        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            document.getElementById('NEW').value = "0";
            document.getElementById('SPROLIQ_SEL').value = "";
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        
        
        function f_but_nuevo_modal078(cual){
            f_cerrar_modal(cual);
            f_abrir_modal("axisctr165");
        }
        function f_Nueva_Liquidacion(cual, snuevo){
            document.getElementById('NEW').value = "1";
            document.getElementById('SPROLIQ_SEL').value = snuevo;
            f_cerrar_modal(cual);
            objUtiles.ejecutarFormulario("axis_axisctr079.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_onclickCheckbox(check, sprocliq, index){
            document.getElementById('SPROLIQ_SEL').value = sprocliq;
            objUtiles.ejecutarFormulario("axis_axisctr079.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
        function f_onclickCheckboxRec(check, NRECIBO){
            param = "operation=ajax_recliqui&NRECIBO="+NRECIBO;
            param += "&SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
            if (document.getElementById('rd_'+NRECIBO+'_pos').checked){
                param +="&SIGNO=1";
            }else{
                param +="&SIGNO=-1";
            }
            if (check.checked){
                param +="&SELEC=1";
                f_revisarChecks();
            }else{
                param +="&SELEC=0";
                document.getElementById('CSELEC_ALL').checked = false;
            }
            objAjax.invokeAsyncCGI("axis_axisctr079.do", f_callbackrecliqui, param, this);
            
            
        }
        function f_callbackrecliqui(ajaxResponseText){
            var doc = objAjax.domParse(ajaxResponseText);
            objAppMensajes.existenErroresEnAplicacion(doc);
        }
        function f_clickRBRecibos(rbutton,NRECIBO){
            param = "operation=ajax_recliqui&NRECIBO="+NRECIBO;
            param += "&SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
            if (document.getElementById('rd_'+NRECIBO+'_pos').checked){
                param +="&SIGNO=1";
            }else{
                param +="&SIGNO=-1";
            }
            
            
            if (document.getElementById("CSELECC_"+NRECIBO).checked){
                param +="&SELEC=1";
            }else{
                param +="&SELEC=0";
            }
            objAjax.invokeAsyncCGI("axis_axisctr079.do", f_callbackrecliqui, param, this);
        }
        function f_but_buscar_recibo(){
            var hayCCOMPANI = ${!empty __formdata.LSTLIQUIDACIONES[0].CCOMPANI};
            if (hayCCOMPANI){
                objUtiles.abrirModal('axisadm001', "src", "modal_axisadm001.do?operation=form&CCOMPANI="+"${__formdata.LSTLIQUIDACIONES[0].CCOMPANI}");        
            }else{
                objUtiles.abrirModal('axisadm001', "src", "modal_axisadm001.do?operation=form");        
            }       
        }
        function f_aceptar_modal_recerca_rebut(NRECIBO){
            f_cerrar_modal('axisadm001');
            
            param = "axis_axisctr079.do?NRECIBO="+NRECIBO;
            param += "&SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
            param +="&SIGNO=1";
            param +="&SELEC=1";
            objUtiles.ejecutarFormulario(param, "recliqui", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_checkAllRecibos(check){
            param = "axis_axisctr079.do?";
            param += "SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
            param +="&SIGNO=1";
            if (check.checked){
                param +="&SELEC=1";
            }else{
                param +="&SELEC=0";
            }
            objUtiles.ejecutarFormulario(param, "recliqui", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            
        }
        function f_cerrar_liq(nou_estat){
            param = "axis_axisctr079.do?";
            param += "SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
            param +="&CESTADO="+nou_estat;
            objUtiles.ejecutarFormulario(param, "set_movliqui", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cargar_productos(){
            document.getElementById('LSSELPRODUCTS').value = "";
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
             if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else{
                objDom.setValorComponente(document.miForm.CRAMO, null);
            }
            objUtiles.ejecutarFormulario("axis_axisctr079.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } 
        
        function callbackAjaxCargarProductos (ajaxResponseText){
                /*
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr079" c="COMBO_SVN" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   

                }*/
            }
            function f_buscar_Recibos(){
                if (objValidador.validaEntrada()) {
                    param = "axis_axisctr079.do?";
                    objUtiles.ejecutarFormulario(param, "buscar_rec", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_revisarChecks(){
                checkedall = true;
                var aaa = 0;
                items =(document.getElementsByTagName("INPUT"));
                if (items != null){
                    for (i=0;i<items.length;i++)  {                        
                        if (items[i].id.indexOf("CSELECC_")!=-1){                        
                        document.getElementById('CSELEC_ALL').checked                          
                            if(!items[i].checked){
                                checkedall = false;
                            }
                        }                        
                    }
                }
                if (checkedall){
                    document.getElementById('CSELEC_ALL').checked = true;
                }else{
                    document.getElementById('CSELEC_ALL').checked = false;
                }
                
                
            }
            
            function f_info_movimiento(){
                alert("TODO");
            }
            function f_info_recibo(NRECIBO){            
                param = "axis_axisctr079.do?NRECIBO="+NRECIBO;
                param += "&SPROLIQ=" + document.getElementById("SPROLIQ_SEL").value;
                if (document.getElementById('rd_'+NRECIBO+'_pos').checked){
                    param +="&SIGNO=1";
                }else{
                    param +="&SIGNO=-1";
                }
                
                param += "&MODIF=1";
                
                if (document.getElementById("CSELECC_"+NRECIBO).checked){
                    param +="&SELEC=1";
                }else{
                    param +="&SELEC=0";
                }
                
                //objUtiles.ejecutarFormulario("axis_axisctr079.do?NRECIBO="+NRECIBO+"&SPROLIQ_SEL"+document.getElementById('SPROLIQ_SEL').value, "consultarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);
                objUtiles.ejecutarFormulario(param, "consultarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function mostrar(nombreCapa){ 
                document.getElementById(nombreCapa).style.visibility="visible"; 
            } 

            function ocultar(nombreCapa){ 
                document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
            
            function f_seleccionarProd(valor,SPRODUC) {
                var LSSELPRODUCTS = document.getElementById("LSSELPRODUCTS").value;
                if (valor == 1){
                    if (LSSELPRODUCTS.indexOf(SPRODUC)==-1){
                        LSSELPRODUCTS = LSSELPRODUCTS + SPRODUC+",";
                    }
                }else {
                    LSSELPRODUCTS = LSSELPRODUCTS.replace(SPRODUC+",", "");
                }
                document.getElementById("LSSELPRODUCTS").value = LSSELPRODUCTS;
            }
            
            function f_revisarCheckProducto(){
                var LSSELPRODUCTS = document.getElementById("LSSELPRODUCTS").value;
                if (!objUtiles.estaVacio(LSSELPRODUCTS)){
                        var productes = new Array();
                        productes=LSSELPRODUCTS.split(",");
                        for (i=0;i<productes.length;i++)
                        {
                            if (document.getElementById('checkProducto_'+productes[i]) !=null){
                                document.getElementById('checkProducto_'+productes[i]).checked = "checked";
                            }
                            
                        }
                }
            }
            function f_modificaCab(sproces){
                objUtiles.abrirModal("axisctr165", "src", "modal_axisctr165.do?operation=form&SPROCES="+sproces);  
            }
            /** PER BORRAR
            
                function f_aceptar_modal(cual, params) {
                document.getElementById('NEW').value = "0";
                document.getElementById('SPROLIQ_SEL').value = "";
                f_cerrar_modal(cual);
                if (cual == 'axisctr078')
                objUtiles.ejecutarFormulario("axis_axisctr079.do" + params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
            */
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">    
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>    
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr079" c="LIQUIDACION_COMISIONES" lit="9001776"/></c:param>     <%-- LIQUIDACION DE COMISIONES --%>
                <c:param name="formulario"><axis:alt f="axisctr079" c="LIQUIDACION_COMISIONES" lit="9001776"/></c:param> <%-- LIQUIDACION DE COMISIONES --%>
                <c:param name="form">axisctr079</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr078|<axis:alt f="axisctr079" c="TITULO" lit="9901036"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr165|<axis:alt f="axisctr079" c="TITULO_MODAL165" lit="9901676"/></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm001|<axis:alt f="axisctr079" c="TITULOAXISADM001" lit="1000552"/></c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPROLIQ_SEL" id="SPROLIQ_SEL" value="${__formdata.SPROLIQ_SEL}"/>
        <input type="hidden" name="CEMPRES" id="CEMPRES" value="${__formdata.CEMPRES}"/>
        <input type="hidden" name="NMOVLIQ_" id="NMOVLIQ_" value="${__formdata.NMOVLIQ_}"/>
        <input type="hidden" name="INDEX_NMOVLIQ" id="INDEX_NMOVLIQ" value="${__formdata.INDEX_NMOVLIQ}"/>
        <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" name="TRAMO" id="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" name="NEW" id="NEW" value="${__formdata.NEW}"/>
        <input type="hidden" name="LSSELPRODUCTS" id="LSSELPRODUCTS" value="${__formdata.LSSELPRODUCTS}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>            
                <td colspan="2">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><axis:alt f="axisctr079" c="PROCESOS" lit="103256"/> </b>
                        <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisctr079" c="TMODAL" lit="100797"/>" onclick="f_abrir_modal('axisctr078');" style="cursor:pointer"/>                
                    </div>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title8"> </c:set>
                    <c:set var="title0"><axis:alt f="axisctr079" c="NPROCESO" lit="9000493"/></c:set>   <%-- Núm proceso --%>
                    <c:set var="title1"><axis:alt f="axisctr079" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                    <c:set var="title2"><axis:alt f="axisctr079" c="MESANO" lit="100562"/></c:set>  <%-- Mes/año --%>
                    <c:set var="title3"><axis:alt f="axisctr079" c="OBSER" lit="101162"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title4"><axis:alt f="axisctr079" c="FINILIQ" lit="9000526"/></c:set>   <%-- Fecha inicio --%>
                    <c:set var="title5"><axis:alt f="axisctr079" c="FFINLIQ" lit="9000527"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title6"><axis:alt f="axisctr079" c="IMPORTE" lit="100563"/></c:set>   <%-- Observaciones --%>
                    <c:set var="title7"><axis:alt f="axisctr079" c="CCOMPANI" lit="9000600"/></c:set>   <%-- Observaciones --%>
                    <% int i=0; %>
                    <c:set var="h"><%=i%></c:set>
                    <div id="dt_recibos" class="seccion displayspaceMaximo">
                        <display:table name="${__formdata.LSTLIQUIDACIONES}" id="LSTLIQUID" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr079.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>     
                            <display:column title="${title0}" sortable="true" sortProperty="SPROLIQ" headerClass="sortable"  media="html" autolink="false" >                                                                                                                
                                <div class="dspNumber">
                                        ${LSTLIQUID.SPROLIQ}
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="TEMPRES" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        ${LSTLIQUID.TEMPRES}
                                </div>
                            </display:column>
                             <display:column title="${title7}" sortable="true" sortProperty="TEMPRES" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        ${LSTLIQUID.TCOMPANI}
                                </div>
                            </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="FLIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FLIQUIDA}"/>
                                </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="FINILIQ" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FINILIQ}"/>
                                </div>
                            </display:column>
                             <display:column title="${title5}" sortable="true" sortProperty="FFINLIQ" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                     <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTLIQUID.FFINLIQ}"/>
                                </div>
                            </display:column>
                               <display:column title="${title6}" sortable="true" sortProperty="IMPORTE" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTLIQUID.IMPORTE}'/>
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="TLIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                        ${LSTLIQUID.TLIQUIDA}
                                </div>
                            </display:column>
                            <display:column title="" sortable="true" sortProperty="TLIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                        <img border="0" style="cursor:pointer" onclick="f_modificaCab('${LSTLIQUID.SPROLIQ}');"
                                             alt='<axis:alt f="axisctr079" c="EDITAR" lit="100002"/>'
                                             title='<axis:alt f="axisctr079" c="EDITAR" lit="100002"/>'
                                             src="images/lapiz.gif"/>
                                </div>
                            </display:column>
                            
                            
                            <%i++;%>
                            <c:set var="h"><%=i%></c:set>
                        </display:table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><axis:alt f="axisctr079" c="MOVIMIENTOS" lit="100913"/> </b><%-- Movimientos --%>
                    </div>
                </td>
            </tr>
            <tr>            
                <td>
                    <div class="separador">&nbsp;</div>
                    <c:set var="title8"> </c:set>
                    <c:set var="title0"><axis:alt f="axisctr079" c="NMOVIMI" lit="9001954"/></c:set>   <%-- Núm movimiento --%>
                    <c:set var="title1"><axis:alt f="axisctr079" c="CESTADO" lit="101510"/></c:set>   <%-- Estado --%>
                    <c:set var="title2"><axis:alt f="axisctr079" c="FECHA" lit="100562"/></c:set>  <%-- Fecha --%>
                    <c:set var="title3"><axis:alt f="axisctr079" c="IMPORTE" lit="100563"/></c:set>   <%-- Importe --%>
                    <c:set var="title4"><axis:alt f="axisctr079" c="USUARIO" lit="100894"/></c:set>  <%-- Usuario --%>
                    <c:set var="title5"><axis:alt f="axisctr079" c="DETALLE" lit="102239"/></c:set>   <%-- Detalle --%>
                    <% int y=0; %>
                    <c:set var="z"><%=y%></c:set>
                    <div id="dt_recibos" class="seccion displayspaceMaximo" width="80%">
                        <display:table name="${__formdata.LSTLIQUIDACIONES[0].MOVIMIENTOS}" id="LSTMOVIMIENTOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr079.do?paginar=true">
                            <%@ include file="../include/displaytag.jsp"%>     
                            <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_LIQUIDA_MOV.NMOVLIQ" headerClass="sortable"  media="html" autolink="false" >                                                                                                                
                                <div class="dspNumber">
                                        ${LSTMOVIMIENTOS.OB_IAX_LIQUIDA_MOV.NMOVLIQ}
                                </div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_LIQUIDA_MOV.TESTLIQ" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        ${LSTMOVIMIENTOS.OB_IAX_LIQUIDA_MOV.TESTLIQ}
                                </div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_LIQUIDA_MOV.FALTA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTMOVIMIENTOS.OB_IAX_LIQUIDA_MOV.FALTA}"/>
                                </div>
                            </display:column>
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_LIQUIDA_MOV.ITOTLIQ" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber">                                    
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTMOVIMIENTOS.OB_IAX_LIQUIDA_MOV.ITOTLIQ}'/>
                                </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="B_IAX_LIQUIDA_MOV.CUSUALT" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                        ${LSTMOVIMIENTOS.OB_IAX_LIQUIDA_MOV.CUSUALT}
                                </div>
                            </display:column>
                            <%y++;%>
                            <c:set var="h"><%=y%></c:set>
                        </display:table>
                    </div>
                </td>
                <td width="50%">
                    <table width="100%">
                        <tr><td>&nbsp;</td></tr>
                        <tr><td>
                    <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ eq 1}">  
                        <input type="button" class="boton" id="but_cerrar" style="display:block;vertical-align: middle; margin:0 auto;" value="<axis:alt f="axisctr079" c="CERRAR" lit="1000430"/>" onclick="f_cerrar_liq(2)" />
                    </c:if>
                    <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ ne 1}">  
                        <input type="button" class="boton" id="but_cerrar" value="<axis:alt f="axisctr079" c="ABRIR" lit="9001302"/>" onclick="f_cerrar_liq(1)" />
                    </c:if>
                    </td></tr></table>
                </td>
            </tr>
            <c:if test="${__formdata.NEW eq 1}"> 
            <tr>
                <td colspan="2">
                 <div class="separador">&nbsp;</div>
                    <table>
                      <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                    
                        <tr>
                                <div class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr079" c="BUSCARMOVIMIENTOS" lit="100797"/> </b><%-- Buscar --%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <%--axis:ocultar f="axisctr078" c="CCOMPANI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr079" c="CCOMPANI" lit="9000600"/></b><!-- Cod. Compañía -->       
                                    </td>
                            </axis:ocultar--%>
                            <axis:ocultar f="axisctr019" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr079" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr079" c="CRAMO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:90%;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr079" c="COMBO_SVN" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${__formdata.CIAS}">
                                                <option value = "${ramos.CRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                            </axis:ocultar>
                            <axis:visible f="axisctr078" c="BTN_BUSCAR"> 
                                <td>
                                 <input  type="button" class="boton" id="but_cerrar" value="<axis:alt f="axisctr079" c="BUSCAR" lit="100797"/>" onclick="f_buscar_Recibos()" />
                                </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisctr079" c="SPRODUC" dejarHueco="false">
                            <td colspan="2" class="campocaja">
                               <!-- DisplayTag productes -->
                                <c:set var="title0">
                                   <axis:alt f="axisctr079" c="TITULO0" lit="1000307"/>
                                </c:set>
                                <div id="dt_productos" class="displayspace">
                                  <%int contador = 0;%>
                                    <display:table name="${__formdata.axisctr_listaProductos}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                     requestURI="axis_${pantalla}.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                            <div class="dspIcons">
                                            <input <c:if test="${miListaIdProductes.MARCAT == 1}">checked</c:if> 
                                            onclick="f_seleccionarProd(  ((this.checked)?1:0)    ,'${miListaIdProductes['SPRODUC']}');"
                                                 type="checkbox" name="checkProducto_${miListaIdProductes['SPRODUC']}" id="checkProducto_${miListaIdProductes['SPRODUC']}"/></div>
                                        </display:column>
                                        <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                            <div class="dspText">${miListaIdProductes['TTITULO']}</div>
                                            <input type="hidden" id="SPRODUC_<%=contador%>" name="SPRODUC_<%=contador%>" value="${miListaIdProductes['SPRODUC']}"/>
                                        </display:column>
                                        
                                        <%contador++;%>
                                    </display:table>
                                </div>
                            
                            </axis:ocultar>
                            </td>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="FEFECTODESDE">
                            <td class="titulocaja">
                                 <b><axis:alt f="axisctr079" c="FEFECTO" lit="100883"/>&nbsp;<axis:alt f="axisctr079" c="DESDE" lit="104095"/></b>
                             </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="FEFECTOHASTA"> 
                                <td class="titulocaja">
                                <b><axis:alt f="axisctr079" c="FEFECTO" lit="100883"/>&nbsp;<axis:alt f="axisctr079" c="HASTA" lit="140773"/></b>
                                </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <axis:visible f="axisctr078" c="FEFECTODESDE"> 
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTODESDE}"/>" name="FEFECTODESDE" id="FEFECTODESDE"
                                title="<axis:alt f="axisctr078" c="FEFECTODESDE" lit="1000554"/>"
                                <axis:atr f="axisctr078" c="FEFECTODESDE" a="obligatorio=false&formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEFECTODESDE" alt="<axis:alt f="axisctr078" c="FEFECTODESDE" lit="1000554"/>" title="<axis:alt f="axisctr078" c="FEFECTODESDE" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:visible>
                            <axis:visible f="axisctr078" c="FEFECTOHASTA"> 
                            <td class="campocaja">                             
                                <input type="text"  class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTOHASTA}"/>" name="FEFECTOHASTA" id="FEFECTOHASTA"
                                title="<axis:alt f="axisctr078" c="FEFECTOHASTA" lit="1000555"/>"
                                <axis:atr f="axisctr078" c="FEFECTOHASTA" a="obligatorio=false&formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEFECTOHASTA" alt="<axis:alt f="axisctr078" c="FEFECTOHASTA" lit="1000555"/>" title="<axis:alt f="axisctr078" c="FEFECTOHASTA" lit="1000555"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:visible>
                            
                        </tr>
                    </table>
                </td>
            </tr>
            </c:if>
             <tr>            
                <td colspan="2">
                    <div class="separador">&nbsp;</div>
                    <div class="titulo">
                        <img src="images/flecha.gif"/><b><axis:alt f="axisctr079" c="RECIBOS" lit="100581"/> </b><%-- Recibos --%>
                    </div>
                    <div class="separador">&nbsp;</div>
                </td>
            </tr>
            <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ eq 1}">
            <tr>
                <td colspan="2">
                    <div style="float:right;">
                        <a href="javascript:f_but_buscar_recibo();">
                            <img border="0" alt="<axis:alt f="axisctr079" c="BUSCAR" lit="100797"/>" title="<axis:alt f="axisctr079" c="BUSCAR" lit="100797"/>" src="images/new.gif"/>
                        </a>
                    </div>
                </td>
            </tr>
            </c:if>
            <tr>
                <td colspan="2">
                    <c:set var="title11"> <input type="checkbox" id="CSELEC_ALL" name="CSELEC_ALL" onclick="f_onclickCheckboxall(this)" <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ ne 1}"> disabled="disabled" </c:if> /></c:set>
                    <c:set var="title0"><axis:alt f="axisctr079" c="RECIBO" lit="100895"/>  </c:set> <%-- Recibo --%>
                    <c:set var="title1"><axis:alt f="axisctr079" c="RECIBOCIA" lit="9001763"/> </c:set>  <%-- Recibo compañia --%>
                    <c:set var="title2"><axis:alt f="axisctr079" c="FEFECTO" lit="100883"/> </c:set> <%-- Fecha efecto --%>
                    <c:set var="title3"></c:set>
                    <c:set var="title4"><axis:alt f="axisctr079" c="ESTRECIBO" lit="1000553"/> </c:set> <%-- Estado recibo --%>
                    <c:set var="title6"><axis:alt f="axisctr079" c="COMSION" lit="101509"/> </c:set>  <%-- Comision --%>
                    <c:set var="title7"><axis:alt f="axisctr079" c="IMPORTE" lit="100563"/> </c:set>  <%-- Importe --%>
                    <c:set var="title8"><axis:alt f="axisctr079" c="NPOLIZA" lit="100624"/> </c:set>  <%-- Nº poliza --%>
                    <c:set var="title9"><axis:alt f="axisctr079" c="NPOLCIA" lit="9901675"/> </c:set>  <%-- Nº poliza compañia --%>
                    <c:set var="title5"><axis:alt f="axisctr079" c="DETALLE" lit="102239"/> </c:set>  <%-- Detalle --%>
                    <c:set var="title13">+/- </c:set>
                    <c:set var="title14"><axis:alt f="axisctr079" c="MASINFO" lit="1000113"/></c:set><!--  más informacion-->
                    <c:set var="title15"><axis:alt f="axisctr079" c="TRECIBO" lit="102302"/> </c:set>  <%-- Tipo recibo --%>
                    
                    <c:set var="title16"><axis:alt f="axisctr079" c="TIT_FICHERO" lit="9001776"/></c:set> <!--  titulo fichero-->
                    <c:set var="title17"><axis:alt f="axisctr079" c="TIT_BANNER" lit="9901613"/></c:set> <!--  literal banner-->
                    <c:set var="title19"><axis:alt f="axisctr079" c="ESTALIQUIDADO" lit="9902063"/></c:set> <!--  Liq. -->
                    <c:set var="title20"><axis:alt f="axisctr079" c="AGENTE" lit="100584"/></c:set> <!-- Agente -->
                    
                    <% int z=0; %>
                    <c:set var="o"><%=z%></c:set>
                    
                    <div id="dt_recibos" class="seccion displayspaceMaximo" >
                        <display:table name="${__formdata.LSTLIQUIDACIONES[0].RECIBOS}" id="LSTRECIBOS" export="true" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                             requestURI="axis_axisctr079.do?paginar=true" style="width:99.9%">
                            <%@ include file="../include/displaytag.jsp"%>     
                            <display:column title="${title11}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                <input type= "checkbox" id="CSELECC_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}" name="CSELECC_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}" onclick="f_onclickCheckboxRec(this,'${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}');"
                                <c:if test="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.CSELECC eq 1}"> checked</c:if>  value="${LSTRECIBOS.OB_IAX_RECIBOS.PLIQSELEC}" 
                                <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ ne 1}"> disabled="disabled" </c:if>/> 
                            </display:column>                               
                            <display:column title="${title0}" sortable="false" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >                                                                                                                
                                <div class="dspNumber">
                                        ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO} 
                                </div>
                            </display:column>                            
                            <display:column title="${title1}" sortable="false" sortProperty="CRECCIA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.CRECCIA}
                                </div>
                            </display:column>                            
                            <display:column title="${title2}" sortable="false" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.FEFECTO}"/>
                                </div>
                            </display:column>                            
                            <display:column title="${title4}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                         ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.TESTREC}                    
                                </div>
                            </display:column>                            
                            <display:column title="${title7}" sortable="false" sortProperty="ICOMISI" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber"> 
                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.IMPORTE}'/>
                                </div>
                            </display:column>                            
                            <display:column title="${title6}" sortable="false" sortProperty="ILIQUIDA" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspNumber">                                    
                                     <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ILIQUIDA}'/>
                                </div>
                            </display:column>                            
                            <display:column title="${title8}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">
                                    ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.POLIZA.NPOLIZA}
                                </div>
                            </display:column>                            
                            <display:column title="${title9}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                        ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.POLIZA.CPOLCIA}             
                                </div>
                            </display:column>                            
                            <display:column title="${title15}" sortable="false" sortProperty="TTIPREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                        ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.TTIPREC}          
                                </div>
                            </display:column>                            
                            <display:column title="${title13}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                          
                                        <input type="radio" id="rd_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}_pos"  name="rd_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}"
                                        onclick="f_clickRBRecibos(this, '${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}');" <c:if test="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ILIQUIDA >= 0}"> checked</c:if> 
                                        <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ ne 1}"> disabled="disabled" </c:if>/>                   
                                        <input type="radio" id="rd_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}_neg"  name="rd_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}"
                                        onclick="f_clickRBRecibos(this, '${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}');" <c:if test="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ILIQUIDA < 0
                                        }"> checked</c:if> 
                                        <c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ ne 1}"> disabled="disabled" </c:if>/>                   
                                </div>
                            </display:column>
                             <display:column title="${title19}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                <input type= "checkbox" id="ESTALIQUIDADO_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}" name="ESTALIQUIDADO_${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}" 
                                <c:if test="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ESTALIQUIDADO eq 1}"> checked</c:if>  value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ESTALIQUIDADO}" disabled /> 
                            </display:column>                              
                            <display:column title="${title5}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">                                    
                                    <img  border="0"  src="images/mas.gif" onclick="f_info_recibo(${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO})" style="cursor:pointer"/>                
                                </div>
                            </display:column>
                            <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                <div class="dspIcons"><img border="0" alt="<axis:alt f="axisctr079" c="MASINFO" lit="1000113"/>" title1="<axis:alt f="axisctr079" c="MASINFO" lit="1000113"/>" src="images/informacion.gif" width="11px" height="11px"
                                style="cursor:pointer;" onmouseout="javascript:ocultar('SECCION_D${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}')" onmouseover="javascript:mostrar('SECCION_D${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}')" /></div>
                            </display:column>
                             <!-- *************************** SECCION MÁS DATOS ********************************* -->     
                            <display:column class="seccion_informacion" media="html">
                            <div id="SECCION_D${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO}"  style="height:150px" class="seccion_informacion">
                                <!-- INICIO SECCION -->
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                     </tr>
                                    <tr>
                                        <!-- Agente -->
                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                            <b><axis:alt f="axisctr079" c="AGENTE" lit="100584"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                            <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1"  style="width:100%"
                                            value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.TAGENTE}"   
                                            readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Compañia -->
                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                            <b><axis:alt f="axisctr079" c="COMPANIA" lit="9901223"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                         <!-- Tipo destinatario -->
                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                            <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:100%"
                                            value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.TCOMPANI}"   
                                            readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Producte -->
                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                            <b> <axis:alt f="axisctr079" c="PRODUCTO" lit="100829"/>  </b>
                                        </td>
                                    </tr>
                                    <tr>
                                         <!-- Tipo destinatario -->
                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                            <input type="text" class="campo campotexto" id="CAMPO1" name="CAMPO1" size="15" style="width:100%"
                                            value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.POLIZA.TPRODUC}"   
                                            readonly="readonly"/>
                                        </td>
                                    </tr>
                                    </table>
                                </div>
                            </display:column>
                            
                            <axis:visible c="EXPORT" f="axisctr079">
                                <display:column title="${title0}" sortable="false" sortProperty="NRECIBO" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                                                                                                
                                            ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.NRECIBO} 
                                </display:column>
                                <display:column title="${title1}" sortable="false" sortProperty="CRECCIA" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                        ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.CRECCIA}                                
                                </display:column>
                                <display:column title="${title2}" sortable="false" sortProperty="FEFECTO" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.FEFECTO}"/>                                
                                </display:column>
                                <display:column title="${title4}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                             ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.TESTREC}                                                    
                                </display:column>                                
                                <display:column title="${title7}" sortable="false" sortProperty="ICOMISI" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                            <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.IMPORTE}'/>                                
                                </display:column>                                
                                <display:column title="${title6}" sortable="false" sortProperty="ILIQUIDA" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                         <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ILIQUIDA}'/>                                
                                </display:column>
                                <display:column title="${title8}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                        ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.POLIZA.NPOLIZA}                                
                                </display:column>
                                <display:column title="${title9}" sortable="false" sortProperty="TESTREC" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                            ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.POLIZA.CPOLCIA}             
                                </display:column>
                                <display:column title="${title15}" sortable="false" sortProperty="TTIPREC" headerClass="sortable"  media="csv xml excel pdf" autolink="false" >                                
                                            ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.RECIBO.TTIPREC}                                          
                                </display:column>
                                <display:column title="${title19}" sortable="false" sortProperty="ESTALIQUIDADO" headerClass="sortable"   media="csv xml excel pdf"  autolink="false" >
                                	${LSTRECIBOS.OB_IAX_LIQUIDA_REC.ESTALIQUIDADO}
                                
                            		</display:column>  
                                <display:column title="${title20}" sortable="false" sortProperty="AGENTE" headerClass="sortable" media="csv xml excel pdf" autolink="false" >
                                  ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.CAGENTE} - ${LSTRECIBOS.OB_IAX_LIQUIDA_REC.TAGENTE}
                                </display:column>                                
                            </axis:visible>
                                    <!-- *************************** SECCION MÁS DATOS ********************************* --> 
                            <%y++;%>
                            <c:set var="o"><%=z%></c:set>                            
                            <axis:visible c="EXPORT" f="axisctr079">                                                            
                                <display:setProperty name="export.pdf" value="true" />
                                <display:setProperty name="export.pdf.class" value="org.displaytag.export.PdfView" />
                                <display:setProperty name="export.pdf.filename" value="${title16}.pdf" /> 
                                <display:setProperty name="export.excel.filename" value="${title16}.xls" />
                                <display:setProperty name="export.csv.filename" value="${title16}.csv" />
                                <display:setProperty name="export.xml.filename" value="${title16}.xml" /> 
                                <display:setProperty name="export.banner" value="<div class='gridexportlinks'>${title17}: {0}</div>"/> 
                            </axis:visible>
                        </display:table>
                    </div>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">salir<c:if test="${__formdata.LSTLIQUIDACIONES[0].CESTLIQ eq 1}">,9001771</c:if></c:param> 
            <c:param name="f">axisctr079</c:param>
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTODESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTODESDE", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEFECTOHASTA",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFECTOHASTA",  
            singleClick    :    true,
            firstDay       :    1
        });
        
    </script>
</body>
</html>