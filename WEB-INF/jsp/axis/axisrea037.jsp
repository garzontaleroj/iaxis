<%/* Revision:# vlNFcIavxGaDQBcuDoPWRw== # */%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>

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
    <link rel="StyleSheet" href="styles/tree.css" type="text/css"></link>
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>

    <c:import url="../include/carga_framework_js.jsp" />    

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
    
        function f_tunnel_doc(d) {
            document.miForm.operation.value="tunnel_doc";
            document.miForm.fileAbsolutePath.value=q;
            document.miForm.submit();
        }    
                
        function f_but_cancelar() {
            var odatos_num_lineas=document.getElementById("datos_num_lineas");
            odatos_num_lineas.value="";
            var inputs=document.getElementsByTagName("input");
            var x="-1";
            for (var iinputs=0;iinputs<inputs.length;iinputs++) {
                if (inputs[iinputs].id!=null&&inputs[iinputs].id.indexOf("num_linea_")==0) {
                    x=inputs[iinputs].id.substring("num_linea_".length);
                    odatos_num_lineas.value=odatos_num_lineas.value+document.getElementById("datos_num_linea_"+x).value+"@";
                }
            }           
           
            objAjax.invokeAsyncCGI("axis_axisrea037.do?datos_num_lineas="+ odatos_num_lineas.value, callbackCancelar, 
                        "operation=cancelar", this, objJsMessages.jslit_cargando);
        }
        
        function callbackCancelar (ajaxResponseText) {
               objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea037", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            var CESTADO = $('#CESTADO').val();
            var NUMPROCES  = $('#NUMPROCES').val();
            
            if(objUtiles.estaVacio(CESTADO) && objUtiles.estaVacio(NUMPROCES)){
                alert("<axis:alt f="axisrea037" c="NUMPROCES" lit="9906576"/>");
            }else{        
                if (objValidador.validaEntrada()) {
                
                    //Si queremos deshacer desmarques enviamos los datos_num_lineas
                    
                        var odatos_num_lineas=document.getElementById("datos_num_lineas");
                        odatos_num_lineas.value="";
                        var inputs=document.getElementsByTagName("input");
                        var x="-1";
                        for (var iinputs=0;iinputs<inputs.length;iinputs++) {
                            if (inputs[iinputs].id!=null&&inputs[iinputs].id.indexOf("num_linea_")==0) {
                                x=inputs[iinputs].id.substring("num_linea_".length);
                                odatos_num_lineas.value=odatos_num_lineas.value+document.getElementById("datos_num_linea_"+x).value+"@";
                            }
                        }
                                
                    objUtiles.ejecutarFormulario("axis_axisrea037.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
        }

        function f_seleccionar(CEMPRES,CTRAMO,CCOMPANI,SCONTRA,NVERSIO,SPRODUC,FCIERRE,TMONEDA, SPAGREA) {
             var CESTADO = $('#CESTADO').val();
            var NPOLIZA = $('#NPOLIZA').val();
            var COMPANIA = $('#COMPANIA').val();
            var params = "";
            params = "&CEMPRES_SEL="+CEMPRES+"&CCOMPANI_SEL="+CCOMPANI+"&NVERSIO_SEL="+NVERSIO+"&SCONTRA_SEL="+SCONTRA+"&CTRAMO_SEL="+CTRAMO+"&SPRODUC_SEL="+SPRODUC+"&FCIERRE_SEL="+FCIERRE+"&CESTADO_SEL="+CESTADO+"&NPOLIZA_SEL="+NPOLIZA+"&TMONEDA_SEL="+TMONEDA+"&COMPANIA="+COMPANIA+"&SPAGREA="+SPAGREA;//+"&CESTADO_PANTALLA="+document.miForm.CESTADO.value;
            objUtiles.abrirModal("axisrea038","src","modal_axisrea038.do?operation=cargar"+params); 
           
        }
       
        function f_but_aceptar() {
            var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("selCta");            
            if (hayAlgunChecked) {
                var agentSplit = objUtiles.utilSplit(hayAlgunChecked, "/");
                var CEMPRES = agentSplit[0];
                var NVERSIO = agentSplit[1];
                if (!objUtiles.estaVacio(CEMPRES)) {
                    //parent.f_seleccionar(CEMPRES,CTRAMO,CCOMPANI,SCONTRA,NVERSIO,SPRODUC,FCIERRE);  //TODO: Determinar si o qué campos son obligatorios
                    }
            } else
                alert("<axis:alt f="axisrea037" c="LIST_AGENTE" lit="1000411"/>");
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla(); 
            revisarEstilos();
            document.getElementById("CEMPRESA").focus();

            var SPROCES = document.miForm.SPROCES.value;
            if (!objUtiles.estaVacio(SPROCES) ) {
                f_but_imprimir();
            }

			//Si Estado de cierre is null, seleccionamos PENDIENTE por defecto
       //     if(objUtiles.estaVacio($('#CESTADO option:selected').val()))
         //   {
           //     $('#CESTADO option[value="1"]').attr("selected","selected");
           // }
          //  $('#CESTADO option[value="<%=Integer.MIN_VALUE%>"]').remove();
            
            //BUG 23830/157563 - 05/11/2013 - RCL - Añadimos evento onchange a TODOS los combo's para cambiar el title
            $( "select" ).change(function () {
                var thisvalue = $(this).find("option:selected").text();
                $(this).prop("title", $.trim(thisvalue));
            });
            
        }


        /* *************************************** *************** ************************************* */
        /* ****************************** FUNCIONES AJAX IMPLEMENTACION ******************************** */
        /* ********************************************************************************************* */
        
        /* ************************* CAMBIA CONTRATO **************************** */
            function f_actualiza_version(){
                //  objValidador.validaEntrada();
               
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaVersion, 
                    "operation=ajax_actualiza_version&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaVersion(ajaxResponseText) {
                
                var versionCombo = document.miForm.NVERSIO;
                
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                        
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(versionCombo);
                             objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var NVERSIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0].childNodes[0].nodeValue : "");
                                var TCONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(NVERSIO, NVERSIO + ' - ' + TCONTRA, versionCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                        }
                       
                    }
                f_actualiza_tramos();
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            
            function f_actualiza_tramos(){
                //  objValidador.validaEntrada();
                
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaTramos, 
                    "operation=ajax_actualiza_tramos&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaTramos(ajaxResponseText) {
                 var tramoCombo = document.miForm.CTRAMO;
               
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                     
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(tramoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, tramoCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                        }
                    }
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", tramoCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
   

        /* ********************************** CAMBIA RAMO ************************************ */
        /* ******************************** CAMBIA PRODUCTO ********************************** */
            
        function f_actualiza_companias(thiss){
              var url="axis_axisrea037.do?operation=ajax_actualiza_companias&SPRODUC="+thiss;
              objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
              jQuery.ajax({
                url: url,
                dataType: 'json',
                success: callbackAjaxActualizaCompanias
              });
            }
            
             function callbackAjaxActualizaCompanias(r) {
                var COMPANIAS=r.JSON2.COMPANIAS;
                var currentValue = $('#COMPANIA').val();
                var oCOMPANIA=document.getElementById("COMPANIA");
                oCOMPANIA.options.length=0;
                var objOption=null;
                objOption=document.createElement("option");
                objOption.text="- <axis:alt f="axisrea037" c="SELECC" lit="1000348"/> -";
                objOption.value="<%= Integer.MIN_VALUE %>";
                oCOMPANIA.options[oCOMPANIA.options.length]=objOption;
    
                if (COMPANIAS!=null) {
                    for (var iCOMPANIAS=0;iCOMPANIAS<COMPANIAS.length;iCOMPANIAS++){
                        objOption=document.createElement("option");
                        objOption.text=COMPANIAS[iCOMPANIAS].TCOMPANI;
                        objOption.value=COMPANIAS[iCOMPANIAS].CCOMPANI;
                        
                        if(currentValue == COMPANIAS[iCOMPANIAS].CCOMPANI){
                            objOption.selected = true;
                        }
                        
                        oCOMPANIA.options[oCOMPANIA.options.length]=objOption;
                    }
                }
            
                objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
             }

            function f_actualiza_producto(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaProducto, 
                    "operation=ajax_actualiza_producto&CRAMO="+CRAMO, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaProducto(ajaxResponseText) {
                var productoCombo =  document.miForm.SPRODUC;
                objDom.borrarOpcionesDeCombo(productoCombo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
            try {
                    
               
                    var doc=objAjax.domParse(ajaxResponseText);
                              
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                  
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            objDom.borrarOpcionesDeCombo(productoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, 0);
                         
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                          
                                var SPRODUC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("SPRODUC")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("SPRODUC")[0].childNodes[0].nodeValue : "");
                                var TTITULO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(SPRODUC, TTITULO, productoCombo, i+1);
                              
                            }
                            
                        }
                        //f_actualiza_actividad();
                        
                    }else{
                     
                            objDom.borrarOpcionesDeCombo (productoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
                           //  f_actualiza_actividad();
                    }
                        
                        
                 
                    
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            /* ************************* CAMBIA ACTIVIDAD *************************** */
            
            function f_actualiza_actividad(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                SPRODUC = document.miForm.SPRODUC.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaActividad, 
                    "operation=ajax_actualiza_actividad&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaActividad(ajaxResponseText) {
                //alert(ajaxResponseText);
                //alert("Antes de actualizar actividad");
                var actividadCombo =  document.miForm.CACTIVI;
                
                objDom.borrarOpcionesDeCombo(actividadCombo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                              
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                  
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            objDom.borrarOpcionesDeCombo(actividadCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, 0);
                         
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                          
                                var CACTIVI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0].childNodes[0].nodeValue : "");
                                var TTITULO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(CACTIVI, TTITULO, actividadCombo, i+1);
                              
                            }
                        }else{
                     
                            objDom.borrarOpcionesDeCombo (actividadCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                        }
                        
                        f_actualiza_garantia();
                    }else{
                        f_actualiza_garantia();
                    }
                    
               //alert("Vuelta");     
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            
                        /* ************************* CAMBIA ACTIVIDAD *************************** */
            
            function f_actualiza_ramo(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CEMPRESA = document.miForm.CEMPRESA.value;
                objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizaRamo, 
                    "operation=ajax_actualiza_ramo&CEMPRESA="+CEMPRESA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaRamo(ajaxResponseText) {
                //alert(ajaxResponseText);
                //alert("Antes de actualizar actividad");
                var ramoCOMBO =  document.miForm.CRAMO;
                
                objDom.borrarOpcionesDeCombo(ramoCOMBO);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", ramoCOMBO, null);
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                              
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                  
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            objDom.borrarOpcionesDeCombo(ramoCOMBO);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", ramoCOMBO, 0);
                         
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                          
                                var CRAMO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CRAMO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CRAMO")[0].childNodes[0].nodeValue : "");
                                var TRAMO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TRAMO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TRAMO")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(CRAMO, TRAMO, ramoCOMBO, i+1);
                              
                            }
                        }else{
                     
                            objDom.borrarOpcionesDeCombo (ramoCOMBO);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", ramoCOMBO, null);
                        }
                        
                       
                    }else{
                       
                    }
                    
               //alert("Vuelta");     
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", ramoCOMBO, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            
            
            /* ******************************** *************************************** *********************************** */
            /* ****************************************** PANTALLA MODAL ************************************************** */
            /* ************************************************************************************************************ */
            
            function f_aceptar_axisrea038(CAGENTE, TAGENTE){
                objUtiles.cerrarModal("axisrea038");
                //f_but_buscar();
                objUtiles.ejecutarFormulario ("axis_axisrea037.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    
                
            }
            
            
            
            function f_cerrar_axisrea038(){
                objUtiles.cerrarModal("axisrea038");
            }


            /* ************************************************************************************************************* */
            /* **************************************** ACT IMPORTES ******************************************************* */
            /* ************************************************************************************************************* */
            
            /*function actualizar_importes(total_filas, i)
            {
               alert("Antes de actualizar importes");
               var suma_total = 0;
               var seleccionado = document.getElementById("num_linea_"+i).checked ? "1" : "0";
               if(seleccionado=="0"){
                  objDom.setValorPorId("CAMPO_DESTINO_"+i, "");  
               }else{
                  var valor = document.getElementById("CAMPO_ORIGEN_"+i);
                  objDom.setValorPorId("CAMPO_DESTINO_"+i, valor);  
               }
               
               objAjax.invokeAsyncCGI("axis_axisrea037.do", callbackAjaxActualizarImportes, 
                    "operation=ajax_actualizar_importes&linea="+i+"&seleccionado="+seleccionado, this, objJsMessages.jslit_actualizando_registro);          
               
               
               document.miForm.SALDO_TOTAL.value=suma_total;

            }*/
            
            
            function actualizar_importes(total_filas, i)
            {
                    var CESTADO = $('#CESTADO').val();
                    var NUMPROCES  = $('#NUMPROCES').val();
                    
                    if(objUtiles.estaVacio(CESTADO) && objUtiles.estaVacio(NUMPROCES)){
                        alert("<axis:alt f="axisrea037" c="NUMPROCES" lit="9906576"/>");
                    }else{
            
                           var elementos = "";
            
                           for(var j=0;j<total_filas;j++){
                                //alert("document.miForm.num_linea_"+j+".checked");
                                var valor = eval("document.miForm.num_linea_"+j+".checked");
                                //alert("VALOR TRUE OR FALSE"+valor);
                                var obtenido = valor?"1":"0";
                                //alert("valor: "+obtenido+" de fila: "+j);
                                if(obtenido=='1'){
                                   elementos = elementos+j+"x";
                                }
                           }
                          //alert("Suma: total: ************************************* :"+elementos);
                          objUtiles.ejecutarFormulario ("axis_axisrea037.do?CADENA_VALORES="+elementos, "recargar_pantalla", document.miForm, "_self", objJsMessages.jslit_cargando);    
                    }
           
            
            }
 
          function f_but_9001771(){
          
                if (objValidador.validaEntrada()) {
                        //Solo permitimos liquidar si estado de cierre es PENDIENTE
                        // y si la fecha de cierre está informada.
                        //La fecha de cierre es obligatoria por tener tasa de cambio!!
                        var FCIERRE = $('#FCIERRE').val();
                        if($('#CESTADO option:selected').val() == 1)
                        {
                              var COMPANIA = $('#COMPANIA option:selected').val();    
                              var CCORRED = $('#CCORRED option:selected').val();  
                              var CCOMPANI = $('#CCOMPANI option:selected').val();  
                              
                              
                                  <axis:visible c="VAL_LIQUIDAR" f="axisrea037">
                                  if(   !objUtiles.estaVacio(FCIERRE) && 
                                        ( ( !objUtiles.estaVacio(COMPANIA)  &&  !objUtiles.estaVacio(CCORRED)) || 
                                          ( !objUtiles.estaVacio(COMPANIA)  &&  !objUtiles.estaVacio(CCOMPANI)))) { 
                                  </axis:visible>
                                        //pasar como valor a datos_num_lineas una concadenacion de todos los datos_num_linea_*, donde num_linea_* esta checked
                                        var odatos_num_lineas=document.getElementById("datos_num_lineas");
                                        odatos_num_lineas.value="";
                                        var inputs=document.getElementsByTagName("input");
                                        var x="-1";
                                        for (var iinputs=0;iinputs<inputs.length;iinputs++) {
                                            if (inputs[iinputs].id!=null&&inputs[iinputs].id.indexOf("num_linea_")==0&&inputs[iinputs].checked) {
                                                x=inputs[iinputs].id.substring("num_linea_".length);
                                                odatos_num_lineas.value=odatos_num_lineas.value+document.getElementById("datos_num_linea_"+x).value+"@";
                                            }
                                        }
                                        
                                        if (odatos_num_lineas.value.length>0) {
                                            //Para el SPROCES, necesitamos el CEMPRES. Nos vale el CEMPRES del 1er de los posibles registros a tratar
                                            var odatos_num_lineas_value=document.getElementById("datos_num_lineas").value;
                                            var primeraLinea=odatos_num_lineas_value.split("@")[0];
                                            var CEMPRES=primeraLinea.split("|")[0];
                                            var url="axis_axisrea037.do?operation=recuperarsprocesajaxjson&CEMPRES="+escape(CEMPRES);
                                            //recuperacion del SPROCES por JSON-AJAX
                                            jQuery.ajax({
                                                url: url,
                                                dataType: 'json',
                                                success: callMeBack_recuperarsprocesajaxjson, 
                                                error: callMeBack_recuperarsprocesajaxjson_error 
                                            });
                                        }
                                        else {
                                            odatos_num_lineas.value="";
                                            alert("<axis:alt f="axisrea037" c="ERRORSINMARCAR" lit="9000505"/>");
                                        }
                                <axis:visible c="VAL_LIQUIDAR" f="axisrea037"> 
                                }else{
                                    alert("<axis:alt f="axisrea037" c="ERRORSINMARCAR" lit="9906305"/>");
                                }
                                </axis:visible>
                        }
                        else
                        {
                             alert("<axis:alt f="axisrea037" c="ERRORSINMARCAR" lit="9905982"/>");
                        }
                }//Fin validaEntrada
       
          }

            function callMeBack_recuperarsprocesajaxjson(q) {
                //Recuperacion del SPROCES y, si ha ido bien, lanzamos la peticion de liquidar
                //alert(JSON.stringify(q));
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
                    if (confirm ("<axis:alt c="CONFIRM_NPROCESO" f="axiscoa002" lit="9000493" />: "+NPROCESO+"\n<axis:alt c="EJECUTAR_NPROCESO" f="axiscoa002" lit="9000711" />")){
                        document.miForm.SPROCES.value=NPROCESO;
                        document.miForm.CLIQUIDAR.value = new Number(document.miForm.CLIQUIDAR.checked);
                        objUtiles.ejecutarFormulario("axis_axisrea037.do", "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        // bug 0023830
                        //f_but_imprimir();
                    }
                }
            }
            
            function callMeBack_recuperarsprocesajaxjson_error() {
                var errmsg="<axis:alt c="EJECUTAR_ERROR" f="axiscoa002" lit="108953" />";
                alert(errmsg);
            }

 
 
            
            function callbackAjaxActualizarImportes(ajaxResponseText) {
                //alert(ajaxResponseText);
                //alert("Antes de actualizar actividad");
                
                
                try {
            
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", ramoCOMBO, null);
                    //alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            function f_but_imprimir(){
                // bug 0023830
                // alert("Antes axisimprimir "+document.miForm.SPROCES.value);
                var vSPROCES = document.miForm.SPROCES.value;
				//INI -  EDBR - IAXIS5114 - 03/09/2019 - Se agregar alerta con instrucciones para exportar reporte y se comenta codigo de abrir modal axisimprimir
                var msg="<axis:alt c="IMPRMIR_LIQUIDACION" f="AXISREA037" lit="89907055" />";  
				alert(msg+vSPROCES);
                document.miForm.SPROCES.value = '';
                /*objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso&SPROCES=" + vSPROCES + "&CTIPO=LIQUIDAREA", 0, 0);*/
				//FIN -  EDBR - IAXIS5114 - 03/09/2019 - Se agregar alerta con instrucciones para exportar reporte y se comenta codigo de abrir modal axisimprimir
            }

			function f_but_100001() {
                  objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso&SPROCES=" + document.miForm.SPROCES_LIQ.value  + "&CTIPO=LIQUIDAREA", 0, 0);
            }

            function f_cerrar_axisimprimir() {
                // bug 0023830
                objUtiles.cerrarModal("axisimprimir");
            }
            
            function f_buscar(){
                var CESTADO = $('#CESTADO').val();
                
                if(!objUtiles.estaVacio(CESTADO)){
                    f_but_buscar();
                }else{
                    //Si seleccionamos la opcion --Seleccionar-- de CESTADO, mostraremos la lista vacía
                    objUtiles.ejecutarFormulario("axis_axisrea037.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
    </script>
  </head>

  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="axis_axisrea037.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisrea037" c="TITULO" lit="104907"/></c:param> <%-- Búsqueda Cuentas técnicas --%>
            <c:param name="formulario"><axis:alt f="axisrea037" c="TITULO" lit="104907"/></c:param> <%-- Búsqueda cuentas técnicas --%>
            <c:param name="form">axisrea037</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper007|<axis:alt f="axisrea037" c="TITULO_PANT" lit="9000714"/></c:param>
        </c:import>
        
         <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisrea037" c="TIT_038" lit="9001941" /></c:param>
                <c:param name="nid" value="axisrea038" />
           </c:import>

            <%-- bug 0023830 --%>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisrea037" c="cam_impressio_doc" lit="1000205" />|true</c:param>
            </c:import>   
            
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="SPROCES" value="${__formdata.SPROCES}"/>
        <input type="hidden" id="CESTADO_PANTALLA" name="CESTADO_PANTALLA" value=""/>
        <input type="hidden" name="fileAbsolutePath" value="-no guardarlo en formdata-"/>
        <input type="hidden" name="SPROCES_LIQ" value="<c:if test="${fn:length(__formdata.LSTCUENTAS) > 0 && !empty __formdata.LSTCUENTAS}">${__formdata.LSTCUENTAS[0].SPROCES}</c:if>"/>

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                        <th style="width:20%;height:0%;"/>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="EMPRESA" lit="101619"/></b>      <%-- Empresa --%>
                                        </td>
                                        <axis:ocultar f="axisrea037" c="COMPANIA">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="COMPANIA" lit="9901223"/></b>    <%-- Compania --%>
                                        </td>
                                        </axis:ocultar> 
                                        <td class="titulocaja">
                                             <b><axis:alt f="axisrea037" c="CRAMO" lit="100784"/></b>       <%-- Ramo --%>
                                        </td>   
                                        <td class="titulocaja">
                                             <b><axis:alt f="axisrea037" c="SPRODUC" lit="100829"/></b>     <%-- Producto --%>
                                        </td>
                                           <axis:ocultar f="axisrea037" c="CLIQUIDAR">
                                        <td class="titulocaja">
                                             <b><axis:alt f="axisrea037" c="CLIQUIDAR" lit="9905870"/></b>  <%-- CHECK LIQUIDAR POR COMPAÑIAS --%>
                                        </td> 
                                         </axis:ocultar> 
                                    </tr>

                                    <tr>
                                        <td class="campocaja">                                
                                            <select name="CEMPRESA" id="CEMPRESA" size="1" onchange="f_actualiza_ramo();" 
                                                    class="campowidthselect campo campotexto" style="width:90%;" 
                                                    title="<axis:alt f='axisrea037' c='CEMPRESA' lit='101619'/>">
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                                    <option value = "${element.CEMPRES}"
                                                    <c:if test="${__formdata.CEMPRESA == element.CEMPRES || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == -1}"> selected = "selected"</c:if>>
                                                        ${element.TEMPRES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        
                                        <axis:ocultar f="axisrea037" c="COMPANIA" dejarHueco="false">
                                        <td class="campocaja">
                                          <select name="COMPANIA" id="COMPANIA" 
                                                  class="campowidthselect campo campotexto" style="width:90%;" 
                                                  title="<axis:alt f='axisrea037' c='COMPANIA' lit='9901223'/>" onchange="f_but_buscar()" >
                                            <option value="<%= Integer.MIN_VALUE %>">- <axis:alt f="axisrea037" c="SELECC" lit="1000348"/> -</option>
                                            <c:forEach var="item" items="${__formdata.listaCompanias}">
                                              <option value="${item.CCOMPANI}" <c:if test="${__formdata.COMPANIA == item.CCOMPANI || fn:length(__formdata.listaCompanias) == 1}">selected</c:if>>${item.TCOMPANI}</option>
                                            </c:forEach>
                                          </select>
                                        </td>                                        
                                                          
                                      </axis:ocultar>
                                        <td class="campocaja">                                
                                            <select name="CRAMO" id="CRAMO" size="1" onchange="f_actualiza_producto(); "
                                                    class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> 
                                                    obligatorio="false" style="width:90%;" title="<axis:alt f='axisrea037' c='CRAMO' lit='100784'/>">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="ALT_CRAMO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaRamo}">
                                                    <option value = "${element.CRAMO}" 
                                                    <c:if test="${element.CRAMO == __formdata.CRAMO}"> selected </c:if> >
                                                     ${element.TRAMO} 
                                                    </option>
                                                </c:forEach>
                                            </select>  
                                        </td>
                                        <td class="campocaja">                                
                                            <select name="SPRODUC" id="SPRODUC" size="1" onchange="f_actualiza_companias( this.value)" 
                                                    class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if>  
                                                    obligatorio="false" style="width:90%;" title="<axis:alt f='axisrea037' c='SPRODUC' lit='100829'/>">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="ALT_SPRODUC_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaProducto}">
                                                    <option value = "${element.SPRODUC}" 
                                                    <c:if test="${element.SPRODUC == __formdata.SPRODUC}"> selected </c:if> >
                                                     ${element.TTITULO} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </td>
                                         <axis:ocultar f="axisrea037" c="CLIQUIDAR">
                                       <td class="campocaja"> 
                                            <input type="checkbox" id="CLIQUIDAR" name="CLIQUIDAR" 
                                                   <axis:atr f="axisrea037" c="CLIQUIDAR" a="modificable=true&obligatorio=false&isInputText=false"/> />
                                       </td>
                                        </axis:ocultar> 
                                    </tr>

                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="CCORRED" lit="9000752"/></b>     <%-- Tipo Agente --%>
                                        </td>
                                       
                                         <td class="titulocaja">
                                             <b><axis:alt f="axisrea037" c="CCOMPANI" lit="9903030"/></b>   <%-- Reaseguradora --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="FCIERRE" lit="9000490"/></b>     <%-- Fecha cierre --%>
                                        </td>
                                         <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="NPOLIZA" lit="100836"/></b>      <%-- Numero poliza --%>
                                        </td>
                                        <td class="titulocaja">
                                            &nbsp;
                                        </td>
                                        <%--
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrea037" c="CESTADO" lit="9000489"/></b> 
                                        </td>
                                        --%>
                                    </tr>

                                    <tr>
                                        <td class="campocaja">                              <%-- Tipo Agente --%>
                                            <select name="CCORRED" id="CCORRED" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:90%;" 
                                                    title="<axis:alt f='axisrea037' c='CCORRED' lit='9000752'/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPOAGENTE}">
                                                    <option value = "${element.CCOMPANI}"
                                                    <c:if test="${__formdata.CCORRED == element.CCOMPANI}"> selected = "selected"</c:if>>
                                                        ${element.TCOMPANI} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">                              <%-- Reaseguradora --%>                          
                                            <select name="CCOMPANI" id="CCOMPANI" size="1" 
                                                    class="campowidthselect campo campotexto" style="width:90%;" 
                                                    title="<axis:alt f='axisrea037' c='CCOMPANI' lit='9903030'/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTREASEGURADORAS}">
                                                    <option value = "${element.CCOMPANI}"
                                                    <c:if test="${__formdata.CCOMPANI == element.CCOMPANI || fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == -1}"> selected = "selected"</c:if>>
                                                        ${element.TCOMPANI} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        <td class="campocaja">                               <%-- Fecha cierre --%>
                                            <input type="text" name="FCIERRE" id="FCIERRE" size="15" 
                                                    class="campo campotexto" style="width:79%;"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCIERRE}"/>" 
                                                    title="<axis:alt f='axisrea037' c='FCIERRE' lit='9000490'/>" alt="<axis:alt f='axisrea037' c='FCIERRE' lit='9000490'/>"
                                                    <axis:atr f="axisrea037" c="FCIERRE" a="formato=fecha"/> />
                                            <a style="vertical-align:middle;">
                                                <img id="icon_FCIERRE" alt="<axis:alt f="axisrea037" c="FCIERRE" lit="9000490"/>" title="<axis:alt f="axisrea037" c="FCIERRE" lit="9000490" />" src="images/calendar.gif"/>
                                            </a>
                                        </td>
                                        
                                         <td class="campocaja">                                <%-- NPOLIZA --%>
                                            <input type="text" size="15" name="NPOLIZA" id="NPOLIZA"
                                                    class="campo campotexto" style="width:90%"
                                                    value="${__formdata.NPOLIZA}" 
                                                    title="<axis:alt f='axisrea037' c='NPOLIZA' lit='100836'/>" alt="<axis:alt f='axisrea037' c='NPOLIZA' lit='100836'/>"
                                                    <axis:atr f="axisrea037" c="NPOLIZA" a="modificable=true&formato=entero"/> />
                                        </td>
                                        <td class="campocaja">
                                            &nbsp;
                                        </td> 
                                        <%-- Estado Cierre --%>
                                        <%--
                                        <td class="campocaja">
                                            <select name = "CESTADO" id ="CESTADO" size="1" onchange="" class="campo campotexto" style="width:90%">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisrea037" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach items="${__formdata.lstEstados}" var="item">
                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        --%>
                                        
                                    </tr>

                                    <tr>
                                        <axis:visible f="axisrea037" c="SCONTRA">
                                        <td class="titulocaja" >                                <%--CONTRATO --%>
                                            <b><axis:alt f="axisrea037" c="LIT_CONTRAT" lit="101945"/></b>
                                        </td>
                                        </axis:visible>  
                                        <axis:visible f="axisrea037" c="NVERSIO">
                                        <td class="titulocaja" >                                <%--NVERSION --%>
                                            <b><axis:alt f="axisrea037" c="LIT_NVERSIO" lit="9001146"/></b>
                                        </td>
                                        </axis:visible>  
                                        <axis:visible f="axisrea037" c="CTRAMO">
                                        <td class="titulocaja" >                                <%--NVERSION --%>
                                            <b><axis:alt f="axisrea037" c="LIT_CTRAMO" lit="9000609"/></b>
                                        </td>
                                        </axis:visible>  
                                        <axis:visible f="axisrea037" c="CESTADO">
                                        <td class="titulocaja">                                 <%--ESTADO DE CIERRE --%>
                                            <b><axis:alt f="axisrea037" c="CESTADO" lit="9000489"/></b> 
                                        </td>
                                        </axis:visible>
                                        <axis:visible f="axisrea037" c="NUMPROCES">
                                        <td class="titulocaja" >                                <%--Nº Liquidación --%>
                                            <b><axis:alt f="axisrea037" c="LIT_NUMPROCES" lit="9904002"/></b>
                                        </td>
                                        </axis:visible>
                                    </tr>
                                <tr>
                                    <td class="campocaja" colspan="1">                          <%-- SCONTRA --%>
                                        <axis:ocultar f="axisrea037" c="SCONTRA">               <!-- Linia 1. Columna 2. -->
                                            <select name="SCONTRA" id="SCONTRA" size="1" onchange="f_actualiza_version();" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> 
                                                    class="campowidthselect campo campotexto"  style="width:90%;"
                                                    <axis:atr f="axisrea037" c="SCONTRA" a="modificable=true&isInputText=true&obligatorio=false"/> obligatorio="false" 
                                                    title="<axis:alt f='axisrea037' c='SCONTRA' lit='101945'/>">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaContrato}">
                                                    <option value = "${element.SCONTRA}" 
                                                    <c:if test="${element.SCONTRA == __formdata.SCONTRA}"> selected </c:if> >
                                                     ${element.SCONTRA} - ${element.TDESCRIPCION} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                     </td>
                                     <td class="campocaja" colspan="1">                         <%-- NVERSIO --%>
                                       <axis:ocultar f="axisrea037" c="NVERSIO">                <!-- Linia 1. Columna 2. -->
                                            <select name="NVERSIO" id="NVERSIO" size="1" onchange="" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> 
                                                    class="campowidthselect campo campotexto" style="width:90%;"
                                                    <axis:atr f="axisrea037" c="NVERSIO" a="modificable=true&isInputText=true&obligatorio=false"/>  obligatorio="false" 
                                                    title="<axis:alt f='axisrea037' c='NVERSIO' lit='9001146'/>">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaVersion}">
                                                    <option value = "${element.NVERSIO}" 
                                                    <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                     ${element.NVERSIO} - ${element.TCONTRA} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                    </td>
                                
                                    <td class="campocaja" colspan="1">                          <%-- Tramo --%>
                                        <axis:ocultar f="axisrea037" c="CTRAMO">                <!-- Linia 1. Columna 2. -->
                                            <select name="CTRAMO" id="CTRAMO" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> 
                                                    class="campowidthselect campo campotexto" style="width:90%;"
                                                    <axis:atr f="axisrea037" c="CTRAMO" a="modificable=true&isInputText=true&obligatorio=false"/>  obligatorio="false" 
                                                    title="<axis:alt f='axisrea037' c='CTRAMO' lit='9000609'/>">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea037" c="ALT_CTRAMO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaTramos}">
                                                    <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CTRAMO}"> selected </c:if> >
                                                     ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                    </td>
                                    <td class="campocaja"  colspan="1">                                      <%--ESTADO DE CIERRE --%>
                                        <axis:ocultar f="axisrea037" c="CESTADO"> 
                                            <select name = "CESTADO" id ="CESTADO" size="1" onchange="f_buscar()" 
                                                    class="campowidthselect campo campotexto" style="width:90%;" 
													  <axis:atr f="axisrea037" c="CESTADO" a="modificable=true&isInputText=true&obligatorio=false"/>  obligatorio="false"
                                                    title="<axis:alt f='axisrea037' c='CESTADO' lit='9000489'/>">
                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisrea037" c="SNV_COMBO" lit="108341"/> - </option>
                                                <c:forEach  var="item" items="${__formdata.lstEstados}">
                                                    <option value = "${item.CATRIBU}" <c:if test="${__formdata.CESTADO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </axis:ocultar>    
                                    </td>
                                    <td class="campocaja">   
                                    <%-- NUMPROCES --%>   
                                    <axis:ocultar f="axisrea037" c="NUMPROCES"> 
                                        <input type="text" class="campo campotexto" size="15" style="width:90%"
                                               value="${__formdata.NUMPROCES}" name="NUMPROCES" id="NUMPROCES"
                                               title="<axis:alt f='axisrea037' c='NUMPROCES' lit='9904002'/>" 
                                               alt="<axis:alt f='axisrea037' c='NUMPROCES' lit='9904002'/>"
                                               <axis:atr f="axisrea037" c="NUMPROCES" a="modificable=true&formato=entero"/> />
                                           </axis:ocultar>  
                                    </td>
                                </tr>
                                
                                

                                    <tr>
                                        <td class="titulocaja" colspan="6"> 
                                            <div class="separador">&nbsp; </div>                                                                                                                            
                                            <%-- DisplayTag Agentes --%>
                                            <c:set var="title0"><axis:alt f="axisrea037" c="EMPRESA" lit="101619"/></c:set>   <%-- Empresa --%>
                                            <c:set var="title1"><axis:alt f="axisrea037" c="REASEGURADORA" lit="9902909"/></c:set>   <%-- Producto --%>
                                            <c:set var="title2"><axis:alt f="axisrea037" c="REASEGURADORA" lit="9903030"/></c:set>   <%-- Reaseguradora --%>
                                            <c:set var="title3"><axis:alt f="axisrea037" c="CONTRATO" lit="101945"/></c:set>   <%-- Contrato --%>
                                            <c:set var="title4"><axis:alt f="axisrea037" c="VERSION" lit="9001146"/></c:set>  <%-- Version --%>
                                            <c:set var="title5"><axis:alt f="axisrea037" c="TRAMO" lit="9000609"/></c:set>  <%-- Tramo --%>
                                            <c:set var="title6"><axis:alt f="axisrea037" c="FCIERRE" lit="9000490"/></c:set>  <%-- Fecha cierre --%>
                                            <c:set var="title10"><axis:alt f="axisrea037" c="MONEDA" lit="108645"/></c:set>  <%-- Moneda --%>
                                            <c:set var="title7"><axis:alt f="axisrea037" c="BROKER" lit="9000752"/></c:set>  <%-- Broker --%>
                                            <c:if test="${__formdata.CESTADO == '0'}"><c:set var="title8"><axis:alt f="axisrea037" c="ISALDO" lit="9905980"/></c:set></c:if> <%-- Saldo Liquidado --%>
                                            <c:if test="${__formdata.CESTADO == '2'}"><c:set var="title8"><axis:alt f="axisrea037" c="ISALDO" lit="9905981"/></c:set></c:if> <%-- Saldo a Liquidar --%>
                                            <c:if test="${__formdata.CESTADO != '0' && __formdata.CESTADO != '2'}"><c:set var="title8"><axis:alt f="axisrea037" c="ISALDO" lit="9904108"/></c:set></c:if> <%-- Saldo Pendiente --%>
                                            <c:if test="${__formdata.CESTADO == null}"><c:set var="title8"><axis:alt f="axisrea037" c="ISALDO" lit="9001942"/></c:set></c:if> <%-- Saldo --%>
                                            
                                            <c:set var="title9"><axis:alt f="axisrea037" c="A_LIQUIDAR" lit="9001771"/></c:set>  <%-- Liquidar --%>
                                            <c:set var="total_filas">${fn:length(__formdata.LSTCUENTAS)}</c:set>  <%-- Total filas multirregistro --%>
                                       
                                                 <% int x = 0; %>   
                                                  <% int sumatorio = 1; %>   
                                                     <c:set var="total1A">0</c:set>
                                                     <c:set var="total2A">0</c:set>
                                                     <c:set var="total1B">0</c:set>
                                                     <c:set var="total2B">0</c:set>
                                            <div class="displayspaceMaximo"> 
                                                <input type="hidden" name="datos_num_lineas" id="datos_num_lineas" value="" />
                                                <display:table name="${__formdata.LSTCUENTAS}" id="LSTCUENTAS" export="false" class="dsptgtable" pagesize="-1" style="width:98%"  defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisrea037.do?paginar=true" excludedParams="datos_num_lineas"> 
                                                     <c:set var="prueba"><%=x%></c:set>                                                      
                                                      <c:set var="IDENTIFICADOR">${LSTCUENTAS.CEMPRES}|${LSTCUENTAS.SPRODUC}|${LSTCUENTAS.CCORRED}|${LSTCUENTAS.CCOMPANI}|${LSTCUENTAS.SCONTRA}|${LSTCUENTAS.NVERSIO}|${LSTCUENTAS.CTRAMO}|<fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/>|${LSTCUENTAS.SPAGREA}</c:set>
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  style="width:5%"   media="html" autolink="false">
                                                         <div class="dspIcons">
                                                            <%--input type="radio" name="selCta" id="${LSTCUENTAS.NVERSIO}" value="${LSTCUENTAS.CEMPRES}/${LSTCUENTAS.NVERSIO}"/--%>
                                                            <!-- Mostraremos el checkbox si el estado es Pendiente, si el estado de la ctatecnica es -99 miraremos el combo-->
                                                            <c:if test="${(LSTCUENTAS.ESTADO == - 99 && __formdata.CESTADO == 1) || LSTCUENTAS.ESTADO == 1}">
                                                            <input type="checkbox" name="num_linea_<%=x%>" <c:if test="${LSTCUENTAS.NUM_LINEA == 1}" >checked</c:if> id="num_linea_<%=x%>" value="" onclick="actualizar_importes('${total_filas}','<%=x%>');" />
                                                            </c:if>
                                                            <input type="hidden" id="datos_num_linea_<%=x%>"  value="${IDENTIFICADOR}" />
                                                            
                                                            <!-- 
                                                            ${LSTCUENTAS}
                                                            -->
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="TEMPRES" style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LSTCUENTAS.CEMPRES}', '${LSTCUENTAS.CTRAMO}', '${LSTCUENTAS.CCOMPANI}','${LSTCUENTAS.SCONTRA}','${LSTCUENTAS.NVERSIO}','${LSTCUENTAS.SPRODUC}','<fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/>','${LSTCUENTAS.TMONEDA}','${LSTCUENTAS.TMONEDA}','${LSTCUENTAS.SPAGREA}')" id="${LSTAGENTES.TNOMBRE}">
                                                               ${LSTCUENTAS.TEMPRES}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="TPRODUC" style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LSTCUENTAS.CEMPRES}', '${LSTCUENTAS.CTRAMO}', '${LSTCUENTAS.CCOMPANI}','${LSTCUENTAS.SCONTRA}','${LSTCUENTAS.NVERSIO}','${LSTCUENTAS.SPRODUC}','<fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/>','${LSTCUENTAS.TMONEDA}','${LSTCUENTAS.SPAGREA}')" id="${LSTAGENTES.TNOMBRE}">
                                                                ${LSTCUENTAS.TPRODUC}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="true" sortProperty="TCOMPANI" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TCOMPANI}
                                                           
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title3}" sortable="true" sortProperty="TCONTRA" style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            <span style="text-decoration:underline;cursor:pointer" onclick="javascript:f_seleccionar('${LSTCUENTAS.CEMPRES}', '${LSTCUENTAS.CTRAMO}', '${LSTCUENTAS.CCOMPANI}','${LSTCUENTAS.SCONTRA}','${LSTCUENTAS.NVERSIO}','${LSTCUENTAS.SPRODUC}','<fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/>','${LSTCUENTAS.TMONEDA}','${LSTCUENTAS.SPAGREA}')" id="${LSTAGENTES.TNOMBRE}">
                                                                ${LSTCUENTAS.TCONTRA}
                                                            </span>
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title4}" sortable="true" sortProperty="NVERSIO" style="width:5%"    headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.NVERSIO}
                                                           
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title5}" sortable="true" sortProperty="TTRAMO" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.TTRAMO}
                                                          
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title6}" sortable="true" sortProperty="FCIERRE" style="width:10%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                           
                                                                <fmt:formatDate value='${LSTCUENTAS.FCIERRE}' pattern='dd/MM/yyyy'/> 
                                                           
                                                        </div>
                                                    </display:column>
                                                    
                                                    <display:column title="${title10}" sortable="true" sortProperty="MONEDA" style="width:5%"   headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                            
                                                                ${LSTCUENTAS.MONEDA}
                                                          
                                                        </div>
                                                    </display:column>
                                                    
                                                    <%--display:column title="${title7}" sortable="false" sortProperty="TCORRED"  style="width:10%"  headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspText">
                                                           
                                                                ${LSTCUENTAS.TCORRED}
                                                           
                                                        </div>
                                                    </display:column--%>
                                                    <display:column title="${title8}" sortable="true" sortProperty="ISALDO"  style="width:10%"    headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                                <!-- INI - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCUENTAS.ISALDO}"/> <br>
                                                                <c:if test="${LSTCUENTAS.MONEDA != 'COP' }">
                                                                 	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCUENTAS.ISALDO_CON}"/> COP			                                                     	
		                                                        </c:if>
		                                                        <!-- FIN - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->      
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title9}" sortable="true" sortProperty="ISALDO2"  style="width:12%"    headerClass="sortable fixed"  media="html" autolink="false">
                                                        <div class="dspNumber">
                                                         <c:if test="${LSTCUENTAS.ESTADO == 0 || (LSTCUENTAS.ESTADO == -99 && __formdata.CESTADO==0)}" >
                                                            <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="0"/>
                                                         </c:if>                                                        
                                                         <c:if test="${LSTCUENTAS.ESTADO != 0 && __formdata.CESTADO!=0}">
                                                             <c:if test="${__formdata.CESTADO != 1 || (__formdata.CESTADO == 1 && LSTCUENTAS.NUM_LINEA == 1)}" >
                                                                <!-- INI - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                                <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCUENTAS.ISALDO2}"/> <br>
                                                                <c:if test="${LSTCUENTAS.MONEDA != 'COP' }">
                                                                 	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${LSTCUENTAS.ISALDO2_CON}"/> COP			                                                     	
		                                                        </c:if>
		                                                        <!-- FIN - ML - 4610 - VISUALIZAR MONEDA CONTABLE  -->
                                                             </c:if>
                                                        </c:if>
                                                        </div>
                                                    </display:column>
                                                     <% x=x+sumatorio; %>
                                                     <c:if test="${LSTCUENTAS.MONEDA == 'USD' }">
                                                     <c:set var="total1A">${total1A + LSTCUENTAS.ISALDO}</c:set>
                                                     </c:if>                                                     
                                                     <c:if test="${LSTCUENTAS.MONEDA == 'COP'}">
                                                     <c:set var="total2A">${total2A + LSTCUENTAS.ISALDO}</c:set>
                                                     </c:if>
                                                     <c:if test="${LSTCUENTAS.ESTADO != 0 && __formdata.CESTADO!=0}">
                                                         <c:if test="${(__formdata.CESTADO != 1 || (__formdata.CESTADO == 1 && LSTCUENTAS.NUM_LINEA == 1)) && LSTCUENTAS.MONEDA == 'USD' }">
                                                         <c:set var="total1B">${total1B + LSTCUENTAS.ISALDO2}</c:set>
                                                         </c:if> 
                                                     </c:if>    
                                                     <c:if test="${LSTCUENTAS.ESTADO != 0 && __formdata.CESTADO!=0}">
                                                         <c:if test="${(__formdata.CESTADO != 1 || (__formdata.CESTADO == 1 && LSTCUENTAS.NUM_LINEA == 1)) && LSTCUENTAS.MONEDA == 'COP'}">
                                                         <c:set var="total2B">${total2B + LSTCUENTAS.ISALDO2}</c:set>
                                                         </c:if>
                                                     </c:if>
                                                </display:table>                                                        
                                            </div>
                                                                                           
<table cellpadding="0" class="dsptgtable grid" style="width:98%" cellspacing="0"><tbody>
<tr class="gridEven">
<td style="width:5%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:5%"></td>
<td style="width:10%"></td>
 <axis:ocultar f="axisrea037" c="SALDO_USD">            <td style="width:10%"> <b><axis:alt f="axisrea037" c="SALDO_USD" lit="9905029"/></b></td>   
 <td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total1A}"/></td>
<td style="width:12%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total1B}"/></div>
</td></axis:ocultar></tr>
<tr class="gridEven">
<td style="width:5%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:10%"></td>
<td style="width:5%"></td>
<td style="width:10%"></td>
 <axis:ocultar f="axisrea037" c="SALDO_COP">     <td style="width:10%"> <b><axis:alt f="axisrea037" c="SALDO_COP" lit="9905030"/></b>  </td>  
<td style="width:10%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total2A}"/></td>
<td style="width:12%"><div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total2B}"/></div>
</td> </axis:ocultar> </tr>
</tbody></table> 

<%-- durante la fase de desarrollo, aun no teniamos la conexion de JDE para recuperar CSVs, y por eso lo dejamos por el momento en comentarios
                                            <div class="separador">&nbsp; </div>    
                                            <b><axis:alt f="axisrea037" c="LISTADOS" lit="102146"/></b>
                                            <div class="displayspace"> 
                                                <display:table name="${__formdata.CSVs}" id="CSVs" export="false" class="dsptgtable" pagesize="-1" style="width:98%"  defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI=""> 
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  style="width:30%"   media="html" autolink="false">
                                                         <div class="dspText">${CSVs} <a target="CSVs" href="javascript:f_tunnel_doc('${CSVs.FILENAMEANDPATH}')">${CSVs.FILENAMEANDPATH}</a></div>
                                                    </display:column>
                                                </display:table>
                                            </div>
--%>                                            
                                        </td> 
                                    </tr>


                                </table>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
		<c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisrea037</c:param>
        <c:param name="f">axisrea037</c:param>
        <c:param name="__botones">cancelar<axis:visible f="axisrea037" c="BT_IMPRIMIR"><c:if test="${fn:length(__formdata.LSTCUENTAS) > 0 && !empty __formdata.LSTCUENTAS && !empty __formdata.NUMPROCES}">,100001</c:if></axis:visible><axis:visible f="axisrea037" c="BT_LIQUIDAR">,9001771</axis:visible>,buscar</c:param></c:import>
        <div class="separador">&nbsp;</div>
    </form>
    <c:import url="../include/mensajes.jsp" />
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FCIERRE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FCIERRE", 
            singleClick    :    true,
            firstDay       :    1
        });
   </script>

</body>
</html>
