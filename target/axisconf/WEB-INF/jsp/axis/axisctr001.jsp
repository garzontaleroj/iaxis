<%/* Revision:# 77p4ND/Gi1SL6KQeGVIRPg== # */%>
<%/**
*  Fichero: axisctr001.jsp

*	El usuario escoge el ramo en el desplegable y el sistema le devuelve en el multirregistro inferior todos los productos contratables de dicho ramo. El usuario marca el producto seleccionado y pulsa siguiente.
*	Para llenar el campo ramo se usará la función PAC_IAX_LISTVALORES.F_Get_Ramos() dónde devolverá un ref cursor con los datos.
*	Al seleccionar un elemento del desplegable debe llamar a la función PAX_IAX_LISTVALORES.F_Get_RamProductos(ramo) con el parámetro el valor del desplegable del ramo devolverá los datos para el multiregistro con ref cursor.
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%
UsuarioBean usuario=(UsuarioBean)session.getAttribute("__usuario");
String CONTINUE=(String)usuario.getContenedor().remove("CONTINUE");
usuario.getContenedor().remove("CONTINUE");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr001" c="TITULO_HTML" lit="100681"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            var vreemplazo = false;
            
            
            function f_onload(){
                if (document.getElementById('NREEMPL')!=null){
                    vreemplazo = true;
                }

<%
if (CONTINUE!=null) {
    if (CONTINUE.startsWith("axismenu:axisctr001|SPRODUC_Y_CRAMO=")) { //axismenu:axisctr001|SPRODUC_Y_CRAMO=algo|ALTA_POLIZA 
        String miSPRODUC_Y_CRAMO=CONTINUE.substring(CONTINUE.indexOf("|SPRODUC_Y_CRAMO=")+17);
        miSPRODUC_Y_CRAMO=miSPRODUC_Y_CRAMO.substring(0, miSPRODUC_Y_CRAMO.indexOf("|"));

        //ecg20130222 http://mantis.srvcsi.com/view.php?id=25132#c138797
        String[] miSPRODUC_Y_CRAMOs=org.apache.commons.lang.StringUtils.splitPreserveAllTokens(miSPRODUC_Y_CRAMO,'_'); //pued evenir SPRODUC_CRAMO[_][CAGENTE]
        String miSPRODUC=null;
        String miCRAMO=null;
        String miCAGENTE=null;
        
        if (miSPRODUC_Y_CRAMOs.length>0 && miSPRODUC_Y_CRAMOs[0].trim().length()>0) {
            miSPRODUC=miSPRODUC_Y_CRAMOs[0];
        }
        if (miSPRODUC_Y_CRAMOs.length>1 && miSPRODUC_Y_CRAMOs[1].trim().length()>0) {
            miCRAMO=miSPRODUC_Y_CRAMOs[1];
            
        }
        if (miSPRODUC_Y_CRAMOs.length>2 && miSPRODUC_Y_CRAMOs[2].trim().length()>0) {
            miCAGENTE=miSPRODUC_Y_CRAMOs[2];
        }
        
    %>
    //alert("<%=miCRAMO%> y <%=miSPRODUC%> y <%=miCAGENTE%>")
     document.miForm.CRAMO.value="<%=miCRAMO%>";
     document.miForm.SPRODUC.value="<%=miSPRODUC%>";
     document.miForm.CAGENTE.value="<%=miCAGENTE%>";
     document.miForm.CAGENTE_TEXT.value="<%=miCAGENTE%>";
     seleccionarRamoProducto("<%=miCRAMO%>");
     
     document.miForm.ramoProducto.disabled=true;
     document.miForm.CAGENTE_TEXT.readOnly=true;
     document.miForm.IMG_CAGENTE_TEXT.style.visibility="hidden";
   
     f_actualizar_agente();
    <%if (miCAGENTE!=null) { %>document.miForm.CAGENTE.value="<%=miCAGENTE%>";<%}%>
    <% } //end-if CONTINUE tipo axismenu:axisctr001|SPRODUC=
}
%>                
                f_cargar_propiedades_pantalla();
                
                
            }
            
            function f_but_siguiente() {
          //  if (objValidador.validaEntrada()) {
               // f_seleccionar_producto()
          //      }
		  
		            		f_valida_agente(); //Guilherme El Kadri - Task 4207
//              f_seleccionar_producto();  //Guilherme El Kadri - Task 4207 - se quedo esta linea
		  
		  
            }
            
			//Guilherme El Kadri - Task 4207 - inicio
            function f_valida_agente() {
            	
            	var CAGENTE = document.getElementById("CAGENTE_TEXT").value;
            	objDom.setValorPorId("CAGENTE", CAGENTE);
            	objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxValidarAgente, "operation=ajax_validar_agente&CAGENTE=" + CAGENTE, this, objJsMessages.jslit_cargando);
               
            }            
            
			function callbackAjaxValidarAgente(ajaxResponseText){
               
                var doc=objAjax.domParse(ajaxResponseText);
                var responseBack = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETORNA_VALIDACION"), 0, 0);
				
                if(responseBack != null) {
					
					if("OK" == responseBack) {
						f_seleccionar_producto();
						//return true;
					} else if(responseBack == "1") {
						alert( "<axis:alt f='axisctr001' c='MENSAAGE' lit='9903266'/>"+ "\n PERSONA BLOQUEADA!");
						//bloquear botao seguiente
					} else if(responseBack == "2") {
						alert( "<axis:alt f='axisctr001' c='MENSAAGE' lit='9903266'/>"+ "\n AGENTE BLOQUEADO!");
					}
				}
				return;
             
            }
			//Guilherme El Kadri - Task 4207 - fim
			
            
            function f_but_anterior() {
            }
            
            function f_but_cancelar() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
                // objUtiles.ejecutarFormulario ("flujodetrabajo.do", "cancelar", document.miForm, "_self");
            }
            
            function seleccionarRamoProducto(cramo){
                var selObj=  document.miForm.ramoProducto;
                for(ii=0;ii<selObj.options.length;ii++){
                        if(objUtiles.utilSplit(selObj.options[ii].value, "/")[0] ==cramo){
                            selObj.selectedIndex=ii;
                            return;
                        }
                }
            }
            /****************************************************************************************/
            /************************************** MODAL *******************************************/
            /****************************************************************************************/
            
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
            }
            
            function f_abrir_axisctr019() {
                objDom.setValorPorId("NREEMPL", "");
                objDom.setValorPorId("NCERT", "");
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            function f_aceptar_axisctr019 (SSEGURO,NPOLIZA,NCERTIF) {
                f_cerrar_axisctr019();
                objDom.setValorPorId("NREEMPL", NPOLIZA);
                objDom.setValorPorId("SREEMPL", SSEGURO);
                objDom.setValorPorId("NCERT", NCERTIF);
            }
                        
            function f_seleccionar_producto (SPRODUC, TTITULO){ 
            try{
                //Ejecutamos formulario según producto seleccionado 
                if (!objUtiles.estaVacio (SPRODUC) && !objUtiles.estaVacio (TTITULO)) {
                    objDom.setValorPorId ("SPRODUC", SPRODUC);
                    objDom.setValorPorId ("TTITULO", TTITULO);
                } else {
                    var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("radioProducto");
                    if (!hayAlgunChecked) {
                        alert (objJsMessages.jslit_selecciona_producto);
                        return;
                    } else {
                        objDom.setValorPorId ("SPRODUC", objUtiles.utilSplit(hayAlgunChecked, "/")[0]);
                        objDom.setValorPorId ("TTITULO", objUtiles.utilSplit(hayAlgunChecked, "/")[1]);
                    }
                }
                if (vreemplazo){
                    if (objValidador.validaEntrada()) {
                        objUtiles.ejecutarFormulario ("axis_axisctr001.do", "siguiente_reempl", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }else{
                    objUtiles.ejecutarFormulario ("axis_axisctr001.do", "siguiente", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }catch(e){ alert (e.name + " " + e.message);}
            }
           
            function f_cargar_productos(){
                //if (objValidador.validaEntrada()) {
                    if (objDom.getValorPorId("ramoProducto") != "escogeRamoOption"){
                        //Elementos para realizar la búsqueda
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                        objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                        objUtiles.f_GuardaCasillasChecked ("radioProducto", "SPRODUC");
                        tip = document.miForm.tipo.value;
                         if(document.miForm.CAGENTE_TEXT){
                                CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                         }else{
                                CAGENTE  = document.miForm.CAGENTE_TEXT_AUX.value;
                         }
                         
                         var CMODALI = $("#CMODALI").val(); // BUG CONF-209 - 12/10/2016 - JAEG
                         
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CAGENTE="+CAGENTE+"&tipo="+tip+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO) + "&CMODALI=" + CMODALI, this, objJsMessages.jslit_cargando);
                    }
                    
                //}
                f_cargar_propiedades_pantalla();
            }
            
             function callbackAjaxSelectedRamo(ajaxResponseText) {
              var modalidadesCombo = document.miForm.CMODALI;
              try {
                  var doc = objAjax.domParse(ajaxResponseText);

                  if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                      if (objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])) {
                          objDom.borrarOpcionesDeCombo(modalidadesCombo);
                          objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", modalidadesCombo, 0);
                          for (var i = 0;i < doc.getElementsByTagName("element").length;i++) {

                              var TMODALI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TMODALI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TMODALI")[0].childNodes[0].nodeValue : "");
                              var CMODALI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CMODALI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CMODALI")[0].childNodes[0].nodeValue : "");

                              objDom.addOpcionACombo(CMODALI, TMODALI, modalidadesCombo, i + 1);
                          }
                      }
                      else {
                              objDom.borrarOpcionesDeCombo(modalidadesCombo);
                          objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", modalidadesCombo, null);
                      }
                  }

              }
              catch (e) {
                  objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", modalidadesCombo, null);
                  alert('catch:' + e);
              }
          }
            
            
            function f_cargar_productos_ramo(obj){
            objDom.setValorPorId("CMODALI",null);
             objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxSelectedRamo, "operation=ajax_selected_ramo&CODI=" + objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0], obj, objJsMessages.jslit_actualizando_registro);
             f_cargar_productos();
             f_cargar_propiedades_pantalla();
            }
            
            function f_actualizar_agente(){
                 //alert("En actualizar agente");
                 if(document.miForm.CAGENTE_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
				}else{
					objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT_AUX) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
				
				}
                
            }
            
            /* TRATAMIENTO AGENTE LCF */
            
            function f_recargar_ramos(){
                    //alert("Antes de recargar ramos");
                    if (!objUtiles.estaVacio (document.miForm.ramoProducto.value) ){
                        CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxRecargarRamos, "operation=ajax_recargar_ramos&CAGENTE=" + CAGENTE +
                                   "&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
                    }
            }
            
             /* TRATAMIENTO AGENTE LCF */
             function callbackAjaxRecargarRamos (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                CRAMOform  = document.miForm.CRAMO.value;
                var seleccionado = false;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CRAMO");
                    var RamoCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RamoCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr001" c="SNV_COMBO" lit="108341"/> - ', RamoCombo, 0);
                    for (i = 0; i < elementos.length; i++) {
                        var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);    
                        
                        
                        objDom.addOpcionACombo(CRAMO+"/"+TITULO, TITULO, RamoCombo, i+1);
                        
                        if (CRAMO == CRAMOform){
                           RamoCombo.options[i+1].selected = true;
                           seleccionado = true;
                           TITULOx = TITULO;
                        }
                        
                    }
                    if (seleccionado){
                     if (objDom.getValorPorId("ramoProducto") != "escogeRamoOption"){
                    //Elementos para realizar la búsqueda
                    objDom.setValorComponente(document.miForm.CRAMO, CRAMOform);
                    objDom.setValorComponente(document.miForm.TRAMO, TITULOx);
                    objUtiles.f_GuardaCasillasChecked ("radioProducto", "SPRODUC");
                    tip = document.miForm.tipo.value;
                     CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                      var CMODALI = $("#CMODALI").val();
                    objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CAGENTE="+CAGENTE+"&tipo="+tip+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO) + "&CMODALI=" + CMODALI, this, objJsMessages.jslit_cargando);
                   }
                        
                    }
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll(); 
                
            } 
            
           
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
        
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
                /* TRATAMIENTO AGENTE LCF */
                //Al volver de cargar agente recargammos los ramos y el producto
                 f_recargar_ramos();  /* TRATAMIENTO AGENTE LCF */       
                 objLista.borrarFilasDeLista ("miListaId", "3", "<axis:alt f='axisctr001' c='BORRAR_FILAS' lit='1000254' />");
                 
                // recarrega scroll pane
                $.reinitialiseScroll(); 
                
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
                        objDom.setValorPorId("CAGENTE","");
                    }
                if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisctr001' c='MENSAAGE' lit='9903266'/>";
                    alert(mensajesAlert);
                }
                /* TRATAMIENTO AGENTE LCF */
                //Al volver de cargar agente recargammos los ramos y el producto
                if (!objUtiles.estaVacio (document.miForm.CAGENTE_TEXT.value) ){
                 f_recargar_ramos();  /* TRATAMIENTO AGENTE LCF */       
                }                
                 objLista.borrarFilasDeLista ("miListaId", "3", "<axis:alt f='axisctr001' c='borrar_filas_ramo' lit='1000254' />");
                
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll(); 
             
            }
        
            function callbackAjaxCargarProductos (ajaxResponseText){

                var doc=objAjax.domParse(ajaxResponseText);
                //Buscamos las filas (tradded) y el cuerpo (tbodyadded) de un displayTag asociado (miListaId) 
                //para poder añadir una nueva fila
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    
                    objLista.borrarFilasDeLista ("miListaId", "3", "<axis:alt f='axisctr001' c='SNV_COMBO' lit='108341' />");
                    
                    if (objDom.existeTag(doc, "SPRODUC"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbodyadded, tradded);
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "SPRODUC") ; i++) {
                        //Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                        //Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        //Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(4);
                        //Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addRadioButtonEnLista("radioProducto",
                                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0) + "/" + 
                                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0));
                                            
                        var titulo=objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);
                        titulo=titulo.replace(/'/g, "\\'");
                        
                        newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0), 
                                            "javascript:f_seleccionar_producto('"+ objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0) + "','"+titulo+"');");
                                      
                        newtd[2] = objLista.addTextoEnLista(objDom.getValorComponente(document.miForm.TRAMO));
                        
                        //Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbodyadded);
                        
                       var objOpcs= document.getElementsByName("radioProducto");
                       var objOpc= objOpcs.item(0); 
                       if (!objUtiles.estaVacio(objOpc)){
                        objOpc.checked=true;
                       }
                    }
                }//Fi if
             
                // recarrega scroll pane
                $.reinitialiseScroll(); 
                f_cargar_propiedades_pantalla();
                
            }
            
            function f_abrir_axisctr213(){
                objUtiles.abrirModal("axisctr213","src","modal_axisctr213.do?operation=form&DONDE=AXISCTR001&CRAMOSEL="+document.miForm.CRAMO.value);
            }
            
            function f_cerrar_axisctr213() {
                objUtiles.cerrarModal("axisctr213");
            }
            
            function f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM){ 
                objUtiles.cerrarModal("axisctr213");
                document.miForm.NCASO_BPM.value = NCASO_BPM;
                document.miForm.NNUMCASO.value = NNUMCASO;
                f_cargar_casobpm(2);
            }
            
            function f_cargar_casobpm(donde){
                elemento = document.getElementById('NCASO_BPM');     
                var re = /^(-)?[0-9]*$/;     
                if (!re.test(elemento.value)) {    
                    document.miForm.NCASO_BPM.value = "";
                    alert("<axis:alt f='axisadm022' c='ERRORNUM' lit='1000150'/>");
                    
                }
                else{ 
                    if(donde == 1)
                        document.miForm.NNUMCASO.value = "";
                   
                    if (!objUtiles.estaVacio (document.miForm.NNUMCASO.value) ||
                        !objUtiles.estaVacio (document.miForm.NCASO_BPM.value)){
                        NNUMCASO  = document.miForm.NNUMCASO.value;
                        NCASO_BPM = document.miForm.NCASO_BPM.value;
                        document.miForm.NOMBRE_NCASO_BPM.value = "";
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCargarCasoBPM, "operation=ajax_cargar_casobpm&NNUMCASO=" + NNUMCASO +"&NCASO_BPM="+NCASO_BPM , this, objJsMessages.jslit_cargando);
                    }
                    else
                        document.miForm.NOMBRE_NCASO_BPM.value = "";
                }
            }
            
             /* TRATAMIENTO AGENTE LCF */
             function callbackAjaxCargarCasoBPM (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
               // CRAMOform  = document.miForm.CRAMO.value;
               // var seleccionado = false;
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("PTNOMCOM")[0])){
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTNOMCOM"), 0, 0);
                        objDom.setValorPorId("NOMBRE_NCASO_BPM", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_NCASO_BPM",""); 
                    }
                    
                }
                
                // recarrega scroll pane
                $.reinitialiseScroll(); 
                
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisctr001" lit="1000188"/></c:param>
        </c:import>  
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr213|<axis:alt c="axisctr213_TITULO" f="axisctr001" lit="9906011"/></c:param>
        </c:import>
        <input type="hidden" name="operation"/>
        <input type="hidden" name="CRAMO" id="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" name="TRAMO" id="TRAMO"/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="SREEMPL" id="SREEMPL" value="${__formdata.SREEMPL}"/>        
        <input type="hidden" name="tipo" id="tipo" value="${__formdata.tipo}"/>    
        
        
        <input type="hidden" name="NNUMCASO" id="NNUMCASO" value="${__formdata.NNUMCASO}"/>  

        <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}"/>        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr001" c="TITULO" lit="101110" /></c:param>
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><axis:alt f="axisctr001" c="TITULO_FORM" lit="100681" /></c:param>
                <c:param name="form">axisctr001</c:param>
        </c:import>

    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr001" c="INICIO_CTR" lit="1000178" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:10%; height:0px"></th>  <!-- BUG CONF-209 - 12/10/2016 - JAEG -->
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr001" c="LISTARAMOS"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr001" c="LISTARAMOS" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <axis:visible f="axisctr001" c="CAGENTE"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr001" c="CAGENTE" lit="100584" /></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr001" c="TAGENTE" lit="105940" /></b>
                                    </td>
                                </axis:visible>
                                
                                <!-- BUG CONF-209 - 12/10/2016 - JAEG -->
                                <axis:ocultar f="axisctr001" c="CMODALI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr001" c="CMODALI" lit="9908876"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <!-- BUG CONF-209 - 12/10/2016 - JAEG -->                                
                                
                                <td class="titulocaja" nowrap>
                                   <table>
                                        <tr>
                                            <axis:ocultar f="axisctr001" c="NREEMPL"> 
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr001" c="NREEMPL" lit="9902367"></axis:alt></b>
                                            </td>
                                            <axis:ocultar f="axisctr001" c="NCERTIF">
                                            <td class="titulocaja"  >
                                                <b><axis:alt f="axisctr001" c="NCERTIF" lit="9900942"></axis:alt></b>
                                            </td>
                                            </axis:ocultar>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                                </td>
                             </tr>
                             <tr>
                                <axis:ocultar f="axisctr001" c="LISTARAMOS"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos_ramo(this)" class="campowidthselect campo campotexto_ob">
                                            <option value = "escogeRamoOption"> - <axis:alt f="axisctr001" c="SNV_COMBO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${sessionScope.axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == sessionScope.axisctr_selectedRamo.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:visible f="axisctr001" c="CAGENTE"> 
                                    <td class="campocaja">
                                        <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axisctr001" c="CAGENTE" lit="100584" />" id="CAGENTE_TEXT" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axisctr001" c="CAGENTE_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                        <axis:visible f="axisctr001" c="LINT_CAGENTE">
                                        	<img id="IMG_CAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        </axis:visible>
                                    </td>
                                     <td class="campocaja">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                              </axis:visible>
                              
                                <!-- BUG CONF-209 - 12/10/2016 - JAEG -->
                                <axis:ocultar f="axisctr001" c="CMODALI">
                                    <td class="campocaja">
                                        <select name = "CMODALI" id="CMODALI" style="width:200px;" size="1" 
                                                onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                           <c:forEach var="modalidades" items="${sessionScope.modalidadesramo}">
                                                <option value = "${modalidades.CMODALI}"
                                                    <c:if test="${modalidades.CMODALI == sessionScope.modalidadesramo.CMODALI}">selected</c:if>>
                                                    ${modalidades.TMODALI}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <!-- BUG CONF-209 - 12/10/2016 - JAEG -->                              
                                
                                <input type="hidden" name="CAGENTE_TEXT_AUX" id="CAGENTE_TEXT_AUX" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" />
                                <axis:visible f="axisctr001" c="NREEMPL"> 
                                    <td class="campocaja" nowrap>
                                        <input type="text" name="NREEMPL" title="<axis:alt f="axisctr001" c="NREEMPL" lit="9902367" />" id="NREEMPL" value="${__formdata.NREEMPL}" class="campowidthinput campo campotexto" style="width:70%"
                                        <axis:atr f="axisctr001" c="NREEMPL" a="modificable=true&obligatorio=true"/> onkeypress="this.value=''" onkeyup="this.value=''" onblur="this.value=''"/>
                                        <axis:ocultar f="axisctr001" c="NCERTIF">
                                            <input type="text" class="campowidthinput campo campotexto" size="8" style="width:30px" value="${__formdata.NCERT}" name="NCERT" id="NCERT"
                                                formato="entero" title="<axis:alt f="axisctr001" c="CCERTIF" lit="101096"/>" <axis:atr f="axisctr001" c="NCERT" a="modificable=false&obligatorio=true"/> />
                                        </axis:ocultar>
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr019();" style="cursor:pointer"/>
                                    </td>
                                </axis:visible>
                                
                             </tr>
                             <axis:visible f="axisctr001" c="NCASO_BPM">
                                 <tr>
                                        <td class="titulocaja" id="tit_NCASO_BPM">
                                            <b><axis:alt f="axisctr001" c="NCASO_BPM" lit="9905993" /></b>
                                        </td>
                                        <td class="titulocaja" id="tit_NOMBRE_NCASO_BPM">
                                            <b><axis:alt f="axisctr001" c="TNCASO_BPM" lit="105940" /></b>
                                        </td>
                                 </tr>
                                 <tr>   
                                        <td class="campocaja">
                                            <input type="text" name="NCASO_BPM" title="<axis:alt f="axisctr001" c="NCASO_BPM" lit="9905993" />" id="NCASO_BPM" value="${__formdata.NCASO_BPM}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                            <axis:atr f="axisctr001" c="NCASO_BPM" a="modificable=true&obligatorio=false"/> onchange="f_cargar_casobpm(1)" />
                                            <img border="0" src="images/find.gif" onclick="f_abrir_axisctr213()" style="cursor:pointer" id="BUSQNCASO_BPM"/>
                                        </td>
                                         <td class="campocaja" colspan="2">    
                                            <input readonly="true" type="text" name="NOMBRE_NCASO_BPM" id="NOMBRE_NCASO_BPM" value="${__formdata.NOMBRE_NCASO_BPM}" class="campowidthinput campo campotexto"/>
                                        </td>
                                 </tr>
                             </axis:visible>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
            </table>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr001" c="DSP_RESULT" lit="102177" /></div>
            <axis:visible f="axisctr001" c="SPRODUC"> <!-- TODO C: lista de productos -->
                <table class="seccion" align="center">
                
                
                    <tr>
                        <td>
                        <table class="area" align="center"> 
                        <tr>
                            <td>

                                       
                            <c:set var="title0"><axis:alt f="axisctr001" c="CODIGO" lit="1000307"/></c:set>
                            <c:set var="title1"><axis:visible f="axisctr001" c="TRAMO">
                                                    <axis:alt f="axisctr001" c="TRAMO" lit="100784"></axis:alt>
                                                </axis:visible>
                            </c:set>
                            <c:set var="productoId">${sessionScope.axisctr_producto.SPRODUC}</c:set>
                            <div class="separador">&nbsp;</div>
                            <div class="displayspaceProductos">
                                
                                <display:table name="${sessionScope.axisctr_listaProductos}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="axis_axisctr001.do?ordenar=true&tabla=axisctr_listaProductos&campo=TTITULO">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                    <div class="dspIcons">
                                    <input <c:if test="${productoId == miListaId['SPRODUC']}">checked</c:if> 
                                        value="${miListaId['SPRODUC']}/${miListaId['TTITULO']}" type="radio" id="radioProducto" name="radioProducto"/></div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar_producto('${miListaId['SPRODUC']}', '${miListaId['TTITULO']}');">${miListaId['TTITULO']}</a></div>
                                </display:column>
                                <display:column title="${title1}" sortable="false" sortProperty="" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${sessionScope.axisctr_selectedRamo.TRAMO}</div>
                                </display:column>
                                </display:table>
                                </div>
                 
                            <div class="separador">&nbsp;</div>
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
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr001</c:param><c:param name="f">axisctr001</c:param>
        <c:param name="__botones">cancelar,siguiente</c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>
