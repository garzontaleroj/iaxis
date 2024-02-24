<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axisctr050.jsp
* 12/12/2008/
* @author <a href="xpastor@csi-ti.com">Xavi Pastor/Jaume Garcia</a>
*
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
    <title><axis:alt f='axisctr050' c='MODOCARTERA' lit='9000664'/></title> <%-- Gestió del registre de cobertures de mort  --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        
    <c:import url="../include/carga_framework_js.jsp"/>
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
           
           //RADIO = 1 Por producto
           //RADIO = 2 Por póliza
           var RADIO = '${__formdata.RADIO}';
        
           if (objUtiles.estaVacio(RADIO))
               RADIO = 1;
         
           f_actualitzarProd(RADIO);
           
           if(objUtiles.estaVacio($('#productosSeleccionados').val())){
                //Si borramos los productos seleccionados, entonces tambien desmarcamos los checkbox. No llamamos a la funcion f_seleccionar_todos, porque
                // no necesitamos cambios en base de datos.
                f_seleccionar_todos(false);
                //$.each($("[name*='checkProducto_']"), function( index, value ) {
                //    value.checked = false;
                //});           
            }
            
           var CARTERA_DIARIA = '${__formdata.CARTERA_DIARIA}';
           var CARTERA_PROGRAMADA = '${__formdata.CARTERA_PROGRAMADA}';
           mostrarOcultarParProductos(CARTERA_DIARIA, CARTERA_PROGRAMADA);            
           
           f_cargar_propiedades_pantalla();           
        }
      
        function f_but_salir() {
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr050", "cancelar", document.miForm, "_self");
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr050", "cancelar", document.miForm, "_self");
            //objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

           
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        }
        
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (objUtiles.estaVacio(params))   
                params = "";
            if (cual == 'axisadm013') /* modificar per model de cierres*/ {
                objUtiles.ejecutarFormulario("axis_axisadm012.do" + params, "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        

        function f_actualitzarProd(valor) {
           objDom.setVisibilidadPorId("proc_"+valor, "visible");
           objDom.setDisplayPorId("proc_"+valor,"block");
              if (valor == 1){
                   objDom.setVisibilidadPorId("proc_2", "hidden");
                   objDom.setDisplayPorId("proc_2","none");
               }else{
                   objDom.setVisibilidadPorId("proc_1", "hidden");
                   objDom.setDisplayPorId("proc_1","none");
               }
        }  
        
        function f_actualitzarCheck(valor) {
               //objDom.setValorPorId("RADIO", valor);
               objDom.setValorPorId("NANYO", "");
               
               if (valor == 1)
                   objDom.setValorPorId("NPOLIZA", "");

                   objUtiles.ejecutarFormulario("axis_axisctr050.do", "actualitzarMeses", document.miForm, "_self", objJsMessages.jslit_cargando);
        }          
        
        
        
        function f_actualitzar(){
           // $.each($('[name*="checkProducto_"]'),function( index, value ) {value.checked = false });
           // $('#productosSeleccionados').val('');
       
            if (!objUtiles.estaVacio(objDom.getValorPorId("CEMPRES")) && 
                 //!objUtiles.estaVacio(objDom.getValorPorId("CRAMO"))  &&
                 objDom.getValorPorId("CEMPRES") > 0 ){//&&
                 //objDom.getValorPorId("CRAMO") > 0 ){
                 objUtiles.ejecutarFormulario("axis_axisctr050.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_actualitzarRamo(){
       
            if (!objUtiles.estaVacio(objDom.getValorPorId("CEMPRES")) && 
                 objDom.getValorPorId("CEMPRES") > 0 ){
                $('#CRAMO :selected')[0].defaultSelected=true
                f_seleccionar_todos(false);
                actualizar_campos();
            }
        }
        
       function f_get_obteniranys(){
       valor = "${__formdata.RADIO}";
            if (!objUtiles.estaVacio(objDom.getValorPorId("NMES")) && 
                 objDom.getValorPorId("NMES") > 0){
                 objUtiles.ejecutarFormulario("axis_axisctr050.do?RADIO="+valor, "actualitzarAnyo", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        
         function actualizar_campos(){
             //Actualizamos el estado de los botones vinculados a los parámetros CARTERA_DIARIA y CARTERA_PROGRAMADA
             //Lo hacemos después del bucle, en una nueva llamada ajax, puesto que seria muy tedioso evaluar para cada iteración si hay que mostrar los botones
             var productosSeleccionados = $('#productosSeleccionados').val();
             objAjax.invokeAsyncCGI('axis_axisctr050.do', callbackAjaxSeleccionarTodos, 'operation=ajax_actualizarParametrosProductos&productosSeleccionados='+productosSeleccionados, this);
         }
         
         function f_seleccionar_todos(seleccionarTodos) {
                var inputs=document.getElementsByTagName("input"); // es getElementsByTagName o getElementsByName 
                $('#productosSeleccionados').val("");
                
                    for (icont=0;icont<inputs.length;icont++) 
                      {
                        if (inputs[icont].name.indexOf('checkProducto_')>=0) 
                          {     
                          
                           var pos = inputs[icont].name.indexOf('_');
                           var paramNlinea = inputs[icont].name.substr(pos+1,inputs[icont].name.length-pos);
                            
                            if (seleccionarTodos) {
                                inputs[icont].checked=true; // es checked o selected
                                f_seleccionarProd(1,eval('document.miForm.SPRODUC_'+paramNlinea+'.value'), true);
                                //f_seleccionarProd(valor,SPRODUC,todosProductos)
                                }
                            else {
                                inputs[icont].checked=false; // es checked o selected
                                f_seleccionarProd(0,eval('document.miForm.SPRODUC_'+paramNlinea+'.value'), true);                                
                                 }                                     
                          } 
                     }                        
                    
             }
        
        function callbackAjaxSeleccionarTodos(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                var CARTERA_DIARIA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CARTERA_DIARIA"), 0, 0);
                var CARTERA_PROGRAMADA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CARTERA_PROGRAMADA"), 0, 0);
                //mostrarOcultarParProductos(CARTERA_DIARIA, CARTERA_PROGRAMADA);
                objUtiles.ejecutarFormulario("axis_axisctr050.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_seleccionarProd(valor,SPRODUC,todosProductos) {
             var SPROCAR = "${__formdata.SPROCAR}";
             var productosSeleccionados = $('#productosSeleccionados').val();
             var actualizarParProductos = 1;
             
             //Si seleccionamos todos los productos no haremos la actualización de los botones vinculados a CARTERA_DIARIA y CARTERA_PROGRAMADA hasta el final,
             // en f_seleccionar_todos
             if(todosProductos == true){
                actualizarParProductos = 0;
             }
             
             if(valor == 1){
                if(objUtiles.estaVacio(productosSeleccionados)){
                    productosSeleccionados = SPRODUC;
                }else{
                    productosSeleccionados = productosSeleccionados + "#" + SPRODUC;
                }
             }else{
                //Quitar
                productosSeleccionados = productosSeleccionados.replace(SPRODUC,"");
                productosSeleccionados = productosSeleccionados.replace("##","#");
                if(productosSeleccionados.substr(0,1) == "#"){
                    productosSeleccionados = productosSeleccionados.substring(1,productosSeleccionados.length);
                }
                if(productosSeleccionados.substr(productosSeleccionados.length-1,productosSeleccionados.length) == "#"){
                    productosSeleccionados = productosSeleccionados.substring(0,productosSeleccionados.length-1);
                }
             }
             
             $('#productosSeleccionados').val(productosSeleccionados);
             var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&SPROCAR='+SPROCAR+'&SPRODUC='+SPRODUC
                                            +'&productosSeleccionados='+productosSeleccionados+'&actualizarParProductos='+actualizarParProductos;
             objAjax.invokeAsyncCGI('axis_axisctr050.do?SELECCIO='+valor, callbackAjaxSeleccionarProd, 'operation=ajaxseleccionarProd'+parametres, this);
             
        }        
        
         function callbackAjaxSeleccionarProd(ajaxResponseText) {
            try{
              
                var doc = objAjax.domParse(ajaxResponseText);                           
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    var elementos = doc.getElementsByTagName("NMES");
                    
                    var cccCombo = document.miForm.NMES;     
                    objDom.borrarOpcionesDeCombo(cccCombo);
                    objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", cccCombo, 0);
                    for (i = 0; i < elementos.length; i++) {
                        var codigo = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NMES"), i, 0);
                        var desc   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMES"), i, 0);
                
                        objDom.addOpcionACombo(codigo, desc, cccCombo, i+1);
                    }
            
                }else{
                    if($('#NMES option').length > 1){
                        //Borramos todas las options que no son "Seleccionar"
                        $('#NMES option[value!="-2147483648"][value!=""]').remove();  
                    }                    
                }
             
               //Cuando vengamos de seleccionar todos aqui en CARTERA_DIARIA no tendremos nada
                var CARTERA_DIARIA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CARTERA_DIARIA"), 0, 0);
                var CARTERA_PROGRAMADA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CARTERA_PROGRAMADA"), 0, 0);
                $('#CARTERA_DIARIA').val(CARTERA_DIARIA);
                $('#CARTERA_PROGRAMADA').val(CARTERA_PROGRAMADA);
                mostrarOcultarParProductos(CARTERA_DIARIA, CARTERA_PROGRAMADA);
             
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        } 
        
        function moverCamposParProductos(){
             var title_sup = $('#title_carteradiaria_sup').html();
             var fields_sup = $('#fields_carteradiaria_sup').html()
                
             $('#title_carteradiaria_sup').html($('#title_carteradiaria_inf').html());
             $('#fields_carteradiaria_sup').html($('#fields_carteradiaria_inf').html());
                
             $('#title_carteradiaria_inf').html(title_sup);
             $('#fields_carteradiaria_inf').html(fields_sup);
        }
        
        function mostrarOcultarParProductos(CARTERA_DIARIA, CARTERA_PROGRAMADA){
        
            if(!objUtiles.estaVacio(CARTERA_PROGRAMADA) && CARTERA_PROGRAMADA == 1 && !objDom.esVisible("FEJECUCION")){
                objDom.setVisibilidadPorId("FEJECUCION","visible");
                objDom.setVisibilidadPorId("icon_FEJECUCION","visible");
                objDom.setVisibilidadPorId("fejecucion_title_td","visible");
                objDom.setVisibilidadPorId("but_9001534","visible");
            }
            
            if(!objUtiles.estaVacio(CARTERA_PROGRAMADA) && CARTERA_PROGRAMADA == 0 && objDom.esVisible("FEJECUCION")){
                objDom.setVisibilidadPorId("FEJECUCION","hidden");
                objDom.setVisibilidadPorId("icon_FEJECUCION","hidden");
                objDom.setVisibilidadPorId("fejecucion_title_td","hidden");
                objDom.setVisibilidadPorId("but_9001534","hidden");
            }
                 
            if(!objUtiles.estaVacio(CARTERA_DIARIA) && CARTERA_DIARIA == 1 && !objDom.esVisible("FCARTERA")){
                objDom.setVisibilidadPorId("nmes_title_td","hidden");
                objDom.setVisibilidadPorId("nanyo_title_td","hidden");
                objDom.setVisibilidadPorId("NMES","hidden");
                objDom.setVisibilidadPorId("NANYO","hidden");
                
                moverCamposParProductos();
             
                objDom.setVisibilidadPorId("FCARTERA","visible");
                objDom.setVisibilidadPorId("icon_FCARTERA","visible");
                objDom.setVisibilidadPorId("fcartera_title_td","visible");
            }
                
            if(!objUtiles.estaVacio(CARTERA_DIARIA) && CARTERA_DIARIA == 0 &&  !objDom.esVisible("NMES") ){
                objDom.setVisibilidadPorId("nmes_title_td","visible");
                objDom.setVisibilidadPorId("nanyo_title_td","visible");
                objDom.setVisibilidadPorId("NMES","visible");
                objDom.setVisibilidadPorId("NANYO","visible");
                
                moverCamposParProductos();
                
                objDom.setVisibilidadPorId("FCARTERA","hidden");
                objDom.setVisibilidadPorId("icon_FCARTERA","hidden");
                objDom.setVisibilidadPorId("fcartera_title_td","hidden");
            }
            
             Calendar.setup({
                inputField     :    "FCARTERA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FCARTERA", 
                singleClick    :    true,
                firstDay       :    1
            });            

             Calendar.setup({
                inputField     :    "FEJECUCION",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FEJECUCION", 
                singleClick    :    true,
                firstDay       :    1
            });
            
        }        
        
        function f_but_1000576() {
            
           //  var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&NANYO='+objDom.getValorPorId("NANYO")+'&NMES='+objDom.getValorPorId("NMES")+'&MODOCARTERA='+objDom.getValorPorId("MODOCARTERA");
           if (objValidador.validaEntrada()) {
              var FCARTERA = $('#FCARTERA').val(); 
              //var CARTERA_DIARIA = '${__formdata.CARTERA_DIARIA}';
               var CARTERA_DIARIA = $('#CARTERA_DIARIA').val();
              
              if(CARTERA_DIARIA ==0 || (CARTERA_DIARIA ==1 && !objUtiles.estaVacio(FCARTERA))){
                  MODOCARTERA = "${__formdata.MODOCARTERA}";
                  var parametres = '&CEMPRES='+objDom.getValorPorId("CEMPRES")+'&NANYO='+objDom.getValorPorId("NANYO")+'&NMES='+objDom.getValorPorId("NMES")+'&MODOCARTERA='+MODOCARTERA+'&FCARTERA='+objDom.getValorPorId("FCARTERA");
                  objAjax.invokeAsyncCGI('axis_axisctr050.do', callbackAjaxRegistrar, 'operation=ajaxregistrar'+parametres, this);
              }else{                
                var errorMsg = "<axis:alt f='axisctr050' c='MSG_SELECT_PROD' lit='9906719'/>"; //Debe seleccionar como mínimo un producto
                errorMsg =  "- " + objJsMessages.jslit_campo_validador + " '" + $('#FCARTERA').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".";
                alert(errorMsg);
              }
           }             
        }
        
        function callbackAjaxRegistrar(ajaxResponseText) {
            try{
                $('#productosSeleccionados').val("");
            
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                       var OK = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                       if (OK == 0){
                           var NPROCES = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PNPROCESO"), 0, 0);
                           if (confirm ("<axis:alt f='axisctr050' c='PNPROCESO' lit='9000493'/> : "+NPROCES+"\n<axis:alt f='axisctr050' c='PNPROCESO' lit='9000711'/>")){
                             objUtiles.ejecutarFormulario("axis_axisctr050.do?SPROCES="+NPROCES, "procesar", document.miForm, "_self", objJsMessages.jslit_cargando);
                           }
                       }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }     

        //Programar
        function f_but_9001534(){                                                              
            var CARTERA_DIARIA =  $('#CARTERA_DIARIA').val();
            var FEJECUCION = $('#FEJECUCION').val(); 
            var FCARTERA = $('#FCARTERA').val(); 
            var CEMPRES = $('#CEMPRES').val();
            
            if(CARTERA_DIARIA!=0){
                    var fecha = FCARTERA.split('/');
                    var NMES = fecha[1];
                    var NANYO = fecha[2];                
            }else{
                    var NMES = $('#NMES').val();
                    var NANYO = $('#NANYO').val();
            }
            
            //Si estamos yendo por Producto, verificaremos que se haya seleccionado alguno
            //Si estamos yendo por Poliza, veridicaremos que se haya indicado algún número de póliza
            var RADIO = '${__formdata.RADIO}';  //RADIO = 1 -> vamos por productos
                                                                         //RADIO = 2 -> vamos por poliza                       
            var seleccionOk = true;
            var errorMsg;
            if(RADIO == 1){
                var productosSeleccionados = $('#productosSeleccionados').val();
                if(objUtiles.estaVacio(productosSeleccionados)){
                    seleccionOk = false;
                    errorMsg = "<axis:alt f='axisctr050' c='MSG_SELECT_PROD' lit='9906719'/>"; //Debe seleccionar como mínimo un producto
                }
            }else{
                var NPOLIZA = $('#NPOLIZA').val();
                if(objUtiles.estaVacio(NPOLIZA)){
                    seleccionOk = false;
                    errorMsg =  "- " + objJsMessages.jslit_campo_validador + " '" + $('#NPOLIZA').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".";
                }
            }
            
            //Nos iremos a generar y recuperar SPROCES y luego en el callback a la función de programación del job
            if(seleccionOk && !objUtiles.estaVacio(CEMPRES)  && !objUtiles.estaVacio(FEJECUCION) && (!objUtiles.estaVacio(FCARTERA) || !objUtiles.estaVacio(NMES)  &&  !objUtiles.estaVacio(NANYO)  ) ){
                
                var MODOCARTERA = "${__formdata.MODOCARTERA}";
                
                var url="axis_axisctr050.do?operation=recuperarsprocesajaxjson&CEMPRES="+CEMPRES+"&NMES="+NMES+"&NANYO="+NANYO+"&MODOCARTERA="+MODOCARTERA;
                //recuperacion del SPROCES por JSON-AJAX
                jQuery.ajax({
                    url: url,
                    dataType: 'json',
                    success: callMeBack_recuperarsprocesajaxjson, 
                    error: callMeBack_recuperarsprocesajaxjson_error 
                });
            }else{
               if(!seleccionOk){
                     alert(errorMsg);
                }else{     
                    
                    if(objUtiles.estaVacio(CEMPRES)){
                        objAlert.formateaMensaje(
                                        "- " + objJsMessages.jslit_campo_validador + " '" + $('#CEMPRES').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                    } 
                    
                    if(CARTERA_DIARIA==0 && objUtiles.estaVacio(NMES) ){
                        objAlert.formateaMensaje(
                                        "- " + objJsMessages.jslit_campo_validador + " '" + $('#NMES').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                    }
                    
                     if(CARTERA_DIARIA==0 && objUtiles.estaVacio(NANYO) ){
                        objAlert.formateaMensaje(
                                        "- " + objJsMessages.jslit_campo_validador + " '" + $('#NANYO').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                    }
    
                    if(CARTERA_DIARIA!=0 && objUtiles.estaVacio(FCARTERA)){
                        objAlert.formateaMensaje(
                                        "- " + objJsMessages.jslit_campo_validador + " '" + $('#FCARTERA').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                    }
                    
                    if(objUtiles.estaVacio(FEJECUCION)){
                        objAlert.formateaMensaje(
                                        "- " + objJsMessages.jslit_campo_validador + " '" + $('#FEJECUCION').attr('title') + "' : " + objJsMessages.jslit_campo_obligatorio + ".");
                    }                        
                
                    objAlert.muestraAlert();
                    objAlert.vaciaAlert();
                }
            }
        }
        
        function callMeBack_recuperarsprocesajaxjson(q) {
            //Recuperacion del SPROCES y, si ha ido bien, lanzamos la peticion de carteraprogramada
            //Bug 40702/230839 - 15/04/2016 - AMC
			//$('#productosSeleccionados').val("");
            
            if (q.JSON2.MENSAJES!=null && q.JSON2.MENSAJES.length>0) {
                var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
                for (var i=0;i<q.JSON2.MENSAJES.length;i++) {
                    var miMENSAJESitem=q.JSON2.MENSAJES[i];
                    errmsg=errmsg+"\n- "+miMENSAJESitem.OB_IAX_MENSAJES.TERROR;
                }
                alert(errmsg);
            }
            else {
                var NPROCESO=q.JSON2.PNPROCESO;
                
                //Cuando sea por poliza no enviaremos los productos sino la NPOLIZA!!
              //  var productosSeleccionados = $('#productosSeleccionados').val(); //validar selección de productos

               if (confirm ("<axis:alt f='axisctr050' c='PNPROCESO' lit='9906720'/>" + "\n<axis:alt f='axisctr050' c='PNPROCESO' lit='9000493'/> : "+NPROCESO)){
                    document.miForm.SPROCES.value=NPROCESO;
                    
                    objUtiles.ejecutarFormulario("axis_axisctr050.do", "carteraprogramada", document.miForm, "_self", objJsMessages.jslit_cargando);

                }
            }
        }
            
        function callMeBack_recuperarsprocesajaxjson_error() {
           // var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
           // alert(errmsg);
        }

        
        function f_but_imprimir() {
                  
                    var EsPrevi = objDom.getValorPorId("MODOCARTERA"); //${__formdata.MODOCARTERA};
                    var EsCartera = objDom.getValorPorId("NLISTADO1"); //${__formdata.NLISTADO1};
                    var EsRenovacio = objDom.getValorPorId("NLISTADO2");
                    var EsDiferits = objDom.getValorPorId("NLISTADO3");
                    var CEMPRESA = objDom.getValorPorId("CEMPRES");
                    var VCIDIOMA = objDom.getValorPorId("VCIDIOMA");
           
           
           
                    //var bbb = objDom.getValorPorId("VCEMPRES");
                    var CPROCES;
                    var CMES;
                    var CANYO;
                    var vCodiMap_1;
                    var vCodiMap_2;
                    var vCodiMap_3;
                    var vParametre;
                    var lanzo_primero = 0;
                    var lanzo_segundo = 0;
                    var lanzo_tercero = 0;
                 
                 
                 objDom.setValorPorId("CFICHERO", "");   
                 objDom.setValorPorId("CFICHERO2", "");
                 objDom.setValorPorId("CFICHERO3", "");
                 objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000254'/>");
                 
                 if(EsPrevi=='PREVI_CARTERA') 
                 {
                 CPROCES = objDom.getValorPorId("JGM_PROCES");
                 if (objUtiles.estaVacio(CPROCES)) {
                                                    alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='103224'/>");
                                                    EsCartera = 0;
                                                    EsRenovacio = 0;
                                                    EsDiferits = 0;
                                                    }
                 vCodiMap_1 = "320";
                 vCodiMap_2 = "323";
                 vCodiMap_3 = "327";
                 // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                 vParametre = CPROCES+ "|"+CEMPRESA;
                 }
                 else
{
                 CMES = objDom.getValorPorId("NMES2");
                 CANYO = objDom.getValorPorId("NANYO2");
                                  if(CMES<1 || CMES>12 ||(objUtiles.estaVacio(CANYO))) {
                                                    alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000147'/>");
                                                    EsCartera = 0;
                                                    EsRenovacio = 0;
                                                    EsDiferits = 0;
                                                    }
                 vCodiMap_1 = "324";
                 vCodiMap_2 = "325";  
                // vParametre = CEMPRESA + "|01/" + CMES +"/"+ CANYO; //CMES + "/" + CANYO;
                 if (CMES < 10)
                    CMES = '0'+CMES;
                    
                 vParametre = CEMPRESA + "|01" + CMES + CANYO;
                 }
                 

            if  (
                    (EsCartera==1) && (
                                         (   
                                          ((EsPrevi=="PREVI_CARTERA")&&(!objUtiles.estaVacio(CPROCES)))||
                                          (    (EsPrevi!="PREVI_CARTERA")&&(!objUtiles.estaVacio(CMES))&&(!objUtiles.estaVacio(CANYO))   ) 
                                          )
                                      )    
                )
                           {    lanzo_primero = 1; }    
                           
            /* ********************************************************************* */                           
            
            if  (
                    (EsRenovacio==1) && (
                                          (
                                           ((EsPrevi=="PREVI_CARTERA")&&(!objUtiles.estaVacio(CPROCES)))||
                                           (    (EsPrevi!="PREVI_CARTERA")&&(!objUtiles.estaVacio(CMES))&&(!objUtiles.estaVacio(CANYO))   ) 
                                          )
                                        )    
                )
                           {    lanzo_segundo = 1; }     
            /* ********************************************************************* */                           
            
            if  (    (EsDiferits==1) && (EsPrevi=="PREVI_CARTERA") && (!objUtiles.estaVacio(CPROCES))   )
                           {    lanzo_tercero = 1; }                              
                           
          /* ********************************************************************* */ 
          if (lanzo_primero==1)  {  
                                objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_1 + 
                                                            "&CPARAMETROS=" + vParametre
                                                , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);

                                 } 
          else {
                if (lanzo_segundo==1) 
                           {                           	
                                objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_2 + 
                                                            "&CPARAMETROS=" + vParametre
                                                , callbackAjaxGenerarResultado_map2, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                            } 
                else {
                      if (lanzo_tercero==1)     
                           {    
                            if (objUtiles.estaVacio(CEMPRESA) || CEMPRESA < 0) {
                                                    alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='110203'/>");
                                                    EsCartera = 0;
                                                    EsRenovacio = 0;
                                                    EsDiferits = 0;
                                                    }
                            else
                               {
                                    // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                                    vParametre = vParametre + "|"+ VCIDIOMA + "|" + CEMPRESA;
                                    
                                    //////////////////////////////
                                        objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_3 + 
                                                            "&CPARAMETROS=" + vParametre + "&CEMPRES=" + CEMPRESA + "&NPROCES=" + CPROCES
                                                , callbackAjaxGenerarResultado_map3, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                                }                
                            } 
                     }       
                }
        }
            /******************AJAX**************************************************************/
            
            function callbackAjaxGenerarResultado_map (ajaxResponseText) {
                    var EsPrevi = objDom.getValorPorId("MODOCARTERA"); //${__formdata.MODOCARTERA};
                    var EsCartera = objDom.getValorPorId("NLISTADO1"); //${__formdata.NLISTADO1};
                    var EsRenovacio = objDom.getValorPorId("NLISTADO2");
                    var EsDiferits = objDom.getValorPorId("NLISTADO3");
                    var CEMPRESA = objDom.getValorPorId("CEMPRES");
                    var VCIDIOMA = objDom.getValorPorId("VCIDIOMA");
                    //var bbb = objDom.getValorPorId("VCEMPRES");                    
                    var CPROCES;
                    var CMES;
                    var CANYO;
                    var vCodiMap_1;
                    var vCodiMap_2;
                    var vCodiMap_3;
                    var vParametre;
                    var lanzo_primero = 0;
                    var lanzo_segundo = 0;
                    var lanzo_tercero = 0;
                                     
                 objDom.setValorPorId("CFICHERO", "");   
                 objDom.setValorPorId("CFICHERO2", "");
                 objDom.setValorPorId("CFICHERO3", "");
                 objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000254'/>");
                 
                 if(EsPrevi=='PREVI_CARTERA') 
                 {
                 CPROCES = objDom.getValorPorId("JGM_PROCES");
                 vCodiMap_1 = "320";
                 vCodiMap_2 = "323";
                 vCodiMap_3 = "327";
                 // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                 vParametre = CPROCES+ "|"+CEMPRESA;
                 }
                 else
                 {
                 CMES = objDom.getValorPorId("NMES2");
                 CANYO = objDom.getValorPorId("NANYO2");
                 vCodiMap_1 = "324";
                 vCodiMap_2 = "325";  
                // vParametre = CEMPRESA + "|01/" + CMES +"/"+ CANYO; //CMES + "/" + CANYO;
                 if (CMES < 10)
                    CMES = '0'+CMES;
                    
                 vParametre = CEMPRESA + "|01" + CMES + CANYO;
                 }                   

                //alert(ajaxResponseText);
                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                //alert(fichero)                
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
//                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FICHERO")[0]) ? 
//                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FICHERO"), 0, 0) : "";
                      
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000620'/>");
                        document.miForm.CFICHERO.focus();
                    }else{
                        //Guardo sólo el nombre.ext, no la ruta pq sino pl peta
                        //JGM esto es por si NO QUIERO EL PATH
                        //var ficheroTmp = fichero.split("\\");
                        //if(ficheroTmp.length >0)
                        //    fichero = ficheroTmp[ficheroTmp.length-1];
                            
                        objDom.setValorPorId("CFICHERO", fichero);
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000254'/>");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(fichero,"javascript:f_imprimir_fitxer(document.getElementById('CFICHERO').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////
                         
                         }
                   }
      // Lanzo el 2do si hace falta
            if  (
                       
                    (EsRenovacio==1) && (
                                          (
                                           ((EsPrevi=="PREVI_CARTERA")&&(!objUtiles.estaVacio(CPROCES)))||
                                           (    (EsPrevi!="PREVI_CARTERA")&&(!objUtiles.estaVacio(CMES))&&(!objUtiles.estaVacio(CANYO))   ) 
                                          )
                                        )    
                )
                        
                            {   
                                objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_2 + 
                                                            "&CPARAMETROS=" + vParametre
                                                , callbackAjaxGenerarResultado_map2, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                            }  
            else 
     // Lanzo el 3ro si hace falta y no he lanzado el segundo
              {
                           if (    (EsDiferits==1) && (EsPrevi=="PREVI_CARTERA") && (!objUtiles.estaVacio(CPROCES))   )   
                           {    
                           // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                                if (objUtiles.estaVacio(CEMPRESA) || CEMPRESA < 0) {
                                                    alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='110203'/>");
                                                    EsCartera = 0;
                                                    EsRenovacio = 0;
                                                    EsDiferits = 0;
                                                    }
                                else
                                  {
                                    vParametre = vParametre + "|"+ VCIDIOMA + "|" + CEMPRESA;
                                    
                                    //////////////////////////////
                                        objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_3 + 
                                                            "&CPARAMETROS=" + vParametre + "&CEMPRES=" + CEMPRESA + "&NPROCES=" + CPROCES
                                                , callbackAjaxGenerarResultado_map3, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);

                                    }                                                
                            } 
                }            
    //////////////////                            
                
            }        
            /******************AJAX**************************************************************/
            
          function callbackAjaxGenerarResultado_map2 (ajaxResponseText) {
                    var EsPrevi = objDom.getValorPorId("MODOCARTERA"); //${__formdata.MODOCARTERA};
                    var EsCartera = objDom.getValorPorId("NLISTADO1"); //${__formdata.NLISTADO1};
                    var EsRenovacio = objDom.getValorPorId("NLISTADO2");
                    var EsDiferits = objDom.getValorPorId("NLISTADO3");
                    var CEMPRESA = objDom.getValorPorId("CEMPRES");
                    var VCIDIOMA = objDom.getValorPorId("VCIDIOMA");
                    //var bbb = objDom.getValorPorId("VCEMPRES");                    
                    var CPROCES;
                    var CMES;
                    var CANYO;
                    var vCodiMap_1;
                    var vCodiMap_2;
                    var vCodiMap_3;
                    var vParametre;
                    var lanzo_primero = 0;
                    var lanzo_segundo = 0;
                    var lanzo_tercero = 0;
                    
                //alert(ajaxResponseText);
                  if(EsPrevi=='PREVI_CARTERA') 
                    {
                        CPROCES = objDom.getValorPorId("JGM_PROCES");
                        vCodiMap_3 = "327";
                        // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                        vParametre = CPROCES;
                    }
                    
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) 
                {
                    var fichero2 = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                            
                    var resultado2 = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                      
                    if(objUtiles.utilEquals(fichero2, "-0.csv")){
                        alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000620'/>");
                        document.miForm.CFICHERO2.focus();
                    }else{
                            objDom.setValorPorId("CFICHERO2", fichero2);
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000254'/>");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(fichero2,"javascript:f_imprimir_fitxer(document.getElementById('CFICHERO2').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////                         
                         }
                }
     // Lanzo el 3ro si hace falta
                           if (    (EsDiferits==1) && (!objUtiles.estaVacio(CPROCES))   )   
                           {    
                                if (objUtiles.estaVacio(CEMPRESA) || CEMPRESA < 0)
                                {
                                                    alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='110203'/>");
                                                    EsCartera = 0;
                                                    EsRenovacio = 0;
                                                    EsDiferits = 0;
                                                    }
                           else
                                {
                                // para el map 3 es SPROCES|FECHA|IDIOMA|EMPRESA /*45756|20090601|2|1*/
                                vParametre = vParametre + "|"+ VCIDIOMA + "|" + CEMPRESA;
                                
                                //////////////////////////////
                                objAjax.invokeAsyncCGI("axis_axisctr050.do?CMAP=" + vCodiMap_3 + 
                                                            "&CPARAMETROS=" + vParametre + "&CEMPRES=" + CEMPRESA + "&NPROCES=" + CPROCES
                                                , callbackAjaxGenerarResultado_map3, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                                }                                                
                            } 
    /// ///////////// //
            }                

            /******************AJAX**************************************************************/
            
          function callbackAjaxGenerarResultado_map3 (ajaxResponseText) 
            {
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) 
                {
                    var fichero3 = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                            
                    var resultado3 = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    
                    var vdiferits = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VDIFERIDOS")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VDIFERIDOS"), 0, 0) : "-1";
                 
                 if (vdiferits == 0) {
                     alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='9001777'/>");
                                     }
                 else    
                   {
                    if(objUtiles.utilEquals(fichero3, "-0.csv"))
                    {
                        alert("<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000620'/>");
                        document.miForm.CFICHERO3.focus();
                    }else
                    {
                            objDom.setValorPorId("CFICHERO3", fichero3);
                        // AHORA LA LISTA /////

                    var tableM = document.getElementById("ReportsList");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");
                    
                    //objLista.borrarFilasDeLista ("ReportsList", "1", "<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000254'/>");
                    
                        objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(1);
                        newtd[0] = objLista.addTextoEnLista(fichero3,"javascript:f_imprimir_fitxer(document.getElementById('CFICHERO3').value)");

                        objLista.addNuevaFila(newtd, newtr, tbodyM);                                    
                        ///////////////////////                         
                     }
                }
            }  
        }

// ****************************************************************

    function f_imprimir_fitxer(pfitxer){
    objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
    }
               
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000205'/>|true</c:param>
    </c:import>       
    
    <form name="miForm" action="" method="POST">         
    
    <c:choose>
        <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
            <c:set var="cartera" value="9000699"></c:set>
            <c:set var="titulillo" value="9001579"></c:set>
        </c:when>
        <c:otherwise>
          <c:set var="cartera" value="103074"></c:set>
          <c:set var="titulillo" value="9001580"></c:set>
        </c:otherwise>
    </c:choose>
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f='axisctr050' c='MODOCARTERA' lit='${cartera}'/></b></c:param>     <%-- Previ Cartera / Cartera --%>
            <c:param name="formulario"> <b> <axis:alt f='axisctr050' c='MODOCARTERA' lit='${cartera}'/></b></c:param> <%-- Previ Cartera / Cartera --%>
            <c:param name="form">axisctr050</c:param>
        </c:import>
        
    
        <!--<input type="hidden" name="MODOCARTERA" id="MODOCARTERA" value="${__formdata.MODOCARTERA}"/>-->
        <input type="hidden" name="NMES_prog" id="NMES_prog" value="${__formdata.NMES_prog}"/>
        <input type="hidden" name="NANYO_prog" id="NANYO_prog" value="${__formdata.NANYO_prog}"/>
        <input type="hidden" name="VCIDIOMA" id="VCIDIOMA" value="${__formdata.VCIDIOMA}"/>
        <input type="hidden" name="VCEMPRES" id="VCEMPRES" value="${__formdata.VCEMPRES}"/>
        <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" name="SPROCAR" id="SPROCAR" value="${__formdata.SPROCAR}"/>
        <input type="hidden" name="CARTERA_DIARIA" id="CARTERA_DIARIA" value="${__formdata.CARTERA_DIARIA}"/>
        <input type="hidden" name="CARTERA_PROGRAMADA" id="CARTERA_PROGRAMADA" value="${__formdata.CARTERA_PROGRAMADA}"/>
        <input type="hidden" name="VDIFERIDOS" id="VDIFERIDOS" value="${__formdata.VDIFERIDOS}"/>
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="productosSeleccionados" name="productosSeleccionados" value="${__formdata.productosSeleccionados}"/>
        <input type="hidden" name="SHOW_RADIO_PROD" id="SHOW_RADIO_PROD" value="${__formdata.SHOW_RADIO_PROD}"/>
        
        <c:if test="${fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1  && !empty __formdata.LSTVALORES.LSTEMPRESAS}">
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.LSTVALORES.LSTEMPRESAS[0].CEMPRES}" />
        </c:if>
       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><b><axis:alt f='axisctr050' c='MODOCARTERA' lit='${titulillo}'/> :</b>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                    </tr>   
                               
                                    <tr>
                                        <td class="titulocaja" >
                                            <div id="div_RADIO_PROD" style="float:left;">
                                                <input  value="1" type="RADIO" id="RADIO" name="RADIO" <c:if test="${__formdata.RADIO == 1}"> checked </c:if> onclick="f_actualitzarCheck(this.value);"/>
                                                <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9001581'/></b>
                                            </div>
                                            <div style="float:left;">
                                                <input  value="2" type="RADIO" id="RADIO" name="RADIO" <c:if test="${__formdata.RADIO == 2}"> checked </c:if> onclick="f_actualitzarCheck(this.value);"/>
                                                <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9001582'/></b> 
                                            </div>
                                        </td>                                        
                                    </tr>
                                    <tr  id="proc_1">
                                        <td>
                                        <table>
                                        <c:if test="${__formdata.RADIO == 1}">
                                            <tr>
                                                <th style="width:26%;height:0px"></th>
                                                <th style="width:26%;height:0px"></th>
                                                <th style="width:26%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <!--<th style="width:8%;height:0px"></th>-->
                                            </tr>
                                            <tr >
                                            
                                                <axis:visible f="axisctr050" c="CEMPRES" >
                                                <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='101619'/></b>
                                                </td>
                                                </c:if>
                                                </axis:visible>
                                                <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='100784'/></b>
                                                </td>
                                                <%-- PRODUCTO
                                                <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='100829'/></b>
                                                </td>      --%>                                       
                                            </tr>
                                       
                                             <tr>  
                                               
                                                    <axis:visible f="axisctr050" c="CEMPRES">
                                                     <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                     <td class="campocaja">
                                                            <select name = "CEMPRES" id ="CEMPRES" size="1" onchange="f_actualitzar();" 
                                                                title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='101619'/>"
                                                                class="campowidthselect campo campotexto" obligatorio="true">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='MODOCARTERA' lit='108341'/> - </option> 
                                                                <c:forEach items="${__formdata.LSTVALORES.LSTEMPRESAS}" var="emp">
                                                                    <option value = "${emp.CEMPRES}" <c:if test="${emp.CEMPRES  == __formdata.CEMPRES}">selected</c:if>>${emp.TEMPRES}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     </c:if>
                                                    </axis:visible>  
                                                
                                                 <td class="campocaja">
                                                        <select name = "CRAMO" id ="CRAMO" onchange="f_actualitzarRamo();"
                                                            title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='100784'/>"
                                                            class="campowidthselect campo campotexto"
                                                            <c:if test="${__formdata.RADIO == 2}">
                                                                obligatorio="true"
                                                            </c:if>
                                                            >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='MODOCARTERA' lit='108341'/> - </option> 
                                                          <%--  <c:if test="${!empty __formdata.CEMPRES || fn:length(__formdata.LSTVALORES.LSTEMPRESAS) == 1}">--%>
                                                            <c:forEach items="${__formdata.LSTVALORES.LSTRAMOS}" var="ram">
                                                                <option value = "${ram.CRAMO}" <c:if test="${ram.CRAMO  == __formdata.CRAMO}">selected</c:if>>${ram.TRAMO}</option>
                                                            </c:forEach>
                                                          <%--  </c:if>--%>
                                                        </select>                                                  
                                                 </td>
                                                <%-- PRODUCTO
                                                 <td class="campocaja" colspan="2" >
                                                        <select name = "SPRODUC" id ="SPRODUC" onchange="f_actualitzar();"
                                                            title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='100829'/>"
                                                            class="campowidthselect campo campotexto"
                                                            <c:if test="${__formdata.RADIO == 2}">
                                                                obligatorio="true"
                                                            </c:if>
                                                            >&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='MODOCARTERA' lit='108341'/> - </option> 
                                                            <c:forEach items="${__formdata.LSTVALORES.LSTPRODUCTOS}" var="prod">
                                                                <option value = "${prod.SPRODUC}" <c:if test="${prod.SPRODUC  == __formdata.SPRODUC}">selected</c:if>>${prod.TTITULO}</option>
                                                            </c:forEach>
                                                        </select>
                                                </td>     --%>                                             
                                            </tr>
                                            
                                            <tr>
                                                 <c:if test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                                    <td colspan="2" class="campocaja">
                                                     <input type= "checkbox" id="NRENOVA" name="NRENOVA" onclick="f_onclickCheckbox(this)"  <c:if test="${__formdata.NRENOVA == 1}"> checked</c:if>  value="${__formdata.NRENOVA}" /> 
                                                     <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='105677'/></b> 
                                                    </td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                            <td colspan="2" class="campocaja">
                                               <!-- DisplayTag productes -->
                                                <c:set var="title0">
                                                   <axis:alt f='axisctr050' c='MODOCARTERA' lit='1000307'/>
                                                </c:set>
                                                <c:set var="title1">
                                                   <axis:alt f='axisctr050' c='FCARPRO' lit='109716'/>
                                                </c:set>
                                                
                                                <div id="dt_productos" class="displayspace">
                                                  <%int contador = 0;%>
                                                    <display:table name="${__formdata.LSTPRODCARTERA}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_${pantalla}.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                                            <div class="dspIcons">
                                                            <input <c:if test="${miListaIdProductes.MARCAT == 1}">checked</c:if> 
                                                            onclick="f_seleccionarProd(  ((this.checked)?1:0)    ,'${miListaIdProductes['SPRODUC']}');"
                                                                 type="checkbox" name="checkProducto_<%=contador%>" id="checkProducto_<%=contador%>"/></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdProductes['TTITULO']}</div>
                                                            <input type="hidden" id="SPRODUC_<%=contador%>" name="SPRODUC_<%=contador%>" value="${miListaIdProductes['SPRODUC']}"/>
                                                        </display:column>
                                                        
                                                        <axis:visible f="axisctr050" c="FCARPRO">
                                                            <c:if test="${__formdata.MODOCARTERA != 'PREVI_CARTERA'}">
                                                                <display:column title="${title1}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                                                    <div class="dspText"><fmt:formatDate value="${miListaIdProductes['FCARPRO']}" pattern="dd/MM/yyyy"/></div>
                                                                </display:column>
                                                            </c:if>
                                                        </axis:visible>
                                                        <%contador++;%>
                                                    </display:table>
                                                </div>
                                            </td>
                                            <td colspan="1" class="campocaja">
                                            
                                           
                                            
                                                        <table>
                                                            <tr>
                                                                <th style="width:70%;height:0px"></th>
                                                                <th style="width:30%;height:0px"></th>
                                                            </tr>
                                                            <tr id="title_carteradiaria_sup">
                                                                <td id="nmes_title_td" class="titulocaja">
                                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9000495'/></b> <%-- Mes--%>
                                                                </td>
                                                                <td id="nanyo_title_td" class="titulocaja">
                                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='101606'/></b> <%-- Any --%>
                                                                </td>                                                                
                                                            </tr>
                                                            <tr id="fields_carteradiaria_sup">
                                                                <td id="nmes_td" class="campocaja">
                                                                    <select name = "NMES" id ="NMES" onchange="f_get_obteniranys();"
                                                                        title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000495'/>"
                                                                        class="campowidthselect campo campotexto" obligatorio="true">&nbsp;
                                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='MODOCARTERA' lit='108341'/> - </option> 
                                                                        <c:forEach items="${__formdata.LSTMESESCARTERA}" var="mes">
                                                                            <option value = "${mes.NMES}" <c:if test="${mes.NMES  == __formdata.NMES}">selected</c:if>>${mes.TMES}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <axis:ocultar f="axisctr050" c="NANYO" dejarHueco="false">
                                                                     <td id="nanyo_td" class="campocaja">
                                                                        <input type="text" class="campowidthinput campo campotexto" style="width:95%" size="15" value="${__formdata.NANYO}" name="NANYO" id="NANYO"
                                                                         title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='101606'/>" obligatorio="true"/>
                                                                     </td>
                                                                </axis:ocultar>                                                                
                                                            </tr>
                                                            
                                                            
                                                            <tr>
                                                                <td class="campocaja" align="left">
                                                                    <input type="button" class="boton" id="but_1000576" onclick="f_but_1000576()" value="<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000576'/>"/>
                                                                </td> 
                                                            </tr>
                                                            
                                                            <tr id="title_carteradiaria_inf">
                                                                <td id="fcartera_title_td" style="visibility: hidden" class="titulocaja">
                                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9906639'/></b> <%-- Fecha de cartera --%>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr id="fields_carteradiaria_inf">
                                                                <td class="campocaja">
                                                                    <input type="text" name="FCARTERA" id="FCARTERA" size="15" 
                                                                    class="campo campotexto" style="width:70%;visibility: hidden"
                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARTERA}"/>" 
                                                                    title="<axis:alt f='axisctr050' c='FCARTERA' lit='9906639'/>" alt="<axis:alt f='axisctr050' c='FCARTERA' lit='9906639'/>"
                                                                    <axis:atr f="axisctr050" c="FCARTERA" a="formato=fecha"/> />
                                                                    <a style="vertical-align:middle;">
                                                                        <img id="icon_FCARTERA" alt="<axis:alt f="axisctr050" c="FCARTERA" lit="9906639"/>" style="visibility: hidden"
                                                                        title="<axis:alt f="axisctr050" c="FCARTERA" lit="9906639" />" src="images/calendar.gif"/>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                            </td>
                                            <td>
                                                <table>
                                                        <tr>
                                                                <th style="width:100%;height:0px"></th>
                                                        </tr>
                                                        <tr>
                                                            <td id="fejecucion_title_td" style="visibility: hidden" class="titulocaja">
                                                                <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9001207'/></b> <%-- Fecha de ejecución --%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="campocaja">
                                                                <input type="text" name="FEJECUCION" id="FEJECUCION" size="15" 
                                                                class="campo campotexto" style="width:60%;visibility: hidden"
                                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEJECUCION}"/>" 
                                                                title="<axis:alt f='axisctr050' c='FEJECUCION' lit='9001207'/>" alt="<axis:alt f='axisctr050' c='FEJECUCION' lit='9001207'/>"
                                                                <axis:atr f="axisctr050" c="FEJECUCION" a="formato=fecha"/> />
                                                                <a style="vertical-align:middle;">
                                                                    <img id="icon_FEJECUCION" alt="<axis:alt f="axisctr050" c="FEJECUCION" lit="9001207"/>" style="visibility: hidden"
                                                                    title="<axis:alt f="axisctr050" c="FEJECUCION" lit="9001207" />" src="images/calendar.gif"/>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                             <td class="campocaja" align="left">
                                                                <input type="button" style="visibility: hidden" class="boton" id="but_9001534" onclick="f_but_9001534()" value="<axis:alt f='axisctr050' c='MODOCARTERA' lit='9001534'/>"/>
                                                            </td>
                                                        </tr>
                                                </table>
                                            </td>
                                            
                                            
                                                <tr>
                                                <td>
                                                <input type="button" onclick="f_seleccionar_todos(true);actualizar_campos();" class="boton" value="<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000756'/>"/>
                                                <input type="button" onclick="f_seleccionar_todos(false);actualizar_campos();" class="boton" value="<axis:alt f='axisctr050' c='MODOCARTERA' lit='9000757'/>"/>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <!--<td class="campocaja" align="center">
                                                 <input type="button" class="boton" id="but_1000576" onclick="f_but_1000576()" value="<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000576'/>"/>
                                                </td>  -->
                                                </tr>                                     
                                            </tr>
                                         </c:if>
                                        </table>
                                        </td>
                                        </tr>
                                        

                                    <tr>
                                         <td>
                                        <table  id="proc_2">
                                        <c:if test="${__formdata.RADIO == 2}">
                                            <tr>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                            </tr>
                                            <tr>
                                                <axis:visible f="axisctr050" c="CEMPRES" >
                                                <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='101619'/></b>
                                                </td>
                                                </c:if>
                                                </axis:visible>                                            
                                                <td class="titulocaja">
                                                        <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='100836'/></b> <%-- Pòlissa --%>
                                                </td>
                                            <axis:ocultar f="axisctr050" c="NCERTIF" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr050" c="NCERTIF" lit="101300"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                                <c:if test="${empty __formdata.CARTERA_DIARIA || __formdata.CARTERA_DIARIA == 0}">
                                                    <td class="titulocaja">
                                                        <table>
                                                            <td style="width:40%"><b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9000495'/></b></td> <%-- Mes --%>
                                                            <td style="width:20%"><b><axis:alt f='axisctr050' c='MODOCARTERA' lit='101606'/></b></td> <%-- Any --%>
                                                        </table>
                                                    </td>
                                                 </c:if>
                                                 <c:if test="${!empty __formdata.CARTERA_DIARIA && __formdata.CARTERA_DIARIA == 1}">
                                                     <td class="titulocaja">
                                                        <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9906639'/></b>
                                                     </td>
                                                 </c:if>
                                                 
                                                 <c:if test="${!empty __formdata.CARTERA_PROGRAMADA && __formdata.CARTERA_PROGRAMADA == 1}">
                                                     <td class="titulocaja">
                                                        <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9001207'/></b>
                                                     </td>
                                                 </c:if>
                                            </tr>
                                            <tr>
                                              <axis:visible f="axisctr050" c="CEMPRES">
                                                     <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                     <td class="campocaja">
                                                            <select name = "CEMPRES" id ="CEMPRES" size="1" 
                                                                title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='101619'/>"
                                                                class="campowidthselect campo campotexto"  obligatorio="true">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='MODOCARTERA' lit='108341'/> - </option> 
                                                                <c:forEach items="${__formdata.LSTVALORES.LSTEMPRESAS}" var="emp">
                                                                    <option value = "${emp.CEMPRES}" <c:if test="${emp.CEMPRES  == __formdata.CEMPRES}">selected</c:if>>${emp.TEMPRES}</option>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                     </c:if>
                                                    </axis:visible>                                            
                                            
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" onchange="f_actualitzarCheck('${__formdata.RADIO}');"  size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                                    title="<axis:alt f='axisctr050' c='NPOLIZA' lit='100836'/>"  obligatorio="true"/>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF"
                                                    title="<axis:alt f='axisctr050' c='NCERTIF' lit='101096'/>"/>
                                                </td>

                                                <c:if test="${empty __formdata.CARTERA_DIARIA || __formdata.CARTERA_DIARIA == 0}">
                                                        <td class="campocaja">
                                                            <table>
                                                            <td style="width:40%" >
                                                                <select name = "NMES" id ="NMES" onchange="f_get_obteniranys();" obligatorio="true"
                                                                    title="<axis:alt f='axisctr050' c='NMES' lit='9000495'/>"
                                                                    class="campowidthselect campo campotexto" >&nbsp;
                                                                <%--    <c:if test="${empty __formdata.LSTMESESCARTERA}">--%>
                                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='NMES' lit='108341'/> - </option> 
                                                                 <%--   </c:if>--%>
                                                                    <c:forEach items="${__formdata.LSTMESESCARTERA}" var="mes">
                                                                        <option value = "${mes.NMES}" <c:if test="${mes.NMES  == __formdata.NMES}">selected</c:if>>${mes.TMES}</option>
                                                                    </c:forEach>
                                                                </select>        
                                                            </td>
                                                            <td style="width:20%">
                                                                <axis:ocultar f="axisctr050" c="NANYO" dejarHueco="false">
                                                                            <input type="text" class="campowidthinput campo campotexto"  size="15" value="${__formdata.NANYO}" name="NANYO" id="NANYO"
                                                                              obligatorio="true" title="<axis:alt f='axisctr050' c='NANYO' lit='101606'/>"/> 
                                                                </axis:ocultar>
                                                         </td>
                                                    
                                                        
                                                        </table>
                                                </c:if>
                                                <c:if test="${!empty __formdata.CARTERA_DIARIA && __formdata.CARTERA_DIARIA == 1}">
                                                    <td class="campocaja">
                                                        <input type="text" name="FCARTERA" id="FCARTERA" size="15" 
                                                                class="campo campotexto" style="width:70%;"
                                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARTERA}"/>" 
                                                                title="<axis:alt f='axisctr050' c='FCARTERA' lit='9906639'/>" alt="<axis:alt f='axisctr050' c='FCARTERA' lit='9906639'/>"
                                                                <axis:atr f="axisctr050" c="FCARTERA" a="formato=fecha"/> />
                                                                <a style="vertical-align:middle;">
                                                                    <img id="icon_FCARTERA" alt="<axis:alt f="axisctr050" c="FCARTERA" lit="9906639"/>"
                                                                    title="<axis:alt f="axisctr050" c="FCARTERA" lit="9906639" />" src="images/calendar.gif"/>
                                                                </a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${!empty __formdata.CARTERA_PROGRAMADA && __formdata.CARTERA_PROGRAMADA == 1}">
                                                    <td class="campocaja">
                                                        <input type="text" name="FEJECUCION" id="FEJECUCION" size="15" 
                                                                class="campo campotexto" style="width:70%;"
                                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEJECUCION}"/>" 
                                                                title="<axis:alt f='axisctr050' c='FEJECUCION' lit='9001207'/>" alt="<axis:alt f='axisctr050' c='FCARTERA' lit='9001207'/>"
                                                                <axis:atr f="axisctr050" c="FEJECUCION" a="formato=fecha"/> />
                                                                <a style="vertical-align:middle;">
                                                                    <img id="icon_FEJECUCION" alt="<axis:alt f="axisctr050" c="FEJECUCION" lit="9001207"/>"
                                                                    title="<axis:alt f="axisctr050" c="FEJECUCION" lit="9001207" />" src="images/calendar.gif"/>
                                                                </a>
                                                    </td>
                                                </c:if>
                                                </tr>
                                                
                                                <%-- Inici BUG 28821/172422 - RCL - 10/04/2014 --%>
                                                <c:if test="${__formdata.SHOW_MSG_FCARPRO == 'true'}">
                                                <tr>
                                                    <td colspan="5">
                                                        <div style="color:red"><b><axis:alt f='axisctr050' c='MSGFCARPRO' lit='9906711'/></b></div>
                                                    </td>
                                                </tr>
                                                </c:if>
                                                <%-- Fi BUG 28821/172422 - RCL - 10/04/2014 --%>
                                                <tr>
                                                    <c:if test="${!empty __formdata.LSTVALORES.LSTEMPRESAS && fn:length(__formdata.LSTVALORES.LSTEMPRESAS) > 1}">
                                                        <td></td>
                                                    </c:if>
                                                    <td></td>
                                                    <td></td>
                                                    <td class="campocaja" align="center">
                                                        <input type="button" class="boton" id="but_1000576" onclick="f_but_1000576()" value="<axis:alt f='axisctr050' c='but_1000576' lit='1000576'/>"/>
                                                    </td>  
                                                    <c:if test="${!empty __formdata.CARTERA_PROGRAMADA && __formdata.CARTERA_PROGRAMADA == 1}">
                                                        <td class="campocaja" align="center">
                                                            <input type="button" class="boton" id="but_9001534" onclick="f_but_9001534()" value="<axis:alt f='axisctr050' c='but_9001534' lit='9001534'/>"/>
                                                        </td>
                                                    </c:if>
                                                    <!--<c:if test="${!empty __formdata.CARTERA_PROGRAMADA && __formdata.CARTERA_PROGRAMADA == 1}">
                                                        <td></td>
                                                    </c:if>-->
                                                </tr>                                                    
                                            </c:if>                                           
                                        </table>
                                        </td>
                                    </tr>
                                    
                                </table>
                              
                            </td>
                        </tr>
         </table>
                    
                    
                </td>
            </tr>
            <%--<c:if test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}"> --%>
        	<%-- <c:if test="${2 == 1}"> --%>
            <tr>
                <td>
                <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9000702'/></b>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <!-- Área 1 -->
                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:8%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>

                                    </tr>
                                    <tr>
                                      <c:choose>
                                           <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                             <td class="titulocaja">
                                                   <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='1000576'/></b>
                                             </td>
                                             <td></td>
                                           </c:when>
                                           
                                           <c:otherwise>
                                                <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='9000495'/></b> <%-- Mes --%>
                                                  </td>
                                                 <td class="titulocaja">
                                                    <b><axis:alt f='axisctr050' c='MODOCARTERA' lit='101606'/></b> <%-- Any --%>
                                                </td>     
                                           </c:otherwise>
                                       </c:choose> 

                                                <td class="titulocaja">
                                                    <input type="checkbox" value="${__formdata.NLISTADO1}" <c:if test = "${__formdata.NLISTADO1 == 1}"> checked </c:if> name="NLISTADO1" id="NLISTADO1" onclick="f_onclickCheckbox(this)" />                                     
                                                    <b>
                                                       <c:choose>
                                                            <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                                               <axis:alt f='axisctr050' c='MODOCARTERA' lit='9000703'/>
                                                            </c:when>
                                                        <c:otherwise>                                                               
                                                                <axis:alt f='axisctr050' c='MODOCARTERA' lit='9001539'/>                                                            
                                                        </c:otherwise>   
                                                        </c:choose> 
                                                    </b>
                                                </td> 
                                    </tr>
                                    <tr>
                                        <c:choose>
                                           <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.JGM_PROCES}" name="JGM_PROCES" id="JGM_PROCES"
                                                     title="<axis:alt f='axisctr050' c='JGM_PROCES' lit='1000576'/>"/>                                     
                                                </td>
                                                <td></td>
                                           </c:when>  
                                           <c:otherwise>
                                                 <td class="campocaja">
                                                    <select name="NMES2" id="NMES2"
                                                        title="<axis:alt f='axisctr050' c='NMES2' lit='9000495'/>"
                                                        class="campowidthselect campo campotexto" obligatorio="false">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f='axisctr050' c='NMES2' lit='108341'/> - </option> 
                                                        <c:forEach items="${__formdata.LSTMESESCARTERA2}" var="mes2">
                                                            <option value = "${mes2.CATRIBU}" <c:if test="${mes2.CATRIBU  == __formdata.NMES2}">selected</c:if>>${mes2.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                                 </td>
                                                 <axis:ocultar f="axisctr050" c="NANYO2" dejarHueco="false">
                                                     <td class="campocaja">
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:95%" size="15" value="${__formdata.NANYO2}" name="NANYO2" id="NANYO2"
                                                             title="<axis:alt f='axisctr050' c='NANYO2' lit='101606'/>" obligatorio="false"/>
                                                     </td>
                                                </axis:ocultar>  
                                            </c:otherwise>                                           
                                         </c:choose>
                                         <td class="campocaja">
                                            <input type="checkbox"  value="${__formdata.NLISTADO2}" <c:if test = "${__formdata.NLISTADO2 == 1}"> checked </c:if> name="NLISTADO2" id="NLISTADO2" onclick="f_onclickCheckbox(this)" /> 
                                                <b>
                                                    <c:choose>
                                                        <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                                           <axis:alt f='axisctr050' c='NLISTADO2' lit='9000704'/>
                                                        </c:when>
                                                        <c:otherwise> 
                                                           <axis:alt f='axisctr050' c='NLISTADO2' lit='9001540'/>
                                                        </c:otherwise>   
                                                    </c:choose>
                                                </b>
                                        </td>                                                                                                     
                                    </tr>
                                    
                                    <tr>
                                    <td></td>
                                    <td></td>
                                     <%-- ---------------- --%>
                                    <axis:visible f="axisctr050" c="CK_DIFERITS" >
                                         <c:choose>
                                           <c:when test="${__formdata.MODOCARTERA == 'PREVI_CARTERA'}">
                                              <td class="titulocaja">
                                                    <input type="checkbox" value="${__formdata.NLISTADO3}" <c:if test = "${__formdata.NLISTADO3 == 1}"> checked </c:if> name="NLISTADO3" id="NLISTADO3" onclick="f_onclickCheckbox(this)" />                                     
                                                    <b>
                                                        <axis:alt f='axisctr050' c='NLISTADO3' lit='9001735'/>
                                                    </b>
                                                </td> 
                                           </c:when>
                                           </c:choose> 
                                    </axis:visible> 
                                                <td> </td>
                                                <td> </td>                                                
                                    <%-- ---------------- --%>
                                        <td class="campocaja" align="center">
                                                <input type="button" class="boton" id="but_imprimir" onclick="f_but_imprimir()" value="<axis:alt f='axisctr050' c='but_imprimir' lit='100001'/>"/>
                                        </td>                                                                       
                                    </tr>                                                
                                    <tr>
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.MODOCARTERA}" name="MODOCARTERA" id="MODOCARTERA"
                                                     title="<axis:alt f='axisctr050' c='MODOCARTERA' lit='1000574'/>"/>                                     
                                        </td>                                     
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO}" name="CFICHERO" id="CFICHERO"
                                                     title="<axis:alt f='axisctr050' c='CFICHERO' lit='1000574'/>"/>                                     
                                        </td> 
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO2}" name="CFICHERO2" id="CFICHERO2"
                                                     title="<axis:alt f='axisctr050' c='CFICHERO2' lit='1000574'/>"/>                                     
                                        </td>                                            
                                         <td class="campocaja">
                                                    <input type="hidden" readonly class="campowidthinput campo campotexto" size="15" value="${__formdata.CFICHERO3}" name="CFICHERO3" id="CFICHERO3"
                                                     title="<axis:alt f='axisctr050' c='CFICHERO3' lit='1000574'/>"/>                                     
                                        </td>                                            
                                        
                                    </tr>
                                    <%--
                                    <tr>
                                        <td> </td>
                                        <td> </td>
                                        <%-- ----------------------- --%>     
                                    
                                                <tr id="listaImpresion">
                                                    <td colspan="2">
                                                        <div class="separador">&nbsp;</div>     
                                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f='axisctr050' c='MODOCARTERA' lit='112247'/></div>
                                                        
                                                        <c:set var="title0"><axis:alt f='axisctr050' c='MODOCARTERA' lit='107913'/></c:set>  
                                                        <div class="displayspaceMaximo">
                                                            <display:table name="${sessionScope.reportsList}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                                 requestURI="axis_axisctr050.do?paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                    <div class="dspText">
                                                                        <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+FILE)">  <%-- +"&mimetype=csv" --%>
                                                                            ${reportsList.codigoPROVIS}
                                                                        </a>
                                                                    </div>
                                                                </display:column>  >                                                             
                                                            </display:table>    
                                                         </div>                                                         
                                                         <div class="separador">&nbsp; </div>
                                                    </td>
                                                </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                  <%--</c:if>--%>
                </td>
            </tr>
                
        </table>
                       <div class="separador">&nbsp;</div>                                       
                       <div class="separador">&nbsp;</div>     
                       <div class="separador">&nbsp;</div>
                       <div class="separador">&nbsp;</div>
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr050</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
      <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCARTERA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCARTERA", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>
</body>
</html>