<%/*
*  Fichero: axispro018.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 18/06/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
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
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        // Var global para cuando vamos a axispro022 o axispro023, para saber qué displaytag recargar
        var queDisplayTagRecargar;
        // Var global para indicar que se ha hecho un cambio y que hay que ocultar el botón cancelar de AXISPRO007
        var hayCambios = false;

        function f_but_salir() {
           objAjax.invokeAsyncCGI("modal_axispro018.do", callbackSalir,
                "operation=salir", this);
        }
        
        function callbackSalir() {
            setTimeout("parent.f_cerrar_modal('axispro018')", 100);
            parent.f_abrir_modal('axispro007', true, '&hayCambios=' + hayCambios);                                             
        }
        
        function f_onload() {
            var hayLSTNCODINT = ${!empty DATTECN_LSTNCODINT};
            if (!hayLSTNCODINT) 
                f_abrir_modal("axispro018_buscador", false);
            else {
                f_selecciona_primer_NCODINT();
            }
        }
        
        function f_selecciona_primer_NCODINT() {
            /* (Seleccionar el primer registro del cuadro si no hay ninguno seleccionado */
                if (!objUtiles.estaVacio(document.getElementById("radioNCODINT"))) {
                    var pantallaNCODINT = !objUtiles.estaVacio(document.getElementById("radioNCODINT").length) ? document.getElementById("radioNCODINT")[0]
                            : document.getElementById("radioNCODINT");               
                    // Seleccionar el primer tipo de interés (si lo hay)
                    pantallaNCODINT.checked = true;
                    pantallaNCODINT.onclick();
                   
                }
        }
        
        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_axispro022o23(cual, isNCODINT, isCTIPO, isFINICIO, isNDESDE, MODO, queRecargar) {
            var queryString = "";
            
            if (isNCODINT)
                queryString += "&NCODINT=" + document.getElementById("NCODINT").value;
            if (isCTIPO)
                queryString += "&CTIPO=" + document.getElementById("CTIPO").value;
            if (isFINICIO)
                queryString += "&FINICIO=" + document.getElementById("FINICIO").value;                            
            if (isNDESDE)
                queryString += "&NDESDE=" + document.getElementById("NDESDE").value; 
            
               
            queryString += "&MODO="+MODO; 
            
            if(MODO != "NUEVO")    
                queryString += "&CTRAMTIP="+document.getElementById("CTRAMOTIP").value;    
            
            f_abrir_modal(cual, false, queryString, queRecargar);
        }
        
        
        function f_abrir_modal(cual, noXButton, optionalQueryString, queRecargar) {            
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";

            if (!objUtiles.estaVacio(queRecargar))                                
                queDisplayTagRecargar = queRecargar;
            
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
            
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_aceptar_modal(cual) {
            f_cerrar_modal(cual);
            if (cual == 'axispro018_buscador')
                objUtiles.ejecutarFormulario("modal_axispro018.do", "form", document.miForm, "_self");            
            else { // axispro022 y axispro023 
                hayCambios = true;                
                if (!objUtiles.estaVacio(queDisplayTagRecargar)) {
                    if (queDisplayTagRecargar == 'tiposInteres')                     
                        f_recargar_tipoInteres(objDom.getValorPorId("NCODINT"));                          
                    else if (queDisplayTagRecargar == 'vigencias') 
                        f_recargar_vigencias(objDom.getValorPorId("NCODINT"), objDom.getValorPorId("CTIPO"));                                                                        
                    else if (queDisplayTagRecargar == 'tramos')                    
                        f_recargar_tramos(objDom.getValorPorId("NCODINT"), objDom.getValorPorId("CTIPO"), objDom.getValorPorId("FINICIO"), objDom.getValorPorId("CTRAMOTIP"));                        
                }                    
            }               
        }
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        
        /****************************************************************************************/
        /******************** FUNCIONES DE BORRAR REGISTROS de DISPLAYTAGS **********************/
        /****************************************************************************************/
        
        function f_delete_cuadroInteres(NCODINT) {
            var params = "&NCODINT=" + NCODINT; 
            // Si estamos borrando el que tenemos seleccionado (el radiobutton marcado)
            // En el callback tendremos que seleccionar el primer registro.
            var seleccionarPrimerRegistro = (NCODINT == objDom.getValorPorId("NCODINT"));
            
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarCuadroInteres,
                "operation=deleteCuadroInteres" + params, this, null, seleccionarPrimerRegistro);
            hayCambios = true;                
        }
        
        function f_delete_vigencia(NCODINT, CTIPO, FINICIO) {
            var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO; 
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarTipoInteres, // OJO: No callbackRecargarVigencias: Recargamos todos los multi-reg.
                "operation=deleteVigencia" + params, this);
            hayCambios = true;                
        }
        
        function f_delete_tramo(NCODINT, CTIPO, FINICIO, NDESDE) {
            var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO + "&NDESDE=" + NDESDE; 
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarTramos,
                "operation=deleteTramo" + params, this, null, FINICIO);
            hayCambios = true;                
        }
        
        /****************************************************************************************/
        /******************************** RECARGA DISPLAYTAGS ***********************************/
        /****************************************************************************************/
        
        /* 1r Displaytag */
        function f_recargar_tipoInteres(NCODINT) {
            var params = "&NCODINT=" + NCODINT; 
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarTipoInteres,
                "operation=recargarTipoInteres" + params, this);
        }
        
        /* 2o Displaytag */
        function f_recargar_vigencias(NCODINT, CTIPO) {
            var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO; 
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarVigencias,
                "operation=recargarVigencias" + params, this);
        }
        
        /* 3r Displaytag */
        function f_recargar_tramos(NCODINT, CTIPO, FINICIO, CTRAMOTIP) {
            
            document.miForm.CTRAMOTIP.value = CTRAMOTIP;
            
            var params = "&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO;
            objAjax.invokeAsyncCGI("modal_axispro018.do", callbackRecargarTramos,
                "operation=recargarTramos" + params, this, null, FINICIO);    
        }
        
        /****************************************************************************************/
        /************************ CALLBACKS RECARGA DISPLAYTAGS *********************************/
        /****************************************************************************************/
        
        /* 0 Displaytag */
        function callbackRecargarCuadroInteres (ajaxResponseText, seleccionarPrimerRegistro) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("LSTNCODINT");
                    var tr = objLista.obtenerFilasBodyLista("LSTNCODINT", tbody);                  
                    
                    objLista.borrarFilasDeLista ("LSTNCODINT", "6", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERESPROD", "2", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERTECMOV", "6", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERTECMOVDET", "4", "<fmt:message key='1000254' />"); //kkk
                    
                    if (objDom.existeTag(doc, "NCODINT"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "NCODINT") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(6);
                        
                        var TIDIOMA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TIDIOMA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TIDIOMA"), i, 0) : "";
                        var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : ""; 
                        var TNCODINT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNCODINT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNCODINT"), i, 0) : "";
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addRadioButtonEnLista("radioNCODINT", NCODINT,
                        "javascript:f_recargar_tipoInteres('" + NCODINT + "')");  
                
                        newtd[1] = objLista.addTextoEnLista(TIDIOMA);                             
                        newtd[2] = objLista.addNumeroEnLista(NCODINT);                            
                        newtd[3] = objLista.addTextoEnLista(TNCODINT);                             
                        newtd[4] = objLista.addImagenEnLista("javascript:void(0)",
                                    "0", "<fmt:message key='100002' />", "<fmt:message key='100002' />", "images/lapiz.gif");
                        newtd[5] = objLista.addImagenEnLista("javascript:f_delete_cuadroInteres('" + NCODINT + "')",
                                    "0", "<fmt:message key='1000127' />", "<fmt:message key='1000127' />", "images/delete.gif");
                                              
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);                    
                    }
                    
                    // Si  hemos borrado el que teníamos seleccionado (el radiobutton marcado)
                    // En el callback tendremos que seleccionar el primer registro.
                    if (!objUtiles.estaVacio(seleccionarPrimerRegistro) && seleccionarPrimerRegistro == true)
                        f_selecciona_primer_NCODINT();

                } // Fi if
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        /* 1r Displaytag */
        function callbackRecargarTipoInteres (ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("INTERESPROD");
                    var tr = objLista.obtenerFilasBodyLista("INTERESPROD", tbody);
                    var primerRadio;     
                    var primerNCODINT;
                    var primerCTIPO;                        
                    
                    objLista.borrarFilasDeLista ("INTERESPROD", "2", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERTECMOV", "6", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERTECMOVDET", "4", "<fmt:message key='1000254' />"); //kkk
                    
                    if (objDom.existeTag(doc, "OB_IAX_INTERTECPROD"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECPROD") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(2);
                        
                        var CTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPO"), i, 0) : "";
                        var TTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPO"), i, 0) : "";                                
                        var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : "";                                 
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addRadioButtonEnLista("radioCTIPO", CTIPO,
                                            "javascript:f_recargar_vigencias('" + NCODINT + "', '" + CTIPO + "');");      
                        
                        if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                            primerRadio = newtd[0];                                        
                            primerNCODINT = NCODINT;
                            primerCTIPO   = CTIPO;
                        }
                        newtd[1] = objLista.addTextoEnLista(TTIPO);                             
                                               
                        // Actualizar hidden NCODINT
                        document.getElementById("NCODINT").value = NCODINT;
                                               
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);                    
                    }
                    
                    if (!objUtiles.estaVacio(primerRadio)) {
                        // Marcamos el primero
                        objLista.estadoRadioCheckBox(primerRadio.getElementsByTagName("input"), true);                                                                          
                        f_recargar_vigencias(primerNCODINT, primerCTIPO);
                    }
                } // Fi if
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        /* 2o Displaytag */            
        function callbackRecargarVigencias(ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("INTERTECMOV");
                    var tr = objLista.obtenerFilasBodyLista("INTERTECMOV", tbody);
                    var primerRadio;     
                    var primerNCODINT; 
                    var primerCTIPO;
                    var primerFINICIO; 
                    var primerCTRAMOTIP;
                    objLista.borrarFilasDeLista ("INTERTECMOV", "6", "<fmt:message key='1000254' />");
                    objLista.borrarFilasDeLista ("INTERTECMOVDET", "4", "<fmt:message key='1000254' />"); ///kkk
                    
                    if (objDom.existeTag(doc, "OB_IAX_INTERTECPROD"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECPROD") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(6);
                        
                        var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : "";
                        var FINICIO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINICIO")[i]) ? 
                            objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINICIO"), i, 0)) : "";
                        var FFIN    = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFIN")[i]) ? 
                            objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFIN"), i, 0)) : "";                    
                        var CTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPO"), i, 0) : "";
                        var TTRAMOTIP = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTRAMOTIP")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTRAMOTIP"), i, 0) : "";
                            
                        var CTRAMOTIP = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTRAMOTIP")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTRAMOTIP"), i, 0) : "";    
                        document.miForm.CTRAMOTIP.value = CTRAMOTIP;
                        
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addRadioButtonEnLista("radioFINICIO", FINICIO,
                                            "javascript:f_recargar_tramos('" + NCODINT + "', '" + CTIPO + "', '" + FINICIO + "', '"+CTRAMOTIP + "');");  
                                            
                        if (i == 0 && !objUtiles.estaVacio(newtd[0])) {
                            primerRadio = newtd[0];                                        
                            primerNCODINT   = NCODINT;
                            primerCTIPO     = CTIPO;
                            primerFINICIO   = FINICIO;
                            primerCTRAMOTIP = CTRAMOTIP;
                        }
                        newtd[1] = objLista.addTextoEnLista(FINICIO); 
                        newtd[2] = objLista.addTextoEnLista(FFIN); 
                        newtd[3] = objLista.addTextoEnLista(TTRAMOTIP); 
                        newtd[4] = objLista.addImagenEnLista("javascript:f_abrir_modal('axispro022', false, '&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO+"&MODO=MODIF "+"&FINICIO=" + FINICIO + "', 'vigencias')",
                                    "0", "<fmt:message key='100002' />", "<fmt:message key='100002' />", "images/lapiz.gif");
                        newtd[5] = objLista.addImagenEnLista("javascript:f_delete_vigencia('" + NCODINT + "', '" + CTIPO + "','" + FINICIO + "')",
                                    "0", "<fmt:message key='1000127' />", "<fmt:message key='1000127' />", "images/delete.gif");

                        // Actualizar hidden CTIPO
                        document.getElementById("CTIPO").value = CTIPO;
          
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);                    
                    }
                                            
                    if (!objUtiles.estaVacio(primerRadio)) {
                        // Marcamos el primero
                        objLista.estadoRadioCheckBox(primerRadio.getElementsByTagName("input"), true);                                                                          
                        f_recargar_tramos(primerNCODINT, primerCTIPO, primerFINICIO, primerCTRAMOTIP);
                    }
                } // Fi if
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        /* 3r Displaytag */
        function callbackRecargarTramos(ajaxResponseText, FINICIO) {
        
            try {        
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("INTERTECMOVDET");
                    var tr = objLista.obtenerFilasBodyLista("INTERTECMOVDET", tbody);
                                    
                    objLista.borrarFilasDeLista ("INTERTECMOVDET", "4", "<fmt:message key='1000254' />");
                    
                    if (objDom.existeTag(doc, "OB_IAX_INTERTECMOVDETPROD"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        objLista.borrarFilaVacia(tbody, tr);
                    
                    // Actualizar hidden FINICIO
                        document.getElementById("FINICIO").value = FINICIO;
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECMOVDETPROD") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(4);
                        
                        var NDESDE  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDESDE")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDESDE"), i, 0) : "";
                        var NHASTA  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NHASTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NHASTA"), i, 0) : "";
                        var NINTTEC = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINTTEC")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINTTEC"), i, 0) : "";                    
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addNumeroEnLista(NDESDE); 
                        newtd[1] = objLista.addNumeroEnLista(NHASTA); 
                        newtd[2] = objLista.addNumeroEnLista(NINTTEC); 
                        
                        /*
                        newtd[3] = objLista.addImagenEnLista(
                            "javascript:f_abrir_modal('axispro023', false, '&NCODINT=" + objDom.getValorPorId("NCODINT") + "&CTIPO=" + objDom.getValorPorId("CTIPO") + "&FINICIO=" + objDom.getValorPorId("FINICIO") + "&NDESDE=" + NDESDE + "', 'tramos')",
                            "0", "<fmt:message key='100002' />", "<fmt:message key='100002' />", "images/lapiz.gif");
                        */
                        newtd[3] = objLista.addImagenEnLista(
                            "javascript:f_delete_tramo('" + objDom.getValorPorId("NCODINT") + "', '" + objDom.getValorPorId("CTIPO") + "', '" + objDom.getValorPorId("FINICIO") + "', '" + NDESDE + "')",
                            "0", "<fmt:message key='1000127' />", "<fmt:message key='1000127' />", "images/delete.gif");
                        
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);
                    }                
                } // Fi if    
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>    
    
    
    <form name="miForm" action="modal_axispro018.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000539"/></c:param>
            <c:param name="form">axispro018</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axispro018_buscador|<fmt:message key="1000539"/>#axispro022|<fmt:message key="1000541"/>#axispro023|<fmt:message key="1000542"/></c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="NCODINT" name="NCODINT" value="${__formdata.NCODINT}"/>
        <input type="hidden" id="CTIPO" name="CTIPO" value="${__formdata.CTIPO}"/>
        <input type="hidden" id="FINICIO" name="FINICIO" value="${__formdata.FINICIO}"/>
        
        <input type="hidden" id="CTRAMOTIP" name="CTRAMOTIP" value="${__formdata.CTRAMOTIP}"/>

        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">        
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellspacing="5">
                    
                    <c:if test="${!empty DATTECN_LSTNCODINT}">
                        <tr>
                            <th style="width:45%;height:0%;"/>
                            <th style="width:55%;height:0%;"/>
                        </tr>
                        <tr>
                            <td align="left" colspan="2">
                                <!-- DisplayTag 0 -->
                                <c:set var="title1"><fmt:message key="1000246"/></c:set>  <%-- IDIOMA --%>
                                <c:set var="title2"><fmt:message key="1000109"/></c:set>  <%-- CÓDIGO --%>
                                <c:set var="title3"><fmt:message key="100588"/></c:set>   <%-- DESCRIPCIÓN --%>
                                <div class="displayspace" style="width:100%;height:100%">
                                  <display:table name="${DATTECN_LSTNCODINT}" id="LSTNCODINT" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="modal_axispro018.do?paginar=true&operation=form">
                                    <%@ include file="../include/displaytag.jsp"%>                                    
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <input type="radio" id="radioNCODINT" name="radioNCODINT" value="${LSTNCODINT.NCODINT}"
                                            onclick="f_recargar_tipoInteres(${LSTNCODINT.NCODINT})"
                                            <c:if test="${sessionScope.DATTECN_NCODINT == LSTNCODINT.NCODINT}"> checked </c:if>/>
                                        </div>
                                    </display:column>                                    
                                    <display:column title="${title1}" sortable="false" sortProperty="TIDIOMA" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                        <div class="dspText">${LSTNCODINT.TIDIOMA}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="NCODINT" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspNumber">${LSTNCODINT.NCODINT}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="TNCODINT" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${LSTNCODINT.TNCODINT}</div>
                                    </display:column>
                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:void(0);"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
                                    </display:column>
                                    <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:f_delete_cuadroInteres('${LSTNCODINT.NCODINT}')"><img border="0" alt="<fmt:message key="1000127"/>" title="<fmt:message key="1000127"/>" src="images/delete.gif"/></a></div>
                                    </display:column>
                                  </display:table>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                          <%--  <td align="center" colspan="2">
                                <input type="button" class="boton" value="<fmt:message key="1000428" />" onclick="javascript:void(0)"/>
                            </td>--%>
                        </tr> 
                        <tr>
                            <td align="left" colspan="2">
                                <!-- DisplayTag 1 -->
                                <div class="displayspace" style="width:100%;height:100%">
                                  <display:table name="${__formdata.OB_IAX_PRODDATOSTECNICOS.INTERESPROD}" id="INTERESPROD" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="modal_axispro018.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <input type="radio" id="radioCTIPO" name="radioCTIPO" value="${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"
                                            onclick="f_recargar_vigencias(${INTERESPROD.OB_IAX_INTERTECPROD.NCODINT}, ${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO})"
                                            <c:if test="${sessionScope.DATTECN_CTIPO == INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"> checked </c:if>/>
                                        </div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_INTERTECPROD.TTIPO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${INTERESPROD.OB_IAX_INTERTECPROD.TTIPO}</div>
                                    </display:column>
                                  </display:table>                                            
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <input type="button" class="boton" value="<fmt:message key="1000428" />" onclick="f_abrir_axispro022o23('axispro022', true, false, false, false, 'NUEVO', 'tiposInteres')"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <!-- DisplayTag 2 -->
                                <c:set var="title1"><fmt:message key="101159"/></c:set> <%-- VALOR --%>
                                <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                <c:set var="title3"><fmt:message key="1000540"/></c:set> <%-- TIPO DE TRAMO --%>                                           
                                <div class="displayspace" style="width:100%;height:100%">
                                  <display:table name="${sessionScope.DATTECN_INTERTECMOV}" id="INTERTECMOV" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="modal_axispro018.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons">
                                            <input type="radio" id="radioFINICIO" name="radioFINICIO" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"
                                            onclick="f_recargar_tramos('${INTERTECMOV.OB_IAX_INTERTECPROD.NCODINT}', '${sessionScope.DATTECN_CTIPO}', '<fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/>','${INTERTECMOV.OB_IAX_INTERTECPROD.CTRAMOTIP}')"
                                            <c:if test="${sessionScope.DATTECN_FINICIO == INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"> checked </c:if>/>
                                        </div>
                                    </display:column>
                                    <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_INTERTECPROD.FINICIO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/></div>                                                
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_INTERTECPROD.FFIN" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FFIN}"/></div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_INTERTECPROD.TTRAMOTIP" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">${INTERTECMOV.OB_IAX_INTERTECPROD.TTRAMOTIP}</div>
                                    </display:column>
                                    <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:void(0);"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
                                    </display:column>
                                    <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:void(0);"><img border="0" alt="<fmt:message key="1000127"/>" title="<fmt:message key="1000127"/>" src="images/delete.gif"/></a></div>
                                    </display:column>
                                  </display:table>
                                </div>
                            </td>
                            <td>
                                <!-- DisplayTag 3 -->
                                <c:set var="title1"><fmt:message key="104095"/></c:set> <%-- DES DE --%>
                                <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                <c:set var="title3"><fmt:message key="101467"/></c:set> <%-- PORCENTAJE --%>   
                                <div class="displayspace" >
                                  <display:table name="${sessionScope.DATTECN_INTERTECMOVDET}" id="INTERTECMOVDET" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                   requestURI="modal_axispro018.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>                                            
                                    <display:column title="${title1}" sortable="false" sortProperty="OB_IAX_INTERTECMOVDETPROD.NDESDE" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                        <div class="dspNumber">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NDESDE}</div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="false" sortProperty="OB_IAX_INTERTECMOVDETPROD.NHASTA" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                        <div class="dspNumber">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NHASTA}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="false" sortProperty="OB_IAX_INTERTECMOVDETPROD.NINTTEC" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                        <div class="dspNumber">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NINTTEC}</div>
                                    </display:column>
                                    
                                    <%--
                                    <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:void(0);"><img border="0" alt="<fmt:message key="100002"/>" title="<fmt:message key="100002"/>" src="images/lapiz.gif"/></a></div>
                                    </display:column>--%>
                                    <display:column title=" " sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                        <div class="dspIcons"><a onclick="javascript:void(0);"><img border="0" alt="<fmt:message key="1000127"/>" title="<fmt:message key="1000127"/>" src="images/delete.gif"/></a></div>
                                    </display:column>
                                    
                                  </display:table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input type="button" class="boton" value="<fmt:message key="1000428" />" onclick="f_abrir_axispro022o23('axispro022', true, true, false, false, 'NUEVO_TRAMO', 'vigencias')"/>                                
                            </td>
                            <%--
                            <td align="center">
                                <input type="button" class="boton" value="<fmt:message key="1000428" />" onclick="f_abrir_axispro022o23('axispro023', true, true, true, false, false, 'tramos')"/>
                            </td>
                            --%>
                        </tr>

                    </c:if>
                    </table>
                </td>
            </tr>

        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">salir <%--,nuevo--%></c:param></c:import>
        
    </form>
    
    <c:import url="../include/mensajes.jsp" />
</body>
</html>