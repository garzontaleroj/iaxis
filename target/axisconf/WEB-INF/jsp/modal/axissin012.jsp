<%/* Revision:# lQTvoCWSzCXA4UEzasQpVQ== # */%>
<%--
/**
*  Fichero: axissin012.jsp
*  
*  T?tulo: Siniestros ALTA PAGOS/RECOBROS 
*
*  Fecha: 20/02/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin012" c="title" lit="109479"/>/<axis:alt f="axissin012" c="title" lit="9000897"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
    <script type="text/javascript">
        function f_onload() { 
        revisarEstilos();
        var valor = "<%=request.getAttribute("OK")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>";
        var isnew = "<%=request.getAttribute("isNew")%>";
        var seccion = "${__formdata.SECCION}";
         var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
        if (valor=="OK"){
            parent.f_aceptar_axissin012(NSINIES,"tramitaciones",seccion,valor,sidepagout,isnew); //TODO: Dato EJ. para volver a la pantalla
            //this.f_but_cancelar();
        }
        
        //Cargamos el combo
        //f_recarga_cconpag(); //Se realizará desde el service, cada vez que se recargue la pantalla
        
        f_cargar_propiedades_pantalla();
        
   }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
            var NSINIES = "${__formdata.NSINIES}";
            var CTIPDES = "${__formdata.CTIPDES}";
            var SPERSON = "${__formdata.SPERSON}";
            var CCONPAG = "${__formdata.CCONPAG}";
            f_recarga_aviso(NSINIES,CTIPDES,SPERSON,CCONPAG);
                objUtiles.ejecutarFormulario ("modal_axissin012.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
        var valor = "<%=request.getAttribute("OK")%>"; 
        var sidepagout = "<%=request.getAttribute("PSIDEPAGOUT")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
            parent.f_aceptar_axissin012(NSINIES,"tramitaciones","pagos", valor,sidepagout);            	
        }


//AXISPER014, ALTA CCC
        function f_abrir_axisper014(CNORDBAN,selectedPerson) {            
            if(objUtiles.estaVacio(selectedPerson))
                selectedPerson = document.miForm.SPERSONMED.value;
                if (selectedPerson != null && selectedPerson > 0){ 
                   objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN+"&CAGENTE="+document.miForm.CAGENTE.value);            
                }
        }  
        function f_aceptar_axisper014(selectedPerson){
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario ("modal_axissin012.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cerrar_axisper014(){
            objUtiles.cerrarModal("axisper014");
        }         
//UTILS        
       function f_recargar(thiss){
               if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'DESTINATARI')){               
                    var SPERSON = objUtiles.utilSplit(thiss.value, "/")[0]; // SPERSON
                    var CTIPDES = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPDES
                    
                    document.miForm.SPERSON.value = SPERSON;                    
                    objDom.setValorPorId("SPERSON", SPERSON);
                                      
                    document.miForm.CTIPDES.value = CTIPDES;
                    objDom.setValorPorId("CTIPDES", CTIPDES);
                    
                }else{
                }
                if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                    var CBANCAR = objUtiles.utilSplit(thiss.value, "@@")[0]; // SPERSON
                    var CTIPBAN = objUtiles.utilSplit(thiss.value, "@@")[1]; // CTIPDES
                    objDom.setValorPorId("CBANCAR", CBANCAR);
                    objDom.setValorPorId("CTIPBAN", CTIPBAN);
                } 
                
                if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'CMEDIADOR')){               
                    var MEDIADOR = objUtiles.utilSplit(thiss.value, "/")[0]; // MEDIADOR
                    var SPERSON = objUtiles.utilSplit(thiss.value, "/")[1]; // SPERSON
                    
                    document.miForm.SPERSONMED.value = SPERSON;                    
                    objDom.setValorPorId("SPERSONMED", SPERSON);
                                      
                    document.miForm.MEDIADOR.value = MEDIADOR;
                    objDom.setValorPorId("MEDIADOR", MEDIADOR);
                    
                }
            f_cargar_propiedades_pantalla();

            if ($("#PRESENTADOR").is(":hidden")) {
                objDom.setValorPorId("SPERSON_REL", objUtiles.utilSplit($("#DESTINATARI").val(), "/")[0]);
            }
			
            if (!objUtiles.estaVacio($("#COFICI").val())){
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario ("modal_axissin012.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                }
            }else{
                objUtiles.ejecutarFormulario ("modal_axissin012.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
        }     

        function f_abrir_modal(cual, noXButton, optionalQueryString) {

            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
  function f_aceptar_axissin011(NSINIES,SPROFES) {
          //alta destinatarios, desde pagos
            objDom.setValorPorId("NSINIES", NSINIES);
            f_recargar(null);
    }     
      function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        ///////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////////////////
        
        
         function f_actData(thiss){
        //alert("Aquí");
        thiss.value = f_formatdate(thiss);
        }     
        function f_formatdate(entrada){
         var jDate = new JsFecha();

         if (!jDate.validaFecha(entrada.value)
         || entrada.value.indexOf("/") == -1
         ){
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        }
        return entrada.value;
        }
        
       function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
        }
        
///////////////////////////////////////////////////////////////////////////////
///////////////////// funciones ajax //////////////////////////////////////////
function f_recarga_aviso(NSINIES,CTIPDES,SPERSON,CCONPAG) {
var PNSINIES = NSINIES;
var PCTIPDES = CTIPDES;
var PSPERSON = SPERSON;
var PCCONPAG = CCONPAG; 
       objAjax.invokeAsyncCGI("modal_axissin012.do", callbackAjaxActualizarAviso, "operation=ajax_recargar_aviso&NSINIES="+PNSINIES+"&CTIPDES="+PCTIPDES+"&SPERSON="+PSPERSON+"&CCONPAG="+PCCONPAG, this);
        }
function callbackAjaxActualizarAviso(ajaxResponseText) {
           // alert("*************"+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            var NSINIES = "${__formdata.NSINIES}";
        
                if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETORNO"), 0, 0) == 1){
              alert ("<axis:alt f='axissin012' c='MENSAAGE' lit='9909858'/>"+NSINIES);
                }            
}
function f_recarga_cconpag() {
            var comboOrigen="11";
            objAjax.invokeAsyncCGI("modal_axissin012.do", callbackAjaxActualizarCombos, "operation=ajax_recargar_cconpag", this);
        }
        
        
function callbackAjaxActualizarCombos(ajaxResponseText) {
            //alert("*************"+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                     rellenarCombo(doc);
                    }
                         
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
function rellenarCombo(doc) {
            //alert("0");
            var combo = document.getElementById("CCONPAG");
            //alert("1");
            objDom.borrarOpcionesDeCombo(combo);
            objDom.addOpcionACombo("", " - " + "<axis:alt f='axissin012' c='alerta_mensaje' lit='1000348'/>" + " - ", combo, null);
            //alert("2");
            //if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(combo);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                    //alert("Antes de recorrera el bug");
                                    var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                    var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                    objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, i+1);
                                  
                            }
                }
                //if (numElementos == 1) {
                    // Seleccionar la única opción del combo y ejecutar
                    // su llamada onchange para recuperar combos dependientes
                //     combo[0].selected = "1";
                //    combo.onchange(); 
                //}
          //  }
        }
    
    function f_aceptar_axisper012(selectedPerson){
            f_cerrar_axisper012();
            //objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            f_recargar(null);
    }
    function f_abrir_axisper012() {
        
        var sperson = document.miForm.SPERSON.value;
        var spersonmed = document.miForm.SPERSONMED.value;
        
        if(!objUtiles.estaVacio(sperson))
            objUtiles.abrirModal("axisper012", "src", "modal_axisper012.do?operation=form&SPERSON="+sperson+"&CDOMICI=null&CAGENTE="+document.miForm.CAGENTE.value);            
        if(!objUtiles.estaVacio(spersonmed))
            objUtiles.abrirModal("axisper012", "src", "modal_axisper012.do?operation=form&SPERSON="+spersonmed+"&CDOMICI=null&CAGENTE="+document.miForm.CAGENTE.value); 
    }     
          
    function f_cerrar_axisper012(){
        objUtiles.cerrarModal("axisper012");
    }

    function f_abrir_busca_ofis(){
        if(!objUtiles.estaVacio($("#CBANCO").val())){
            f_abrir_modal('axissin059',null,'&CBANCO='+$("#CBANCO").val());
        }
    }
    
    function f_aceptar_modal(pantalla){
        f_cerrar_modal(pantalla);
        objUtiles.ejecutarFormulario("modal_axissin012.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_aceptar_modal(pantalla, param){
        f_cerrar_modal(pantalla);
        objUtiles.ejecutarFormulario("modal_axissin012.do?"+param, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_cerrar_modal(pantalla){
        objUtiles.cerrarModal(pantalla);
    } 
    
    function f_but_buscar_oficina(){
        if (!objUtiles.estaVacio($("#COFICI").val())&&!objUtiles.estaVacio($("#CBANCO").val())){
            var qs="operation=m_ajax_buscar_oficina&COFICI="+$("#COFICI").val()+"&CBANCO="+$("#CBANCO").val();
            $("#COFICI b").html("");
            objAjax.invokeAsyncCGI("modal_axissin012.do", callbackBuscarOficina, qs, this, objJsMessages.jslit_cargando);
        }
    }
    
    function callbackBuscarOficina(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText); 
            var elementos = doc.getElementsByTagName("TOFICIN");  
            if (elementos.length==0){
                $("#TOFICI b").html("");
            }
            for (i = 0; i < elementos.length; i++) {
                var TOFICI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TOFICIN"), i, 0);
                $("#TOFICI b").html(TOFICI);
            }
        }
        
    function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal == 'axisper022')
            porigen = 'NUEVO';
        
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;      
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("modal_axissin012.do?SPERSON_REL=" + SPERSON + "&CAGENTE1=" + CAGENTE, callbackAjaxActualizaPresentador, "operation=ajax_actualizar_presentador", this, objJsMessages.jslit_cargando);
        }
    }
    
    function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
    }
    
    function callbackAjaxActualizaPresentador(ajaxResponseText) {
        try{            
            var doc = objAjax.domParse(ajaxResponseText);            
            
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                
                var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                objDom.setValorPorId("PRESENTADOR", NOMBRE + ' ' + APELLIDO1 + ' ' + APELLIDO2);  
                objDom.setValorPorId("SPERSON_REL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));            
            }          
            
        }catch(e){}
    }
    </script>
</head>
<body onload="javascript:f_onload()">
        <!-- AXISSIN011 ALTA/MODIF. DESTINATARIOS -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin011|<axis:alt f="axissin012" c="titulo_axissin011" lit="9000896"/></c:param>
        </c:import>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="titulo_axisper012" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper012" />
        </c:import>      
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="titulo_axisper014" lit="1000235" /></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>  
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="titulo_axissin059" lit="9906107" /></c:param>
        <c:param name="nid" value="axissin059" />
        </c:import>  
        
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="MODPER012" lit="1000235"/></c:param>
        <c:param name="nid" value="axisper012"/>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
        <c:param name="nid" value="axisper021" />
        </c:import>
        
    <form name="miForm" action="modal_axissin012.do" method="POST">

    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SIDEPAG" value="${__formdata.SIDEPAG}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CTIPDES" value="${__formdata.CTIPDES}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="SECCION" value="${__formdata.SECCION}"/>    
    <input type="hidden" name="isNew" value="${__formdata.isNew}"/>    
    
    <input type="hidden" name="SPRODUC"  value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI"  value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CTRAMIT"  value="${__formdata.CTRAMIT}" />
    <input type="hidden" name="CCAUSIN"  value="${__formdata.CCAUSIN}" />
    <input type="hidden" name="CMOTSIN"  value="${__formdata.CMOTSIN}" />
    
    <input type="hidden" name="pTOFICI"  value="${__formdata.TOFICI}" />
    
    
    <input type="hidden" name="CMONRES" id="CMONRES" value="${__formdata.CMONRES}" />
    <input type="hidden" name="ICONRET" id="ICONRET" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ICONRET}"/>" />
    <input type="hidden" name="PRETENC" id="PRETENC" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETENC}"/>" />
    	<input type="hidden" name="IRETENC" id="IRETENC" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETENC}"/>" />
    <input type="hidden" name="IIVA" id="IIVA" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IIVA}"/>" />
    <input type="hidden" name="ISUPLID" id="ISUPLID" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISUPLID}"/>" />
    <input type="hidden" name="IFRANQ" id="IFRANQ" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQ}"/>" />
    <input type="hidden" name="IRESRED" id="IRESRED" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESRED}"/>" />
    <input type="hidden" name="IRESRCM" id="IRESRCM" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRESRCM}"/>" />
    <input type="hidden" name="CMONPAG" id="CMONPAG" value="${__formdata.CMONPAG}" />
    <input type="hidden" name="ICONRETPAG" id="ICONRETPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ICONRETPAG}"/>" />
    <input type="hidden" name="ISINRETPAG" id="ISINRETPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISINRETPAG}"/>" />
    <input type="hidden" name="IRETENCPAG" id="IRETENCPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IRETENCPAG}"/>" />
    <input type="hidden" name="IIVAPAG" id="IIVAPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IIVAPAG}"/>" />
    <input type="hidden" name="ISUPLIDPAG" id="ISUPLIDPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISUPLIDPAG}"/>"/>
    <input type="hidden" name="IFRANQPAG" id="IFRANQPAG" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IFRANQPAG}"/>" />
    <input type="hidden" name="SIDEPAGTEMP" id="SIDEPAGTEMP" value="${__formdata.SIDEPAGTEMP}" />
    
    <input type="hidden" name="CAGENTESINI" id="CAGENTESINI" value="${__formdata.CAGENTESINI}" />
    <input type="hidden" name="TAGENTESINI" id="TAGENTESINI" value="${__formdata.TAGENTESINI}" />
    <input type="hidden" name="NTRAMIT9999" id="NTRAMIT9999" value="${__formdata.NTRAMIT9999}" />
    <input type="hidden" name="SPERSONMED" id="SPERSONMED" value="${__formdata.SPERSONMED}" />
    <input type="hidden" name="MEDIADOR" id="MEDIADOR" value="${__formdata.MEDIADOR}" />
    <input type="hidden" id="SPERSON_REL" name="SPERSON_REL" value="${__formdata.SPERSON_REL}"/>
    <input type="hidden" id="ORIGEN" name="ORIGEN" value="" />
    <input type="hidden" id="SNIP" name="SNIP" value="" />
    <input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO" value="" />
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin012" c="titulo" lit="9000983"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin012" c="formulario" lit="9000983"/></c:param>
        <c:param name="form">axissin012</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
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
                      <axis:ocultar f="axissin012" c="NSINIES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="NSINIES_LIT" lit="101298"/></b><!-- Numero de Siniestro-->
                            </td>
                       </axis:ocultar>    
                        <axis:ocultar c="TTIPTRA" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TTIPTRA" lit="9001028"/></b><!-- Tipus tramitacio -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TTRAMIT" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TTRAMIT" lit="100588"/></b><!-- Tipus dany  -->
                            </td>  
                        </axis:ocultar>
                        <axis:ocultar c="TTCAUSIN" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TTCAUSIN" lit="9000901"/></b><!-- Tipus dany  -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CINFORM" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CINFORM" lit="9000905"/></b><!-- Tramitación informativa -->
                            </td>   
                        </axis:ocultar>
                    </tr>
                    
                    <tr>
                     <axis:ocultar f="axissin012" c="NSNIES" dejarHueco="false"> 
                     <td class="campocaja">
                          <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:90%"
                            <axis:atr f="axissin012" c="NSINIES" a="modificable=false"/> />
                            
                        </td>
                        </axis:ocultar>
                        <axis:ocultar c="TTIPTRA" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TTIPTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TTRAMIT" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TTRAMIT" a="modificable=false"/> />
                            </td>   
                        </axis:ocultar>
                        <axis:ocultar c="TTCAUSIN" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TTCAUSIN" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CINFORM" f="axissin012" dejarHueco="false">
                            <td class="campocaja" align="left">
                                <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin012" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                                <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                            </td>                        
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="TESTTRA" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TESTTRA" lit="100587"/></b><!-- Estado -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TSUBTRA" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TSUBTRA" lit="9000852"/></b><!--Subestado -->
                            </td>
                        </axis:ocultar>   
                        <axis:ocultar c="TUNITRA" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TUNITRA" lit="9000900"/></b><!-- Unidad tramitacion -->
                            </td>
                        </axis:ocultar>  
                        <axis:ocultar c="TTRAMITAD" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="TTRAMITAD" lit="9910018"/></b><!-- Tramitador -->
                            </td>
                        </axis:ocultar>    
 
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                        <axis:ocultar c="TESTTRA" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TESTTRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TSUBTRA" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TSUBTRA" a="modificable=false"/> />                        
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TUNITRA" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TUNITRA" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="TTRAMITAD" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campodisabled campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="TTRAMITAD" a="modificable=false"/> />
                            </td>
                        </axis:ocultar>
                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                    
                    
                </table>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                     <tr>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:15%;height:0px"></th>
                        <th style="width:20%;height:0px"></th>
                        <th style="width:30%;height:0px"></th>
                    </tr>
                    
                     <tr>
                        <axis:ocultar c="CMEDIADOR" f="axissin012" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axissin012" c="CMEDIADOR" lit="9901930"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CPERJUDICADO" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CPERJUDICADO" lit="9903447"/></b>
                            </td>
                        </axis:ocultar>
                    <tr>
                    <tr>
						<axis:ocultar c="CMEDIADOR" f="axissin012" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                                <select name="CMEDIADOR" id="CMEDIADOR" size="1" onchange="f_recargar(this);"  class="campowidthselect campo campotexto" style="width:100%;"
                                    <axis:atr f="axissin012" c="CMEDIADORx" a="modificable=true&isInputText=false"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="tipomed" items="${__formdata.listvalores.lstmediadores}">
                                        <option value = "${tipomed.CMEDIADOR}/${tipomed.SPERSON}" 
                                        <c:if test="${tipomed.CMEDIADOR == __formdata.MEDIADOR}"> selected </c:if> >
                                            ${tipomed.TMEDIADOR}
                                        </option>
                                    </c:forEach>
                                </select>   
                        </td>
						</axis:ocultar>
                        <axis:ocultar c="CPERJUDICADO" f="axissin012" dejarHueco="false">
                        <td class="campocaja" colspan="2"> 
                                <select name="CPERJUDICADO" id="CPERJUDICADO" size="1" onchange=""  class="campowidthselect campo campotexto" style="width:100%;"
                                    <axis:atr f="axissin012" c="CPERJUDICADO" a="modificable=true&isInputText=false"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="tipoper" items="${__formdata.listvalores.lstperjudicados}">
                                        <option value = "${tipoper.NPERSREL}" 
                                        <c:if test="${tipoper.NPERSREL == __formdata.CPERJUDICADO}"> selected </c:if> />
                                            ${tipoper.TNOMBRE}
                                        </option>
                                    </c:forEach>
                                </select>   
                        </td>
						</axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar c="CTIPPAG" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CTIPPAG" lit="100565"/></b><!-- Tipo -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="DESTINATARI" f="axissin012" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axissin012" c="DESTINATARI" lit="9000909"/></b><!-- Destinatario -->
                            </td>
                        </axis:ocultar>  
                        <axis:ocultar c="CCONPAG" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CCONPAG" lit="9000715"/></b><!-- Concepto Pago -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CCAUIND" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CCAUIND" lit="9001199"/></b><!-- Causa Indemnizacion -->
                            </td>
                        </axis:ocultar>
                        <td></td>
                    </tr>
                    <tr>
                        <axis:ocultar c="CTIPPAG" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CTIPPAGnoEdit" id="CTIPPAGnoEdit" size="1" onchange="javascript:f_recarga_cconpag();"  class="campowidthselect campo campotexto" style="width:90%;"
                                    <axis:atr f="axissin012" c="CTIPPAG" a="modificable=false&isInputText=false"/> >
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CTIPPAGnoEdit" lit="1000348"/> - </option>
                                    <c:forEach var="tipodest" items="${__formdata.listvalores.lstctippag}">
                                        <option value = "${tipodest.CATRIBU}" 
                                        <c:if test="${tipodest.CATRIBU== __formdata.CTIPPAG}"> selected </c:if> />
                                            ${tipodest.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>       
                                <input type="hidden" id="CTIPPAG" name="CTIPPAG" value="${__formdata.CTIPPAG}">
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="DESTINATARI" f="axissin012" dejarHueco="false">
                            <td class="campocaja" colspan="2">
                                <select name="DESTINATARI" id="DESTINATARI" size="1" onchange="f_recargar(this);"  class="campowidthselect campo campotexto_ob" style="width:85%;"
                                <axis:atr f="axissin012" c="DESTINATARI" a="obligatorio=true"/> title="<axis:alt f="axissin012" c="DESTINATARI" lit="9000909"/>">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="LSTDESTINATARI" lit="1000348"/> - </option>
                                        <c:forEach var="desti" items="${__formdata.listvalores.lstdestinataris}">
                                            <option value = "${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON}/${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.CTIPDES}" 
                                            <c:if test="${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON == __formdata.SPERSON}"> selected </c:if> />
                                            ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.SPERSON} -
                                            ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TNOMBRE}
                                            ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI1} 
                                            ${desti.OB_IAX_SIN_TRAMI_DESTINATARIO.PERSONA.TAPELLI2} 
                                            </option>
                                        </c:forEach>
                                </select>
                                <a href="javascript:f_abrir_modal('axissin011',null,'&indexTramitacio='+document.miForm.indexTramitacio.value+'&SSEGURO='+document.miForm.SSEGURO.value+'&CAGENTE='+document.miForm.CAGENTE.value+'&NSINIES='+document.miForm.NSINIES.value+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&SPRODUC='+document.miForm.SPRODUC.value+'&CACTIVI='+document.miForm.CACTIVI.value+'&CTRAMIT='+document.miForm.CTRAMIT.value+'&CCAUSIN='+document.miForm.CCAUSIN.value+'&CMOTSIN='+document.miForm.CMOTSIN.value);">
                                 <%-- <a href="javascript:f_abrir_axisssin011(null,document.miForm.SPERSON.value)">--%>
                                <img border="0" alt="<axis:alt f="axissin012" c="DESTINATARI_ICO" lit="9001513"/>" title="<axis:alt f="axissin012" c="DESTINATARI_ICO" lit="9001513"/>" src="images/new.gif"/></a>                            
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CCONPAG" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CCONPAG" id="CCONPAG" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;" 
                                <axis:atr f="axissin012" c="CCONPAG" a="obligatorio=true"/> title="<axis:alt f="axissin012" c="CCONPAG" lit="9000715"/>" onchange="f_cargar_propiedades_pantalla();">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CCONPAGLST" lit="1000348"/> - </option>
                                    <c:forEach var="tipoconpag" items="${__formdata.listvalores.lstcconpag}">
                                        <option value = "${tipoconpag.CATRIBU}" 
                                        <c:if test="${tipoconpag.CATRIBU == __formdata.CCONPAG}"> selected </c:if> />
                                            ${tipoconpag.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CCAUIND" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CCAUIND" id="CCAUIND" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;"
                                <axis:atr f="axissin012" c="CCAUIND" a="obligatorio=true"/> title="<axis:alt f="axissin012" c="CCAUIND" lit="9001199"/>">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CCAUINDLST" lit="1000348"/> - </option>
                                    <c:forEach var="tipoact" items="${__formdata.listvalores.lstccauind}">
                                        <option value = "${tipoact.CATRIBU}" 
                                        <c:if test="${tipoact.CATRIBU == __formdata.CCAUIND}"> selected </c:if> />
                                            ${tipoact.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                 </select>
                            </td>
                        </axis:ocultar>
                        <td></td>
                    </tr>
                    
                    
                    <tr>
                        <axis:ocultar c="FORDPAG" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="FORDPAG" lit="9000910"/></b><!-- Fecha orden -->
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar c="NFACREF" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="NFACREF" lit="9000445"/></b><!-- Referencia 9001285-->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="FFACREF" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="FFACREF" lit="9000956"/></b><!-- data factura -->
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CFORPAG" f="axissin012" dejarHueco="false">
                            <td class="titulocaja" id="tit_CFORPAG">
                                <b><axis:alt f="axissin012" c="CFORPAG" lit="100712"/></b><!-- Forma Pago -->
                            </td>
                        </axis:ocultar>
                        
                         <axis:ocultar f="axissin012" c="NCHEQUE" dejarHueco="false">
                                            <td class="titulocaja" id="tit_NCHEQUE">
                                                <b>
                                                    <axis:alt f="axissin012" c="NCHEQUE" lit="9907717"/></b>
                                            </td>
                                        </axis:ocultar>
                        
                        
                        
                        <axis:ocultar c="BANC" f="axissin012" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG == 1 or
                                          __formdata.CFORPAG == 31}">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="BANC" lit="100965"/></b><!-- cta bancaria -->
                            </td> 
                            </c:if>
                        </axis:ocultar> 
                        
                        <axis:ocultar f="axissin012" c="CDOMICI" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG == 10}">
                            <td class="titulocaja" >
                                <b><axis:alt f="axissin012" c="CDOMICI" lit="101078"/></b>
                            </td>
                            </c:if>
                        </axis:ocultar>
                        <axis:ocultar f="axissin012" c="CBANCO" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG == 33 or
                                          __formdata.CFORPAG == 34 or
                                          __formdata.CFORPAG == 35}">
                            <td class="titulocaja" >
                                <b><axis:alt f="axissin012" c="CBANCO" lit="9000964"/></b>
                            </td>
                            </c:if>
                        </axis:ocultar>
                        
                    </tr>
                    <tr>
                        <axis:ocultar c="FORDPAG" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                             <input   type="text"  class="campowidthinput campo campotexto_ob" id="FORDPAG" onblur="javascript:f_actData(this)"  style="width:75%" name="FORDPAG"  
                                <axis:atr f="axissin012" c="FORDPAG" a="modificable=true&formato=fecha&obligatorio=true"/> title="<axis:alt f="axissin012" c="FORDPAG" lit="9000910"/>" 
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FORDPAG}"/>"/>                                    
                                <a style="vertical-align:middle;"><img id="popup_calendario_FORDPAG" alt="<axis:alt f="axissin012" c="popup_calendario_FORDPAG" lit="102913"/>" title="<axis:alt f="axissin012" c="popup_calendario_FORDPAG" lit="102913" />" src="images/calendar.gif"/></a>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="NFACREF" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" name="NFACREF" id="NFACREF" <axis:atr f="axissin012" c="NFACREF" a="isInputText=true&obligatorio=false"/> value="${__formdata.NFACREF}"
                                class="campowidthinput campo" style="width:80%"
                                title="<axis:alt f="axissin012" c="NFACREF" lit="9000445"/>" 
                                /> 
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="FFACREF" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <input   type="text"  class="campowidthinput campo" id="FFACREF"  style="width:65%" name="FFACREF"   onblur="javascript:f_actData(this)"
                                <axis:atr f="axissin012" c="FFACREF" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFACREF}"/>"
                                title="<axis:alt f="axissin012" c="FFACREF" lit="9000956"/>"/>                                    
                                <a style="vertical-align:middle;"><img id="popup_calendario_FFACREF" alt="<axis:alt f="axissin012" c="popup_calendario_FFACREF" lit="102913"/>" title="<axis:alt f="axissin012" c="popup_calendario_FFACREF" lit="102913" />" src="images/calendar.gif"/></a>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar c="CFORPAG" f="axissin012" dejarHueco="false">
                            <td class="campocaja"  id="td_CFORPAG">
                                <select name="CFORPAG" id="CFORPAG" onchange="f_recargar(this);"  size="1" class="campowidthselect campo campotexto_ob" <axis:atr f="axissin012" c="CFORPAG" a="isInputText=false"/> style="width:90%;"
                                       title="<axis:alt f="axissin012" c="CFORPAG" lit="100712"/>">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CFORPAG" lit="1000348"/> - </option>
                                    <c:forEach var="tipoforpag" items="${__formdata.listvalores.lstcforpag}">
                                        <option value = "${tipoforpag.CATRIBU}" 
                                        <c:if test="${tipoforpag.CATRIBU == __formdata.CFORPAG }"> selected </c:if> />
                                            ${tipoforpag.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                 </select>
                            </td>
                        </axis:ocultar>
                        
                        <axis:ocultar c="NCHEQUE" f="axissin012" dejarHueco="false">
                                            <td class="campocaja" id="td_NCHEQUE">
                                                <input type="text" class="campo campotexto" <axis:atr f="axissin012" c="NCHEQUE" a="isInputText=true&obligatorio=false"/>
                                                       value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE"
                                                       style="width:90%;"/>
                                            </td>
												</axis:ocultar>
                        
                        
                         <c:if test="${__formdata.CFORPAG == 33 or
                                       __formdata.CFORPAG == 34 or
                                       __formdata.CFORPAG == 35}">
                        <axis:ocultar c="CBANCO" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CBANCO" id="CBANCO" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CBANCOGLST" lit="1000348"/> - </option>
                                    <c:forEach var="banco" items="${__formdata.listvalores.lstbancos}">
                                        <option value = "${banco.CBANCO}" 
                                        <c:if test="${banco.CBANCO == __formdata.CBANCO}"> selected </c:if> />
                                            ${banco.TBANCO} 
                                        </option>
                                    </c:forEach>
                                 </select>
                            </td>
                        </axis:ocultar>
                        </c:if> 
                        <axis:ocultar c="BANC" f="axissin012" dejarHueco="false">
                            <td class="campocaja">
                            <c:if test="${__formdata.CFORPAG == 1 or
                                          __formdata.CFORPAG == 31}">
                                <axis:encryptflag f="axissin012" c="BANC" />
                                <select name = "BANC" style="width:80%" id ="BANC" size="1"  onchange="f_recargar(this);" title="<axis:alt f="axissin012" c="BANC" lit="100965"/>"
                                    class="campowidthselect campo campotexto" <axis:atr f="axissin012" c="BANC" a="isInputText=false"/>>&nbsp;
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="BANCLST" lit="1000348"/> - </option>
                                    <c:forEach items="${__formdata.listvalores.cuentasbancarias}" var="cuentaTomador">
                                        <option value = "<axis:encrypt f="axissin012" c="BANC" value="${cuentaTomador.CBANCAR}" />@@${cuentaTomador.CTIPBAN}" <c:if test="${cuentaTomador.CBANCAR  == __formdata.CBANCAR}">selected</c:if>><axis:masc f="axissin012" c="BANC" value="${cuentaTomador.TCBANCAR}" />
                                        </option>
                                    </c:forEach>
                                    <axis:encryptflag f="axissin012" c="CBANCAR" />
                                    <input type="hidden" id="CBANCAR" name="CBANCAR" value="<axis:encrypt f="axissin012" c="BANC" value="${__formdata.CBANCAR}" />" >
                                    <input type="hidden" id="CTIPBAN" name="CTIPBAN" value="${__formdata.CTIPBAN}">
									<axis:visible f="axissin012" c="BT_NUEVO_CCC">
                                       <a href="javascript:f_abrir_axisper014(null,document.miForm.SPERSON.value)">
                                       <img border="0" alt="<axis:alt f="axissin012" c="BT_NUEVO_CCC" lit="1000438"/>" title="<axis:alt f="axissin012" c="BT_NUEVO_CCC" lit="1000438"/>" src="images/new.gif"/></a>  
									</axis:visible>
                            </c:if>
                           
                            <c:if test="${__formdata.CFORPAG == 10}">
                                <select name = "CDOMICI" style="width:80%" id ="CDOMICI" size="1"  onchange="f_recargar(this);" title="<axis:alt f="axissin012" c="CDOMICI" lit="101078"/>"
                                    class="campowidthselect campo campotexto" <axis:atr f="axissin011" c="CDOMICI" a="obligatorio=true&isInputText=false"/>>&nbsp;
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CDOMICILST" lit="1000348"/> - </option>
                                    <c:forEach items="${__formdata.listvalores.domicilios}" var="domicilio">
                                        <option value = "${domicilio.CDOMICI}" <c:if test="${domicilio.CDOMICI  == __formdata.CDOMICI}">selected</c:if> />
                                             ${domicilio.TDOMICI}
                                             ${domicilio.CPOSTAL}
                                             ${domicilio.TPOBLAC}
                                        </option>
                                    </c:forEach>
                                </select>
                                <axis:visible f="axissin012" c="BT_EDITAR_DOMICILIO">
                                <img border="0" alt='<axis:alt f="axisper009" c="LIT11" lit="1000437"/>'
                                    title='<axis:alt f="axisper009" c="LIT12" lit="1000437"/>' src="images/new.gif"
                                    onclick="f_abrir_axisper012()"/>
                                </axis:visible>
                             </c:if>                             
                            </td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                     <axis:ocultar f="axissin012" c="COFICI" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG == 33 or
                                          __formdata.CFORPAG == 34 or
                                          __formdata.CFORPAG == 35}">
                            <td class="titulocaja" >
                                <b><axis:alt f="axissin012" c="COFICI" lit="102347"/></b>
                            </td>
                            </c:if>
                     </axis:ocultar>
                     <axis:ocultar f="axissin012" c="CCIUDAD" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG == 34}">
                            <td class="titulocaja" >
                                <b><axis:alt f="axissin012" c="CCIUDAD" lit="9902611"/></b>
                            </td>
                            </c:if>
                     </axis:ocultar>
                     <axis:ocultar c="ISINRET" f="axissin012" dejarHueco="false">
                      <td class="titulocaja">
                            <b id="label_ISINRET"><axis:alt lit="9000474" c="ISINRET" f="axissin012"/></b><!-- Referencia -->
                        </td>
                    </axis:ocultar>
                    <axis:ocultar c="CULTPAG" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="CULTPAG" lit="9902312"/></b><!-- Último pago -->
                            </td>   
                        </axis:ocultar>
                        <axis:ocultar c="CTRIBUTACION" f="axissin012" dejarHueco="false">
                            <td class="titulocaja" id="tit_CTRIBUTACION">
                                <b id="label_CTRIBUTACION"><axis:alt f="axissin012" c="CTRIBUTACION" lit="9904294"/></b><!-- Tipo de tributación -->
                            </td>   
                        </axis:ocultar>
                         <axis:ocultar c="LSTAGENTES" f="axissin012" dejarHueco="false">
                            <c:if test="${__formdata.CFORPAG != null && __formdata.CFORPAG != 1}">
                            <td class="titulocaja">
                                <b><axis:alt f="axissin012" c="LSTAGENTES" lit="9903035"/></b><!-- LISTA AGENTES SUCURSAL/ADN -->
                            </td> 
                            </c:if>
                        </axis:ocultar>
                        
                        <axis:ocultar c="PRESENTADOR" f="axissin012" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_PRESENTADOR"><axis:alt f="axissin012" c="PRESENTADOR" lit="9909353"/></b><!-- Nombre del presentador de la factura -->
                            </td> 
                        </axis:ocultar>
                    </tr>
                    <tr>
                    <axis:ocultar f="axissin012" c="COFICI" dejarHueco="false"> 
                        <c:if test="${__formdata.CFORPAG == 33 or
                                      __formdata.CFORPAG == 34 or
                                      __formdata.CFORPAG == 35}">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.COFICIN}" 
                                       name="COFICI" id="COFICI" style="width:25%;" onchange="f_but_buscar_oficina()"
                                <axis:atr f="axissin012" c="COFICI" a="formato=entero&obligatorio=true"/> 
                                title="<axis:alt f="axissin012" c="COFICI" lit="102347"/>" />&nbsp;
                                <axis:visible f="axissin012" c="BT_BUSCA_OFICI">
                                    <img id="findOfici" border="0" src="images/find.gif" onclick="f_abrir_busca_ofis();" style="cursor:pointer"/>
                                    &nbsp;<span id="TOFICI"><b>${__formdata.TOFICI}</b></span>
                                 </axis:visible> 
                            </td>
                        </c:if>
                    </axis:ocultar>
                    <axis:ocultar f="axissin012" c="CCIUDAD" dejarHueco="false"> 
                        <c:if test="${__formdata.CFORPAG == 34}">
                            <td class="campocaja" id="td_CCIUDAD">
                                <select name="CCIUDAD" id="CCIUDAD" onchange=""  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                       title="<axis:alt f="axissin012" c="CCIUDAD" lit="9904294"/>"  <axis:atr f="axissin012" c="CCIUDAD" a="obligatorio=true&isInputText=false"/>>
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CCIUDAD" lit="1000348"/> - </option>
                                    <c:forEach var="ciudad" items="${__formdata.listvalores.lstciudades}">
                                        <option value = "${ciudad.CPROVIN}" <c:if test="${ciudad.CPROVIN == __formdata.CCIUDAD}"> selected </c:if> />
                                            ${ciudad.TPROVIN} 
                                        </option>
                                    </c:forEach>
                                 </select>
                            </td>
                        </c:if>
                    </axis:ocultar>
                     <axis:ocultar c="ISINRET" f="axissin012" dejarHueco="false">
                    <td>
                     <input type="text" name="ISINRET" id="ISINRET" title="<axis:alt lit="9000474" c="ISINRET" f="axissin012"/>" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ISINRET}"/>" class="campowidthinput campo" style="width:80%"
                            <axis:atr f="axissin012" c="ISINRET" a="modificable=true&formato=decimal"/> /> 
                    </td>
                    </axis:ocultar>                    
                    
                    <axis:ocultar c="CULTPAG" f="axissin012" dejarHueco="false">
                            <td class="campocaja" align="left">
                                <input type="checkbox" id="CULTPAG" name="CULTPAG" onclick="f_onclickCheckbox(this)" <axis:atr f="axissin012" c="CULTPAG" a="modificable=false"/> value="${__formdata.CULTPAG}" 
                                <c:if test="${__formdata.CULTPAG == '1'}">checked</c:if> >
                            </td>                                
                        </axis:ocultar>                        
                    
                    <axis:ocultar c="CTRIBUTACION" f="axissin012" dejarHueco="false">
                            <td class="campocaja" id="td_CTRIBUTACION">
                                <select name="CTRIBUTACION" id="CTRIBUTACION" onchange=""  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                       title="<axis:alt f="axissin012" c="CTRIBUTACION" lit="9904294"/>"  <axis:atr f="axissin012" c="CTRIBUTACION" a="obligatorio=true&isInputText=false"/>>
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="CTRIBUTACIONLST" lit="1000348"/> - </option>
                                    <c:forEach var="tipotributa" items="${__formdata.listvalores.lstctributa}">
                                        <option value = "${tipotributa.CATRIBU}" <c:if test="${tipotributa.CATRIBU == __formdata.CTRIBUTACION}"> selected </c:if> />
                                            ${tipotributa.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                    </axis:ocultar>
                    <axis:ocultar c="LSTAGENTES" f="axissin012" dejarHueco="false">
                         <c:if test="${__formdata.CFORPAG != null && __formdata.CFORPAG != 1}">
                            <td class="campocaja" id="td_LSTAGENTES">
                                <select name="CAGENTE_SELEC" id="CAGENTE_SELEC" onchange=""  size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                       title="<axis:alt f="axissin012" c="LSTAGENTES" lit="101024"/>"  <axis:atr f="axissin012" c="LSTAGENTES" a="obligatorio=true&isInputText=false"/>>
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin012" c="LSTAGENTES" lit="1000348"/> - </option>
                                    <c:forEach var="agente" items="${__formdata.listvalores.listaTipoAgentes}">
                                        <option value = "${agente.CAGENTE}" <c:if test="${agente.CAGENTE == __formdata.PAGO.CAGENTE || agente.CAGENTE == __formdata.CAGENTE_SELEC}"> selected </c:if> />
                                            ${agente.TNOMBRE} 
                                        </option>
                                    </c:forEach>
                                 </select>
                             </td>
                         </c:if>
                     </axis:ocultar>
                     
                     <axis:ocultar c="PRESENTADOR" f="axissin012" dejarHueco="false">
                         <td class="campocaja" id="td_PRESENTADOR" >
                             <input type="text" class="campo campotexto" value="" name="PRESENTADOR" id="PRESENTADOR" size="15" readonly="true" style="width:80%;"
                             <axis:atr f="axisadm093" c="PRESENTADOR" a="obligatorio=true"/>/>        
                             &nbsp;
                             <img id="icon_PRESENTADOR" border="0" src="images/find.gif" 
                             onclick="javascript:f_abrir_modal('axisper021', null, '&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE=' + document.miForm.CAGENTE.value + '&SSEGURO=' + document.miForm.SSEGURO.value);" style="cursor:pointer"/>
                         </td>
                    </axis:ocultar>                     
                    </tr>
                    
                    <tr>
                        <axis:ocultar c="TOBSERVA" f="axissin012" dejarHueco="false">
                        <td class="titulocaja">
                            <b><axis:alt f="axissin012" c="TOBSERVA" lit="101162"/></b><!-- Observaciones -->
                        </td> 
                        </axis:ocultar>                    
                    </tr>
                    
                    <tr>  
                        <axis:ocultar c="TOBSERVA" f="axissin012" dejarHueco="false">
                        <td class="campocaja" id="td_TOBSERVA"  colspan="2">                        
                            <textarea <axis:atr f="axisadm093" c="TOBSERVA" a="modificable=true"/> 
                            title="<axis:alt f="axisadm093" c="TOBSERVA" lit="9907724"/>" cols="" rows="3" class="campo campotexto"  id="TOBSERVA" name="TOBSERVA" size="15" maxlength="1000"
                            style="width:98%;overflow-x:hidden;overflow-y:auto"></textarea>
                        </td>
                        </axis:ocultar>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin012</c:param><c:param name="f">axissin012</c:param><c:param name="f">axissin012</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FORDPAG",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FORDPAG", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FFACREF",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FFACREF", 
                singleClick    :    true,
                firstDay       :    1
            });
</script>    
  <c:import url="../include/mensajes.jsp" />
</body>
</html>
