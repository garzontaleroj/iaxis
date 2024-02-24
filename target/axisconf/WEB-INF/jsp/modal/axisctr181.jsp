<%/**
*  
Busqueda de anticipos por poliza
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp"/>

<script language="Javascript" type="text/javascript">
// Código javascript
var vcactivi = '';

   /* *************************************  ACTUALIZAR COBJASE ***********************************        */  
    function f_cargar_cobjase(){
        f_cargar_propiedades_pantalla();
        SPRODUC = document.miForm.SPRODUC.value;
            if (!objUtiles.estaVacio(SPRODUC)){
                objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
            }             
       }
       
    function callbackAjaxCargarCobjase (ajaxResponseText){
        //alert(ajaxResponseText);        
        var doc=objAjax.domParse(ajaxResponseText);
        //alert("Entrada");
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
            var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
            //alert(COBJASE);           
            document.miForm.COBJASE.value = COBJASE;   
            if (objUtiles.estaVacio(COBJASE) || COBJASE ==0){
                document.miForm.TIPRIESGO.disabled = false;               
            }
            else{
                document.miForm.TIPRIESGO.value = COBJASE;               
                document.miForm.TIPRIESGO.disabled = true;               
            }           
            f_cargar_propiedades_pantalla();
            f_cargar_actividades();
        }
    }

    function f_refrescarDependencias(){
           f_cargar_propiedades_pantalla();                  
    }
    
    function f_onload() {
        // Si la lista de pólizas sólo contiene una fila, buscamos automaticamente los siniestros  
        <c:if test="${!empty __formdata.AXIS_POLIZAS && fn:length(__formdata.AXIS_POLIZAS) == 1}" >
            f_seleccionar_poliza('${__formdata.AXIS_POLIZAS[0].SSEGURO}','${__formdata.AXIS_POLIZAS[0].NRIESGO}', '${__formdata.AXIS_POLIZAS[0].CTAPRES}');
        </c:if>
        var COBJASE = document.miForm.COBJASE;                 
            
            
            
            formdataPAIS = '${__formdata.CPAIS}';
            vcactivi = '${__formdata['CACTIVI']}';
            
            if (!objUtiles.estaVacio(formdataPAIS)){
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                    objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                }
            }
            f_cargar_propiedades_pantalla();
    }

    function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
    }

    

    
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {     
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioSiniestro");
            if(typeof hayChecked == 'boolean') {
                alert(objJsMessages.jslit_seleccione_un_siniestro);
            }else{
                
                f_seleccionar_prestamo(CTAPRES, SSEGURO,2);
            }
    }
        
    function f_but_cancelar() {
            parent.f_cerrar_axisctr181();
    }
    function f_but_9001816() { 
       if(!objUtiles.estaVacio( objDom.getValorPorId("SSEGURO_CHK") )) {
            parent.f_aceptar_axisctr181(null, objDom.getValorPorId("SSEGURO_CHK"),1);
       }else {
            objAppMensajes.pintarMensajePantalla('<axis:alt f="axisctr181" c="SEL_POLIZA" lit="9000850"/>', "info"); 
            
       }
    }
    function f_but_buscar(){
        
                if (objValidador.validaEntrada()) {
                try { document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.miForm.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.miForm.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                    if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                        objDom.setDisabledPorId("but_aceptar", true);
                    objUtiles.ejecutarFormulario("modal_axisctr181.do", "busqueda_poliza", document.miForm, "_self", objJsMessages.jslit_cargando);
         
          }
      }
        
      function f_seleccionar_prestamo(CTAPRES, SSEGURO,MODO){
            if (objUtiles.estaVacio(SSEGURO)){
               alert (objJsMessages.jslit_error_de_seleccion);
            }else{
               parent.f_aceptar_axisctr181(CTAPRES, SSEGURO,MODO);
            }
               
      }         
         
         
      function f_seleccionar_poliza(SSEGURO, NRIESGO, CTAPRES){
            var checkBoxRadioPoliza = document.getElementsByName("radioPoliza");
            objDom.setValorPorId("SSEGURO_CHK", SSEGURO);
            for (var i=0; i < checkBoxRadioPoliza.length; i++) {
                   if(checkBoxRadioPoliza[i].getAttribute("SSEGURO") == SSEGURO){
                         checkBoxRadioPoliza[i].checked = true;
                   }
            }
            if (objUtiles.estaVacio(SSEGURO) ){
                alert (objJsMessages.jslit_error_de_seleccion);
            }else{
                var qs="operation=ajax_busqueda_prestamos";
                qs=qs+"&SSEGURO="+SSEGURO;
                qs=qs+"&NRIESGO="+NRIESGO;
                qs=qs+"&CTAPRES="+CTAPRES;
                objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackajaxPrestamos, qs, this);
            }   
        }
        
     
        function callbackajaxPrestamos(ajaxResponseText){
            try{ 
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("miListaId");
                    var tr = objLista.obtenerFilasBodyLista("miListaId", tbody);                  
                    
                    objLista.borrarFilasDeLista ("miListaId", "8", '<axis:alt f="axisctr181" c="NOREG" lit="1000254"/>');
                    
                    if (objDom.existeTag(doc, "CTAPRES"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        
                        objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "CTAPRES") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(15);
                        var NPOLIZA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPOLIZA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0) : "";
                        var CTAPRES = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTAPRES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTAPRES"), i, 0) : ""; 
                        //ecg http://mantis.srvcsi.com/view.php?id=23252#c122310 tratamiendo de fechas formateadas para ajax
                        var FINIPREST   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINIPRESTformateado")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINIPRESTformateado"), i, 0) : "";
                        if (FINIPREST != "") {
                        		/*
                            if (!objUtiles.estaVacio(FINIPREST) && FINIPREST.length >= 10) {
                                var year  = FINIPREST.substring(0,2);
                                var month = FINIPREST.substring(3,);
                                var day   = FINIPREST.substring(6,10);
                                FINIPREST = day + "/" + month + "/" + year;
                            }
                            */
                        }
                        var FFINPREST   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFINPRESTformateado")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFINPRESTformateado"), i, 0) : "";
                        if (FFINPREST != "") {
                        	/*
                            if (!objUtiles.estaVacio(FFINPREST) && FFINPREST.length >= 10) {
                                var year  = FFINPREST.substring(0,4);
                                var month = FFINPREST.substring(5,7);
                                var day   = FFINPREST.substring(8,10);
                                FFINPREST = day + "/" + month + "/" + year;
                            }
                            */
                        }

                        var ICAPITAL   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPITAL")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("ICAPITAL"), i, 0) : "";
                        // BUG 22650-118888-20120726-JLTS-Se adiciona el campo ICAPPEND
                        var ICAPPEND   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ICAPPEND")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("ICAPPEND"), i, 0) : "";
                        var ITOTALPEND   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ITOTALPEND")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTALPEND"), i, 0) : "";
                            
                        var TPRODUC   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPRODUC")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPRODUC"), i, 0) : "";
                        var TPRODUC   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPRODUC")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPRODUC"), i, 0) : "";
                        var TESTADO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTADO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTADO"), i, 0) : "";     
                        var SSEGURO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "";     
                            
                        
                        var ttd=0;
                        <axis:visible c="NPOLIZA_LS" f="axisctr181">									
                        newtd[ttd] = objLista.addNumeroEnLista(NPOLIZA);ttd++;
                        </axis:visible>
                        newtd[ttd] = objLista.addNumeroEnLista(CTAPRES); ttd++; 
                        
                        <axis:visible c="FINIPREST_LS" f="axisctr181">
                        newtd[ttd] = objLista.addTextoEnLista(FINIPREST); ttd++;
                        </axis:visible>
                        <axis:visible c="FFINPREST_LS" f="axisctr181">
                        newtd[ttd] = objLista.addTextoEnLista(FFINPREST); ttd++;
                        </axis:visible>
                       <axis:visible c="ICAPITAL_LS" f="axisctr181">
                            newtd[ttd] = objLista.addTextoEnLista(ICAPITAL); ttd++;
                        </axis:visible>
                        // BUG 22650-118888-20120726-JLTS-Se adiciona el campo ICAPPEND_LS
                        <axis:visible c="ICAPPEND_LS" f="axisctr181">
	                        //cambio de ICAPPEND a ITOTALPEND newtd[ttd] = objLista.addTextoEnLista(ICAPPEND); ttd++;
	                        newtd[ttd] = objLista.addTextoEnLista(ITOTALPEND); ttd++;
                        </axis:visible>
                       <axis:visible c="TESTADO_LS" f="axisctr181">
                        newtd[ttd] = objLista.addTextoEnLista(TESTADO); ttd++;
                        </axis:visible>
                       <axis:visible c="TPRODUC_LS" f="axisctr181">
                        newtd[ttd] = objLista.addTextoEnLista(TPRODUC); ttd++;
                        </axis:visible>
                        /*
                        <axis:visible c="BT_EDIT_SINI" f="axisctr181">
                        newtd[ttd] = objLista.addImagenEnLista("javascript:f_seleccionar_prestamo('"+ CTAPRES +"','" + SSEGURO + "','" +"3" + "');",
                                    "0", "<axis:alt f="axisctr181" c="EDITAR" lit="100002" />", "<axis:alt f="axisctr181" c="EDITAR" lit="100002"/>", "images/lapiz.gif");ttd++;
                          </axis:visible>
                          */
                        <axis:visible c="BT_BUSCAR_SINI" f="axisctr181">
                        newtd[ttd] = objLista.addImagenEnLista("javascript:f_seleccionar_prestamo('"+ CTAPRES +"','" + SSEGURO + "','" +"2" + "');",
                                    "0", "<axis:alt f="axisctr181" c="DETALLE" lit="1000439" />", "<axis:alt f="axisctr181" c="DETALLE" lit="1000439" />", "images/mes.gif");ttd++;
                       
                        </axis:visible>
                           
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);
                    }
                    

                        
 
                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
       
           function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
                    //alert("Fin cargar productos");
            }      
            
             

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr181" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                        
                        f_cargar_cobjase();
                        f_cargar_actividades();

                }
            }       

      /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
            
        function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS");
            }
        }
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {            
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
         function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisctr181.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
          /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        function callbackAjaxOnblurCPOSTAL(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
					var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    
                    if (ban == 2){
                        objUtiles.abrirModal("axisper041", "src", "modal_axisper041.do?operation=form&CPOSTAL=" + document.getElementById("CPOSTAL").value);
                    }
                    else
                    {
                    // País
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        objDom.setVisibilidadPorId("findPoblacion", "visible");
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";                        
                    }
                    
                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";       
                    }
					
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
          function callbackajaxdireccion (ajaxResponseText){
            try{ 
                 //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objJsMessages.jslit_codigo_provincia_incorrecto +"</b>");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                            objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_cargar_actividades(){
                
                if (document.getElementById('CACTIVI')!=null){
                    //CCOMPANI
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     
                     if (!objUtiles.estaVacio (CRAMO) ){
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    
                    url ="operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                    
                    
                    if (document.miForm.CCOMPANI!=null){
                        if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
                            url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
                        }
                    }
                    
                    url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                    url += "&SPRODUC="+objDom.getValorComponente(document.miForm.SPRODUC);
                    
                    objAjax.invokeAsyncCGI("modal_axisctr181.do", callbackAjaxCargarActividades, url, this, objJsMessages.jslit_cargando);
                }
            }  
            function callbackAjaxCargarActividades (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("OB_IAX_PRODACTIVIDADES");
                    var CACTIVICombo = document.miForm.CACTIVI;     
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr181" c="CSITUAC" lit="108341"/> - ', CACTIVICombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CACTIVI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0);
                            var TITULO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TACTIVI"), 0, 0);
                            objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
                        }
                }
                if (!objUtiles.estaVacio(vcactivi)) {
                    document.miForm.CACTIVI.value = vcactivi; 
                    vcactivi = '';
                }
            } 
            
            function f_onchangeproductos(valor){
                if (!objUtiles.estaVacio(valor)){
                    f_cargar_cobjase();
                }else {
                    f_cargar_actividades();
                }
                
           }
		   
		function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
		
		function f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC){
            f_cerrar_modal("axisper041");
            objDom.setValorPorId("CPAIS", CPAIS);
            objDom.setVisibilidadPorId("findProvincia", "visible");
            document.getElementById("TPAIS_span").innerHTML = "<b>" + TPAIS + "</b>";
            
            objDom.setValorPorId("CPROVIN", CPROVIN);           
            objDom.setVisibilidadPorId("findPoblacion", "visible");
            document.getElementById("TPROVIN_span").innerHTML = "<b>" + TPROVIN + "</b>";
            
            objDom.setValorPorId("CPOBLAC", CPOBLAC);     
            document.getElementById("TPOBLAC_span").innerHTML = "<b>" + TPOBLAC + "</b>";
                    
        } 
        
// Fin código javascript
</script>

<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
			
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
            
<form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="radioSiniestro" value=""/>
            <!-- bug 0019238   -->
            <!-- <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>  -->
            <input type="hidden" name="tipo" id="tipo" value="PERMITE_PREST"/>    

            <input type="hidden" id="SSEGURO_CHK" name="SSEGURO_CHK" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axisctr181" c="FORMULARI" lit="9903063"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axisctr181" c="PRODUCTO" lit="9903063"/>
                </c:param>
                <c:param name="form">axisctr181</c:param>
            </c:import>
            
                        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!-- Situacion -->
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr181" c="DATOS_GENE" lit="103593"/>
                        </div>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:5%; height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                
                            </tr>
                            
                            <tr>
                                <!-- Ramo -->
                                <axis:ocultar f="axisctr181" c="CRAMO" dejarHueco="false"> 
                                <td class="titulocaja">
                                     <b><axis:alt f="axisctr181" c="RAMO" lit="100784"/></b>
                                
                                </td>
                                </axis:ocultar>
                                <!-- Sproduc -->
                                <axis:ocultar f="axisctr181" c="SPRODUC" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisctr181" c="PRODUCTOS" lit="100829"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Póliza -->
                                <axis:ocultar f="axisctr181" c="NPOLIZA" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisctr181" c="NPOLIZA" lit="9001514"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Certificado -->
                                <axis:ocultar f="axisctr181" c="NCERTIF" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisctr181" c="CERTIFICADO" lit="101300"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Siniestro -->
                                <axis:ocultar f="axisctr181" c="NSINIES" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axisctr181" c="CTAPRES" lit="9902871"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            
                                <!-- Ramo -->
                                                            
                                <axis:ocultar f="axisctr181" c="CRAMO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:100%;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr181" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                                      <!-- Producto -->
                                <axis:ocultar f="axisctr181" c="SPRODUC" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">  <axis:alt f="axisctr181" c="SELECCIONAR" lit="108341" />  </option>
                                        <c:forEach items="${__formdata.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Póliza -->
                                <axis:ocultar f="axisctr181" c="NPOLIZA" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NPOLIZA']}"
                                           name="NPOLIZA" id="NPOLIZA" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axisctr181" c="NPOLIZA" lit="9001514"/>'
                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>
                                <!-- Certificado -->
                                <axis:ocultar f="axisctr181" c="NCERTIF" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           id="NCERTIF" name="NCERTIF" size="15" style="width:100%;"
                                           value="${__formdata['NCERTIF']}"
                                           formato="entero"
                                           title='<axis:alt f="axisctr181" c="CERTIFICADO" lit="101300"/>'
                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>       
                                
                                
                                
                                <!-- Siniestro -->
                                <axis:ocultar f="axisctr181" c="CTAPRES" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['CTAPRES']}"
                                           name="CTAPRES" id="CTAPRES" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axisctr181" c="CTAPRES" lit="9902871"/>'/>
                                </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                           <axis:alt f="axisctr181" c="DATOS_PERSO" lit="110275"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <axis:ocultar f="axisctr181" c="NNUMIDE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr181" c="DOCUMENTO" lit="105330"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Nombre -->
                                <axis:ocultar f="axisctr181" c="BUSCAR" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr181" c="NOMBRE" lit="105940"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Identificador externo -->
                                <axis:ocultar f="axisctr181" c="SNIP" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr181" c="SNIP" lit="1000088"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr181" c="TIPOPERSONA" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="1"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '1' || empty __formdata['TIPOPERSONA']}">checked</c:if>/>
                                    <b><axis:alt f="axisctr181" c="TOMADOR" lit="101027"/>?</b>
                                </td>
                                </axis:ocultar>

                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <axis:ocultar f="axisctr181" c="NNUMIDE" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NNUMIDE']}"
                                           name="NNUMIDE" id="NNUMIDE"
                                           size="15"/>
                                </td>
                                </axis:ocultar>
                                <!-- Nombre -->
                                <axis:ocultar f="axisctr181" c="BUSCAR" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           name="BUSCAR" id="BUSCAR" size="15"
                                           value="${__formdata['BUSCAR']}"/>
                                </td>
                                </axis:ocultar>
                                <!-- Identificador externo -->
                                <axis:ocultar f="axisctr181" c="SNIP" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           name="SNIP" id="SNIP" size="15"
                                           value="${__formdata['SNIP']}"
                                           title='<axis:alt f="axisctr181" c="SNIP" lit="1000088"/>'/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr181" c="TIPOPERSONA" dejarHueco="false"> 
                                <td class="titulocaja">
                                    
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="2"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if>/>
                                    <b><axis:alt f="axisctr181" c="ASSEGURADO" lit="1000078"/></b>
                                </td>
                                </axis:ocultar>
                        
                            </tr>
                            <tr>
                                <td class="campocaja">                                    
                                </td>
                                <td class="campocaja">                                    
                                </td>
                                <td class="campocaja">                                    
                                </td>
                                <td class="titulocaja">          
                                <axis:visible f="axisctr181" c="RADIO_OTROS">
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="3"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '3'}">checked</c:if>/>
                                    <b><axis:alt f="axisctr181" c="RADIO_OTROS" lit="110031"></axis:alt></b>                                                                   
                                </axis:visible>
                                </td>
                            </tr>                            
                        </table>
                    </td>
                </tr>
                <!--Fi nova secció dades del risc -->
                <tr>
                   
                </tr>
                <!-- Lista de pólizas -->
                <tr>
                <axis:ocultar f="axisctr181" c="LST_POLIZAS" dejarHueco="false"> 
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr181" c="LISTADO_POLIZAS" lit="9001349"/>
                        </div>
                        <!-- Lista de pólizas -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <axis:alt f="axisctr181" c="NPOLIZA" lit="9001514"/>
                                    </c:set>
                                    <c:set var="title2">
                                        <axis:alt f="axisctr181" c="CTAPRES" lit="9902871"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axisctr181" c="DESC_RIESGO" lit="102524"/>
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt f="axisctr181" c="ESTAT_SINIS" lit="112259"/>
                                    </c:set>
                                    <c:set var="title5">
                                        <axis:alt f="axisctr181" c="DESC_PRODUCTO" lit="1000111"/>
                                    </c:set>
                                    <c:set var="title6">
                                        <axis:alt f="axisctr181" c="CPOLCIA" lit="9001766"/>
                                    </c:set>
                                    
                                    <c:set var="title7">
                                       <axis:alt f="axisctr181" c="TACTIVIDAD" lit="103481"></axis:alt>
                                    </c:set>
                                    
                                    <c:set var="title8">
                                       <axis:alt f="axisctr181" c="TAGENTE" lit="100584"></axis:alt>
                                    </c:set>
                                    
                                    <div class="seccion displayspaceGrande">
                                        <display:table name="${__formdata.AXIS_POLIZAS}"
                                                       id="miListaPolizas"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="4"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="modal_axisctr181.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column headerClass="headwidth5 sortable"
                                                            title=""
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcons">
                                                    <input type="radio"
                                                           onclick="f_seleccionar_poliza('${miListaPolizas.SSEGURO}','${miListaPolizas['NRIESGO']}','${miListaPolizas.CTAPRES}');"
                                                           <c:if test="${!empty __formdata.AXIS_POLIZAS && fn:length(__formdata.AXIS_POLIZAS) == 1}" >checked</c:if>
                                                           id="radioPoliza"
                                                           name="radioPoliza"
                                                           SSEGURO="${miListaPolizas.SSEGURO}"/>

                                                </div>
                                            </display:column>
                                            
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="NPOLIZA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                        ${miListaPolizas['NPOLIZA']}
                                                </div>
                                            </display:column>
                                           
                                            <axis:visible c="TNOMTOM" f="axisctr181"> 
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="TNOMTOM"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                        ${miListaPolizas['TNOMTOM']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TPRODUC_CAB" f="axisctr181"> 
                                            <display:column title="${title5}"
                                                            sortable="true"
                                                            sortProperty="TPRODUC"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                        ${miListaPolizas['TPRODUC']}
                                                    <!--/a-->
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TAGENTE_CAB" f="axisctr181"> 
                                            <display:column title="${title8}"
                                                            sortable="true"
                                                            sortProperty="TAGENTE"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                        ${miListaPolizas['TAGENTE']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        </display:table>
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXIS_POLIZAS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                        </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </axis:ocultar>
                </tr>
                                
                <!-- Listado de siniestros por poliza -->
                <!-- Lista de Siniestros por póliza -->
                <tr>
                <axis:ocultar f="axisctr181" c="LST_SINIESPOLIZAS" dejarHueco="false"> 
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr181" c="LISTADO_PRESTAMO" lit="9902872"/>
                        </div>
                        <!-- Lista de siniestros -->
                        <table class="seccion">                         
                            <tr>
                                <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <axis:alt f="axisctr181" c="NPOLIZA" lit="9001514"/>
                                    </c:set>
                                    <c:set var="title2">
                                        <axis:alt f="axisctr181" c="CTAPRES" lit="9902871"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axisctr181" c="FINIPREST" lit="9000526"/>
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt f="axisctr181" c="FFINPREST" lit="9000527"/>
                                    </c:set>
                                    <c:set var="title5">
                                        <axis:alt f="axisctr181" c="ICAPITAL" lit="9001933"/>
                                    </c:set>
                                    <c:set var="title6">
                                        <axis:alt f="axisctr181" c="ICAPPEND" lit="9904108"/>
                                    </c:set>
                                    <c:set var="title7">
                                        <axis:alt f="axisctr181" c="TESTADO" lit="100587"/>
                                    </c:set>
                                    <c:set var="title8">
                                        <axis:alt f="axisctr181" c="TPRODUC" lit="1000111"/>
                                    </c:set>
                                    <div class="seccion  displayspace">
                                        <display:table name="${__formdata.AXIS_PRESTAMOS}"
                                                       id="miListaId"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="modal_axisctr181.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                           
                                            <axis:visible c="NPOLIZA_LS" f="axisctr181"> 
                                            <display:column title="${title1}"
                                                            sortable="false"
                                                            sortProperty="NPOLIZA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                        ${miListaId['NPOLIZA']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <display:column title="${title2}"
                                                            sortable="false"
                                                            sortProperty="CTAPRES"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                        ${miListaId['CTAPRES']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            
                                            <axis:visible c="FINIPREST_LS" f="axisctr181">
                                                 <display:column title="${title3}"
                                                                sortable="false"
                                                                sortProperty="FINIPREST"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                            <fmt:formatDate value="${miListaId.FINIPREST}" pattern="dd/MM/yyyy"/>
                                                        </a>
                                                    </div>
                                                </display:column>
                                             </axis:visible>   
                                            
                                            <axis:visible c="FFINPREST_LS" f="axisctr181">
                                                <display:column title="${title4}"
                                                                sortable="false"
                                                                sortProperty="FFINPREST"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspDate">
                                                        <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                           <fmt:formatDate value="${miListaId.FFINPREST}" pattern="dd/MM/yyyy"/>
                                                        </a>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            
                                            <axis:visible c="ICAPITAL_LS" f="axisctr181">
                                                  <display:column title="${title5}"
                                                                sortable="false"
                                                                sortProperty="ICAPITAL"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                            <fmt:formatNumber value="${miListaId['ICAPITAL']}" pattern="${__formatNumberPatterns[CMONEDAPRO]}" />
                                                        </a>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible c="ICAPPEND_LS" f="axisctr181">
                                                  <display:column title="${title6}"
                                                                sortable="false"
                                                                sortProperty="ITOTALPEND"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                            <fmt:formatNumber value="${miListaId['ITOTALPEND']}" pattern="${__formatNumberPatterns[CMONEDAPRO]}" />
                                                        </a>
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            
                                            <axis:visible c="TESTADO_LS" f="axisctr181">
                                            <display:column title="${title7}"
                                                            sortable="false"
                                                            sortProperty="TESTADO"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                        ${miListaId['TESTADO_LS']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TPRODUC_LS" f="axisctr181">
                                            <display:column title="${title8}"
                                                            sortable="false"
                                                            sortProperty="TPRODUC"
                                                            headerClass="headwidth sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <a onclick="f_seleccionar_prestamo('${miListaId.CTAPRES}',  '${miListaId['SSEGURO']}')">
                                                        ${miListaId['TPRODUC']}
                                                    </a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            
                                            <axis:visible c="BT_BUSCAR_SINI" f="axisctr181">
                                            <display:column title=""
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcon">
                                                   <a href="javascript:f_but_riesgo()"><img border="0" alt="<axis:alt f="axisctr181" c="CONSULTA" lit="109142" />" title="<axis:alt f="axisctr181" c="CONSULTA" lit="109142" />" src="images/lapiz.gif"/></a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        </display:table>
                                         
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXIS_PRESTAMOS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                        </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </axis:ocultar>
                </tr>
            </table>
            
            <!-- Area campos -->
            
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar,buscar<axis:visible c="BT_ALTA" f="axisctr181">,9001816</axis:visible></c:param>
                <c:param name="f">axisctr181</c:param>

            </c:import>
            
</form>
<c:import url="../include/mensajes.jsp"/>
</body>



