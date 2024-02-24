<%/* Revision:# 7iX2OjvyH/VsO37Y3a2C8A== # */%>
<%/*
*  Fichero: axisadm001.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 04/07/2008
*/
%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function validarFormulario() {//INI TAREA 16715 AMC 11/04/2022
           /*if( $("#NPOLIZA").val() == "" && $("#NRECIBO").val() == "" && $("#NRECCAJ").val() == "" 
        	&& $("#NNUMIDE").val() == ""  && $("#CPOLCIA").val() == ""  && $("#CRECCIA").val() == "")
        	{if($("#ramoProducto").val() == "-2147483648"){
                   alert("Debe seleccionar un Ramo");
                   $("#ramoProducto").css("border-color", "red");
                   $( "#ramoProducto" ).focus();
                   return false;
                 }else if($("#CESTREC").val() == "-2147483648"){
                     alert("Debe seleccionar Estado del Recibo"); 
                     $("#CESTREC").css("border-color", "red");
                     $("#CESTREC" ).focus();
                     return false;
                 }else if($("#FEMISIOINI").val() == ""){
                     alert("Debe seleccionar Fecha de Emisión"); 
                     $("#FEMISIOINI").css("border-color", "red");
                     $("#FEMISIOINI" ).focus();
                     return false;
                 }else if($("#LSAGENTESTIPO").val() == "-2147483648"){
                     alert("Debe seleccionar una Sucursal"); 
                     $("#LSAGENTESTIPO").css("border-color", "red");
                     $("#LSAGENTESTIPO" ).focus();
                     return false;
                 }  
           }else if($("#NNUMIDE").val() != ""){
        	   if($("#ramoProducto").val() == "-2147483648"){
                   alert("Debe seleccionar un Ramo");
                   $("#ramoProducto").css("border-color", "red");
                   $( "#ramoProducto" ).focus();
                   return false;
                 }else if($("#LSAGENTESTIPO").val() == "-2147483648"){
                     alert("Debe seleccionar una Sucursal"); 
                     $("#LSAGENTESTIPO").css("border-color", "red");
                     $("#LSAGENTESTIPO" ).focus();
                     return false;  
                 } 
        	   }*/
           	if($("#ramoProducto").val() == "-2147483648" && $("#SPRODUC").val() == "-2147483648" 
           			&& $("#CTIPREC").val() == "-2147483648" && $("#CESTREC").val() == "-2147483648" 
           			&& $("#CMRECA").val() == "-2147483648" && $("#LSAGENTESTIPO").val() == "-2147483648")
              {if($("#NPOLIZA").val() == "" && $("#CPOLCIA").val() == "" && $("#NRECIBO").val() == "" 
            		  && $("#CRECCIA").val() == "" && $("#FEMISIOINI").val() == "" && $("#FEMISIOFIN").val() == "" 
            		  && $("#FEFEINI").val() == "" && $("#FEFEFIN").val() == "" && $("#NRECCAJ").val() == "" 
            		  && $("#CAGENTE_TEXT").val() == "" && $("#NNUMIDE").val() == "" && $("#TNOMBRE").val() == "")
         	    {
                   alert("Debe seleccionar un filtro para realizar la busqueda");
                   $("#NRECIBO").css("border-color", "red");
                   $("#NRECIBO" ).focus();
                   return false;
                }
              }else if($("#FEMISIOFIN").val() != "" && $("#FEMISIOINI").val() == "")
                {
                   alert("Debe seleccionar fecha inicio y fin de emision para realizar la consulta");
                   $("#FEMISIOINI").css("border-color", "red");
                   $("#FEMISIOINI").focus();
                   return false;
                }else if($("#FEFEFIN").val() != "" && $("#FEFEINI").val() == "")
                  {
                     alert("Debe seleccionar fecha inicio y fin de efecto para realizar la consulta");
                     $("#FEMISIOINI").css("border-color", "red");
                     $("#FEMISIOINI").focus();
                     return false;
                  }//FIN TAREA 16715 AMC 11/04/2022
            return true;
          }
        
        function f_but_cancelar() {
           parent.f_cerrar_modal('axisadm001');                      
        }
        
       function f_but_100797() {     
        if (document.getElementById('LSSELRECIBOS')!=null){
            document.getElementById('LSSELRECIBOS').value = "";
        }
        //var req = "&CTIPO=" +  (document.getElementById("tomador").checked ? "1" : "2") ;
         var req = "&CTIPO=" +  objDom.getValorPorId("TIPO_PERS");
         //alert(req);
        objDom.setDisabledPorId("CCOMPANI",false); //CCOMPANI
        objUtiles.ejecutarFormulario("modal_axisadm001.do?"+req, "cargarRecercaRebuts", document.miForm, "_self", objJsMessages.jslit_cargando); 
       } 
       
       function f_but_aceptar(){
            if (document.getElementById('CSELEC_ALL')==null){
                var NREBUT = objDom.getValorPorId("NRECIBO2");
                if (typeof NREBUT == 'boolean' || objUtiles.estaVacio (NREBUT)) {
                    alert(objJsMessages.jslit_selecciona_registro);
                }else{
                // Si hay una seleccionada, llamar al Action.
                parent.f_aceptar_modal_recerca_rebut(NREBUT);       
                }
            }else{
                var LSSELRECIBOS = document.getElementById("LSSELRECIBOS").value;
                if (objUtiles.estaVacio(LSSELRECIBOS)){
                    alert(objJsMessages.jslit_selecciona_registro);
                }else{
                    parent.f_aceptar_modal_recerca_rebut(LSSELRECIBOS);
                }
            }        
       }
        
        function f_but_buscar() {
          if(validarFormulario()) {
            if (objValidador.validaEntrada()) {
            
                var domiciliado = null;
                
                if(document.getElementById("DOMICILIADOSI").checked){
                    domiciliado = 1;
                }
                if(document.getElementById("DOMICILIADONO").checked){
                    domiciliado = 2;
                }
                
                var cagente = document.miForm.CAGENTE.value;//objDom.getValorPorId("CAGENTE");
                if (cagente == "") cagente = document.miForm.LSAGENTE.value;//objDom.getValorPorId("LSAGENTE");
                var params = "?buscar=true" + 
                             "&NRECIBO=" +  objDom.getValorPorId("NRECIBO") + 
                             "&CEMPRES=" +  objDom.getValorPorId("CEMPRES") + 
                             "&SPRODUC=" +  objDom.getValorPorId("SPRODUC") + 
                             "&NPOLIZA=" +  objDom.getValorPorId("NPOLIZA") + 
                             "&NCERTIF=" +  objDom.getValorPorId("NCERTIF") + 
                             "&CTIPREC=" +  objDom.getValorPorId("CTIPREC") + 
                             "&CESTREC=" +  objDom.getValorPorId("CESTREC") +
                             "&FEMISIOINI=" +  objDom.getValorPorId("FEMISIOINI") +
                             "&FEMISIOFIN=" +  objDom.getValorPorId("FEMISIOFIN") +
                             "&FEFEINI=" +  objDom.getValorPorId("FEFEINI") +
                             "&FEFEFIN=" +  objDom.getValorPorId("FEFEFIN") +
                             //"&CTIPO=" +  (document.getElementById("tomador").checked ? "1" : "2") +
                             "&CTIPO=" +  objDom.getValorPorId("TIPO_PERS") +
                             "&SPERSON=" +  objDom.getValorPorId("SPERSON") +
                             "&CESTIMP=" + objDom.getValorPorId("CESTIMP") +
                             "&CRECCIA=" + objDom.getValorPorId("CRECCIA") + 
                             "&CPOLCIA=" + objDom.getValorPorId("CPOLCIA") +
                             "&LIQUIDAD=" + objDom.getValorPorId("LIQUIDAD") +
                             "&CCOMPANI=" + objDom.getValorPorId("CCOMPANI") +
                            "&CRAMO=" + objDom.getValorPorId("CRAMO") +
                            "&TIPREGIO=" + objDom.getValorPorId("LSREGIONAL") +
                             "&LSAGENTESTIPO=" + objDom.getValorPorId("LSAGENTESTIPO") +
                             "&LSAGENTE=" + cagente +
                             "&LSMEDIO=" + objDom.getValorPorId("LSMEDIO")  +
                             "&CBANCO=" + objDom.getValorPorId("CBANCO") +  //BFP bug:20326/99335
                             "&CTIPCUENTA=" + objDom.getValorPorId("CTIPCUENTA") +   //BFP bug:20326/99335
                             "&DOMICILIADO=" +  domiciliado+
                             "&COBBAN=" + objDom.getValorPorId("list_COBBANCARIO")+
                             "&REBUT_INI=" + objDom.getValorPorId("REBUT_INI")+     
                             "&NANUALI=" + objDom.getValorPorId("NANUALI")+
                             "&NFRACCI=" + objDom.getValorPorId("NFRACCI")+
                             "&TIPNEGOC=" + objDom.getValorPorId("LSNEGOCIO")+
                             "&NRECCAJ=" + objDom.getValorPorId("NRECCAJ")+ // BUG CONF-441 - 14/12/2016 - JAEG
                             "&CMRECA=" + objDom.getValorPorId("CMRECA");   // BUG CONF-441 - 14/12/2016 - JAEG

                parent.f_aceptar_modal('axisadm001', params);
            }
          }
        }
        
        function f_onload() {
            f_cargar_propiedades_pantalla();
            
            var cempres =  "${__formdata.CEMPRES}";
            if(!objUtiles.estaVacio(cempres)){
                f_cargar_ramos();
            }
            
            var condicion = document.getElementById('CCONDICION').value;
            if(!objUtiles.estaVacio(condicion)){
                try{
                    document.getElementById('TCONDICION').value='COND_RECIBO_'+condicion;
                }catch(e){}
            }
            
            var primerCheck  = "${__formdata['asegurado']}";   
            var segonCheck   = "${__formdata['asegurado']}";
            var tercerCheck  = "${__formdata['pagador']}";
            if(objUtiles.estaVacio(primerCheck) && objUtiles.estaVacio(segonCheck) && objUtiles.estaVacio(tercerCheck) ){
                f_checkea_persona(1);
            }
            
            document.getElementById("NRECIBO").focus();
            f_onchange_NPOLIZA();
            
            if (document.getElementById('CSELEC_ALL')!=null){
                f_revisarCheckRecibos();
            }
            
               // MENSAJES: ${requestScope.__mensajes}
            var hayLSTRECIBOS = ${!empty sessionScope.REC_LSTRECIBOS};
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            if (!hayLSTRECIBOS && !hayErrores) {
                // Abrir modal buscador
            } else {
                var miOffsetRecibos = "${requestScope.REC_miOffsetRecibos}";
                // Desplazar barra scroll
                if (!objUtiles.estaVacio(miOffsetRecibos)) {
                    document.getElementById("dt_recibos").scrollTop = parseInt(miOffsetRecibos);
                }
            }
            
            var kk = ${empty __formdata.LISTVALORES.LSTEMPRESAS[1] && empty __formdata.CEMPRES};
            if (kk){
                f_onchange_empresa('${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}');
            }
        }
        
        function f_onchange_NPOLIZA() {
        
            // Mostrar NCERTIF si está informado NPOLIZA
            var NPOLIZA = objDom.getValorPorId("NPOLIZA");
            
            if (objUtiles.estaVacio(NPOLIZA)) {
                objDom.setValorPorId("NCERTIF", "null");
                objDom.setVisibilidadPorId("NCERTIF", "hidden");
                objDom.setVisibilidadPorId("label_NCERTIF", "hidden");
            } else {
                var NCERTIF  = "${__formdata.NCERTIF}"; 
                if(objUtiles.estaVacio(NCERTIF))objDom.setValorPorId("NCERTIF", "");
                objDom.setVisibilidadPorId("NCERTIF", "visible");
                objDom.setVisibilidadPorId("label_NCERTIF", "visible");                
            }
        }
        
        function f_onchange_empresa(CEMPRES) {
            // Recargar formulario para seleccionar los productos segun la empresa seleccionada            
            objDom.setDisabledPorId("CCOMPANI",false); //CCOMPANI
            objDom.setValorPorId("CEMPRES", CEMPRES);
            objDom.setValorPorId("ramoProducto", "");
            objDom.setValorPorId("SPRODUC", "");
            f_borrar_campos();
            objUtiles.ejecutarFormulario("modal_axisadm001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        
        function f_cargar_DATOSPERSONA() {  
            
            var nnumide = objDom.getValorPorId("NNUMIDE");
            var tnombre = objDom.getValorPorId("TNOMBRE");
            if(nnumide!="" || tnombre!=""){
                var params = "&NNUMIDE=" + objDom.getValorPorId("NNUMIDE") + "&TNOMBRE=" + objDom.getValorPorId("TNOMBRE"); 
                //console.log("Entro a la funcion de modal_axisadm001" + params);
                //INI BUG IAXIS-13049 JRVG 15/07/2020
                objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackCargarDatosPersona, "operation=ajax_cargarDatosPersona" + params, this, objJsMessages.jslit_cargando);
                //FIN BUG IAXIS-13049 JRVG 15/07/2020
                // objUtiles.ejecutarFormulario("modal_axisadm001.do?cargaPersonas=true", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 
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
        
        function f_checkea_persona(tipo){
        
         if (tipo == 1)
            {
            document.getElementById("tomador").checked=true;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 2) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=true;
            document.getElementById("pagador").checked=false;
            }
         else if (tipo == 3) 
            {
            document.getElementById("tomador").checked=false;
            document.getElementById("asegurado").checked=false;
            document.getElementById("pagador").checked=true;
            }  
            
        objDom.setValorPorId("TIPO_PERS",tipo);
               
        }
        
        
        function f_asignaSPERSON(campo){
         objDom.setValorPorId("SPERSON",campo.value);
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
                
                objLista.borrarFilasDeLista ("DATOSPERSONA", "3", "<axis:alt f='axisadm001' c='DATOSPERSONA' lit='1000254'/>");
                
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
        function f_onclickCheckRebut(input){
            var LSSELRECIBOS = document.getElementById("LSSELRECIBOS").value;
            if (input.checked){
                if (LSSELRECIBOS.indexOf(input.value+",")==-1){
                    LSSELRECIBOS = LSSELRECIBOS + input.value+",";
                }
            }else {
                LSSELRECIBOS = LSSELRECIBOS.replace(input.value+",", "");
            }
            document.getElementById("LSSELRECIBOS").value = LSSELRECIBOS;
        }
        
        function f_revisarCheckRecibos(){
            if (document.getElementById("LSSELRECIBOS")!=null){
                var LSSELRECIBOS = document.getElementById("LSSELRECIBOS").value;
                if (!objUtiles.estaVacio(LSSELRECIBOS)){
                        var recibos = new Array();
                        recibos=LSSELRECIBOS.split(",");
                        for (i=0;i<recibos.length;i++)
                        {
                            if (document.getElementById('selCheckRebut_'+recibos[i]) !=null){
                                document.getElementById('selCheckRebut_'+recibos[i]).checked = "checked";
                            }
                        }
                }
                if (document.getElementById('CSELEC_ALL')!=null){
                    if (isAllChecked()){
                        document.getElementById('CSELEC_ALL').checked = true;
                    }else{
                        document.getElementById('CSELEC_ALL').checked = false;
                    }
                }
            }
        }
        function isAllChecked(){
            items =(document.getElementsByTagName("INPUT"));
            for (i=0;i<items.length;i++)  {
                        if (items[i].id.indexOf("selCheckRebut_")!=-1){
                            if (!items[i].checked){
                                return false;
                            }
                        }
                    }
            return true;
        }    
        function f_checkAllRecibos(check){
            items =(document.getElementsByTagName("INPUT"));
            if (items != null){
                if (check.checked){
                    for (i=0;i<items.length;i++)  {
                        if (items[i].id.indexOf("selCheckRebut_")!=-1){
                            items[i].checked = true;
                            f_onclickCheckRebut(items[i]);
                        }
                    }
                }else{
                    for (i=0;i<items.length;i++)  {
                        if (items[i].id.indexOf("selCheckRebut_")!=-1){
                            items[i].checked = false;
                            f_onclickCheckRebut(items[i]);
                        }
                    }
                }
            }
        }
        
        
        function f_cargar_ramos(){           
            var ccompani = objDom.getValorPorId("CEMPRES");
      	  	
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
            //objDom.setValorComponente(document.miForm.CRAMO, null);
            //objDom.setValorComponente(document.miForm.TRAMO, null);
            
            objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
        }
        
        function f_cargar_ramosCompani(){
            var ccompani = objDom.getValorPorId("CEMPRES");
      	  	
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
            objDom.setValorComponente(document.miForm.SPRODUC_SELEC, null);
            
            objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CEMPRES=" + ccompani, this, objJsMessages.jslit_cargando);
        }        
        
        function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
                    url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
                }
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
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
                    seleccionarOpcionCombo(objDom.getValorPorId("CRAMO"),RAMOSCombo);
                    f_cargar_productos();
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
                seleccionarOpcionCombo(objDom.getValorPorId("SPRODUC_SELEC"),SPRODUCCombo);
            }
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
                objAjax.invokeAsyncCGI("modal_axisadm001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function seleccionarOpcionCombo(elemento, combo) {      
      
               var cantidad = combo.length;
               for (i = 0; i < cantidad; i++) {
                  if (combo[i].value == elemento) {
                     combo[i].selected = true;
                  }   
               }
            }
           
        
    </script>
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()"<axis:visible f="axisadm001" c="BT_BUSCAR"> onkeypress="if (event.keyCode==13)  { f_but_buscar() }" </axis:visible>>
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axisadm001.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisadm001" c="TITULO" lit="1000552"/></c:param>
            <c:param name="formulario"><axis:alt f="axisadm001" c="TITULO" lit="1000552"/></c:param>
            <c:param name="form">axisadm001</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="titulo14" f="axisadm001" lit="1000234" /></c:param>
            <c:param name="nid" value="axisctr014" />
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>         
        <input type="hidden" name="NRECIBO2" id="NRECIBO2" value="${__formdata.NRECIBO2}"/>
        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}" id="CAGENTE">   
        <input type="hidden" name="LSSELRECIBOS" id="LSSELRECIBOS" value="${__formdata.LSSELRECIBOS}"/>
        
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="SPRODUC_SELEC" name="SPRODUC_SELEC" value="${__formdata.SPRODUC_SELEC}"/>
        <input type="hidden" id="TIPO_PERS" name="TIPO_PERS" value="${__formdata.TIPO_PERS}"/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" name="CCONDICION" id="CCONDICION" value="${__formdata.CCONDICION}" > 
        <input type="hidden" name="TCONDICION" id="TCONDICION" value="${__formdata.TCONDICION}" > 
        
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:15%;height:0%;"/>
                            <th style="width:20%;height:0%;"/>
                        </tr>
                        <tr>
                        <axis:ocultar f="axisadm001" c="CEMPRES" dejarHueco="false">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisadm001" c="EMPRESA" lit="101619"/></b> <%-- Empresa --%>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisadm001" c="CCOMPANIA" dejarHueco="false">                            
                             <td class="titulocaja" id="LIT_CCOMPANIA">
                                 <b><axis:alt f="axisadm001" c="CCOMPANIA" lit="9901223"/></b><%-- Compañia --%>                              
                             </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisadm001" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="CRAMO" lit="100784"></axis:alt></b>
                            </td>
                        </axis:ocultar>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisadm001" c="PRODUCTE" lit="100829"/></b> <%-- Producte --%>
                            </td>
                        <axis:ocultar f="axisadm001" c="NPOLIZA" dejarHueco="false">
                             <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="POLIZA" lit="100836"/></b> <%-- Pòlissa --%>
                                <b id="label_NCERTIF" style="visibility:hidden"><axis:alt f="axisadm001" c="CERTIFICADO" lit="101300"/></b> <%-- Certificat --%>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisadm001" c="CPOLCIA" dejarHueco="false">                            
                             <td class="titulocaja" id="LIT_CPOLCIA">
                                 <b><axis:alt f="axisadm001" c="CPOLCIA" lit="9001766"/></b><%-- Nº Póliza Compania --%>                              
                             </td>
                            </axis:ocultar> 
                        </tr>
                        <tr>
                           <axis:ocultar f="axisadm001" c="CEMPRES" dejarHueco="false">
                            <td class="campocaja" colspan="2">                                
                                <select name="CEMPRES" id="CEMPRES" onchange="f_onchange_empresa(this.value)" <axis:atr f="axisadm001" c="CEMPRES" a="obligatorio=false&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTEMPRESAS}">
                                        <option value = "${element.CEMPRES}"
                                        <c:if test="${__formdata.CEMPRES == element.CEMPRES}"> selected = "selected"</c:if> />
                                            ${element.TEMPRES} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CCOMPANIA" dejarHueco="false">                            
                             <td class="campocaja">
                                <select name="CCOMPANI" id ="CCOMPANI" <axis:atr f="axisadm001" c="CCOMPANI" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" onchange="f_cargar_ramosCompani()" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="CIA" items="${__formdata.CIAS}">
                                        <option value="${CIA.CCOMPANI}"
                                        <c:if test="${!empty __formdata.CCOMPANI && CIA.CCOMPANI == __formdata.CCOMPANI}"> selected </c:if>>
                                        ${CIA.TCOMPANI}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
			    
			    
			    
			    <axis:ocultar f="axisadm001" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                            </axis:ocultar>
                            <td class="campocaja" colspan="2">                                
                                <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" style="width:97%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPRODUCTOS}">
                                        <option value = "${element.SPRODUC}"
                                        <c:if test="${__formdata.SPRODUC == element.SPRODUC}"> selected = "selected"</c:if> />
                                            ${element.TTITULO} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>   
                            <axis:ocultar f="axisadm001" c="NPOLIZA" dejarHueco="false">
                             <td class="campocaja" >                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" 
                                style="width:70%;" onchange="f_onchange_NPOLIZA()" title="<axis:alt f="axisadm001" c="NPOLIZA" lit="100836"/>"
                                <axis:atr f="axisadm001" c="NPOLIZA" a="formato=entero&obligatorio=false"/> />
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERTIF}" name="NCERTIF" id="NCERTIF" 
                                style="width:20%;visibility:hidden" title="<axis:alt f="axisadm001" c="NCERTIFS" lit="1000348"/>"
                                <axis:atr f="axisadm001" c="NCERTIF" a="formato=entero"/> />
                            </td>
                            </axis:ocultar>
                                
                            <axis:ocultar f="axisadm001" c="CPOLCIA" dejarHueco="false">
                             <td class="campocaja">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA"
                                    style="width:91%;" title="<axis:alt f="axisadm001" c="CPOLCIA" lit="9001766"/>" />
                            </td>
                            </axis:ocultar> 
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm001" c="NRECIBO" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="REBUT" lit="800636"/></b> <%-- Nº Rebut --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CRECCIA" dejarHueco="false">                            
                             <td class="titulocaja" id="LIT_CRECCIA">
                                 <b><axis:alt f="axisadm001" c="CRECCIA" lit="9001763"/></b><%-- Nº Recibo Compania --%>                              
                             </td>
                            </axis:ocultar>                            
                            <axis:ocultar f="axisadm001" c="CTIPREC" dejarHueco="false">
                             <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="CTIPREC" lit="102302"/></b> <%-- Tipus de rebut --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CESTREC" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="ESTREBUT" lit="1000553"/></b> <%-- Estat rebut --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="LIQUIDAD" dejarHueco="false">                            
                             <td class="titulocaja" id="LIT_LIQUIDAD">
                                 <b><axis:alt f="axisadm001" c="LIQUIDAD" lit="9902071"/></b><%-- Liquidat --%>                              
                             </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CESTIMP" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm001" c="CESTIMP" lit="9001645"/></b> <%-- Estat rebut --%>
                                </td>
                            </axis:ocultar>
                           
                        </tr>
                        <tr>
                        <axis:ocultar f="axisadm001" c="NRECIBO" dejarHueco="false">
                         <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                style="width:91%;" title="<axis:alt f="axisadm001" c="NRECIBO" lit="800636"/>" <axis:atr f="axisadm001" c="NRECIBO" a="formato=entero"/> />
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisadm001" c="CRECCIA" dejarHueco="false">
                         <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CRECCIA}" name="CRECCIA" id="CRECCIA"
                                style="width:91%;" title="<axis:alt f="axisadm001" c="CRECCIA" lit="9001763"/>" <axis:atr f="axisadm001" c="CRECCIA"/> />
                        </td>
                        </axis:ocultar>                       
                        <axis:ocultar f="axisadm001" c="CTIPREC" dejarHueco="false">
                           <td class="campocaja">                                
                                <select name="CTIPREC" id="CTIPREC" size="1" <axis:atr f="axisadm001" c="CTIPREC" a="isInputText=false"/> class="campowidthselect campo campotexto" style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPREC}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CTIPREC == element.CATRIBU}"> selected = "selected"</c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                           </axis:ocultar> 
                           <axis:ocultar f="axisadm001" c="CESTREC" dejarHueco="false">
                           <td class="campocaja">                                
                                <select name="CESTREC" id="CESTREC" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisadm001" c="CESTREC" a="isInputText=false"/> style="width:94%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTADORECIBO}">
                                        <option value = "${element.CATRIBU}"
                                        <c:if test="${__formdata.CESTREC == element.CATRIBU}"> selected = "selected"</c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            <axis:ocultar f="axisadm001" c="LIQUIDAD" dejarHueco="false">                            
                             <td class="campocaja">
                                <select name="LIQUIDAD" id ="LIQUIDAD" <axis:atr f="axisadm001" c="LIQUIDAD" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:180px">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSLIQUIDAD}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.LIQUIDAD == element.CATRIBU}"> selected = "selected"</c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            </axis:ocultar> 
                            <axis:ocultar f="axisadm001" c="CESTIMP" dejarHueco="false">
                               <td class="campocaja">                                
                                    <select name="CESTIMP" id="CESTIMP" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisadm001" c="CESTIMP" a="isInputText=false"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTIMPREC}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CESTIMP == element.CATRIBU}"> selected = "selected"</c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>     
                             </axis:ocultar> 
                           
                        </tr>
                            
                            <axis:ocultar f="axisadm001" c="FEMISIOINI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="FEMISIOINI" lit="1000554"/></b> <%-- Data inici emissió --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEMISIOFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="FEMISIOFIN" lit="1000555"/></b> <%-- Data fi emissió --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEFEINI" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="FEFEINI" lit="1000556"/></b> <%-- Data inici efecte --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEFEFIN" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="FEFEFIN" lit="1000557"/></b> <%-- Data fi efecte --%>
                            </td>
                            </axis:ocultar>
                            
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                            <axis:ocultar f="axisadm001" c="NRECCAJ" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="NRECCAJ" lit="9910167"/></b>
                            </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="CMRECA" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="CMRECA" lit="9910168"/></b>
                            </td>
                            </axis:ocultar>
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                        </tr>
                        <tr>
                        
                                 
                            <axis:ocultar f="axisadm001" c="FEMISIOINI" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOINI}"/>" name="FEMISIOINI" id="FEMISIOINI"
                                title="<axis:alt f="axisadm001" c="FEMISIOINI2" lit="FEMISIOINI"/>"
                                <axis:atr f="axisadm001" c="FEMISIOINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOINI" alt="<axis:alt f="axisadm001" c="FEMISIOINI3" lit="108341"/>" title="<axis:alt f="axisadm001" c="FEMISIOINI" lit="1000554"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEMISIOFIN" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIOFIN}"/>" name="FEMISIOFIN" id="FEMISIOFIN"
                                title="<axis:alt f='axisadm001' c='FEMISIONFIN2' lit='FEMISIOFIN'/>"
                                <axis:atr f="axisadm001" c="FEMISIOFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEMISIOFIN" alt="<axis:alt f="axisadm001" c="CAMPO001" lit="108341"/>" title="<axis:alt f="axisadm001" c="CAMPO002" lit="1000555"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEFEINI" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEINI}"/>" name="FEFEINI" id="FEFEINI"
                                title="<axis:alt f="axisadm001" c="FEFEINI" lit="1000556"/>"
                                <axis:atr f="axisadm001" c="FEFEINI" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEFEINI" alt="<axis:alt f="axisadm001" c="FEFEINI3" lit="108341"/>" title="<axis:alt f="axisadm001" c="FEFEINI2" lit="1000556"/>" src="images/calendar.gif"/></a>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="FEFEFIN" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:75%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFEFIN}"/>" name="FEFEFIN" id="FEFEFIN"
                                title="<axis:alt f="axisadm001" c="FEFEFIN" lit="1000557"/>"
                                <axis:atr f="axisadm001" c="FEFEFIN" a="formato=fecha"/> /><a style="vertical-align:middle;"><img
                                id="icon_FEFEFIN" alt="<axis:alt f="axisadm001" c="FEFEINI3" lit="108341"/>" title="<axis:alt f="axisadm001" c="FEFEFIN" lit="1000557"/>" src="images/calendar.gif"/></a>
                            </td>          
                            </axis:ocultar>
                            
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                            <axis:ocultar f="axisadm001" c="NRECCAJ" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto"
                                       value="${__formdata.NRECCAJ}" name="NRECCAJ" id="NRECCAJ"
                                       title="<axis:alt f="axisadm001" c="NRECCAJ" lit="9910167"/>"
                                </input>
                            </td>          
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="CMRECA" dejarHueco="false">
                            <td class="campocaja">                             
                                <select name="CMRECA" id ="CMRECA" <axis:atr f="axisadm001" c="CMRECA" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSCMRECA}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CMRECA == element.CATRIBU}"> selected = "selected"</c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                    </c:forEach>
                                </select>                                
                            </td>          
                            </axis:ocultar>
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->                            
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm001" c="LSNEGOCIO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b id="label_LSNEGOCIO"><axis:alt c="LSNEGOCIO" f="axisadm001" lit="9904000" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="NANUALI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b id="label_NANUALI"><axis:alt c="NANUALI" f="axisadm001" lit="9904001" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="NFRACCI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b id="label_NFRACCI"><axis:alt c="NFRACCI" f="axisadm001" lit="9903786" /></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CTIPAGE01" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTIPAGE01">
                                    <b id="label_CTIPAGE01"><axis:alt c="CTIPAGE01" f="axisadm001" lit="9904541"/></b>
                                </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm001" c="LSNEGOCIO" dejarHueco="false">                            
                                <td class="campocaja" >
                                    <select name="LSNEGOCIO" id ="LSNEGOCIO" <axis:atr f="axisadm001" c="LSNEGOCIO" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSNEGOCIO}">
                                                <option value = "${element.CATRIBU}"
                                                <c:if test="${__formdata.LSNEGOCIO == element.CATRIBU}"> selected = "selected"</c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="NANUALI" dejarHueco="false">
                                <td class="campocaja" >                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NANUALI}" name="NANUALI" id="NANUALI" formato="entero"
                                    style="width:90%;" title="<axis:alt f="axisadm001" c="NANUALI" lit="9904001"/>" <axis:atr f="axisadm001" c="NANUALI" /> />
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="NFRACCI" dejarHueco="false">
                                <td class="campocaja" >                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFRACCI}" name="NFRACCI" id="NFRACCI" formato="entero"
                                    style="width:90%;" title="<axis:alt f="axisadm001" c="NFRACCI" lit="9903786"/>" <axis:atr f="axisadm001" c="NFRACCI" /> />
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CTIPAGE01" dejarHueco="false">                            
                             <td class="campocaja"> 
                                <select name="LSREGIONAL" id="LSREGIONAL" <axis:atr f="axisadm001" c="LSREGIONAL"  a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" >
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSREGIONAL}">
                                            <option value = "${element.CAGENTE}"
                                            <c:if test="${__formdata.LSREGIONAL == element.CAGENTE}">selected</c:if>>
                                                ${element.TAGENTE} 
                                            </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                          
                            <axis:ocultar f="axisadm001" c="LSAGENTESTIPO" dejarHueco="false">                            
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisadm001" c="LSAGENTESTIPO" lit="9000436"/></b>                             
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="LSAGENTE" dejarHueco="false">                            
                                <td class="titulocaja"  colspan="2">
                                    <b><axis:alt f="axisadm001" c="LSAGENTE" lit="100584"/></b>                             
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CAGENTE" dejarHueco="false"> 
                                <td class="titulocaja" colspan="3">
                                    <b><axis:alt  c="CAGENTE" f="axisadm001" lit="100584"/></b>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="LSMEDIO" dejarHueco="false">                            
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisadm001" c="LSMEDIO" lit="9902444"/></b>                              
                                </td>
                            </axis:ocultar>
                            
                        </tr>  
                       
                        <tr>
                            

                            <axis:ocultar f="axisadm001" c="LSAGENTESTIPO" dejarHueco="false">                            
                             <td class="campocaja" colspan="2"> 
                                <select name="LSAGENTESTIPO" id ="LSAGENTESTIPO" <axis:atr f="axisadm001" c="LSAGENTESTIPO" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSAGENTESTIPO}">
                                            <option value = "${element.CAGENTE}"
                                            <c:if test="${__formdata.LSAGENTESTIPO == element.CAGENTE}">selected</c:if>>
                                                ${element.TAGENTE} 
                                            </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="LSAGENTE" dejarHueco="false">                            
                             <td class="campocaja" colspan="2">
                                <select name="LSAGENTE" id ="LSAGENTE" <axis:atr f="axisadm001" c="LSAGENTE" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSAGENTE}">
                                            <option value = "${element.CODI}"
                                            <c:if test="${__formdata.LSAGENTE == element.CODI}"> selected = "selected"</c:if> />
                                                ${element.NOMBRE} 
                                            </option>
                                        </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="CAGENTE" dejarHueco="false">
                                <td class="campocaja" colspan="3">
                                    <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${__formdata.CAGENTE_TEXT}" class="campowidthinput campo campotexto" style="width:20%"
                                     title="<axis:alt  c="CAGENTE" f="axisadm001" lit="100584"/>" 
                                    onchange="f_actualizar_agente()" />
                                    <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}"  style="width:70%" class="campowidthinput campo campotexto"/>
                                </td> 
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="LSMEDIO" dejarHueco="false">                            
                             <td class="campocaja" >
                                <select name="LSMEDIO" id ="LSMEDIO" <axis:atr f="axisadm001" c="LSMEDIO" a="obligatorio=false&modificable=true&isInputText=false"/> size="1" class="campowidthselect campo campotexto" style="width:94%;">
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSMEDIO}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.LSMEDIO == element.CATRIBU}"> selected = "selected"</c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                           
                        </tr>
                        <tr>
                            <!-- BFP bug:20326/99335 -->
                            <axis:ocultar f="axisadm001" c="CBANCO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm001" c="CBANCO" lit="9000964"/></b>   <%-- Banco --%>
                                </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="CTIPCUENTA" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm001" c="CTIPCUENTA" lit="1000374"/></b>   <%-- Tipo de cuenta --%>
                                </td>
                            </axis:ocultar>
                            <!-- fi BFP bug:20326/99335 -->
                            <axis:ocultar f="axisadm001" c="COBBAN" dejarHueco="true"> <!-- TODO C -->
                                <td class="titulocaja">
                                    <b id="label_COBBAN"><axis:alt c="COBBAN" f="axisadm001" lit="100879" /></b>
                                </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="REBUT_INI" dejarHueco="true" > 
                                <td class="titulocaja" colspan="2">
                                    <b id="label_REBUT_INI"><axis:alt c="REBUT_INI" f="axisadm001" lit="9902317" /></b>
                                </td>
                            </axis:ocultar>                            
                            <axis:ocultar f="axisadm001" c="DOMICILIADO" dejarHueco="false">                            
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisadm001" c="DOMICILIADO" lit="9902262"/></b>                              
                                </td>
                            </axis:ocultar>
                            
                        </tr>
                        <!-- BFP bug:20326/99335 -->
                        <tr>
                            <axis:ocultar f="axisadm001" c="CBANCO" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CBANCO" id ="CBANCO" size="1" class="campo campotexto" style="width:90%" 
                                    title="<axis:alt f="axisadm001" c="CBANCO" lit="9000964"/>" 
                                    <axis:atr f="axisadm001" c="CBANCO" a="isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="CBANCO2" lit="1000348"/> - </option>
                                        <c:forEach items="${sessionScope.DOM_LSTCBANCO}" var="item">
                                            <option value = "${item.CBANCO}" <c:if test="${__formdata.CBANCO != 'null' && __formdata.CBANCO == item.CBANCO}"> selected </c:if>>${item.TBANCO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                          <!-- BFP Modificació  bug:20326 19/12/2011--> 
                           <axis:ocultar f="axisadm001" c="CTIPCUENTA" dejarHueco="false">
                                <td class="campocaja">                                                      <!-- style = "width.90%" -->
                                    <select name="CTIPCUENTA" id ="CTIPCUENTA" size="1" class="campo campotexto" style="width:220px" 
                                    title="<axis:alt f="axisadm001" c="CTIPCUENTA" lit="1000374"/>" 
                                    <axis:atr f="axisadm001" c="CTIPCUENTA" a="isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="CTIPCUENTA2" lit="1000348"/> - </option>
                                        <c:forEach items="${sessionScope.DOM_LSTCTIPCUENTA}" var="item">
                                            <option value = "${item.CTIPBAN}" <c:if test="${__formdata.CTIPCUENTA != 'null' && __formdata.CTIPCUENTA == item.CTIPBAN}"> selected </c:if>>${item.TTIPO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            <!-- BFP Modificació  bug:20326 19/12/2011--> 
                            <axis:ocultar f="axisadm001" c="COBBAN" dejarHueco="false"> <!-- TODO C -->
                                <td class="campocaja">    
                                    <select title="<axis:alt c="COBBAN" f="axisadm001" lit='100879' />" alt="<axis:alt c="COBBAN" f="axisadm001" lit='100879' />" name = "list_COBBANCARIO" id="list_COBBANCARIO" size="1" 
                                        class="campowidthselect campo campotexto" style="width:200px;"
                                        <axis:atr f="axisadm001" c="COBBAN" a="modificable=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm001" c="COBBAN" lit="1000348"/> - </option>
                                        <c:forEach var="cobradores" items="${__formdata.LISTVALORES.LSTCOBRADORES}">
                                            <option value = "${cobradores.CCOBBAN}"
                                                <c:choose>
                                                    <c:when test="${OB_IAX_RECIBOS.CCOBBAN == cobradores.CCOBBAN || __formdata.CCOBBAN==cobradores.CCOBBAN }">selected</c:when>
                                                </c:choose>>
                                                ${cobradores.DESCRIPCION}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar>
                            
                            <axis:ocultar f="axisadm001" c="REBUT_INI" dejarHueco="false">
                                <td class="campocaja" colspan ="2">                             
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.REBUT_INI}" name="REBUT_INI" id="REBUT_INI"
                                    style="width:90%;" title="<axis:alt f="axisadm001" c="REBUT_INI" lit="9902317"/>" <axis:atr f="axisadm001" c="REBUT_INI" /> />
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="DOMICILIADOSI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm001" c="DOMICILIADOSI" lit="9902445"/></b>                                
                                    <input type="radio" id="DOMICILIADOSI" name="DOMICILIADOSI" onclick="javascript: if (DOMICILIADOSI.checked) DOMICILIADONO.checked =! DOMICILIADOSI.checked"                                
                                    <c:if test="${__formdata['DOMICILIADOSI'] == 'on'}"> checked </c:if>/>                                    
                                </td>
                            </axis:ocultar>
                            
                           
                            
                            
                        </tr>
                        <!-- fi BFP bug:20326/99335 -->
                        <tr>
                               <td class="titulocaja" colspan = "5">
                         <axis:ocultar f="axisadm001" c="DOMICILIADONO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisadm001" c="DOMICILIADONO" lit="101779"/></b>                                
                                    <input type="radio" id="DOMICILIADONO" name="DOMICILIADONO" onclick="javascript: if (DOMICILIADONO.checked) DOMICILIADOSI.checked =! DOMICILIADONO.checked"
                                    <c:if test="${__formdata['DOMICILIADONO'] == 'on'}">checked</c:if>/>
                                </td>
                            </axis:ocultar>
                        </tr>
                        
                 
                    </table>
                </td>
            </tr>
            <tr>
                <td>
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
                            <axis:ocultar f="axisadm001" c="NNUMIDE" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="NNUMIDE" lit="105330"/></b> <%-- Nº identificatiu --%>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="TNOMBRE" dejarHueco="false">
                            <%--INI BUG IAXIS-13049 JRVG 15/07/2020 --%>
                            <td class="titulocaja" colspan="3">
                                <b><axis:alt f="axisadm001" c="TNOMBRE2" lit="105940"/></b> 
                            </td>
                            <%--FIN BUG IAXIS-13049 JRVG 15/07/2020 --%>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="PRENADOR" lit="101027"/></b> <%-- Prenedor --%>
                            </td>                            
                            <td class="titulocaja">
                                <input type="radio" id="tomador" name="tomador" onclick="f_checkea_persona(1)"                                
                                <c:if test="${__formdata['tomador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <axis:ocultar f="axisadm001" c="NNUMIDE" dejarHueco="false">
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" 
                                <axis:atr f="axisadm001" c="NNUMIDE" a="obligatorio=false"/> onchange="f_cargar_DATOSPERSONA()" style="width:50%;"
                                title="<axis:alt f="axisadm001" c="NNUMIDE2" lit="1000559"/>" />
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="TNOMBRE" dejarHueco="false">
                            <td class="campocaja" colspan="3">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                <axis:atr f="axisadm001" c="TNOMBRE" a="obligatorio=false"/>  onchange="f_cargar_DATOSPERSONA()"  style="width:80%;"/>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisadm001" c="TIPOPER" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="CAMPO003" lit="101028"/></b> <%-- Assegurat --%>                                
                            </td>
                                       
                            <td class="titulocaja">
                                <input type="radio" id="asegurado" name="asegurado" onclick="f_checkea_persona(2)"
                                <c:if test="${__formdata['asegurado'] == 'on'}">checked</c:if>/>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                         <td class="titulocaja" colspan = "4">
                         <axis:ocultar f="axisadm001" c="PAGADOR" dejarHueco="false">     
                            <td class="titulocaja">
                                <b><axis:alt f="axisadm001" c="PAGADOR" lit="9903157"/></b> <%-- Pagador --%>
                            </td>                 
                             <td class="titulocaja">
                                <input type="radio" id="pagador" name="pagador" onclick="f_checkea_persona(3)"                               
                                <c:if test="${__formdata['pagador'] == 'on'}"> checked </c:if>/>                                    
                            </td>
                         </axis:ocultar>
                        </tr>
                        <tr>
                            <td align="center" colspan="5">
                                <div class="separador">&nbsp;</div>
                                <axis:ocultar f="axisadm001" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axisadm001" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                </axis:ocultar>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <axis:ocultar f="axisadm001" c="BT_BUSCAR_PER" dejarHueco="false">
                                <input type="button" class="boton" value="<axis:alt f="axisadm001" c="CAMPO005" lit="1000065"/>" onclick="f_cargar_DATOSPERSONA()" />
                                </axis:ocultar>
                                <div class="separador">&nbsp;</div>
                            </td>
                            
                          
                          
                        </tr>
                        <axis:ocultar f="axisadm001" c="DSP_DATPERSON" dejarHueco="false"> 
                        <tr>
                            <td colspan="6">
                                <c:set var="title1"><axis:alt f="axisadm001" c="CAMPO006" lit="800440"/></c:set> <%-- Nº --%>
                                <c:set var="title2"><axis:alt f="axisadm001" c="CAMPO007" lit="105940"/></c:set> <%-- Nom --%>
                                <div class="displayspace">
                                    <display:table name="${DATOSPERSONA}" id="DATOSPERSONA" export="false" class="dsptgtable" 
                                    pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                    requestURI="modal_axisadm001.do?paginar=true">
                                        <%@ include file="../include/displaytag.jsp"%>
                                        <display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                            <div class="dspIcons">
                                                <input value="${DATOSPERSONA.CODI}" type="radio" id="radioSPERSON" name="radioSPERSON" onclick="f_asignaSPERSON(this)"/>
                                            </div>
                                        </display:column>
                                        <%--display:column title="${title1}" sortable="true" sortProperty="SPERSON" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.SPERSON}</div>
                                        </display:column--%>
                                        <display:column title="${title1}" sortable="true" sortProperty="VALOR" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.VALOR}</div>
                                        </display:column>
                                        <display:column title="${title2}" sortable="true" sortProperty="TEXTO" headerClass="sortable"  media="html" autolink="false" >                                    
                                            <div class="dspText">${DATOSPERSONA.TEXTO}</div>
                                        </display:column>
                                    </display:table>
                                </div>
                            </td>
                        </tr> 
                      </axis:ocultar>                
                    </table>
                </td>
            </tr>
            
            
        
         <axis:ocultar f="axisadm001" c="DSP_RESULTATS" dejarHueco="false">
          <%--Nova secció resultat de la recerca --%>
          <tr>
           <td>
            <div class="separador">&nbsp;</div>
              <table class="seccion" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><b><axis:alt f="axisadm001" c="CAMPO008" lit="1000343"/>&nbsp; </b>                            
                        </div>
                        <div class="separador">&nbsp;</div>
                        <c:set var="title0"><axis:alt f="axisadm001" c="NUMERO" lit="800440"/></c:set>   <%-- Nº --%>
                        <c:set var="title1"><axis:alt f="axisadm001" c="PRODUCTO" lit="100829"/></c:set>   <%-- Producte --%>
                        <c:set var="title2"><axis:alt f="axisadm001" c="DELEGA" lit="1000561"/></c:set>  <%-- Delegació --%>
                        <c:set var="title3"><axis:alt f="axisadm001" c="AGENTE" lit="100584"/></c:set>   <%-- Agent --%>
                        <c:set var="title4"><axis:alt f="axisadm001" c="PRENADOR" lit="101027"/></c:set>   <%-- Prenedor --%>
                        <c:set var="title5"><axis:alt f="axisadm001" c="FEMISIO" lit="1000562"/></c:set>  <%-- Data emissió --%>
                        <c:set var="title6"><axis:alt f="axisadm001" c="FEFECTE" lit="100883"/></c:set>   <%-- Data efecte --%>
                        <c:set var="title7"><axis:alt f="axisadm001" c="FVENCIMIENTO" lit="100885"/></c:set>   <%-- Data venciment --%>
                        <c:set var="title8"><axis:alt f="axisadm001" c="TREBUT" lit="1000563"/></c:set>  <%-- Total rebut --%>
                        <c:set var="title9"><axis:alt f="axisadm001" c="TIPOREBUT" lit="102302"/></c:set>   <%-- Tipo de rebut --%>
                        <c:set var="title10"><axis:alt f="axisadm001" c="ESTREBUT" lit="1000553"/></c:set> <%-- Estat rebut --%>
                        <c:set var="title11"><axis:alt f="axisadm001" c="NCOMPANI" lit="9001763"/></c:set> <%-- Nº Rec. Compani --%>
                        <c:set var="title12"> <input type="checkbox" id="CSELEC_ALL" name="CSELEC_ALL" onclick="f_checkAllRecibos(this)"/></c:set>
                        
                        <div id="dt_recibos" class="seccion displayspace">
                            <display:table name="${sessionScope.REC_LSTRECIBOS}" id="LSTRECIBOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                 requestURI="modal_axisadm001.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <axis:visible f="axisadm001" c="RADIO">
                                <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                    <div class="dspIcons">
                                        <input type="radio" name="selRadioRebut"  <c:if test="${LSTRECIBOS.NRECIBO == __formdata.NRECIBO2}">checked</c:if> value="${LSTRECIBOS.NRECIBO}" onclick="objDom.setValorPorId('NRECIBO2', this.value)"/>
                                    </div>
                                </display:column>
                                </axis:visible>
                                <axis:visible f="axisadm001" c="CHECK">
                                 <display:column title="${title12}" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                    <div class="dspNumber">
                                        <input type="checkbox" name="selCheckRebut_${LSTRECIBOS.NRECIBO}" id="selCheckRebut_${LSTRECIBOS.NRECIBO}"  value="${LSTRECIBOS.NRECIBO}" onclick="f_onclickCheckRebut(this)"/>
                                    </div>
                                </display:column>
                                </axis:visible>
                                <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspNumber">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            ${LSTRECIBOS.NRECIBO}
                                    </a></div>
                                </display:column>                                
                                <axis:visible f="axisadm001" c="CRECCIA">
                                    <display:column title="${title11}" sortable="true" sortProperty="CRECCIA" headerClass="sortable fixed"  media="html" autolink="false" >
                                        <div class="dspText">
                                            <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                                ${LSTRECIBOS.CRECCIA}
                                        </a></div>                                
                                    </display:column>
                                </axis:visible>                                
                                <display:column title="${title1}" sortable="true" sortProperty="TSPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            ${LSTRECIBOS.TSPRODUC}
                                    </a></div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="TAGENTE" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                            ${LSTRECIBOS.TAGENTE}
                                    </div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="NOM_TOMADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            ${LSTRECIBOS.NOM_TOMADOR}
                                    </a></div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEFECTO}"/>
                                    </a></div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FVENCIM}"/>
                                    </a></div>
                                </display:column>
                                <display:column title="${title8}" sortable="true" sortProperty="TOTAL_RECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspNumber">
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            ${LSTRECIBOS.TOTAL_RECIBO}
                                    </a></div>
                                </display:column>
                                <display:column title="${title10}" sortable="true" sortProperty="TESTREC" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        <%-- <a href="javascript:f_ver_detalle('${LSTRECIBOS.NRECIBO}')" <c:if test="${LSTRECIBOS.CESTREC == 0}">class="dspTextAviso"</c:if> <c:if test="${LSTRECIBOS.CESTREC != 0}">class="dspText"</c:if>> --%>
                                        <a href="javascript:objDom.setValorPorId('NRECIBO2','${LSTRECIBOS.NRECIBO}');f_but_aceptar()">
                                            ${LSTRECIBOS.TESTREC}
                                        </a>
                                    </div>
                                </display:column>
                                
                            </display:table>
                            
                        </div>
                    </td>
                </tr>
            </table>              
       </td>
      </tr>
          </axis:ocultar>           
                        
                        
          <%--Fi nova secció resultat de la recerca --%>

        </table>
        
      
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar<axis:visible f="axisadm001" c="BT_BUSCAR">,buscar</axis:visible><axis:visible f="axisadm001" c="BT_BUSCAR_TRANSF_REBUTS">,100797</axis:visible><axis:visible f="axisadm001" c="BT_ACEPTAR_TRANSF_REBUTS">,aceptar</axis:visible></c:param>
            <c:param name="f">axisadm001</c:param>
        </c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEMISIOINI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEMISIOINI", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FEMISIOFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEMISIOFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEINI",  
            singleClick    :    true,
            firstDay       :    1
        });
        
         Calendar.setup({
            inputField     :    "FEFEFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FEFEFIN",  
            singleClick    :    true,
            firstDay       :    1
        });        
    </script>

</body>
</html>