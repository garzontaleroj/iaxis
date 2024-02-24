<%/* Revision:# AVjEPTY2ONQjvob/5wFJvw== # */%>
<%/**
*  Fichero: axisctr038.jsp
*******************************************
* Modificaciones de pantalla, arreglos visuales de pantalla, añadir botones de buscar y buscar Host(cuentas)
* Añadir configuraciones de pantalla por CFG, formatos numericos en IMPORTE
*  Fecha: 12/11/2008
*/

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>     

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisctr038" c="TITULO" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <style type="text/css">
         div.fixedHeaderTable {
             position: relative;
             height: 100px;
             overflow-y: auto;
             overflow-x: hidden; 

         }
         
         div.fixedHeaderTable tbody {
             height: auto;
             position:relative;
         }

         div.fixedHeaderTable table {
            height: auto;
            border-width: thin;
            border-style: solid;
            border-color: #E6E6E6;
         }
         
         /* IE */
         div.fixedHeaderTable {
             *position: relative;
             *height: 100px;
             *overflow-y: auto;
             *overflow-x: hidden;
         }
         
         div.fixedHeaderTable tbody {
             *height: auto;
             *position:relative;
        }  
         
         div.fixedHeaderTable table {
            *height: auto;
            *border-width: thin;
            *border-style: solid;
            *border-color: #E6E6E6;  
         }
        </style>  
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
            
             
       
                //Si se ha entrado por segunda vez no mostrar el alert
                if (!objUtiles.existeObjeto(document.miForm.NPOLIZA) || objUtiles.estaVacio(objDom.getValorPorId("NPOLIZA"))){
                   f_abrir_axisctr019();
                }            
                
              <c:if test="${__configform.axisctr038__FECHA__modificable == 'false'}">
              objDom.setVisibilidadPorId("icon_FECHA", "hidden");
              </c:if>
              
              objDom.setDisabledPorId("but_aceptar", true);              
              f_cargar_aportante();
              try {
                f_actualiza_evoluprov("${__formdata.SSEGURO}","${__formdata.NESCENA}",null); 
              }
              catch (e){
                null; 
              }
              
              f_cargar_propiedades_pantalla();
              
            }
            
                     
            //function f_but_cancelar() {
            //    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisplantillajsp_general", "cancelar", document.miForm, "_self");
            //}
            
            //function f_but_tarifar() {
            //if (objValidador.validaEntrada()) {
            //    objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackTarifar, "operation=tarifar", this,  objJsMessages.jslit_cargando, false);
            //    }
            //}
            
            function recargar(IMPORTE){
                try{
                   IMPORTE = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                   if(objNumero.validaNumero(IMPORTE, true)) {
                        objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackAjaxRecargar, "operation=ajaxrecargar" + "&IMPORTE="+objDom.getValorPorId("IMPORTE"), this,  objJsMessages.jslit_cargando, false);
                   }else{
                    document.miForm.IMPORTE.value = '';
                    document.miForm.IMPORTE.focus();
                    objDom.setDisabledPorId("but_aceptar", true);
                    }
                   
               }catch(e){
                 alert (e.name + " " + e.message);
                }
            }
            
            function actualizaCuentas(){
            
                if(document.miForm.CTIPBAN.value==0){
                    //objDom.setDisabledPorId("CBANCAR", false);
                    objDom.setValorPorId("CUENTA", '');
                    objDom.setDisabledPorId("CUENTA", true);
                }else{
                    objDom.setValorPorId("CBANCAR", -1);
                    objDom.setValorPorId("BANCAR", -1);
                    //objDom.setDisabledPorId("CBANCAR", true);
                    objDom.setDisabledPorId("CUENTA", false);
                }
            }
            
            function actualizaTipos(obj){

                if(document.miForm.CBANCAR.value==0){
                    //objDom.setDisabledPorId("CTIPBAN", false);
                    objDom.setDisabledPorId("CUENTA", false);
                }else{                        
                    var valor = obj.value;                                        
                    var vec = valor.split("@@");
                    var TIPBAN = vec[0];
                    var CBANCAR = vec[1]; 
                    //objDom.setValorPorId("TIPBAN", TIPBAN);                                        
                    document.miForm.TIPBAN.value = TIPBAN;
                    document.miForm.BANCAR.value = CBANCAR;                    

                    objDom.setValorPorId("CTIPBAN", 0);
                    objDom.setValorPorId("CUENTA", '');

                    //objDom.setDisabledPorId("CTIPBAN", true);
                    objDom.setDisabledPorId("CUENTA", true);
                }
            }
            
      
       
       function f_cargar_aportante()
       {                   
              var SSEG = objDom.getValorPorId("SSEGURO");
              if (!objUtiles.estaVacio(SSEG)){              
                objAjax.invokeAsyncCGI("axis_axisctr038.do?CTIPAPOR="+objDom.getValorPorId("CTIPAPOR")+"&SSEGURO="+objDom.getValorPorId("SSEGURO"), callbackAjaxActualitzaPersona, "operation=ajax_actualizar_aportante", this, objJsMessages.jslit_cargando);
              }       
       }
       
       function f_rec_dependencias()
       {
            f_cargar_propiedades_pantalla();
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
        //alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);
        
        f_cerrar_modalespersona(modal);
        
        //alert("Em cerrar persona2");
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;
        //document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
       // alert("****"+CAGENTE);
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("axis_axisctr038.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
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
                     objDom.setValorPorId("SPERAPOR", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));                            
        
                     
                }          
             
            }catch(e){}
            
				<%-- Especial per controlar els scroll amb iPad --%>
				// recarrega scroll pane
				$.reinitialiseScroll();                
				<%-- Especial per controlar els scroll amb iPad --%>
            
            }
            
            /****************************************************************************************/
            /*********************************** MODALES    *****************************************/
            /****************************************************************************************/
            function f_abrir_axisctr019() {
               objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=APOR_EXTRA");               
            }
            
            function f_cerrar_axisctr019(){
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr019(SSEGURO){
                objDom.setValorPorId("SSEGURO", SSEGURO);
                f_cerrar_axisctr019();
                objDom.setValorPorId("BORRAR", "true");
                            
                objUtiles.ejecutarFormulario("axis_axisctr038.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
                
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr038", "cancelar", document.miForm, "_self");
            }   
            
            function f_cerrar_axisimprimir() {
            objDom.setDisabledPorId("but_aceptar",true); 
             objUtiles.cerrarModal("axisimprimir");

            }   

             function f_but_tarifar() {
            
                 try{
                 	
                 var gar = objDom.getValorPorId("GARANTIA");
                 	
                 IMPORTE = objValidador.valorFormateadoCampoNumerico(objDom.getValorPorId("IMPORTE"), true, true);
                   if(objNumero.validaNumero(objDom.getValorPorId("IMPORTE"), true)) {
                    if (objValidador.validaEntrada()) {
                    	objDom.setValorPorId("GARANTIA",gar);
                        objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackTarifar, "operation=tarifar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+
                                                "&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&IMPORTE="+objDom.getValorPorId("IMPORTE")+"&GARANTIA1="+gar+"&FECHA="+objDom.getValorPorId("FECHA"), this,  objJsMessages.jslit_cargando, false);
                    }
                    }else{
                    document.miForm.IMPORTE.value = '';
                    document.miForm.IMPORTE.focus();
                    objDom.setDisabledPorId("but_aceptar", true);
                    }
                    
                     } catch (e) {
                      alert (e.name + " " + e.message);
                        }  
            }
            
            function f_but_aceptar(){
            
                 var gar = objDom.getValorPorId("GARANTIA");
            
                //VALIDACIONES DE CUENTAS BANCARIAS
                
                var TIPCOB = objDom.getValorPorId("CTIPCOBREC");
                if ((TIPCOB == null) || (TIPCOB == '') || (TIPCOB == 2))
                {
	                if(objDom.getValorPorId("BANCAR")!=-1){
	                        objDom.setValorPorId("BANCAR", objDom.getValorPorId("BANCAR"));
	                        objDom.setValorPorId("CTIPBAN", 0); //?¿?¿?¿
	                        objDom.setValorPorId("TIPBAN", objDom.getValorPorId("TIPBAN"));
	                        //objUtiles.ejecutarFormulario("axis_axisctr038.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
	                        //VALIDACION DE GARANTIAS
	                        if(gar!=null && objDom.getValorPorId("BANCAR")!=null && objDom.getValorPorId("BANCAR")!=''){                        
	                        objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackAceptar, "operation=aceptar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+
	                                            "&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&IMPORTE="+objDom.getValorPorId("IMPORTE")+"&GARANTIA1="+gar+"&CBANCAR="+objDom.getValorPorId("BANCAR")+"&CTIPBAN="+objDom.getValorPorId("CTIPBAN")+"&TIPBAN="+objDom.getValorPorId("TIPBAN")+"&FECHA="+objDom.getValorPorId("FECHA")+"&CTIPAPOR="+objDom.getValorPorId("CTIPAPOR")+"&SPERSON="+objDom.getValorPorId("SPERAPOR"), this,  objJsMessages.jslit_cargando, false);
	                        }else{
	                            alert("<axis:alt f="axisctr038" c="ALERT" lit="9001768"/>"); //9000639
	                        }
	                 }else{
	                        if(objDom.getValorPorId("CTIPBAN")==0){
	                                //ERROR: FALTA INFORMAR TIPO
	                                alert(objJsMessages.jslit_codigo_bancario);
	                        }else{
	                            if(objDom.getValorPorId("CUENTA")==null || objDom.getValorPorId("CUENTA")==''){
	                                //ERROR : Falta introducir cuenta bancaria
	                                alert(objJsMessages.jslit_codigo_bancario);
	                            }else{
	                                if(gar!=null && objDom.getValorPorId("CUENTA")!=null && objDom.getValorPorId("CUENTA")!=''){
	                                //objDom.setValorPorId("CBANCAR", objDom.getValorPorId("CUENTA"));//No actualizar valor porque entiende que es el primer combo
	                                objDom.setValorPorId("CTIPBAN", objDom.getValorPorId("CTIPBAN")); //?¿?¿?¿                                
	                                objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackAceptar, "operation=aceptar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+
	                                            "&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&IMPORTE="+objDom.getValorPorId("IMPORTE")+"&GARANTIA1="+gar+"&CBANCAR="+objDom.getValorPorId("CUENTA")+"&CTIPBAN="+objDom.getValorPorId("CTIPBAN")+"&TIPBAN="+objDom.getValorPorId("TIPBAN")+"&FECHA="+objDom.getValorPorId("FECHA")+"&CTIPAPOR="+objDom.getValorPorId("CTIPAPOR")+"&SPERSON="+objDom.getValorPorId("SPERAPOR"), this,  objJsMessages.jslit_cargando, false);          
	                                }else{
	                                    alert("<axis:alt f="axisctr038" c="ALERT" lit="9001768"/>"); //9000639
	                                }
	                                
	                            }
	                    }                
	                }
	             }
	             else{
	             		objAjax.invokeAsyncCGI("axis_axisctr038.do", callbackAceptar, "operation=aceptar" + "&SSEGURO="+objDom.getValorPorId("SSEGURO")+
	                                       "&NRIESGO="+objDom.getValorPorId("NRIESGO")+"&IMPORTE="+objDom.getValorPorId("IMPORTE")+"&GARANTIA1="+gar+"&CBANCAR=null&CTIPBAN="+objDom.getValorPorId("CTIPBAN")+"&TIPBAN=null&FECHA="+objDom.getValorPorId("FECHA")+"&CTIPAPOR="+objDom.getValorPorId("CTIPAPOR")+"&SPERSON="+objDom.getValorPorId("SPERAPOR"), this,  objJsMessages.jslit_cargando, false);
	             }
            }
            
            function f_Get_CCC_HOST(SNIP){
            
                  var SPERSON = objDom.getValorPorId("SPERAPOR");
                  
                  //alert("SPERAPOR : "+SPERSON);
                  
                  if (objUtiles.estaVacio(SPERSON))
                    SPERSON =  objDom.getValorPorId("SPERTOM");
                
                  
            
                  if ( !objUtiles.estaVacio(document.getElementById("BT_BUSCARHOST"))){
                         if ( objDom.esVisible("BT_BUSCARHOST"))  
                         objDom.setVisibilidadPorId("BT_BUSCARHOST", "hidden");
                        }
                objDom.setValorPorId("cargatHost", "1");
                objAjax.invokeAsyncCGI("axis_axisctr038.do?SPERSON="+SPERSON+"&SNIP="+SNIP, callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_HOST", this, objJsMessages.jslit_cargando);
            }
        
            function f_Get_CCC(){
              
                  var SPERSON = objDom.getValorPorId("SPERAPOR");
                  
                  //alert("SPERAPOR : "+SPERSON);
                  
                  if (objUtiles.estaVacio(SPERSON))
                    SPERSON =  objDom.getValorPorId("SPERTOM");
              
              
              if ( !objUtiles.estaVacio(document.getElementById("BT_BUSCARHOST"))){
                   if ( ! objDom.esVisible("BT_BUSCARHOST")){
                    objDom.setVisibilidadPorId("BT_BUSCARHOST", "visible");
                  }
                }
                
              objDom.setValorPorId("cargatHost", "0");
              objAjax.invokeAsyncCGI("axis_axisctr038.do?SPERSON="+SPERSON, callbackAjaxCargarCuentasTomador, "operation=ajax_cargar_cuentas_tomadorAXIS", this, objJsMessages.jslit_cargando);
           }
        
        
        
    
    
    /****************************************************************************************/
    /******************************* CALLBACKS AJAX *****************************************/
    /****************************************************************************************/
    function callbackAjaxCargarCuentasTomador (ajaxResponseText) {
    //alert(ajaxResponseText);
        var doc = objAjax.domParse(ajaxResponseText);

       
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {                                
            if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                var elementos = doc.getElementsByTagName("element");
                var cccCombo = document.miForm.CBANCAR;     
                objDom.borrarOpcionesDeCombo(cccCombo);
                objDom.addOpcionACombo("-1", "<axis:alt f="axisctr038" c="SEL" lit="1000348"/>", cccCombo, 0);
                objDom.setValorPorId("BANCAR", "");
               var cod = "";
               for (i = 0; i < elementos.length; i++) {
                    var ctipban = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CTIPBAN")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CTIPBAN"), 0, 0) : "";
                    var tipban = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TIPBAN")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TIPBAN"), 0, 0) : "";
                    var codigo = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("CBANCAR")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CBANCAR"), 0, 0) : "";
                    var desc   = objUtiles.existeObjetoXml(elementos[i].getElementsByTagName("TCBANCAR")[0]) ?
                                 objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TCBANCAR"), 0, 0): "";
                    cod= ctipban+"@@"+codigo;
                    //alert(cod)
                    objDom.addOpcionACombo(cod, desc, cccCombo);
                    
                    if(i==0 && codigo!=''){
                       document.miForm.BANCAR.value = codigo;
                       //document.miForm.CUENTA.value = codigo;
                       document.miForm.TIPBAN.value = ctipban; //Si carga solo una cuenta es necesario actualizar
                       cccCombo.value = cod;
                    }
                }
                
            }
        }  
        
				<%-- Especial per controlar els scroll amb iPad --%>
				// recarrega scroll pane
				$.reinitialiseScroll();                
				<%-- Especial per controlar els scroll amb iPad --%>
        
    } 
    
        function callbackAjaxRecargar(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            var imp = 0;
           
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                 objDom.setValorPorId("IMPORTE", objNumero.formateaNumeroMoneda(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPORTE"), 0, 0)));
                
            }  
            
				<%-- Especial per controlar els scroll amb iPad --%>
				// recarrega scroll pane
				$.reinitialiseScroll();                
				<%-- Especial per controlar els scroll amb iPad --%>
                
        }       

            function callbackTarifar(ajaxResponseText) {
                //alert(ajaxResponseText);
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    // Si todo ha ido bien, desactivar botones.
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                            var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                        }
                    // ADD 20080912 JCA Si todo ha ido bien, sactivar boton Aceptar sin depender de capital garantizado.                      
                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CAPITAL")[0])){                     
                            var CAPITAL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CAPITAL"), 0, 0);
                            objDom.setValorPorId("AECAPGARAN", CAPITAL);
                        } 
                        
                        objDom.setDisabledPorId("but_aceptar",false);
                 }
                 
				<%-- Especial per controlar els scroll amb iPad --%>
				// recarrega scroll pane
				$.reinitialiseScroll();                
				<%-- Especial per controlar els scroll amb iPad --%>
                 
             }
            
            function callbackAceptar(ajaxResponseText) {
                //alert(ajaxResponseText);
                // Recibe la respuesta Ajax de emitir propuesta.
                // Y escribe los mensajes de info/error correspondientes.
                var doc = objAjax.domParse(ajaxResponseText);
                // Hacemos la llamada para pintar los errores/infos
                try {
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        // Si todo ha ido bien, desactivar botones.
                         if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[1])){
                                var elementos = doc.getElementsByTagName("element");
                                var valor  = objUtiles.existeObjetoXml(elementos[1].getElementsByTagName("CINFO")[0]) ?
                                             objDom.getValorNodoDelComponente(elementos[1].getElementsByTagName("CINFO"), 0, 0): -1;
                                if(valor == 0) {
                                    objDom.setDisabledPorId("but_aceptar",true);                                     
                                } 
                                
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                                var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);
                            
                            }else{
                                var mensaje="";
                            }
                            
                            
                            /*objDom.setDisabledPorId("but_aceptar",true);  */
                             //Se anyade una llamada a impresiones
                             if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) && objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) == 1){
                             var mensaje="";
                             }else{
                             objDom.setDisabledPorId("but_aceptar",true); 
                               objDom.setDisabledPorId("but_tarifar",true);
                             
                               if(version_tomcat <= 6){  
                            	   objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&TIPO=AEXTR&MENSAJE="+mensaje+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));

	                           	}
	                           	else{
	                           		objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt="+<%=new java.util.Date().getTime()%>+"&operation=impresion_doc_tipo&TIPO=AEXTR&MENSAJE="+encodeURI(mensaje)+"&SEGURO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("OSSEGURO"), 0, 0));
	
	                           	}
                             
                             }
                                
                         }
                    }
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                
				<%-- Especial per controlar els scroll amb iPad --%>
				// recarrega scroll pane
				$.reinitialiseScroll();                
				<%-- Especial per controlar els scroll amb iPad --%>
                
             }
            function f_actualiza_evoluprov(PSSEGURO,PNESCENA,PTABLA){
             try{
               objAjax.invokeAsyncCGI("axis_axisctr038.do", 
               callbackAjaxActualizaEvoluProv, "operation=actualiza_evoluprov&PSSEGURO=" + PSSEGURO + "&PTABLA=" + PTABLA + "&PNESCENA=" +  PNESCENA,  this);
             } catch (e) {
               if (isDebugAjaxEnabled == "true")
                 alert (e.name + " " + e.message);
             }              
            }
			
            function callbackAjaxActualizaEvoluProv(ajaxResponseText){
              try {
                 var doc = objAjax.domParse(ajaxResponseText);
                 if (!objAppMensajes.existenErroresEnAplicacion(doc, false)) {
                    var table = document.getElementById("evoluprovmatseg");
                    var tbody = table.getElementsByTagName("tbody")[0];
                    var tr = tbody.getElementsByTagName("tr");
					var vacio = 0;
                    objLista.borrarFilasDeLista ("evoluprovmatseg", "7",  '<axis:alt f="axisctr038" c="MENSA2" lit="1000254"/>');
                    for (var i = 0; i < objDom.numeroDeTags(doc, "NANYO") ; i++) {
                       var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                       var newtr = objLista.crearNuevaFila(rowstyle);
                       var newtd = new Array(7);
 
			 var valdat = 0;                       
             <axis:visible f="axisctr038" c="NANYO">			 
                         newtd[0] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NANYO"), i, 0));
                         valdat = 1;
             </axis:visible>						 
			 <axis:visible f="axisctr038" c="FPROVMAT">
                         newtd[1] = objLista.addTextoEnLista(objUtiles.formateaTimeStamp2(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FPROVMAT"), i, 0)));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr038" c="IPROVMAT">
                         newtd[2] = objLista.addNumeroEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPROVMAT"), i, 0), true));
			 valdat = 1;
             </axis:visible>
             <axis:visible f="axisctr038" c="PRESCATE">			 
                         newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRESCATE"), i, 0));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr038" c="PINTTEC">
                         newtd[4] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINTTEC"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr038" c="IVALRES">
                         newtd[5] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALRES"), i, 0), true));
			 valdat = 1;
			 </axis:visible>
			 <axis:visible f="axisctr038" c="IPRIMA">
                         newtd[6] = objLista.addTextoEnLista(objNumero.formateaNumeroCero(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IPRIMA"), i, 0), true));                        
			 valdat = 1;
			 </axis:visible>
					   
			 if ( valdat == 1 ) {
			    objLista.borrarFilaVacia(tbody, tr);
                            objLista.addNuevaFila(newtd, newtr, tbody);
		            vacio = 1;
			 }	 
                    }
					
		    if ( vacio == 0 ) 
		       objLista.borrarFilasDeLista ("evoluprovmatseg", "7", '<axis:alt f="axisctr038" c="MENSA2" lit="1000254"/>');
                    }
              
                } catch (e) {
                   if (isDebugAjaxEnabled == "true")
                      alert (e.name + " " + e.message);
                }               
            } 
            
        </script>
    </head>
    <body  onload="f_onload()">      
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
        
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
       
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}" />
            <input type="hidden" name="BORRAR" id="BORRAR" value="" />
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERTOM}" />
            <input type="hidden" name="SPERAPOR" id="SPERAPOR" value="${__formdata.SPERAPOR}" />
            <input type="hidden" name="TIPBAN" id="TIPBAN" value="${__formdata.TIPBAN}" />
            <input type="hidden" name="BANCAR" id="BANCAR" value="${__formdata.BANCAR}" />
            <input type="hidden" id="cargatHost" name="cargatHost" value="0"/>
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="" />
            <input type="hidden" name="SNIP" id="SNIP" value="" />
            <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="" />

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisctr038" c="TITULO1" lit="1000509" /></c:param>
                <c:param name="formulario"><axis:alt f="axisctr038" c="TITULO1" lit="1000509" /></c:param>
                <c:param name="form">axisctr038</c:param>
            </c:import>
            <!-- pantallas modales -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr038" c="TITULO_019" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019"></c:param>
            </c:import>
                <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisctr038|<axis:alt f="axisctr038" c="TITULO_AXISIMP" lit="1000188" />#axisimprimir|<axis:alt f="axisctr038" c="TITULO_GED" lit="1000205" />|true#axisgedox|<axis:alt f="axisctr038" c="TITULO_023" lit="1000201" />#axisctr023|<axis:alt f="axisctr038" c="TITULO_025" lit="1000191" />#axisctr025|<axis:alt f="axisctr038" c="TITULO_029" lit="140360"/>#axisctr029|<axis:alt f="axisctr038" c="TITULO_030" lit="1000195"/>#axisctr030|<axis:alt f="axisctr038" c="TITULO_039" lit="1000196"/>#axisctr039|Suplementos</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr038" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr038" c="MOD_PANTALLA_APERS" lit="9001955"/></c:param>
                <c:param name="nid" value="axisper022" />
             </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisctr038" c="FLECHA" lit="104925"/>&nbsp;&nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                         </div>
                        <!-- Sección 1 -->
                         <c:if test="${!empty __formdata.NPOLIZA}">                        
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                            
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                            
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                            
                                            <th style="width:15%;height:0px"></th>
                                            <th style="width:5%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr038" c="NPOLIZA" dejarHueco="false"> 
                                            <td class="titulocaja" ><b><axis:alt f="axisctr038" c="NPOLIZA" lit="100836"/></b></td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="NCERTIF">  
                                            <td class="titulocaja" ><b><axis:alt f="axisctr038" c="NCERTIF" lit="101236"/></b></td>
                                            </axis:ocultar>
                                            <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr038" c="CSITUAC" lit="100874" /></b>
                                             </td>
                                             <c:if test="${!empty __formdata.TRETENI}">
                                                 <!-- Estado -->
                                                 <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisctr038" c="TRETENI" lit="100587" /></b>
                                                </td>
                                            </c:if>
                                           
                                           <axis:ocultar f="axisctr038" c="FEFECTO" dejarHueco="false">
                                            <td class="titulocaja" colspan="2"><b><axis:alt f="axisctr038" c="FEFECTO" lit="100883"/></b></td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr038" c="NPOLIZA" dejarHueco="false"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"  style="width:90%"
                                                    value="${__formdata.NPOLIZA}" <axis:atr f="axisctr038" c="NPOLIZA" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="NCERTIF">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="NCERTIF" name="NCERTIF" size="3" style="width:75%" 
                                                    value="${__formdata.NCERTIF}" <axis:atr f="axisctr038" c="NCERTIF" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <!-- Situacion -->
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TSITUAC" name="TSITUAC" size="15" style="width:90%" 
                                                value="${__formdata.TSITUAC}" readonly="true" />
                                            </td>
                                             <c:if test="${!empty __formdata.TRETENI}">
                                                 <!-- Estado -->
                                                 <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" id="TRETENI" name="TRETENI" size="15"
                                                    value="${__formdata.TRETENI}" readonly="true" />
                                                </td>
                                            </c:if>                                            
                                           <%--    <axis:ocultar f="axisctr038" c="NRIESGO" dejarHueco="false">
                                                <td class="campocaja">--%>
                                                    <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}" />
                                                   
                                           <%--     </td>
                                            </axis:ocultar>--%>
                                            <axis:ocultar f="axisctr038" c="FEFECTO" dejarHueco="false">
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthbig campo campotexto" id="FEFECTO" name="FEFECTO" size="15"  style="width:90%"  
                                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FEFECTO}'/>" <axis:atr f="axisctr038" c="FEFECTO" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                                <!--TABLE     ASEGURADOS -->
                                                <tr>
                                                    <td colspan="4">

                                                                <c:set var="title0"><axis:alt f="axisctr038" c="DSP_ASEGURADOS" lit="100645" /></c:set>
                                                                
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                                <div id="wrapper" class="wrapper">
                                                                <display:table name="${sessionScope.axisctr_asegurados}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                requestURI="axis_axisctr038.do?operation=form&paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                    
                                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_ASEGURADOS.TAPELLI1" headerClass="sortable" media="html" autolink="false" >
                                                                    <div class="dspText">${lista.OB_IAX_ASEGURADOS.TAPELLI1}&nbsp;${lista.OB_IAX_ASEGURADOS.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_ASEGURADOS.TNOMBRE}</div>
                                                                    </display:column>
                                                                    
                                                                    </display:table>
                                                                    </div>
                                                                    </div>
                                                                    <div class="separador">&nbsp;</div>
                                                                  
                                                    </td>
                                                    <td colspan="4" >

                                                                <c:set var="title0"><axis:alt f="axisctr038" c="TOMADORES" lit="1000181" /></c:set>
                                                                
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                                <display:table name="${sessionScope.axisctr_tomadores}" id="lista" export="false" class="dsptgtable"  pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                requestURI="axis_axisctr038.do?operation=general&paginar=true">
                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                    
                                                                    <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TAPELLI1" headerClass="sortable" media="html" autolink="false" >
                                                                    <div class="dspText">${lista.OB_IAX_TOMADORES.TAPELLI1}&nbsp;${lista.OB_IAX_TOMADORES.TAPELLI2}&nbsp;,&nbsp;${lista.OB_IAX_TOMADORES.TNOMBRE}</div>
                                                                    </display:column>
                                                                    
                                                                    </display:table>
                                                                    </div>
                                                                    <div class="separador">&nbsp;</div>
                                                                  
                                                    </td>
                                                    <!-- en cuatro columnas-->
                                                    
                                                </tr>
                                                <!--FIN TABLE ASGURADOS-->
                                            
                                        </tr>
                          
                                 </table>
                    
                                </td>
                            </tr>
                            <tr>
                            
                            </tr>
                        </table>
                        
                        
                        <axis:ocultar f="axisctr038" c="DSP_DATOSECON" dejarHueco="false">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr038" c="FLECHA1" lit="1000097"/></div>
                        <!-- Sección 2 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 2 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <!--th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th-->
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPRIMAPER" lit="108230"/>&nbsp;<axis:alt f="axisctr038" c="IMPRIMAPER2" lit="1000512"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="ImpPrimaActual" lit="1000514"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="ImpPrimaInicial" lit="1000516"/></b></td>
                                            <td>&nbsp;</td>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="ImpAportMax" lit="1000515"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPAPORTACUM" lit="1000513"/></b></td>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPAPORTPEND" lit="1000517"/></b></td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr038" c="IMPRIMAPER" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidth campo campotexto" id="IMPRIMAPER" name="IMPRIMAPER" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAPER}' />" <axis:atr f="axisctr038" c="IMPRIMAPER" a="modificable=false"/> />
                                                   
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="ImpPrimaActual" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAACTUAL" name="IMPPRIMAACTUAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAACTUAL}' />" <axis:atr f="axisctr038" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="ImpPrimaInicial" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPPRIMAINICIAL" name="IMPPRIMAINICIAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAINICIAL}' />" <axis:atr f="axisctr038" c="IMPPRIMAINICIAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <td></td>
                                             <axis:ocultar f="axisctr038" c="ImpAportMax" dejarHueco="false"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTMAX" name="IMPAPORTMAX" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAX}' />" <axis:atr f="axisctr038" c="IMPAPORTMAX" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTMAXTOT" name="IMPAPORTMAXTOT" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAXTOT}' />" <axis:atr f="axisctr038" c="IMPAPORTMAXTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>                                            
                                            <axis:ocultar f="axisctr038" c="IMPAPORTACUM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTACUM" name="IMPAPORTACUM" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTACUM}' />" <axis:atr f="axisctr038" c="ImpAportAcum" a="modificable=false"/> />
                                                    <input type="text" class="campowidthsmall campo campotexto" id="IMPAPORTACUMTOT" name="IMPAPORTACUMTOT" size="15" 
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTACUMTOT}' />" <axis:atr f="axisctr038" c="IMPAPORTACUMTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr038" c="IMPAPORTPEND" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthmedium campo campotexto" id="IMPAPORTPEND" name="IMPAPORTPEND" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTPEND}' />" <axis:atr f="axisctr038" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                    </table>
                                </td>
                                <!--tr>
                                <td>
                                   
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>

                                                                               
                                        </tr>
                                        <tr>
                                             <axis:visible f="axisctr038" c="ImpPrimaInicial"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMAINICIAL" name="IMPPRIMAINICIAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAINICIAL}' />" <axis:atr f="axisctr038" c="IMPPRIMAINICIAL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                             <axis:visible f="axisctr038" c="ImpAportMax"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTMAX" name="IMPAPORTMAX" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAX}' />" <axis:atr f="axisctr038" c="IMPAPORTMAX" a="modificable=false"/> />
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTMAXTOT" name="IMPAPORTMAXTOT" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTMAXTOT}' />" <axis:atr f="axisctr038" c="IMPAPORTMAXTOT" a="modificable=false"/> />
                                               </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr-->
                            <!--tr>
                                <td>
                                    
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                           
                                        </tr>
                                        <tr>
                                            
                                                                               
                                        </tr>
                                        <tr>
                                            <axis:visible f="axisctr038" c="ImpPrimaActual"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPRIMAACTUAL" name="IMPPRIMAACTUAL" size="15"  
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPRIMAACTUAL}' />" <axis:atr f="axisctr038" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            <axis:visible f="axisctr038" c="IMPAPORTPEND"> 
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPAPORTPEND" name="IMPAPORTPEND" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPAPORTPEND}' />" <axis:atr f="axisctr038" c="IMPPRIMAACTUAL" a="modificable=false"/> />
                                                </td>
                                            </axis:visible>
                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr-->
                            </tr>
                        </table>
                        </axis:ocultar>
                         <axis:ocultar f="axisctr038" c="DSP_PROVISIONES" dejarHueco="false">
                        <!-- tercera seccion -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr038" c="FLECHA3" lit="102656"/><axis:visible c="CMONPROD" f="axisctr038">  <c:if test="${!empty TMONPROD}"> - <axis:alt f="axisctr038" c="CMONPROD" lit="108645"/> :  ${TMONPROD} </c:if> </axis:visible>
                        
                        </div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                            <th style="width:33%;height:0px"></th>
                                        </tr>
                                     
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPPROVISION" lit="1000518"/></b></td>
                                            
                                            <axis:ocultar f="axisctr038" c="IMPCAPFALL" dejarHueco="false"> 
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPCAPFALL" lit="1000519"/></b></td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="PRCAPGARAN" dejarHueco="false"> 
                                                <td class="titulocaja"><b><axis:alt f="axisctr038" c="PRCAPGARAN" lit="1000521"/></b></td>
                                            </axis:ocultar>
                                            
                                            <!-- ini bug 19808 -->
                                            <axis:ocultar f="axisctr038" c="TD_IMPPROVRESC" dejarHueco="false"> 
                                                <td class="titulocaja"><b><axis:alt f="axisctr038" c="TD_IMPPROVRESC" lit="9902632"/></b></td>
                                            </axis:ocultar>
                                            <!-- fin bug 19808 -->

                                        </tr>
                                        <tr>
                                         
                                            <axis:ocultar f="axisctr038" c="IMPPROVISION" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPROVISION" name="IMPPROVISION" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPROVISION}' />" <axis:atr f="axisctr038" c="IMPPROVISION" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="IMPCAPFALL"  dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPCAPFALL" name="IMPCAPFALL" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPCAPFALL}' />" <axis:atr f="axisctr038" c="IMPCAPFALL" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="PRCAPGARAN"  dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="PRCAPGARAN" name="PRCAPGARAN" size="15"
                                                   value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPCAPGARAN}' />" <axis:atr f="axisctr038" c="PRCAPGARAN" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>

                                            <!-- ini bug 19808 -->
                                            <axis:ocultar f="axisctr038" c="IMPPROVRESC"  dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthbig campo campotexto" id="IMPPROVRESC" name="IMPPROVRESC" size="15"
                                                   value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPPROVRESC}' />" <axis:atr f="axisctr038" c="IMPPROVRESC" a="modificable=false"/> />
                                                </td>
                                            </axis:ocultar>
                                            <!-- fin bug 19808 -->

                                            
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table> 
                        </axis:ocultar>
                        <!-- tercera seccion -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr038" c="FLECHA4" lit="1000509"/></div>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 3 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:10%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="IMPORTE" lit="1000534"/></b></td>
                                                <axis:ocultar f="axisctr038" c="CMONPROD" dejarHueco="false">
                                                    <!-- Moneda -->
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axisctr038" c="CMONPROD" lit="108645" /></b>
                                                    </td>
                                                </axis:ocultar>
                                            
                                            <axis:ocultar f="axisctr038" c="FECHA" dejarHueco="false">
                                                 <td class="titulocaja"><b><axis:alt f="axisctr038" c="FECHA" lit="100883"/></b></td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="CTIPCOBREC" dejarHueco="false">
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="CTIPCOBREC" lit="151348"/></b></td>   
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="CBANCAR" dejarHueco="false"> 
                                            <td class="titulocaja"><b id="label_CBANCAR"><axis:alt f="axisctr038" c="CBANCAR" lit="100965"/></b></td>                        
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisctr038" c="IMPORTE"  dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" onblur="recargar(this.value)" class="campowidthbig campo campotexto_ob" id="IMPORTE" name="IMPORTE" size="15"
                                                    value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPORTE}' />" obligatorio="true" <axis:atr f="axisctr038" c="IMPORTE" a="modificable=true"/> />
                                                </td>
                                            </axis:ocultar>
                                         <axis:ocultar f="axisctr038" c="CMONPROD" dejarHueco="false">
                                                        <td class="campocaja">
                                                               <input type="text" class="campowidthinput campo campotexto" id="CMONPROD" name="CMONPROD" size="15" style="width:95%"
                                                                  value="${CMONPRODINT} - ${TMONPROD}" readonly="true" />
                                                        </td>
                                                        </axis:ocultar>   
                                             <axis:ocultar f="axisctr038" c="FECHA" dejarHueco="false">
                                                <td class="campocaja">
                                                   <jsp:useBean id="today" class="java.util.Date" /> 
                                                   <c:set var="FECHA">
                                                        <c:choose>
                                                            <c:when test="${__formdata.FCARPRO_AXISCTR038 == 0}">
                                                                <c:choose>
                                                                    <c:when test="${axis:compararFechas(__formdata.FEFECTO,__formdata.FECHA_ACTUAL)>0}">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHA_ACTUAL}"/>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:choose>
                                                                    <c:when test="${axis:compararFechas(__formdata.FCARPRO,__formdata.FECHA_ACTUAL)>0}">
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCARPRO}"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FECHA_ACTUAL}"/>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:set>
                                                    
                                                    <input  type="text" <c:if test="${__configform.axisctr038__FECHA__modificable == 'true' || empty __configform.axisctr038__FECHA__modificable}">class="campowidth campo campotexto_ob"</c:if> 
                                                    <c:if test="${__configform.axisctr038__FECHA__modificable == 'false'}">class="campowidth campo campotexto"</c:if> id="FECHA" name="FECHA" size="15" 
                                                    <axis:atr f="axisctr038" c="FECHA" a="modificable=true&obligatorio=true&formato=fecha"/>
                                                    value="${FECHA} <c:if test="${empty FECHA}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                    title="<axis:alt f="axisctr038" c="FLECHA5" lit="100883"/>"/><a id="icon_FECHA" style="vertical-align:middle;"><img 
                                                    alt="<axis:alt f="axisctr038" c="LIT1" lit="108341"/>" title="<axis:alt f="axisctr038" c="LIT2" lit="100883" />" src="images/calendar.gif"/></a>
                                                </td>
                                                                                                       
                                                
                                            </axis:ocultar>   

                                            <axis:visible f="axisctr038" c="CTIPCOBREC">
                                                <td class="campocaja">
                                                    <select name = "CTIPCOBREC" id ="CTIPCOBREC" onchange="f_rec_dependencias();"  
                                                        class="campowidth campo campotexto" 
                                                        <axis:atr f="axisctr038" c="CTIPCOBREC" a="obligatorio=true&modificable=true&isInputText=false"/>>&nbsp;
                                                         <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr038" c="COMBO_SVN" lit="1000348"/> - </option>
                                                            <c:forEach items="${sessionScope.tipoCobro}" var="tipcob">
                                                                <option value = "${tipcob.CATRIBU}" <c:if test="${!empty __formdata.CTIPCOBREC && __formdata.CTIPCOBREC == tipcob.CATRIBU}">selected</c:if> >${tipcob.TATRIBU}</option>
                                                            </c:forEach>
                                                    </select>
                                                </td>    
                                            </axis:visible>
                                            
                                            
                                            
                                            <axis:ocultar f="axisctr038" c="CBANCAR" dejarHueco="false"> 
                                                <td class="campocaja" colspan="2">
                                                    <axis:encryptflag f="axisctr038" c="CBANCAR" />
                                                    <select name = "CBANCAR" style="width:59%" id ="CBANCAR" onchange="javascript:actualizaTipos(this)" 
                                                    class="campowidthbig campo campotexto_ob" 
                                                    <axis:atr f="axisctr038" c="CBANCAR" a="modificable=true&isInputText=false"/>>&nbsp;
                                                    <option value="-1"><axis:alt f="axisctr038" c="SEL" lit="1000348"/></option>
                                                    <c:forEach items="${sessionScope.axisctr_cuentas}" var="cuenta">                                                    
                                                    <option value = "${cuenta.CTIPBAN}@@<axis:encrypt f="axisctr038" c="CBANCAR" value="${cuenta.CBANCAR}" />">
                                                    	<axis:masc f="axisctr038" c="CBANCAR" value="${cuenta.TCBANCAR}" /></option>   
                                                    </c:forEach>
                                            </select>
                                            <c:if test="${!empty __formdata.SPERTOM}">
                                            <axis:visible f="axisctr038" c="BT_BUSCAR">
                                                 <input type="button" class="boton" id="BT_BUSCAR" name="BT_BUSCAR"  value="<axis:alt f="axisctr038" c="BT_BUSCAR" lit="9000508"></axis:alt>" onclick="f_Get_CCC(${__formdata.SPERTOM},null)" />
                                            </axis:visible>
                                            <axis:visible f="axisctr038" c="BT_BUSCARHOST">
                                                    <input type="button" class="boton" id="BT_BUSCARHOST" name="BT_BUSCARHOST"  value="<axis:alt f="axisctr038" c="BT_BUSCARHOST" lit="9000509"></axis:alt>" onclick="f_Get_CCC_HOST(${__formdata.SPERTOM},null)" />
                                            </axis:visible>
                                            </c:if>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                        <%-- bug 19808 dejarHueco --%>
                                        <axis:ocultar f="axisctr038" c="AECAPGARAN" dejarHueco="true">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr038" c="AECAPGARAN" lit="1000521"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr038" c="GARANTIA">
                                            <td class="titulocaja"><b><axis:alt f="axisctr038" c="GARANTIA" lit="1000183"/></b></td>
                                        </axis:ocultar>
                                            <axis:ocultar f="axisctr038" c="CTIPBAN" dejarHueco="false"><td class="titulocaja"> <b id="label_CTIPBAN"><axis:alt f="axisctr038" c="CTIPBAN" lit="1000520"/></b></td>  </axis:ocultar>  <!--563-->             
                                        </tr>
                                        <tr>
                                        <%-- bug 19808 dejarHueco --%>
                                       <axis:ocultar f="axisctr038" c="AECAPGARAN" dejarHueco="true"> 
                                                <td class="campocaja">
                                                        <input type="text" class="campowidthbig campo campotexto" id="AECAPGARAN" name="AECAPGARAN" size="15"
                                                        value="<fmt:formatNumber pattern='###,#00.00' value='${__formdata.AECAPGARAN}' />" <axis:atr f="axisctr038" c="AECAPGARAN" a="modificable=false"/> />
                                                </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr038" c="GARANTIA">
                                            <td>
                                            <select name = "GARANTIA" id ="GARANTIA" onchange="" 
                                                            class="campowidth campo campotexto_ob" 
                                                            <axis:atr f="axisctr038" c="GARANTIA" a="obligatorio=true&modificable=true&isInputText=false"/>>&nbsp;
                                                            <option value="null"><axis:alt f="axisctr038" c="SEL" lit="1000348"/></option>
                                                                <c:forEach items="${sessionScope.listaGarantias}" var="garan">
                                                                    <option value = "${garan.CGARANT}" <c:if test="${garan.CGARANT==__formdata.GARANTIA || fn:length(sessionScope.listaGarantias) < 2}">selected</c:if> >${garan.DESCRIPCION}</option>
                                                                </c:forEach>
                                            </select>
                                            </td>
                                        </axis:ocultar>
                                           
                                                <td class="campocaja" colspan="2">
                                                 <axis:ocultar f="axisctr038" c="CTIPBAN" dejarHueco="false"> 
                                                 <div>
                                                      <select name = "CTIPBAN" id ="CTIPBAN" onchange="javascript:actualizaCuentas()" 
                                                            class="campowidthbig campo campotexto_ob" 
                                                            <axis:atr f="axisctr038" c="CTIPBAN" a="modificable=true&isInputText=false"/>>&nbsp;
                                                            <option value="0"><axis:alt f="axisctr038" c="SEL" lit="1000348"/></option>
                                                                <c:forEach items="${sessionScope.axisctr_tipos_cuentas}" var="tipo">
                                                                    <option value = "${tipo.CTIPBAN}" >${tipo.TTIPO}</option>
                                                                </c:forEach>
                                                      </select>
                                                      <input type="text" class="campowidthbig campo campotexto_ob" id="CUENTA" name="CUENTA" size="15"
                                                      value="${__formdata.CUENTA}" <axis:atr f="axisctr038" c="CUENTA" a="modificable=true"/> />
                                                      &nbsp;&nbsp;
                                                      </div>
                                                  </axis:ocultar>

                                                  
                                                     
                                                </td>
                                                
                                                 
                                                
                                            
                                        </tr>
                                        <!--TITULOS--> 
                                        <tr>
                                        <axis:visible f="axisctr038" c="CTIPAPOR">
                                            <td class="titulocaja"> <b><axis:alt f="axisctr038" c="CTIPAPOR" lit="9902066"/></b>  </td>
                                        </axis:visible>  
                                        
                                        <axis:visible f="axisctr038" c="SPERSON">
                                            <td class="titulocaja"> <b><axis:alt f="axisctr038" c="LIT_SPERSON" lit="105330"/></b></td><!-- Document -->  
                                        </axis:visible>  
                                        
                                         <axis:visible f="axisctr038" c="NOMBRE">
                                            <td class="titulocaja"> <b><axis:alt f="axisctr038" c="LIT_NOMBRE" lit="105940"/></b></td><!-- Nombre -->  
                                        </axis:visible>                                        
                                        
                                        </tr>
                                        
                                        <!--CAMPOS-->
                                        <tr>                                       
                                            
                                            <axis:visible f="axisctr038" c="CTIPAPOR">
                                            <td>
                                            <select name = "CTIPAPOR" id ="CTIPAPOR" onchange="f_cargar_aportante()"  style="width:90%"
                                                            class="campowidth campo campotexto_ob" 
                                                            <axis:atr f="axisctr038" c="CTIPAPOR" a="obligatorio=true&modificable=true&isInputText=false"/>>&nbsp;
                                                            <option value="null"><axis:alt f="axisctr038" c="SEL" lit="1000348"/></option>
                                                            <c:forEach var="element" items="${__formdata.tipo_aport}">
                                                            <option value = "${element.CATRIBU}" 
                                                                <c:if test="${!empty __formdata.CTIPAPOR && __formdata.CTIPAPOR == element.CATRIBU || element.CDEFECTO == 1}"> selected </c:if> />                                                                
                                                                  ${element.TATRIBU} 
                                                            </option>
                                                    </c:forEach>
                                            </select>
                                            </td>
                                            </axis:visible>
                                            
                                            <axis:visible f="axisctr038" c="SPERSON" >
                                            <td class="campocaja">                                            
                                                <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:75%"
                                                <axis:atr f="axisctr038" c="NNUMIDE" a="modificable=false"/> /> 
                                                <axis:visible f="axisctr038" c="BUSC_PERS">
                                                    <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                                </axis:visible>                                                 
                                            </td>
                                            </axis:visible>
                                            
                                            <axis:ocultar f="axisctr038" c="NOMBRE" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:59.7%"
                                                <axis:atr f="axisctr038" c="NOMBRE" a="modificable=false"/> /> 
                                            </td>
                                            <td></td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                        <td colspan="4" align="center">
                                         <input type="button" class="boton" id="but_tarifar" value="<axis:alt f="axisctr038" c="BUT_TARIFAR" lit="101688"></axis:alt>" onclick="javascript:f_but_tarifar();" />
                                         </td>
                                         </table>
                                        
                                        
                                    </table>
                                     <!-- cuarta seccion -->

    <axis:visible f="axisctr038" c="DSP_EVOLUPROVMAT">    
    <div class="separador">&nbsp;</div>
    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr038" c="DIVELUPROV" lit="9908071"/></div>    
    <table class="seccion">
     <tr>
     <td>
     <table class="area" align="center"> 
     <tr>
     <td>
       <table class="area" align="left" cellspacing="0"  cellpadding="0" style="width:200px">
       <tr>
         <axis:visible f="axisctr038" c="CESCENA">
           <td class="titulocaja" width="10%">
             <b><axis:alt f="axisctr038" c="LESCENA" lit="9908029"></axis:alt></b>
           </td>
         </axis:visible>
           <axis:visible f="axisctr038" c="CESCENA">
           <td class="campocaja" width="90%">
           <select name = "NESCENA" id ="NESCENA" onchange="f_actualiza_evoluprov(${__formdata.SSEGURO},this.value,null);"  style="width:90%"
             class="campowidthselect campo campotexto_ob" 
             <axis:atr f="axisctr038" c="NESCENA" a="obligatorio=false&modificable=true&isInputText=false"/>;
             <option value="${__formdata.NESCENA}"><axis:alt f="axisctr038" c="SEL" lit="1000348"/></option>
             <c:forEach var="element" items="${__formdata.listValores.tipEscen}">
             <option value = "${element.CATRIBU}">${element.TATRIBU}</option>
             </c:forEach>
           </select>
           </td>
         </axis:visible>
       </tr>
       </table>
    </td>
    </tr>    
    <tr>
    <td class="campocaja" >
         <div class="fixedHeaderTable">
          <c:set var="title0"><axis:alt f="axisctr038" c="NANYO" lit="101606" /></c:set>
          <c:set var="title1"><axis:alt f="axisctr038" c="FPROVMAT" lit="100562" /></c:set>
          <c:set var="title2"><axis:alt f="axisctr038" c="IPROVMAT" lit="1000518" /></c:set>
          <c:set var="title3"><axis:alt f="axisctr038" c="PRESCATE" lit="1000522" /></c:set>
          <c:set var="title4"><axis:alt f="axisctr038" c="PINTTEC" lit="9901247" /></c:set>
          <c:set var="title5"><axis:alt f="axisctr038" c="IVALRES" lit="102731" /></c:set>
          <c:set var="title6"><axis:alt f="axisctr038" c="IPRIMA" lit="101368" /></c:set>
        
          <display:table name="${evoluprovmatseg}" id="evoluprovmatseg" export="false" class="dsptgtable" pagesize="-1" defaultorder="descending" sort="list" cellpadding="0" cellspacing="0" style="width:100%"
           requestURI="axis_axisctr038.do?paginar=true&tabla=tomador"> 
                <%@ include file="../include/displaytag.jsp"%>
				<axis:visible f="axisctr038" c="NANYO">
                <display:column title="${title0}" sortable="true" sortProperty="evoluprovmatseg.NANYO" headerClass="sortable fixed"  media="html" autolink="false" >
                  <div class="dspNumber"><fmt:formatNumber value='${evoluprovmatseg.NANYO}' pattern="###,##0"/></div>
                </display:column>
				</axis:visible>
				<axis:visible f="axisctr038" c="FPROVMAT">
                <display:column title="${title1}" sortable="true" sortProperty="evoluprovmatseg.FPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                    <div class="dspText"><fmt:formatDate value='${evoluprovmatseg.FPROVMAT}' pattern='dd/MM/yyyy'/></div>
                </display:column>
				</axis:visible>
				<axis:visible f="axisctr038" c="IPROVMAT">
                <display:column title="${title2}" sortable="true" sortProperty="evoluprovmatseg.IPROVMAT" headerClass="sortable fixed"  media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPROVMAT}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                </display:column>
				</axis:visible> 
				<axis:visible f="axisctr038" c="PRESCATE">
                <display:column title="${title3}" sortable="true" sortProperty="evoluprovmatseg.PRESCATE" headerClass="sortable fixed" media="html" autolink="false" >
                    <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PRESCATE}" pattern="###,##0.00"/></div>
                </display:column>
				</axis:visible> 
                <axis:visible f="axisctr038" c="PINTTEC">
                    <display:column title="${title4}" sortable="true" sortProperty="evoluprovmatseg.PINTTEC" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.PINTTEC}" pattern="###,##0.00"/></div>
                    </display:column>
                </axis:visible>    
                <axis:visible f="axisctr038" c="IPRIMA">
                    <display:column title="${title6}" sortable="true" sortProperty="evoluprovmatseg.IPRIMA" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IPRIMA}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                    </display:column>
                </axis:visible>
                <axis:visible f="axisctr038" c="IVALRES">
                    <display:column title="${title5}" sortable="true" sortProperty="evoluprovmatseg.IVALRES" headerClass="sortable fixed" media="html" autolink="false" >
                        <div class="dspNumber"><fmt:formatNumber value="${evoluprovmatseg.IVALRES}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/></div>
                    </display:column>
                </axis:visible>
           </display:table>
          </div>
    </td>
    </tr>
    </table>
    </td>
    </tr>
    </table>
    </axis:visible>
                                </td>
                            </tr>
                        </table> 
                        </c:if>              
                    </td>
                </tr>
            </table>
             <div class="separador">&nbsp;</div>
            <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr038</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param></c:import>
        </form>
        <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FECHA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FECHA", 
            singleClick    :    true,
            firstDay       :    1
        });
    

        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>