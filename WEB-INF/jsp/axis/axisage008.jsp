<%/* Revision:# O7qiqY1MXgigGWVyROmEwQ== # */%>
<%/*
*  Fichero: axisage008.jsp
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
    <title>Traspaso de cartera de agente</title> <%-- Traspaso de cartera de agente --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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

    <script type="text/javascript">
        function f_onload() {     
            // Desplegar datos recibo
            objDom.setDisabledPorId("but_aceptar",false);
            if(document.miForm.CAGENTE.value==null ||document.miForm.CAGENTE.value=='' ){
              //objDom.setDisabledPorId("but_datos",true);
              
              objDom.setDisabledPorId("but_datos",true);
              objDom.setDisabledPorId("but_aceptar",true);
            }
           
            if(document.miForm.tipComi && document.miForm.tipComi.value == 90){
                document.miForm.editComi.style.display = '';
            }
            f_cargar_propiedades_pantalla();
        }
        
        
        function f_but_aceptar() {
           var inputs=document.getElementsByTagName("input");
           var polizas;
           var rebs;
           var rebsgest;
           
           if(objDom.getValorPorId("CAGENTE") != "" && objDom.getValorPorId("CAGENTE2") != ""){
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].checked) {
                            if (inputs[i].name=="chckPOL"){
                                if (polizas==null){
                                    polizas=inputs[i].value;
                                }else{
                                    polizas=polizas+"|"+inputs[i].value;
                                }
                            }
                            if (inputs[i].name=="chckREBS"){
                                if (rebs==null){
                                    rebs=inputs[i].value;
                                }else{
                                    rebs=rebs+"|"+inputs[i].value;
                                }
                            }
                            if (inputs[i].name=="chckREBSGEST"){
                                if (rebsgest==null){
                                    rebsgest=inputs[i].value;
                                }else{
                                    rebsgest=rebsgest+"|"+inputs[i].value;
                                }
                            }
                        }
                    }
               }
               objDom.setValorPorId("LISTPOL", polizas); 
               objDom.setValorPorId("LISTRECPEN", rebs); 
               objDom.setValorPorId("LISTRECGES", rebsgest);                   
               objUtiles.ejecutarFormulario ("axis_axisage008.do?",
                                             "aceptar", document.miForm, "_self", objJsMessages.jslit_actualizando_registro); 
           }
           else alert("<axis:alt f="axisage008" c="BUT_ACEPTAR" lit="9901118"/>"); 
        }
        
        function f_but_salir() {
           objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage008", "cancelar", document.miForm, "_self");                   
        }
        
        
        function f_actualizar_agente(){
            if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE) + 
                        "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE","");
            }
        }
        
        function callbackAjaxCargarAgente(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            
            objDom.setValorPorId("TAGENTE","");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setDisabledPorId("but_datos",false);
                        
                        try{
                        //Borramos los datos del agente seleccionado
                        objLista.borrarFilasDeLista ("T_DATPOL", "6", "<axis:alt f='axisage008' c='T_DATPOL' lit='1000254' />");
                        objLista.borrarFilasDeLista ("T_DATREBS", "10", "<axis:alt f='axisage008' c='T_DATREBS' lit='1000254' />");
                        objLista.borrarFilasDeLista ("T_DATREBSG", "10", "<axis:alt f='axisage008' c='T_DATREBSG' lit='1000254' />");
                      }catch(e){}
                        //Al borrar listas deshabilitamos botón de aceptar
                        objDom.setDisabledPorId("but_aceptar",true);
                    
                        //Si el agente seleccionado es igual que el agente destino, este se borra
                        if(CAGENTEformateado==document.miForm.CAGENTE2.value){
                            document.miForm.CAGENTE2.value="";
                            document.miForm.TAGENTE2.value="";
                        }
                        
                        /*objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);*/ 
                } else{
                        /*objDom.setValorPorId("NOMBRE_TEXT","");*/ 
                        objDom.setValorPorId("TAGENTE","");
                        objDom.setValorPorId("CAGENTE","");
                }
            }
        }
        
        function f_actualizar_agente2(){
            if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente2, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE2) + 
                        "&TRAMO=null&CRAMO=null", this, objJsMessages.jslit_cargando);
            } else {
                objDom.setValorPorId("TAGENTE2","");
            }
        }
        
        function callbackAjaxCargarAgente2(ajaxResponseText){
                
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            
            objDom.setValorPorId("TAGENTE2","");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("TAGENTE2", NOMBREformateado); 
                        objDom.setValorPorId("CAGENTE2", CAGENTEformateado);
                        /*objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);*/ 
                        }
                else{
                        /*objDom.setValorPorId("NOMBRE_TEXT","");*/ 
                        objDom.setValorPorId("TAGENTE2","");
                        objDom.setValorPorId("CAGENTE2","");
                    }
                }
        }
        
        function f_seleccionar_todos(valor) {
                var inputs=null;
                var inputs2=null;
                var body = objLista.obtenerBodyLista("T_DATPOL");
                var polizas = objLista.obtenerFilasBodyLista ("T_DATPOL", body);
                var textnpol = null;
                var stmp3 = null;
                var seleccionar = [];
                var isSelected;
                for(i=1;i<=polizas.length;i++){
                    var celdas = document.getElementById("T_DATPOL").rows[i].cells;
                    var seguro = celdas.item(0).innerHTML;
                    var stmp = seguro.split("value=\"",2);
                    var stmp2= stmp[1];
                    stmp3 = stmp2.split("\"",1);
                    //alert("f_seleccionar_todos stmp3:"+stmp3+" valor:"+valor);
                    if(stmp3==valor){
                        var npol= celdas.item(1).innerHTML;
                        textnpol = $(npol).text();  
                    }        
                }
                var bodyrec = objLista.obtenerBodyLista("T_DATREBS");
                var recibos = objLista.obtenerFilasBodyLista ("T_DATREBS", bodyrec);
                for(i=0;i<=recibos.length;i++){                 
                    var celdas2 = document.getElementById("T_DATREBS").rows[i].cells;
                    var recibo = celdas2.item(2).innerHTML;
                    var polrecibo = $(recibo).text();
                    if(textnpol!=null){
                        if(polrecibo==textnpol){
                            var select = celdas2.item(0).innerHTML;
                            var stmp4 = select.split("value=\"",2);
                            var stmp5= stmp4[1];
                            var dato= stmp5.split("\"",1);
                            seleccionar.push(dato); 
                        }                        
                    }
                }
                inputs=document.getElementsByTagName("input"); 
                for (k=0;k<=inputs.length;k++) 
                {        
                    if (inputs[k].type=="checkbox") {
                        if (inputs[k].name=="chckPOL"){
                            if (inputs[k].value.toString() == valor.toString()){                    
                                if(inputs[k].checked){
                                    isSelected = true;
                                }else{
                                    isSelected = false;
                                }
                                break;                                    
                            }
                        }
                    }                

                }      
                inputs2=document.getElementsByTagName("input"); 
                for(i=0;i<seleccionar.length;i++){
                    var dato2 = seleccionar[i];
                    for (j=0;j<=inputs2.length;j++) 
                    {       
                        if (inputs2[j].type=="checkbox") {
                            if (inputs2[j].name=="chckREBS"){
                                if (inputs2[j].value.toString() == dato2.toString()){
                                    inputs2[j].checked=isSelected;                          
                                    break;
                                } 
                            }
                        }
                    }
                }  
        }
        
   
       /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);

            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                var QUIN_AGENT = objDom.getValorPorId("quin_agent");
                if(QUIN_AGENT == '1'){
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);
                    objDom.setDisabledPorId("but_datos",false);
                    
                    try{
                    //Borramos los datos del agente seleccionado
                    objLista.borrarFilasDeLista ("T_DATPOL", "8", "<axis:alt f='axisage008' c='T_DATPOL' lit='1000254' />");
                    objLista.borrarFilasDeLista ("T_DATREBS", "10", "<axis:alt f='axisage008' c='T_DATREBS' lit='1000254' />");
                    objLista.borrarFilasDeLista ("T_DATREBSG", "10", "<axis:alt f='axisage008' c='T_DATREBSG' lit='1000254' />");
                    }catch(e){}
                    //Al borrar listas deshabilitamos botón de aceptar
                    objDom.setDisabledPorId("but_aceptar",true);
                    
                    //Si el agente seleccionado es igual que el agente destino, este se borra
                    if(CAGENTEformateado==document.miForm.CAGENTE2.value){
                        document.miForm.CAGENTE2.value="";
                        document.miForm.TAGENTE2.value="";
                    }
                    
                    
                    
                    
                }
                else
                {
                    objDom.setValorPorId("CAGENTE2", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE2", NOMBREformateado);

                }
                
            }
        }
        
        function f_abrir_axisctr014(QUIN_AGENT) {
            objDom.setValorPorId("quin_agent", QUIN_AGENT);
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=TRASPASO_CARTERA");
        }
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014");
        }    
        function f_aceptar_axisctr014 (CAGENTE){
            objAjax.invokeAsyncCGI("axis_axisage008.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            f_cerrar_axisctr014();
        }
        
        function f_cargar(){
            //Sólo recargamos valores cuando se cambia el agente de origen
            var CAGENTE = document.miForm.CAGENTE.value;
            if(CAGENTE!=null && CAGENTE!=''){
                        objDom.setDisabledPorId("but_aceptar",false);
                        objUtiles.ejecutarFormulario("axis_axisage008.do", "form", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);   //jslit_cargando
            }
        }
        
        function f_seltot_pol(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckPOL"){
                            inputs[i].checked = true;
                        }
                    }
                }
                
                var body = objLista.obtenerBodyLista("T_DATPOL");
                var polizas = objLista.obtenerFilasBodyLista ("T_DATPOL", body);
                //var stmp3 = null;
                var textnpol = null;
                var seleccionar = [];
                //var isSelected;                  
                for(k=0;k<=polizas.length;k++){
                    var celdas = document.getElementById("T_DATPOL").rows[k].cells;
                    /*var seguro = celdas.item(0).innerHTML;
                    var stmp = seguro.split("value=\"",2);
                    var stmp2= stmp[1];
                    stmp3 = stmp2.split("\"",1);
                    if(stmp3==valor){*/
                        var npol= celdas.item(1).innerHTML;
                        textnpol = $(npol).text();  
                    //}    
                    var bodyrec = objLista.obtenerBodyLista("T_DATREBS");
                    var recibos = objLista.obtenerFilasBodyLista ("T_DATREBS", bodyrec);
                    
                    for(i=1;i<=recibos.length;i++){
                        var celdas2 = document.getElementById("T_DATREBS").rows[i].cells;
                        var recibo = celdas2.item(2).innerHTML;
                        var polrecibo = $(recibo).text();
                        
                        if(textnpol!=null){
                            if(polrecibo==textnpol){
                                var select = celdas2.item(0).innerHTML;
                                var stmp4 = select.split("value=\"",2);
                                var stmp5= stmp4[1];
                                var dato= stmp5.split("\"",1);
                                seleccionar.push(dato);
                            }                        
                        }
                    }                    
                }
                
                var inputs2=null;                
                inputs2=document.getElementsByTagName("input");
                //for(i=1;i<=seleccionar.length;i++){ //CONF-706 (Comentado)
                for(i=0;i<=seleccionar.length-1;i++){ //CONF-706
                    var dato2 = seleccionar[i];
                    for (j=0;j<=inputs2.length;j++) 
                    {       
                        if (inputs2[j].type=="checkbox") {
                            if (inputs2[j].name=="chckREBS"){
                                if (inputs2[j].value.toString() == dato2.toString()){
                                    inputs2[j].checked=true;
                                    break;
                                } 
                            }
                        }
                    }
                }                  
        }
        
        function f_seltot_rebs(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckREBS"){
                            inputs[i].checked = true;
                        }
                    }
                }
        }
        
        function f_seltot_rebsg(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckREBSGEST"){
                            inputs[i].checked = true;
                        }
                    }
                }
        }
        
        function f_deseltot_pol(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckPOL"){
                            inputs[i].checked = false;
                        }
                    }
                }
                
                var body = objLista.obtenerBodyLista("T_DATPOL");
                var polizas = objLista.obtenerFilasBodyLista ("T_DATPOL", body);
                //var stmp3 = null;
                var textnpol = null;
                var seleccionar = [];
                //var isSelected;                
                for(k=1;k<=polizas.length;k++){
                    var celdas = document.getElementById("T_DATPOL").rows[k].cells;
                    /*var seguro = celdas.item(0).innerHTML;
                    var stmp = seguro.split("value=\"",2);
                    var stmp2= stmp[1];
                    stmp3 = stmp2.split("\"",1);
                    if(stmp3==valor){*/
                        var npol= celdas.item(1).innerHTML;
                        textnpol = $(npol).text();  
                    //}    
                    var bodyrec = objLista.obtenerBodyLista("T_DATREBS");
                    var recibos = objLista.obtenerFilasBodyLista ("T_DATREBS", bodyrec);
                    
                    for(i=1;i<=recibos.length;i++){
                        var celdas2 = document.getElementById("T_DATREBS").rows[i].cells;
                        var recibo = celdas2.item(2).innerHTML;
                        var polrecibo = $(recibo).text();
                        if(textnpol!=null){
                            if(polrecibo==textnpol){
                                var select = celdas2.item(0).innerHTML;
                                var stmp4 = select.split("value=\"",2);
                                var stmp5= stmp4[1];
                                var dato= stmp5.split("\"",1);
                                seleccionar.push(dato);
                            }                        
                        }
                    }                    
                }
                
                var inputs2=null;
                inputs2=document.getElementsByTagName("input"); 
                //for(i=1;i<=seleccionar.length;i++){ //CONF-706 (Comentado)
                for(i=0;i<=seleccionar.length-1;i++){ //CONF-706
                    var dato2 = seleccionar[i];
                    for (j=0;j<=inputs2.length;j++) 
                    {       
                        if (inputs2[j].type=="checkbox") {
                            if (inputs2[j].name=="chckREBS"){
                                if (inputs2[j].value.toString() == dato2.toString()){
                                    inputs2[j].checked=false;
                                    break;
                                } 
                            }
                        }
                    }
                }                  
        }
        
        function f_deseltot_rebs(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckREBS"){
                            inputs[i].checked = false;
                        }
                    }
                }
        }
        
        function f_deseltot_rebsg(){
           var inputs=document.getElementsByTagName("input");
           
               for(i=0;i<inputs.length;i++){
                    if (inputs[i].type=="checkbox") {
                        if (inputs[i].name=="chckREBSGEST"){
                            inputs[i].checked = false;
                        }
                    }
                }
        }
        
      function f_abrir_axisper021 () {
        //var SSEGURO = "${__formdata.SSEGURO}";
        var CAGENTE = document.miForm.CAGENTE.value;
        if(CAGENTE!=null && CAGENTE!='')
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value);
        else
            alert("<axis:alt f="axisage008" c="LIT_PER" lit="104589"/>");
            
      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }  
      
      function f_cerrar_axisper021(){
      f_cerrar_modalespersona("axisper021");
      }   
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value);  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;
        document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
         if (!objUtiles.estaVacio(SPERSON)){
       objUtiles.ejecutarFormulario ("axis_axisage008.do?CAGE="+document.miForm.CAGENTE.value, "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);   
       // objAjax.invokeAsyncCGI("modal_axissin011.do?SPERSON="+SPERSON+"&CAGENTE="+document.miForm.CAGENTE.value, callbackAjaxActualitzaPersona, "operation=ajax_actualiza_persona", this, objJsMessages.jslit_cargando);
        }
      }
      
    function f_cerrar_axisctr010(){
         objUtiles.cerrarModal("axisctr010");
    }
    
      function callbackAjaxActualitzaPersona (ajaxResponseText) {
        try{
       //alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);

        
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
           
             objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
             var NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
             var APELLIDO1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
             var APELLIDO2 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
             objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
             objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
            
        }          
     }catch(e){}
    }
    
    function f_cargar_productos(){
                    //alert("En cargar productos");
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("axis_axisage008.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
                    //alert("Fin cargar productos");
            }      
            
             

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage008" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                       
                }
            }   
            
            function f_existe_persona(NNUMIDE){
                 
               var CAGENTE = document.miForm.CAGENTE.value;
               document.miForm.NOMBRE.value = '';
               if(CAGENTE!=null && CAGENTE!=''){
                objAjax.invokeAsyncCGI("axis_axisage008.do", callbackajaxexistePersona, 
                  "operation=ajax_existe_persona&NNUMIDE=" + NNUMIDE+"&CAGENTE="+document.miForm.CAGENTE.value , this, objJsMessages.jslit_actualizando_registro);
               }
               else
                alert("<axis:alt f="axisage008" c="LIT_PER" lit="104589"/>");
            }
            
            function callbackajaxexistePersona(ajaxResponseText) {
                
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var PSPERSON_NEW = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PSPERSON_NEW")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("PSPERSON_NEW"), 0, 0) : "");                    
                    if (!objUtiles.estaVacio(PSPERSON_NEW)){
                       // var mensaje = '<axis:alt f="axisctr004" c="NOPERSONA" lit="9901033"/>';
                       // if (confirm(mensaje)){
                        var cagente = "${__formdata.CAGENTE}";
                         objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value+"&NNUMNIF="+document.miForm.NNUMIDE2.value+"&CONSULT_INI=1");
                       //  }
                    }
                }
            }
            function abrirAxisctr010(SSEGURO){
                   
                    
                    if(document.miForm.tipComi && document.miForm.tipComi.value!=''){
                       var tipComision =     document.miForm.tipComi.value;
                       var comisionesStr = document.miForm.comisiones.value;
                      
                       
                    }
                    
                    objUtiles.abrirModal("axisctr010","src","modal_axisctr010.do?operation=form&CTIPCOM="+tipComision+"&pSSEGURO="+SSEGURO+"&comisionesStr="+encodeURIComponent(comisionesStr));
                
            }
            function aceptarModal_axisctr010(comisiones){
               document.miForm.comisiones.value = comisiones;
               f_cerrar_axisctr010();
                
            }
            
            function f_activar_edicion_comi(valor){
                if(valor == 90 ){
                    document.miForm.editComi.style.display = '';
                }else{
                    document.miForm.editComi.style.display = 'none';
                }
                
            }
            //Valida que no sean ingresado enter dentro del textarea
            function Textarea_Sin_Enter($char, $mozChar, $id){
               //alert ($char+" "+$mozChar);
               $textarea = document.getElementById($id);
               niveles = -1;
                
               if($mozChar != null) { // Navegadores compatibles con Mozilla
                   if($mozChar == 13){
                       if(navigator.appName == "Opera") niveles = -2;
                       $textarea.value = $textarea.value.slice(0, niveles);
                   }
               // navegadores compatibles con IE
               } else if($char == 13) $textarea.value = $textarea.value.slice(0,-2);
            }
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt c="TITULO_021" f="axissin011" lit="1000235"/></c:param>
        <c:param name="nid" value="axisper021"/>
    </c:import>  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt c="TITULO_023" f="axisage008" lit="1000235"/></c:param>
        <c:param name="nid" value="axisctr010"/>
    </c:import>  
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_022" f="axissin011" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
    </c:import>
    
    <form name="miForm" action="" method="POST" >         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisage008" c="TITULO" lit="9002269"/></c:param>     <%-- Traspaso de cartera de agente --%>
            <c:param name="formulario"><axis:alt f="axisage008" c="TITULO" lit="9002269"/></c:param> <%-- Traspaso de cartera de agente --%>
            <c:param name="form">axisage008</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisage008" c="TITULO_AGE" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="quin_agent"  id="quin_agent" value=""/>
        
        <input type="hidden" name="LISTPOL"  id="LISTPOL" value="${__formdata.LISTPOL}"/>
        <input type="hidden" name="LISTRECPEN"  id="LISTRECPEN" value="${__formdata.LISTRECPEN}"/>
        <input type="hidden" name="LISTRECGES"  id="LISTRECGES" value="${__formdata.LISTRECGES}"/>
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
        <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
             <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" id="comisiones" name="comisiones" value="${__formdata.comisiones}"/>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
     
        
 
        
   
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><axis:alt f="axisage008" c="TITULO" lit="9002269"/></div> <!-- Traspaso de cartera -->
                        <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                                 <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:12.5%;height:0px"></th>
                                <th style="width:7.5%;height:0px"></th>
                                
                            </tr>
                            <tr>
                            <td >
                            
                            <tr>
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisage008" c="AGENTE_ORI" lit="100584"/>&nbsp;<axis:alt f="axisage008" c="ORIGEN" lit="9000443"/></b><!-- Agente origen -->
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <input type="text" obligatorio="true" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" formato="entero" title="<axis:alt f="axisage008" c="CAGENTE_ORI" lit="100584"/>" size="5" style="width:15%"
                                    title="<axis:alt f="axisage008" c="CAGENTE_ORI" lit="100584"/>" onchange="f_actualizar_agente()"/>
                                    
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('1')" style="cursor:pointer"/>
                                    
                                    <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axisage008" c="TAGENTE_ORI" lit="100584"/>" size="15" style="width:60%" readonly="true"
                                    title="<axis:alt f="axisage008" c="TAGENTE_ORI" lit="100584"/>"/>
                                    &nbsp;&nbsp;
                                    
                                </td>
                                <td class="campocaja">      
                                <input type="button" class="boton" id="but_datos" name="but_datos" value="<axis:alt f="axisage008" c="BUT_OBTENDATOS" lit="9901117"/>" onclick="f_cargar()" /> 
                                </td>
                            </tr>
                            <axis:ocultar f="axisage008" c="DSP_PERRAMPROD" dejarHueco="false">
                            <tr>
                                <axis:ocultar f="axisage008" c="SPERSON" dejarHueco="false">
                                    <td class="titulocaja" >
                                        <b><axis:alt f="axisage008" c="LIT_SPERSON" lit="105330"/></b><!-- Document -->                                
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisage008" c="NOMBRE" dejarHueco="false">
                                    <td class="titulocaja" colspan = "2">
                                        <b><axis:alt f="axisage008" c="LIT_NOMBRE" lit="105940"/></b><!-- Nombre -->                                
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisage008" c="CTIPCOMI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisage008" c="LIT_TIPCOMI" lit="9902149"/></b><!-- Nombre -->                                
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisage008" c="SPERSON" dejarHueco="false">
                                    <td class="campocaja" >
                                        <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:80%"
                                        <axis:atr f="axisage008" c="SPERSON" a="modificable=true"/> /> 
                                        <input type="text" name="NNUMIDE2" id="NNUMIDE2" value="${__formdata.NNUMIDE2}" class="campowidthinput campo campotexto" style="width:80%"
                                        <axis:atr f="axisage008" c="NNUMIDE2" a="modificable=true"/> onchange="f_existe_persona(this.value)" /> 
                                        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisage008" c="NOMBRE" dejarHueco="false">
                                        <td class="campocaja" colspan="2">
                                            <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto" style="width:90%"
                                            <axis:atr f="axisage008" c="NOMBRE" a="modificable=false"/> /> 
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisage008" c="CTIPCOMI" dejarHueco="false">
                                        <td class="campocaja" colspan="2" >
                                        <select name = "tipComi" id="tipComi" style="width:80%;"  size="1" onchange="f_activar_edicion_comi(this.value)" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="comi" items="${lista_comi}">
                                                <option value = "${comi.CATRIBU}"
                                                    <c:if test="${comi.CATRIBU == __formdata.tipComi}">selected</c:if>>
                                                    ${comi.TATRIBU}
                                                </option>
                                            </c:forEach>
                                            </select>
                                      
                                               <img id="editComi" name="editComi" alt="<axis:alt c="BT_COMISION" f="axisage008" lit="1000113"/>" title1="<axis:alt c="BT_COMISION" f="axisage008" lit="101509"/>" src="images/lapiz.gif" width="11px" height="11px"
                                                                                style="cursor:pointer;display:none"  onclick="javascript:abrirAxisctr010();" />
                                                
                                            
                                         </td>
                                    </axis:ocultar>
                            </tr>
                             <tr>
                                <!-- Ramo -->
                                <axis:ocultar f="axisage008" c="CRAMO" dejarHueco="false"> 
                                <td class="titulocaja">
                                     <b><axis:alt f="axisage008" c="RAMO" lit="100784"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Sproduc -->
                                <axis:ocultar f="axisage008" c="SPRODUC" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisage008" c="PRODUCTO" lit="100829"/></b>
                                </td>
                                </axis:ocultar>                                
                            </tr>                            
                            <tr>
                            
                                <!-- Ramo -->
                                                            
                                <axis:ocultar f="axisage008" c="CRAMO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:100%;"  size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <!-- Producto -->
                                <axis:ocultar f="axisage008" c="SPRODUC" dejarHueco="false"> 
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto" style="width:100%;"> 
                                        <option value="<%= Integer.MIN_VALUE %>">  <axis:alt f="axisage008" c="SELECCIONAR" lit="108341" />  </option>
                                        <c:forEach items="${__formdata.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <!-- motivo del traspaso -->
                                <axis:ocultar f="axisage008" c="CMOTRASPASO" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axisage008" c="CMOTRASPASO" lit="9907608"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>                            
                            <tr>                            
                                <!-- motivo traspaso -->                                                            
                                <axis:ocultar f="axisage008" c="CMOTRASPASO" dejarHueco="false"> 
                                    <td class="campocaja" colspan="2">
                                        <select name = "CMOTRASPASO" id="CMOTRASPASO" style="width:100%;"  size="1" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage008" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="mot" items="${axisctr_listaMotTraspas}">
                                                <option value = "${mot.CATRIBU}"
                                                    <c:if test="${mot.CATRIBU == __formdata.CMOTRASPASO}">selected</c:if>>
                                                    ${mot.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <!-- observaciones -->
                                <axis:ocultar f="axisage008" c="TOBSERV" dejarHueco="false"> 
                                    <td class="titulocaja">
                                       <b><axis:alt f="axisage008" c="TOBSERV" lit="9904766"/></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>                            
                                <!--observaciones -->                                                            
                                <axis:ocultar f="axisage008" c="TOBSERV" dejarHueco="false"> 
                                    <td class="campocaja" colspan="3">
                                        <textarea rows="3" id="TOBSERV" name="TOBSERV" class="campowidthinput campo campotexto" style="width:100%" onkeyup="Textarea_Sin_Enter(event.keyCode, event.which, 'TOBSERV');" onkeydown="Textarea_Sin_Enter(event.keyCode, event.which, 'TOBSERV');"
                                        <axis:atr f="axisage008" c="TOBSERV" a="modificable=true"/> maxlength="200">${__formdata.TOBSERV}</textarea> 
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr><td colspan="8"><hr  /></td></tr>
                            </axis:ocultar>
                            <tr>
                                 <axis:ocultar f="axisage008" c="NPOLIZA" dejarHueco="false">
                                  <td class="titulocaja">
                                               <b><axis:alt f="axisage008" c="NPOLIZA" lit="101273" /></b><!-- NPOLIZA -->&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>
          
                                    </td>
                                </axis:ocultar>
                                   <axis:ocultar f="axisage008" c="CPOLCIA" dejarHueco="false">
                                        <td id="tit_CPOLCIA" class="titulocaja">
                                            <b id="label_CPOLCIA"><axis:alt f="axisage008" c="CPOLCIA" lit="9001766"></axis:alt></b>
                                        </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisage008" c="NNUMIDE" dejarHueco="false">
                                     <td class="titulocaja">
                                     
                                          <b><axis:alt f="axisage008" c="NNUMIDE" lit="105330"></axis:alt> </b>&nbsp;&nbsp;
                                          <b><axis:alt f="axisage008" c="TOMADOR" lit="101027"></axis:alt> </b>
                                     </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisage008" c="NRECIBO" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisage008" c="NRECIBO" lit="800636"/></b> <%-- Nº Rebut --%>
                                    </td>
                                  </axis:ocultar>
                                <axis:ocultar f="axisage008" c="CRECCIA" dejarHueco="false">                            
                                 <td class="titulocaja" id="LIT_CRECCIA">
                                     <b><axis:alt f="axisage008" c="CRECCIA" lit="9001763"/></b><%-- Nº Recibo Compania --%>                              
                                 </td>
                                </axis:ocultar>               
                               
                            </tr>
                            <tr>
                                <axis:ocultar f="axisage008" c="NPOLIZA" dejarHueco="false">
                                <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisage008" c="NPOLIZA" lit="101273"/>" size="15" 
                                        title="<axis:alt f="axisage008" c="NPOLIZA" lit="101273"/>"/>&nbsp;&nbsp;
                                           
                                </td>
                                </axis:ocultar>
                                
                                
                                 <axis:ocultar f="axisage008" c="CPOLCIA" dejarHueco="false">
                                <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"  value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA" title="<axis:alt f="axisage008" c="CPOLCIA" lit="9001766"/>" size="15" 
                                        title="<axis:alt f="axisage008" c="CPOLCIA" lit="9001766"/>"/>&nbsp;&nbsp;
                                           
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisage008" c="NNUMIDE" dejarHueco="false">
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisage008" c="NRECIBO" dejarHueco="false">
                                 <td class="campocaja">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                        style="width:91%;" title="<axis:alt f="axisage008" c="NRECIBO" lit="800636"/>" <axis:atr f="axisage008" c="NRECIBO" a="formato=entero"/> />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisage008" c="CRECCIA" dejarHueco="false">
                                 <td class="campocaja">                             
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CRECCIA}" name="CRECCIA" id="CRECCIA"
                                        style="width:91%;" title="<axis:alt f="axisage008" c="CRECCIA" lit="9001763"/>" <axis:atr f="axisage008" c="CRECCIA"/> />
                                </td>
                                </axis:ocultar>   
                                 
                           
                            </tr>
                            
                            </td>
                        </tr>
                        <axis:ocultar f="axisage008" c="NPOLIZA" dejarHueco="false">
                        <tr><td colspan="8"><hr  /></td></tr>
                        </axis:ocultar>
                        <tr>
                            <td >
                            
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisage008" c="AGENTE_DEST" lit="100584"/>&nbsp;<axis:alt f="axisage008" c="DESTINO" lit="9900766"/></b><!-- Agente destino -->
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE2}" name="CAGENTE2" id="CAGENTE2" formato="entero" title="<axis:alt f="axisage008" c="CAGENTE_DEST" lit="100584"/>" size="5" style="width:15%"
                                    title="<axis:alt f="axisage008" c="CAGENTE_DEST" lit="100584"/>" onchange="f_actualizar_agente2()"/>
                                    
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014('2')" style="cursor:pointer"/>
                                    
                                    <input type="text" class="campo campotexto" value="${__formdata.TAGENTE2}" name="TAGENTE2" id="TAGENTE2" title="<axis:alt f="axisage008" c="TAGENTE_DEST" lit="100584"/>" size="15" style="width:60%" readonly="true"
                                    title="<axis:alt f="axisage008" c="TAGENTE_DEST" lit="100584"/>" />
                                </td>
                           
                            </tr>
                           
                            <td> </td>
                            </td>
                        </tr>
                        </table>
    <tr><td>
        <div class="titulo">
          <b><axis:alt f="axisage008" c="POLVIG" lit="9902454" /></b> <!-- Pólizas vigentes -->
        </div>
        <table class="seccion">
          
          <!-- DisplayTag  -->
          <tr><td>
            <c:set var="title1"><axis:alt f="axisage008" c="NPOLIZA" lit="101273" /></c:set><!-- Nº Póliza -->
            <c:set var="title2"><axis:alt f="axisage008" c="TNOMBRE" lit="101027" /></c:set><!-- Tomador -->
            <c:set var="title3"><axis:alt f="axisage008" c="TITPRO" lit="100829" /></c:set><!-- Producto -->
            <c:set var="title7"><axis:alt f="axisage008" c="CBANCAR" lit="100965" /></c:set><!-- Tomador -->
            <c:set var="title8"><axis:alt f="axisage008" c="CPOLCIA" lit="9001766" /></c:set><!-- Tomador -->
           
            
            <div class="displayspace">
              <display:table name="${lista_pol}" id="T_DATPOL" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
               requestURI="axis_axisage008.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                
                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                    <div class="dspIcons" >
                        <input type="checkbox" id="chckPOL_${T_DATPOL.SSEGURO}"
                               name="chckPOL" value="${T_DATPOL.SSEGURO}" onClick="f_seleccionar_todos(this.value)"/>
                    </div>
                </display:column>
                <axis:visible c="NPOLIZA_DATPOL" f="axisage008">
                <display:column title="${title1}" sortable="true" sortProperty="npoliza" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATPOL.NPOLIZA}</div>
                </display:column>
                </axis:visible>
                <axis:visible c="CPOLCIA_DATPOL" f="axisage008">
                <display:column title="${title8}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATPOL.CPOLCIA}</div>
                </display:column> 
                </axis:visible>
                <axis:visible c="TNOMBRE_DATPOL" f="axisage008">
                <display:column title="${title2}" sortable="true" sortProperty="tnombre" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText" align="left">${T_DATPOL.TNOMBRE}</div>
                </display:column> 
                </axis:visible>
                <axis:visible c="CBANCAR_DATPOL" f="axisage008">
                <display:column title="${title7}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText"><axis:masc f="axisage008" c="CBANCAR_DATPOL" value="${T_DATPOL.CUENTA}" /></div>
                </display:column>
                </axis:visible>
                <axis:visible c="TITPRO_DATPOL" f="axisage008">
                <display:column title="${title3}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATPOL.TITPRO}</div>
                </display:column>
                </axis:visible>
                
            </display:table>
            </div>
            <c:if test="${! empty lista_pol}">
                <input type="button" class="boton" id="but_sel_pol" value="<axis:alt f="axisage008" c="BUT_SEL_POL" lit="9000756"/>" onclick="f_seltot_pol()" /> 
                <input type="button" class="boton" id="but_desel_pol" value="<axis:alt f="axisage008" c="BUT_DESEL_POL" lit="9000757"/>" onclick="f_deseltot_pol()" /> 
            </c:if>
          </td></tr>
        </table>
    </td></tr>

    <tr>
	<axis:ocultar f="axisage008" c="RECIBO" dejarHueco="false">
	<td>
        <div class="titulo">
          <b><axis:alt f="axisage008" c="RECPEND" lit="9001635" /></b><!-- Recibos pendientes -->
        </div>
        <table class="seccion">
          
          <!-- DisplayTag  -->
          <tr><td>
            <c:set var="title1"><axis:alt f="axisage008" c="NRECIBO" lit="800636" /></c:set> <!-- Nº Recibo -->
            <c:set var="title2"><axis:alt f="axisage008" c="NPOLIZA" lit="101273" /></c:set><!-- Nº Póliza -->
            <c:set var="title3"><axis:alt f="axisage008" c="TITPRO" lit="100829" /></c:set><!-- Producto -->
            <c:set var="title4"><axis:alt f="axisage008" c="TOTREBUT" lit="100563" /></c:set><!-- Importe -->
            <c:set var="title5"><axis:alt f="axisage008" c="FEFECTO" lit="101332" /></c:set><!-- Fecha efecto -->
            
            <c:set var="title6"><axis:alt f="axisage008" c="TNOMBRE" lit="101027" /></c:set><!-- Tomador -->
            <c:set var="title7"><axis:alt f="axisage008" c="CBANCAR" lit="100965" /></c:set><!-- Tomador -->
            <c:set var="title8"><axis:alt f="axisage008" c="CPOLCIA" lit="9001766" /></c:set><!-- Tomador -->
            <c:set var="title9"><axis:alt f="axisage008" c="CRECCIA" lit="9001763" /></c:set><!-- Tomador -->

            <div class="displayspace">
              <display:table name="${lista_recpend}" id="T_DATREBS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
               requestURI="axis_axisage008.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                <axis:visible c="CHK_NRECIBO" f="axisage008">
                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable fixed" >
                    <div class="dspIcons">
                        <input type="checkbox" id="chckREBS_${T_DATREBS.NRECIBO}"
                               name="chckREBS" value="${T_DATREBS.NRECIBO}"/>
                    </div>
                </display:column>
                </axis:visible>
                <axis:visible c="NRECIBO_DATREBS" f="axisage008">
                <display:column title="${title1}" sortable="true" sortProperty="nrecibo" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.NRECIBO}</div>
                </display:column> 
                </axis:visible>
                <axis:visible c="CRECCIA_DATREBS" f="axisage008">
                <display:column title="${title9}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.CRECCIA}</div>
                </display:column> 
                </axis:visible>
                <axis:visible c="NPOLIZA_DATREBS" f="axisage008">
                <display:column title="${title2}" sortable="true" sortProperty="npoliza" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.NPOLIZA}</div>
                </display:column> 
                </axis:visible>
                <axis:visible c="CPOLCIA_DATREBS" f="axisage008">
                 <display:column title="${title8}" sortable="true" sortProperty="npoliza" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.CPOLCIA}</div>
                </display:column>
                </axis:visible>
                <axis:visible c="TITPRO_DATREBS" f="axisage008">
                <display:column title="${title3}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.TITPRO}</div>
                </display:column>  
                </axis:visible>
                <axis:visible c="TNOMBRE_DATREBS" f="axisage008">
                 <display:column title="${title6}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.TNOMBRE}</div>
                </display:column>  
                </axis:visible>
                <axis:visible c="CBANCAR_DATREBS" f="axisage008">
                <display:column title="${title7}" sortable="true" sortProperty="titpro" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBS.CUENTA}</div>
                </display:column>
                </axis:visible>
                <axis:visible c="TOTREBUT_DATREBS" f="axisage008">
                <display:column title="${title4}" sortable="true" sortProperty="totrebut" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber pattern='###,##0.00' value='${T_DATREBS.TOTREBUT}'/></div>
                </display:column>  
                </axis:visible>
                <axis:visible c="FEFECTO_DATREBS" f="axisage008">
                <display:column title="${title5}" sortable="true" sortProperty="fefecto" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_DATREBS.FEFECTO}"/></div>
                </display:column> 
                </axis:visible>
            </display:table>
            </div>
            <c:if test="${! empty lista_recpend}">
                <input type="button" class="boton" id="but_sel_pol" value="<axis:alt f="axisage008" c="BUT_SEL_POL" lit="9000756"/>" onclick="f_seltot_rebs()" /> 
                <input type="button" class="boton" id="but_desel_pol" value="<axis:alt f="axisage008" c="BUT_DESEL_POL" lit="9000757"/>" onclick="f_deseltot_rebs()" /> 
            </c:if>
          </td></tr>
        </table>
    </td>
	</axis:ocultar>
	</tr>

    <tr>
	<axis:ocultar f="axisage008" c="GRECIBO" dejarHueco="false">
	<td>
<c:if test="${!empty lista_recgest}">
        <div class="titulo">
          <b><axis:alt f="axisage008" c="RECPERGES" lit="9002260" /></b><!-- Recibos periodo gestión -->
        </div>
        <table class="seccion">
          
          <!-- DisplayTag  -->
          <tr><td>
            <c:set var="title1"><axis:alt f="axisage008" c="NRECIBO" lit="800636" /></c:set> <!-- Nº Recibo -->
            <c:set var="title2"><axis:alt f="axisage008" c="NPOLIZA" lit="101273" /></c:set><!-- Nº Póliza -->
            <c:set var="title3"><axis:alt f="axisage008" c="TITPRO" lit="100829" /></c:set><!-- Producto -->
            <c:set var="title4"><axis:alt f="axisage008" c="TOTREBUT" lit="100563" /></c:set><!-- Importe -->
            <c:set var="title5"><axis:alt f="axisage008" c="FEFECTO" lit="101332" /></c:set><!-- Fecha efecto -->
           
            <div class="displayspace">
              <display:table name="${lista_recgest}" id="T_DATREBSG" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
               requestURI="axis_axisage008.do?paginar=true">
                <%@ include file="../include/displaytag.jsp"%>
                
                <display:column title="" sortable="false" media="html" autolink="false" headerClass="sortable" >
                    <div class="dspIcons" >
                        <input type="checkbox" id="chckREBSGEST_${T_DATREBSG.NRECIBO}"
                               name="chckREBSGEST" value="${T_DATREBSG.NRECIBO}"/>
                    </div>
                </display:column>
                
                <display:column title="${title1}" sortable="true" sortProperty="nrecibo" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBSG.NRECIBO}</div>
                </display:column>  
                <display:column title="${title2}" sortable="true" sortProperty="npoliza" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBSG.NPOLIZA}</div>
                </display:column> 
                <display:column title="${title3}" sortable="true" sortProperty="titpro" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText">${T_DATREBSG.TITPRO}</div>
                </display:column>  
                <display:column title="${title4}" sortable="true" sortProperty="totrebut" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber pattern='###,##0.00' value='${T_DATREBSG.TOTREBUT}'/></div>
                </display:column>  
                <display:column title="${title5}" sortable="true" sortProperty="fefecto" headerClass="sortable" media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${T_DATREBSG.FEFECTO}"/></div>
                </display:column> 
            </display:table>
            </div>
            <c:if test="${! empty lista_recgest}">
                <input type="button" class="boton" id="but_sel_pol" value="<axis:alt f="axisage008" c="BUT_SEL_POL" lit="9000756"/>" onclick="f_seltot_rebsg()" /> 
                <input type="button" class="boton" id="but_desel_pol" value="<axis:alt f="axisage008" c="BUT_DESEL_POL" lit="9000757"/>" onclick="f_deseltot_rebsg()" /> 
            </c:if>
          </td></tr>
        </table>
        </c:if>
     </td>
	 </axis:ocultar> 
	 </tr>

                </td>
            </tr>
        </table>


        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisage008</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "buscarFCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_buscarFCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>

</body>
</html>
