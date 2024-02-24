<%/**
*  Fichero: axislist001.jsp
*    
*  Pantalla principal de 'Análisis de listados'
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<% System.out.println("******************************************* 1");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axislist001" c="CIDENTITY" lit="109808"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
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
        
        <script type="text/javascript">

        function f_onload(){
                
                revisarEstilos();
                f_carga_dependencias();
                f_cargar_propiedades_pantalla();
                 var val1 = "<%=request.getAttribute("OK")%>"; 
           
                 if (val1=="OK"){
                 alert('<axis:alt f="axislist001" c="MENSA3" lit="107913"/> - <axis:alt f="axislist001" c="MENSA4" lit="9901094"/>');
                //this.f_but_cancelar();
                 }
            
        }
        
<% System.out.println("******************************************* 2");%>
        function f_abrir_axissin035(){
            objUtiles.abrirModal("axissin035","src","axis_axissin035.do?operation=form&SINIESTRO=Si"); 
        }
        
        function f_aceptar_axissin035(CODIGO, TEXTO){
            try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }
                catch(e){alert(e);}
            f_cerrar_axissin035();    
        }
        
        function f_abrir_axissin004() {
           objUtiles.abrirModal("axissin004", "src", "modal_axissin004.do?operation=form&SSEGURO=" + document.miForm.SSEGURO.value);
        }
       
       
        function f_cerrar_axisimprimir(){
            objUtiles.cerrarModal("axisimprimir");
            //f_but_salir()
        }
                
        function f_aceptar_axissin002(NSINIES, SSEGURO) {
           f_cerrar_axissin002();
           objDom.setValorPorId("NSINIES", NSINIES);
           objDom.setValorPorId("SSEGURO", SSEGURO);
           // Salto a flujo consulta de siniestros
           objUtiles.f_GuardaCasillasChecked("selectedDocu", "selectedDocumentacion");
           objUtiles.f_GuardaCasillasChecked("radioGarant", "selectedGarantias");
           objUtiles.ejecutarFormulario ("axis_axislist001.do", "consultarSiniestros", document.miForm, "_self", objJsMessages.jslit_cargando);     
        }
        
       
        function f_but_siguiente() {
            f_abrir_axisctr019();
        }
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }
        
        function f_but_151477() {
            objUtiles.f_GuardaCasillasChecked("selectedDocu", "selectedDocumentacion");
            objUtiles.f_GuardaCasillasChecked("radioGarant", "selectedGarantias");
            objUtiles.ejecutarFormulario("axis_axislist001.do", "consultarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
          function f_imprimir_fitxer(pfitxer){
                //alert(pfitxer);
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            } 
        
        function f_but_109006(){
           
            var filas = document.miForm.TOTAL_FILAS.value;
            
            //alert(filas);
            var valor = 0;
            var cadena ="";
          
           for (i = 0; i < filas; i++) {
           
                //alert(i);
                  var valor = eval("document.miForm.CHK_"+i+".checked");
                  //alert(valor);
                  if (valor == true ){
                  
                    if(cadena==""){
                        cadena = eval("document.miForm.NORDEN_"+i+".value");
                    }else{
                        cadena = cadena + ","+ eval("document.miForm.NORDEN_"+i+".value"); 
                    }
                  }

            
           }
            
                       //alert("cadena final:" + cadena);
            if (objValidador.validaEntrada()) { 
               
                //alert(document.miForm.NPERIOD.value);
                //alert(document.miForm.NMES.value);

                // -- Bug 0016529 - 29/12/2010 - JMF
                if(document.miForm.NPERIOD.value!=null && document.miForm.NMES.value == 'null' && (document.miForm.NPERIOD.value=='1'|| document.miForm.NPERIOD.value=='2' || document.miForm.NPERIOD.value=='3')){
                          alert('<axis:alt f="axislist001" c="ALERT_1" lit="9000505"/>: <axis:alt f="axislist001" c="ALERT_2" lit="9000495"/>');
                }else{
                      if (document.miForm.NPERIOD.value=='4' && (document.miForm.FINICIO.value == '' || document.miForm.FINICIO.value=='null') ) {
                          alert('<axis:alt f="axislist001" c="ALERT_3" lit="9000505"/>: <axis:alt f="axislist001" c="ALERT_4" lit="9000526"/>');
                      }else{                
                          if (document.miForm.NPERIOD.value=='4' && (document.miForm.FFIN.value == '' || document.miForm.FFIN.value == 'null') ) {
                             alert('<axis:alt f="axislist001" c="ALERT_5" lit="9000505"/>: <axis:alt f="axislist001" c="ALERT_6" lit="9000527"/>');
                          }else{  
                          	
                          	if (!objUtiles.estaVacio(document.miForm.CTIPO) && !objUtiles.estaVacio(document.miForm.TIPOZONA) ){
                             var parametros = "&SPRODUC=" +document.miForm.SPRODUC.value + "&SPERSON=" +document.miForm.SPERSON.value + "&FINICIO=" +document.miForm.FINICIO.value + "&FFIN=" +document.miForm.FFIN.value  + "&NPERIOD=" +document.miForm.NPERIOD.value + "&CTIPO=" +document.miForm.CTIPO.value + "&TIPOZONA=" +document.miForm.TIPOZONA.value + "&CADENA=" + cadena + "&CNEGOCIO=" +document.miForm.CNEGOCIO.value + "&NANYO=" +document.miForm.NANYO.value + "&NMES=" +document.miForm.NMES.value;
                            }else{
                            	var parametros = "&SPRODUC=" +document.miForm.SPRODUC.value + "&SPERSON=" +document.miForm.SPERSON.value + "&FINICIO=" +document.miForm.FINICIO.value + "&FFIN=" +document.miForm.FFIN.value  + "&NPERIOD=" +document.miForm.NPERIOD.value + "&CADENA=" + cadena + "&CNEGOCIO=" +document.miForm.CNEGOCIO.value + "&NANYO=" +document.miForm.NANYO.value + "&NMES=" +document.miForm.NMES.value;
                            }
                            	
                             objAjax.invokeAsyncCGI("axis_axislist001.do", callbackAjaxEjecutar, "operation=ajax_ejecutar&INFORME=" + document.miForm.INFORME.value + parametros, this, objJsMessages.jslit_actualizando_registro);
                          }
                      }
                }
            }
        }
        
        
        function f_but_consultar_siniestros() {
            objUtiles.abrirModal("axissin002","src","modal_axissin006.do?operation=form&MODO=APERTURASINIESTROS&NPOLIZA=" + objDom.getValorPorId("NPOLIZA") + "&NCERTIF=" + objDom.getValorPorId("NCERTIF"));
        } 
        
        function f_seleccionar_riesgo(obj, valor){
            if(objDom.getComponenteMarcado(obj))
                objDom.setValorPorId("SRIESGO", valor);
            else objDom.setValorPorId("SRIESGO", "");
        }
        
        
        
        function f_seleccionar_todos(seleccionarTodos) {
                var inputs=document.getElementsByTagName("input"); // es getElementsByTagName o getElementsByName 
                    
                    for (icont=0;icont<inputs.length;icont++) 
                      {
                        if (inputs[icont].name.indexOf('CHK_')>=0) 
                          {     
                          
                           var pos = inputs[icont].name.indexOf('_');
                           var paramNlinea = inputs[icont].name.substr(pos+1,inputs[icont].name.length-pos);
                            
                            if (seleccionarTodos) {
                                inputs[icont].checked=true; // es checked o selected
                               
                                }
                            else {
                                inputs[icont].checked=false; // es checked o selected
                                                         
                                 }    
                                 
                          } 
                     }       
             }
        
        
        /* ***************************************************************************************** */
        /* ************************************* FUNCIONES AJAX ************************************ */
        /* ***************************************************************************************** */
        
        
        
        function callbackAjaxEjecutar(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            //alert(ajaxResponseText);
            try{
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("RETURN")[0])){
                     
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0])) {
                            
                            var RETURN = doc.getElementsByTagName("RETURN")[0].childNodes[0].nodeValue;  
                            alert('<axis:alt f="axislist001" c="ALERT_OK" lit="109904"/>');
                        
                        }
                        
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("P_FGENERADO")[0])) {
                            var FICHERO = doc.getElementsByTagName("P_FGENERADO")[0].childNodes[0].nodeValue;  
                            document.miForm.FICHERO.value=FICHERO;
                        }
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }


//objDom.setValorPorId("CTIPIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0));


   
        function f_carga_garantias(FSINIES, CCAUSIN, CMOTSIN){
           // objValidador.validaEntrada();

            //Buscar riesgo seleccionado
            var tableM = document.getElementById("miListaId2");
            var tbodyM = tableM.getElementsByTagName("tbody")[0];
            var trM = tbodyM.getElementsByTagName("tr");
            
            if(!objLista.listaVacia(trM)){
                var riesgo = objDom.getValorPorId("SRIESGO");
                if(objUtiles.estaVacio(riesgo)){
                    alert(objJsMessages.jslit_selecciona_riesgo);
                }else
                    //objUtiles.ejecutarFormulario("axis_axislist001.do", "cambiar_fecha_siniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
                    
                    if (CMOTSIN == 'null') CMOTSIN = '';
                    if (CCAUSIN == 'null') CCAUSIN = '';
                    
                     if (!objUtiles.estaVacio(FSINIES) && !objUtiles.estaVacio(CMOTSIN) && !objUtiles.estaVacio(CCAUSIN) ){
                     
                        document.getElementById("TFINBAJA").style.display ="none"; 
                        document.getElementById("FINBAJA").style.display ="none";
                        document.getElementById("TDIA").style.display ="none";
                        document.getElementById("DIA").style.display ="none";
                     
                        objAjax.invokeAsyncCGI("axis_axislist001.do", callbackajaxcambiarfechasiniestro, 
                        "operation=cambiar_fecha_siniestro&CMOTSIN=" + 
                        CMOTSIN+"&CCAUSIN=" + CCAUSIN+"&SSEGURO=" + 
                        objDom.getValorPorId("SSEGURO") +"&SRIESGO=" + riesgo +
                        "&FSINIES=" + FSINIES, this, objJsMessages.jslit_cargando);
                    }
            }else{
                alert(objJsMessages.jslit_no_riesgos);
            }
        }
        
        function callbackajaxcambiarfechasiniestro(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            //alert(ajaxResponseText);
            try{
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    //Vaciar lista de garantias, si hay
                    objLista.borrarFilasDeLista ("miListaId3", "3", "<axis:alt f="axislist001" c="ALERT_UN" lit="1000254"/>");
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var tableadded = document.getElementById("miListaId3");
                            var tbodyadded = tableadded.getElementsByTagName("tbody")[0];
                            var tradded = tbodyadded.getElementsByTagName("tr");
                            
                            // Si no hay registros, mostramos la lista para poder rellenar
                            objLista.borrarFilaVacia(tbodyadded, tradded);
                            
                            // Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(3);
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            var cgarant = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0].childNodes[0].nodeValue : "");
                            var tgarant = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0].childNodes[0].nodeValue : "");
                            var icapital = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("ICAPITAL")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("ICAPITAL")[0].childNodes[0].nodeValue : "");
                            
                            icapital = validarNumeros(objNumero.toDoNumberView(icapital));        
                            
                            newtd[0] = objLista.addCheckBoxEnLista("radioGarant", cgarant, "f_tipogarant(this)");                                    
                            newtd[1] = objLista.addTextoEnLista(tgarant);
                            <axis:visible c="ICAPITAL" f="axislist001">
                            newtd[2] = objLista.addNumeroEnLista(icapital);
                            </axis:visible>
                        
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbodyadded);
                        }
                    }
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
 <% System.out.println("******************************************* 4");%>           
        function f_cambia_causa(obj){
          //  objValidador.validaEntrada();
            if (obj.value != "null"){
            
                document.getElementById("TFINBAJA").style.display ="none"; 
                document.getElementById("FINBAJA").style.display ="none";
                document.getElementById("FFINBAJA").setAttribute('obligatorio','false'); 
                document.getElementById("TDIA").style.display ="none";
                document.getElementById("DIA").style.display ="none";
            
                SPRODUC= '${__formdata.SPRODUC}';
                CACTIVI= '${__formdata.CACTIVI}';
                objAjax.invokeAsyncCGI("axis_axislist001.do", callbackAjaxSelectedCausa, 
                    "operation=ajax_selected_causa&CODI=" + document.miForm.causas.value + "&SPRODUC=" +SPRODUC+ "&CACTIVI=" +CACTIVI, obj, objJsMessages.jslit_actualizando_registro);}
        }
            
        function callbackAjaxSelectedCausa(ajaxResponseText) {
            var motivosCombo = document.miForm.motivos;
            try {
                var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(motivosCombo);
                         objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, 0);
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TMOTSIN")[0].childNodes[0].nodeValue : "");
                            var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMOTSIN")[0].childNodes[0].nodeValue : "");
                            
                            objDom.addOpcionACombo(CMOTSIN, TMOTSIN, motivosCombo, i+1);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (motivosCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
                alert(objJsMessages.jslit_sin_motivos);
            }
        }
            
      
        
        function f_consulta_persona(){
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("axis_axislist001.do", "consulta_persona", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
        }

        function f_alta_persona(){
            objDom.setValorPorId("LIMPIAR_DATOS", "false");
            objUtiles.ejecutarFormulario("axis_axislist001.do", "alta_persona", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
        }
        
        function f_actualiza_campos(){
            //alert("Cambio estilos");
            f_carga_dependencias();
        }
        
       /* ************************************************************************************************* */
       /* **************************************** axisper021 ********************************************* */
       /* ************************************************************************************************* */
       
       function f_abrir_axisper021 () {
      var SSEGURO = "${__formdata.SSEGURO}";
      var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
      }
      function f_cerrar_axisper022(){
      f_cerrar_modalespersona("axisper022");
      }          
      function f_cerrar_axisper021(){
      f_cerrar_modalespersona("axisper021");
      }   
      function f_nova_persona(){
            //alert("al entrar en el parent***");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        //alert("Em cerrar persona");
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;
        document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
        //alert("****"+CAGENTE);
        
         if (!objUtiles.estaVacio(SPERSON)){
       //objUtiles.ejecutarFormulario ("axis_axislist001.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
       objAjax.invokeAsyncCGI("axis_axislist001.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }
      

    
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
    try{
       //alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);

        
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
             
             objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
           
             var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
             var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
             var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
             
             //alert(NOMBRE);
             //alert(APELLIDO1);
             //alert(APELLIDO2);
             objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
             objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                    

             
        }          
     
    }catch(e){}
    }
        
    /* ************************************************************************************************* */
    /* ************************************************************************************************* */
    /* ****************************************FUNCIONES AJAX ****************************************** */
    
    function f_ajax_cargar_tipo (){
            
             var CTIPO = document.miForm.CTIPO.value;
             //alert(CTIPO);
             f_carga_dependencias();
             objAjax.invokeAsyncCGI("axis_axislist001.do", 
                callbackAjaxCargarTipo, "operation=ajax_cargar_tipo&CTIPO=" + CTIPO,  this);
            
    }
    
    
    function f_ajax_cargar_negocio(){
        var CNEGOCIO = document.miForm.CNEGOCIO.value;    
        SPRODUC = document.miForm.SPRODUC.value;  
        //alert(CNEGOCIO);
        //alert(SPRODUC);
        f_carga_dependencias();
        if(CNEGOCIO == '5' && SPRODUC == 'null'){ //Si es modalidad, cargará un combo        
            
             //alert("raro; "+CNEGOCIO);
             //Engañamos para que recupere los productos CNEGOCIO=4
             objAjax.invokeAsyncCGI("axis_axislist001.do", 
                callbackAjaxCargarProducto, "operation=ajax_cargar_negocio&CNEGOCIO=" + 4,  this); 
        }else{        
          
             //alert(CNEGOCIO);
             objAjax.invokeAsyncCGI("axis_axislist001.do", 
                callbackAjaxCargarNegocio, "operation=ajax_cargar_negocio&CNEGOCIO=" + CNEGOCIO + "&SPRODUC="+ SPRODUC,  this);
        }
            
    }
    
    
   <% System.out.println("******************************************* 5");%> 
    
    /* Cargar tipos --> Seran de tipo combos */ // TODO:Falta perfilar funciones
    
    function callbackAjaxCargarTipo (ajaxResponseText){
                try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                //alert("A");
                    var comboTipos = document.miForm.TIPOZONA;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    //alert("B");
                        objDom.borrarOpcionesDeCombo(comboTipos);

                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboTipos, 0);
                           // -- Bug 0016529 - 29/12/2010 - JMF
                           var vInici = 0;
                           if( document.miForm.CTIPO.value=='2' || document.miForm.CTIPO.value=='4' || document.miForm.CTIPO.value=='5' ){
                                   // Para listas ZONA OBSV, ZONA o OFICINA, damos posibilidad de seleccionar todas.
                                   objDom.addOpcionACombo("-1", " - " + objJsMessages.jslit_seleccionar_todo + " - ", comboTipos, 1);
                                   vInici++;
                           }
                           
                            vInici++;                           
 
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            //alert("C");        
                            //alert(i);         
                                var TAGENTE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TAGENTE")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TAGENTE")[0].childNodes[0].nodeValue : "");
                                var CAGENTE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CAGENTE")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CAGENTE")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(CAGENTE, TAGENTE, comboTipos, vInici);
                                vInici++;
                               
                            }
                                
                        }else{
                            objDom.borrarOpcionesDeCombo (comboTipos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboTipos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
            
            
    /* Cargar tipos --> Seran de tipo combos */ // TODO:Falta perfilar funciones
    
    function callbackAjaxCargarProducto (ajaxResponseText){
    
                try{ 
                //alert(ajaxResponseText);
                
                objLista.borrarFilasDeLista ("LSTNEGOCIOS", "3", '<axis:alt f="axisctr020" c="MENSA5" lit="1000254"/>');
                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                //alert("A");
                    var comboTipos = document.miForm.SPRODUC;   
             
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    //alert("B");
                        objDom.borrarOpcionesDeCombo(comboTipos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboTipos, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            //alert("C");        
                            //alert(i);         
                                var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                                var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                               
                                objDom.addOpcionACombo(CATRIBU, TATRIBU, comboTipos, i+1);
                                
                                //alert("D");          
                            }
                                
                        }else{
                            objDom.borrarOpcionesDeCombo (comboTipos);
                            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", comboTipos, null);
                        }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
            }
    
    
    /* Cargar negocio --> Serán de tipo lista */
    
    
    function callbackAjaxCargarNegocio(ajaxResponseText) {
        var jDate = new JsFecha();
        //alert(ajaxResponseText);
            try {
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {

                    var tableM = document.getElementById("LSTNEGOCIOS");
                    var tbodyM = tableM.getElementsByTagName("tbody")[0];
                    var trM = tbodyM.getElementsByTagName("tr");

                    objLista.borrarFilasDeLista ("LSTNEGOCIOS", "3", '<axis:alt f="axisctr020" c="MENSA5" lit="1000254"/>');
                    
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CATRIBU") ; i++) {
                        // Como hay resultados, borramos la fila vacia
                        if (i==0) 
                            objLista.borrarFilaVacia(tbodyM, trM);
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a aÃ±adir a la nueva fila del displayTag
                        var newtd = new Array(3);
                        
                        //newtd[0] = objLista.addCheckBoxEnLista("CHK_"+i, objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0),
                        //        "javascript:f_actualiza_casilla_asegurado(this, '" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) + "');",
                        //         objDom.getValorNodoDelComponente(doc.getElementsByTagName("ISASEG"), 0, 0) == 1);
                        
                        newtd[0] = objLista.addCheckBoxEnLista("CHK_"+i, 0,
                                "");
                                
                                
                        // Anyadir un hidden con el valor:
                         var deschidden = document.createElement("input");
                         var texto_desc='NORDEN_'+i;
                         deschidden.setAttribute('id',texto_desc);    
                         deschidden.setAttribute('name',texto_desc);
                         deschidden.name=texto_desc;
                         deschidden.setAttribute('type','hidden');
                         deschidden.type="hidden";
                         var VALOR = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CATRIBU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0) : "");
                         deschidden.setAttribute('value', VALOR );
                         deschidden.value=VALOR;
                         newtd[0].appendChild(deschidden);
                        
                        
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var CATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CATRIBU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0) : "");
                        newtd[1] = objLista.addTextoEnLista(CATRIBU);
                                                                      
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        var TATRIBU = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TATRIBU")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0) : "");
                        newtd[2] = objLista.addTextoEnLista(TATRIBU);
                        
               
                       
                        
                        //alert("Antes de añadir filas");
                        // Anydimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyM);
                    } // Fi for
                 
                                       
                    //objEstilos.toggleDisplay('DSP_PROVGAR1', this); 
                    //alert("sssss"+document.miForm.NORDEN_0.value);
                    document.miForm.TOTAL_FILAS.value = i;
                }
                
                //alert("tot:" + document.miForm.TOTAL_FILAS.value);
                
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            } 
        }     
    
  
            
        </script>
    </head>
    <body onload="f_onload()" onblur="">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" name="PRODUCTO" id="PRODUCTO" value="" />
        <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="" />
        <input type="hidden" name="MODO" id="MODO" value="" />
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
        <input type="hidden" name="OK" id="OK" value="${__formdata.OK}" />
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="" />
        <input type="hidden" name="SNIP" id="SNIP" value="" />
        <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="" />
        <input type="hidden" name="TOTAL_FILAS" id="TOTAL_FILAS" value="0" />
       
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axislist001" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axislist001" c="MOD_PANTALLA_APERS" lit="9001955"/></c:param>
                <c:param name="nid" value="axisper022" />
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axislist001" c="IMP_MODAL" lit="1000205"/>|true</c:param>
        </c:import>
            <!-- Titulos pantalla -->
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axislist001" c="TIT_FORMM" lit="9000745"/></c:param>
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><axis:alt f="axislist001" c="TIT_FORM" lit="101109"/></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axislist001</c:param>
        </c:import>
            <!-- Area de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axislist001" c="TIT_PANT" lit="108525"/></div>
                        <!--campos-->
                        <!-- *************************** Informe *************************  -->
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Informes -->
                                            <axis:visible f="axislist001" c="INFORMES"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axislist001" c="INFORMES" lit="108525"/></b>
                                                </td>
                                            </axis:visible>
                                           
                                            <td class="titulocaja">
                                            </td>
                                        </tr>
                                        <tr>
                                            <!-- Informes -->
                                            <axis:visible f="axislist001" c="INFORMES"> 
                                                <td class="campocaja">
                                             
                                                    <select tabindex="16" name = "INFORME" id ="INFORME" size="1" class="campowidthselect campo campotexto" <axis:atr f="axislist001" c="INFORME" a="modificable=false&obligatorio=true"/> alt="<axis:alt f="axislist001" c="INFORME_LIT" lit="108525"/>" title="<axis:alt f="axislist001" c="INFORME_LIT" lit="108525"/>" onchange="f_actualiza_campos();">                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL1" lit="108341"/> - </option>
                                                    <c:forEach var="informe" items="${listvalores.informes}">
                                                        <option value = "${informe.CMAP}" <c:if test="${informe.CMAP == __formdata.INFORME}">selected</c:if>>
                                                                ${informe.TLITERA}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                            
                                            <td colspan="2" class="campocaja">
                                            </td>
                                        </tr>
         
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- ************************************** Parametros *********************************** -->
                        
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axislist001" c="LIT_1" lit="103694"/></div>
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Periodicidad -->
                                            <axis:ocultar f="axislist001" c="NPERIOD"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axislist001" c="NPERIOD" lit="106053"/></b>
                                                    
                                                </td>
                                            </axis:ocultar>
                                            <!-- Mes -->
                                            <axis:ocultar f="axislist001" c="NMES" dejarHueco="false">
                                                <td id="td_NMES" class="titulocaja">
                                                    <b id="label_NMES"><axis:alt f="axislist001" c="NMES" lit="9000495"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <!-- Año -->
                                            <axis:ocultar f="axislist001" c="NANYO" dejarHueco="false" >
                                                <td id="td_NANYO" class="titulocaja">
                                                    <b  id="label_NANYO"><axis:alt f="axislist001" c="NANYO" lit="101606"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                           <axis:ocultar f="axislist001" c="FINICIO" dejarHueco="false">
                                                <td id="td_FINICIO" class="titulocaja">
                                                    <b id="label_FINICIO"><axis:alt f="axislist001" c="FINICIO" lit="9000526"/></b>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axislist001" c="FFIN" dejarHueco="false">
                                                <td id="td_FFIN" class="titulocaja">
                                                    <b id="label_FFIN" ><axis:alt f="axislist001" c="FFIN" lit="9000527"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                       
                                            <!-- Periodicidad -->
                                            <axis:ocultar f="axislist001" c="NPERIOD" dejarHueco="false"> 
                                                <td class="campocaja">
                                                   <select tabindex="16" name = "NPERIOD" id ="NPERIOD" size="1" class="campowidthselect campo campotexto" <axis:atr f="axislist001" c="NPERIOD" a="modificable=false&obligatorio=true"/> alt="<axis:alt f="axislist001" c="NPERIOD_LIT" lit="106053"/>" title="<axis:alt f="axislist001" c="NPERIOD_LIT" lit="106053"/>" onchange="f_actualiza_campos();">                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL2" lit="108341"/> - </option>
                                                    <c:forEach var="periodicidad" items="${listvalores.periodicidad}">
                                                        <option value = "${periodicidad.CATRIBU}" <c:if test="${periodicidad.CATRIBU == __formdata.NPERIOD}">selected</c:if>>
                                                                ${periodicidad.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <!-- Mes -->
                                            <axis:ocultar f="axislist001" c="NMES" dejarHueco="false"> 
                                                <td id="td_NMES" class="campocaja">
                                                   <select tabindex="16" name = "NMES" id ="NMES" size="1" <axis:atr f="axislist001" c="NMES" a="modificable=false"/> class="campowidthselect campo campotexto">                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL3" lit="108341"/> - </option>
                                                    <c:forEach var="mes" items="${listvalores.meses}">
                                                        <option value = "${mes.CATRIBU}" <c:if test="${mes.CATRIBU == __formdata.NMES}">selected</c:if>>
                                                                ${mes.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                           
                                            <!-- Certificado -->
                                            <axis:ocultar f="axislist001" c="NANYO" dejarHueco="false">
                                                <td id="td_NANYO" class="campocaja">
                                                          <input tabindex="2" type="text" class="campodisabled campo campotexto" onfocus="pasarAlSiguiente(this)" id="NANYO" name="NANYO" size="15" style="width:35%;"
                                                          value="${__formdata.NANYO}" <axis:atr f="axislist001" c="NANYO" a="modificable=true"/> />
                                                </td>
                                            </axis:ocultar>
                                             <!-- Finicio -->
                                            <axis:ocultar f="axislist001" c="FINICIO" dejarHueco="false">
                                                <td id="td_FINICIO" class="campocaja">
                                                    <input type="text" tabindex="5" class="campodisabled campo campotexto" id="FINICIO" name="FINICIO"  size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FINICIO}'/>" <axis:atr f="axislist001" c="FINICIO" a="modificable=true"/> />
                                                    <img alt="<axis:alt f="axislist001" c="FINICIO_ALT" lit="105957"/>" title="<axis:alt f="axislist001" c="FINICIO_ALT" lit="105957"/>" id="icon_FINICIO" src="images/calendar.gif"  <axis:atr f="axislist001" c="FINICIO" a="modificable=false"/> />
                                                    </a>
                                               
                                                </td>
                                            </axis:ocultar>
                                       
                                            <!-- Ffin -->
                                            <axis:ocultar f="axislist001" c="FFIN">
                                                <td id="td_FFIN" class="campocaja">
                                                    <input type="text" tabindex="5" class="campodisabled campo campotexto" id="FFIN" name="FFIN"  size="15" style="width:60%"
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FFIN}'/>" <axis:atr f="axislist001" c="FFIN" a="modificable=true"/> />
                                                    <img alt="<axis:alt f="axislist001" c="FFIN_ALT" lit="105957"/>" title="<axis:alt f="axislist001" c="FFIN_ALT" lit="105957"/>" id="icon_FFIN" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
         
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- Fichero generado -->
                        <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Periodicidad -->
                                            <axis:visible f="axislist001" c="CTIPO"> 
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axislist001" c="CTIPO_LIT" lit="100565"/></b>
                                                   
                                                </td>
                                            </axis:visible>
                                            <!-- Total empresa -->
                                            <axis:visible f="axislist001" c="TIPOZONA">
                                                <td id="td_TIPOZONA" class="titulocaja">
                                                    <b id="label_TIPOZONA"><axis:alt f="axislist001" c="TIPOZONA_LIT" lit="1000529"/></b>
                                                </td>
                                            </axis:visible>
                                            
                                           
                                        </tr>
                                        <tr>
                                            <!-- Tipo -->
                                            <axis:visible f="axislist001" c="CTIPO"> 
                                                <td class="campocaja">
                                                   <select tabindex="16" name = "CTIPO" id ="CTIPO" size="1" onchange="f_ajax_cargar_tipo();f_actualiza_campos();" alt="<axis:alt f="axislist001" c="CTIPO_LIT" lit="100565"/>" title="<axis:alt f="axislist001" c="CTIPO_LIT" lit="100565"/>" class="campowidthselect campo campotexto" <axis:atr f="axislist001" c="CTIPO" a="modificable=false&obligatorio=true"/>>                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL4" lit="108341"/> - </option>
                                                    <c:forEach var="tipos" items="${listvalores.tipos}">
                                                        <option value = "${tipos.CATRIBU}" <c:if test="${tipos.CATRIBU == __formdata.CTIPO}">selected</c:if>>
                                                                ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                           <!-- Total Empresa -->
                           
                                            <axis:visible f="axislist001" c="TIPOZONA"> 
                                                <td class="campocaja">
                                                   <select tabindex="16" name = "TIPOZONA" id ="TIPOZONA" size="1" class="campowidthselect campo campotexto">                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL_5" lit="108341"/> - </option>
                                                    <c:forEach var="tipZn" items="${__formdata.tipos_zona}">
                                                        <option value = "${tipZn.CATRIBU}" <c:if test="${tipZn.CATRIBU == __formdata.TIPOZONA}">selected</c:if>>
                                                                ${tipZn.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                               
                                            
                                            
                                            
                                        </tr>
                                    
                            </table>
                           
               
                        
                     
                    </td>
                </tr>
            </table>
            
            
            <table class="seccion">
                <tr>
                    <td align="left">
                    
                        <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                        
                            <!-- -------------------------------------- CLIENTE ----------------------------------- -->
                            
                            
                            <tr>
                      <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_SPERSON" lit="105330"/></b><!-- Document -->                                
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="NOMBRE" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin011" c="LIT_NOMBRE" lit="105940"/></b><!-- Nombre -->                                
                        </td>
                        </axis:ocultar>
                        <td></td>
                        <td></td>
                    </tr>
                  
                    <tr>
                        <axis:ocultar f="axissin011" c="SPERSON" dejarHueco="false">
                        <td class="campocaja">
                        <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin011" c="SPERSON" a="modificable=true"/> /> 
                            <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                            <axis:atr f="axissin011" c="NNUMIDE" a="modificable=false"/> /> 
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin011" c="NOMBRE" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                            <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                            <axis:atr f="axissin012" c="NOMBRE" a="modificable=false"/> /> 
                        </td>
                        <td></td>
                        </axis:ocultar>
                </tr>
                            
                  
                            
                            <%-- **********************************************************************************  --%>
                            
                        </table>
                        
                    </td>
                    
                </tr>
            </table>
            
             <!--    ************* Negocio *************** -->
                            
            <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                      
                                        <tr>
                                            <!-- Periodicidad -->
                                            <axis:visible f="axislist001" c="CNEGOCIO"> 
                                                <td id="td_CNEGOCIO" class="titulocaja" colspan="2">
                                                    <b id="label_CNEGOCIO"><axis:alt f="axislist001" c="CNEGOCIO_LIT" lit="9901646"/></b>
                                                </td>
                                              
                                            </axis:visible>
                                            <!-- Producto -->
                                            <axis:visible f="axislist001" c="SPRODUC"> 
                                                <td id="td_SPRODUC" class="titulocaja" colspan="2">
                                                    <b id="label_CNEGOCIO"><axis:alt f="axislist001" c="SPRODUC_LIT" lit="100829"/></b>
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                        <tr>
                                            <!-- Tipo -->
                                            <axis:visible f="axislist001" c="CNEGOCIO"> 
                                          
                                                <td class="campocja" colspan="2">
                                                    <select tabindex="16" name = "CNEGOCIO" id ="CNEGOCIO" size="1" alt="<axis:alt f="axislist001" c="CNEGOCIO_LIT" lit="9901646"/>" title="<axis:alt f="axislist001" c="CNEGOCIO_LIT" lit="9901646"/>" class="campowidthselect campo campotexto" onchange="f_ajax_cargar_negocio();" <axis:atr f="axislist001" c="CNEGOCIO" a="modificable=false&obligatorio=true"/>>                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL6" lit="108341"/> - </option>
                                                    <c:forEach var="negocio" items="${listvalores.negocios}">
                                                        <option value = "${negocio.CATRIBU}"  <c:if test="${negocio.CATRIBU == __formdata.CNEGOCIO}">selected</c:if>>
                                                                ${negocio.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                
                                                </td>
                                            </axis:visible>
                                            
                                            <!-- PRODUCTO -->
                                          
                                            <axis:visible f="axislist001" c="SPRODUC"> 
                                                <td class="campocaja" >
                                                   <select tabindex="16" name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_ajax_cargar_negocio();" class="campowidthselect campo campotexto">                                                    
                                                    <option value="null"> - <axis:alt f="axislist001" c="LIT_NULL_7" lit="1000351"/> - </option>
                                                    <c:forEach var="sproduc" items="${listvalores.productos}">
                                                        <option value = "${sproduc.CATRIBU}" <c:if test="${ sproduc.CATRIBU == __formdata.SPRODUC}">selected</c:if>>
                                                                ${sproduc.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:visible>
                                       
                                            
                                            <td></td>
                                            <!-- FIN PRODUCTO -->
                                            
                                            
                                            
                                           
                              <% System.out.println("******************************************* 19");%>              
                                        </tr>
                                        
                                        <tr>
                                         <td class="campocaja" colspan="2">
                                         </td>
                                        <!-- LISTA -->
                                            <axis:visible f="axislist001" c="LST_NEGOCIOS"> 
                                            <c:set var="title0"><axis:alt f="axislist001" c="LST_NEGOCIOS_LIT" lit="109155"/></c:set>
                                            <c:set var="title3">&nbsp;</c:set>
                                            <c:set var="title1"><axis:visible f="axisctr001" c="TRAMO">
                                                    <axis:alt f="axisctr001" c="TRAMO" lit="100588"></axis:alt>
                                                </axis:visible>
                                                </c:set>
                                            
                                            
                                                <td class="campocaja" colspan="2">
                                                         <%--display:table name="${sessionScope.axisadm048_lista}"
                                                                       id="LSTNEGOCIOS" export="false"
                                                                       class="dsptgtable" pagesize="-1" 
                                                                       requestURI="axis_axislist001.do?paginar=true"
                                                                       sort="list" cellpadding="0" cellspacing="0" --%>
                                                    <div class="displayspace">
                                                        <display:table name="${sessionScope.axisadm048_lista}" id="LSTNEGOCIOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                        requestURI="axis_axislist001.do?paginar=true">               
                                                                       
                                                        
                                                          <%@ include file="../include/displaytag.jsp"%>
                                                          <!--<%@ include file="../include/displaytag.jsp"%>     -->
                                                          <!--<div class="dspIcons">-->
                                                          
                                                          <display:column headerClass="headwidth5 sortable" title="${title3}" style="width:5%;"
                                                                          media="html" autolink="false">
                                                            <div class="dspIcons">                     
                                                            </div>
                                                          </display:column>
                                                          
                                                          <display:column headerClass="headwidth5 sortable" title="${title0}" style="width:5%;"
                                                                          media="html" autolink="false">
                                                            <div class="dspNumber">                     
                                                            </div>
                                                          </display:column>
                                        
                                        
                                                          <display:column title="${title1}" sortable="true"
                                                                          sortProperty="OB_IAX_PROCESOSCAB.SPROCES"
                                                                          headerClass="headwidth10 sortable" style="width:5%;"
                                                                          media="html" autolink="false">
                                                            <div class="dspText">                      
                                                                ${LSTPROCESOSCAB.OB_IAX_PROCESOSCAB.SPROCES}                      
                                                            </div>                     
                                                          </display:column>
                                                          </display:table>
                                                </div>
                                                </td>
                                                
                                                
                                                
                                            </axis:visible>
                                            
                                            <!-- LISTA -->
                                        
                                        <% System.out.println("******************************************* 20");%>
                                        </tr>
                                        
                                        <tr> 
                                                <td colspan="2">
                                                </td>
                                                <td class = "campocaja" colspan="2" align="right" >
                                                    
                                                        <input type="button" onclick="f_seleccionar_todos(true)" class="boton" value="<axis:alt f="axislist001" c="BOT_SEL_TODOS" lit="9000756"/>"/>
                                                        <input type="button" onclick="f_seleccionar_todos(false)" class="boton" value="<axis:alt f="axislist001" c="BOT_DESEL_TODOS" lit="9000757"/>"/>
                                                  
                                                </td>
                                        </tr>
                                                
                                        
                                       
                                    
            </table>
            
            
            </td>
            </tr>
            </table>
            
            
            <!-- **********************  Fichero generado ********************* -->
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axislist001" c="TIT_GEN" lit="107913"/></div>            
            <table class="seccion">
                            <tr>
                                <td align="left">
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <% System.out.println("******************************************* 21");%>
                                        <tr>
                                            <!-- Fichero generado -->
                                            <axis:visible f="axislist001" c="FICHERO"> 
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axislist001" c="FICHERO_LIT" lit="1000143"/></b>
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                        <tr>
                                            <!-- Fichero generado -->
                                            <axis:visible f="axislist001" c="FICHERO"> 
                                                <td class="campocaja" colspan="3">
                                                  <input type="text" readonly style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" onclick="javascript:f_imprimir_fitxer(document.getElementById('FICHERO').value)" class="campodisabled campo campotexto" id="FICHERO" name="FICHERO"  size="15" style="width:60%"
                                                    value="${FICHERO}" />
                                                    
                                                   
                                                   
                                                </td>
                                            </axis:visible>
                                           
                                        </tr>
                                    
                                    </table>
                                    
                                </td>
                            </tr>
            </table>
            
            <% System.out.println("******************************************* 22");%>
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axislist001</c:param>
                <c:param name="__botones">salir,109006</c:param>
            </c:import>
        
        </form>

        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_ocurrencia", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "popup_calendario_recepcion",  
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
            inputField     :    "FINICIO",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FINICIO",  
            singleClick    :    true,
            firstDay       :    1
            });
           
             Calendar.setup({
            inputField     :    "FFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FFIN",  
            singleClick    :    true,
            firstDay       :    1
            });
        </script>
        <% System.out.println("******************************************* 23");%>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
<% System.out.println("******************************************* 24");%>