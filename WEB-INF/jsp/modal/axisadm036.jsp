<%/**
*  Fichero: axisadm035.jsp
*  Pantalla de generaciones de domiciliaciones de recibos.
*
*  Fecha: 26/02/2009
*/
%>


<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		// bug 0037233 2010901 MMS        	
			var aviso = "${AVISOS}"; 

     		if (!objUtiles.estaVacio(aviso) && aviso == '0' ) {
				var CEMPRESA=objDom.getValorPorId("CEMPRES");
				parent.f_aceptar_axisadm036(CEMPRESA, document.miForm.CRAMO.value,null,document.miForm.FEFECTO.value,
                        document.miForm.FFECCOB.value,document.miForm.SPROCES.value,
                        document.miForm.CAD_SPRODUC.value,
                        document.miForm.CCOBBAN.value,document.miForm.CBANCO.value, 
                        document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                        document.miForm.CREFERENCIA.value,document.miForm.DFEFECTO.value,document.miForm.CAGENTE.value,
                        document.miForm.TAGENTE.value,document.miForm.NNUMIDE.value,document.miForm.TTOMADOR.value,
                        document.miForm.NRECIBO.value,
                        document.miForm.FINIREM.value,document.miForm.FFINREM.value);
			}
            revisarEstilos();  
            f_cargar_propiedades_pantalla();
        }
       
        function f_but_buscar (cual) {
            var CEMPRES = "";
            if (!objUtiles.estaVacio(cual)) 
                // Seleccionada por el hipervínculo
                CEMPRES = cual;
            else if (!objUtiles.estaVacio(document.miForm.CEMPRES)) {
                // Checkeada por el radio button
                CEMPRES = document.miForm.CEMPRES.value;
            } 
            
             if (objValidador.validaEntrada()){
              obtener_marcados();
              //alert("antes:"+document.miForm.CAD_SPRODUC.value);
              //parent.f_aceptar_axisadm036(CEMPRES,null,null,null,null,null,document.miForm.CAD_SPRODUC.value);
              //parent.f_aceptar_axisadm036(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.FEFECTO.value,document.miForm.FFECCOB.value,document.miForm.SPROCES.value,null);
              
              parent.f_aceptar_axisadm036(CEMPRES, document.miForm.CRAMO.value,null,document.miForm.FEFECTO.value,
                                          document.miForm.FFECCOB.value,document.miForm.SPROCES.value,document.miForm.CAD_SPRODUC.value,
                                          document.miForm.CCOBBAN.value,document.miForm.CBANCO.value, 
                                          document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                                          document.miForm.CREFERENCIA.value, document.miForm.DFEFECTO.value,
                                          document.miForm.CAGENTE.value,document.miForm.TAGENTE.value,document.miForm.NNUMIDE.value,
                                          document.miForm.TTOMADOR.value,document.miForm.NRECIBO.value,
                                          document.miForm.FINIREM.value,document.miForm.FFINREM.value);
                    
             }
         
         }
        
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm036();
        }
        
        
        /*****************************************************************************************/
        /************************************ axisadm036 *****************************************/
        /****************************************************************************************/
        
       
      function f_but_buscar() {

                   
                        
                    var CEMPRESA=objDom.getValorPorId("CEMPRES");
                    
                    <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                    
                        CEMPRESA = document.miForm.CEMPRES[0].value;
                    
                    </c:if> 
                    
                    if((CEMPRESA > 0 && document.miForm.FEFECTO.value!='') || document.miForm.SPROCES.value!=''){
                        //alert("Antes de la consulta");
    
                        //alert(document.miForm.CEMPRES.value);
                        //alert(objDom.getValorPorId("CEMPRES"));
                        obtener_marcados();
                        //parent.f_aceptar_axisadm036(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.FEFECTO.value,document.miForm.FFECCOB.value,document.miForm.SPROCES.value, document.miForm.CAD_SPRODUC.value);
                        
                        if (document.miForm.SPROCES.value!='' || objValidador.validaEntrada()) {
						    
				 if (document.miForm.SPROCES.value=='' || document.miForm.SPROCES.value==null) 
                                var FEFECTO = document.miForm.FEFECTO.value;           						
		                         else
		                            var FEFECTO = '';  
						    
                            parent.f_aceptar_axisadm036(CEMPRESA, document.miForm.CRAMO.value,null,FEFECTO,
                                                          document.miForm.FFECCOB.value,document.miForm.SPROCES.value,document.miForm.CAD_SPRODUC.value,
                                                          document.miForm.CCOBBAN.value,document.miForm.CBANCO.value, 
                                                          document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                                                          document.miForm.CREFERENCIA.value,document.miForm.DFEFECTO.value,
                                                          document.miForm.CAGENTE.value,document.miForm.TAGENTE.value,document.miForm.NNUMIDE.value,
                                                          document.miForm.TTOMADOR.value,document.miForm.NRECIBO.value,
                                                          null,null);

                        }
		    
                    }else{
                        alert('<axis:alt f="axisadm036" c="MENSAJE" lit="9000505"/>');
                    }
            }
            
            // Sería equivalente a la búsqueda original, corresponde a la primera seccion: búscar recibos a domiciliar
            function f_but_9903614() {  
            
            
            
            /*document.miForm.FINIREM.value='';
            document.miForm.FFINREM.value='';
            document.miForm.SPROCES.value='';*/
                   //if (objValidador.validaEntrada()){
                   //alert(document.miForm.CEMPRES.value);
                   // alert(document.miForm.FEFECTO.value);
                   // alert(document.miForm.SPROCES.value);
                   
                              
                    var CEMPRESA=objDom.getValorPorId("CEMPRES");
                    
                    <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                    
                        CEMPRESA = document.miForm.CEMPRES[0].value;
                    
                    </c:if> 
                    
                    if((CEMPRESA > 0 && document.miForm.FEFECTO.value!='') || document.miForm.SPROCES.value!=''){
                        //alert("Antes de la consulta");
    
                        //alert(document.miForm.CEMPRES.value);
                        //alert(objDom.getValorPorId("CEMPRES"));
                        obtener_marcados();
                        //parent.f_aceptar_axisadm036(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.FEFECTO.value,document.miForm.FFECCOB.value,document.miForm.SPROCES.value, document.miForm.CAD_SPRODUC.value);
                        
                        if (document.miForm.SPROCES.value!='' || objValidador.validaEntrada()) { 
                        // bug 0037233 2010901 MMS
							objUtiles.ejecutarFormulario ("modal_axisadm036.do", "validar_avisos", document.miForm, "_self", objJsMessages.jslit_cargando);
                        }
		    
                    }else{
                        alert('<axis:alt f="axisadm036" c="MENSAJE" lit="9000505"/>');
                    }
            }
            
   
            // Sería equivalente a la búsqueda nueva, corresponde a búsqueda de remesa
            function f_but_9903615() {   
                                   
                    var CEMPRESA=objDom.getValorPorId("CEMPRES");
                    <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                       CEMPRESA = document.miForm.CEMPRES[0].value;
                    </c:if>                     
                              
                    var qs="operation=ajax_busqueda_remesas";
                    qs=qs+"&SPROCES="+document.miForm.SPROCES.value;
                    qs=qs+"&FINIREM="+document.miForm.FINIREM.value;
                    qs=qs+"&FFINREM="+document.miForm.FFINREM.value;
                    qs=qs+"&CEMPRESA="+CEMPRESA;                   
                    qs=qs+"&CCOBBAN_REM="+document.miForm.CCOBBAN_REM.value;                    
              
                objAjax.invokeAsyncCGI("modal_axisadm036.do", callbackajaxRemesas, qs, this);
 
            }
            

            function f_but_9001038() {
                // Domiciliar
                
                if (objValidador.validaEntrada())
                    // objUtiles.ejecutarFormulario ("modal_axisadm036.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    objAjax.invokeAsyncCGI("modal_axisadm036.do?SPROCES=" + objDom.getValorPorId("SPROCES") + "&CEMPRES=" + objDom.getValorPorId("CEMPRES") +
                    "&CRAMO=" + objDom.getValorPorId("CRAMO") + "&SPRODUC=" + objDom.getValorPorId("SPRODUC") + "&FEFECTO=" + objDom.getValorPorId("FEFECTO") + 
                    "&FFECCOB=" + objDom.getValorPorId("FFECCOB"), callbackAjaxDomiciliar, "operation=domiciliar",  this, objJsMessages.jslit_cargando);
            }
            
            
            function f_buscar_rem(SPROCES,CCOBBAN,CESTADO,CEMPRES){
            
            
              
              parent.f_aceptar_axisadm036(CEMPRES, document.miForm.CRAMO.value,"","",
                                          document.miForm.FFECCOB.value,SPROCES,document.miForm.CAD_SPRODUC.value,
                                          CCOBBAN,document.miForm.CBANCO.value, 
                                          document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                                          document.miForm.CREFERENCIA.value, document.miForm.DFEFECTO.value,document.miForm.CAGENTE.value,
                                          document.miForm.TAGENTE.value,document.miForm.NNUMIDE.value,document.miForm.TTOMADOR.value,document.miForm.NRECIBO.value);
                    
                   
            
            
            
            }
            
       
            
            function f_recarga_combos(comboOrigen) {
            //alert("En recarga combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");
                
                objAjax.invokeAsyncCGI("modal_axisadm036.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
            }            
            
            function f_limpiar_campos(isSPROCES) {
                var SPROCES = objDom.getValorPorId("SPROCES");
              
                if (!objUtiles.estaVacio(SPROCES) && isSPROCES) {                   
                    
                    var CEMPRESA=objDom.getValorPorId("CEMPRES");
                    <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                       CEMPRESA = document.miForm.CEMPRES[0].value;
                    </c:if> 
                    
                    f_recarga_combos('E');
                    //objDom.setValorPorId("FEFECTO", "<fmt:formatDate value='${today}' pattern='dd/MM/yyyy'/>");
                    objDom.setValorPorId("FFECCOB", "");
                } else {                  
                    objDom.setValorPorId("SPROCES", "");
                }
                
                // Ocultar botón domiciliar y displaytag domiciliaciones
                var but_domiciliar = document.getElementById("but_9001038");
                if (!objUtiles.estaVacio(but_domiciliar))
                    but_domiciliar.style.display    = "none";

                var dt_domiciliaciones = document.getElementById("dt_domiciliaciones");
                if (!objUtiles.estaVacio(dt_domiciliaciones))
                    dt_domiciliaciones.style.display       = "none";
            }
            
            
            
             function f_limpiar_campos_remesas(isSPROCES) {
                var SPROCES = objDom.getValorPorId("SPROCES");
        
                if (!objUtiles.estaVacio(SPROCES) && isSPROCES) {      
                    objDom.setValorPorId("FINIREM", "");
                    objDom.setValorPorId("FFINREM", "");
                } else {                 
                    objDom.setValorPorId("SPROCES", "");
                }
            }

         <%-- Inici BFP 07/02/2012 BUG 21229 --%>    
        function f_validaAllDates(){
            var data1 = document.getElementById('FEFECTO');
            
            if(data1.value.length > 0){
                f_formatdate(data1,'');
            }
        }
        <%-- Fi BFP 07/02/2012 BUG 21229 --%>

        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            <%--if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisadm036" c="MENSAJE2" lit="1000421"/>");
                }
            }--%>
            if (!objUtiles.estaVacio(entrada.value)) 
            {
                if((entrada.value.length == 8) || (entrada.value.length == 10)){
                    entrada.value = jDate.formateaFecha(entrada.value)
                    if(jDate.validarFecha2(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisadm067" c="MENSAJE2" lit="1000421"/>");
                        entrada.value = "";
                    }
                }else{
                    alert("<axis:alt f="axisadm067" c="MENSAJE2" lit="1000421"/>");
                    entrada.value = "";
                }
                
            }
        }            
                 
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/    
            
            function callbackAjaxDomiciliar(ajaxResponse) {                
                var doc = objAjax.domParse(ajaxResponse);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        /*
                        if (objUtiles.existeObjetoXml(doc.getElementsByTagName("FICHERO")[0])) {                                     
                            nuevaVentana = window.open("modal_axisctr053.do?operation=mostrar_fichero");    
                            // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                            if (document.all) {
                                idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                                contadorVentanas++;
                            }            
                        } 
                        */
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function callbackAjaxCancelar() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr036", "cancelar", document.miForm, "_self");
            }
          
            function callbackAjaxActualizarCombos(ajaxResponseText, comboOrigen) {
                var doc = objAjax.domParse(ajaxResponseText);
                var comboSPROD = document.getElementById("LISTAPR");
                //alert("***"+ajaxResponseText);
                //alert(comboOrigen);
                try {            
                    if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                        switch (comboOrigen) {
                            case 'E':   rellenarCombo(doc, "CRAMO");   // falls-through
                            case 'R':   if(comboSPROD!=null){
                                          //alert("voy a cambiar tabla");
                                          rellenarTabla(ajaxResponseText, "SPRODUC");  //Actualizaremos la tabla con nuevos registros
                                        }else{
                                          //alert("voy a cambiar combo");
                                          rellenarCombo(doc, "SPRODUC"); 
                                        }
                        }
                    }            
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
            }
            
            function rellenarCombo(doc, comboName) {
                var combo = document.getElementById(comboName);
                objDom.borrarOpcionesDeCombo(combo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", combo, null);
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    
                    if (numElementos == 1)
                        objDom.borrarOpcionesDeCombo(combo);
                    
                    for (i = 0; i < numElementos; i++) {
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        objDom.addOpcionACombo(CATRIBU, TATRIBU, combo, null);
                    }
                    
                    if (numElementos == 1) {
                        // Seleccionar la única opción del combo y ejecutar
                        // su llamada onchange para recuperar combos dependientes
                        combo[0].selected = "1";
                        combo.onchange(); 
                    }
                }
            }
            
            
            function rellenarTabla(ajaxResponseText, comboName) {
                //alert("entrando:" + ajaxResponseText);
                comboName="SPRODUC";
                var doc=objAjax.domParse(ajaxResponseText);
                
                // ************************************
                // Recoger valores de la estructura XML
                // ************************************
                
                var tbodyadded = objLista.obtenerBodyLista("miListaIdProductes");
                var tradded = objLista.obtenerFilasBodyLista("miListaIdProductes", tbodyadded);
                objLista.borrarFilasDeLista ("miListaIdProductes", "3", "<axis:alt f='axisadm036' c='miListaIdProductes' lit='1000254' />");
                    
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    //alert("Num Elementos:" + numElementos);
                    if (numElementos == 0){
                        //alert("borrando registros");
                        //objLista.borrarFilaVacia(tbodyadded, tradded);
                        objLista.borrarFilasDeLista ("miListaIdProductes", "2", "<axis:alt f='axisadm036' c='miListaIdProductes' lit='1000254' />");
                    }
                    
               
                    
                    for (i = 0; i < numElementos; i++) {
                        //alert("0");
                        var CATRIBUyTATRIBU = recuperaCATRIBUyTATRIBU(elementos[i]);
                        //alert("1");
                        var CATRIBU = CATRIBUyTATRIBU[0];
                        var TATRIBU = CATRIBUyTATRIBU[1];
                        
                        //alert(CATRIBU);
                        //alert(TATRIBU);
                        // ******************************************
                        // rellenar lineas
                        // ******************************************
                        
                        
                        
                        
                        objLista.borrarFilaVacia(tbodyadded, tradded);
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tradded, "gridEven", "gridNotEven");
                        //Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        //Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(3);
                        //Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                        newtd[0] = objLista.addCheckBoxEnLista("checkProducto", CATRIBU );
                                            
                        //var titulo=objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);
                                                
                        //newtd[1] = objLista.addTextoEnLista(CATRIBU);
                                      
                        newtd[1] = objLista.addTextoEnLista(TATRIBU);
                        //alert("antes de añadir fila");
                        //Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        
                        //////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////
                                                         
                                    newdiv= document.createElement("div");
                                    var newinputch;
                                    
                                    var idCheck = "SPRODUC_"+i;
                                    
                                    if (document.all) {
                                        //Para ie que no deja generar el name via runtime
                                        newinputch = document.createElement('<input name="'+idCheck+'" />');
                                        
                                    } else {
                                        newinputch = document.createElement("input");
                                        newinputch.setAttribute('name', idCheck);
                                       
                                    }
                                    
                                    newinputch.type = "hidden";
                                    newinputch.value = CATRIBU;
                                    newinputch.id = idCheck;
                                                                        
                                    newdiv.appendChild(newinputch);
                                    newtd[1].appendChild(newdiv);
                        //////////////////////////////////////////////////////////////////////
                        //////////////////////////////////////////////////////////////////////
                        //alert("antes de añadir fila 2 eooooo");
                        objLista.addNuevaFila(newtd, newtr, tbodyadded);
                    
                        //alert("Añadido hidden");
     
                        // *********************************************
                        // *********************************************
                        // *********************************************
                        

                    }

                }

                // ************************************
                // ************************************
                // ************************************

                
            }

            function recuperaCATRIBUyTATRIBU(elemento) {
                var CATRIBU;
                var TATRIBU;
                
                if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("SPRODUC")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("SPRODUC"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                            
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CRAMO")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CRAMO"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TRAMO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TRAMO"), 0, 0);                            
                // The rest of the method, is unreachable code here, in AXISADM036. We've kept it for future extensions.
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CATRIBU")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CATRIBU"), 0, 0);
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TATRIBU")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TATRIBU"), 0, 0);
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CACTIVI")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CACTIVI"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TTITULO")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TTITULO"), 0, 0);                        
                } else if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("CGARANT")[0])) {
                    CATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("CGARANT"), 0, 0);                            
                    if (objUtiles.existeObjetoXml(elemento.getElementsByTagName("TGARANT")[0]))
                        TATRIBU = objDom.getValorNodoDelComponente(elemento.getElementsByTagName("TGARANT"), 0, 0);                        
                }
                
                var retVal = new Array(2);
                retVal[0] = CATRIBU;
                retVal[1] = TATRIBU;
                
                return retVal;
            }
            
            /* ******************************************************************** */
            /* ***************************** FUNCIONES **************************** */
            /* ******************************************************************** */
            
            function ChequearTodosBut() { 

            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
            var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
                    } 
               
            } 
            
           
        } 

        function DesChequearTodosBut() { 
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                          elemento.checked =false;
                      } 
            } 
        }
        
        //Antes de llamar a unificar revisamos los que están marcados y no para obtener los valores de los campos que nos interesan
        function obtener_marcados(){
            var j=0;
            var cadena_sproduc ="";
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                  var elemento = document.forms[0].elements[i]; 
                      if (elemento.type == "checkbox"){ 
                      
                         if( elemento.checked ){
                             var valor = eval("document.miForm.SPRODUC_"+j+".value");
                             cadena_sproduc = cadena_sproduc + valor + ";";
                         }
                         
                        //alert(cadena_sproduc); 
                        j =j+1;
                    } 
            }  
            
            document.miForm.CAD_SPRODUC.value = cadena_sproduc;
        }    
        
        /* ****************************************************************************************************** */
        /* ************************************** FUNCIONES   AJAX ********************************************** */
        /* ****************************************************************************************************** */
        
        function callbackajaxRemesas(ajaxResponseText){
            try{ 

                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    var tbody = objLista.obtenerBodyLista("miListaRemesas");
                    var tr = objLista.obtenerFilasBodyLista("miListaRemesas", tbody);                  
                    
                    objLista.borrarFilasDeLista ("miListaRemesas", "18", '<axis:alt f="axissin019" c="NOREG" lit="1000254"/>');
                    
                    if (objDom.existeTag(doc, "REMESADOS"))
                       objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "REMESADOS") ; i++) {

                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(18);

                        var REMESA   = i;
                        var SPROCES = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPROCES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPROCES"), i, 0) : ""; 
                        var CEMPRES = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CEMPRES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CEMPRES"), i, 0) : ""; 
 
                        var CCOBBAN = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCOBBAN")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCOBBAN"), i, 0) : ""; 
                        var ANULADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ANULADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("ANULADOS"), i, 0) : "";
                        var IANULADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IANULADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IANULADOS"), i, 0) : "";
                        var CESTADO  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CESTADO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CESTADO"), i, 0) : "";
                        var FCREACION   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FCREACION")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FCREACION"), i, 0) : "";

                        var REMESADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("REMESADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("REMESADOS"), i, 0) : "";
                        var IREMESADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IREMESADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IREMESADOS"), i, 0) : "";
                        var COBRADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("COBRADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBRADOS"), i, 0) : "";
                        var ICOBRADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICOBRADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("ICOBRADOS"), i, 0) : "";  
                            
                        var IMPAGADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IMPAGADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IMPAGADOS"), i, 0) : "";
                        var IIMPAGADOS   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("IIMPAGADOS")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("IIMPAGADOS"), i, 0) : "";  

                        var TCOBBAN = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCOBBAN")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOBBAN"), i, 0) : "";                             

                        var TCOMPANI = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCOMPANI")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOMPANI"), i, 0) : "";                             

                        var FRECAUDO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FRECAUDO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FRECAUDO"), i, 0) : ""; 


                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
 												var ttd=0;
 			            <axis:visible c="SPROCES" f="axisadm036">									
                        newtd[ttd] = objLista.addNumeroEnLista(SPROCES);ttd++;
                        </axis:visible>
                                                                    
                                                
                        <axis:visible c="CCOBBAN_MULT" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(CCOBBAN+" - "+TCOBBAN); ttd++; 
                        </axis:visible>
                                                
                        <axis:visible c="TCOMPANI" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(TCOMPANI); ttd++; 
                        </axis:visible>  
                        
                        <axis:visible c="FRECAUDO" f="axisadm036">
                        if (FRECAUDO != "") 
                             FRECAUDO = objUtiles.formateaTimeStamp2(FRECAUDO);
                             newtd[ttd] = objLista.addTextoEnLista(FRECAUDO);ttd++;
                        </axis:visible>
                        
                        <axis:visible c="FCREACION" f="axisadm036">
                        if (FCREACION != "") 
                             FCREACION = objUtiles.formateaTimeStamp2(FCREACION);
                             newtd[ttd] = objLista.addTextoEnLista(FCREACION);ttd++;
                        </axis:visible>
                        
                        <axis:visible c="REMESADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(REMESADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="IREMESADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(IREMESADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="COBRADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(COBRADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="ICOBRADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(ICOBRADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="IMPAGADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(IMPAGADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="IIMPAGADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(IIMPAGADOS); ttd++;
                        </axis:visible>
                                                 
                        <axis:visible c="ANULADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(ANULADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="IANULADOS" f="axisadm036">
                        newtd[ttd] = objLista.addNumeroEnLista(IANULADOS); ttd++;
                        </axis:visible>
                        
                        <axis:visible c="CESTADO" f="axisadm036">
                        newtd[ttd] = objLista.addTextoEnLista(CESTADO);ttd++;
                        </axis:visible>
                        
                        <axis:visible c="BT_EDIT_REME" f="axisadm036">
                        newtd[ttd] = objLista.addImagenEnLista("javascript:f_buscar_rem('"+ SPROCES +"','" + CCOBBAN +"','"+ CESTADO + "','" + CEMPRES + "');",
                                    "0", "<axis:alt f="axisadm036" c="EDITAR" lit="100002" />", "<axis:alt f="axisadm036" c="EDITAR" lit="100002"/>", "images/find.gif");ttd++;
                        </axis:visible>

                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);        
                                     
                    }
                    

                } else{
                    objLista.borrarFilasDeLista ("miListaRemesas", "18", '<axis:alt f="axissin019" c="NOREG" lit="1000254"/>');
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }

    </script>
  </head>

  <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  {f_but_9903614() }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRECIBOini" id="NRECIBOini" value="${requestScope.NRECIBO}"/>
            <input type="hidden" name="CAD_SPRODUC" id="CAD_SPRODUC" value=""/>
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm036" c="formulario" lit="1000568" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm036" c="producto" lit="1000568" /></c:param>
                <c:param name="form">axisadm036</c:param>
            </c:import>
            
            
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
 
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm036" c="titulo" lit="9903621"/></div> <%-- Datos a domiciliar --%>
                        <table class="seccion">                            
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm036" c="CEMPRES" lit="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm036" c="CRAMO" lit="100784"/></b>   <%-- Ramo --%>
                                            </td>   
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm036" c="DFEFECTO" lit="9902360"/></b>   <%-- Fecha efecto desde --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm036" c="FEFECTO" lit="9002169"/></b>   <%-- Fecha efecto --%>
                                            </td>
                                        </tr>
                                        <tr>
                                        
                                        <%-- Empresa --%>
                                          <c:choose>  
                                            <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                              <td class="campocaja">
                                                    <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                    title="<axis:alt f="axisadm036" c="CEMPRES" lit="101619"/>" onchange="f_recarga_combos('E');f_limpiar_campos();"
                                                    <axis:atr f="axisadm036" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm036" c="CEMPRES2" lit="108341"/> - </option>                                                                                                        
                                                        <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                            <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                        </c:forEach>
                                                    </select>
                                              </td>           
                                           </c:when>
                                             <c:otherwise> 
                                             <td class="campocaja">
                                             
                                             <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                             <axis:atr f="axisadm036" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                               </td>    
                                                </c:otherwise> 
                                            </c:choose> 
                                        
                                            <td class="campocaja">
                                                <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                title="<axis:alt f="axisadm036" c="CRAMO" lit="100784"/>" onchange="f_recarga_combos('R');f_limpiar_campos();"
                                                <axis:atr f="axisadm036" c="CRAMO" a="isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="CRAMO2" lit="108341"/> - </option>
                                                    <c:forEach items="${sessionScope.DOM_LSTRAMOS}" var="item">
                                                        <option value = "${item.CRAMO}" <c:if test="${__formdata.CRAMO != 'null' && __formdata.CRAMO == item.CRAMO}"> selected </c:if>>${item.TRAMO}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            
                                            <%-- Fecha efecto desde--%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                onkeyup="f_limpiar_campos()" onchange="f_limpiar_campos()"
                                                value="<fmt:formatDate value='${__formdata.DFEFECTO}' pattern='dd/MM/yyyy'/>" name="DFEFECTO" id="DFEFECTO" onblur="javascript:f_formatdate(this,'')"
                                                style="width:60%;" alt="<axis:alt f="axisadm036" c="DFEFECTO2" lit="9902360"/>" title="<axis:alt f="axisadm036" c="DFEFECTO2" lit="9902360"/>"
                                                <axis:atr f="axisadm036" c="DFEFECTO" a="formato=fecha"/> /><a id="icon_DFEFECTO" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm036" c="DFEFECTO2" lit="9902360"/>" title="<axis:alt f="axisadm036" c="DFEFECTO2" lit="9902360" />" src="images/calendar.gif"/></a>
                                            </td>
                                            <!-- #6.0037693: ERROR EN ARCHIVO DE DOMICILIACION DE BCI value="<fmt:formatDate value='${today}' pattern='dd/MM/yyyy'/>"-->
                                            <%-- Fecha efecto --%>
                                            <td class="campocaja">
                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" 
                                                onkeyup="f_limpiar_campos()" onchange="f_limpiar_campos()"
                                                value="<fmt:formatDate value='${__formdata.FEFECTO}' pattern='dd/MM/yyyy'/>"
                                                name="FEFECTO" id="FEFECTO" onblur="javascript:f_formatdate(this,'')"
                                                style="width:60%;" alt="<axis:alt f="axisadm036" c="FEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm036" c="FEFECTO2" lit="100883"/>"
                                                <axis:atr f="axisadm036" c="FEFECTO" a="formato=fecha"/> /><a id="icon_FEFECTO" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm036" c="FEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm036" c="FEFECTO2" lit="100883" />" src="images/calendar.gif"/></a>
                                            </td>
                                            
                                            
                                        </tr>
                                           
                                        <tr>
                                            <td class="titulocaja">
                                            <axis:visible c="SPROD_COMBO" f="axisadm036">
                                                <b><axis:alt f="axisadm036" c="SPROD_COMBO" lit="100829"/></b>   
                                            </axis:visible>
                                            </td>
                                            <td></td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm036" c="FFECCOB" lit="9000805"/></b>   <%-- Fecha cobro --%>
                                            </td>                   
                                        </tr>
                                        <tr>
                                            <%-- Producto --%>
                                            <td class="campocaja" colspan="2">
                                            <axis:visible c="SPROD_COMBO" f="axisadm036">
                                                <select name="SPRODUC" id ="SPRODUC" size="1" onchange="f_limpiar_campos()" class="campo campotexto" style="width:95%"
                                                title="<axis:alt f="axisadm036" c="SPROD_COMBO" lit="100829"/>" <axis:atr f="axisadm036" c="SPRODUC" a="isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="SPROD_COMBO2" lit="108341"/> - </option>
                                                    <c:forEach items="${sessionScope.DOM_LSTPRODUCTOS}" var="item">
                                                        <option value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC != 'null' && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                    </c:forEach>
                                                </select>
                                            </axis:visible>    
                                                   
                                                <!-- ******************************************************************************************* -->
                                                <!-- ************************  lista de productos a domiciliar ********************************* -->
                                                <!-- ******************************************************************************************* -->
                                            <axis:visible c="SPROD_LISTA" f="axisadm036">
                                                <input type="hidden" name="SPRODUC" id="SPRODUC"/>
                                                <input type="hidden" name="LISTAPR" id="LISTAPR"/>
                                                <c:set var="title0"><axis:alt f="axisadm036" c="SPROD_LISTA" lit="100829"/></c:set>
                                                <div id="dt_productos" class="seccion displayspace">
                                                 
                                                  <%int contador = 0;%>
                                                    <display:table name="${sessionScope.DOM_LSTPRODUCTOS}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="modal_axisadm036.do?paginar=true">
                                                     
                                                                                   
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column headerClass="headwidth5 sortable fixed" title="" media="html" autolink="false" sortable="false">
                                                        <div class="dspIcons">
                                                            <input <c:if test="${miListaIdProductes.MARCAT == 1}">checked</c:if> 
                                                            onclick=""
                                                                 type="checkbox" name="checkProducto_<%=contador%>" id="checkProducto_<%=contador%>"/>
                                                  
                                                            </div>
                                                            
                                                        </display:column>
                                                       
                                                        <display:column title="${title0}" sortable="true" sortProperty="TITULO" headerClass="sortable fixed"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdProductes['TTITULO']}</div>
                                                            <input type="hidden" id="SPRODUC_<%=contador%>" name="SPRODUC_<%=contador%>" value="${miListaIdProductes['SPRODUC']}"/>
                                                        </display:column>
                                                        <%contador++;%>
                                                    </display:table>
                                                    
                                                                                                        
                                                </div>
                                                <div class="separador">&nbsp; </div>
                                                        <axis:visible f="axisadm036" c="BUT_SEL_TODOS">
                                                            <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisadm036" c="BUT_SEL_TODOS" lit="9000756"/>"/>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm036" c="BUT_DSEL_TODOS">
                                                            <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisadm036" c="BUT_DSEL_TODOS" lit="9000757"/>"/>
                                                        </axis:visible>
                                                        
                                              </axis:visible>  
                                                
                                                <!-- ******************************************************************************************* -->
                                                <!-- ******************************************************************************************* -->
                                                <!-- ******************************************************************************************* -->
                                                
                                            </td>
                                            <%-- Fecha cobro --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                onkeyup="f_limpiar_campos()" onchange="f_limpiar_campos()"
                                                value="<fmt:formatDate value='${__formdata.FFECCOB}' pattern='dd/MM/yyyy'/>" name="FFECCOB" id="FFECCOB" onblur="javascript:f_formatdate(this,'')"                                                
                                                style="width:60%;" alt="<axis:alt f="axisadm036" c="FFECCOB" lit="9000805"/>" title="<axis:alt f="axisadm036" c="FFECCOB" lit="9000805"/>"                                                
                                                <axis:atr f="axisadm036" c="FFECCOB" a="formato=fecha"/> /><a id="icon_FFECCOB" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm036" c="FFECCOB" lit="9000805"/>" title="<axis:alt f="axisadm036" c="FFECCOB" lit="9000805" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm036" c="CCOBBAN" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CCOBBAN" lit="100879"/></b>   <%-- Cobrador bancario --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm036" c="CBANCO" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CBANCO" lit="9000964"/></b>   <%-- Banco --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm036" c="CTIPCUENTA" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CTIPCUENTA" lit="1000374"/></b>   <%-- Tipo de cuenta --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm036" c="FVENTAR" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="FVENTAR" lit="9902236"/></b>   <%-- Fecha vencimiento tarjeta  --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm036" c="CCOBBAN" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CCOBBAN" id ="CCOBBAN" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm036" c="CCOBBAN" lit="100879"/>" 
                                                    <axis:atr f="axisadm036" c="CCOBBAN" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="CCOBBAN2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCCOBBAN}" var="item">                                                               <!--BFP bug 20544 28/12/2011: hi havia=> item.NCUENTA -->
                                                            <option value = "${item.CCOBBAN}" <c:if test="${__formdata.CCOBBAN != 'null' && __formdata.CCOBBAN == item.CCOBBAN}"> selected </c:if>>${item.DESCRIPCION}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm036" c="CBANCO" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CBANCO" id ="CBANCO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm036" c="CBANCO" lit="9000964"/>" 
                                                    <axis:atr f="axisadm036" c="CBANCO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="CBANCO2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCBANCO}" var="item">
                                                            <option value = "${item.CBANCO}" <c:if test="${__formdata.CBANCO != 'null' && __formdata.CBANCO == item.CBANCO}"> selected </c:if>>${item.TBANCO}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                             
                                            <axis:ocultar f="axisadm036" c="CTIPCUENTA" dejarHueco="false">
                                                <td class="campocaja">                                                      <!-- style="width:90%" -->
                                                    <select name="CTIPCUENTA" id ="CTIPCUENTA" size="1" class="campo campotexto" style="width:220px" 
                                                    title="<axis:alt f="axisadm036" c="CTIPCUENTA" lit="1000374"/>" 
                                                    <axis:atr f="axisadm036" c="CTIPCUENTA" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="CTIPCUENTA2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCTIPCUENTA}" var="item">
                                                         <!-- Inici BFP bug:20326/99335 19/12/2011-->
                                                            <option value = "${item.CTIPBAN}" <c:if test="${__formdata.CTIPCUENTA != 'null' && __formdata.CTIPCUENTAO == item.CTIPBAN}"> selected </c:if>>${item.TTIPO}</option>
                                                            <!--<option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPCUENTA != 'null' && __formdata.CTIPCUENTAO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>-->
                                                        <!-- fi BFP bug:20326/99335 19/12/2011-->
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="FVENTAR" dejarHueco="false">
                                                 <%-- bug 26547/0141449 - JLTS - 20130405 --Ajuste formato fecha --%>
                                                 <%-- Fecha vencimiento tarjeta --%>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVENTAR}"/>"
                                                    name="FVENTAR" id="FVENTAR" style="width:40%;" alt="<axis:alt f="axisadm036" c="FVENTAR" lit="9902236"/>" 
                                                    <axis:atr f="axisper036" c="FVENTAR" a="formato=fecha"/>
                                                    title="<axis:alt f="axisadm036" c="FVENTAR" lit="9902236"/>" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axisadm036" c="CREFERENCIA" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CREFERENCIA" lit="9001285"/></b>   <%-- Referencia --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="CAGENTE" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CAGENTE" lit="9903513"/></b>   <%-- Código mediador --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="TAGENTE" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="TAGENTE" lit="9903514"/></b>   <%-- Nombre mediador --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <%-- Referencia --%>
                                            
                                            <axis:ocultar f="axisadm036" c="CREFERENCIA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.CREFERENCIA}" name="CREFERENCIA" id="CREFERENCIA"
                                                    alt="<axis:alt f="axisadm036" c="CREFERENCIA" lit="9001285"/>" title="<axis:alt f="axisadm036" c="CREFERENCIA" lit="9001285"/>" />
                                                </td>
                                            </axis:ocultar>
                                            
                                            <%-- Código mediador --%>
                                            
                                            <axis:ocultar f="axisadm036" c="CAGENTE" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"
                                                    alt="<axis:alt f="axisadm036" c="CAGENTE" lit="9903513"/>" title="<axis:alt f="axisadm036" c="CAGENTE" lit="9903513"/>" />
                                                </td>
                                            </axis:ocultar>
                                               
                                            <%-- Nombre mediador --%>
                                            
                                            <axis:ocultar f="axisadm036" c="TAGENTE" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE"
                                                    alt="<axis:alt f="axisadm036" c="TAGENTE" lit="9903514"/>" title="<axis:alt f="axisadm036" c="TAGENTE" lit="9903514"/>" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        
                                        
                                        <tr>
                                            <axis:ocultar f="axisadm036" c="NNUMIDE" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="NNUMIDE" lit="9000760"/></b>   <%-- NIF/CIF/NIE --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="TTOMADOR" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="TTOMADOR" lit="101027"/></b>   <%-- Tomador --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="NRECIBO" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="NRECIBO" lit="109253"/></b>   <%-- Recibo --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        <tr>
                                            <%-- NIF/CIF/NIE --%>
                                            
                                            <axis:ocultar f="axisadm036" c="NNUMIDE" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.NIF}" name="NNUMIDE" id="NNUMIDE"
                                                    alt="<axis:alt f="axisadm036" c="NNUMIDE" lit="9000760"/>" title="<axis:alt f="axisadm036" c="NNUMIDE" lit="9000760"/>" />
                                                </td>
                                            </axis:ocultar>
                                            
                                            <%-- Tomador --%>
                                            
                                            <axis:ocultar f="axisadm036" c="TTOMADOR" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.TOMADOR}" name="TTOMADOR" id="TTOMADOR"
                                                    alt="<axis:alt f="axisadm036" c="TTOMADOR" lit="101027"/>" title="<axis:alt f="axisadm036" c="TTOMADOR" lit="101027"/>" />
                                                </td>
                                            </axis:ocultar>
                                            
                                            <%-- Recibo --%>
                                            
                                            <axis:ocultar f="axisadm036" c="NRECIBO" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.NRECIBO}" name="NRECIBO" id="NRECIBO"
                                                    alt="<axis:alt f="axisadm036" c="NRECIBO" lit="109253"/>" title="<axis:alt f="axisadm036" c="NRECIBO" lit="109253"/>" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- Area con EL CAMPO SPROCES : PROCESO DE DOMINICLIACION  -->
                        <!-- SECCION REMESA BOTON BUSQUEDA : SECCION ORIGINAL -->  
                      <!-- ************************************************************************************************************************************************************************** -->
                      <axis:visible f="axisadm036" c="DSP_ADOMICILIAR">
                        <div class="separador">&nbsp; </div>  
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="SPROCES" lit="9001035"/></b> <%-- Proceso domiciliación --%>
                                            </td>
                                      
                                        </tr>
                                        
                                           
                                        
                                        <tr>
                                            <%-- Proceso domiciliación --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto_ob" id="SPROCES" name="SPROCES" size="15"
                                                
                                                <axis:atr f="axisadm036" c="SPROCES" a="formato=entero"/>
                                                style="width:88%" value="${__formdata.SPROCES}" alt="<axis:alt f="axisadm036" c="SPROCES" lit="9001035"/>" title="<axis:alt f="axisadm036" c="SPROCES" lit="9001035"/>"/>
                                            </td>

                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            
                             <%--tr>
                                            <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="SPROCES" lit="9001035"/></b> <!-- Proceso domiciliación -->
                                            </td>
                             </tr--%>
                        <!--/table>
                    </td>
                    </tr--> <!-- CORRECCION HTMLTAGS LCF -->
                    
            </table>						
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm036</c:param><c:param name="f">axisadm036</c:param>
                <c:param name="f">axisadm036</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>    
            </c:import>
            </axis:visible>
            <!-- ************************************************************************************************************************************************************************** -->
                    <axis:visible f="axisadm036" c="BT_BUSCAR_RECIBOS"> 
                    <div class="separador">&nbsp; </div>  
                    <tr>
                       <td  align="right">
                           <input type="button" id="BT_BUSCAR_RECIBOS" name="BT_BUSCAR_RECIBOS" class="boton" value="<axis:alt f="axisadm036" c="BT_BUSCAR_RECIBOS" lit="9903614"/>" onclick="javascript:f_but_9903614();"/>
                       </td>
                    </tr>
                    <div class="separador">&nbsp; </div>  
                    </axis:visible>

            <%--axis:ocultar f="axisadm036" c="BT_BUSCAR_RECIBOS" dejarHueco="false">
             <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm036</c:param><c:param name="f">axisadm036</c:param>
                <c:param name="f">axisadm036</c:param>
                <c:param name="__botones">cancelar,9903614</c:param>   
            </c:import>
            </axis:ocultar--%>    
            
            
            <axis:visible f="axisadm036" c="DSP_REMESADOS">  
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm036" c="titulo" lit="9903622"/></div> <%-- Datos remesados --%>
                       
              <!-- SECCION REMESA BOTON BUSQUEDA -->  
              <!-- ************************************************************************************************************************************************************************** -->
              
                        <div class="separador">&nbsp; </div>  
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="SPROCES" lit="9001035"/></b> <%-- Proceso domiciliación --%>
                                            </td>
                                            <axis:ocultar f="axisadm036" c="FINIREM" dejarHueco="false">
                                            <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="FINIREM" lit="9903599"/></b> <%--  Fecha inicio remesa --%>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm036" c="FFINREM" dejarHueco="false">
                                            <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="FFINREM" lit="9903600"/></b> <%-- Fecha fin remesa --%>
                                            </td>
                                            </axis:ocultar>                                            
                                            <axis:ocultar f="axisadm036" c="CCOBBAN_REM" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm036" c="CCOBBAN_REM" lit="100879"/></b>   <%-- Cobrador bancario --%>
                                                </td>
                                            </axis:ocultar>
                                            
                                        </tr>
                                        
                                           
                                        
                                        <tr>
                                            <%-- Proceso domiciliación --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto_ob" id="SPROCES" name="SPROCES" size="15"
                                                onkeyup="f_limpiar_campos_remesas(true)" onchange="f_limpiar_campos_remesas(true)"
                                                <axis:atr f="axisadm036" c="SPROCES" a="formato=entero"/>
                                                style="width:88%" value="${__formdata.SPROCES}" alt="<axis:alt f="axisadm036" c="SPROCES" lit="9001035"/>" title="<axis:alt f="axisadm036" c="SPROCES" lit="9001035"/>"/>
                                            </td>
                                            
                                            <axis:ocultar f="axisadm036" c="FINIREM" dejarHueco="false">
                                                 <%-- Fecha vencimiento tarjeta --%>
                                                <td class="campocaja">
                                                   <input type="text" class="campowidthinput campo campotexto_ob" size="15" 
                                                   onchange="f_limpiar_campos_remesas(false)"
                                                    value="<fmt:formatDate value='${__formdata.FINIREM}' pattern='dd/MM/yyyy'/>" name="FINIREM" id="FINIREM" onblur="javascript:f_formatdate(this,'')"
                                                    style="width:60%;" alt="<axis:alt f="axisadm036" c="FINIREM_ALT" lit="9903599"/>" title="<axis:alt f="axisadm036" c="FINIREM_TIT" lit="9903599"/>"
                                                    <axis:atr f="axisadm036" c="FINIREM" a="formato=fecha"/> /><a id="icon_FINIREM" style="vertical-align:middle;"><img 
                                                    alt="<axis:alt f="axisadm036" c="FINIREM" lit="9903599"/>" title="<axis:alt f="axisadm036" c="FINIREM_TIT" lit="9903599" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="FFINREM" dejarHueco="false">
                                                 <%-- Fecha vencimiento tarjeta --%>
                                                <td class="campocaja">
                                                   <input type="text" class="campowidthinput campo campotexto_ob" size="15" 
                                                 onchange="f_limpiar_campos_remesas(false)"
                                                    value="<fmt:formatDate value='${__formdata.FFINREM}' pattern='dd/MM/yyyy'/>" name="FFINREM" id="FFINREM" onblur="javascript:f_formatdate(this,'')"
                                                    style="width:60%;" alt="<axis:alt f="axisadm036" c="FFINREM_ALT" lit="9903600"/>" title="<axis:alt f="axisadm036" c="FFINREM_TIT" lit="9903600"/>"
                                                    <axis:atr f="axisadm036" c="FFINREM" a="formato=fecha"/> /><a id="icon_FFINREM" style="vertical-align:middle;"><img 
                                                    alt="<axis:alt f="axisadm036" c="FFINREM_ALT" lit="9903600"/>" title="<axis:alt f="axisadm036" c="FFINREM_TIT" lit="9903600" />" src="images/calendar.gif"/></a>
                                                </td>
                                            </axis:ocultar>
                                            
                                            <axis:ocultar f="axisadm036" c="CCOBBAN_REM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CCOBBAN_REM" id ="CCOBBAN_REM" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm036" c="CCOBBAN_REM" lit="100879"/>" 
                                                    <axis:atr f="axisadm036" c="CCOBBAN_REM" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm036" c="CCOBBAN_REM" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCCOBBAN}" var="item">                                                               <!--BFP bug 20544 28/12/2011: hi havia=> item.NCUENTA -->
                                                            <option value = "${item.CCOBBAN}" <c:if test="${__formdata.CCOBBAN_REM != 'null' && __formdata.CCOBBAN_REM == item.CCOBBAN}"> selected </c:if>>${item.DESCRIPCION}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            
                                            
                                            
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            
                            <!-- *************************************************************************************************************************************************** -->
                            <!-- *************************************************************     lista remesas    **************************************************************** -->
                            <!-- *************************************************************************************************************************************************** -->
                            
                                                       
                             <!-- Lista de Siniestros por póliza -->
                                        <tr>
                                        <axis:visible f="axisadm036" c="LST_REMESAS"> 
                                            <td>
                                                <div class="titulo">
                                                    <img src="images/flecha.gif"/><axis:alt f="axissin019" c="LISTADO_REMESAS" lit="9903620"/>
                                                </div>
                                                <!-- Lista de siniestros -->
                                                <table class="seccion">                         
                                                    <tr>
                                                        <td>
                                                            <c:set var="title0">&nbsp;</c:set>
                                                            <c:set var="title1">
                                                                <axis:alt f="axisadm036" c="SPROCES" lit="108527"/>
                                                            </c:set>
                                                            <c:set var="title2">
                                                                <axis:alt f="axisadm036" c="CCOBBAN" lit="100879"/>
                                                            </c:set>
                                                            
                                                             <c:set var="title12">
                                                                <axis:alt f="axisadm036" c="TCOMPANI" lit="9000600"/>
                                                            </c:set>
                                                            
                                                            <c:set var="title3">
                                                                <axis:alt f="axisadm036" c="ANULADOS" lit="9903606"></axis:alt>
                                                            </c:set>
                                                            <c:set var="title4">
                                                                <axis:alt f="axisadm036" c="IANULADOS" lit="9903607"></axis:alt>
                                                            </c:set>
                                                            
                                                            <c:set var="title13">
                                                                <axis:alt f="axisadm036" c="FRECAUDO" lit="9902240"/>
                                                            </c:set>
                                                            <c:set var="title5">
                                                                <axis:alt f="axisadm036" c="COBRADOS" lit="9903529"/>
                                                            </c:set>
                                                            <c:set var="title6">
                                                                <axis:alt f="axisadm036" c="ICOBRADOS" lit="9903603"/>
                                                            </c:set>
                                                            
                                                            <c:set var="title14">
                                                                <axis:alt f="axisadm036" c="IMPAGADOS" lit="9900961"/>
                                                            </c:set>
                                                            <c:set var="title15">
                                                                <axis:alt f="axisadm036" c="IIMPAGADOS" lit="9903605"/>
                                                            </c:set>
                                                            
                                                            <c:set var="title7">
                                                                <axis:alt f="axisadm036" c="REMESADOS" lit="9903620"/>
                                                            </c:set>
                                                            <c:set var="title8">
                                                                <axis:alt f="axisadm036" c="IREMESADOS" lit="9903602"/>
                                                            </c:set>
                                                            <c:set var="title9">
                                                                <axis:alt f="axisadm036" c="CESTADO" lit="100587"></axis:alt>
                                                            </c:set>
                                                             <c:set var="title10">
                                                                <axis:alt f="axisadm036" c="FCREACION" lit="9903601"/>
                                                            </c:set>
                                                            <c:set var="title11">
                                                                <axis:alt f="axisadm036" c="EDITAR" lit="9903521"/>
                                                            </c:set>
                                                            <div class="seccion  displayspace">
                                                                <display:table name="${__formdata.LISTAREMESAS}"
                                                                               id="miListaRemesas"
                                                                               export="false"
                                                                               class="dsptgtable"
                                                                               pagesize="-1"
                                                                               defaultsort="2"
                                                                               defaultorder="ascending"
                                                                               requestURI="modal_axisadm036.do?paginar=true"
                                                                               sort="list"
                                                                               cellpadding="0"
                                                                               cellspacing="0">
                                                                    <%@ include file="../include/displaytag.jsp"%>

                                                                   
                                                                    <axis:visible c="SPROCES" f="axisadm036"> 
                                                                    <display:column title="${title1}"
                                                                                    sortable="false"
                                                                                    sortProperty="SPROCES"
                                                                                    headerClass="headwidth10 sortable"
                                                                                    media="html"
                                                                                    autolink="false">
                                                                        <div class="dspNumber">
                                                                            <a onclick="f_buscar_rem('${miListaRemesas.SPROCES}')">
                                                                                ${miListaRemesas['SPROCES']}
                                                                            </a>
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                    <axis:visible c="CCOBBAN_MULT" f="axisadm036"> 
                                                                    <display:column title="${title2}"
                                                                                    sortable="false"
                                                                                    sortProperty="CCOBBAN"
                                                                                    headerClass="headwidth10 sortable"
                                                                                    media="html"
                                                                                    autolink="false">
                                                                        <div class="dspNumber">
                                                                            <a onclick="f_buscar_rem('${miListaRemesas.SPROCES}')">
                                                                                ${miListaRemesas['CCOBBAN']}                    
                                                                            </a>
                                                                        </div>
                                                                    </display:column>                                                                    
                                                                    </axis:visible>
                                                                    
                                                                    <axis:visible c="TCOMPANI" f="axisadm036"> 
                                                                    <display:column title="${title12}"
                                                                                    sortable="false"
                                                                                    sortProperty="TCOMPANY"
                                                                                    headerClass="headwidth10 sortable"
                                                                                    media="html"
                                                                                    autolink="false">
                                                                        <div class="dspNumber">
                                                                            <a onclick="f_buscar_rem('${miListaRemesas.SPROCES}')">
                                                                                ${miListaRemesas['TCOMPANI']} 
                                                                            </a>
                                                                        </div>
                                                                    </display:column>                                                                    
                                                                    </axis:visible>
                                                                    
                                                                    <axis:visible c="FRECAUDO" f="axisadm036"> 
                                                                    <display:column title="${title13}"
                                                                                    sortable="false"
                                                                                    sortProperty="FRECAUDO"
                                                                                    headerClass="headwidth10 sortable"
                                                                                    media="html"
                                                                                    autolink="false">
                                                                        <div class="dspText">
                                                                            <a onclick="f_buscar_rem('${miListaRemesas.SPROCES}')">
                                                                                ${miListaRemesas['FRECAUDO']} 
                                                                            </a>
                                                                        </div>
                                                                    </display:column>                                                                    
                                                                    </axis:visible>
                                                                    
                                                                    <axis:visible c="FCREACION" f="axisadm036">
                                                                        <display:column title="${title10}"
                                                                                        sortable="false"
                                                                                        sortProperty="FCREACION"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.NSINIES}')">
                                                                                   <fmt:formatDate value='${miListaRemesas.FCREACION}' pattern='dd/MM/yyyy'/>
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                    </axis:visible>
                                                                    
                                                                    <axis:visible c="REMESADOS" f="axisadm036">
                                                                         <display:column title="${title7}"
                                                                                        sortable="false"
                                                                                        sortProperty="REMESADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaRemesas.REMESADOS}')">
                                                                                    ${miListaRemesas['REMESADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>
                                                                     
                                                                     <axis:visible c="IREMESADOS" f="axisadm036">
                                                                         <display:column title="${title8}"
                                                                                        sortable="false"
                                                                                        sortProperty="IREMESADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.IREMESADOS}')">
                                                                                    ${miListaRemesas['IREMESADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>
                                                                     
                                                                     <axis:visible c="COBRADOS" f="axisadm036">
                                                                         <display:column title="${title5}"
                                                                                        sortable="false"
                                                                                        sortProperty="COBRADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaRemesas.COBRADOS}')">
                                                                                    ${miListaRemesas['COBRADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>
                                                                     
                                                                     <axis:visible c="ICOBRADOS" f="axisadm036">
                                                                         <display:column title="${title6}"
                                                                                        sortable="false"
                                                                                        sortProperty="ICOBRADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.ICOBRADOS}')">
                                                                                    ${miListaRemesas['ICOBRADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>   
                                                                     
                                                                     <axis:visible c="IMPAGADOS" f="axisadm036">
                                                                         <display:column title="${title14}"
                                                                                        sortable="false"
                                                                                        sortProperty="IMPAGADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaRemesas.IMPAGADOS}')">
                                                                                    ${miListaRemesas['IMPAGADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>
                                                                     
                                                                     <axis:visible c="IIMPAGADOS" f="axisadm036">
                                                                         <display:column title="${title15}"
                                                                                        sortable="false"
                                                                                        sortProperty="IIMPAGADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.IIMPAGADOS}')">
                                                                                    ${miListaRemesas['IIMPAGADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>   
                                                                    
                                                                    <axis:visible c="ANULADOS" f="axisadm036">
                                                                         <display:column title="${title3}"
                                                                                        sortable="false"
                                                                                        sortProperty="ANULADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaRemesas.ANULADOS}')">
                                                                                    ${miListaRemesas['ANULADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>
                                                                     
                                                                     <axis:visible c="IANULADOS" f="axisadm036">
                                                                         <display:column title="${title4}"
                                                                                        sortable="false"
                                                                                        sortProperty="IANULADOS"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.IANULADOS}')">
                                                                                    ${miListaRemesas['IANULADOS']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>   
                                                                                                                                          
                                                                     <axis:visible c="CESTADO" f="axisadm036">
                                                                         <display:column title="${title9}"
                                                                                        sortable="false"
                                                                                        sortProperty="CESTADO"
                                                                                        headerClass="sortable"
                                                                                        media="html"
                                                                                        autolink="false">
                                                                            <div class="dspText">
                                                                                <a onclick="f_buscar_rem('${miListaId.CESTADO}')">
                                                                                    ${miListaRemesas['CESTADO']}
                                                                                </a>
                                                                            </div>
                                                                        </display:column>
                                                                     </axis:visible>   
                                                                    
                                                                    
                                                            
                                                                    <axis:visible c="BT_EDIT_REM" f="axisadm036">
                                                                    <display:column title="${title11}"
                                                                                    sortable="false"
                                                                                    headerClass="sortable"
                                                                                    media="html"
                                                                                    autolink="false">
                                                                        <div class="dspIcon">
                                                                           <a href="javascript:f_but_rem()"><img border="0" alt="<axis:alt f="axisadm036" c="EDITAR" lit="9903521" />" title="<axis:alt f="axissin019" c="EDITAR" lit="9903521" />" src="images/find.gif"/></a>
                                                                        </div>
                                                                    </display:column>
                                                                    </axis:visible>
                                                                
                                                                </display:table>
                                                            
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </axis:visible>
                                        </tr>
                            
 
                            
                            <!-- *************************************************************************************************************************************************** -->
                            <!-- *************************************************************************************************************************************************** -->
                            <!-- *************************************************************************************************************************************************** -->
                            
                        </table>
                    </td>
                </tr> 
            </table>						
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm036</c:param><c:param name="f">axisadm036</c:param>
                <c:param name="f">axisadm036</c:param>
                <c:param name="__botones">cancelar,9903615</c:param> 
            </c:import>
            
            <!-- ************************************************************************************************************************************************************************** -->
            </axis:visible>  <!-- FIN DE SECCION NUEVA: REMESADOS -->
          
          
          
          </td>
          </tr> 
          </table>	<!-- CORRECCION HTMLTAGS LCF -->
          
          
          
          
          
          
            
        </form>
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FEFECTO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FEFECTO", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "DFEFECTO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_DFEFECTO", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FFECCOB",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFECCOB", 
                singleClick    :    true,
                firstDay       :    1
            });     
            
            Calendar.setup({
                inputField     :    "FINIREM",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FINIREM", 
                singleClick    :    true,
                firstDay       :    1
            });   
            
            Calendar.setup({
                inputField     :    "FFINREM",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FFINREM", 
                singleClick    :    true,
                firstDay       :    1
            });   
            
            
         </script>
        
        
    <c:import url="../include/mensajes.jsp" />
            
            
            
</body>



</html>