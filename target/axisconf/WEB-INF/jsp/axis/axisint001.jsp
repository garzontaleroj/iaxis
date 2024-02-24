<%/* Revision:# 8dmd04DybBUaaeiWWcuKDw== # */%>
<%--
      NOMBRE:    axisint001.jsp
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
            //Numero de filas que devuelve la consulta
            var num_filas = 0;
	        var ban_tab = 0;
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
            
             $(document).click(function(){
                if( $('#COLUMNAS_ERROR').is(":visible") ){
                   ocultar('COLUMNAS_ERROR');
                }
             });
                
                
                if (${empty __formdata.ctrlCabecera}){
                    f_abrir_modal("axisint002");
                }else{
                 
                    if(${empty __formdata.resultReprocesar})f_but_buscar();
                }
                //Función que nos carga todas las propiedades de pantalla
                f_cargar_propiedades_pantalla();
       
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
            
            function f_aceptar_modal(cual, params){
                objUtiles.cerrarModal(cual);
                objUtiles.ejecutarFormulario("axis_axisint001.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisint002(SPROCES){
                objUtiles.cerrarModal('axisint002');
                f_resetFormulari();
                document.miForm.SPROCES.value = SPROCES;
                objUtiles.ejecutarFormulario("axis_axisint001.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_open_axisint003(SPROCES, NLINEA){
            	CPROCESO = '${ __formdata.ctrlCabecera[0].CPROCESO}';
                var queryString = "&SPROCES="+SPROCES+"&CPROCESO="+CPROCESO+"&NLINEA="+NLINEA;
                f_abrir_modal("axisint003", queryString);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir(){
                var origen = "${__formdata.ORIGEN}";
                
                if(!objUtiles.estaVacio(origen) && origen == "AXISCTR218")
                    parent.f_cerrar_axisint001('axisint001');
                else    
					objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisint001", "cancelar", document.miForm, "_self");
            }
            
            function f_but_aceptar(){
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisint001.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_9901221(){
                document.miForm.NLINEA.value = null;
                 
                
                var vvalidar = document.miForm.CVALIDA.checked;
                var VALIDA = ((vvalidar)?1:0);
                
                objUtiles.ejecutarFormulario("axis_axisint001.do?IDVALIDACION=" + VALIDA, "reprocesar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_buscar(){
                if (!objUtiles.estaVacio(document.getElementById('SPROCES').value)){
                 /*   var qs="operation=ajax_busqueda_lineas&SPROCES="+document.miForm.SPROCES.value;
                     if (!objUtiles.estaVacio(document.getElementById('CESTADOLINEA').value)){
                        qs=qs+"&CESTADOLINEA="+document.miForm.CESTADOLINEA.value;
                    }
                    if (!objUtiles.estaVacio(document.getElementById('CTIPO').value)){
                        qs=qs+"&CTIPO="+document.miForm.CTIPO.value;
                    }
                    if (!objUtiles.estaVacio(document.getElementById('VALOR').value)){
                        qs=qs+"&VALOR="+document.miForm.VALOR.value;
                    }
                    if (!objUtiles.estaVacio(document.getElementById('IDINT').value)){
                        qs=qs+"&IDINT="+document.miForm.IDINT.value;
                    }
                    if (!objUtiles.estaVacio(document.getElementById('IDEXT').value)){
                        qs=qs+"&IDEXT="+document.miForm.IDEXT.value;
                    }
                    if (!objUtiles.estaVacio(document.getElementById('CREVISADO').value)){
                        qs=qs+"&CREVISADO="+document.miForm.CREVISADO.value;
                    } 
                   
                    
                    objAjax.invokeAsyncCGI("axis_axisint001.do", callbackajaxCarga, qs, this, objJsMessages.jslit_cargando);  */
                    
                    var SPROCES;
                    if (document.getElementById('SPROCES')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('SPROCES').value) ){
                            SPROCES = document.getElementById('SPROCES').value;
                        }
                    }
                    
                    var CESTADOLINEA;
                    if (document.getElementById('CESTADOLINEA')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('CESTADOLINEA').value) ){
                            CESTADOLINEA = document.getElementById('CESTADOLINEA').value;
                        }
                    }
                    var CTIPO;
                    if (document.getElementById('CTIPO')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('CTIPO').value) ){
                            CTIPO = document.getElementById('CTIPO').value;
                        }
                    }
                    var VALOR;
                    if (document.getElementById('VALOR')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('VALOR').value) ){
                            VALOR = document.getElementById('VALOR').value;
                        }
                    }
                    var IDINT;
                    if (document.getElementById('IDINT')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('IDINT').value) ){
                            IDINT = document.getElementById('IDINT').value;
                        }
                    }
                    var IDEXT;
                    if (document.getElementById('IDEXT')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('IDEXT').value) ){
                            IDEXT = document.getElementById('IDEXT').value;
                        }
                    }
                    var CREVISADO;
                    if (document.getElementById('CREVISADO')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('CREVISADO').value) ){
                            CREVISADO = document.getElementById('CREVISADO').value;
                        }
                    }
                    
                    objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            
                    $.get("axis_axisint001.do", {'operation': 'busqueda_lineas', 'SPROCES':SPROCES, 'CESTADOLINEA':CESTADOLINEA, 'CTIPO':CTIPO, 'VALOR':VALOR,
                        'IDINT':IDINT, 'IDEXT':IDEXT, 'CREVISADO':CREVISADO,
                        'forward':'lstCargas'}, showListaCargas, "text");
                        
                        
                }else{
                    //S'ha de seleccionar un item de la llista
                    alert("<axis:alt c="ERROR_SELECCIONAR" f="axisint001" lit="9900849"/>");
                }

            }
            
            function showListaCargas(res){
               objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");    
               $("#divCargas").html(res);
            
            }
            
            /****************************************************************************************/
            /*********************************** Funciones de carga**********************************/
            /****************************************************************************************/ 
            function f_cargar_productos(thiss){
                    objAjax.invokeAsyncCGI("axis_axisint001.do", callbackAjaxCargarProductos,
                    "operation=ajax_busqueda_productos&CRAMO=" +thiss.value, this, objJsMessages.jslit_cargando);
            }     
            
            function f_selecciona_carga(SPROCES, CPROCESO){
                objDom.setValorPorId("SPROCES", SPROCES);
                objDom.setValorPorId("CPROCESO", CPROCESO);
                var CESTADO = objDom.getValorPorId("CESTADO");
                var CESTADOLINEA = objDom.getValorPorId("CESTADOLINEA");
                var CTIPO = objDom.getValorPorId("CTIPO");
                var VALOR = objDom.getValorPorId("VALOR");
                var IDINT = objDom.getValorPorId("IDINT");
                var IDEXT = objDom.getValorPorId("IDEXT");
                var CREVISADO = objDom.getValorPorId("CREVISADO");
                <c:set var="SPR">SPROCES</c:set>
                var qs="operation=ajax_busqueda_lineas";
                qs=qs+"&SPROCES="+SPROCES+"&CESTADO="+CESTADO+"&CESTADOLINEA="+CESTADOLINEA+"&CTIPO="+CTIPO+"&VALOR="+VALOR+"&IDINT="+IDINT+"&IDEXT="+IDEXT+"&CREVISADO="+CREVISADO;
                objAjax.invokeAsyncCGI("axis_axisint001.do", callbackajaxCarga, qs, this, objJsMessages.jslit_cargando);        
            }
        
            function f_selecciona_carga_linea_errores(SPROCES,NLINEA){            
                objDom.setValorPorId("SPROCES", SPROCES);
                objDom.setValorPorId("NLINEA", NLINEA);
                objDom.setValorPorId("NLINEAINDX", NLINEA);                  
                var qs="operation=ajax_busqueda_errores";
                qs=qs+"&SPROCES="+SPROCES+"&NLINEA="+NLINEA;                    
                objAjax.invokeAsyncCGI("axis_axisint001.do", callbackajaxCargaErrors, qs, this, objJsMessages.jslit_cargando);                  
            }
            
                 

            /****************************************************************************************/
            /*********************************** Callbacks ******************************************/
            /****************************************************************************************/ 
            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisint001" c="AXISINT001_MSG001" lit="108341" /> - ', SPRODUCCombo, 0);
                        for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                }
            }   
            
            function callbackajaxCarga(ajaxResponseText ) {
                try {
                    var doc=objAjax.domParse(ajaxResponseText);
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        var tbody=objLista.obtenerBodyLista("ctrlLinea");
                        var tr=objLista.obtenerFilasBodyLista("ctrlLinea", tbody);
                
                        objLista.borrarFilasDeLista("ctrlLinea", "8", "<axis:alt f="axisint001" c="AXISINT001_MSG002" lit="1000254" />");
                        objLista.borrarFilasDeLista("ctrlLineaError", "4", "<axis:alt f="axisint001" c="AXISINT001_MSG003" lit="1000254" />");
                        
                        if (objDom.existeTag(doc, "SPROCES")) {
                          
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            
                            objLista.borrarFilaVacia(tbody, tr);
                            objLista.esconderListaSpans();
                            objLista.esconderListaLinks();
                            var rowstyle=objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            var newtr=objLista.crearNuevaFila(rowstyle);
                         
                            // Bucle para insertar cada una de las filas
                            num_filas = objDom.numeroDeTags(doc, "SPROCES");
                            for (var i=0; i < objDom.numeroDeTags(doc, "SPROCES"); i++) {
                                // Obtenemos el estilo para la fila que insertaremos
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd=new Array(8);  //LCF 4
        
                                var RADIOSPROCESS=objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0):"";
                                var SPROCES=objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0):"";
                                var CPROCESO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROCESO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROCESO"), i, 0):"";
                                var NLINEA=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NLINEA")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NLINEA"), i, 0):"";
        
                                var SSEGURO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0):"";
                                var NRECIBO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NRECIBO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), i, 0):"";
                                var NTRAMIT=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NTRAMIT")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NTRAMIT"), i, 0):"";
                                var NPOLIZA=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPOLIZA")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0):"";
                                var NSINIES=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NSINIES")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NSINIES"), i, 0):"";
                                var SPERSON=objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), i, 0):"";
        
        
                                var CESTADO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTADO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADO"), i, 0):"";
                                var TESTADO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADO"), i, 0):"";
                                var CESTADOLINEA=objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTADOLINEA")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADOLINEA"), i, 0):"";
                                var CVALIDADO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("CVALIDADO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALIDADO"), i, 0):"";
                                var TTIPO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTIPO")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTIPO"), i, 0):"";
                                var TTIPO=objUtiles.hayValorElementoXml(doc.getElementsByTagName("CVALIDA")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALIDA"), i, 0):"";
        
        
                                var IDINT=objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDINT")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDINT"), i, 0):"";
                                var IDEXT=objUtiles.hayValorElementoXml(doc.getElementsByTagName("IDEXT")[i])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("IDEXT"), i, 0):"";
        
                                var rowstyle=objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
        
                                var newtr=objLista.crearNuevaFila(rowstyle);
             
                                newtd[0]=objLista.addRadioButtonEnListaDim("RadioctrlLinea", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0), "javascript:f_selecciona_carga_linea_errores('"+SPROCES+"','"+NLINEA+"');","5%");
        
                                //newtd[1] = objLista.addNumeroEnListaDim(SPROCES,"20%");
                                newtd[1]=objLista.addTextoEnListaDim(TTIPO, null, "20%");
                                newtd[2]=objLista.addTextoEnListaDim(IDINT, null, "15%");
                                newtd[3]=objLista.addTextoEnListaDim(IDEXT, null, "15%");
                                if (CESTADO!=1){
                                    newtd[4]=objLista.addTextoEnListaDim(TESTADO, null, "20%");
                                    newtd[4].setAttribute('id', 'DIV_TESTADO_'+NLINEA);
                                }
                                else {
                                    newtd[4]=objLista.addTextoEnListaDimColor(TESTADO, null, "20%", "red");
                                    newtd[4].setAttribute('id', 'DIV_TESTADO_'+NLINEA);
                                }
                                
                                if (CVALIDADO==1) {
                                    //Si es igual a 1 ponemos en icono de visto verde
//                                    newtd[5]=objLista.addImagenEnListaDim("", "0", "", "", "images/formulap.gif","5%");
                                    var newtd_built = document.createElement("td");
                                    newtd_built.style.width = "5%";                                    
                                    var newdiv_built= document.createElement("div");
                                    newdiv_built.className = "dspIcons";                                    
                                    var newima_built = document.createElement("img");
                                    newima_built.border = 0;
                                    newima_built.src = "images/formulap.gif";                                    
                                    newdiv_built.appendChild(newima_built);
                                    newtd_built.appendChild(newdiv_built);
                                    newtd[5]=newtd_built;
                                }
                                else {
//                                    //Si es igual a 0 ponemos en icono de visto rojo
//                                    newtd[5]=objLista.addImagenEnListaDim("", "0", "", "", "images/formulap_red.gif","5%");
                                    var newtd_buit=document.createElement("td");
                                    newtd_buit.style.width = "5%";
                                    var newdiv_buit=document.createElement("div");
                                    newdiv_buit.className="dspIcons";
                                    var textNodo=document.createTextNode("");
                                    newdiv_buit.appendChild(textNodo);
                                    newtd_buit.appendChild(newdiv_buit);
                                    newtd[5]=newtd_buit;
                                }
                                
                                <axis:visible f="axisint001" c="CEDITAR">
                                
                                if (CESTADO == 1){
                                
                                    var newtd_built1=document.createElement("td");
                                    newtd_built1.style.width = "5%";
                                    newtd_built1.setAttribute('align','center');
                                    
                                    
                                    
                                    if (IDINT != "-") {
                                        var imgel = document.createElement("img");
                                        imgel.setAttribute('border','0');
                                        imgel.setAttribute('src',"images/informacion.gif");
                                        imgel.onclick=new Function("f_actualizatablaerr('LINEA_A"+NLINEA+"','CTRLLIN',"+SPROCES+","+NLINEA+")");
                                        ban_tab = 1;
                                        //imgel.onclick=new Function("ocultar('COLUMNAS_ERROR')");
                                        
                                        imgel.style.cursor="pointer";
                                      
                                        newtd_built1.appendChild(imgel);
                                        var imge2 = document.createElement("img");
                                        imge2.setAttribute('border','0');
                                        imge2.setAttribute('src',"images/lapiz.gif");
                                        var onclick = imge2.getAttribute("onclick");  
                                        imge2.onclick= new Function("f_open_axisint003('"+SPROCES+"','"+NLINEA+"')");
                                        imge2.style.cursor="pointer";
                                        newtd_built1.appendChild(imge2);
                                        
                                    }
                                    newtd[6]=newtd_built1;

                                }
                                else {
                                    var newtd_built=document.createElement("td");
                                    newtd_built.style.width = "5%";
                                    newtd_built.setAttribute('align','center');
                                    var newdiv_built=document.createElement("div");
                                    newdiv_built.className="dspIcons";
                                    var textNodo=document.createTextNode("");
                                    newdiv_built.appendChild(textNodo);
                                    newtd_built.appendChild(newdiv_built);
                                    if (IDINT != "-") {
                                        var imgel = document.createElement("img");
                                        imgel.setAttribute('border','0');
                                        imgel.setAttribute('src',"images/informacion.gif");
                                        imgel.onclick=new Function("f_actualizatablaerr('LINEA_A"+NLINEA+"','CTRLLIN',"+SPROCES+","+NLINEA+")");
                                        ban_tab = 1;
                                        imgel.style.cursor="pointer";
                                        newtd_built.appendChild(imgel);
                                    }
                                    newtd[6]=newtd_built;
                                }
                                </axis:visible>
        
                                if (!objUtiles.estaVacio(NSINIES) && CVALIDADO == 1 ) {
                                    newtd[7]=objLista.addImagenEnListaDim("javascript:f_seleccionar_siniestro('"+NSINIES+"','"+NTRAMIT+"','"+SSEGURO+"','"+SPROCES+"','"+NLINEA+"');", "0", "", "Buscar", "images/find.gif","5%");
                                }
                                else if (!objUtiles.estaVacio(NRECIBO) && CVALIDADO == 1) {
                                    newtd[7]=objLista.addImagenEnListaDim("javascript:f_seleccionar_recibo('"+NRECIBO+"','"+SSEGURO+"','"+SPROCES+"','"+NLINEA+"');", "0", "", "Buscar", "images/find.gif","5%");
                                }
                                else if (!objUtiles.estaVacio(SPERSON) && CVALIDADO == 1) {
                                    newtd[7]=objLista.addImagenEnListaDim("javascript:f_seleccionar_persona('"+SPERSON+"','"+SSEGURO+"','"+SPROCES+"','"+NLINEA+"');", "0", "", "Buscar", "images/find.gif","5%");
                                }
                                else if (!objUtiles.estaVacio(SSEGURO) && CVALIDADO == 1) {
                                    newtd[7]=objLista.addImagenEnListaDim("javascript:f_seleccionar_poliza('"+SSEGURO+"','"+SPROCES+"','"+NLINEA+"');", "0", "", "Buscar", "images/find.gif","5%");
                                }
                                else {
                                    var newtd_buit=document.createElement("td");
                                    newtd_buit.style.width = "5%";
                                    var newdiv_buit=document.createElement("div");
                                    newdiv_buit.className="dspIcons";
                                    var textNodo=document.createTextNode("");
                                    newdiv_buit.appendChild(textNodo);
                                    newtd_buit.appendChild(newdiv_buit);
                                    newtd[7]=newtd_buit;
                                }
        
                                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                                objLista.addNuevaFila(newtd, newtr, tbody);
                                
        
                                if (i==0) {
                                    document.getElementById("RadioctrlLinea").checked=true;
                                    document.miForm.NLINEA.value=NLINEA;
                                }
                            } //Fi for
                            
                            
                            
                            
                            
                            
                            //revisarEstilos();
                            if (objDom.existeTag(doc, "NLINEA")) {
                                if (!objUtiles.estaVacio(document.miForm.NLINEA.value)) {
                                    f_selecciona_carga_linea_errores(SPROCES, document.miForm.NLINEA.value);
                                }
                            }
                            else{
                                document.miForm.NLINEA.value='';
                            }
                            if (!objUtiles.estaVacio(document.miForm.MAXREGISTROS.value)) {
                                if (objUtiles.esNumero(document.miForm.MAXREGISTROS.value)){
                                    if (document.miForm.MAXREGISTROS.value <= num_filas){
                                        objAppMensajes.pintarMensajePantalla("<axis:alt f="axisint001" c="CTIPO" lit="1000055" />", "info"); 
                                    }
                                }
                            }
                        }
                        
                    } // Fi if 
                }
                catch (e) {
                    if (isDebugAjaxEnabled=="true")
                        alert(e.name+" "+e.message);
                }
            }
        
            function callbackajaxCargaErrors(ajaxResponseText){
                try{ 
                  //  alert(ajaxResponseText);
                    var doc = objAjax.domParse(ajaxResponseText);
            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        var tbody = objLista.obtenerBodyLista("ctrlLineaError");
                        var tr = objLista.obtenerFilasBodyLista("ctrlLineaError", tbody);                  
                        
                        objLista.borrarFilasDeLista ("ctrlLineaError", "4", "<axis:alt f="axisint001" c="AXISINT001_MSG004" lit="1000254" />");
                        
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
                            
                            //newtd[0] = objLista.addNumeroEnLista(SPROCES);
                            
                            newtd[0] = objLista.addTextoEnListaDim(TTIPO, null, "25%");                            
                            newtd[1] = objLista.addTextoEnListaDim(TERROR, null, "25%");
                            var nom = "MENSAJE_"+SPROCES;
                            var newtds = document.createElement("td");
                            if (document.all) {
                                //Para ie que no deja generar el name via runtime
                                textArea = document.createElement("<textarea class='campo campotexto' readonly id ='"+nom+"' name='"+ nom +"' cols=50 rows=3>");
                            } 
                            else {
                                textArea = document.createElement("textarea");
                                textArea.cols = 50;
                                textArea.rows = 3;                
                                textArea.setAttribute("name", nom); 
                                textArea.setAttribute("disabled", true);                    
                                textArea.className = 'campo campotexto';
                            }
                            textArea.innerHTML  = TMENSAJE.replace(/<br>/gi , "\r\n").replace(/&nbsp;/gi , " ").replace(/<p>|<\/p>/gi , "");
                            newtds.appendChild(textArea);
                            
                            newtd[2] = newtds;
                            //objLista.crearTextArea("MENSAJE_"+SPROCES,TMENSAJE, "MENSAJE_"+SPROCES , "MENSAJE_"+SPROCES  ,50,3,"campo campotexto",true,"50px");
                             
                            //objLista.addTextoEnLista(TMENSAJE);
                            //objLista.crearTextArea("textarea_observaciones", TMENSAJE, "TOBSERVA_0_0", "TOBSERVA_0_0", 2, 50, "campo campotexto", "visible", "block", true, "50px");                                  
                            
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                          
                        }
                        
                        // Si  hemos borrado el que teníamos seleccionado (el radiobutton marcado)
                        // En el callback tendremos que seleccionar el primer registro.
                        //if (!objUtiles.estaVacio(seleccionarPrimerRegistro) && seleccionarPrimerRegistro == true)
                            //f_selecciona_primer_NCODINT();
                    } // Fi if 
                    revisarEstilos();
                    if (!objUtiles.estaVacio(document.miForm.MAXREGISTROS.value)) {
                        if (objUtiles.esNumero(document.miForm.MAXREGISTROS.value)){
                            if (document.miForm.MAXREGISTROS.value <= num_filas){
                                objAppMensajes.pintarMensajePantalla("<axis:alt f="axisint001" c="CTIPO" lit="1000055" />", "info"); 
                            }
                        }
                    }
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
                            alert("<axis:alt f="axisint001" c="AXISINT001_MSG005" lit="1000421" />");
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
                document.miForm.NLINEAINDX.value = NLINEA;
                document.miForm.NLINEA.value = null;
                objUtiles.ejecutarFormulario("axis_axisint001.do", "navegarPoliza", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_recibo(NRECIBO,SSEGURO,SPROCES,NLINEA){
                f_clear();
                document.miForm.NRECIBO.value = NRECIBO;
                document.miForm.SSEGURO.value = SSEGURO;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEAINDX.value = NLINEA;
                document.miForm.NLINEA.value = null;
                objUtiles.ejecutarFormulario("axis_axisint001.do", "navegarRecibo", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_persona(SPERSON,SPROCES,NLINEA){
                f_clear();
                document.miForm.SPERSON.value = SPERSON;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEAINDX.value = NLINEA;
                document.miForm.NLINEA.value = null;
                objUtiles.ejecutarFormulario("axis_axisint001.do", "navegarPersona", document.miForm, "_self", objJsMessages.jslit_cargando);
             }
             function f_seleccionar_siniestro(NSINIES,NTRAMIT,SSEGURO,SPROCES,NLINEA){
                f_clear();
                document.miForm.NSINIES.value = NSINIES;
                document.miForm.NSINIESselected.value = NSINIES;
                document.miForm.NTRAMIT.value = NTRAMIT;
                document.miForm.SSEGURO.value = SSEGURO;
                document.miForm.SPROCES.value = SPROCES;
                document.miForm.NLINEAINDX.value = NLINEA;
                document.miForm.NLINEA.value = null;
                objUtiles.ejecutarFormulario("axis_axisint001.do", "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            function f_onclickCheckbox(thiss){
                thiss.value = ((thiss.checked)?1:0);
                objDom.setValorPorId(thiss.id, thiss.value);
            }
            function fcallbackajaxCestado(NLINE){
                camp = "DIV_TESTADO_"+NLINE;
                campImg = "DIV_TESTADOIMG_"+NLINE;
                if (document.getElementById(camp)!=null){
                    document.getElementById(camp).innerHTML = '<div class="dspText">'+'<axis:alt f="axisint001" c="VALIDATMANUAL" lit="9901628" />'+'</div>';
                    if (document.getElementById(campImg)!=null){
                        document.getElementById(campImg).innerHTML = '';
                    }
                }
                
                f_cerrar_modal('axisint003');
            }
            function f_resetFormulari(){
                if (document.getElementById('CESTADOLINEA')!=null){
                    document.getElementById('CESTADOLINEA').value = null;
                }
                if (document.getElementById('CTIPO')!=null){
                    document.getElementById('CTIPO').value = null;
                }
                if (document.getElementById('VALOR')!=null){
                    document.getElementById('VALOR').value = '';
                }
                if (document.getElementById('IDINT')!=null){
                    document.getElementById('IDINT').value = '';
                }
                if (document.getElementById('IDEXT')!=null){
                    document.getElementById('IDEXT').value = '';
                }
                if (document.getElementById('CREVISADO')!=null){
                    document.getElementById('CREVISADO').value = 0;
                }
                    
            }
            
    function f_but_imprimir(){
 
    //var vMap="651,652,653,654";
    //////////////////////////////
    //objAjax.invokeAsyncCGI("axis_axisint001.do?CMAP=" + vMap + 
    //                    "&CPARAMETROS="+ objDom.getValorPorId("SPROCES")
    //        , callbackAjaxGenerarResultado, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
    
         if (objValidador.validaEntrada()){
     
                  //var params = f_get_params();
                 objUtiles.ejecutarFormulario("axis_axisint001.do?SPROCES2="+objDom.getValorPorId("SPROCES")+"&CPROCESO2="+objDom.getValorPorId("CPROCESO"), "ejecutar", document.miForm, "_self", '<axis:alt f="axislist002" c="MSG_CARGAR" lit="9901019"/>');                 
                }
    
    }
    
    function callbackAjaxGenerarResultado (ajaxResponseText) {
               var doc = objAjax.domParse(ajaxResponseText);
               var returns= doc.getElementsByTagName("RETURN");
                  var tableM = document.getElementById("ReportsList");
                  var tbodyM = tableM.getElementsByTagName("tbody")[0];
                  var trM = tbodyM.getElementsByTagName("tr");  
               
                objLista.borrarFilasDeLista("ReportsList", 1,"");             
              for (var i = 0; i< returns.length; i++ ){
                 var RETURN = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), i, 0) : "";
                                
                                
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(1);
                    RETURN=RETURN.replace(/\\/gi, "barrainvertida");
                    RETURN=RETURN.replace(/barrainvertida/gi, "/");
                    newtd[0] = objLista.addTextoEnLista(RETURN,"javascript:f_imprimir_fitxer('"+RETURN+"')");

                    objLista.addNuevaFila(newtd, newtr, tbodyM);   
                }                          
        }
                    

         function f_imprimir_fitxer(cont){                    
                
                //alert(cont);
                pfitxer = document.getElementById('SORTIDA_'+cont).value;
                //alert(pfitxer);
                //var str2 = pfitxer.replace(/barrainvertida/gi, "\\");        
                var str2 = pfitxer.replace("\\", "/");    
                //alert (str2);
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axisimp001.jsp",600,200);
            }  
			
        function f_actualizatablaerr(NOMBRECAPA,NOMBREDIV, SPROCES, NLINEA) {
           CPROCESO = '${__formdata.ctrlCabecera[0].CPROCESO}';
           var qs="operation=ActualizaTablaErr";
           qs = qs+"&NOMBRECAPA="+NOMBRECAPA;
           qs = qs+"&NOMBREDIV="+NOMBREDIV;
           qs = qs+"&CPROCESO="+CPROCESO;
           qs = qs+"&SPROCES="+SPROCES;
           qs = qs+"&NLINEA="+NLINEA;
           objAjax.invokeAsyncCGI("axis_axisint001.do", callbackmostrartablaerr, qs, this)
        }
        
        function callbackmostrartablaerr(ajaxResponseText) {
          var doc=objAjax.domParse(ajaxResponseText);
          if(!objAppMensajes.existenErroresEnAplicacion(doc)){
          
            var nombreCAPA = "COLUMNAS_ERROR";
            var nombreDIV=objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBREDIV")[0])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBREDIV"), 0, 0):"";
            var TColumnas =objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCOLUMNAS")[0])?objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOLUMNAS"), 0, 0):"";
            document.getElementById('TCOLUMNAS').value = TColumnas;
	    document.getElementById('TCOLUMNAS').style.height = "100px";
            document.getElementById(nombreCAPA).style.visibility="visible";
          }
        }
         
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisint002|<axis:alt f="axisint001" c="AXISINT001_MSG006" lit="9901204" /></c:param>
    </c:import>    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisint003|<axis:alt f="axisint001" c="AXISINT001_MSG007" lit="9901264" /></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisint001" c="LIT" lit="1000205" />|true</c:param>
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
       <input type="hidden" name="NLINEAINDX" id="NLINEAINDX" value="${__formdata.NLINEAINDX}"/>
       <input type="hidden" name="MAXREGISTROS" id="MAXREGISTROS" value="${__formdata.MAXREGISTROS}"/>
       <input type="hidden" name="CPROCESO" id="CPROCESO" value="${ __formdata.ctrlCabecera[0].CPROCESO}"/>
       <input type="hidden" name="TFICHERO" id="TFICHERO" value="${ __formdata.ctrlCabecera[0].TFICHERO}"/>
       <input type="hidden" name="NOMBRECAPA" id="NOMBRECAPA" value="${ __formdata.NOMBRECAPA}"/>
       <input type="hidden" name="NOMBREDIV" id="NOMBREDIV" value="${ __formdata.NOMBREDIV}"/>
       
       
       
       <input type="hidden" name="NERROR" id="NERROR" value="${__formdata.NERROR}"/>
       
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisint001" lit="9901265"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisint001" lit="9901265"/></c:param>
                <c:param name="form">axisint001</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                   
                       
                        <!-- Seccion 3 : Lista -->
                        <div class="separador">&nbsp;</div>
                        <div class="titulo"><img src="images/flecha.gif"/>
                         <b><axis:alt c="LIT_TITULO3" f="axisint001" lit="9900748"/></b>&nbsp;
                         <axis:visible c="BT_BUSCADOR" f="axisint001"> <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisint001" c="AXISINT001_MSG007" lit="100797" />" onclick="f_abrir_modal('axisint002');" style="cursor:pointer"/></axis:visible>
                        </div>
                        <table class="seccion" align="center">
                            <tr>
                                <td>
                                    <table class="area" align="center">
                                                   <tr>
                                                            <td>
                                                                                <c:set var="title1"><axis:alt c="LIT_DSP_TIT01" f="axisint001" lit="1000576"/></c:set>
                                                                                <c:set var="title2"><axis:alt c="LIT_DSP_TIT02" f="axisint001" lit="1000574"/></c:set>
                                                                                <c:set var="title3"><axis:alt c="LIT_DSP_TIT03" f="axisint001" lit="101510"/></c:set>
                                                                                <c:set var="title4"><axis:alt c="LIT_DSP_TIT04" f="axisint001" lit="9000464"/></c:set>
                                                                                <c:set var="title5"><axis:alt c="LIT_DSP_TIT05" f="axisint001" lit="1000277"/></c:set>
                                                                                <c:set var="title6"><axis:alt c="LIT_DSP_TIT06" f="axisint001" lit="100890"/></c:set>
                                                                                <c:set var="title7"><axis:alt c="LIT_DSP_TIT07" f="axisint001" lit="9901282"/></c:set>
                                                                                <c:set var="title8"><axis:alt c="LIT_DSP_TIT08" f="axisint001" lit="9001148"/></c:set>
                                                                                <div class="separador">&nbsp;</div>
                                                                                <div class="displayspace" id="CTRL">
                                                                                  <display:table name="${__formdata.ctrlCabecera}" id="ctrlCabecera" export="false" class="dsptgtable" style="width:100%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                                                   requestURI="axis_axisint001.do?operation=general&paginar=true">
                                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                                    <display:column title="${title1}" sortable="true"  sortProperty="SPROCES" headerClass="sortable fixed"  media="html" autolink="false" >    
                                                                                        <div class="dspNumber">${ctrlCabecera['SPROCES']}</div>
                                                                                    </display:column>
                                                                                    <display:column title="${title2}" sortable="true"   sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText">${ctrlCabecera['TFICHERO']}</div>
                                                                                    </display:column>
                                                                                    <display:column title="${title3}" sortable="true" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText">
                                                                                             <c:if test="${ctrlCabecera['CESTADO'] == 1}"><font color="red">${ctrlCabecera['TESTADO']} </font> </c:if> 
                                                                                             <c:if test="${ctrlCabecera['CESTADO'] != 1}">${ctrlCabecera['TESTADO']}</c:if>
                                                                                        </div>
                                                                                    </display:column>
                                                                                    <display:column title="${title4}" sortable="true" sortProperty="CERROR_LIT" style="width:10%" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText" style="border:0px;">
                                                                                             <table class="area" align="center" style="border:0px;">
                                                                                        <tr>
                                                                                            <th style="width:80%;height:0px;"></th>
                                                                                            <th style="width:20%;height:0px;"></th>
                                                                                        </tr>
                                                                                        <tr >
                                                                                        <td style="border:0px;">
                                                                                        ${ctrlCabecera['CERROR_LIT']}
                                                                                        <c:if test="${empty ctrlCabecera['CERROR_LIT'] && !empty ctrlCabecera['TERROR']}"><axis:alt f="axisint001" c="AXISINT001_MSG008" lit="9903644" /></c:if>
                                                                                        </td>
                                                                                        <td align="center" style="border:0px;">
                                                                                        <c:if test="${!empty ctrlCabecera['TERROR']}">
                                                                                            <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_MSG009" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_MSG008" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_MSG009" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                                                                                                style="cursor:pointer;"   onmouseover="javascript:mostrar('SECCION_A${ctrlCabecera['SPROCES']}','CTRL')" 
                                                                                                onmouseout="javascript:ocultar('SECCION_A${ctrlCabecera['SPROCES']}')" />
                                                                                            </c:if>
                                                                                        </td>
                                                                                        </tr>
                                                                                        </table>
                                                                                        
                                                                                            
                                                                                        </div>
                                                                                    </display:column>
                                                                                    <display:column title="${title6}" sortable="true" style="width:10%" sortProperty="FINI" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText"> <fmt:formatDate pattern="dd/MM/yyyy" value="${ctrlCabecera.FINI}"/></div>
                                                                                    </display:column>
                                                                                    <display:column title="${title7}" sortable="true" style="width:10%" sortProperty="FFIN" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText">${ctrlCabecera.FFIN}</div>
                                                                                    </display:column>
                                                                                     <display:column title="${title8}" sortable="true" style="width:15%" sortProperty="CDESCRIP" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                        <div class="dspText">${ctrlCabecera.CDESCRIP}</div>
                                                                                    </display:column>
                                                                                     <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                                                      <display:column class="seccion_informacion" style="width:700px;padding-right:10px;padding-left:5px;">>
                                                                                        <div id="SECCION_A${ctrlCabecera['SPROCES']}" class="seccion_informacion">
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
                                                                                                   <textarea name="TTEXTOS" rows="9" cols="50" class="campo campotexto" readonly>${ctrlCabecera['TERROR']}</textarea>
                                                                                                    </td>
                            
                                                                                                </tr>
                            
                                                                                                </table>
                            
                            
                                                                                        </div>
                                                                                    </display:column>
                            
                                                                                    <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                                                                   
                                                                                </display:table>
                                                                                </div>
                                                                                
                                                                                <div class="separador">&nbsp;&nbsp;</div>
																				<axis:ocultar f="axisint001" c="RESUMCARGA" dejarHueco="false">
																					<b><axis:alt f="axisint001" c="RESUMCARGA" lit="9905402" /></b>
																					<input type="text" class="campowidthinput campo campotexto"
                                                                                            <axis:atr f="axisint001" c="RESUMCARGA" a="modificable=false"/>
                                                                                            style="width:70%;" size="15" value="${__formdata.ctrlCabecera[0].RESUMCARGA}" name="RESUMCARGA" id="RESUMCARGA"/>
                                                                                </axis:ocultar>
                                                                                
                                                                                <div class="separador">&nbsp;</div>
                                                                                <div class="separador">&nbsp;</div>
                                                                                        
                                                                                        <div class="titulo"><img src="images/flecha.gif"/>
                                                                                            <b><axis:alt c="LIT_TITULO3" f="axisint001" lit="9901197"/></b>
                                                                                        </div>
                                                                                                                                                                   
                                                                                <table class="seccion"><!-- inicio table seccion -->
                                                                                            <tr>
                                                                                                <th style="width:33%;height:0px"></th>
                                                                                                <th style="width:33%;height:0px"></th>
                                                                                                <th style="width:34%;height:0px"></th>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <axis:ocultar f="axisint001" c="CESTADOLINEA" dejarHueco="false">
                                                                                                    <td class="titulocaja">
                                                                                                        <b><axis:alt f="axisint001" c="CESTADOLINEA" lit="9901271" /></b>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar f="axisint001" c="CTIPO" dejarHueco="false">
                                                                                                    <td class="titulocaja">
                                                                                                        <b><axis:alt f="axisint001" c="CTIPO" lit="9901206" /></b>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar f="axisint001" c="VALOR" dejarHueco="false">
                                                                                                    <td id="tit_VALOR" class="titulocaja">
                                                                                                        <b id="label_VALOR"><axis:alt f="axisint001" c="VALOR" lit="101298" /></b>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                 <axis:ocultar f="axisint001" c="CESTADOLINEA" dejarHueco="false"> <!-- TODO C -->
                                                                                                    <td class="campocaja">
                                                                                                        <select name = "CESTADOLINEA" id="CESTADOLINEA" style="width:95%;" size="1"  title="<axis:alt f="axisint001" c="AXISINT001_MSG010" lit="9901271" />"
                                                                                                        <axis:atr f="axisint001" c="CESTADOLINEA" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                                                                        onchange="f_carga_dependencias();" class="campowidthselect campo campotexto">
                                                                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisint001" c="AXISINT001_MSG011" lit="108341" /> - </option>
                                                                                                            <c:forEach var="estados" items="${__formdata.listValores.lstestadolin}">
                                                                                                                <option value = "${estados.CATRIBU}"
                                                                                                                    <c:if test="${estados.CATRIBU == __formdata.CESTADOLINEA}">selected</c:if>>
                                                                                                                    ${estados.TATRIBU}
                                                                                                                </option>
                                                                                                            </c:forEach>
                                                                                                        </select>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar f="axisint001" c="CTIPO" dejarHueco="false">
                                                                                                    <td class="campocaja">
                                                                                                        <select name="CTIPO" id="CTIPO" title="<axis:alt f="axisint001" c="AXISINT001_MSG012" lit="9901206" />" <axis:atr f="axisint001" c="CTIPO" a="modificable=true&obligatorio=false&isInputText=false"/> style="width:95%" size="1" 
                                                                                                        class="campowidthselect campo campotexto" onchange="f_carga_dependencias();revisarEstilos();">
                                                                                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisint001" c="AXISINT001_MSG013" lit="108341" /> - </option>
                                                                                                            <c:forEach var="tipos" items="${__formdata.listValores.lsttipolin}">
                                                                                                                <option value = "${tipos.CATRIBU}"
                                                                                                                    <c:if test="${tipos.CATRIBU == __formdata.CTIPO}">selected</c:if>>
                                                                                                                    ${tipos.TATRIBU}
                                                                                                                </option>
                                                                                                            </c:forEach>             
                                                                                                        </select>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar f="axisint001" c="VALOR" dejarHueco="false">
                                                                                                    <td id="td_VALOR" class="campocaja">
                                                                                                        <input type="text" class="campowidthinput campo campotexto"
                                                                                                        <axis:atr f="axisint001" c="VALOR" a="modificable=true"/>
                                                                                                        style="width:93%;" size="15" value="${__formdata.VALOR}" name="VALOR" id="VALOR"/>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <axis:ocultar f="axisint001" c="IDINT" dejarHueco="false">                                   
                                                                                                    <td id="tit_IDINT" class="titulocaja">
                                                                                                        <b><axis:alt f="axisint001" c="IDINT" lit="9901203" /></b>
                                                                                                    </td>                                    
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar c="IDEXT" f="axisint001" dejarHueco="false">
                                                                                                    <td id="tit_IDEXT" class="titulocaja">
                                                                                                        <b><axis:alt f="axisint001" c="IDEXT" lit="9901202"/></b>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <axis:ocultar f="axisint001" c="IDINT" dejarHueco="false">
                                                                                                    <td id="td_IDINT" class="campocaja">
                                                                                                        <input type="text" class="campowidthinput campo campotexto" id="IDINT" name="IDINT" onchange=""
                                                                                                        <axis:atr f="axisint001" c="IDINT" a="modificable=true&formato=entero"/> style="width:93%;" size="15"
                                                                                                        value="${__formdata.IDINT}"
                                                                                                        title="<axis:alt f="axisint001" c="AXISINT001_MSG014" lit="9901203" />"/>
                                                                                                    </td>
                                                                                                </axis:ocultar> 
                                                                                                <axis:ocultar f="axisint001" c="IDEXT" dejarHueco="false">
                                                                                                    <td id="td_IDEXT" class="campocaja">
                                                                                                        <input type="text" class="campowidthinput campo campotexto" id="IDEXT" name="IDEXT" onchange=""
                                                                                                        <axis:atr f="axisint001" c="IDEXT" a="modificable=true&formato=entero"/> style="width:93%;" size="15"
                                                                                                        value="${__formdata.IDEXT}"
                                                                                                        title="<axis:alt f="axisint001" c="AXISINT001_MSG015" lit="9901202" />"/>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                <axis:ocultar f="axisint001" c="CREVISADO" dejarHueco="false">
                                                                                                    <td id="td_CREVISADO" class="campocaja" >
                                                                                                        &nbsp;&nbsp;<b><axis:alt f="axisint001" c="AXISINT001_MSG016" lit="9001629" /></b>&nbsp;&nbsp;
                                                                                                        <input type="checkbox" style="vertical-align:middle;" onclick="f_onclickCheckbox(this)" id="CREVISADO" name="CREVISADO" 
                                                                                                        <axis:atr f="axisint001" c="CREVISADO" a="modificable=true&isInputText=false"/>
                                                                                                        value="${__formdata.CREVISADO}"
                                                                                                        <c:if test="${__configform.axisctr093__CREVISADO__modificable == 'false'}">disabled</c:if>
                                                                                                        <c:if test="${__formdata.CREVISADO == '1'}">checked="true"</c:if> 
                                                                                                        <c:if test="${empty __formdata.CREVISADO && __configform.axisint001__CREVISADO__valordefecto == 1}">checked="true"</c:if> 
                                                                                                        title="<axis:alt f="axisint001" c="AXISINT001_MSG016" lit="9001629" />"/>
                                                                                                    </td>
                                                                                                </axis:ocultar>
                                                                                                
                                                                                                 <!--<axis:ocultar f="axisint001" c="CVALIDA" dejarHueco="false">-->
                                                                                                    <td id="td_CVALIDA" class="campocaja" >
                                                                                                        &nbsp;&nbsp;<b><axis:alt f="axisint001" c="AXISINT001_MSG016" lit="9901620" /></b>&nbsp;&nbsp;
                                                                                                        <input type="checkbox" style="vertical-align:middle;" onclick="" id="CVALIDA" name="CVALIDA" 
                                                                                                          
                                                                                                        <c:if test="${__formdata.CVALIDA == '1'}">checked="true"</c:if>  
                                                                                                        <axis:atr f="axisint001" c="CVALIDA" a="modificable=true&isInputText=false"/>
                                                                                                        
                                                                                                    </td>
                                                                                                   
                                                                                                    
                                                                                                <!--</axis:ocultar> -->
                                                                                                
                                                                                                <axis:visible f="axisint001" c="BT_BUSCAR">
                                                                                                <td>
                                                                                                    <input type="button" onclick="f_but_buscar()" class="boton" style="margin-right:20px;" value="<axis:alt f="axisint001" c="AXISINT001_MSG016" lit="100797" />"/> 
                                                                                                </td>
                                                                                                </axis:visible>
                                                                                            </tr>
                                                                                        
                                                                                        
                                                                                        
                                                                                            <tr>
                                                                                                <td colspan="4">
                                                                                                   
                                                                                                                    
                                                                                                                    <!-- *************************** SECCION MÁS DATOS BUG 38922/220759 ********************************* -->
                                                                                                                    <div id="COLUMNAS_ERROR" class="seccion_informacion" style="position:fixed;top:50%; left:50%; width:700px; height:140px; margin-top:-200px; margin-left:-300px;z-index: 1;" >
                                                                                                                       <table class="area" align="center">
                                                                                                                         <tr>
                                                                                                                           <th style="width:50%;height:0px"></th>
                                                                                                                           <th style="width:50%;height:0px"></th>
                                                                                                                         </tr>
                                                                                                                         <tr>
                                                                                                                           <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                                                                             <b>${title8}</b>
                                                                                                                           </td>
                                                                                                                         </tr>
                                                                                                                         <tr>
                                                                                                                           <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="2">
                                                                                                                           <textarea name="TCOLUMNAS" id="TCOLUMNAS" rows="8" cols="50" class="campo campotexto" readonly>${__formdata.TCOLUMNAS}</textarea>
                                                                                                                           </td>
                                                                                                                         </tr>
                                                                                                                       </table>
                                                                                                                    </div>    
                                                                                                                    <!-- *************************** SECCION MÁS DATOS BUG 38922/220759 ********************************* -->
                                                                                                                    
                                                                                                                    <div class="separador">&nbsp;</div>
                                                                                                                    <div id="divCargas">
                                                                                                                    <c:set var="title1"><axis:alt c="LIT_DSP_TIT08" f="axisint001" lit="1000576"/></c:set>
                                                                                                                    <c:set var="title2"><axis:alt c="LIT_DSP_TIT09" f="axisint001" lit="100565"/></c:set>
                                                                                                                    <c:set var="title3"><axis:alt c="LIT_DSP_TIT010" f="axisint001" lit="9901203"/></c:set>
                                                                                                                    <c:set var="title4"><axis:alt c="LIT_DSP_TIT011" f="axisint001" lit="9901202"/></c:set>
                                                                                                                    <c:set var="title5"><axis:alt c="LIT_DSP_TIT012" f="axisint001" lit="101510"/></c:set>
                                                                                                                    <c:set var="title6"><axis:alt c="LIT_DSP_TIT013" f="axisint001" lit="105400"/></c:set>
                                                                                                                    <c:set var="title7"><axis:alt c="LIT_DSP_TIT013" f="axisint001" lit="1000277"/></c:set>
                                                                                                                    <c:set var="title8"><axis:alt c="LIT_DSP_TIT014" f="axisint001" lit="9901265"/></c:set>
                                                                                                                    
                                                                                                                    <div class="seccion displayspaceGrande" id="CTRLLIN">
                                                                                                                    <display:table name="${__formdata.ctrlLinea}" id="ctrlLinea" export="false" class="dsptgtable"  pagesize="${__formdata.MAXREGPAG}" defaultsort="1"  sort="list" cellpadding="0" cellspacing="0"
                                                                                                                        requestURI="axis_axisint001.do?paginar=true">
                                                                                                                    
                                                                                                                        <%@ include file="../include/displaytag.jsp"%>
                                                                                                                        
                                                                                                                        <display:column headerClass="sortable fixed" style="width:5%"  title="" media="html" autolink="false">
                                                                                                                            <div class="dspIcons">
                                                                                                                            <input <c:if test="${__formdata.SPROCES == ctrlLinea.SPROCES && __formdata.NLINEAINDX == ctrlLinea.NLINEA }" >checked</c:if>
                                                                                                                            onclick="f_selecciona_carga_linea_errores('${ctrlLinea.SPROCES}', '${ctrlLinea.NLINEA}');"
                                                                                                                            value="${ctrlLinea.SPROCES}"
                                                                                                                            type="radio" id="radioctrlLinea"
                                                                                                                            name="radioctrlLinea"/>
                                                                                                                            </div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <display:column title="${title2}" sortable="false" style="width:15%" sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspText">${ctrlLinea['TTIPO']}</div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <display:column title="${title3}" sortable="false" style="width:15%"  sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspText">${ctrlLinea['IDINT']}</div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <display:column title="${title4}" sortable="false" style="width:15%"  sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspText">${ctrlLinea['IDEXT']}</div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <display:column title="${title5}" sortable="false" style="width:15%"  sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspText" id="DIV_TESTADO_${ctrlLinea['NLINEA']}" ><c:if test="${ctrlLinea['CESTADO'] == 1}"><font color="red">${ctrlLinea['TESTADO']} </font> </c:if> 
                                                                                                                            <c:if test="${ctrlLinea['CESTADO'] != 1}">${ctrlLinea['TESTADO']}</c:if>
                                                                                                                            </div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <display:column title="${title6}" sortable="false" style="width:5%"  sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspIcons">
                                                                                                                            <input type="hidden" id="CVALIDADO_${ctrlLinea['SPROCES']}" name="CVALIDADO_${ctrlLinea['SPROCES']}"
                                                                                                                            value="${ctrlLinea['CVALIDADO']}">
                                                                                                                            
                                                                                                                            <c:if test="${ctrlLinea['CVALIDADO'] == 1}">
                                                                                                                            <img border="0" src="images/formulap.gif"/>
                                                                                                                            </c:if>
                                                                                                                            </div>
                                                                                                                        </display:column>
                                                                                                                        
                                                                                                                        <axis:visible f="axisint001" c="CEDITAR">
                                                                                                                        <display:column title="" sortable="false" style="width:5%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspIcons">
                                                                                                                            
                                                                                                                            <c:choose>
                                                                                                                                <c:when test="${ctrlLinea['CESTADO'] == 1}">
                                                                                                                                    <c:if test="${ctrlLinea['IDINT'] != '-'}">
                                                                                                                                        <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                                                                                                                                            style="cursor:pointer;"  onclick="javascript:f_actualizatablaerr('LINEA_A${ctrlLinea['NLINEA']}','CTRLLIN','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}')" />
                                                                                                                                        <img id="find" border="0" src="images/lapiz.gif" onclick="f_open_axisint003('${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>
                                                                                                                                    </c:if>
                                                                                                                                </c:when>    
                                                                                                                                <c:otherwise>
                                                                                                                                    <c:if test="${ctrlLinea['IDINT'] != '-'}">
                                                                                                                                        <img border="0" alt="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" /><axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="9903644" />" title1="<axis:alt f="axisint001" c="AXISINT001_DESCCAMPOS" lit="1000113" />" src="images/informacion.gif" width="11px" height="11px"
                                                                                                                                            style="cursor:pointer;"  onclick="javascript:f_actualizatablaerr('LINEA_A${ctrlLinea['NLINEA']}','CTRLLIN','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}')" />
                                                                                                                                    </c:if>
                                                                                                                                </c:otherwise>
                                                                                                                            </c:choose>
                                                                                                                            
                                                                                                                            </div>
                                                                                                                        </display:column>
                                                                                                                        </axis:visible>
                                                                                                                        
                                                                                                                        <display:column title="" sortable="false" style="width:5%" sortProperty="TERROR" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                            <div class="dspIcons">
                                                                                                                            <c:choose>
                                                                                                                            <c:when test="${!empty ctrlLinea['NSINIES'] && ctrlLinea['CVALIDADO'] == 1}">
                                                                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                                                                            alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_siniestro('${ ctrlLinea['NSINIES']}','${ ctrlLinea['NTRAMIT']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                                                                            </c:when>
                                                                                                                            <c:when test="${!empty ctrlLinea['NRECIBO'] && ctrlLinea['CVALIDADO'] == 1}">
                                                                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                                                                            alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_recibo('${ ctrlLinea['NRECIBO']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                                                                            </c:when>
                                                                                                                            <c:when test="${!empty ctrlLinea['SPERSON'] && ctrlLinea['CVALIDADO'] == 1}">
                                                                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                                                                            alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_persona('${ ctrlLinea['SPERSON']}','${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                                                                            </c:when>
                                                                                                                            <c:otherwise>
                                                                                                                            <c:if test="${!empty ctrlLinea['SSEGURO'] && ctrlLinea['CVALIDADO'] == 1}">
                                                                                                                            <img id="find" border="0" src="images/find.gif" 
                                                                                                                            alt="<axis:alt f="axisint001" c="AXISINT001_MSG017" lit="100797" />" onclick="f_seleccionar_poliza('${ ctrlLinea['SSEGURO']}','${ ctrlLinea['SPROCES']}','${ ctrlLinea['NLINEA']}');" style="cursor:pointer"/>                
                                                                                                                            </c:if>
                                                                                                                            </c:otherwise>
                                                                                                                            </c:choose>
                                                                                                                            </div>
                                                                                                                        </display:column>
                                                                                                                    
                                                                                                                    </display:table>
                                                                                                                    </div>
                                                                                                                    </div>
                                                                                                                    <div class="separador">&nbsp;</div>
                                                                                                                    <div class="separador">&nbsp;</div>
                                                                                                                   <!-- ********* -->
                                                                                                    
                                                                                                </td>
                                                                                            </tr>
                                                                                            
                                                                                            <!-- ****************************** tercera seccion *************************** -->
                                                                                            
                                                                                             <tr>
                                                                                                        <td colspan="4">
                                                                                                             
                                                                                                           <table class="area" align="center">
                                                                                                                <tr>
                                                                                                                <td>
                                                                                                                    <table class="area" align="center">
                                                                                                                                                                                  
                                                                                                                        <tr>
                                                                                                                            <td>
                                                                                                                             <div class="titulo"><img src="images/flecha.gif"/>
                                                                                                                                <b><axis:alt c="LIT_TITULO3" f="axisint001" lit="102239"/></b>
                                                                                                                             </div>
                                                                                                                               <table class="seccion">
                                                                                                                            <tr>
                                                                                                                            <td>
                                                                                                                            <c:set var="title1"><axis:alt c="LIT_DSP_TIT01" f="axisint001" lit="1000576"/></c:set>
                                                                                                                            <c:set var="title2"><axis:alt c="LIT_DSP_TIT02" f="axisint001" lit="100565"/></c:set>
                                                                                                                            <c:set var="title3"><axis:alt c="LIT_DSP_TIT03" f="axisint001" lit="101510"/></c:set>
                                                                                                                            <c:set var="title4"><axis:alt c="LIT_DSP_TIT04" f="axisint001" lit="1000277"/></c:set>
                                                                                                                            <div class="separador">&nbsp;</div>
                                                                                                                            <div class="displayspace">
                                                                                                                              <display:table name="${__formdata.ctrlLineaError}" id="ctrlLineaError" export="false" class="dsptgtable" style="width:100%" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                                                                                                               requestURI="axis_axisint001.do?operation=general&paginar=true&SPROCES=${__formdata.SPROCES}">
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
                                                                                                                                <display:column title="${title2}" sortable="false" style="width:25%"  sortProperty="TFICHERO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                                    <div class="dspText">${ctrlLineaError['TTIPO']}</div>
                                                                                                                                </display:column>
                                                                                                                                <display:column title="${title3}" sortable="false" style="width:25%" sortProperty="TESTADO" headerClass="sortable fixed" media="html" autolink="false" >
                                                                                                                                    <div class="dspText">${ctrlLineaError['TERROR']}</div>
                                                                                                                                </display:column>
                                                                                                                                <display:column title="${title4}" sortable="false" style="width:50%" sortProperty="CERROR_LIT" headerClass="sortable fixed" media="html" autolink="false" >
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
                                                                                            
                                                                                            
                                                                                            
                                                                                            <!-- ****************************** fin tercera secc. ************************* -->
                                                                                             <!-- ****************************** Seccion de impresion. ************************* -->
                                                                                             <axis:visible c="SECCIONIMPRIMIR" f="axisint001">
                                                                                            <tr id="SECCIONIMPRIMIR">
                                                                                                <td colspan="4">
                                                                                                    <div class="separador">&nbsp;</div>
                                                                                                    <div class="titulo"><img src="images/flecha.gif"/>
                                                                                                                                <b><axis:alt c="LIT_TITULO3" f="axisint001" lit="9000702"/></b>
                                                                                                  
                                                                                                    </div>
                                                                                                    <!-- Seccion de impresion -->
                                                                                                  
                                                                                                    <table class="seccion" align="center">
                                                                                                        <tr>
                                                                                                            <td >
                                                                                                                <!-- Área 1 -->
                                                                                                                
                                                                                                                <table class="area" align="center">
                                                                                                                    <tr>
                                                                                                                        <th style="width:42%;height:0px"></th>
                                                                                                                        <th style="width:16%;height:0px"></th>
                                                                                                                        <th style="width:42%;height:0px"></th>
                                                                                
                                                                                                                    </tr>
                                                                                                                 
                                                                                                                      <!-- Seccion de impresion-->
                                                                                                             
                                                                                                                  
                                                                                                                               <!-- <tr id="listaImpresion">
                                                                                                                                    <td colspan="4">
                                                                                                                                        <div class="separador">&nbsp;</div>     
                                                                                                                                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="LIT_TITULO3" f="axisint001" lit="112247"/></div>
                                                                                                                                        
                                                                                                                                        <c:set var="title0"><axis:alt c="LIT_TITULO3" f="axisint001" lit="107913"/></c:set>  
                                                                                                                                        <div class="displayspaceMaximo">
                                                                                                                                            <display:table name="${sessionScope.reportsList}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                                                                                                                 requestURI="axis_axisint001.do?paginar=true">
                                                                                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                                                                                <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                                                                                                                    <div class="dspText">
                                                                                                                                                        <a href="javascript:void(0)" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+FILE)">  <%-- +"&mimetype=csv" --%>
                                                                                                                                                            ${reportsList.codigoPROVIS}
                                                                                                                                                        </a>
                                                                                                                                                    </div>
                                                                                                                                                </display:column>  >                                                             
                                                                                                                                            </display:table>    
                                                                                                                                         </div>                                                         
                                                                                                                                         <div class="separador">&nbsp; </div>
                                                                                                                                    </td>
                                                                                                                                </tr>-->
                                                                                                                      
                                                                                                                             <tr id="listaImpresion">
                                                                                                                                 <td colspan="4">
         
                                                                                                                                    <table class="area" align="center">
                                                                                                                                        <tr>
                                                                                                                                            <th style="width:20%;height:0px"></th>
                                                                                                                                            <th style="width:20%;height:0px"></th>
                                                                                                                                            <th style="width:20%;height:0px"></th>
                                                                                                                                            <th style="width:20%;height:0px"></th>
                                                                                                                                            <th style="width:20%;height:0px"></th>
                                                                                                                                            
                                                                                                                                        </tr>    
                                                                                                                                        <tr>
                                                                                                                                            <td colspan="7">
                                                                                                                                                <div class="separador">&nbsp;</div>
                                                                                                                                                <div class="titulo">
                                                                                                                                                    <img src="images/flecha.gif"/><b><axis:alt f="axisint001" c="TIT_FITX" lit="112247"/> </b>
                                                                                                                                                </div>
                                                                                                                                                <div class="separador">&nbsp;</div>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td class="campocaja" id="fichero" colspan="3">
                                                                                                                                            <%int cont = 0;%>
                                                                                                                                             <c:set var="title0"><axis:alt f="axisint001" c="FICHERO" lit="107913"/>  </c:set>
                                                                                                                                              <div class="seccion displayspace">
                                                                                                                                                  <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                                                                                                 requestURI="axis_axisint001.do?paginar=true" style="width:99.9%">
                                                                                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                                                                                <c:set var="i"><%=cont%></c:set>
                                                                                                                                                <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                                                                                                                                   <a href="javascript:void(0)" onclick="javascript:f_imprimir_fitxer('${i}')"> ${OBFICHERO.OB_IAX_IMPRESION.FICHERO} </a>
                                                                                                                                                   <input type="hidden" 
                                                                                                                                                       style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                                                                                                                       class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                                                                                                                                       value="${OBFICHERO.OB_IAX_IMPRESION.FICHERO}"/>                                     
                                                                                                                                                </display:column>   
                                                                                                                                                <% cont ++ ;%>
                                                                                                                                                </display:table>
                                                                                                                                                </div>
                                                                                                                            
                                                                                                                                              </td> 
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                  </td>
                                                                                                                                  </tr>
                                                                                                                                
                                                                                                                        <tr>
                                                                                                                        <td colspan="4" align="right" >
                                                                                                                         <input type="button" class="boton" id="but_imprimir" onclick="f_but_imprimir()" value="<axis:alt c="LIT_TITULO3" f="axisint001" lit="100001" />"/>
                                                                                                                        </td>
                                                                                                                        </tr>
                                                                                                                     
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                    
                                                                                                  <%--</c:if>--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                             </axis:visible  >   
                                                                                        </table> 
                                                                                         
                                                                                         <!-- Seccion de impresion -->
                                                                                           
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
    </form>
   

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisint001</c:param>
   <c:param name="__botones">salir<axis:visible f="axisint001" c="BT_REPROCESAR">,9901221</axis:visible></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>

