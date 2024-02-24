<%/*
*  Fichero: axiadm021.jsp
*  Fecha: 03/02/2009
*/
%>
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
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        
            var cempres =  "${requestScope.selected_CEMPRES}"; 
            if(!objUtiles.estaVacio(cempres)){
                /*var vcramo = document.miForm.CRAMO.value;
				alert(vcramo);
                if(vcramo==""){*/
                    f_cargar_ramos_onload();
                //}
            }
            
            var check  = "${__formdata['TIPOPERSONA']}";
            if(objUtiles.estaVacio(check)){
                f_checkea_persona();
            }
            
            f_cargar_propiedades_pantalla();
            var condicion = document.getElementById('CCONDICION').value;
            if(!objUtiles.estaVacio(condicion)){
                try{
                    document.getElementById('TCONDICION').value='COND_RECIBO_'+condicion;
                }catch(e){}
            }
            document.miForm.list_CEMPRES.focus();
        }
        
        
                
        function f_but_aceptar() {
            if(objUtiles.estaVacio(document.miForm.seleccionaRecibo))
                //f_but_cancelar();
                alert("<axis:alt f='axisadm021' c='ALERT_ACEPTAR' lit='1000413' />");
            else{
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("seleccionaRecibo");

                if(typeof hayChecked == 'boolean') 
                    //f_but_cancelar();
                    alert("<axis:alt f='axisadm021' c='ALERT_ACEPTAR' lit='1000413' />");
                else {
                    seleccionarLista(hayChecked);
                }
            }
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm021();
        }        
        
        function f_but_100797() { //f_but_buscar
            //Si la validación es correcta (true), ejecutamos la acción
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisadm021.do","busqueda_recibo",document.miForm, "_self", "<axis:alt f='axisadm021' c='busqueda_recibo' lit='9000986' />");   
            }
        }
        
        function seleccionarLista(NRECIBO){
            parent.f_aceptar_axisadm021(NRECIBO);
        }
        
        function f_cargar_ramos(){
            var ccompani = objDom.getValorPorId("list_CEMPRES");
            
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
            objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
        }
        
        function f_cargar_ramos_onload(){
            var ccompani = objDom.getValorPorId("list_CEMPRES");
            
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
            objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackAjaxCargarRamosOnload, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
        }        
        
        function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.list_CEMPRES)) ){
                    url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.list_CEMPRES);
                }
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
        } 
        
        function f_cargar_productos_onload(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.list_CEMPRES)) ){
                    url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.list_CEMPRES);
                }
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackAjaxCargarProductosOnload, url, this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarRamos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0); 
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }    
                   f_cargar_productos();
                }
            }
         
         function callbackAjaxCargarRamosOnload (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var RAMOSCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RAMOSCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="COMBO_sv" lit="108341"/> - ', RAMOSCombo, 0);
                    var elementos = doc.getElementsByTagName("CRAMO");
                       for (i = 0; i < elementos.length; i++) {
                            var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                            var TRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0); 
                            objDom.addOpcionACombo(CRAMO, TRAMO, RAMOSCombo, i+1);
                        }    
                   if (document.miForm.CRAMO.value!="") document.miForm.ramoProducto.value = document.miForm.CRAMO.value;
                   f_cargar_productos_onload();
                }
            }
        
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            } 
            
            function callbackAjaxCargarProductosOnload (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                 if (document.miForm.SPRODUCSEL.value!="") document.miForm.SPRODUC.value = document.miForm.SPRODUCSEL.value;
                }
            }
            
            function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada            
            //objDom.setDisabledPorId("CCOMPANI",false); //CCOMPANI
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objUtiles.ejecutarFormulario("modal_axisadm021.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            
            }
            
            function f_onchange_sproduc(SPRODUC) {
                objDom.setValorPorId("SPRODUCSEL", SPRODUC); 
            
            }
            
            function f_checkea_persona(){

                 document.getElementById("TIPOPERSONA_tomador").checked=true;
  
            }
        
        function f_cargar_DATOSPERSONA() {        
            var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
            objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackCargarDatosPersona, 
                "operation=ajax_cargarDatosPersona" + params, this);
        }
        
        function f_seleccionar_persona(SPERSON, TNOMBRE,NNUMIDE) {
        
            var radioSPERSON = document.miForm.radioSPERSON;
           
            // Marcar/desmarcar radiobuttons
            if (objUtiles.estaVacio(radioSPERSON.length))
                radioSPERSON.checked = true;
            else {
                for (var i = 0; i < radioSPERSON.length; i++) 
                    radioSPERSON[i].checked = (radioSPERSON[i].value == SPERSON);
            }
            
            objDom.setValorPorId("SPERSON", SPERSON);
            objDom.setValorPorId("TNOMBRE", TNOMBRE);            
            objDom.setValorPorId("NNUMIDE", NNUMIDE);   
        }

        function f_borrar_campos() {
        
            objDom.setValorPorId("NNUMIDE", "");
             objDom.setValorPorId("SPERSON", "");
            objDom.setValorPorId("TNOMBRE", "");
           // f_cargar_DATOSPERSONA();
            document.getElementById("NNUMIDE").focus();
        }

        /****************************************************************************************/
        /********************************** CALLBACK  *******************************************/
        /****************************************************************************************/
        
        function callbackCargarDatosPersona(ajaxResponseText) {
            var doc = objAjax.domParse(ajaxResponseText);
            // Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
            // para poder añadir una nueva fila
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbodyadded = objLista.obtenerBodyLista("DATOSPERSONA");
                var tradded = objLista.obtenerFilasBodyLista("DATOSPERSONA", tbodyadded);
                var primerSPERSON = null;
                var primerTEXTO   = null;
                var primerNNUMIDE = null;
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm021' c='DATOSPERSONA' lit='1000254'/>");
                
                if (objDom.existeTag(doc, "CODI"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbodyadded, tradded);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "CODI") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    
                    var SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), i, 0);
                    var VALOR   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO     = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0);
                  //  TEXTO = objUtiles.replaceAll(TEXTO, "'", "\'");
                     TEXTO=TEXTO.replace(/'/g, "\\'");
                    var jsFuncion = "javascript:f_seleccionar_persona('" + SPERSON + "', '" + TEXTO + "', '" + VALOR + "')";
                    
                    newtd[0] = objLista.addRadioButtonEnLista("radioSPERSON", SPERSON, jsFuncion);             
                    
                    if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                        primerSPERSON = SPERSON;
                        primerTEXTO   = TEXTO;
                        primerNNUMIDE   = VALOR;
                    }
                        
                    newtd[1] = objLista.addTextoEnLista(VALOR, jsFuncion);
                    newtd[2] = objLista.addTextoEnLista(TEXTO, jsFuncion);
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
                
                // Seleccionar el primero si sólo hay uno
                
                if (!objUtiles.estaVacio(primerSPERSON) && objDom.numeroDeTags(doc, "CODI") == 1)
                    f_seleccionar_persona(primerSPERSON, primerTEXTO,primerNNUMIDE);
                                                        
            } // Fi if
        }
        
        /***************************************** AJAX ******************************************/
       
            function f_actualizar_agente(){
                var CAGENTE =  objDom.getValorPorId("CAGENTE_TEXT");
                objDom.setValorPorId("CAGENTE",CAGENTE);
                objDom.setValorPorId("NOMBRE_TEXT", ""); 
                objAjax.invokeAsyncCGI("modal_axisadm021.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
            }
            
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        //objDom.setValorPorId("CAGENTE","");
                    }
                }
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }
        
        /****************************** MODAL *************************************/ 
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014");
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisctr195.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_100797() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="PESTREC" id="PESTREC" value="${requestScope.PESTREC}"/>
            
            <input type="hidden" id="PCTIPCOB" name="PCTIPCOB" value="${__formdata.PCTIPCOB}"/>
            
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="SPRODUCSEL" name="SPRODUCSEL" value="${__formdata.SPRODUCSEL}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">   
            <input type="hidden" name="CCONDICION" id="CCONDICION" value="${__formdata.CCONDICION}" >   
            <input type="hidden" name="TCONDICION" id="TCONDICION" value="${__formdata.TCONDICION}" > 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="producto"><axis:alt f="axisadm001" c="TITULO" lit="9000991"/></c:param>
                <c:param name="formulario"><axis:alt f="axisadm001" c="TITULO" lit="9000991"/></c:param>
                <c:param name="form">axisadm021</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="titulo14" f="axisadm021" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm021" c="titulo" lit="1000178" /></div>
                        <!--campos-->
                        
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm021" c="CEMPRES"> <!-- TODO C -->
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_CEMPRES"><axis:alt f="axisadm021" c="CEMPRES" lit="101619" /></b>
                                            </td>
                                            </axis:visible>
                                            <axis:ocultar f="axisadm021" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr019" c="CRAMO" lit="100784"></axis:alt></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="PRODUCTE" dejarHueco="false">
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisadm001" c="PRODUCTE" lit="100829"/></b> <%-- Producte --%>
                                                </td>
                                            </axis:ocultar>    
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisadm021" c="CEMPRES"> <!-- TODO C -->
                                                <td class="campocaja" colspan="2">    
                                                    <select title="<axis:alt f='axisadm021' c='CEMPRES' lit='101619' />" alt="<axis:alt f='axisadm021' c='CEMPRES' lit='101619' />" name = "list_CEMPRES" id="list_CEMPRES" size="1" 
                                                        class="campowidthselect campo campotexto_ob" onchange="f_onchange_empresa(this.value)"
                                                        <axis:atr f="axisadm021" c="list_CEMPRES" a="modificable=true&obligatorio=false"/>>
                                                        <option value = "null"> - <axis:alt f="axisadm021" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="empresas" items="${requestScope.T_IAX_EMPRESAS}">
                                                            <option value = "${empresas.CEMPRES}"
                                                                <c:choose>
                                                                    <c:when test="${requestScope.selected_CEMPRES == empresas.CEMPRES}">selected</c:when>
                                                                </c:choose>>
                                                                ${empresas.TEMPRES}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            <axis:ocultar f="axisadm021" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                                <td class="campocaja"> 
                                                    <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr019" c="BLANCO" lit="1000348"/> - </option>
                                                    <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                        <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                            <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                            ${ramos.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" colspan="3">                                
                                                    <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:75%;"
                                                    onchange="f_onchange_sproduc(this.value)">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LSTPRODUCTOS}">
                                                            <option value = "${element.SPRODUC}"
                                                            <c:if test="${__formdata.SPRODUC == element.SPRODUC}">selected</c:if> >
                                                                ${element.TTITULO} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm021" c="AGENTETIPO" dejarHueco="false">                            
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axisadm021" c="AGENTETIPO" lit="9000436"/></b>                             
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="LSAGENTES" dejarHueco="false">                            
                                                <td class="titulocaja"  colspan="2">
                                                    <b><axis:alt f="axisadm021" c="LSAGENTE" lit="100584"/></b>                             
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="CAGENTE" dejarHueco="false"> 
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt  c="CAGENTE" f="axisadm021" lit="100584"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm021" c="AGENTETIPO" dejarHueco="false">                            
                                                 <td class="campocaja" colspan="3"> 
                                                    <select name="AGENTETIPO" id ="AGENTETIPO" <axis:atr f="axisadm021" c="AGENTETIPO" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:75%;">
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm021" c="AGENTETIPOS" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LSAGENTESTIPO}">
                                                                <option value = "${element.CAGENTE}"
                                                                <c:if test="${__formdata.AGENTETIPO == element.CAGENTE}">selected</c:if>>
                                                                    ${element.TAGENTE} 
                                                                </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="LSAGENTES" dejarHueco="false">                            
                                                 <td class="campocaja" colspan="3">
                                                    <select name="LSAGENTES" id ="LSAGENTES" <axis:atr f="axisadm021" c="LSAGENTES" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:50%;">
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm021" c="COMBO_SVN" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LSAGENTE}">
                                                                <option value = "${element.CODI}"
                                                               <c:if test="${__formdata.LSAGENTES == element.CODI}"> selected = "selected"</c:if>  >
                                                                    ${element.NOMBRE} 
                                                                </option>
                                                            </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm021" c="CAGENTE" dejarHueco="false">
                                                <td class="campocaja" colspan="3">
                                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                                     title="<axis:alt  c="CAGENTE" f="axisadm021" lit="100584"/>" 
                                                    onchange="f_actualizar_agente()" />
                                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        <tr>                                        
                                            <axis:visible f="axisadm021" c="NPOLIZA"> <!-- TODO C -->
                                                <td class="titulocaja">
                                                    <b id="label_NPOLIZA"><axis:alt f="axisadm021" c="NPOLIZA" lit="100836" /></b>
                                                </td>
                                            </axis:visible>                                           
                                            <axis:visible f="axisadm021" c="NCERTIF"> <!-- TODO C -->
                                                <td class="titulocaja">
                                                    <b id="label_NCERTIF"><axis:alt f="axisadm021" c="NCERTIF" lit="101300" /></b>
                                                </td>
                                            </axis:visible>
                                            <axis:ocultar f="axisadm021" c="CPOLCIA" dejarHueco="false">                            
                                             <td class="titulocaja" id="LIT_CPOLCIA">
                                                 <b><axis:alt f="axisadm021" c="CPOLCIA" lit="9001766"/></b><%-- Nº Póliza Compania --%>                              
                                             </td>
                                            </axis:ocultar> 
                                            <axis:visible f="axisadm021" c="NRECIBO"> <!-- TODO C -->
                                                <td class="titulocaja">
                                                    <b id="label_NRECIBO"><axis:alt f="axisadm021" c="NRECIBO" lit="800636" /></b>
                                                </td>
                                            </axis:visible>                                            
                                             <%-- Nº Recibo Compania --%>
                                             <axis:ocultar c="CRECCIA" f="axisadm021" dejarHueco="false">
                                                    <td class="titulocaja" id="LIT_CRECCIA" colspan ="2">
                                                         <b><axis:alt f="axisadm021" c="CRECCIA" lit="9001763"/></b>
                                                    </td>     
                                            </axis:ocultar>                                            
                                            <td>&nbsp;</td>
                                        </tr>                                        
                                        <tr>                                        
                                            <axis:visible f="axisadm021" c="NPOLIZA"> <!-- TODO C -->
                                                <td class="campocaja">    
                                                    <input type="text" name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" class="campowidthinput campo campotexto" style="width:90%;"
                                                    <axis:atr f="axisdm021" c="NPOLIZA" a="formato=entero&modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm021" c="NPOLIZA" lit="100836" />" title="<axis:alt f="axisadm021" c="NPOLIZA" lit="100836" />"/>
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisadm021" c="NCERTIF"> <!-- TODO C -->
                                                <td class="campocaja">    
                                                    <input type="text" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}" class="campowidthinput campo campotexto" style="width:90%;"
                                                    <axis:atr f="axisadm021" c="NCERTIF" a="formato=entero&modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm021" c="NCERTIF" lit="101300" />" title="<axis:alt f="axisadm021" c="NCERTIF" lit="101300" />"/>
                                                </td>
                                            </axis:visible>
                                            <axis:ocultar f="axisadm021" c="CPOLCIA" dejarHueco="false">
                                             <td class="campocaja">                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA"
                                                    style="width:91%;" title="<axis:alt f="axisadm021" c="CPOLCIA" lit="9001766"/>" <axis:atr f="axisadm021" c="CPOLCIA"/> />
                                            </td>
                                            </axis:ocultar>   
                                            <axis:visible f="axisadm021" c="NRECIBO"> <!-- TODO C -->
                                                <td class="campocaja">    
                                                    <input type="text" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}" class="campowidthinput campo campotexto" style="width:90%;"
                                                    <axis:atr f="axisadm021" c="NRECIBO" a="modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm021" c="NRECIBO" lit="800636" />" title="<axis:alt f="axisadm021" c="NRECIBO" lit="800636" />"/>
                                                </td>
                                            </axis:visible>                                            
                                            <axis:ocultar f="axisadm021" c="CRECCIA" dejarHueco="false"> 
                                                <td class="campocaja" colspan = "2" >    
                                                    <input type="text" name="CRECCIA" id="CRECCIA" value="${__formdata.CRECCIA}" class="campowidthinput campo campotexto" style="width:40%;"
                                                    <axis:atr f="axisadm021" c="CRECCIA" a="modificable=true&obligatorio=false"/> alt="<axis:alt f="axisadm021" c="CRECCIA" lit="9001763" />" title="<axis:alt f="axisadm021" c="CRECCIA" lit="9001763" />"/>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <td class="titulocaja">
                                                <!--input type="button" class="boton" id="but_buscar" name="but_buscar"  value="<axis:alt f="axisadm021" c="but_buscar" lit="100797" />" 
                                                onclick="f_but_buscar()"/-->
                                            </td>
                                         </tr>
                                         <axis:ocultar f="axisadm021" c="DSP_BUSCA_PERS" dejarHueco="false">
                                             <tr>
                                                <td colspan="6">
                                                    <div class="separador">&nbsp;</div>
                                                    <table class="seccion">
                                                        <tr>
                                                            <th style="width:16.6%;height:0%;"/>
                                                            <th style="width:16.6%;height:0%;"/>
                                                            <th style="width:16.6%;height:0%;"/>
                                                            <th style="width:16.6%;height:0%;"/>
                                                            <th style="width:8.6%;height:0%;"/>
                                                            <th style="width:8.4%;height:0%;"/>
                                                        </tr>
                                                        <tr>
                                                            <axis:ocultar f="axisadm021" c="NNUMIDE" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisadm021" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                                                            </td>
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisadm021" c="TNOMBRE" dejarHueco="false">
                                                            <td class="titulocaja" colspan="3">
                                                                <b><axis:alt f="axisadm021" c="TNOMBRE" lit="1000560"/> <axis:alt f="axisadm001" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                                                            </td>
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisadm021" c="TIPOPER" dejarHueco="false">     
                                                            <td></td>
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisadm021" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                                                            </td>                            
                                                            <td class="titulocaja">
                                                                <input type="radio" id="TIPOPERSONA_tomador"  name="TIPOPERSONA" value="1"                                 
                                                                <c:if test="${__formdata['TIPOPERSONA'] == '1'}"> checked </c:if>/>                                    
                                                            </td>
                                                            </axis:ocultar>
                                                        </tr>
                                                        <tr>
                                                            <axis:ocultar f="axisadm021" c="NNUMIDE" dejarHueco="false">
                                                            <td class="campocaja">                             
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                                                <axis:atr f="axisadm021" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                                                title="<axis:alt f="axisadm021" c="NNUMIDE2" lit="1000559"/>" />
                                                            </td>
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisadm021" c="TNOMBRE" dejarHueco="false">
                                                            <td class="campocaja" colspan="3">                             
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                                                <axis:atr f="axisadm021" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"/>
                                                            </td>
                                                            </axis:ocultar>
                                                            <axis:ocultar f="axisadm021" c="TIPOPER" dejarHueco="false">     
                                                            <td></td>
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisadm021" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                                                            </td>
                                                                       
                                                            <td class="titulocaja">
                                                                <input type="radio" id="TIPOPERSONA_asegurado" name="TIPOPERSONA" value="2" 
                                                                <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if>/>
                                                            </td>
                                                            </axis:ocultar>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="5">
                                                                <div class="separador">&nbsp;</div>
                                                                <axis:ocultar f="axisadm021" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                                                <input type="button" class="boton" value="<axis:alt f="axisadm021" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                                                </axis:ocultar>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                <axis:ocultar f="axisadm021" c="BT_BUSCAR_PER" dejarHueco="false">
                                                                <input type="button" class="boton" value="<axis:alt f="axisadm021" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                                                </axis:ocultar>
                                                                <div class="separador">&nbsp;</div>
                                                            </td>
                                                            <axis:ocultar f="axisadm021" c="PAGADOR" dejarHueco="false">     
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisadm001" c="PAGADOR" lit="9903157"/></b> <%-- Pagador --%>
                                                                </td>                 
                                                                 <td class="titulocaja">
                                                                    <input type="radio" id="TIPOPERSONA_pagador" name="TIPOPERSONA" value="3"                                
                                                                    <c:if test="${__formdata['TIPOPERSONA'] == 3}"> checked </c:if>/>                                    
                                                                </td>
                                                             </axis:ocultar>
                                                        </tr>
                                                        <axis:ocultar f="axisadm001" c="DSP_DATPERSON" dejarHueco="false"> 
                                                        <tr>
                                                            <td colspan="6">
                                                                <c:set var="title1"><axis:alt f="axisadm021" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                                                <c:set var="title2"><axis:alt f="axisadm021" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                                                <div class="displayspace">
                                                                    <display:table name="${sessionScope.DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                                    requestURI="modal_axisadm001.do?paginar=true">
                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                                                            <div class="dspIcons">
                                                                                <input value="${DATOSPERSONA.SPERSON}" type="radio" id="radioSPERSON" name="radioSPERSON"/>
                                                                            </div>
                                                                        </display:column>
                                                                        <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                                                            <div class="dspText">${DATOSPERSONA.NNUMIDE}</div>
                                                                        </display:column>
                                                                        <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable"  media="html" autolink="false" >                                    
                                                                            <div class="dspText"></div>
                                                                        </display:column>
                                                                    </display:table>
                                                                </div>
                                                                <div class="separador">&nbsp;</div>
                                                            </td>
                                                        </tr> 
                                                      </axis:ocultar>                
                                                    </table>
                                                    <div class="separador">&nbsp;</div>
                                                </td>
                                            </tr>
                                        </axis:ocultar>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm021" c="titulos" lit="111046" /></div>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                            <td align="left">
                                 <table border="0" class="area" align="left" style="width:100%;">
                                    <tr>
                                        <td>
                                            <c:set var="title1"><axis:alt f="axisadm021" c="NRECIBOS" lit="100895"/></c:set>
                                            <c:set var="title2"><axis:alt f="axisadm021" c="FEFECTO" lit="101332"/></c:set>
                                            <c:set var="title3"><axis:alt f="axisadm021" c="FVENCIM" lit="102526"/></c:set>
                                            <c:set var="title4"><axis:alt f="axisadm021" c="TTIPREC" lit="100565"/></c:set>
                                            <c:set var="title5"><axis:alt f="axisadm021" c="TESTREC" lit="100587"/></c:set>
                                            <c:set var="title8"><axis:alt f="axisadm021" c="TRIESGO" lit="100624"/></c:set>
                                            <c:set var="title6"><axis:alt f="axisadm021" c="TRIESGO" lit="101027"/></c:set>
                                            <c:set var="title7"><axis:alt f="axisadm021" c="TOTAL_IMPORTE" lit="1000529"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                            <display:table name="${sessionScope.T_IAX_RECIBOS}" id="miListaId" export="false" class="dsptgtable" pagesize="15" defaultsort="1" defaultorder="ascending" requestURI="modal_axisadm021.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">    
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title=" " sortable="true" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                                    <div class="dspIcons"><input type="radio" id="seleccionaRecibo" name="seleccionaRecibo" value="${miListaId.NRECIBO}"/></div>
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" headerClass="sortable" sortProperty="NRECIBO"  media="html" autolink="false" >
                                                    <div class="dspText"><a href="javascript:seleccionarLista('${miListaId.NRECIBO}')">${miListaId.NRECIBO}</a></div>
                                                </display:column>
                                                <display:column title="${title2}" sortable="true" sortProperty="FEFECTO" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FEFECTO}"/></div>
                                                </display:column>
                                                <display:column title="${title3}" sortable="true" sortProperty="FVENCIM" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId.FVENCIM}"/></div>
                                                </display:column>
                                                <display:column title="${title4}" sortable="true" sortProperty="TTIPREC" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText">${miListaId.TTIPREC}</div>
                                                </display:column>
                                                <display:column title="${title5}" sortable="true" sortProperty="TESTREC" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText">${miListaId.TESTREC}</div>
                                                </display:column>
						<axis:visible  f="axisadm021" c="TB_NPOLIZA" >
                                                	<display:column title="${title8}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false">
                                                    	<div class="dspText">${miListaId.NPOLIZA}</div>
                                                	</display:column>
						</axis:visible> 
                                                <display:column title="${title6}" sortable="true" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspText">${miListaId.NOM_TOMADOR}</div>
                                                </display:column>
                                                <display:column title="${title7}" sortable="false" sortProperty="TOTAL_IMPORTE" headerClass="sortable"  media="html" autolink="false">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="###,##0.00" value='${miListaId.TOTAL_RECIBO}'/></div>
                                                </display:column>
                                             </display:table> 
                                                <c:choose>
                                                <c:when test="${!empty sessionScope.T_IAX_RECIBOS}">
                                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                                    </c:if>
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
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>						
            
            <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm021</c:param><c:param name="f">axisadm021</c:param>
                <c:param name="f">axisadm021</c:param>
                <c:param name="__botones">cancelar,100797,aceptar</c:param>
            </c:import>
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>