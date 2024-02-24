<%/*Revision:# HFX84vPLBPOld3R+fFhAYg== #*/%>
<%/**
*  Fichero: axiscob001.jsp
*  Pantalla inicial de Cuenta Cliente
*  @author <a href = "">Miguel Rivera</a>  
*  Fecha: 27/02/2013
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="axis.util.Constantes" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>
      <axis:alt f="axiscob001" c="FORM" lit="formulario.axisnombrepantalla"/>
    </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
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
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
              revisarEstilos();  
              f_cargar_propiedades_pantalla(); 
            }
            
            function f_but_salir() {
              objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscob001", "cancelar", document.miForm, "_self");
            }
            
            function f_but_9908115(){
            
                var SPERSON=objDom.getValorPorId("SPERSON");
                var SSEGURO=objDom.getValorPorId("SSEGURO");
                var NOMBRE = objDom.getValorPorId("NOMBRE");        
                var NPOLIZA = objDom.getValorPorId("NPOLIZA_D");  
                var NPOLIZADf = objDom.getValorPorId("NPOLIZA");                
                
                var NPOLIZAD = NPOLIZADf.substr(0, NPOLIZADf.search("-"));                
                
                if(!objUtiles.estaVacio(NPOLIZAD)){
                
                    var NOMBRETOM = objDom.getValorPorId("NOMBRETOM"); 
                    objUtiles.abrirModal("axiscob001a","src","modal_axiscob001a.do?operation=form&CONSULT_INI=CONSULT_INI&SSEGURO="+SSEGURO+"&SPERSON="+SPERSON+"&NPOLIZA_D="+NPOLIZAD+"&NOMBRE="+NOMBRETOM);
                }
                else if(!objUtiles.estaVacio(SPERSON) && !objUtiles.estaVacio(SSEGURO)){                
                    objDom.setValorPorId ("SPERSON", SPERSON);
                    objDom.setValorPorId ("SSEGURO", SSEGURO);
                    objDom.setValorPorId ("NOMBRE", NOMBRE);
                    
                    objUtiles.abrirModal("axiscob001a", "src", "modal_axiscob001a.do?operation=form&CONSULT_INI=CONSULT_INI&SSEGURO="+SSEGURO+"&SPERSON="+SPERSON+"&NPOLIZA_D="+NPOLIZA+"&NOMBRE="+NOMBRE);  
                }
                else{
                    alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9905104'/>");
                }
                
            }
            
            function f_abrir_axiscob001c(SEQCAJA){
            
                var SPERSON=objDom.getValorPorId("SPERSON");
                var SSEGURO=objDom.getValorPorId("SSEGURO");
                
                
                
                if(objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA_D"))){
                   var NPOLIZA = objDom.getValorPorId("NPOLIZA"); 
                   var NOMBRE =("${sessionScope.listaPersonas[0].NOMBRE}");
                   
                }else{
                    var NPOLIZA = objDom.getValorPorId("NPOLIZA_D");
                    var NOMBRE = objDom.getValorPorId("NOMBRE");
                    
                }
                
                if(!objUtiles.estaVacio(SPERSON) && !objUtiles.estaVacio(SSEGURO)){
                    objDom.setValorPorId ("SPERSON", SPERSON);
                    objDom.setValorPorId ("SSEGURO", SSEGURO);
                    objDom.setValorPorId ("NOMBRE", NOMBRE);
                    
                    objUtiles.abrirModal("axiscob001c", "src", "modal_axiscob001c.do?operation=form&CONSULT_INI=CONSULT_INI&SSEGURO="+SSEGURO+"&SPERSON="
                                         +SPERSON+"&NOMBRE="+NOMBRE+"&SEQCAJA="+SEQCAJA+"&NPOLIZA="+NPOLIZA);  
                }
                else{
                    alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9905104'/>");
                }
            }
            
            
            function f_abrir_axiscob001d(SEQCAJA){
            
                var SPERSON=objDom.getValorPorId("SPERSON");
                var SSEGURO=objDom.getValorPorId("SSEGURO");
                var NPOLIZAD = objDom.getValorPorId("NPOLIZA");                
               
                if(objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA_D"))){
                   var NPOLIZA = objDom.getValorPorId("NPOLIZA"); 
                   var NOMBRE =("${sessionScope.listaPersonas[0].NOMBRE}");
                   
                }else{
                    var NPOLIZA = objDom.getValorPorId("NPOLIZA_D");
                    var NOMBRE = objDom.getValorPorId("NOMBRE");
                    
                }
                
                if(!objUtiles.estaVacio(SPERSON) && !objUtiles.estaVacio(SSEGURO)){
                    objDom.setValorPorId ("SPERSON", SPERSON);
                    objDom.setValorPorId ("SSEGURO", SSEGURO);
                    objDom.setValorPorId ("NOMBRE", NOMBRE);
                    if(!objUtiles.estaVacio(SEQCAJA)) {   
                        objUtiles.abrirModal("axiscob001d", "src", "modal_axiscob001d.do?operation=form&CONSULT_INI=CONSULT_INI&SSEGURO="+SSEGURO+"&SPERSON="
                                             +SPERSON+"&NOMBRE="+NOMBRE+"&SEQCAJA="+SEQCAJA+"&NPOLIZA="+NPOLIZA); 
                    }                
                }
                else{
                    alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9905104'/>");
                }
            }
             
            function f_but_buscar() {
               if(objUtiles.estaVacio(objDom.getValorPorId("SPERSON"))||objUtiles.estaVacio(objDom.getValorPorId("SSEGURO"))){
                    alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9905104'/>");
                    return;
                }   
                if (!objValidador.validaEntrada()){
                    return;
                }
                var objFec = new JsFecha();
                var fIni= objUtiles.estaVacio('FECHAINI')?'01/01/1970':objDom.getValorPorId('FECHAINI');
                var fFin= objUtiles.estaVacio('FECHAFIN')?'01/01/3000':objDom.getValorPorId('FECHAFIN');
                
                if (objFec.stringToDate(fIni) > objFec.stringToDate(fFin) ){
                    alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9902126'/>"); // 9902126 La fecha de inicio no puede ser más grande que la fecha de fin
                    return;
                }
                
                objUtiles.ejecutarFormulario ("axis_axiscob001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
               
            } 
                
            /****************************************************************************************/
            /*******************************     MODALES    *****************************************/
            /****************************************************************************************/
            function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
            }
        
            function f_aceptar_modal(cual, params) {
                f_cerrar_modal(cual);
                objUtiles.ejecutarFormulario("axis_axiscob001.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
          
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
        
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
       function f_buscar_persona(){
         objLista.borrarFilasDeLista ("lstMov", "10", "<axis:alt f='axiscob001' c='LSTMOV' lit='1000254'/>");
         f_abrir_modal("axisper021", false, "&MODO_SWPUBLI=PERSONAS_PUBPRIV"); 
       } 
       
       function f_buscar_poliza(){
         f_abrir_modal("axisctr019", false, ""); 
       } 
       
      function f_aceptar_axisper021(){
        f_cerrar_modal('axisper021');
      }
      
      function f_aceptar_persona (SPERSON_OUT,CAGENTE_OUT, SNIP, ORIGEN){    
        objDom.setValorPorId ("SPERSON", SPERSON_OUT);
        objDom.setValorPorId ("SNIP", SNIP); 
        f_cerrar_modal('axisper021')        
     
        if (objUtiles.estaVacio(SPERSON_OUT)){
            return;
        }
        objAjax.invokeAsyncCGI("axis_axiscob001.do", callbackajaxPersona, "operation=ajax_persona&SPERSON="+SPERSON_OUT+"&CAGENTE="+CAGENTE_OUT, this)
         }
      
      function f_cerrar_modalespersona(){
        f_cerrar_modal('axisper021');
      }
      
        function f_cerrar_axisctr019(){
        
            objUtiles.cerrarModal("axisctr019");
            
        }
        
        function f_aceptar_axisctr019(SSEGURO){
            f_cerrar_modal('axisctr019')
            if (objUtiles.estaVacio(SSEGURO)){
                return;
            }
            objAjax.invokeAsyncCGI("axis_axiscob001.do", callbackajaxPolizas, "operation=ajax_polizas&SSEGURO="+SSEGURO, this)
        }
        
        function f_abrir_axisctr019(){
            objLista.borrarFilasDeLista ("lstMov", "10", "<axis:alt f='axiscob001' c='LSTMOV' lit='1000254'/>");
            objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
        }
            
  
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
         function callbackajaxPersona(ajaxResponseText){
           // alert(ajaxResponseText);
            var doc=objAjax.domParse(ajaxResponseText);
            if(objAppMensajes.existenErroresEnAplicacion(doc)){
                return;
            }
            var SPERSON ="";
            var TTIPIDE = "";
            var NNUMIDE = "";
            var NOMBRE ="";
            var SNIP = "";
            var TDIGITOIDE="";
            try{
                SPERSON = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
           }catch(e){
            }
            try{
                TTIPIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPIDE"), 0, 0);
            }catch(e){
            }
            try{
                NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
            }catch(e){
            alert(e);
            }
            try{
            TDIGITOIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDIGITOIDE"), 0, 0);
                if (!objUtiles.estaVacio(TDIGITOIDE)){
                    TDIGITOIDE = "-" + TDIGITOIDE;
                }
            }catch(e){
            }
            try{
                NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
            }catch(e){}
            try{
                NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
            }catch(e){}
            try{
                NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
            }catch(e){}
            try{
                SNIP = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SNIP"), 0, 0);
            }catch(e){}           
            objDom.setValorPorId ("TTIPIDE", TTIPIDE);
            
              if (!objUtiles.estaVacio(NNUMIDE)){
               if( NNUMIDE.indexOf("-")==-1)
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE) + TDIGITOIDE);
               else
                objDom.setValorPorId ("NNUMIDE", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE));
                } 
            
            objDom.setValorPorId ("NOMBRE", NOMBRE);
            objDom.setValorPorId ("SNIP", SNIP);
            objAjax.invokeAsyncCGI("axis_axiscob001.do", callbackajaxBuscarPolizas, "operation=ajax_buscar_polizas&SPERSON="+SPERSON, this)
            
        }
        
         function callbackajaxBuscarPolizas(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            objLista.borrarFilasDeLista ("lstpol", "5", "<axis:alt f='axiscob001' c='LSTCTACLIENTE' lit='1000254'/>");
             objDom.setValorPorId ("SSEGURO", "");
            if(objAppMensajes.existenErroresEnAplicacion(doc)){
                return;
            }
            
            if (!objDom.existeTag(doc, "SSEGURO")){
                return;
            }
             var tbodyadded = objLista.obtenerBodyLista("lstpol");
             var tradded = objLista.obtenerFilasBodyLista("lstpol", tbodyadded);
            // Si hay registros, eliminamos el tr "No se han encontrado datos"
             objLista.borrarFilaVacia(tbodyadded, tradded);
             for (var i = 0; i < objDom.numeroDeTags(doc, "SSEGURO") ; i++) {
                 
                 
                 
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                   
                    var SSEGURO   = "";
                    
                    var SPRODUC   = "";
                 
                    var NPOLIZA   = "";
				
                    var NCERTIF   = "";
										  
                    var FEFECTO   = "";
					
                    var CAGENTE   = "";
                  
                     var TAGENTE   = ""; 
                     
                      var PRODUCTO="";
                      
                       var formatedFEFECTO="";
                                     
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
					 
                    var newtr = objLista.crearNuevaFila(rowstyle);
					  
                    // Creamos un array de columnas a a?adir a la nueva fila del displayTag
                    var newtd = new Array(5);
					 
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                       try{
                   SSEGURO   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0);
                      }catch(e){
                       SSEGURO="";}
					 
                       try{
                    SPRODUC   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                      }catch(e){
                       SPRODUC="";
                      }
					    try{  
                    NPOLIZA   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0);
					  }catch(e){
                        NPOLIZA="";
                      } 
					
					try{
                    NCERTIF   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCERTIF"), i, 0);
					
                      }catch(e){
                      NCERTIF ="";
                      }
					 
					try{					  
                     FEFECTO   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("FEFECTO"), i, 0);
					 }catch(e){
                     FEFECTO="";}
				   try{
                     CAGENTE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAGENTE"), i, 0);
                     }catch(e){
                     
                     CAGENTE ="";}
					 
                       try{
                  TAGENTE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAGENTE"), i, 0);
                         }catch(e){ 
                          TAGENTE ="";
                         }
				 try{	
                    PRODUCTO  = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);
                  }catch(e){ 
                          PRODUCTO ="";
                         }
                    	
                    var formatedFEFECTO = "";
                    if(FEFECTO!="")
                    formatedFEFECTO=objUtiles.formateaTimeStamp2(FEFECTO);
                    else
                    formatedFEFECTO="";
                    
                    CPOLIZA= (!objUtiles.estaVacio(NCERTIF))?NPOLIZA+"-"+NCERTIF : NPOLIZA;
                    var AGENTE ="";
                    
                    
                    var jsFuncion = "javascript:f_seleccionar_poliza('" + SSEGURO + "','" + SPRODUC + "','"+ NPOLIZA+"')";
                  
                    newtd[0] = objLista.addRadioButtonEnLista("radioSSEGURO_"+SSEGURO, SSEGURO, jsFuncion); 
                
                    if (SSEGURO!=0){
                        newtd[1] = objLista.addTextoEnLista(CPOLIZA, jsFuncion);
                        newtd[2] = objLista.addTextoEnLista(formatedFEFECTO, jsFuncion);
                        newtd[3] = objLista.addTextoEnLista(AGENTE, jsFuncion);
                        newtd[4] = objLista.addTextoEnLista(PRODUCTO, jsFuncion);
                    }else{
                        newtd[1] = objLista.addTextoEnLista(CPOLIZA, jsFuncion);
                        newtd[2] = objLista.addTextoEnLista(formatedFEFECTO, jsFuncion);
                        newtd[3] = objLista.addTextoEnLista(AGENTE, jsFuncion);
                        newtd[4] = objLista.addTextoEnLista(PRODUCTO, jsFuncion);
                    }
                    // A?adimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
               
        }
        
        function callbackajaxPolizas(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(objAppMensajes.existenErroresEnAplicacion(doc)){
                return;
            }
            var SSEGURO ="";
            var NPOLIZA ="";
            var FEFECTO = "";
            var AGENTE = "";
            var PRODUCTO ="";
            try{
                SSEGURO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), 0, 0);
            }catch(e){}
            try{
                NPOLIZA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), 0, 0) +'-'+  objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCERTIF"), 0, 0);
            }catch(e){}
            try{
                FEFECTO =objUtiles.formateaTimeStamp2( objDom.getValorNodoDelComponente(doc.getElementsByTagName("FEFECTO"), 0, 0));
            }catch(e){}
            try{
               PRODUCTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), 0, 0)+'-'+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPRODUC"), 0, 0);
            }catch(e){}
            try{
                ESTADO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TSITUAC"), 0, 0);
            }catch(e){}
           
            objDom.setValorPorId ("SSEGURO", SSEGURO);
            objDom.setValorPorId ("NPOLIZA", NPOLIZA);
            objDom.setValorPorId ("FEFECTO", FEFECTO);
            objDom.setValorPorId ("PRODUCTOP", PRODUCTO);
            objDom.setValorPorId ("ESTADO", ESTADO);
            objAjax.invokeAsyncCGI("axis_axiscob001.do", callbackajaxBuscarPersona, "operation=ajax_buscar_persona&SSEGURO="+SSEGURO, this)
            
        }
        
        
        
        function callbackajaxBuscarPersona(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            objLista.borrarFilasDeLista ("lstper", "5", "<axis:alt f='axiscob001' c='LSTCTACLIENTE' lit='1000254'/>");
            objDom.setValorPorId ("SPERSON", "");
            if(objAppMensajes.existenErroresEnAplicacion(doc)){
                return;
            }
            
            if (!objDom.existeTag(doc, "SPERSON")){
                return;
            }
             var tbodyadded = objLista.obtenerBodyLista("lstper");
             var tradded = objLista.obtenerFilasBodyLista("lstper", tbodyadded);
            // Si hay registros, eliminamos el tr "No se han encontrado datos"
             objLista.borrarFilaVacia(tbodyadded, tradded);
             
             
           
             for (var i = 0; i < objDom.numeroDeTags(doc, "SPERSON") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a a?adir a la nueva fila del displayTag
                    var newtd = new Array(5);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    
                   // var SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), i, 0);
                   // var TIDE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIDE"), i, 0);
                   // var IDENTIFICACION   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDENTIFICACION"), i, 0);
                   // var NOMBRE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), i, 0);
                   // var FNAC   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("FNAC"), i, 0);
              
                   var SPERSON   = "";
                   var TIDE   = "";
                   var IDENTIFICACION   = "";
                   var NOMBRE   = "";
                   var FNAC   = "";
                   
                   
                   
                   try{
                      SPERSON   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), i, 0);
                    }catch(e){
                      SPERSON="";}
			         
					try{
                      TIDE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIDE"), i, 0);
                    }catch(e){
                      TIDE="";}
			        
                    try{
                      IDENTIFICACION   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDENTIFICACION"), i, 0);
                    }catch(e){
                      IDENTIFICACION="";}
			  					
			        try{
                      NOMBRE   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), i, 0);
                    }catch(e){
                      NOMBRE="";}
			        
					try{
                      FNAC   = objDom.getValorNodoDelComponente(doc.getElementsByTagName("FNAC"), i, 0);
                    }catch(e){
                      FNAC="";}

                    var formatedFNAC = objUtiles.formateaTimeStamp2(FNAC);
                    
                    var jsFuncion = "javascript:f_seleccionar_persona('" + SPERSON + "', '" + NOMBRE +"')";
                    
                    newtd[0] = objLista.addRadioButtonEnLista("radioSPERSON_"+SPERSON, SPERSON, jsFuncion); 
                    
                    if (SPERSON!=0){
                        newtd[1] = objLista.addTextoEnLista(TIDE, jsFuncion);
                        newtd[2] = objLista.addTextoEnLista(IDENTIFICACION, jsFuncion);
                        newtd[3] = objLista.addTextoEnLista(NOMBRE, jsFuncion);
                        newtd[4] = objLista.addTextoEnLista(FNAC, jsFuncion);
                    }else{
                       newtd[1] = objLista.addTextoEnLista(TIDE, jsFuncion);
                        newtd[2] = objLista.addTextoEnLista(IDENTIFICACION, jsFuncion);
                        newtd[3] = objLista.addTextoEnLista(NOMBRE, jsFuncion);
                        newtd[4] = objLista.addTextoEnLista(FNAC, jsFuncion);
                    }
                    // A?adimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbodyadded);
                }
               
        }
        /****************************************************************************************/
        /*********************************** FUNCIONALIDADES **************************************/
        /****************************************************************************************/ 
        
        function f_seleccionar_poliza(sseguro,sproduc,npoliza){
            var sseguroAnterior= objDom.getValorPorId ("SSEGURO");
            if (!objUtiles.estaVacio(sseguroAnterior)){
                objDom.setComponenteMarcado(document.getElementById("radioSSEGURO_"+sseguroAnterior ), false);
            }   
            objDom.setComponenteMarcado(document.getElementById("radioSSEGURO_"+sseguro), true);
            objDom.setValorPorId ("SSEGURO", sseguro);
            objDom.setValorPorId ("SPRODUC", sproduc);
            objDom.setValorPorId ("NPOLIZA_D", npoliza);
            f_but_buscar();
        }
        function f_seleccionar_persona(sperson, nombre){
            var spersonAnterior= objDom.getValorPorId ("SPERSON");
            if (!objUtiles.estaVacio(spersonAnterior)){
                objDom.setComponenteMarcado(document.getElementById("radioSPERSON_"+spersonAnterior ), false);
            }   
            objDom.setComponenteMarcado(document.getElementById("radioSPERSON_"+sperson), true);
            objDom.setValorPorId ("SPERSON", sperson);
            objDom.setValorPorId("NOMBRETOM", nombre);
            f_but_buscar();
        }
        function f_seleccionar_busqueda(tipo){
            var tipoBus= tipo; 
            if (objUtiles.estaVacio(tipoBus) || tipoBus=="1" ){
                   objDom.setComponenteMarcado(document.getElementById("BUSPER" ), true);
                   objDom.setComponenteMarcado(document.getElementById("BUSPOL" ), false);
                   objDom.setValorPorId("TIPOBUSQUEDA","1"); 
                   objDom.setValorPorId ("NPOLIZA", "");
                   objDom.setValorPorId ("FEFECTO", "");
                   objDom.setValorPorId ("PRODUCTOP", "");
                   objDom.setValorPorId ("ESTADO", "");
                   
            }else{
                   objDom.setComponenteMarcado(document.getElementById("BUSPER" ), false);
                   objDom.setComponenteMarcado(document.getElementById("BUSPOL" ), true);
                   objDom.setValorPorId("TIPOBUSQUEDA","2"); 
                   objDom.setValorPorId ("TTIPIDE", "");
                   objDom.setValorPorId ("NNUMIDE", "");
                   objDom.setValorPorId ("NOMBRE", "");
                   objDom.setValorPorId ("SNIP", "");
            }   
            objDom.setValorPorId("SPERSON","");
            objDom.setValorPorId("SSEGURO",""); 
            f_cargar_propiedades_pantalla(); 
            objLista.borrarFilasDeLista ("lstMov", "10", "<axis:alt f='axiscob001' c='LSTMOV' lit='1000254'/>");
            objLista.borrarFilasDeLista ("lstpol", "5", "<axis:alt f='axiscob001' c='LSTCTACLIENTE' lit='1000254'/>");
            objLista.borrarFilasDeLista ("lstper", "5", "<axis:alt f='axiscob001' c='LSTCTACLIENTE' lit='1000254'/>");
            
          
        }
        
        function f_seleccionar(NSEQCAJA, NNUMLIN){
            objUtiles.abrirModal("axiscaj020", "src", "modal_axiscaj020.do?operation=form&NSEQCAJAO=" + NSEQCAJA + "&NNUMLINO=" + NNUMLIN);
        }
    </script>
    
  <body onload="f_onload()"><form name="miForm" action="" method="POST">
  
        <input type="hidden" name="operation" value="buscar"/>
        <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" id="NPOLIZA_D" name="NPOLIZA_D" value="${__formdata.NPOLIZA_D}"/>
        <input type="hidden" id="NOMBRETOM" name="NOMBRETOM" value="${sessionScope.NOMBRETOM}"/>
        <input type="hidden" id="TIPOBUSQUEDA" name="TIPOBUSQUEDA" value="${__formdata.TIPOBUSQUEDA}"/>
      
      
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9905061"/>
            </c:param>
            <c:param name="formulario">
            <axis:alt f="axiscob001" c="FORM" lit="9905061"/>
            </c:param>
        <c:param name="form">axiscob001</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
            axisper021|
            <axis:alt f="axiscob001" c="TIT_007" lit="1000235"/>
            </c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9908117"/>
            </c:param>
            <c:param name="nid" value="axiscob001a"/>
        </c:import> 
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9908006"/>
            </c:param>
            <c:param name="nid" value="axiscob001c"/>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9908006"/>
            </c:param>
            <c:param name="nid" value="axiscob001d"/>
        </c:import>     
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
            <axis:alt f="axiscob001" c="TITULO" lit="9907993"/>
            </c:param>
            <c:param name="nid" value="axisadm094"/>
        </c:import>  
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
            axisctr019|
            <axis:alt f="axiscob001" c="TIT_007" lit="1000235"/>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisadm094" c="MOVCAJA" lit="9907918"/></c:param>
            <c:param name="nid" value="axiscaj020"/>
        </c:import> 
      <!-- Área de campos  -->
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <%  HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);  %>
        <td>
             <div class="titulo">
              <img src="images/flecha.gif"/>
              <axis:alt f="axiscob001" c="Buscador" lit="1000206"/><!--1000206 Buscador-->
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
              <tr >
                <td align="left">
                   <table class="area" align="center">
                        <tr>
                          <th style="width:20%;height:0px">&nbsp;</th>
                          <th style="width:20%;height:0px">&nbsp;</th>
                          <th style="width:20%;height:0px">&nbsp;</th>
                          <th style="width:20%;height:0px">&nbsp;</th>
                          <th style="width:20%;height:0px">&nbsp;</th>
                        </tr>
                        <tr>
                            <td  align="right">
                              <b> <axis:alt f="axiscob001" c="BUSQ" lit="111523"/> </b>
                            </td>
                            <td align="left">
                             <input type="radio"
                                         class="campowidthinput campo campotexto" 
                                         id="BUSPER" 
                                         name="BUSPER"
                                         value="1"
                                         onclick="f_seleccionar_busqueda(1)"
                                          <c:if test="${(!empty __formdata.BUSPER) || (empty __formdata.BUSPOL)}" var="resp">
                                            checked="checked" 
                                          </c:if> 
                                         />
                            </td>
                              <td align="right">
                                  <b> <axis:alt f="axiscob001" c="BUSQ" lit="9001875"/> </b>
                              </td>
                              <td align="left">
                                  <input type="radio"
                                         class="campowidthinput campo campotexto" 
                                         id="BUSPOL" 
                                         name="BUSPOL"
                                          value="1"
                                         onclick="f_seleccionar_busqueda(2)"
                                         <c:if test="${!empty __formdata.BUSPOL }" >
                                            checked="checked"
                                         </c:if> 
                                         />
                              </td> 
                               <td align="left">
                               &nbsp;
                              </td> 
                       </tr>
                      
                  </table>
                </td>
               </tr>
            </table>
        </td>
       </tr>
        
       <tr id="SECBUSPER">
          <td >
            <!-- Seccion de datos de persona  -->
            <div class="titulo">
              <img src="images/flecha.gif"/>
               
              <axis:alt f="axiscob001" c="DATOS_PERSO" lit="110275"/>
               
              <img border="0" src="images/find.gif" onclick="f_buscar_persona()" style="cursor:pointer" alt='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'
                   title='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'/>
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr>
                      <th style="width:30%;height:0px">&nbsp;</th>
                      <th style="width:30%;height:0px">&nbsp;</th>
                      <th style="width:40%;height:0px">&nbsp;</th>
                    </tr>
                    <tr>
                      <!-- Número de documento -->
                      <axis:ocultar f="axiscob001" c="NNUMIDE" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_NNUMIDE"><axis:alt f="axiscob001" c="NNUMIDE" lit="105330"/></b>
                        </td>
                      </axis:ocultar>
                      <!-- Nombre -->
                      <axis:ocultar f="axiscob001" c="NOMBRE" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_NOMBRE"><axis:alt f="axiscob001" c="NOMBRE" lit="105940"/></b>
                        </td>
                      </axis:ocultar>
                      <!-- Identificador externo 
                      <axis:ocultar f="axiscob001" c="SNIP" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_SNIP"><axis:alt f="axiscob001" c="SNIP" lit="1000088"/></b>
                        </td>
                      </axis:ocultar>-->
                        <td class="titulocaja">
                         &nbsp;
                        </td>
                    </tr>
                    <tr>
                      <!-- Número de documento -->
                      <axis:ocultar f="axiscob001" c="NNUMIDE" dejarHueco="false">
                        <td class="campocaja" style="white-space:nowrap;">
                          <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TTIPIDE}" name="TTIPIDE" id="TTIPIDE" size="30" style="width:20%"
                                 title='<axis:alt f="axiscob001" c="TTIPIDE" lit="105330"/>' <axis:atr f="axiscob001" c="TTIPIDE" a="modificable=false&obligatorio=true"/>/>
                          <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" size="30" style="width:70%"
                                 title='<axis:alt f="axiscob001" c="NNUMIDE" lit="105330"/>' <axis:atr f="axiscob001" c="NNUMIDE" a="modificable=false&obligatorio=true"/>/>
                        </td>
                      </axis:ocultar>
                      <!-- Nombre -->
                      <axis:ocultar f="axiscob001" c="NOMBRE" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" name="NOMBRE" id="NOMBRE" size="15" value="${__formdata.NOMBRE}"
                                 title='<axis:alt f="axiscob001" c="NOMBRE" lit="105940"/>' <axis:atr f="axiscob001" c="NOMBRE" a="modificable=false"/>/>
                        </td>
                      </axis:ocultar>
                      <!-- Identificador externo 
                      <axis:ocultar f="axiscob001" c="SNIP" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" name="SNIP" id="SNIP" size="15" value="${__formdata.SNIP}"
                                 title='<axis:alt f="axiscob001" c="SNIP" lit="1000088"/>' <axis:atr f="axiscob001" c="SNIP" a="modificable=false"/>/>
                        </td>
                      </axis:ocultar>-->
                      <td class="campocaja">
                         &nbsp;
                        </td>
                    </tr>
                  </table>
                  <!--Fin seccion de datos de persona  -->
                </td>
              </tr>
            </table>
          </td>
        </tr>
       
        <tr id="SECBUSPER2">
          <td >
            <!-- Seccion de datos de Poliza  -->
            <div class="separador">&nbsp;</div>
            <div class="titulo">
              <img src="images/flecha.gif"/>
               
              <axis:alt f="axiscob001" c="DATOSPOL" lit="104925"/>
              
            </div>
            <table class="seccion">
              <td align="left">
                <table class="area" align="center">
                  <tr>
                    <th style="width:100%;height:0px">&nbsp;</th>
                  </tr>
                  <!-- LISTA -->
                  <tr>
                    <td class="titulocaja">
                      <c:set var="title0">
                        <axis:alt f="axiscob001" c="NROPOLIZA" lit="9001639"/>
                        <!--9001639 Nº póliza-->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axiscob001" c="FEFECTO" lit="100883"/>
                        <!--100883 Fecha efecto-->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axiscob001" c="AGENTE" lit="100584"/>
                        <!--100584 Agente-->
                      </c:set>
                      <c:set var="title3">
                        <axis:alt f="axiscob001" c="TITULO" lit="100829"/>
                        <!-- 100829 Producto-->
                      </c:set>
                      <div id="dt_recibos"  class="seccion displayspaceGrande">
                         <display:table name="${sessionScope.listaPolizas}" id="lstpol"  export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axiscob001.do?paginar=true">
                          <%@ include file="../include/displaytag.jsp"%>
                          <display:column title="" sortable="false" sortProperty="" headerClass="sortable" media="html" autolink="false">
                            <div class="dspIcons">
                              <input name="radioSSEGURO_${ lstpol.SSEGURO }" onclick="javascript:f_seleccionar_poliza('${ lstpol.SSEGURO }','${ lstpol.SPRODUC}','${ lstpol.NPOLIZA}')" type="radio" value="${ lstpol.SSEGURO }"
                                     id="radioSSEGURO_${ lstpol.SSEGURO }"
                                    ${(__formdata.SSEGURO == lstpol.SSEGURO)? 'checked' : '' } />
                            </div>
                          </display:column>
                          <display:column title="${title0}" sortable="false" sortProperty="NPOLIZA" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_poliza('${ lstpol.SSEGURO }','','${lstpol.NPOLIZA}')">
                              <c:if test="${empty lstpol.NCERTIF}" var="isEmptyNcertif">
                                  ${lstpol.NPOLIZA}
                              </c:if>
                               <c:if test="${!isEmptyNcertif}" >
                                 ${lstpol.NPOLIZA}-${lstpol.NCERTIF}
                              </c:if>
                              </a>
                            </div>
                          </display:column>
                          <display:column title="${title1}" sortable="false" sortProperty="FEFECTO" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_poliza('${ lstpol.SSEGURO }','','${lstpol.NPOLIZA}')">
                               <fmt:formatDate value='${ lstpol.FEFECTO }' pattern='dd/MM/yyyy'/>  
                              </a>
                            </div>
                          </display:column>
                          <display:column title="${title2}" sortable="false" sortProperty="CAGENTE" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_poliza('${ lstpol.SSEGURO }','','${lstpol.NPOLIZA}')">
                                ${ lstpol.CAGENTE  }-${ lstpol.TAGENTE }
                              </a>
                            </div>
                          </display:column>
                          <display:column title="${title3}" sortable="false" sortProperty="TTITULO" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_poliza('${ lstpol.SSEGURO }','','${lstpol.NPOLIZA}')">
                                ${ lstpol.TTITULO }
                              </a>
                            </div>
                          </display:column>
                        </display:table>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </table>
            <!--Fin seccion de datos de Poliza  -->
          </td>
        </tr>
        
       <tr id="SECBUSPOL">
          <td >
            <!-- Seccion de datos de Poliza busqueda  -->
            <div class="titulo">
              <img src="images/flecha.gif"/>
              <axis:alt f="axiscob001" c="DATOSPOL" lit="104925"/>
              <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer" alt='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'
                   title='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'/>
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr>
                      <th style="width:10%;height:0px">&nbsp;</th>
                      <th style="width:10%;height:0px">&nbsp;</th>
                      <th style="width:25%;height:0px">&nbsp;</th>
                      <th style="width:10%;height:0px">&nbsp;</th>
                       <th style="height:0px">&nbsp;</th>
                    </tr>
                    <tr>
                      <!-- Número de poliza 100624 Nº póliza-->
                      <axis:ocultar f="axiscob001" c="NPOLIZA" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_NPOLIZA"><axis:alt f="axiscob001" c="NPOLIZA" lit="100624"/></b>
                        </td>
                      </axis:ocultar>
                      <!-- Fecha efecto 100883 Fecha efecto -->
                      <axis:ocultar f="axiscob001" c="FEFECTO" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_FEFECTO"><axis:alt f="axiscob001" c="FEFECTO" lit="100883"/></b>
                        </td>
                      </axis:ocultar>
                      <!-- Producto 100829 Producto -->
                      <axis:ocultar f="axiscob001" c="PRODUCTOP" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_PRODUCTOP"><axis:alt f="axiscob001" c="PRODUCTOP" lit="100829"/></b>
                        </td>
                      </axis:ocultar>
                      <!-- Estado 9901776 Situación Póliza -->
                      <axis:ocultar f="axiscob001" c="ESTADO" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_ESTADO"><axis:alt f="axiscob001" c="ESTADO" lit="9901776"/></b>
                        </td>
                      </axis:ocultar>
                       <td class="titulocaja">
                            &nbsp;
                       </td>
                    </tr>
                    <tr>
                      <!-- Número de Poliza -->
                      <axis:ocultar f="axiscob001" c="NPOLIZA" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" size="30"
                                 title='<axis:alt f="axiscob001" c="NPOLIZA" lit="100624"/>' <axis:atr f="axiscob001" c="NPOLIZA" a="modificable=false&obligatorio=true"/>/>
                        </td>
                      </axis:ocultar>
                      <!-- Fecha Efecto -->
                      <axis:ocultar f="axiscob001" c="FEFECTO" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" name="FEFECTO" id="FEFECTO" size="15"
                                 value="<fmt:formatDate value='${__formdata.FEFECTO}' pattern='dd/MM/yyyy'/>" 
                                 title='<axis:alt f="axiscob001" c="FEFECTO" lit="100883"/>' <axis:atr f="axiscob001" c="FEFECTO" a="modificable=false"/>/>
                        </td>
                      </axis:ocultar>
                      <!--Proucto -->
                      <axis:ocultar f="axiscob001" c="PRODUCTOP" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" name="PRODUCTOP" id="PRODUCTOP" size="15" value="${__formdata.PRODUCTOP}" 
                                 title='<axis:alt f="axiscob001" c="PRODUCTOP" lit="100829"/>' <axis:atr f="axiscob001" c="PRODUCTOP" a="modificable=false"/>/>
                        </td>
                      </axis:ocultar>
                       <!-- Estado -->
                      <axis:ocultar f="axiscob001" c="ESTADO" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" class="campowidthinput campo campotexto" name="ESTADO" id="ESTADO" size="15" value="${__formdata.ESTADO}"
                                 title='<axis:alt f="axiscob001" c="ESTADO" lit="9901776"/>' <axis:atr f="axiscob001" c="ESTADO" a="modificable=false"/>/>
                        </td>
                      </axis:ocultar>
                       <td class="campocaja">
                            &nbsp;
                       </td>
                    </tr>
                  </table>
                  <!--Fin seccion de datos de persona  -->
                </td>
              </tr>
            </table>
          </td>
        </tr>
       
           <tr id="SECBUSPOL2">
          <td >
            <!-- Seccion de datos de Poliza  -->
            <div class="separador">&nbsp;</div>
            <div class="titulo">
              <img src="images/flecha.gif"/>
               
             <axis:alt f="axiscob001" c="DATOS_PERSO" lit="110275"/>
              
            </div>
            <table class="seccion">
              <td align="left">
                <table class="area" align="center">
                  <tr>
                    <th style="width:100%;height:0px">&nbsp;</th>
                  </tr>
                  <!-- LISTA -->
                  <tr>
                    <td class="titulocaja">
                      <c:set var="title0">
                        <axis:alt f="axiscob001" c="TIDE" lit="150996"/>
                        <!--150996 Tipo documento-->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axiscob001" c="IDENTIFICACION" lit="9904434"/>
                        <!--1000559 Nº identificativo-->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axiscob001" c="NOMBRE" lit="105940"/>
                        <!--105940 Nombre-->
                      </c:set>
                      <c:set var="title3">
                        <axis:alt f="axiscob001" c="FNAC" lit="1000064"/>
                        <!-- 1000064 Fecha nacimiento-->
                      </c:set>
                      <div id="dt_recibos" class="seccion displayspaceGrande">
                         <display:table name="${sessionScope.listaPersonas}" id="lstper" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axiscob001.do?paginar=true">
                          <%@ include file="../include/displaytag.jsp"%>
                          <display:column title="" sortable="true" sortProperty="" headerClass="sortable" media="html" autolink="false">
                            <div class="dspIcons">
                              <input name="radioSPERSON_${ lstper.SPERSON }" onclick="javascript:f_seleccionar_persona('${ lstper.SPERSON }', '${ lstper.NOMBRE}')" type="radio" value="${ lstper.SPERSON }"
                                     id="radioSPERSON_${ lstper.SPERSON }"
                                    ${(__formdata.SPERSON == lstper.SPERSON)? 'checked' : '' } />
                            </div>
                          </display:column>
                          <display:column title="${title0}" sortable="true" sortProperty="TIDE" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_persona('${ lstper.SPERSON }, '${ lstper.NOMBRE}'')">
                                  ${lstper.TIDE}
                              </a>
                            </div>
                          </display:column>
                           <display:column title="${title1}" sortable="true" sortProperty="IDENTIFICACION" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_persona('${ lstper.SPERSON }', '${ lstper.NOMBRE}')">
                                 ${lstper.IDENTIFICACION} 
                              </a>
                            </div>
                          </display:column>
                          <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false">
                            <div class="dspText">
                              <a href="javascript:f_seleccionar_persona('${ lstper.SPERSON }', '${ lstper.NOMBRE}')">
                              ${ lstper.NOMBRE }
                              </a>
                            </div>
                          </display:column>
                          <display:column title="${title3}" sortable="true" sortProperty="FNAC" headerClass="sortable" media="html" autolink="false">
                             <div class="dspText">
                              <a href="javascript:f_seleccionar_persona('${lstper.SPERSON }', '${ lstper.NOMBRE}')">
                             ${ lstper.FNAC }
                              </a>
                            </div>
                          </display:column>
                          
                        </display:table>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </table>
            <!--Fin seccion de datos de Poliza  -->
          </td>
        </tr>
       
       
       
        <tr>
          <td>
            <!-- Seccion de datos de filtros  -->
            <div class="separador">&nbsp;</div>
            <div class="titulo">
              <img src="images/flecha.gif"/><axis:alt f="axiscob001" c="FILTRO" lit="1000178"/>
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr>
                      <th style="width:16%;height:0px">&nbsp;</th>
                      <th style="width:16%;height:0px">&nbsp;</th>
                      <th style="width:16%;height:0px">&nbsp;</th>
                      <th style="width:16%;height:0px">&nbsp;</th>
                      <th style="width:16%;height:0px">&nbsp;</th>
                      <th style="width:16%;height:0px">&nbsp;</th>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscob001" c="FECHAINI" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_FECHAINI"><axis:alt f="axiscob001" c="FECHAINI" lit="9000526"/></b>
                          <%-- Nº póliza--%>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscob001" c="FECHAFIN" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_FECHAFIN"><axis:alt f="axiscob001" c="FECHAFIN" lit="9000527"/></b>
                          <%-- Cert.--%>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscob001" c="TCONCEP" dejarHueco="false">
                        <td class="titulocaja">
                          <b id="label_TCONCEP"><axis:alt f="axiscob001" c="TCONCEP" lit="1000591"/></b>
                          <%-- Situación--%>
                        </td>
                      </axis:ocultar>
                       <!--
                      <axis:ocultar f="axiscob001" c="CMEDMOV" dejarHueco="false">
                        <td class="titulocaja" colspan="2">
                          <b id="label_CMEDMOV"><axis:alt f="axiscob001" c="CMEDMOV" lit="9902444"/></b>
                          <%-- Producto--%>
                        </td>
                      </axis:ocultar>
                      -->
                      <axis:ocultar f="axiscob001" c="IMPORTE" dejarHueco="false">
                        <td class="titulocaja" colspan="2">
                          <b id="label_IMPORTE"><axis:alt f="axiscob001" c="IMPORTE" lit="9904351"/></b>
                          <%-- Producto--%>
                        </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscob001" c="FECHAINI" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="FECHAINI" name="FECHAINI" title='<axis:alt f="axiscob001" c="FECHAINI" lit="9000526"/>'
                                 size="15" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FECHAINI}'/>" <axis:atr f="axiscob001" c="FECHAINI" a="modificable=true&formato=fecha"/>/>
                          <a id="icon_FECHAINI" style="vertical-align:middle;" href="#">
                            <img id="popup_calendario_FECHAINI" border="0" src="images/calendar.gif"/>
                          </a>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscob001" c="FECHAFIN" dejarHueco="false">
                        <td class="campocaja">
                          <input type="text" style="width:60%" class="campowidthinput campo campotexto" id="FECHAFIN" name="FECHAFIN" title='<axis:alt f="axiscob001" c="FECHAFIN" lit="9000527"/>'
                                 size="15" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FECHAFIN}'/>"
                                 <axis:atr f="axiscob001" c="FECHAFIN" a="modificable=true&formato=fecha"/>/>
                          <a id="icon_FECHAFIN" style="vertical-align:middle;" href="#">
                            <img id="popup_calendario_FECHAFIN" border="0" src="images/calendar.gif"/>
                          </a>
                        </td>
                      </axis:ocultar>
                      <axis:ocultar f="axiscob001" c="TCONCEP" dejarHueco="false">
                        <td class="campocaja">
                          <select name="TCONCEP" id="TCONCEP" size="1" class="campowidthselect campo campotexto" style="width:90%;" title='<axis:alt f="axiscob001" c="TCONCEP" lit="1000591"/>'>
                            <option value="<%= Integer.MIN_VALUE %>">
                              -
                              <axis:alt f="axiscob001" c="TCONCEP" lit="1000591"/>
                              -
                            </option>
                            <c:forEach var="element" items="${sessionScope.listaTiposMovimientos}">
                              <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.TCONCEP}"> selected </c:if>/>
                              ${element.TATRIBU}
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      <!--
                      <axis:ocultar f="axiscob001" c="CMEDMOV" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                          <select name="CMEDMOV" id="CMEDMOV" size="1" class="campowidthselect campo campotexto" style="width:90%;">
                            <option value="<%= Integer.MIN_VALUE %>">
                              -
                              <axis:alt f="axiscob001" c="CMEDMOV" lit="9902444"/>
                              -
                            </option>
                            <c:forEach var="element" items="${sessionScope.listaMedioPago}">
                              <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.CMEDMOV}"> selected </c:if>>
                                ${element.TATRIBU}
                              </option>
                            </c:forEach>
                          </select>
                        </td>
                      </axis:ocultar>
                      -->
                      <axis:ocultar f="axiscob001" c="IMPORTE" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                          <input type="text" class="campowidthinput campo campotexto" id="IMPORTE" name="IMPORTE" size="15" value="${__formdata.IMPORTE}" style="width:90%"
                                 title='<axis:alt f="axiscob001" c="IMPORTE" lit="9904351"/>' <axis:atr f="axiscob001" c="IMPORTE" a="modificable=true"/>/>
                        </td>
                      </axis:ocultar>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <!--Fin seccion de datos de Poliza  -->
          </td>
        </tr>
        <tr>
          <td>
            <div class="separador">&nbsp;</div>
            <div class="titulo">
              <img src="images/flecha.gif"/><axis:alt f="axiscob001" c="FLECHA" lit="1000345"/>
            </div>
            <!-- Sección 1 -->
            <table class="seccion">
              <td align="left">
                <table class="area" align="center">
                  <tr>
                    <th style="width:100%;height:0px">&nbsp;</th>
                  </tr>
                   <tr>
            <td class="titulocaja" colspan="5" align="right" >
                      
                 </td>
                 </tr>
                  <!-- LISTA -->
                  <tr>
                    <td class="titulocaja">
                      <%-- DisplayTag Facturas--%>
                      <c:set var="title0">
                        <axis:alt f="axiscob001" c="NNUMLIN" lit="100899"/><!-- 100899 Número -->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axiscob001" c="FFECMOV" lit="1000597"/><!--1000597 Fecha día -->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axiscob001" c="FFECVAL" lit="1000590"/><!-- 1000590 Fecha valor -->
                      </c:set>
                       <c:set var="title3">
                        <axis:alt f="axiscob001" c="CMOVIMI" lit="1000591"/><!--1000591 Tipo movimiento -->
                      </c:set>
                      <c:set var="title30">
                        <axis:alt f="axiscob001" c="TDESCRI" lit="101761"/><!--101761 Descripción-->
                      </c:set>
                      <c:set var="title4">
                        <axis:alt f="axiscob001" c="CMEDMOV" lit="9902444"/><!-- 9902444 Medio de Pago -->
                      </c:set>
                      <c:set var="title5">
                        <axis:alt f="axiscob001" c="NCHEQUE" lit="9905071"/><!-- 9905071 Cheque -->
                      </c:set>
                       <c:set var="title6">
                        <axis:alt f="axiscob001" c="IIMPPRO"   lit="9905111"/><!-- 9905111 Importe Moneda Producto  -->
                      </c:set>
                       <c:set var="title7">
                        <axis:alt f="axiscob001" c="CMONEDA" lit="108645"/><!--108645 Moneda -->
                      </c:set>
                       <c:set var="title8">
                        <axis:alt f="axiscob001" c="IIMPOPE" lit="100563"/><!-- 100563 Importe -->
                      </c:set>
                      <c:set var="title9">
                        <axis:alt f="axiscob001" c="IIMPINS" lit="9905112"/><!-- 9905112 Importe Moneda Sistema -->
                      </c:set>
                      <c:set var="title10">
                        <axis:alt f="axiscob001" c="FCAMBIO" lit="9900897"/><!-- 9900897 Fecha cambio -->
                      </c:set>
                      <c:set var="title11">
                        <axis:alt f="axiscob001" c="ISALDO" lit="9001942"/><!-- 9001942 Saldo -->
                      </c:set>
                      <c:set var="title12">
                        <axis:alt f="axiscob001" c="TMOVIMI" lit="1000591"/><!--1000591 Tipo movimiento -->
                      </c:set>
                      <c:set var="title13">
                        <axis:alt f="axiscob001" c="TMEDMOV" lit="9902444"/><!-- 9902444 Medio de Pago -->
                      </c:set>
                       <c:set var="title14">
                        <axis:alt f="axiscob001" c="TMEDMOV" lit="9001285"/><!-- REFERENCIA DEPOSITO-->
                      </c:set>
                      
                      <div id="dt_recibos" class="seccion displayspaceGrande">
                        <display:table name="${__formdata.OBTENERMOVIMIENTOS}" id="lstMov" export="false" class="dsptgtable" pagesize="-1" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axiscob001.do?paginar=true" style="width:100%" >
                          <%@ include file="../include/displaytag.jsp"%>
                           
                            <axis:visible f="axiscob001" c="NREFDEPOSITO" >
                            
                            <display:column title="${title14}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.NREFDEPOSITO}
                              </div>
                            </display:column>
                            
                            </axis:visible>
                           
                            <axis:visible f="axiscob001" c="DATE" >
                             <display:column title="${title1}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECMOV}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                            
                             <axis:visible f="axiscob001" c="VALUE_DATE" >
                             <display:column title="${title2}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECVAL}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                            
                            
                            <axis:visible f="axiscob001" c="TMOVIMI" >
                            
                            <display:column title="${title12}" headerClass="sortable" media="html" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.TMOVIMI}
                              </div>
                            </display:column>
                            
                            </axis:visible>
                            
                             <display:column title="${title30}" headerClass="sortable" media="html">
                              <div class="dspText">
                                ${lstMov.TDESCRI}
                              </div>
                            </display:column>
                            
                             <display:column title="${title8}" headerClass="sortable" media="html" style="white-space:nowrap; " >
                              <div class="dspNumber">
                                <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDA]}" value="${lstMov.IIMPOPE}"/> ${lstMov.CMONEDA} 
                              </div>
                            </display:column>
                             <display:column title="${title6}" headerClass="sortable" media="html" style="white-space:nowrap; " >
                               <div class="dspNumber">
                                    <fmt:formatNumber pattern="${__formatNumberPatterns[lstMov.CMONEDAPRO]}" value="${lstMov.IIMPPRO}"/> ${lstMov.CMONEDAPRO}
                              </div>
                            </display:column>
                            <display:column title="${title9}" headerClass="sortable" media="html" style="white-space:nowrap;">
                               <div class="dspNumber">
                                  <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.IIMPINS}"/> ${lstMov.CMONEDAINS}
                              </div>
                            </display:column>
                             <display:column title="${title10}" headerClass="sortable" media="html" >
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FCAMBIO}'/> 
                              </div> 
                            </display:column>
                             <display:column title="${title11}" headerClass="sortable" media="html" style="white-space:nowrap; ">
                             <div class="dspNumber">
                              <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.ISALDO}"/> ${lstMov.CMONEDAINS}
                              
                              </div>
                              
                            </display:column>
                            
                             
                            
                            
                             <display:column title="" sortable="true" sortProperty="ISALDO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; ">
                             <div class="dspNumber">
                            <img border="0" src="images/firmar.gif" onclick="f_abrir_axiscob001c('${lstMov.SEQCAJA}');" style="cursor:pointer" alt="Add" title="Add"/>
                            </div>
                            </display:column>
                            
                            
                            <axis:visible f="axiscob001" c="MAS" >
                            <display:column title="" sortable="true" sortProperty="ISALDO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; ">
                            <div class="dspNumber">
                            <img border="0" src="images/mas.gif" onclick="f_abrir_axiscob001d('${lstMov.SEQCAJA}');" style="cursor:pointer" alt="Add" title="Add"/>
                            </div>
                            </display:column>
                            </axis:visible>
                            
                            <display:column title="" sortable="true" 
                                            sortProperty="" headerClass="sortable fixed" 
                                            media="html"  autolink="false" style="width:3%;" >
                                <div class="dspIcons" >
                                <img border="0" alt="<axis:alt c="BT_CONSULTAR" f="axiscob001" lit="1000113"/>" 
                                     title="<axis:alt c="BT_CONSULTAR" f="axisadm094" lit="1000113"/>" src="images/informacion.gif" width="12px" height="12px"
                                     style="cursor:pointer;" onClick="javascript:f_seleccionar('${lstMov.SEQCAJA}', '${lstMov.NNUMLIN2}')" />
                                </div>
                            </display:column>
                            
                            
                            
                        </display:table>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </table>
          </td>
        </tr>
        <!-- Fin de seccion cuentas contables -->
      </table>
      <div class="separador">&nbsp;</div>
      <div class="separador">&nbsp;</div>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscob001</c:param><c:param name="__botones">salir<axis:visible f="axiscob001" c="BT_REEMBOLSAR" >,9908115</axis:visible>,buscar</c:param>
      </c:import>
       <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FECHAINI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FECHAINI", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FECHAFIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FECHAFIN", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>