<%/*
*  Fichero: axiadm067.jsp
*  Fecha: 05/05/2009
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
              //parent.f_aceptar_axisadm067(CEMPRES,null,null,null,null,null,document.miForm.CAD_SPRODUC.value);
              //parent.f_aceptar_axisadm067(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.FEFECTO.value,document.miForm.FFECCOB.value,document.miForm.SPROCES.value,null);
              
              parent.f_aceptar_axisadm067(CEMPRES, document.miForm.CRAMO.value,null,document.miForm.FEFECTO.value,
                                          document.miForm.FFECCOB.value,document.miForm.SPROCES.value,document.miForm.CAD_SPRODUC.value,
                                          document.miForm.CCOBBAN.value,document.miForm.CBANCO.value, 
                                          document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                                          document.miForm.CREFERENCIA.value, document.miForm.DFEFECTO.value);
                    
             }
         
         }
        
        
        
        function f_but_cancelar() {
            parent.f_cerrar_axisadm067();
        }
        
        
        /*****************************************************************************************/
        /************************************ axisadm067 *****************************************/
        /****************************************************************************************/
        
        
      function f_but_buscar() {
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
                        //parent.f_aceptar_axisadm067(CEMPRESA, document.miForm.CRAMO.value,document.miForm.SPRODUC.value,document.miForm.FEFECTO.value,document.miForm.FFECCOB.value,document.miForm.SPROCES.value, document.miForm.CAD_SPRODUC.value);
                        
                         if (document.miForm.SPROCES.value!='' || objValidador.validaEntrada()) {
                parent.f_aceptar_axisadm067(CEMPRESA, document.miForm.CRAMO.value,null,document.miForm.FEFECTO.value,
                      document.miForm.FFECCOB.value,document.miForm.SPROCES.value,document.miForm.CAD_SPRODUC.value,
                      document.miForm.CCOBBAN.value,document.miForm.CBANCO.value, 
                      document.miForm.CTIPCUENTA.value, document.miForm.FVENTAR.value, 
                      document.miForm.CREFERENCIA.value,document.miForm.DFEFECTO.value);
                        }
		    
            }else{
                alert('<axis:alt f="axisadm067" c="MENSAJE" lit="9000505"/>');
            }
        }
            
            function f_but_9001038() {
                // Domiciliar
                
                if (objValidador.validaEntrada())
                    // objUtiles.ejecutarFormulario ("modal_axisadm067.do", "domiciliar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    objAjax.invokeAsyncCGI("modal_axisadm067.do?SPROCES=" + objDom.getValorPorId("SPROCES") + "&CEMPRES=" + objDom.getValorPorId("CEMPRES") +
                    "&CRAMO=" + objDom.getValorPorId("CRAMO") + "&SPRODUC=" + objDom.getValorPorId("SPRODUC") + "&FEFECTO=" + objDom.getValorPorId("FEFECTO") + 
                    "&FFECCOB=" + objDom.getValorPorId("FFECCOB"), callbackAjaxDomiciliar, "operation=domiciliar",  this, objJsMessages.jslit_cargando);
            }

            function f_but_cancelar() {
                 parent.f_cerrar_axisadm067();
                 
            }           
            
            function f_recarga_combos(comboOrigen) {
            //alert("En recarga combos");
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO   = objDom.getValorPorId("CRAMO");
                
                objAjax.invokeAsyncCGI("modal_axisadm067.do", callbackAjaxActualizarCombos, 
                "operation=actualizar_combos&comboOrigen=" + comboOrigen + "&CEMPRES=" + CEMPRES + 
                "&CRAMO=" + CRAMO, this, null, comboOrigen);
            }            
            
            function f_limpiar_campos(isSPROCES) {
                var SPROCES = objDom.getValorPorId("SPROCES");

                if (!objUtiles.estaVacio(SPROCES) && isSPROCES) {
                    document.getElementById("CEMPRES")[0].selected = "1";
                    f_recarga_combos('E');
                    objDom.setValorPorId("FEFECTO", "");
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
           <%-- if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisadm067" c="MENSAJE2" lit="1000421"/>");
                }
            }--%>
            
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
                objLista.borrarFilasDeLista ("miListaIdProductes", "3", "<axis:alt f='axisadm067' c='miListaIdProductes' lit='1000254' />");
                    
                
                if (objUtiles.existeObjetoXml(doc.getElementsByTagName(comboName)[0])){                    
                    var elementos = doc.getElementsByTagName(comboName)[0].getElementsByTagName("element");
                    var numElementos = elementos.length;
                    //alert("Num Elementos:" + numElementos);
                    if (numElementos == 0){
                        //alert("borrando registros");
                        //objLista.borrarFilaVacia(tbodyadded, tradded);
                        objLista.borrarFilasDeLista ("miListaIdProductes", "2", "<axis:alt f='axisadm067' c='miListaIdProductes' lit='1000254' />");
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
                // The rest of the method, is unreachable code here, in axisadm067. We've kept it for future extensions.
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
        
 
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  {f_but_buscar(); }" >
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRECIBO" id="NRECIBO" value="${requestScope.NRECIBO}"/>
            <input type="hidden" name="CAD_SPRODUC" id="CAD_SPRODUC" value=""/>
            <c:if test="${!empty __formdata.LISTVALORES.LSTEMPRESAS && fn:length(__formdata.LISTVALORES.LSTEMPRESAS) == 1  }">
                <input type="hidden" id ="CEMPRES" name="CEMPRES" value="${__formdata.LISTVALORES.LSTEMPRESAS[0].CEMPRES}" />
            </c:if>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisadm067" c="formulario" lit="9902719" /></c:param>
                <c:param name="producto"><axis:alt f="axisadm067" c="producto" lit="9902719" /></c:param>
                <c:param name="form">axisadm067</c:param>
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
                        <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisadm067" c="titulo" lit="9001033"/></div> <%-- Datos domiciliación --%>
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
                                                <b><axis:alt f="axisadm067" c="CEMPRES" lit="101619"/></b>   <%-- Empresa --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm067" c="CRAMO" lit="100784"/></b>   <%-- Ramo --%>
                                            </td>   
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm067" c="DFEFECTO" lit="9902360"/></b>   <%-- Fecha efecto desde --%>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm067" c="FEFECTO" lit="9002169"/></b>   <%-- Fecha efecto --%>
                                            </td>
                                        </tr>
                                        <tr>
                                        
                                        <%-- Empresa --%>
                                          <c:choose>  
                                            <c:when test="${fn:length(__formdata.LISTVALORES.LSTEMPRESAS) > 1 && !empty __formdata.LISTVALORES.LSTEMPRESAS}">
                                              <td class="campocaja">
                                                    <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto_ob" obligatorio="true" style="width:90%"
                                                    title="<axis:alt f="axisadm067" c="CEMPRES" lit="101619"/>" onchange="f_recarga_combos('E');f_limpiar_campos();"
                                                    <axis:atr f="axisadm067" c="CEMPRES" a="isInputText=false&obligatorio=false"/>>
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisadm067" c="CEMPRES2" lit="108341"/> - </option>                                                                                                        
                                                        <c:forEach items="${__formdata.LISTVALORES.LSTEMPRESAS}" var="item">
                                                            <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                        </c:forEach>
                                                    </select>
                                              </td>           
                                           </c:when>
                                             <c:otherwise> 
                                             <td class="campocaja">
                                             
                                             <input type= "text" class="campo campotexto" obligatorio="true" id="CEMPRES" name="CEMPRES" value = "${__formdata.LISTVALORES.LSTEMPRESAS[0].TEMPRES}"
                                             <axis:atr f="axisadm067" c="CEMPRES" a="modificable=false&obligatorio=true"/>/>
                                               </td>    
                                                </c:otherwise> 
                                            </c:choose> 
                                        
                                            <td class="campocaja">
                                                <select name="CRAMO" id ="CRAMO" size="1" class="campo campotexto" style="width:90%" 
                                                title="<axis:alt f="axisadm067" c="CRAMO" lit="100784"/>" onchange="f_recarga_combos('R');f_limpiar_campos();"
                                                <axis:atr f="axisadm067" c="CRAMO" a="isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm067" c="CRAMO2" lit="108341"/> - </option>
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
                                                style="width:60%;" alt="<axis:alt f="axisadm067" c="DFEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm067" c="DFEFECTO2" lit="100883"/>"
                                                <axis:atr f="axisadm067" c="DFEFECTO" a="formato=fecha"/> /><a id="icon_DFEFECTO" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm067" c="DFEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm067" c="DFEFECTO2" lit="100883" />" src="images/calendar.gif"/></a>
                                            </td>
                                            
                                            <%-- Fecha efecto --%>
                                            <td class="campocaja">
                                            <%-- onkeyup="f_limpiar_campos()" onchange="f_limpiar_campos()"
                                               onkeypress="if (event.keyCode==13)  {f_valida_buscar(this);}" --%>
                                               <jsp:useBean id="today" class="java.util.Date" /> 
                                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" 
                                                onkeyup="f_limpiar_campos()" onchange="f_limpiar_campos()"
                                                value="<fmt:formatDate value='${today}' pattern='dd/MM/yyyy'/>" name="FEFECTO" id="FEFECTO" onblur="javascript:f_formatdate(this,'')"
                                                style="width:60%;" alt="<axis:alt f="axisadm067" c="FEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm067" c="FEFECTO2" lit="100883"/>"
                                                <axis:atr f="axisadm067" c="FEFECTO" a="formato=fecha"/> /><a id="icon_FEFECTO" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm067" c="FEFECTO2" lit="100883"/>" title="<axis:alt f="axisadm067" c="FEFECTO2" lit="100883" />" src="images/calendar.gif"/></a>
                                            </td>
                                            
                                            
                                        </tr>
                                           
                                        <tr>
                                            <td class="titulocaja">
                                            <axis:visible c="SPROD_COMBO" f="axisadm067">
                                                <b><axis:alt f="axisadm067" c="SPROD_COMBO" lit="100829"/></b>   
                                            </axis:visible>
                                            </td>
                                            <td></td>
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisadm067" c="FFECCOB" lit="9000805"/></b>   <%-- Fecha cobro --%>
                                            </td>                   
                                        </tr>
                                        <tr>
                                            <%-- Producto --%>
                                            <td class="campocaja" colspan="2">
                                            <axis:visible c="SPROD_COMBO" f="axisadm067">
                                                <select name="SPRODUC" id ="SPRODUC" size="1" onchange="f_limpiar_campos()" class="campo campotexto" style="width:95%"
                                                title="<axis:alt f="axisadm067" c="SPROD_COMBO" lit="100829"/>" <axis:atr f="axisadm067" c="SPRODUC" a="isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm067" c="SPROD_COMBO2" lit="108341"/> - </option>
                                                    <c:forEach items="${sessionScope.DOM_LSTPRODUCTOS}" var="item">
                                                        <option value = "${item.SPRODUC}" <c:if test="${__formdata.SPRODUC != 'null' && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                    </c:forEach>
                                                </select>
                                            </axis:visible>    
                                                
                                                <!-- ******************************************************************************************* -->
                                                <!-- ************************  lista de productos a domiciliar ********************************* -->
                                                <!-- ******************************************************************************************* -->
                                            <axis:visible c="SPROD_LISTA" f="axisadm067">
                                                <input type="hidden" name="SPRODUC" id="SPRODUC"/>
                                                <input type="hidden" name="LISTAPR" id="LISTAPR"/>
                                                <c:set var="title0"><axis:alt f="axisadm067" c="SPROD_LISTA" lit="100829"/></c:set>
                                                <div id="dt_productos" class="seccion displayspace">
                                                 
                                                  <%int contador = 0;%>
                                                    <display:table name="${sessionScope.DOM_LSTPRODUCTOS}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="modal_axisadm067.do?paginar=true">
                                                     
                                                                                   
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
                                                        <axis:visible f="axisadm067" c="BUT_SEL_TODOS">
                                                            <input type="button" onclick="ChequearTodosBut()" class="boton" value="<axis:alt f="axisadm067" c="BUT_SEL_TODOS" lit="9000756"/>"/>
                                                        </axis:visible>
                                                        <axis:visible f="axisadm067" c="BUT_DSEL_TODOS">
                                                            <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<axis:alt f="axisadm067" c="BUT_DSEL_TODOS" lit="9000757"/>"/>
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
                                                style="width:60%;" alt="<axis:alt f="axisadm067" c="FFECCOB" lit="9000805"/>" title="<axis:alt f="axisadm067" c="FFECCOB" lit="9000805"/>"                                                
                                                <axis:atr f="axisadm067" c="FFECCOB" a="formato=fecha"/> /><a id="icon_FFECCOB" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisadm067" c="FFECCOB" lit="9000805"/>" title="<axis:alt f="axisadm067" c="FFECCOB" lit="9000805" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm067" c="CCOBBAN" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="CCOBBAN" lit="100879"/></b>   <%-- Cobrador bancario --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="CBANCO" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="CBANCO" lit="9000964"/></b>   <%-- Banco --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="CTIPCUENTA" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="CTIPCUENTA" lit="1000374"/></b>   <%-- Tipo de cuenta --%>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="FVENTAR" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="FVENTAR" lit="9902236"/></b>   <%-- Fecha vencimiento tarjeta  --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm067" c="CCOBBAN" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CCOBBAN" id ="CCOBBAN" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm067" c="CCOBBAN" lit="100879"/>" 
                                                    <axis:atr f="axisadm067" c="CCOBBAN" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm067" c="CCOBBAN2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCCOBBAN}" var="item">                                                               <!--BFP bug 20544 28/12/2011: hi havia=> item.NCUENTA -->
                                                            <option value = "${item.CCOBBAN}" <c:if test="${__formdata.CCOBBAN != 'null' && __formdata.CCOBBAN == item.CCOBBAN}"> selected </c:if>>${item.DESCRIPCION}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="CBANCO" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CBANCO" id ="CBANCO" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm067" c="CBANCO" lit="9000964"/>" 
                                                    <axis:atr f="axisadm067" c="CBANCO" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm067" c="CBANCO2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCBANCO}" var="item">
                                                            <option value = "${item.CBANCO}" <c:if test="${__formdata.CBANCO != 'null' && __formdata.CBANCO == item.CBANCO}"> selected </c:if>>${item.TBANCO}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="CTIPCUENTA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select name="CTIPCUENTA" id ="CTIPCUENTA" size="1" class="campo campotexto" style="width:90%" 
                                                    title="<axis:alt f="axisadm067" c="CTIPCUENTA" lit="1000374"/>" 
                                                    <axis:atr f="axisadm067" c="CTIPCUENTA" a="isInputText=false"/>>
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisadm067" c="CTIPCUENTA2" lit="108341"/> - </option>
                                                        <c:forEach items="${sessionScope.DOM_LSTCTIPCUENTA}" var="item">
                                                            <option value = "${item.CATRIBU}" <c:if test="${__formdata.CTIPCUENTA != 'null' && __formdata.CTIPCUENTAO == item.CATRIBU}"> selected </c:if>>${item.TATRIBU}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisadm067" c="FVENTAR" dejarHueco="false">
                                                 <%-- Fecha vencimiento tarjeta --%>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.FVENTAR}" name="FVENTAR" id="FVENTAR" 
                                                    style="width:40%;" alt="<axis:alt f="axisadm067" c="FVENTAR" lit="9902236"/>" title="<axis:alt f="axisadm067" c="FVENTAR" lit="9902236"/>" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm067" c="CREFERENCIA" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisadm067" c="CREFERENCIA" lit="9001285"/></b>   <%-- Referencia --%>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <%-- Referencia --%>
                                            
                                            <axis:ocultar f="axisadm067" c="CREFERENCIA" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                    value="${__formdata.CREFERENCIA}" name="CREFERENCIA" id="CREFERENCIA"
                                                    alt="<axis:alt f="axisadm067" c="CREFERENCIA" lit="9001285"/>" title="<axis:alt f="axisadm067" c="CREFERENCIA" lit="9001285"/>" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                       
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <!-- Area con EL CAMPO SPROCES : PROCESO DE DOMINICLIACION  -->
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
                                                    <b><axis:alt f="axisadm067" c="SPROCES" lit="9902752"/></b> <%-- Proceso domiciliación --%>
                                                </td>
                                        </tr>
                                        <tr>
                                            <%-- Proceso domiciliación --%>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto_ob" id="SPROCES" name="SPROCES" size="15"
                                                onkeyup="f_limpiar_campos(true)" onchange="f_limpiar_campos(true)"
                                                <axis:atr f="axisadm067" c="SPROCES" a="formato=entero"/>
                                                style="width:88%" value="${__formdata.SPROCES}" alt="<axis:alt f="axisadm067" c="SPROCES" lit="9902752"/>" title="<axis:alt f="axisadm067" c="SPROCES" lit="9902752"/>"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr> 
            </table>						
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisadm067</c:param><c:param name="f">axisadm067</c:param>
                <c:param name="f">axisadm067</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
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
            
         </script>
        
        
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>