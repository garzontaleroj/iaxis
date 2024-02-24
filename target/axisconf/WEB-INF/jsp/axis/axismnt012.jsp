<%--
      NOMBRE:    axismnt012.jsp
      @author XPL
      Fecha: 10/05/2010
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla mantenimiento de logs de procesos de carga
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        10/05/2010   XPL(iniciales)     1. Creación de la pantalla. 14455: ENSA101 - Procés de càrrega de fitxers
     
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
            var SPROCES = "${__formdata.SPROCES}";	
            
                 if (objUtiles.estaVacio(SPROCES))     
                    f_abrir_modal("axismnt013");
                    
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
 	    			}
 	    			function f_cargar_propiedades_pantalla(){
								f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
	    			}
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("axis_axismnt012.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axismnt012", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axismnt012.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
                }
            }
            /****************************************************************************************/
            /*********************************** Funciones de carga**********************************/
            /****************************************************************************************/ 
            function f_cargar_productos(thiss){
                    objAjax.invokeAsyncCGI("axis_axismnt012.do", callbackAjaxCargarProductos,
                    "operation=ajax_busqueda_productos&CRAMO=" +thiss.value, this, objJsMessages.jslit_cargando);
            }     
            
            
            function f_selecciona_carga(SPROCES){        
                objDom.setValorPorId("SPROCES", SPROCES);
                <c:set var="SPR">SPROCES</c:set>
                var qs="operation=ajax_busqueda_lineas";
                            qs=qs+"&SPROCES="+SPROCES;                    
                        objAjax.invokeAsyncCGI("axis_axismnt012.do", callbackajaxCarga, qs, this, objJsMessages.jslit_cargando);        
            }    
        
        
        
            function f_selecciona_carga_linea_errores(SPROCES,NLINEA){
            
                   objDom.setValorPorId("SPROCES", SPROCES);
                   objDom.setValorPorId("NLINEA", NLINEA);
                   
                var qs="operation=ajax_busqueda_errores";
                            qs=qs+"&SPROCES="+SPROCES+"&NLINEA="+NLINEA;                    
                        objAjax.invokeAsyncCGI("axis_axismnt012.do", callbackajaxCargaErrors, qs, this, objJsMessages.jslit_cargando);        
                    
             }
            
                 

            /****************************************************************************************/
            /*********************************** Callbacks**********************************/
            /****************************************************************************************/ 
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <fmt:message key="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            }   
            
            function callbackajaxCarga(ajaxResponseText){
                try{ 
                document.miForm.NLINEA.value = '';
               //    alert(ajaxResponseText);
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        var tbody = objLista.obtenerBodyLista("ctrlLinea");
                        var tr = objLista.obtenerFilasBodyLista("ctrlLinea", tbody);                  
                                                
                        objLista.borrarFilasDeLista ("ctrlLinea", "8", "<fmt:message key='1000254' />");                        
                        objLista.borrarFilasDeLista ("ctrlLineaError", "4", "<fmt:message key='1000254' />");
                        if (objDom.existeTag(doc, "SPROCES")){
                        
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            var newtr = objLista.crearNuevaFila(rowstyle);
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "SPROCES") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                                                        
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(8);                                                                                                                                                
                                                                          
                            var RADIOSPROCESS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0) : "";                                              
                            var SPROCES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0) : "";
                            var NLINEA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NLINEA")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NLINEA"), i, 0) : "";
                                
                            var SSEGURO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : ""; 
                            var NRECIBO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRECIBO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), i, 0) : "";
                            var NTRAMIT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NTRAMIT")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NTRAMIT"), i, 0) : "";   
                            var NPOLIZA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPOLIZA")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0) : "";  
                            var NSINIES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NSINIES")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("NSINIES"), i, 0) : "";    
                            var SPERSON   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), i, 0) : "";      
                          
                          
                            var CESTADO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTADO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADO"), i, 0) : ""; 
                            var TESTADO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADO"), i, 0) : "";    
                            var CVALIDADO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CVALIDADO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALIDADO"), i, 0) : ""; 
                            var TTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPO"), i, 0) : "";
                                
                            var IDINT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDINT")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDINT"), i, 0) : "";     
                            var IDEXT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDEXT")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDEXT"), i, 0) : "";                             
                            
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            
                                
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            newtd[0] = objLista.addRadioButtonEnLista("RadioctrlLinea",
                               objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0),
                               "javascript:f_selecciona_carga_linea_errores('"+ SPROCES +"','"+ NLINEA +"');");
                               
                           // newtd[1] = objLista.addNumeroEnLista(SPROCES);
                            newtd[1] = objLista.addTextoEnLista(TTIPO);                             
                            newtd[2] = objLista.addTextoEnLista(IDINT);                            
                            newtd[3] = objLista.addTextoEnLista(IDEXT);
                            newtd[4] = objLista.addTextoEnLista(TESTADO);                                                                                                                                                                                                        
                            newtd[5] = objLista.addCheckBoxEnLista("CVALIDADO_"+i, CVALIDADO, "",true); 
                            if (!objUtiles.estaVacio(NSINIES) ){
                            newtd[6] = objLista.addImagenEnLista("javascript:f_seleccionar_siniestro('"+ NSINIES +"','"+ NTRAMIT +"','"+ SSEGURO +"','"+ SPROCES +"','"+ NLINEA +"');",
                                    "0", "", "", "images/find.gif");                       
                            }else {
                                    if (!objUtiles.estaVacio(NRECIBO)){
                                        newtd[6] = objLista.addImagenEnLista("javascript:f_seleccionar_recibo('"+ NRECIBO +"','"+ SSEGURO +"','"+ SPROCES +"','"+ NLINEA +"');",
                                                "0", "", "", "images/find.gif");                       
                                     }else {
                                            if (!objUtiles.estaVacio(SPERSON)){
                                                newtd[6] = objLista.addImagenEnLista("javascript:f_seleccionar_persona('"+ SPERSON +"','"+ SSEGURO +"','"+ SPROCES +"','"+ NLINEA +"');",
                                                        "0", "", "", "images/find.gif");                       
                                             }else {
                                                 if (!objUtiles.estaVacio(SSEGURO)){
                                                   newtd[6] = objLista.addImagenEnLista("javascript:f_seleccionar_poliza('"+ SSEGURO +"','"+ SPROCES +"','"+ NLINEA +"');",
                                                            "0", "", "", "images/find.gif");                       
                                                 
                                                 }else{
                                                    var newtd_buit = document.createElement("td");
                                                    var newdiv_buit = document.createElement("div");
                                                    newdiv_buit.className = "dspIcons";
                                                    var textNodo = document.createTextNode("");
                                                    newdiv.appendChild(textNodo);
                                                    newtd_buit.appendChild(newdiv_buit);
                                                    newtd[6] = newtd_buit;
                                                 }
                                              }
                                        }
                                 }
                            
                            
                                                                      
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                            document.getElementById("CVALIDADO_"+i).className="dspText";
                            document.getElementById("CVALIDADO_"+i).disabled = true;  
                              if (CVALIDADO == 1)
                                document.getElementById("CVALIDADO_"+i).checked = true;         
                                else
                                  document.getElementById("CVALIDADO_"+i).checked = false;    

                          if (i==0){
                            document.getElementById("RadioctrlLinea").checked = true; 
                            document.miForm.NLINEA.value = NLINEA;
                            
                           }
                           }
                                  
                          revisarEstilos();
                        if (objDom.existeTag(doc, "NLINEA")){
                        	    if (!objUtiles.estaVacio(document.miForm.NLINEA.value)){
			                            f_selecciona_carga_linea_errores(SPROCES,document.miForm.NLINEA.value);  
			                        }
			                        
                      	}else document.miForm.NLINEA.value = '';
                      }
     
                    } // Fi if 
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
        
            function callbackajaxCargaErrors(ajaxResponseText){
                try{ 
                  //  alert(ajaxResponseText);
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        var tbody = objLista.obtenerBodyLista("ctrlLineaError");
                        var tr = objLista.obtenerFilasBodyLista("ctrlLineaError", tbody);                  
                        
                        objLista.borrarFilasDeLista ("ctrlLineaError", "4", "<fmt:message key='1000254' />");
                        
                        if (objDom.existeTag(doc, "SPROCES"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                            
                        
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "SPROCES") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                            
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(4);                                                                                                                                                
                                                                                               
                            var SPROCES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0) : "";
                            var TTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPO"), i, 0) : "";                            
                            var TERROR   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TERROR")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TERROR"), i, 0) : "";                                                                    
                            var TMENSAJE   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMENSAJE")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMENSAJE"), i, 0) : "";                                                                    
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            //newtd[0] = objLista.addRadioButtonEnLista("radioNCODINT", NCODINT,
                            //"javascript:f_recargar_tipoInteres('" + NCODINT + "')");  
                         //   newtd[0] = objLista.addNumeroEnLista(SPROCES);
                            newtd[0] = objLista.addTextoEnLista(TTIPO);                            
                            newtd[1] = objLista.addTextoEnLista(TERROR);
                            var nom = "MENSAJE_"+SPROCES;
                            var newtds = document.createElement("td");
                            textArea = document.createElement("<textarea class='campo campotexto' readonly id ='"+nom+"' name='"+ nom +"' cols=50 rows=3>");
                            textArea.innerHTML  = TMENSAJE;
                            newtds.appendChild(textArea);
                            
                            newtd[2] = newtds;
                            //objLista.crearTextArea("MENSAJE_"+SPROCES,TMENSAJE, "MENSAJE_"+SPROCES , "MENSAJE_"+SPROCES  ,50,3,"campo campotexto",true,"50px");
                             
                           // objLista.addTextoEnLista(TMENSAJE);
                          //  objLista.crearTextArea("textarea_observaciones", TMENSAJE, "TOBSERVA_0_0", "TOBSERVA_0_0", 2, 50, "campo campotexto", "visible", "block", true, "50px");                                  
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                          
                        }
                        
                        // Si  hemos borrado el que teníamos seleccionado (el radiobutton marcado)
                        // En el callback tendremos que seleccionar el primer registro.
                        //if (!objUtiles.estaVacio(seleccionarPrimerRegistro) && seleccionarPrimerRegistro == true)
                            //f_selecciona_primer_NCODINT();
                            
     
                    } // Fi if 
                    revisarEstilos();
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<fmt:message key="1000421"/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
             }
             
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
             function f_formatear(thiss){
                 thiss.value = validarNumeros(thiss.value);
             }
             
             /*******************************************
                                Navegar
             ********************************************/
             function f_seleccionar_poliza(SSEGURO,SPROCES,NLINEA){
                f_clear();
                document.miForm.SSEGURO.value = SSEGURO;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEA.value = NLINEA;
                objUtiles.ejecutarFormulario("axis_axismnt012.do", "navegarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_recibo(NRECIBO,SSEGURO,SPROCES,NLINEA){
                f_clear();
                document.miForm.NRECIBO.value = NRECIBO;
                document.miForm.SSEGURO.value = SSEGURO;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEA.value = NLINEA;
                objUtiles.ejecutarFormulario("axis_axismnt012.do", "navegarRecibo", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_persona(SPERSON,SPROCES,NLINEA){
                f_clear();
                document.miForm.SPERSON.value = SPERSON;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEA.value = NLINEA;
                objUtiles.ejecutarFormulario("axis_axismnt012.do", "navegarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_siniestro(NSINIES,NTRAMIT,SSEGURO,SPROCES,NLINEA){
                f_clear();
                document.miForm.NSINIES.value = NSINIES;
                document.miForm.NSINIESselected.value = NSINIES;
                document.miForm.NTRAMIT.value = NTRAMIT;
                document.miForm.SSEGURO.value = SSEGURO;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEA.value = NLINEA;
                objUtiles.ejecutarFormulario("axis_axismnt012.do", "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             
             function f_clear(){
                document.miForm.NSINIES.value = '';
                document.miForm.NSINIESselected.value = '';
                document.miForm.NTRAMIT.value = '';
                document.miForm.SSEGURO.value = '';
                document.miForm.SPERSON.value = '';
                document.miForm.NRECIBO.value = '';
                
                
             }

         
            function mostrar(nombreCapa,nombreDIV){ 
                objUtiles.scrollPoll(nombreCapa,nombreDIV);
            } 
            
            function ocultar(nombreCapa){ 
            //alert(nombreCapa);
            document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axismnt013|<fmt:message key="9002151" /></c:param>
    </c:import>
   


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" name="NRECIBO" id="NRECIBO" value="${__formdata.NRECIBO}"/>
       <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
       <input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" name="NSINIESselected" id="NSINIESselected" value="${__formdata.NSINIESselected}"/>
       <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
       <input type="hidden" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}"/>
       <input type="hidden" name="NLINEA" id="NLINEA" value="${__formdata.NLINEA}"/>
       <input type="hidden" name="NERROR" id="NERROR" value="${__formdata.NERROR}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt012" lit="9002151"/></c:param>
                <c:param name="form">axismnt012</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                   
                        <axis:visible c="SEC_MANT3" f="axismnt012">
                        <!-- Seccion 3 : Lista -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>
                         <b><axis:alt c="LIT_TITULO3" f="axismnt012" lit="111242"/></b>
                        </div>
                        <table class="seccion" align="center">
                            <tr>
                                    <td>
                                            <table class="area" align="center">
                                                <tr>
                                                    <td>
                                                    <c:set var="title1"><axis:alt c="LIT_DSP_TIT01" f="axismnt012" lit="1000576"/></c:set>
                                                    <c:set var="title2"><axis:alt c="LIT_DSP_TIT02" f="axismnt012" lit="1000574"/></c:set>
                                                    <c:set var="title3"><axis:alt c="LIT_DSP_TIT03" f="axismnt012" lit="101510"/></c:set>
                                                    <c:set var="title4"><axis:alt c="LIT_DSP_TIT04" f="axismnt012" lit="9000464"/></c:set>
                                                    <c:set var="title5"><axis:alt c="LIT_DSP_TIT05" f="axismnt012" lit="1000277"/></c:set>
                                                    <c:set var="title6"><axis:alt c="LIT_DSP_TIT06" f="axismnt012" lit="100890"/></c:set>
                                                    <c:set var="title7"><axis:alt c="LIT_DSP_TIT07" f="axismnt012" lit="9001159"/></c:set>
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspace" id="CTRL">
                                                      <display:table name="${__formdata.ctrlCabecera}" id="ctrlCabecera" export="false" class="dsptgtable" style="width:98%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                       requestURI="axis_axismnt012.do?operation=general&paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                           <display:column headerClass="sortable fixed" style="width:5%"  title="" media="html" autolink="false">
                                                            <div class="dspIcons">
                                                              <input <c:if test="${__formdata.SPROCES == ctrlCabecera.SPROCES}" >checked</c:if>
                                                                     onclick="f_selecciona_carga('${ctrlCabecera.SPROCES}');"
                                                                     value="${ctrlCabecera.SPROCES}"
                                                                     type="radio" id="radioctrlCabecera"
                                                                     name="radioctrlCabecera"/>
                                                            </div>
                                                          </display:column>
                                                         <display:column title="${title1}" sortable="true" style="width:10%" sortProperty="SPROCES" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                            <div class="dspNumber">${ctrlCabecera['SPROCES']}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" sortable="true" style="width:15%"  sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">${ctrlCabecera['TFICHERO']}</div>
                                                        </display:column>
                                                        <display:column title="${title3}" sortable="true" style="width:15%" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">
                                                                 <c:if test="${ctrlCabecera['CESTADO'] == 1}"><font color="red">${ctrlCabecera['TESTADO']} </font> </c:if> 
                                                                 <c:if test="${ctrlCabecera['CESTADO'] != 1}">${ctrlCabecera['TESTADO']}</c:if>
                                                            </div>
                                                        </display:column>
                                                        <display:column title="${title4}" sortable="true" style="width:30%" sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText">
                                                                 <table class="area" align="center">
                                                            <tr>
                                                                <th style="width:80%;height:0px"></th>
                                                                <th style="width:20%;height:0px"></th>
                                                            </tr>
                                                            <tr>
                                                            <td>
                                                            ${ctrlCabecera['CERROR_LIT']}
                                                            <c:if test="${empty ctrlCabecera['CERROR_LIT'] && !empty ctrlCabecera['TERROR']}"><fmt:message key="151541"/></c:if>
                                                            </td>
                                                            <td align="center">
                                                            <c:if test="${!empty ctrlCabecera['TERROR']}">
                                                                <img border="0" alt="<fmt:message key="1000113"/>" title1="<fmt:message key="1000113"/>" src="images/informacion.gif" width="11px" height="11px"
                                                                    style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${ctrlCabecera['SPROCES']}','CTRL')" 
                                                                    onmouseout="javascript:ocultar('SECCION_A${ctrlCabecera['SPROCES']}')" />
                                                                </c:if>
                                                            </td>
                                                            </tr>
                                                            </table>
                                                            
                                                                
                                                            </div>
                                                        </display:column>
                                                        <%--display:column title="${title5}" sortable="true" style="width:20%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText"><a href="javascript:f_but_aceptar('${ctrlCabecera['SSEGURO']}')">${ctrlCabecera['TERROR']}</a></div>
                                                        </display:column--%>
                                                        <display:column title="${title6}" sortable="true" style="width:10%" sortProperty="FINI" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText"> <fmt:formatDate pattern="dd/MM/yyyy" value="${ctrlCabecera.FINI}"/></div>
                                                        </display:column>
                                                        <display:column title="${title7}" sortable="true" style="width:10%" sortProperty="FFIN" headerClass="sortable fixed" media="html" autolink="false" >
                                                            <div class="dspText"> <fmt:formatDate pattern="dd/MM/yyyy" value="${ctrlCabecera.FFIN}"/></div>
                                                        </display:column>
                                                         <%--axis:visible f="axismnt012" c="BT_MASDATOS">
                                                             <display:column title="${title11}" headerClass="sortable fixed" media="html" style="width:5%;" autolink="false" >
                                                                <div class="dspIcons"><img border="0" alt="<fmt:message key="1000113"/>" title1="<fmt:message key="1000113"/>" src="images/informacion.gif" width="11px" height="11px"
                                                                style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${ctrlCabecera['SPROCES']}')" 
                                                                onmouseout="javascript:ocultar('SECCION_A${ctrlCabecera['SPROCES']}')" />
                                                                </div>
                                                            </display:column>  
                                                        </axis:visible--%>
                                                         <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                          <display:column class="seccion_informacion" style="width:700px;padding-right:10px;padding-left:5px;">>
                                                            <div id="SECCION_A${ctrlCabecera['SPROCES']}" class="seccion_informacion">
                                                                <!-- INICIO SECCION -->
                                                                <%--div align="right">
                                                                <img  src="images/but_cerrar.gif" alt="<fmt:message key="1000430" />" onclick="javascript:ocultar('SECCION_A${ctrlCabecera['SPROCES']}')" style="cursor:pointer"/>
                                                                </div--%>

                                                                <table class="area" align="center">
                                                                     <tr>
                                                                        <th style="width:50%;height:0px"></th>
                                                                        <th style="width:50%;height:0px"></th>
                                                                     </tr>
                                                                    <tr>
                                                                        <%-- Campo 1 --%>
                                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                            <b>${title5}</b>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                         <%-- CAMPO 1 --%>
                                                                        <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="2">
                                                                       <textarea name="TTEXTOS" rows="5" cols="50" class="campo campotexto" readonly>${ctrlCabecera['TERROR']}</textarea>
                                                                        </td>

                                                                    </tr>

                                                                    </table>


                                                            </div>
                                                        </display:column>

                                                        <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                       
                                                    </display:table>
                                                    </div>
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="separador">&nbsp;</div>
                                                    
                                                        <table class="area" align="center">
                                                            <tr>
                                                                <td>
                                                                <c:set var="title1"><axis:alt c="LIT_DSP_TIT08" f="axismnt012" lit="1000576"/></c:set>
                                                                <c:set var="title2"><axis:alt c="LIT_DSP_TIT09" f="axismnt012" lit="100565"/></c:set>
                                                                <c:set var="title3"><axis:alt c="LIT_DSP_TIT010" f="axismnt012" lit="9901142"/></c:set>
                                                                <c:set var="title4"><axis:alt c="LIT_DSP_TIT011" f="axismnt012" lit="1000245"/></c:set>
                                                                <c:set var="title5"><axis:alt c="LIT_DSP_TIT012" f="axismnt012" lit="101510"/></c:set>
                                                                <c:set var="title6"><axis:alt c="LIT_DSP_TIT013" f="axismnt012" lit="111458"/></c:set>
                                                              
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="displayspace">
                                                                  <display:table name="${__formdata.ctrlLinea}" id="ctrlLinea" export="false" class="dsptgtable" style="width:98%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                                   requestURI="axis_axismnt012.do?operation=general&paginar=true">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                       <display:column headerClass="sortable fixed" style="width:5%"  title="" media="html" autolink="false">
                                                                        <div class="dspIcons">
                                                                          <input <c:if test="${__formdata.SPROCES == ctrlLinea.SPROCES && __formdata.NLINEA == ctrlLinea.NLINEA }" >checked</c:if>
                                                                                 onclick="f_selecciona_carga('${ctrlLinea.SPROCES}');"
                                                                                 value="${ctrlLinea.SPROCES}"
                                                                                 type="radio" id="radioctrlLinea"
                                                                                 name="radioctrlLinea"/>
                                                                        </div>
                                                                      </display:column>
                                                                    <display:column title="${title2}" sortable="true" style="width:15%"  sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${ctrlLinea['TTIPO']}</div>
                                                                     </display:column>
                                                                    <display:column title="${title3}" sortable="true" style="width:15%" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${ctrlLinea['IDINT']}</div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" sortable="true" style="width:15%" sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">${ctrlLinea['IDEXT']}</div>
                                                                    </display:column>
                                                                    <display:column title="${title5}" sortable="true" style="width:15%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText"><c:if test="${ctrlLinea['CESTADO'] == 1}"><font color="red">${ctrlLinea['TESTADO']} </font> </c:if> 
                                                                        <c:if test="${ctrlLinea['CESTADO'] != 1}">${ctrlLinea['TESTADO']}</c:if>
                                                                        </div>
                                                                    </display:column>
                                                                    <display:column title="${title6}" sortable="true" style="width:10%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspText">
                                                                        <input type="checkbox" id="CVALIDADO_${ctrlLinea['SPROCES']}" disabled name="CVALIDADO_${ctrlLinea['SPROCES']}"
                                                                        <c:if test="${ctrlLinea['CVALIDADO'] == 1}">checked </c:if> value="${ctrlLinea['CVALIDADO']}">
                                                                        </div>
                                                                    </display:column>
                                                                    <display:column title="" sortable="true" style="width:10%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                        <c:choose>
                                                                        <c:when test="${!empty ctrlLinea['NSINIES']}">
                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                            alt="<fmt:message key="100797" />" onclick="f_seleccionar_siniestro('${ ctrlLinea['NSINIES']}','${ ctrlLinea['NTRAMIT']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                        </c:when>
                                                                        <c:when test="${!empty ctrlLinea['NRECIBO']}">
                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                            alt="<fmt:message key="100797" />" onclick="f_seleccionar_recibo('${ ctrlLinea['NRECIBO']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                        </c:when>
                                                                        <c:when test="${!empty ctrlLinea['SPERSON']}">
                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                            alt="<fmt:message key="100797" />" onclick="f_seleccionar_persona('${ ctrlLinea['SPERSON']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${!empty ctrlLinea['SSEGURO']}">
                                                                                <img id="find" border="0" src="images/find.gif" 
                                                                                alt="<fmt:message key="100797" />" onclick="f_seleccionar_poliza('${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                            </c:if>
                                                                        </c:otherwise>
                                                                        </c:choose>
                                                                        </div>
                                                                    </display:column>
                                                                   
                                                                    </display:table>
                                                                </div>
                                                                <div class="separador">&nbsp;</div>
                                                                <div class="separador">&nbsp;</div>
                                                    
                                                                    <table class="area" align="center">
                                                                        <tr>
                                                                            <td>
                                                                            <c:set var="title1"><axis:alt c="LIT_DSP_TIT01" f="axismnt012" lit="1000576"/></c:set>
                                                                            <c:set var="title2"><axis:alt c="LIT_DSP_TIT02" f="axismnt012" lit="100565"/></c:set>
                                                                            <c:set var="title3"><axis:alt c="LIT_DSP_TIT03" f="axismnt012" lit="101510"/></c:set>
                                                                            <c:set var="title4"><axis:alt c="LIT_DSP_TIT04" f="axismnt012" lit="1000277"/></c:set>
                                                                            <div class="separador">&nbsp;</div>
                                                                            <div class="displayspace">
                                                                              <display:table name="${__formdata.ctrlLineaError}" id="ctrlLineaError" export="false" class="dsptgtable" style="width:98%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                                               requestURI="axis_axismnt012.do?operation=general&paginar=true&SPROCES=${__formdata.SPROCES}">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                   <%--display:column headerClass="sortable fixed" style="width:5%"  title="" media="html" autolink="false">
                                                                                    <div class="dspIcons">
                                                                                      <input <c:if test="${__formdata.SPROCES == ctrlLineaError.SPROCES && __formdata.NLINEA == ctrlLineaError.NLINEA}" >checked</c:if>
                                                                                             onclick="f_selecciona_carga('${ctrlLineaError.SPROCES}');"
                                                                                             value="${ctrlLineaError.SPROCES}"
                                                                                             type="radio" id="radioSproces2"
                                                                                             name="radioSproces2"/>
                                                                                    </div>
                                                                                 </display:column--%>
                                                                                <display:column title="${title2}" sortable="true" style="width:12%"  sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                    <div class="dspText">${ctrlLineaError['TTIPO']}</div>
                                                                                </display:column>
                                                                                <display:column title="${title3}" sortable="true" style="width:15%" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                    <div class="dspText">${ctrlLineaError['TERROR']}</div>
                                                                                </display:column>
                                                                                <display:column title="${title4}" sortable="true" style="width:20%" sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                    <div class="dspText">
                                                                                        <textarea id="MENSAJE_${ctrlLineaError['SPROCES']}" name="MENSAJE_${ctrlLineaError['SPROCES']}" rows="3" cols="50" class="campo campotexto" readonly >${ctrlLineaError['TMENSAJE']} </textarea>
                                                                                    </div>
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
        
             <div class="separador">&nbsp;</div>
    </form>
   

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axismnt012</c:param>
   <c:param name="__botones"><axis:ocultar f="axismnt012" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

