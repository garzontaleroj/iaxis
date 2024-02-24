<%/* Revision:# mk+JWN6nKWkgHgGqBiLJBw== # */%>
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
    
    
    function f_but_buscar() {
    
      if(objUtiles.estaVacio(objDom.getValorPorId("SPERSON"))||objUtiles.estaVacio(objDom.getValorPorId("SSEGURO"))){
            alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9905104'/>");
            return;
        }   
      
      var objFec = new JsFecha();
      var fIni= '01/01/1970';
      var fFin= '01/01/3000';
      
      if (objFec.stringToDate(fIni) > objFec.stringToDate(fFin) ){
          alert("<axis:alt f='axiscob001' c='ADVERTENCIA' lit='9902126'/>"); // 9902126 La fecha de inicio no puede ser más grande que la fecha de fin
          return;
        }
        
        objUtiles.ejecutarFormulario ("axis_axisadm101.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
    } 
    
    
        
    /****************************************************************************************/
    /*******************************     MODALES    *****************************************/
    /****************************************************************************************/
    function f_cerrar_modal(cual) {
        objUtiles.cerrarModal(cual);
    }
    
    function f_aceptar_modal(cual, params) {
        f_cerrar_modal(cual);
        objUtiles.ejecutarFormulario("axis_axisadm101.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    
    function f_abrir_modal(cual, noXButton, optionalQueryString) {
    
    if (objUtiles.estaVacio(optionalQueryString))                
        optionalQueryString = "";
        
    if (noXButton) 
        objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
        
    objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
    }
            
          
    function f_buscar_poliza(){
       f_abrir_modal("axisctr019", false, ""); 
    } 
    
    function f_cerrar_axisctr019(){
        objUtiles.cerrarModal("axisctr019");
    }
    
    function f_aceptar_axisctr019(SSEGURO){
        f_cerrar_modal('axisctr019')
        if (objUtiles.estaVacio(SSEGURO)){
            return;
        }
        objAjax.invokeAsyncCGI("axis_axisadm101.do", callbackajaxPolizas, "operation=ajax_polizas&SSEGURO="+SSEGURO, this)
    }
    
    function f_abrir_axisctr019(){
        objLista.borrarFilasDeLista ("lstMov", "10", "<axis:alt f='axiscob001' c='LSTMOV' lit='1000254'/>");
        objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
    }
    /****************************************************************************************/
    /*********************************** CALLBACK AJAX **************************************/
    /****************************************************************************************/
    
    
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
            NPOLIZA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), 0, 0);
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
    
    function f_limpia_monto(){
       document.miForm.AMOPAY.value = '';
    }
    
    function f_dependencia() {
        var TIPOCHEQUE = objDom.getValorPorId("CHTYPE");
        
        
        if (TIPOCHEQUE == 0 || TIPOCHEQUE == 2) {
            document.getElementById("PAYTEXT").style.visibility = 'hidden';
            document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
            document.getElementById("OBANK").style.visibility = 'visible';
            document.getElementById("tit_OBANK").style.visibility = 'visible';
            document.getElementById("CHDRTYPE").style.visibility = 'hidden';
            document.getElementById("tit_CHDRTYPE").style.visibility = 'hidden';
            document.getElementById("tit_BNAME").style.visibility = 'visible';
            document.getElementById("BNAME").style.visibility = 'visible';
            document.getElementById("tit_CHNUM").style.visibility = 'visible';
            document.getElementById("CHNUM").style.visibility = 'visible';
            document.getElementById("tit_ACCONUM").style.visibility = 'visible';
            document.getElementById("ACCONUM").style.visibility = 'visible';
            document.getElementById("tit_ACCOHOLD").style.visibility = 'visible';
            document.getElementById("ACCOHOLD").style.visibility = 'visible';
            document.getElementById("PAYTEXT").style.visibility = 'visible';
            
            document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("BNAME").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";
            
            if (TIPOCHEQUE == 0){
                document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto";
                document.miForm.ACCOHOLD.setAttribute("obligatorio","false");
            }
            if (TIPOCHEQUE == 2){
                document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
                document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
            }

            document.miForm.ACCONUM.setAttribute("obligatorio","true");
            document.miForm.BNAME.setAttribute("obligatorio","true");
            document.miForm.CHNUM.setAttribute("obligatorio","true");
            document.miForm.PAYTEXT.setAttribute("obligatorio","true");

            
                      
            objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');


        }

        if (TIPOCHEQUE == 1) {
            
            document.getElementById("OBANK").style.visibility = 'visible';
            document.getElementById("tit_OBANK").style.visibility = 'visible';
            document.getElementById("CHDRTYPE").style.visibility = 'visible';
            document.getElementById("tit_CHDRTYPE").style.visibility = 'visible';
            document.getElementById("tit_BNAME").style.visibility = 'visible';
            document.getElementById("BNAME").style.visibility = 'visible';
            document.getElementById("tit_CHNUM").style.visibility = 'visible';
            document.getElementById("CHNUM").style.visibility = 'visible';
            document.getElementById("tit_ACCONUM").style.visibility = 'visible';
            document.getElementById("ACCONUM").style.visibility = 'visible';
            document.getElementById("tit_ACCOHOLD").style.visibility = 'visible';
            document.getElementById("ACCOHOLD").style.visibility = 'visible';
            document.getElementById("PAYTEXT").style.visibility = 'visible';
            document.getElementById("tit_PAYTEXT").style.visibility = 'visible';

            
            
            document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("BNAME").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
            //document.getElementById("CHDRTYPE").className  = "campowidthinput campo campotexto campotexto_ob";
            document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";

            document.miForm.ACCONUM.setAttribute("obligatorio","true");
            document.miForm.BNAME.setAttribute("obligatorio","true");
            document.miForm.CHNUM.setAttribute("obligatorio","true");
            document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
            document.miForm.PAYTEXT.setAttribute("obligatorio","true");
            
            
            
            objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');

        }
        
        if (TIPOCHEQUE == 3) {
        
            document.getElementById("PAYTEXT").style.visibility = 'visible';
            document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
            document.getElementById("OBANK").style.visibility = 'hidden';
            document.getElementById("tit_OBANK").style.visibility = 'hidden';
            document.getElementById("CHDRTYPE").style.visibility = 'visible';
            document.getElementById("tit_CHDRTYPE").style.visibility = 'visible';
            document.getElementById("tit_BNAME").style.visibility = 'hidden';
            document.getElementById("BNAME").style.visibility = 'hidden';
            document.getElementById("tit_CHNUM").style.visibility = 'hidden';
            document.getElementById("CHNUM").style.visibility = 'hidden';
            document.getElementById("tit_ACCONUM").style.visibility = 'hidden';
            document.getElementById("ACCONUM").style.visibility = 'hidden';
            document.getElementById("tit_ACCOHOLD").style.visibility = 'hidden';
            document.getElementById("ACCOHOLD").style.visibility = 'hidden';
            
           objAjax.invokeAsyncCGI("axis_axisadm093.do?TCHEQUE= "+TIPOCHEQUE, callbackCargarLista, "operation=loadBox", this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');

        }
        
        if (TIPOCHEQUE == 4) {
          
            document.getElementById("PAYTEXT").style.visibility = 'visible';
            document.getElementById("tit_PAYTEXT").style.visibility = 'visible';
            document.getElementById("OBANK").style.visibility = 'hidden';
            document.getElementById("tit_OBANK").style.visibility = 'hidden';
            document.getElementById("CHDRTYPE").style.visibility = 'hidden';
            document.getElementById("tit_CHDRTYPE").style.visibility = 'hidden';
            document.getElementById("tit_BNAME").style.visibility = 'hidden';
            document.getElementById("BNAME").style.visibility = 'hidden';
            document.getElementById("tit_CHNUM").style.visibility = 'hidden';
            document.getElementById("CHNUM").style.visibility = 'hidden';
            document.getElementById("tit_ACCONUM").style.visibility = 'hidden';
            document.getElementById("ACCONUM").style.visibility = 'hidden';
            document.getElementById("tit_ACCOHOLD").style.visibility = 'hidden';
            document.getElementById("ACCOHOLD").style.visibility = 'hidden';
            
          
        }

    }
  
  function callbackCargarLista(ajaxResponseText) {
		var motivosCombo = document.miForm.CHDRTYPE;
		try {
			var doc=objAjax.domParse(ajaxResponseText);
                        
								
			if(!objAppMensajes.existenErroresEnAplicacion(doc)){
				if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
					objDom.borrarOpcionesDeCombo(motivosCombo);
					 objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, 0);
					for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
						var TMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
						var CMOTSIN = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
						
						objDom.addOpcionACombo(TMOTSIN,CMOTSIN, motivosCombo, i+1);
					}
				}else{
					objDom.borrarOpcionesDeCombo (motivosCombo);
					objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
				}
			}
			
			//f_call_asistencia();
		} catch (e) {
			objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", motivosCombo, null);
			alert(objJsMessages.jslit_sin_motivos);
		}
	}
        
        
 function f_but_9907708() {
    
        if (objValidador.validaEntrada()){
        
                    var PSPERSON = objDom.getValorPorId("SPERSON");  //mirar
                    var PCURRENCY = objDom.getValorPorId("CURRENCY");
                    var PPAYREASON = objDom.getValorPorId("PAYREASON");
                    var PAMOPAY = objDom.getValorPorId("AMOPAY");
                    var PDATEREC = objDom.getValorPorId("DATEREC");
                    var PPAYMET = objDom.getValorPorId("PAYMET");
                    var PCHTYPE = objDom.getValorPorId("CHTYPE");
                    var PTID = objDom.getValorPorId("TID"); 
                    var PPAYTEXT = objDom.getValorPorId("PAYTEXT");  
                    var PBNAME = objDom.getValorPorId("BNAME");
                    var POBANK = objDom.getValorPorId("OBANK");
                    var PCHNUM = objDom.getValorPorId("CHNUM");
                    var PCLIMOP = objDom.getValorPorId("CLIMOP");
                    var PCHDRTYPE = objDom.getValorPorId("CHDRTYPE");
                    var PACCONUM = objDom.getValorPorId("ACCONUM");
                    var POLIZA = objDom.getValorPorId("NPOLIZA");
                  var PACCOHOLD = objDom.getValorPorId("ACCOHOLD");
                  var PMENSWARNINFO = objDom.getValorPorId("MENSWARNINFO");
                  objAjax.invokeAsyncCGI("axis_axisadm101.do", callbackGuardarEmitir, "operation=DoTransaction&SPERSON_REL=" + PSPERSON + "&NPOLIZA=" + POLIZA + "&CURRENCY=" + PCURRENCY + "&PAYREASON=" + PPAYREASON + "&AMOPAY=" + PAMOPAY + "&DATEREC=" + PDATEREC + "&PAYMET=" + PPAYMET + "&CHTYPE=" + PCHTYPE + "&TID=" + PTID + "&PAYTEXT=" + PPAYTEXT + "&BNAME=" + PBNAME + "&OBANK=" + POBANK + "&CHNUM=" + PCHNUM + "&CLIMOP=" + PCLIMOP + "&CHDRTYPE=" + PCHDRTYPE + "&ACCONUM=" + PACCONUM + "&ACCOHOLD=" + PACCOHOLD+"&MENSWARNINFO="+PMENSWARNINFO, this, '<axis:alt f="axisctr009" c="JSLIT_ENVIAR" lit="1000399"/>');
                }            
            }
        
    
  
  
    function callbackGuardarEmitir (ajaxResponseText) {
    
        var doc = objAjax.domParse(ajaxResponseText);             
        var  TIPERROR = 0;
        var CERROR = 0;
        var TERROR = "";          
        try{
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                objDom.setVisibilidadPorId("but_9907708", "hidden");
                
                var PTID = objDom.getValorPorId("TID");
                
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=refdeposito&MENSAJE= &CTIPO=REFDEPOSITO&REFDEPOSITO="+PTID , 0, 0);
            }
        } 
        catch (e) {
        TIPERROR = 0;
        CERROR = 0;
        TERROR = 0;
        }
    }

function val_number(valor){
        try{
            if (objDom.getValorPorId('PAYMET') == 6){                
                if(!objUtiles.estaVacio(valor)){
                    if(objNumero.validarNegativos(valor)){
                        entrada = objNumero.formateaNumero(valor, true);  
                        entrada = objNumero.quitarSeparadorMiles(entrada);
                        document.miForm.AMOPAY.value = objNumero.formateaNumeroMoneda(valor);
                    }
                    else {
                        alert(objJsMessages.jslit_valor_numerico);
                        document.miForm.AMOPAY.value = '';
                        document.miForm.AMOPAY.focus();
                    }
                }
            }
            else{
                valor = objValidador.valorFormateadoCampoNumerico(valor, true, false);
                if(objNumero.validaNumero(valor, true)) {
                    document.miForm.AMOPAY.value = objNumero.formateaNumeroMoneda(valor);                        
                }else{
                    document.miForm.AMOPAY.value = '';
                    document.miForm.AMOPAY.focus();
                }    
            }
        }catch(e){
            alert (e.name + " " + e.message);
        }
    }
    function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
                objUtiles.ejecutarFormulario ("axis_axisadm101.do", "init", document.miForm, "_self");
         
            }

    function valida(){
    	  
    	  f_cargar_propiedades_pantalla();
    	 
    	  var tipoCheque = document.getElementById("CHTYPE").value;
    	  
    	  var tipoDraft = document.getElementById("CHDRTYPE").value;

    	  if (tipoCheque == 3){
    	  
    	  document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
    	  document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";

    	  document.miForm.CHNUM.setAttribute("obligatorio","true");
    	  document.miForm.ACCONUM.setAttribute("obligatorio","true");
    	  
    	  }
    	  
    	   if (tipoCheque == 1){
    	  
    	  document.getElementById("CHNUM").className  = "campowidthinput campo campotexto campotexto_ob";
    	  document.getElementById("ACCONUM").className  = "campowidthinput campo campotexto campotexto_ob";
    	  document.getElementById("ACCOHOLD").className  = "campowidthinput campo campotexto campotexto_ob";
    	  document.getElementById("PAYTEXT").className  = "campowidthinput campo campotexto campotexto_ob";

    	  document.miForm.CHNUM.setAttribute("obligatorio","true");
    	  document.miForm.ACCONUM.setAttribute("obligatorio","true");
    	  document.miForm.ACCOHOLD.setAttribute("obligatorio","true");
    	  document.miForm.PAYTEXT.setAttribute("obligatorio","true");
    	  
    	  }
    	          
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
        <input type="hidden" name="TID" id="TID" value="${__formdata.listValores.TID}" />
        <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
      
      
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
            <axis:alt f="axisadm101" c="TITULO" lit="9908750"/>
            </c:param>
            <c:param name="formulario">
            <axis:alt f="axisadm101" c="FORM" lit="9908750"/>
            </c:param>
        <c:param name="form">axisadm101</c:param>
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
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr019|<axis:alt f="axisctr020" c="MOD_PANT_AXICTR019" lit="1000188"/>#axisimprimir|<axis:alt f="axisctr020" c="MOD_PANT_IMPRIMIR" lit="1000205"/>|true#axisgedox|<axis:alt f="${pantalla}" c="LIT_GEDOX" lit="1000201"></axis:alt>#axisctr023|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR023" lit="1000191"/>#axisctr025|<axis:alt f="axisctr020" c="MOD_PANT_AXISCTR025" lit="140360"/>#axisctr029|<axis:alt f="${pantalla}" c="LIT_PANTALLA_DETASE" lit="1000195"/>#axisctr148|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR148" lit="1000199"/>#axisctr030|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISCTR030" lit="1000196"/>#axisctr039|Suplementos#axisadm028|<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISADM028" lit="1000568"/>#axisopenurl||<axis:alt f="axisctr020" c="MOD_PANTALLA_AXISOPENURL" lit="1000568"/></c:param>
        </c:import>
      <!-- Área de campos  -->
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
      
       <tr id="SECBUSPOL">
          <td >
            <!-- Seccion de datos de Poliza busqueda  -->
            <div class="titulo">
              <img src="images/flecha.gif"/>
              <axis:alt f="axiscob001" c="DATOSPOL" lit="104925"/>
             
            </div>
            <table class="seccion" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr>
                      <th style="width:10%;height:0px">&nbsp;</th>
                      <th style="width:5%;height:0px">&nbsp;</th>
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
                      <td class="titulocaja">
                      
                      </td>
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
                                       <td class="campocaja">
                                       <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer" alt='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'
                                       title='<axis:alt f="axiscob001" c="BUSQ" lit="9000508"/>'/>
                                       </td>   
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
        
      
                 
       <tr id="CASHDESK">
       <td>
       <table  align="center">
       
       <tr>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>
        <th style="width:20%;height:0px"></th>   
        </tr>
       
       <div class="titulo">
         <img src="images/flecha.gif"/><axis:alt f="axisadm093" c="PAY_DETAILS" lit="9907918"/>
       </div>  
         <hr align="left" noshade="noshade" size="2" width="100%"/>
       
       <tr>
       <axis:ocultar f="axisadm093" c="CURRENCY" dejarHueco="false">
           <td class="titulocaja" id="tit_CURRENCY" width="5%"><b><axis:alt f="axisadm093" c="CURRENCY" lit="9907718"/></b></td>
       </axis:ocultar>
       
       <axis:visible f="axisadm093" c="CURRENCY" >
            <td class="campocaja" id="td_CURRENCY" width="10%" align="left" >
               <select name="CURRENCY" id="CURRENCY" size="1" disabled="true" class="campowidthselect campo campotexto" <axis:atr f="axisadm093" c="CURRENCY" a="obligatorio=true"/>>
                 
                      <c:forEach var="element" items="${__formdata.listValores.currency}">
                        <option value="${element.CMONEDA}"
                               <c:if test="${element.CMONEDA == __formdata.CTIPIDE}"> selected </c:if> > 
                                ${element.TMONEDA}
                        </option>
                      </c:forEach>
               </select>
            </td>
        </axis:visible>
        
        <!-- pay reason block -->
        <axis:ocultar f="axisadm093" c="PAYREASON" dejarHueco="false">
            <td class="titulocaja" id="tit_PAYREASON" width="5%"><b><axis:alt f="axisadm093" c="PAYREASON" lit="9907720"/></b></td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="PAYREASON">
        <td class="campocaja" id="td_PAYREASON" width="10%" align="left">
            <select name="PAYREASON" id="PAYREASON" size="1" class="campowidthselect campo campotexto" <axis:atr f="axisadm093" c="PAYREASON" a="obligatorio=true"/>
            title="<axis:alt f="axisadm093" c="PAYMET" lit="9907720"/>">
            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="PAYREASON" lit="1000348"/> - </option>
            <c:forEach var="element" items="${__formdata.listValores.payreason}">
                <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if>> 
                    ${element.TATRIBU}
                </option>
            </c:forEach> 
            </select> 
        </td>
        </axis:visible>
    
     </tr>
     
     <tr>
            <!-- pay method block -->
            <axis:ocultar f="axisadm093" c="PAYMET" dejarHueco="false">
                <td class="titulocaja" id="tit_PAYMET" width="100px;"><b><axis:alt f="axisadm093" c="PAYMET" lit="9907711"/></b></td>
            </axis:ocultar>
            
            <axis:visible f="axisadm093" c="PAYMET"> 
            <td class="campocaja" id="td_PAYMET">
                <select name="PAYMET" id="PAYMET" size="1" class="campowidthselect campo campotexto" onchange="f_limpia_monto();f_cargar_propiedades_pantalla();"
                        <axis:atr f="axisadm093" c="PAYMET" a="obligatorio=true"/> title="<axis:alt f="axisadm093" c="PAYMET" lit="9907711"/>">
                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="PAYMET" lit="1000348"/> - </option>
                <c:forEach var="element" items="${__formdata.listValores.paymet}">
                    <option value="${element.CATRIBU}" <c:if test="${element.CATRIBU == __formdata.PAYMET}">  selected = "selected" </c:if> > 
                        ${element.TATRIBU}
                    </option>
                </c:forEach>
                </select>
            </td>
            </axis:visible>
        
     </tr>
        
     <tr>        
        <axis:ocultar f="axisadm093" c="AMOPAY" dejarHueco="false">
            <td class="titulocaja" id="tit_AMOPAY" width="100px;"><b><axis:alt f="axisadm093" c="AMOPAY" lit="9907719"/></b></td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="AMOPAY"> 
        <td class="campocaja" id="td_AMOPAY">
            <input type="text" class="campo campotexto" value="" name="AMOPAY" id="AMOPAY" size="15" onchange="val_number(this.value);" 
            <axis:atr f="axisadm093" c="AMOPAY" a="obligatorio=true"/> title="<axis:alt f="axisadm093" c="AMOPAY" lit="9907719"/>"/>
        </td>
        </axis:visible>
     </tr>   
     
     <!-- date recivied block -->
    <tr><axis:ocultar f="axisadm093" c="DATEREC" dejarHueco="false"><td class="titulocaja" id="tit_DATAREC" width="100px;"><b><axis:alt f="axisadm093" c="DATEREC" lit="9907723"/></b></td>
    </axis:ocultar>
    <axis:visible f="axisadm093" c="DATEREC"><td class="campocaja" id="td_DATAREC" width="100px;">
    <input type="text" class="campowidthinput campo campotexto" size="10" value="" name="DATEREC" id="DATEREC"  style="width:85%;"
    <axis:atr f="axisadm093" c="DATEREC" a="modificable=true&formato=fecha&obligatorio=true"/> title="<axis:alt f="axisadm093" c="DATEREC" lit="9907723"/>"/> 
    <a id="icon_DATEREC" style="vertical-align:middle;" href="#"><img id="popup_calendario_DATEREC" border="0" alt="<axis:alt f="axisadm093" c="DATEREC_CAL" lit="9907723"/>" title="<axis:alt f="axisadm093" c="TIT_DATEREC" lit="9907723" />" src="images/calendar.gif"/></a>
    </td>
    </axis:visible>  
    </tr>  

     
       
       <!-- title red PAYMENT METHOD -->
        <tr>
        <!-- title red PAYMENT DETAILS -->
        <td>
        <div class="titulo">
        <img src="images/flecha.gif"/><axis:alt f="axisadm093" c="PAY_DETAILS" lit="9907918"/>
        </div>                             
        </td>
        </tr>
        <!-- end title red PAYMENT DETAILS -->
        <tr>
        <td>
        <hr align="left" noshade="noshade" size="2" width="473%"/>
        </td>
        </tr>
        <tr>
       <!-- bname block -->
        <tr>
        <axis:ocultar f="axisadm093" c="BNAME" dejarHueco="false">
          <td class="titulocaja" id="tit_BNAME" width="100px;"><b><axis:alt f="axisadm093" c="BNAME" lit="9907712"/></b></td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="BNAME" > <td class="campocaja" id="td_BNAME">
        <select name="BNAME" id="BNAME" size="1" class="campowidthselect campo campotexto">
        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="BNAME" lit="1000348"/> - </option>
        <c:forEach var="element" items="${__formdata.listValores.bname}">
        <option value="${element.CBANCO}" <c:if test="${element.CBANCO == __formdata.CTIPIDE}"> selected </c:if> />
        ${element.TBANCO} </c:forEach></select></td>
        </axis:visible>
        <!-- other bank block -->
        
        
        <axis:ocultar f="axisadm093" c="OBANK" dejarHueco="false">
        <td class="titulocaja" id="tit_OBANK" width="100px;" >
        <b>
        <axis:alt f="axisadm093" c="OBANK" lit="9907713"/>
        </b>
        </td>
        </axis:ocultar>
        
        
        
        <axis:visible f="axisadm093" c="OBANK"> 
         <td class="campocaja" id="td_OBANK">
         <input type="text" class="campo campotexto" value="" name="OBANK" id="OBANK" size="15"/></td>
        </axis:visible>
        </tr>
        
        <!-- chtype block -->
        <tr>
        <axis:ocultar f="axisadm093" c="CHTYPE" dejarHueco="false">
        <td class="titulocaja" id="tit_CHTYPE" width="100px;"><b> <axis:alt f="axisadm093" c="CHTYPE" lit="9907714"/></b> </td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="CHTYPE"> 
        <td class="campocaja" id="td_CHTYPE"> 
        <select name="CHTYPE" id="CHTYPE" size="1" class="campowidthselect campo campotexto" 
        onchange="f_dependencia();" > 
        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="CHTYPE" lit="1000348"/> - </option>
        <c:forEach var="element" items="${__formdata.listValores.chtypelist}"> 
        <option value="${element.CATRIBU}"
        <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />${element.TATRIBU}
        </c:forEach>
        </select>
        
        </td>
        </axis:visible>
        
        </tr>
        
        <!-- cheque draft type block -->
        <tr>
        
        <axis:ocultar f="axisadm093" c="CHDRTYPE" dejarHueco="false">
        <td class="titulocaja" id="tit_CHDRTYPE" width="100px;"><b><axis:alt f="axisadm093" c="CHDRTYPE" lit="9907715"/></b></td>
        </axis:ocultar>
        
        <axis:visible f="axisadm093" c="CHDRTYPE">
            <td class="campocaja" id="td_CHDRTYPE">
                <select name="CHDRTYPE" id="CHDRTYPE" size="1" class="campowidthselect campo campotexto" onchange="valida();">
                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm093" c="CHDRTYPE" lit="1000348"/> - </option>
                    <c:forEach var="element" items="${__formdata.listValores.chdrtype}">
                    <option value="${element.CATRIBU}" 
                    <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> /> ${element.TATRIBU} 
                    </c:forEach>
                </select> 
            </td>
        </axis:visible>
        </tr>
        
        <!-- cheque num block -->
        <tr>
        <axis:ocultar f="axisadm093" c="CHNUM" dejarHueco="false"><td class="titulocaja" id="tit_CHNUM" width="100px;"> <b> <axis:alt f="axisadm093" c="CHNUM" lit="9907717"/></b></td>
        </axis:ocultar>
        
        
        <axis:visible f="axisadm093" c="CHNUM">
        <td class="campocaja" id="td_CHNUM">
        <input type="text" class="campo campotexto" value="" name="CHNUM" id="CHNUM" size="15"/></td>
        </axis:visible>
        
        
        </tr>
        
        <!-- account num block -->                           
        <tr>
        <axis:ocultar f="axisadm093" c="ACCONUM" dejarHueco="false"><td class="titulocaja" id="tit_ACCONUM" width="100px;" ><b><axis:alt f="axisadm093" c="ACCONUM" lit="9907721"/></b> </td>
        </axis:ocultar>
        <axis:visible f="axisadm093" c="ACCONUM"><td class="campocaja" id="td_ACCONUM"><input type="text" class="campo campotexto"  value="" name="ACCONUM" id="ACCONUM" size="15"/></td>
        </axis:visible>
        
        <axis:ocultar f="axisadm093" c="ACCOHOLD" dejarHueco="false">
            <td class="titulocaja" id="tit_ACCOHOLD">
                <b>
                    <axis:alt f="axisadm093" c="ACCOHOLD" lit="9908485"/>
                </b>
            </td>
        </axis:ocultar>
        
        <axis:ocultar f="axisadm093" c="ACCOHOLD">
             <td class="campocaja" id="td_ACCOHOLD">
                   <input type="text" class="campo campotexto" value="" name="ACCOHOLD" id="ACCOHOLD" style="width:100%;"/></td>
             </td>
        </axis:ocultar>
    
        </tr> 
        
        <!-- pay text block -->
        <tr>
        <axis:ocultar f="axisadm093" c="PAYTEXT" dejarHueco="false">
        <td class="titulocaja" id="tit_PAYTEXT"><b> <axis:alt f="axisadm093" c="PAYTEXT" lit="9907724"/></b> 
        </td>
        </axis:ocultar> 
        <axis:visible f="axisadm093" c="PAYTEXT"> 
        <td class="campocaja" id="td_PAYTEXT" colspan="2"> 
        
         <textarea <axis:atr f="axisadm093" c="PAYTEXT" a="modificable=true"/> 
          title="<axis:alt f="axisadm093" c="PAYTEXT" lit="9907724"/>" cols="" rows="3" class="campo campotexto"  id="PAYTEXT" name="PAYTEXT" size="15" maxlength="125"
          style="width:98%;overflow-x:hidden;overflow-y:auto"></textarea>
        </td>
        </axis:visible>
        </tr>
       
         
       </table>
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
                            
                            <display:column title="${title14}" sortable="true" sortProperty="CMOVIMI" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.NREFDEPOSITO}
                              </div>
                            </display:column>
                            
                            </axis:visible>
                           
                            <axis:visible f="axiscob001" c="DATE" >
                             <display:column title="${title1}" sortable="true" sortProperty="FFECMOV" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                              <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECMOV}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                            
                             <axis:visible f="axiscob001" c="VALUE_DATE" >
                             <display:column title="${title2}" sortable="true" sortProperty="FFECVAL" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FFECVAL}'/> 
                              </div>
                            </display:column>
                            </axis:visible>
                            
                            
                            <axis:visible f="axiscob001" c="TMOVIMI" >
                            
                            <display:column title="${title12}" sortable="true" sortProperty="CMOVIMI" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; width:15px">
                              <div class="dspText">
                                ${lstMov.TMOVIMI}
                              </div>
                            </display:column>
                            
                            </axis:visible>
                            
                             <display:column title="${title30}" sortable="true" sortProperty="TDESCRI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspText">
                                ${lstMov.TDESCRI}
                              </div>
                            </display:column>
                            
                             <display:column title="${title8}" sortable="true" sortProperty="IIMPOPE" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                              <div class="dspNumber">
                                <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDA]}" value="${lstMov.IIMPOPE}"/> ${lstMov.CMONEDA} 
                              </div>
                            </display:column>
                             <display:column title="${title6}" sortable="true" sortProperty="IIMPPRO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                               <div class="dspNumber">
                                    <fmt:formatNumber pattern="${__formatNumberPatterns[lstMov.CMONEDAPRO]}" value="${lstMov.IIMPPRO}"/> ${lstMov.CMONEDAPRO}
                              </div>
                            </display:column>
                            <display:column title="${title9}" sortable="true" sortProperty="IIMPINS" headerClass="sortable" media="html" autolink="false"  style="white-space:nowrap;">
                               <div class="dspNumber">
                                  <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.IIMPINS}"/> ${lstMov.CMONEDAINS}
                              </div>
                            </display:column>
                             <display:column title="${title10}" sortable="true" sortProperty="FCAMBIO" headerClass="sortable" media="html" autolink="false">
                             <div class="dspDate">
                               <fmt:formatDate pattern='dd/MM/yyyy' value='${lstMov.FCAMBIO}'/> 
                              </div> 
                            </display:column>
                             <display:column title="${title11}" sortable="true" sortProperty="ISALDO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; ">
                             <div class="dspNumber">
                              <fmt:formatNumber pattern="${applicationScope.__formatNumberPatterns[lstMov.CMONEDAINS]}" value="${lstMov.ISALDO}"/> ${lstMov.CMONEDAINS}
                              
                              </div>
                              
                            </display:column>
                            
                           
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
      
       <!-- TABLE BUTTONS START -->
     <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
     <tr>
     <td>
     <c:import url="../include/botonera_nt.jsp">
     <c:param name="f">axisadm101</c:param>
     <c:param name="__botones">salir</c:param>
     </c:import>
     </td>
     <td>
     <label id="labelSum" value=""  style="color:red; font-size: 10px;font-weight: bold;"  ></label>
     </td>
     <td>
     <c:import url="../include/botonera_nt.jsp">
     <c:param name="f">axisadm093</c:param>
    <c:param name="__botones">
    <axis:visible c="BT_ACEPTAR" f="axisadm093">9907708</axis:visible>
    </c:param>
    </c:import>
    </td>
    </tr>
    </table>
    <div class="separador">&nbsp;</div>
      <div class="separador">&nbsp;</div>
      
    <c:import url="../include/mensajes.jsp" />
    <!-- calendar scripts -->
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "DATEREC",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_DATEREC", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>
