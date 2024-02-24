<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%
/**
*  Fichero: axisctr071.jsp
*  Fecha: 21/05/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.ArrayList" %>

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
    
    <script language="Javascript" type="text/javascript">
        var vcactivi = '';
        function f_onload() {
        		 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr071');
						</c:if>
            vcactivi = '${__formdata['CACTIVI']}';
            f_cargar_propiedades_pantalla();
           //document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
           
            f_cargar_cobjase();
	    try{
            if (${requestScope.buscarOK == true}) 
                parent.f_aceptar_modal('axisctr071');
            else
                if (objUtiles.estaVacio (${__configform.axisctr071__CAGENTE__visible}) ||
                   "${__configform.axisctr071__CAGENTE__visible}"){
                    document.miForm.CAGENTE.focus();
                }
                else{
                    document.miForm.ramoProducto.focus();
                } 
              }catch(e){}
             
             
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal("axisctr071");
        }        
        
        function f_but_buscar() {            
            if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisctr071.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                    }
         
        function f_but_aceptar (cual,COBJASE) {                      
            var SSEGURO = "";
            document.miForm.COBJASE.value = COBJASE;
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                SSEGURO = cual;
            else if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                var hayChecked = objUtiles.f_GuardaCasillasChecked("checked_poliza");
                var SSEGURO = objUtiles.utilSplit(hayChecked, "/")[0]; // SSEGURO
                COBJASE = objUtiles.utilSplit(hayChecked, "/")[1]; // COBJASE
                document.miForm.COBJASE.value = COBJASE;
            } 
            
            if (typeof SSEGURO == 'boolean' || objUtiles.estaVacio (SSEGURO)) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
                // Si hay una seleccionada, llamar al Action.               
                f_valida_rehabilita(SSEGURO);
         }
         var vSSEGURO = '';
        function f_valida_rehabilita(SSEGURO){
            objAjax.invokeAsyncCGI("modal_axisctr071.do", f_callbackAjaxValidarRehabilita, "operation=ajax_validar_rehabilita&SSEGURO=" + SSEGURO, this, objJsMessages.jslit_cargando);
            vSSEGURO = SSEGURO;
        }
        function f_callbackAjaxValidarRehabilita(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                parent.f_aceptar_axisctr071(vSSEGURO, document.miForm.COBJASE.value);
            }
        }
        
      /*  function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                objDom.setValorPorId("TAGENTE", NOMBREformateado);
            }
        }*/
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                var ctipage_busc = document.getElementById("CTIPAGE_BUSC").value; 
                var donde = document.miForm.DONDE.value;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                
                    if (donde == 1){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                        objDom.setValorPorId("TAGENTE", NOMBREformateado);
                        }
                    else{
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_"+document.getElementById("CTIPAGE_BUSC").value, CAGENTEformateado);
                        objDom.setValorPorId("NOMBRE_"+document.getElementById("CTIPAGE_BUSC").value, NOMBREformateado);
                    }
                }
                 $.reinitialiseScroll(); 
            }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);
                }
            }
        }
        
        function f_actualizar_agente(){
             objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarAgente,
                                    "operation=ajax_actualizar_agente&CAGENTE_COD=" + objDom.getValorComponente(document.miForm.CAGENTE),
                                    this, objJsMessages.jslit_cargando);
        }
        
      /*  function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }*/
        
        function f_abrir_axisctr014(tipage) {        
                document.miForm.CTIPAGE_BUSC.value = tipage;
                
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value)){
                    document.miForm.DONDE.value = 2;
                     objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=CTIPAGECON_"+tipage+"&CTIPAGE="+tipage);
                }else{
                 document.miForm.DONDE.value = 1;
                 objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
                } 
            }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    

    /*    function f_aceptar_axisctr014 (CAGENTE){
            objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            f_cerrar_axisctr014();
        }*/

        function f_aceptar_axisctr014 (CAGENTE){
                //objDom.setValorPorId("CAGENTE", CAGENTE);            
                f_cerrar_axisctr014();
                if (!objUtiles.estaVacio(document.miForm.CTIPAGE_BUSC.value))
                    objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                else
                {
                    objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCambiarAgente2, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
                }
            }
            
            function callbackAjaxCambiarAgente2(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
       
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                  //  objDom.setValorPorId("TAGENTE", NOMBREformateado);
                }
            }

        function f_cargar_productos(){
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                    "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&PTIPO="+document.miForm.PTIPO.value, this, objJsMessages.jslit_cargando);
        }      

        function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                
                var SPRODUCCombo = document.miForm.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr071" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                   for (i = 0; i < elementos.length; i++) {
                        var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                        objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                    }
                if (document.getElementById('CACTIVI')!=null){
                    f_cargar_actividades();
                    amagarDisplay();
                }
            }
            
         
        } 
        
        function f_cargar_actividades(){
            if (document.getElementById('CACTIVI')!=null){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else{
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                }
                url ="operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                url += "&SPRODUC="+objDom.getValorComponente(document.miForm.SPRODUC);
                objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarActividades, url, this, objJsMessages.jslit_cargando);
            }
            
        }  
        function callbackAjaxCargarActividades (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("OB_IAX_PRODACTIVIDADES");
                var CACTIVICombo = document.miForm.CACTIVI;     
                objDom.borrarOpcionesDeCombo(CACTIVICombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr071" c="CSITUAC" lit="108341"/> - ', CACTIVICombo, 0);
                   for (i = 0; i < elementos.length; i++) {
                        var CACTIVI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0);
                        var TITULO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TACTIVI"), 0, 0);
                        objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
                    }
            }
            if (!objUtiles.estaVacio(vcactivi)) {
                document.miForm.CACTIVI.value = vcactivi; 
                vcactivi = '';
            }
        }
        
        function amagarDisplay(){
            try{
                var tbodyadded = objLista.obtenerBodyLista("miListaId");
                var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                objLista.borrarFilasDeLista ("miListaId", "15", "<axis:alt f="axisctr071" c="miListaId" lit='1000254' />");                    
                var spanners = document.getElementsByTagName("span");
                for(var i=0;i<spanners.length;i++) {
                    if (spanners[i].className == "gridpagebanner")
                        spanners[i].innerHTML = "";
                    if (spanners[i].className == "gridpagelinks")
                        spanners[i].innerHTML = ""; 
                }
           } catch(e){alert(e);}
        }
         /*     *************************************  ACTUALIZAR COBJASE ***********************************        */  
           function f_cargar_cobjase(){
            f_carga_dependencias();
            SPRODUC = document.miForm.SPRODUC.value;
                if (!objUtiles.estaVacio(SPRODUC)){
                    objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
                } 
           }

        function callbackAjaxCargarCobjase (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
                //antes de marcar, desmarcamos todos posibles, recorriendo todos los radios con id de "CTIPRIESGO_*"
                var radios=document.getElementsByTagName("input");
                for (var iradios=0;iradios<radios.length;iradios++) {
                    if (radios[iradios].id!=undefined&&radios[iradios].id.indexOf("CTIPRIESGO_")==0) {
                        radios[iradios].checked=false;
                    }
                }
                document.miForm.COBJASE.value = COBJASE;  
                try {
                    document.getElementById("CTIPRIESGO_"+COBJASE).checked = true;
                }
                catch(eee) {
                }        
                
                
                if (document.getElementById('CACTIVI')!=null){
                    f_cargar_actividades();
                }
                f_carga_dependencias();
            }
        }
          /*     *************************************  ACTUALIZAR COBJASE ***********************************        */   
            
        
        function f_cargar_ramos(){
            var ccompani = objDom.getValorPorId("CCOMPANI");
            if (!objUtiles.estaVacio(ccompani)) {
                if (document.getElementById('ramoProducto')!= null){
                    if (document.getElementById('ramoProducto').options[0]!=null){
                        document.getElementById('ramoProducto').value = document.getElementById('ramoProducto').options[0].value;
                    }    
                }
                
                if (document.getElementById('SPRODUC')!= null){
                    if (document.getElementById('SPRODUC').options[0]!=null){
                        document.getElementById('SPRODUC').value = document.getElementById('SPRODUC').options[0].value;
                    }
                }
            }
            objDom.setValorComponente(document.miForm.CRAMO, null);
            objDom.setValorComponente(document.miForm.TRAMO, null);
            objAjax.invokeAsyncCGI("modal_axisctr071.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CCOMPANI=" + ccompani, this, objJsMessages.jslit_cargando);
        }
        function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr071" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);                                     
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }
                   f_cargar_productos();

                }
            }  
            
        function f_refrescarDependencias(valor){
            document.miForm.COBJASE.value = valor;  
           f_cargar_propiedades_pantalla(); 
           
        }    
    </script>
  </head>
    <body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
      <div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

        <form name="miForm" action="" method="POST">

            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr071" c="BUSQAGE" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>

            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="PTIPO" name="PTIPO" value="${__formdata.PTIPO}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/> 
            
            <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}"/>  
            <input type="hidden" name="CTIPAGE_BUSC" id="CTIPAGE_BUSC" value="${__formdata.CTIPAGE_BUSC}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr071" c="BUSQPOLAN" lit="9001668"/></c:param>
                <c:param name="producto"><axis:alt f="axisctr071" c="BUSQPOLAN" lit="9001668"/></c:param>
                <c:param name="form">axisctr071</c:param>
            </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <axis:visible c="DSP_TITULO_POL" f="axisctr071">
                            <tr>
                                <td class="titulo" colspan="10">          
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr071" c="titulo" lit="103593" /> </b>
                                </td> 
                            </tr>
                            </axis:visible>                                    
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                 
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr071" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="CAGENTE" lit="100584"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr071" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="3">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"  title="<axis:alt f="axisctr071" c="CAGENTE" lit="100584"/>"  style="width:15%"
                                        title="<axis:alt f="axisctr071" c="CAGENTE" lit="100584"/>" onchange="f_actualizar_agente()" />
                                        
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        
                                        <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisctr071" c="CAGENTE" lit="100584"/>" size="15" style="width:76%" readonly="true"
                                        title="<axis:alt f="axisctr071" c="CAGENTE" lit="100584"/>"/>
                                    </td>
                                </axis:ocultar>                            
                            </tr>
                             <tr>
                                <td colspan="6">
                                <axis:ocultar f="axisctr071" c="DSP_NIVELES">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                            <th style="width:16%;height:0%;"/>
                                        </tr>
                                       <%  HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);  %>
                                                             
                                        <tr>
                                            <%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
                                                ArrayList niveles_age = null;
                                                if (request.getSession().getAttribute("AGENIVELES") != null){
                                                    niveles_age= (ArrayList)request.getSession().getAttribute("AGENIVELES");
                                                }
                                            %>
                                            <%if(niveles_age!=null){
                                                  for (int j=0;j<niveles_age.size();j=j+3){ 
                                                    if(j< niveles_age.size() &&((HashMap)niveles_age.get(j)).get("DESCRIP")!=null ) { %>
                                                        <c:set var="CTIPAGE_DESC"><%=((HashMap)niveles_age.get(j)).get("DESCRIP")%></c:set>
                                                        <c:set var="CTIPAGE"><%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%></c:set>
                                                        <%if(j+1< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC1"><%=((HashMap)niveles_age.get(j+1)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE1"><%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <%if(j+2< niveles_age.size()) { %>
                                                            <c:set var="CTIPAGE_DESC2"><%=((HashMap)niveles_age.get(j+2)).get("DESCRIP")%></c:set>
                                                            <c:set var="CTIPAGE2"><%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%></c:set>
                                                        <%}%>
                                                        <tr>
                                                            <td class="titulocaja" colspan="2">
                                                                <b><axis:alt f="axisctr019" c="TIPDESC_<%=j%>" lit="${CTIPAGE_DESC}"></axis:alt></b>
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr019" c="TIPDESC_<%=j+1%>" lit="${CTIPAGE_DESC1}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisctr019" c="TIPDESC_<%=j+2%>" lit="${CTIPAGE_DESC2}"></axis:alt></b>
                                                                </td>
                                                            <%}%>
                                                        <tr>
                                                            <td class="campocaja" colspan="2">
                                                                <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "b"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE"))%></c:set>
                                                                <% } %>
                                                                <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "c"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j)).get("CTIPAGE"))%></c:set>
                                                                <% } %>
                                                                <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" title="${CTIPAGE_DESC}" id="CAGENTE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>"
                                                                value="${b}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE})" style="cursor:pointer"/>
                                                                <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j)).get("CTIPAGE")%>" value="${c}" class="campowidthinput campo campotexto" style="width:70%" />
                                                            </td>
                                                            <%if(j+1< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "d"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "e"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+1)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" title="${CTIPAGE_DESC1}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>"
                                                                    value="${d}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE1})" style="cursor:pointer"/> 
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+1)).get("CTIPAGE")%>" value="${e}" class="campowidthinput campo campotexto" style="width:70%" />
                                                                </td>
                                                            <%}%>
                                                            <%if(j+2< niveles_age.size()) { %>
                                                                <td class="campocaja" colspan="2">
                                                                    <% if(formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "f"><%=formdata.get("CAGENTE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <% if(formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE")) != null){ %>
                                                                        <c:set var= "g"><%=formdata.get("NOMBRE_"+ ((HashMap)niveles_age.get(j+2)).get("CTIPAGE"))%></c:set>
                                                                    <% } %>
                                                                    <input readonly="true" type="text" name="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" title="${CTIPAGE_DESC2}" id="CAGENTE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>"
                                                                    value="${f}" class="campowidthinput campo campotexto" style="width:20%" formato="entero" onchange="f_actualizar_agente()" />
                                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014(${CTIPAGE2})" style="cursor:pointer"/>  
                                                                    <input readonly="true" type="text" name="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" id="NOMBRE_<%=((HashMap)niveles_age.get(j+2)).get("CTIPAGE")%>" value="${g}" class="campowidthinput campo campotexto" style="width:70%"/>
                                                                </td>
                                                            <%}%>
                                                        </tr>
                                                    <%}%>
                                                <%}%>
                                            <%}%>
                                        </tr>
                                    </table>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr071" c="CCOMPANIA" dejarHueco="false">                            
                                 <td class="titulocaja" id="LIT_CCOMPANIA">
                                     <b><axis:alt f="axisctr071" c="CCOMPANIA" lit="9000600"/></b><%-- Compañia --%>                              
                                 </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr071" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr071" c="PROD" lit="100829" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr071" c="NPOLIZA" lit="100836" /></b>
                                </td>
                                <axis:ocultar f="axisctr071" c="NCERTIF">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="CERTIF" lit="101300"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr071" c="CCOMPANIA" dejarHueco="false">                            
                                 <td class="campocaja"> 
                                    <select name="CCOMPANI"  obligatorio="false" id ="CCOMPANI"  size="1" class="campowidthselect campo campotexto" onchange="f_cargar_ramos()" style="width:180px">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr165" c="COMBO_SVN" lit="1000348"/> - </option>
                                        <c:forEach var="CIA" items="${__formdata.CIAS}">
                                            <option value="${CIA.CCOMPANI}"
                                            <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                            ${CIA.TCOMPANI}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr071" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                   <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr071" c="SPRODUC" lit="108341"/> - </option>
                                            <c:forEach items="${requestScope.listaRamos}" var="ramos">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata['CRAMO']}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_cargar_cobjase()" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr071" c="SPRODUC" lit="108341" /> - </option>
                                        <c:forEach items="${requestScope.LST_PRODUCTOS}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisctr071" c="NPOLIZA" lit="100836"/>" size="15" 
                                    title="<axis:alt f="axisctr071" c="NPOLIZA" lit="100836"/>"/>
                                </td>
                                <axis:ocultar f="axisctr071" c="NCERTIF">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF"
                                        formato="entero" title="<axis:alt f="axisctr071" c="NCERTIF" lit="101096"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                             <tr>
                                <axis:ocultar f="axisctr071" c="CPOLCIA">
                                    <td id="tit_CPOLCIA" class="titulocaja">
                                        <b id="label_CPOLCIA"><axis:alt f="axisctr071" c="CPOLCIA" lit="9001766"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr071" c="CACTIVI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="ACTIVIDAD" lit="103481"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>                                
                                 <axis:ocultar f="axisctr071" c="CPOLCIA">
                                    <td id="td_CPOLCIA" class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA"
                                         title="<axis:alt f="axisctr071" c="CPOLCIA" lit="9001766"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:visible f="axisctr071" c="CACTIVI">
                                    <td class="campocaja">
                                        <select name="CACTIVI" id ="CACTIVI" size="1" onchange="" class="campowidthselect campo campotexto">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr071" c="BLANCO" lit="108341" /> - </option>
                                            <c:forEach items="${actividades}" var="item">
                                                <option value = "${item.CACTIVI}" <c:if test="${__formdata['CACTIVI']==item.CACTIVI}">selected</c:if> >${item.TTITULO}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                               
                            </tr>
                            
                        </table>
                        <div class="separador">&nbsp;</div>
                        <%--<div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr071" c="LIT_1000095" lit="1000095" /></div>
                        --%>
                        <table class="seccion">
                            <tr>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:18%;height:0px"></th>
                                <th style="width:13%;height:0px"></th>
                                <th style="width:13%;height:0px"></th>
                                <th style="width:13%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr071" c="DOCUME" lit="105330" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr071" c="NOM" lit="105940" /></b>
                                </td>
                                <!-- bug 0020027 -->
                                <axis:ocultar f="axisctr071" c="SNIP" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="SNIP" lit="1000088" /></b>
                                    </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr071" c="TOMADOR" lit="101027" />?</b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="1" <c:if test="${__formdata['TIPOPERSONA'] == '1' || empty __formdata['TIPOPERSONA']}">checked</c:if> />
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr071" c="ASSEG" lit="1000078" /></b>
                                    <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="2" <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if> />
                                </td>
                                <axis:ocultar f="axisctr071" c="CONDUCTOR" dejarHueco="false"> 
                                    <td id="td_CONDUCTOR" class="titulocaja">
                                        <b><axis:alt f="axisctr071" c="CONDUCTOR" lit="9001027" />?</b>
                                        <input type="radio" id="TIPOPERSONA" name="TIPOPERSONA" value="3" <c:if test="${__formdata['TIPOPERSONA'] == '3'}">checked</c:if> />
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['BUSCAR']}" name="BUSCAR" id="BUSCAR" size="15"/>
                                </td>
                                <!-- bug 0020027 -->
                                <axis:ocultar f="axisctr071" c="SNIP" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SNIP']}" name="SNIP" id="SNIP" size="15"
                                         title="<axis:alt f="axisctr071" c="SNIP" lit="1000088"/>"/>
                                    </td>      
                                </axis:ocultar>
                                
                            </tr>
                        </table>
                        <!-- Bug 25177/133016 - 09/01/2013 - AMC   -->
                        <c:if test="${!empty LST_TIPRIESGO}">
                        <table>
                            <tr>
                                <td class="titulo">
                                    <img src="images/flecha.gif"/><b><axis:alt f="axisctr071" c="DATOSRIESGO" lit="151604" /> </b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="seccion">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                        
                                             <c:forEach items="${LST_TIPRIESGO}" var="item" varStatus="status" >
                                                 <td class="titulocaja">
                                                    <b>${item.TATRIBU}?</b>
                                                    <input type="radio" id="CTIPRIESGO_${item.CATRIBU}" name="CTIPRIESGO" value="${item.CATRIBU}" onclick="f_refrescarDependencias('${item.CATRIBU}');" <c:if test="${__formdata['COBJASE'] == item.CATRIBU}">checked</c:if>/>
                                                </td>
                                             </c:forEach>
                                        </tr> 
                                       <!--   **********************   SECCION DEPENDENCIAS ************************  -->
                                        <tr>
                                            <axis:ocultar f="axisctr071" c="CMATRICULA" dejarHueco="false"> 
                                                <td id="tit_CMATRICULA" class="titulocaja">
                                                    <b id="label_CMATRICULA"><axis:alt c="CMATRICULA" f="axisctr071" lit="9001057"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="CMOTOR" dejarHueco="false"> 
                                                <td id="tit_CMOTOR" class="titulocaja">
                                                    <b id="label_CMOTOR"><axis:alt c="CMOTOR" f="axisctr071" lit="9904654"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="CCHASIS" dejarHueco="false"> 
                                                <td id="tit_CCHASIS" class="titulocaja">
                                                    <b id="label_CCHASIS"><axis:alt c="CCHASIS" f="axisctr071" lit="9904655"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="NBASTID" dejarHueco="false"> 
                                                <td id="tit_NBASTID" class="titulocaja">
                                                    <b id="label_NBASTID"><axis:alt c="NBASTID" f="axisctr071" lit="9001061"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr071" c="CPOSTAL" dejarHueco="false"> 
                                                <td id="tit_CPOSTAL" class="titulocaja">
                                                    <b id="label_CPOSTAL"><axis:alt c="CPOSTAL" f="axisctr071" lit="100823"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="TDOMICI" dejarHueco="false"> 
                                                <td id="tit_TDOMICI" class="titulocaja" colspan="2">
                                                    <b id="label_TDOMICI"><axis:alt c="TDOMICI" f="axisctr071" lit="9000914"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="DESCRIPCION" dejarHueco="false"> 
                                                <td id="tit_DESCRIPCION" class="titulocaja" colspan="2">
                                                    <b id="label_DESCRIPCION"><axis:alt c="DESCRIPCION" f="axisctr071" lit="100588"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr071" c="CMATRICULA" dejarHueco="false">
                                                <td id="td_CMATRICULA" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="CMATRICULA" a="modificable=true"/> size="15" value="${__formdata.CMATRICULA}" name="CMATRICULA" id="CMATRICULA"
                                                     title="<axis:alt f="axisctr071" c="CMATRICULA" lit="9001057"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="CMOTOR" dejarHueco="false">
                                                <td id="td_CMOTOR" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="CMOTOR" a="modificable=true"/> size="15" value="${__formdata.CMOTOR}" name="CMOTOR" id="CMOTOR"
                                                     title="<axis:alt f="axisctr071" c="CMOTOR" lit="9904654"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!”#$%&/()=¡Ñ\ ¡”#$%&/()=?¡*¨][_:;’¿+´}{-.,|°¬\~')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="CCHASIS" dejarHueco="false">
                                                <td id="td_CCHASIS" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="CCHASIS" a="modificable=true"/> size="15" value="${__formdata.CCHASIS}" name="CCHASIS" id="CCHASIS"
                                                     title="<axis:alt f="axisctr071" c="CCHASIS" lit="9904655"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!”#$%&/()=¡Ñ\ ¡”#$%&/()=?¡*¨][_:;’¿+´}{-.,|°¬\~ÑOIQ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="NBASTID" dejarHueco="false">
                                                <td id="td_NBASTID" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="NBASTID" a="modificable=true"/> size="15" value="${__formdata.NBASTID}" name="NBASTID" id="NBASTID"
                                                     title="<axis:alt f="axisctr071" c="NBASTID" lit="9001061"/>" onchange="objValidador.f_validarCaracters(this,'IOQÑ')"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="CPOSTAL" dejarHueco="false">
                                                <td id="td_CPOSTAL" class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="CPOSTAL" a="modificable=true"/> size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
                                                     title="<axis:alt f="axisctr071" c="CPOSTAL" lit="100823"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="TDOMICI" dejarHueco="false">
                                                <td id="td_TDOMICI" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="TDOMICI" a="modificable=true"/> size="15" value="${__formdata.TDOMICI}" name="TDOMICI" id="TDOMICI"
                                                     title="<axis:alt f="axisctr071" c="TDOMICI" lit="9000914"/>"/>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr071" c="DESCRIPCION" dejarHueco="false">
                                                <td id="td_DESCRIPCION" class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr071" c="DESCRIPCION" a="modificable=true"/> size="15" value="${__formdata.DESCRPCION}" name="DESCRIPCION" id="DESCRIPCION"
                                                     title="<axis:alt f="axisctr071" c="DESCRIPCION" lit="100588"/>"/>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </c:if>
                        <!-- Fin Bug 25177/133016 - 09/01/2013 - AMC   -->
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisctr071" c="NPOLISS" lit="9001639"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr071" c="TOMADOR" lit="101027"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr071" c="PROD" lit="100829"/></c:set>
                            <c:set var="title4"><axis:alt f="axisctr071" c="FFECTO" lit="101332"/></c:set>
                            <c:set var="title5"><axis:alt f="axisctr071" c="FVENCIM" lit="102526"/></c:set>
                            <c:set var="title6"><axis:alt f="axisctr071" c="NPROCESS" lit="9000493"/></c:set>
                            <c:set var="title66"><axis:alt f="axisctr071" c="FANULAC" lit="109061"/></c:set>
                            <c:set var="title7"><axis:alt f="axisctr071" c="MOTVAN" lit="103218"/></c:set>
                            <c:set var="title8"><axis:alt f="axisctr071" c="CPOLCIA" lit="9001766"/></c:set>
                            <c:set var="title9"><axis:alt f="axisctr071" c="TACTIVI" lit="103481"/></c:set>
                            <c:set var="title10"><axis:alt f="axisctr071" c="TAGENTE" lit="100584"/></c:set>
                            <c:set var="title11"><axis:alt f="axisctr071" c="FEMISIO_MULTI" lit="100877"/></c:set>
                            <c:set var="title12"><axis:alt f="axisctr071" c="FEFECTO_MULTI" lit="100883"/></c:set>      
                            <c:set var="title13"><axis:alt f="axisctr071" c="TCOMPANI" lit="9000600"/></c:set>      
                            <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.LST_POLIZAS}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr071.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title=" " sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${miListaId['SSEGURO']}/${miListaId['COBJASE']}"/></div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['NPOLIZA']}<c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId['NCERTIF']}</c:if></a></div>                                    
                                    </display:column>
                                    <axis:visible c="CPOLCIA_MULTI" f="axisctr071">
                                        <display:column title="${title8}" sortable="true" sortProperty="CPOLCIA" headerClass="sortable" media="html" autolink="false" >
                                            <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${contador}')">${miListaId['CPOLCIA']}</a></div>
                                        </display:column>
                                    </axis:visible>
                                    <display:column title="${title2}" sortable="true" sortProperty="TOMADOR" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['TOMADOR']}</a></div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="TPRODUC" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['TPRODUC']}</a></div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['FEFECTO']}</a></div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" sortProperty="FVENCIM" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['FVENCIM']}</a></div>
                                    </display:column>
                                    <display:column title="${title66}" sortable="true" sortProperty="FANULAC" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['FANULAC']}</a></div>
                                    </display:column>
                                    <display:column title="${title7}" sortable="true" sortProperty="TMOTMOV" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}','${miListaId['COBJASE']}')">${miListaId['TMOTMOV']}</a></div>
                                    </display:column>
                                    <axis:visible f="axisctr071" c="CACTIVI_MULTI" >
                                    <display:column title="${title9}" sortable="true" sortProperty="TACTIVI" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}')">${miListaId['TACTIVI']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr071" c="TCOMPANI">
                                          <display:column title="${title13}" sortable="true" sortProperty="TCOMPANI" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}')">${miListaId['TCOMPANI']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr071" c="TAGENTE">
                                          <display:column title="${title10}" sortable="true" sortProperty="TAGENTE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}')">${miListaId['TAGENTE']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr071" c="FEFECTO_MULTI">
                                          <display:column title="${title12}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}')">${miListaId['FEFECTO']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr071" c="FEMISIO_MULTI">
                                          <display:column title="${title11}" sortable="true" sortProperty="FEMISIO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><a href="javascript:f_but_aceptar('${miListaId['SSEGURO']}')">${miListaId['FEMISIO']}</a></div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.LST_POLIZAS}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr071</c:param>
             <c:param name="f">axisctr071</c:param>
            <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
</div>
    </body>
</html>

