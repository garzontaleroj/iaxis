
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                 <c:if test="${empty sessionScope.axisctr_listaPolizas}">
                    f_abrir_modal("axisctr019");
                </c:if>
 
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
            
              
            }
 	    		
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("axis_axisctr194.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisctr019(){
                   objUtiles.cerrarModal('axisctr019');
            }
            
            function f_buscar_polizas(CRAMO,CAGENTE, SPRODUC,CCOMPANI,
                                            NPOLIZA,NCERT,CONTRATOINT,
                                            NSOLICI,NPOLINI,CPOLCIA,
                                            CSITUAC,CACTIVI,CESTSUPL,
                                            CMATRICULA,CPOSTAL,TDOMICI,
                                            DESCRPCION,NNUMIDE,BUSCAR,
                                            SNIP,TIPOPERSONA){
                 objUtiles.cerrarModal('axisctr019');
                 objDom.setValorPorId("CRAMO_BUSCA",  CRAMO);
                 objDom.setValorPorId("CAGENTE_BUSCA",  CAGENTE);
                 objDom.setValorPorId("SPRODUC_BUSCA",  SPRODUC);
                 objDom.setValorPorId("CCOMPANI_BUSCA",  CCOMPANI);
                 objDom.setValorPorId("NPOLIZA_BUSCA",  NPOLIZA);
                 objDom.setValorPorId("NCERT_BUSCA",  NCERT);
                 objDom.setValorPorId("CONTRATOINT_BUSCA",  CONTRATOINT);
                 objDom.setValorPorId("NSOLICI_BUSCA",  NSOLICI);
                 objDom.setValorPorId("NPOLINI_BUSCA",  NPOLINI);
                 objDom.setValorPorId("CPOLCIA_BUSCA",  CPOLCIA);
                 objDom.setValorPorId("CSITUAC_BUSCA",  CSITUAC);
                 objDom.setValorPorId("CACTIVI_BUSCA",  CACTIVI);
                 objDom.setValorPorId("CESTSUPL_BUSCA",  CESTSUPL);
                 objDom.setValorPorId("CMATRICULA_BUSCA",  CMATRICULA);
                 objDom.setValorPorId("CPOSTAL_BUSCA",  CPOSTAL);
                 objDom.setValorPorId("TDOMICI_BUSCA",  TDOMICI);
                 objDom.setValorPorId("DESCRPCION_BUSCA",  DESCRPCION);
                 objDom.setValorPorId("NNUMIDE_BUSCA",  NNUMIDE);
                 objDom.setValorPorId("BUSCAR_BUSCA",  BUSCAR);
                 objDom.setValorPorId("SNIP_BUSCA",  SNIP);
                 objDom.setValorPorId("TIPOPERSONA_BUSCA",  TIPOPERSONA);
                 objUtiles.ejecutarFormulario("axis_axisctr194.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr194", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisctr194.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
           
            function f_modificar_valor(thiss,SSEGURO){
                try{
                //cbloqueo = thiss.checked ? 1 : 0;
                cbloqueo = thiss.value;
                    var strURL="axis_axisctr194.do?operation=modificarbloqueo&CBLOQUEO="+cbloqueo+"&SSEGURO="+SSEGURO ;
                    var ajaxTexto=objJsMessages.jslit_cargando;
                    objAjax.invokeAsyncCGI_JSON(strURL, callbackbloqueo, ajaxTexto)
                }catch(e){
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function callbackbloqueo(p) {
    	
	    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	    
	    if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
	    	var cont = 0;
	    	//ok
	    }
	    
	  }
            
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
           
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
             }
             
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
             function f_formatear(thiss){
                 thiss.value = validarNumeros(thiss.value);
             }
             
             
             /*******************************************************************************************
                 Navegació pantalles
             *******************************************************************************************/
              function f_but_105677(){
                    var NPOLIZA_WIZARD = $('#NPOLIZA_WIZARD').val();
                    var NCERTIF_WIZARD = $('#NCERTIF_WIZARD').val();
               
                    var strURL="axis_axisctr194.do?operation=cartera_cero&NPOLIZA_WIZARD="+NPOLIZA_WIZARD+"&NCERTIF_WIZARD="+NCERTIF_WIZARD ;
                    var ajaxTexto=objJsMessages.jslit_cargando;
                    objAjax.invokeAsyncCGI_JSON(strURL, callbackImprimir, ajaxTexto);
             }
             
              function callbackImprimir(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    //Imprimimos
                    var NRECIBO = 0;
                    var SSEGURO = objDom.getValorPorId("SSEGURO");
                    objUtiles.abrirModal("axisimprimir", "src","modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=imprimir_renovcero&CSSEGURO="+SSEGURO+"&CNRECIBO="+NRECIBO);
                }
              }
                          
             function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                //Recarreguem per a mostrar el nou document generat
                objUtiles.ejecutarFormulario("axis_axisctr194.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);              
            }
             
             function f_but_104752(){
                objUtiles.ejecutarFormulario("axis_axisctr194.do", "suplementos", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_but_9904330(){
                objUtiles.ejecutarFormulario("axis_axisctr194.do", "emitir", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_but_9904331(){
                objUtiles.ejecutarFormulario("axis_axisctr194.do", "retenidas", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             
             function f_but_103074(){
                  try{
                  SSEGURO = document.miForm.SSEGURO.value;
                    if (objUtiles.estaVacio (SSEGURO)) 
                        alert(objJsMessages.jslit_selecciona_una_poliza);
                    else{
                        var strURL="axis_axisctr194.do?operation=haysuplementos&SSEGURO="+SSEGURO;
                        var ajaxTexto=objJsMessages.jslit_cargando;
                        objAjax.invokeAsyncCGI_JSON(strURL, callbachaysuplem, ajaxTexto)
                    }
                }catch(e){
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                
               
             }
             
             
            
            function callbachaysuplem(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                  if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                 if (!objUtiles.estaVacio(p.JSON2.resultado.OTEXTO)){
                      var mensajes = p.JSON2.resultado.OTEXTO;
                      var confirma=confirm(mensajes);
                        if (confirma) {
                            objUtiles.ejecutarFormulario("axis_axisctr194.do", "cartera", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
                    }else{
                        objUtiles.ejecutarFormulario("axis_axisctr194.do", "cartera", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                 }
                
	     }
             
            function f_act_seguro(SSEGURO,NPOLIZA,NCERTIF){
                document.miForm.SSEGURO.value= SSEGURO;
                document.miForm.NPOLIZA_WIZARD.value= NPOLIZA;
                document.miForm.NCERTIF_WIZARD.value= NCERTIF;
                
                 try{
                   if (objUtiles.estaVacio (SSEGURO)) 
                        alert(objJsMessages.jslit_selecciona_una_poliza);
                    else{
                        var strURL="axis_axisctr194.do?operation=activarBotones&SSEGURO="+SSEGURO;
                        var ajaxTexto=objJsMessages.jslit_cargando;
                        objAjax.invokeAsyncCGI_JSON(strURL, callbacactivarBotones, ajaxTexto);
                    }
                }catch(e){
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                
                
                
            }
            
            
             function callbacactivarBotones(p) {
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                
                  if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                      PERMITESUPLEMENTO = p.JSON2.OPERMITESUPLEMENTO;
                      PERMITEEMITIR = p.JSON2.OPERMITEEMITIR;
                      PERMITEPROPRET = p.JSON2.OPERMITEPROPRET;
                      PERMITERENOVAR = p.JSON2.OPERMITERENOVAR;
                      
                      document.miForm.PERMITESUPLEMENTO.value =  PERMITESUPLEMENTO ;
                      document.miForm.PERMITEPROPRET.value =  PERMITEPROPRET;
                      document.miForm.PERMITEEMITIR.value = PERMITEEMITIR;
                      document.miForm.PERMITERENOVAR.value = PERMITERENOVAR;
                     f_cargar_propiedades_pantalla();
                  }
	     }
             
             
             

   function f_but_marcar_todo(marcar){
        
        var inputs=document.getElementsByTagName("input");
            for(i=0;i<inputs.length;i++) {
                if (inputs[i].type=="checkbox") {
                    if (inputs[i].name.indexOf("checked_marcar_"==0)) {
                        if (marcar == 0)
                        inputs[i].checked = false;
                        else
                        inputs[i].checked = true;
                    }
                }
                
            }
        
            var strURL="axis_axisctr194.do?operation=marcar_json&CBLOQUEO="+marcar;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackselected, ajaxTexto)
        
        }
        
         function callbackselected(p) {    	
            
	    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	     if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
	    	var cont = 0;
	    }
                        
	    
	  }
             
             
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="TIT_MODAL" f="axisctr194" lit="9904299"/></c:param>
    </c:import>
   


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
       <input type="hidden" name="CRAMO_BUSCA" id="CRAMO_BUSCA" value="${__formdata.CRAMO_BUSCA}"/>
       <input type="hidden" name="CAGENTE_BUSCA" id="CAGENTE_BUSCA" value="${__formdata.CAGENTE_BUSCA}"/>
       <input type="hidden" name="SPRODUC_BUSCA" id="SPRODUC_BUSCA" value="${__formdata.SPRODUC_BUSCA}"/>
       <input type="hidden" name="CCOMPANI_BUSCA" id="CCOMPANI_BUSCA" value="${__formdata.CCOMPANI_BUSCA}"/>
       <input type="hidden" name="NPOLIZA_BUSCA" id="NPOLIZA_BUSCA" value="${__formdata.NPOLIZA_BUSCA}"/>
       <input type="hidden" name="NCERT_BUSCA" id="NCERT_BUSCA" value="${__formdata.NCERT_BUSCA}"/>
       <input type="hidden" name="CONTRATOINT_BUSCA" id="CONTRATOINT_BUSCA" value="${__formdata.CONTRATOINT_BUSCA}"/>
       <input type="hidden" name="NSOLICI_BUSCA" id="NSOLICI_BUSCA" value="${__formdata.NSOLICI_BUSCA}"/>
       <input type="hidden" name="NPOLINI_BUSCA" id="NPOLINI_BUSCA" value="${__formdata.NPOLINI_BUSCA}"/>
       <input type="hidden" name="CPOLCIA_BUSCA" id="CPOLCIA_BUSCA" value="${__formdata.CPOLCIA_BUSCA}"/>
       <input type="hidden" name="CSITUAC_BUSCA" id="CSITUAC_BUSCA" value="${__formdata.CSITUAC_BUSCA}"/>
       <input type="hidden" name="CACTIVI_BUSCA" id="CACTIVI_BUSCA" value="${__formdata.CACTIVI_BUSCA}"/>
       <input type="hidden" name="CESTSUPL_BUSCA" id="CESTSUPL_BUSCA" value="${__formdata.CESTSUPL_BUSCA}"/>
       <input type="hidden" name="CMATRICULA_BUSCA" id="CMATRICULA_BUSCA" value="${__formdata.CMATRICULA_BUSCA}"/>
       <input type="hidden" name="CPOSTAL_BUSCA" id="CPOSTAL_BUSCA" value="${__formdata.CPOSTAL_BUSCA}"/>
       <input type="hidden" name="TDOMICI_BUSCA" id="TDOMICI_BUSCA" value="${__formdata.TDOMICI_BUSCA}"/>
       <input type="hidden" name="DESCRPCION_BUSCA" id="DESCRPCION_BUSCA" value="${__formdata.DESCRPCION_BUSCA}"/>
       <input type="hidden" name="NNUMIDE_BUSCA" id="NNUMIDE_BUSCA" value="${__formdata.NNUMIDE_BUSCA}"/>
       <input type="hidden" name="BUSCAR_BUSCA" id="BUSCAR_BUSCA" value="${__formdata.BUSCAR_BUSCA}"/>
       <input type="hidden" name="SNIP_BUSCA" id="SNIP_BUSCA" value="${__formdata.SNIP_BUSCA}"/>
       <input type="hidden" name="SSEGURO_BUSCA" id="SSEGURO_BUSCA" value="${__formdata.SSEGURO_BUSCA}"/>
       <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" name="TIPOPERSONA_BUSCA" id="TIPOPERSONA_BUSCA" value="${__formdata.TIPOPERSONA_BUSCA}"/>
       
       <input type="hidden" name="NPOLIZA_WIZARD" id="NPOLIZA_WIZARD" value="${__formdata.NPOLIZA_WIZARD}"/>
       <input type="hidden" name="NCERTIF_WIZARD" id="NCERTIF_WIZARD" value="${__formdata.NCERTIF_WIZARD}"/>
       
       <input type="hidden" name="PERMITESUPLEMENTO" id="PERMITESUPLEMENTO" value="${__formdata.PERMITESUPLEMENTO}"/>
       <input type="hidden" name="PERMITEEMITIR" id="PERMITEEMITIR" value="${__formdata.PERMITEEMITIR}"/>
       <input type="hidden" name="PERMITEPROPRET" id="PERMITEPROPRET" value="${__formdata.PERMITEPROPRET}"/>
       <input type="hidden" name="PERMITERENOVAR" id="PERMITERENOVAR" value="${__formdata.PERMITERENOVAR}"/>
       
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisctr194" lit="9904299"/></c:param>
                <c:param name="producto"><axis:alt f="axisctr194" c="lit_form" lit="9904299" /></c:param>
                <c:param name="form">axisctr194</c:param>
            </c:import>
            
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisctr194" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
                    <c:param name="nid" value="axisimprimir"></c:param>
                </c:import>
        
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                  
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axisctr194" lit="9904299"/>
                         <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal('axisctr019')" style="cursor:pointer"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <axis:visible c="DSP_RESULTADO" f="axisctr194">
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisctr194" c="NUM_NPOLIZA" lit="800440"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr194" c="NOMBRE" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr194" c="SITUACION" lit="100874"/></c:set>
                            <c:set var="title4"><axis:alt f="axisctr194" c="DESPRODUCTO" lit="100829"/></c:set>
                            <c:set var="title5"><axis:alt f="axisctr194" c="CPOLCIA" lit="9001766"/></c:set>
                            <c:set var="title17"><axis:alt f="axisctr194" c="TACTIVI" lit="103481"/></c:set>
                            <c:set var="title6"><axis:alt f="axisctr194" c="CCOMPANI_MULTI" lit="9901223"/></c:set>
                            <c:set var="title7"><axis:alt f="axisctr194" c="CMEDIAD_MULTI" lit="9901930"/></c:set>
                            <c:set var="title8"><axis:alt f="axisctr194" c="CCOLABO_MULTI" lit="9901931"/></c:set>
                            <c:set var="title9"><axis:alt f="axisctr194" c="CPLAN_MULTI" lit="9901932"/></c:set>
                            <c:set var="title10"><axis:alt f="axisctr194" c="CLINEA_MULTI" lit="9001727"/></c:set>
                            <c:set var="title11"><axis:alt f="axisctr194" c="CCOLECT_MULTI" lit="9001021"/></c:set>
                            <c:set var="title12"><axis:alt f="axisctr194" c="NNUMIDE_MULTI_1" lit="105904"/></c:set>
                            <c:set var="title13"><axis:alt f="axisctr194" c="FPAGO_MULTI" lit="101573"/></c:set>                            
                            <c:set var="title14"><axis:alt f="axisctr194" c="CBLOQUEO" lit="9903479"/></c:set>
                            <c:set var="title15"><axis:alt f="axisctr194" c="RETENCION" lit="101714"/></c:set>
                            <c:set var="title16"><axis:alt f="axisctr194" c="FEFECTO" lit="100883"/></c:set>       
                            
                            <%int contador = 0;%>
                            
                           <div class="displayspacePersonas">
                           
                                <display:table name="${sessionScope.axisctr_listaPolizas}" id="miListaId" style="width:98%" export="false" class="dsptgtable" pagesize="-1"  requestURI="axis_axisctr194.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <c:set var="contador"><%=contador%></c:set>                                      
                                    <display:column title="" sortable="false" headerClass="sortable"  media="html" autolink="false" >    
                                        <div class="dspIcons"><input <c:if test="${miListaId['SSEGURO'] == __formdata.SSEGURO}">checked</c:if> onclick="f_act_seguro('${miListaId['SSEGURO']}','${miListaId['NPOLIZA']}','${miListaId['NCERTIF']}')" type="radio" id="checked_poliza" name="checked_poliza" value="${contador}"/></div>                                        
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['FORMATO_NPOLIZA']}</div>
                                    </display:column>
                                     <display:column title="${title16}" sortable="true" sortProperty="FEFECTO"  headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate value="${miListaId['FEFECTO']}" pattern="dd/MM/yyyy"/></div>
                                    </display:column>
                                     <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['NOMBRE']}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['SITUACION']}</div>
                                    </display:column>
                                    <display:column title="${title15}" sortable="true" sortProperty="TRETENI" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['TRETENI']}</div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['DESPRODUCTO']}</div>
                                    </display:column>
                                    <display:column title="${title14}"  sortProperty="" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                          <select name = "CBLOQUEO_<%=contador%>" id ="CBLOQUEO_<%=contador%>"  size="1" class="campowidthselect campo" 
                                          onchange="f_modificar_valor(this,'${miListaId['SSEGURO']}')" 
                                            <axis:atr f="axisctr194" c="CBLOQUEO" a="isInputText=false"/> >
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="CBLOQUEO" c="MIN_VALUE" lit="108341" /> - </option>
                                            <c:forEach items="${__formdata.listValores.lstbloqueo}" var="item">
                                                <option value = "${item.CATRIBU}" <c:if test="${(!empty miListaId['CBLOQUEO'] && miListaId['CBLOQUEO'] ==item.CATRIBU) }">selected</c:if> >${item.TATRIBU}</option>
                                            </c:forEach>
                                          </select>
                                        </div>
                                    </display:column>
                                    <%contador++;%>
                                    
                                </display:table>
                              
                               
                            </div>
                            <table
                <tr>
                    <td align="right">
                        <div style="align:right">
                            <input type="button" class="boton" id="but_selec" value="<axis:alt f="axisctr207" c="BT_SELTODOS" lit="9000756"></axis:alt>" onclick="javascript:f_but_marcar_todo(1)" />
                            <input type="button" class="boton" id="but_dessel" value="<axis:alt f="axisctr207" c="BT_DESSELTODOS" lit="9000757"></axis:alt>" onclick="javascript:f_but_marcar_todo(0)" />            
                        </div>
                    </td>
                </tr>
            </table>
            
                            
                            </axis:visible>
                    </td>
                </tr>
            </table>
                    </td> 
                </tr>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
 
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisctr194</c:param>
   <c:param name="__botones"><axis:visible f="axisctr194" c = "BT_SALIR">salir</axis:visible><axis:visible f="axisctr194" c = "BT_SUPLEMENTOS">,104752,105677</axis:visible><axis:visible f="axisctr194" c = "BT_EMITIR">,9904330</axis:visible><axis:visible f="axisctr194" c = "BT_GESTRET">,9904331</axis:visible><axis:visible f="axisctr194" c = "BT_CARTERA">,103074</axis:visible></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


