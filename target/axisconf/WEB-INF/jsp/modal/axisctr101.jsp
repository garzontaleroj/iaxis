<%/* Revision:# s9LKraZGAmJSah85zRcgfg== # */%>
<%/*
*  Fichero: axisctr101.jsp
*
*  Detalle de Riesgo
*
*  Se accede a esta ventana modal desde la Axisctr100 : Simulacion
*
*  Los parámetros son los siguientes:
*  Sexo: CSEXPER 
*  Nombre, Apellido1 Apellido2 : TNOMBRE - TAPELLI1 - TAPELLI2
*  Documento: NNUMIDE
*  Tipo persona: CTIPIDE
*  Tipo Identidad : TIDENTI  --  CTIPPER
*
*
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Map"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
     <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    
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
    <script language="Javascript" type="text/javascript">
        function f_onload() { 
            
        	f_cargar_propiedades_pantalla();    
        	<c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr101');
					</c:if>
            
            var ok = "${__formdata.SEGUIR}";
            
            if (ok == "ok"){
                //f_but_aceptar2(2);
                f_aceptar_axisctr101();
            }else{
                //se vuelve a llamar a la funcion para que se vuelva a mostrar el mensaje.
                var avisos = "${PLSTAVISOS}";
                if (objUtiles.estaVacio(avisos)) {
                    var CPOBLAC=objDom.getValorPorId("CPOBLAC");
                    var CPROVIN=objDom.getValorPorId("CPROVIN");            
                    if (!objUtiles.estaVacio(CPROVIN)){
                        f_onchange_CPROVIN();
                    }
                    if (!objUtiles.estaVacio(CPOBLAC)){
                        f_onchange_CPOBLAC();
                    }
                }
            }
            var sperson = "${SPERSON}";
            
            var sperson2modify = "${__formdata.SPERSON2MODIFY}";            
            if (!objUtiles.estaVacio(sperson2modify)) {
                sperson2modify = "${SPERSON2MODIFY}";
            }
            document.miForm.SPERSON2MODIFY.value = sperson2modify;
           var recarga_persona = document.getElementById("recargar_persona");
           
            if (document.getElementById("but_buscar")!=null) {
                if (!objUtiles.estaVacio(sperson2modify)) {
                    objDom.setVisibilidadPorId("but_buscar", "hidden");
                  if(recarga_persona!=null){
                      objDom.setDisabledPorId("recargar_persona", false);
                  }   
                } 
                else {
                    objDom.setVisibilidadPorId("but_buscar", "visible");
                    if(recarga_persona!=null){
                        objDom.setDisabledPorId("recargar_persona", true);
                    }
                }
               
              var modoasegu = "${__formdata.CMODOASEGU}";
              if (!objUtiles.estaVacio(modoasegu)) {
                 if (modoasegu == "ALTA_ASEG_SIMUL") {
                   document.getElementById("TIDENTI").value= 1;
                   document.getElementById('TIDENTI').disabled = true;
                 }
              }
            }
            
            
         //formdataPAISDIRECC = '${__formdata.CPAIS_DIRECCION}';
        var formdataPAISDIRECC = document.miForm.CPAIS_DIRECCION.value;
       
         try{ 
                if (!objUtiles.estaVacio(formdataPAISDIRECC)){
                    if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAISDIRECC))){
                        objDom.setValorHTMLPorId("TPAIS_span", "<b>" +f_buscar_TPAIS(formdataPAISDIRECC)+"</b>");
                        var cprovin = '${__formdata.CPROVIN}';
                        var selected = '${axisctr100_selectedPerson}';
                        if(selected == "false" && objUtiles.estaVacio(cprovin)){
                            objDom.setVisibilidadPorId("findProvincia","visible");
                        }        
                    }
                }else {
                  objDom.setValorHTMLPorId("TPAIS_span", "<b></b>");
                  objDom.setValorPorId("CPOBLAC","");
                  objDom.setValorPorId("CPROVIN","");
                   
                }
                
                
	     //Bug 42197/235810 - 18/05/2016 - AMC   
             var vtidenti =  document.getElementById("TIDENTI").value;   
			 var vctipide =  document.getElementById("CTIPIDE").value; 
             
			 if (!objUtiles.estaVacio(vtidenti)&& objUtiles.estaVacio(vctipide) && objUtiles.estaVacio(sperson2modify)){
            	 f_actualitza_ctipper_ajax(vtidenti);
             }
                
         } catch (e) {alert(e.message)}
    
         //   f_cargar_propiedades_pantalla();
        }
        
        function f_but_cancelar() {
            // Limpiar axisctr_selectedGarantia de la sesión
            parent.f_cerrar_axisctr101();
            
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
        
      
      function test_PAIS_PROVIN_POBLAC() {
      var mensaje="";
         if (test_CPAIS_DIRECCION()!="" && test_CPOBLAC()!="" && test_CPROVIN())
            mensaje = test_CPAIS_DIRECCION() + "\n" + test_CPOBLAC() + "\n" + test_CPROVIN();
         else if (test_CPAIS_DIRECCION()!="" && test_CPROVIN())
            mensaje = test_CPAIS_DIRECCION() + "\n" + test_CPROVIN();
         else if (test_CPAIS_DIRECCION()!="" && test_CPOBLAC()!="" )
            mensaje = test_CPAIS_DIRECCION() + "\n" + test_CPOBLAC();            
         else if (test_CPAIS_DIRECCION()!="" )
            mensaje = test_CPAIS_DIRECCION();
         
         return mensaje;
        } 
        
        function test_CPAIS_DIRECCION() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            
            if (!objUtiles.estaVacio(CPAIS_DIRECCION)){
                if (isNaN(CPAIS_DIRECCION)) {
                    return "Campo <axis:alt f="axisctr101" c="CPAIS_DIRECCION" lit="100816" />: <axis:alt f="axisctr101" c="CPAIS_DIRECCION" lit="1000150" />";
                    
                }
            }
            return "";
        }
        
        function test_CPOBLAC() {
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            
            if (!objUtiles.estaVacio(CPOBLAC)){
                if (isNaN(CPOBLAC)) {
                    return "Campo <axis:alt f="axisctr101" c="CPOBLAC" lit="100817" />: <axis:alt f="axisctr101" c="CPOBLAC" lit="1000150" />";
                }
            }
            return "";
        }
        
        function test_CPROVIN() {
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            
            if (!objUtiles.estaVacio(CPROVIN)){
                if (isNaN(CPROVIN)) {
                    objDom.getValorPorId("CPROVIN").value="";
                    return "Campo <axis:alt f="axisctr101" c="CPROVIN" lit="100756" />: <axis:alt f="axisctr101" c="CPROVIN" lit="1000150" />";
                }
            }
            return "";
        }
        
          function f_onchange_CPAIS_DIRECCION() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            var test= test_CPAIS_DIRECCION();
            if (test!="") {
                alert(test);
                }
             else {
                if (!objUtiles.estaVacio(CPAIS_DIRECCION)){
                    var qs="operation=ajax_direccion";
                    qs=qs+"&op="+"CPAIS_DIRECCION";
                    qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                    qs=qs+"&dt="+(new Date().getTime())
                    objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
                } else {
                    objDom.setValorPorId("CPAIS_DIRECCION", "");
                    objDom.setValorHTMLPorId("TPAIS_span", "");
                    objDom.setVisibilidadPorId("findProvincia", "hidden");
                    limpiaCampos("CPAIS_DIRECCION");
                }
            }
        }
        function f_onchange_CPOBLAC() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            var test = test_CPOBLAC();
             if (test!="")
                alert(test);
            else {
            
            if (!objUtiles.estaVacio(CPROVIN) && !objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
             /* objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
                limpiaCampos("CPROVIN");
                document.getElementById("CPOBLAC").value="";
            }
            }
        }
        function f_onchange_CPROVIN() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS_DIRECCION");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            var test = test_CPROVIN();
             if (test!="")
                alert(test);
            else {
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
                document.getElementById("SEGUIR").value="ok";
            }
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS_DIRECCION", "");
                            limpiaCampos("CPAIS_DIRECCION");
                        }else{
                            objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS_DIRECCION");
                            }
                        }
                    }
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            if (document.miForm.isNew.value == "true"){
                                objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            }
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                  
                                    if (document.miForm.isNew.value == "true"){
                                     objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                     }
                                
                                limpiaCampos("CPAIS_RESIDENCIA");
                            }
                        }
                    }
                    
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                    
         
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
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
            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CERROR")[0])){
                document.getElementById("SEGUIR").value= "ko";
            }else{
                document.getElementById("SEGUIR").value= "ok";
            }
            
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }

         function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             window.scrollTo(0,0);
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
                
                if (document.miForm.isNew.value == "true"){
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
                }
                
                
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS_DIRECCION", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS_DIRECCION");
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
        
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
            
        }
      
        function f_but_aceptar() { 
         var mensaje="";
         
         mensaje = test_PAIS_PROVIN_POBLAC();
         if (mensaje!="")
            alert(mensaje);
         else {
            if (objValidador.validaEntrada()) {
                f_habilitar_campos();
                    f_but_aceptar2(1);
                 }
            }
        }

        function f_but_aceptar2(num) {    
        
                f_cargar_propiedades_pantalla();
            if (objValidador.validaEntrada()) {
            
                var vctipide = document.miForm.CTIPIDE.value;
                var vtidenti = document.miForm.TIDENTI.value;
                if (vctipide==null||vctipide==''||vctipide==<%= Integer.MIN_VALUE %>) vctipide = 0;
                if (vtidenti==null||vtidenti==''||vtidenti==<%= Integer.MIN_VALUE %>) vtidenti = 0;
                // primero validamos que todos los campos estén informados;
                
                var tnombre = document.miForm.TNOMBRE.value;
                var tnombre1 = document.miForm.TNOMBRE1.value;
                var tnombre2 = document.miForm.TNOMBRE2.value;
                var tapelli1 = document.miForm.TAPELLI1.value;
                var tapelli2 = document.miForm.TAPELLI2.value;
                var NORDEN = document.miForm.NORDEN.value;
                var CDOMICI = document.miForm.CDOMICI.value;
                var CPAIS = document.miForm.CPAIS_DIRECCION.value;
                var CPROVIN = document.miForm.CPROVIN.value;
                var CPOBLAC = document.miForm.CPOBLAC.value;
                var COCUPACION = document.miForm.COCUPACION.value;
                <!-- Bug 0027955/0152213 - JSV (05/09/2013) INI-->
                if (num==1) {
                 
                f_ajax_set_riesgo(tnombre,tnombre1,tnombre2,tapelli1,tapelli2,vctipide,vtidenti,
                                            document.miForm.CSEXPER.value,document.miForm.FNACIMI.value,
                                            document.miForm.NNUMIDE.value,document.miForm.SPERSON.value,NORDEN,CDOMICI,CPAIS,CPROVIN,CPOBLAC,COCUPACION,
                                            document.miForm.CESTCIV.value);
                } else {
                    if (num==2) {               
                        objUtiles.ejecutarFormulario("modal_axisctr101.do", "buscar_avisos", document.miForm, "_self",objJsMessages.jslit_cargando);                
                    }
                }
                <!-- Bug 0027955/0152213 - JSV (05/09/2013) FIN-->
                                            
            } 
        }
        
        function f_aceptar_axisctr101() {
            var vctipide = document.miForm.CTIPIDE.value;
            var vtidenti = document.miForm.TIDENTI.value;
            if (vctipide==null||vctipide==''||vctipide==<%= Integer.MIN_VALUE %>) vctipide = 0;
            if (vtidenti==null||vtidenti==''||vtidenti==<%= Integer.MIN_VALUE %>) vtidenti = 0;
            // primero validamos que todos los campos estén informados;
            
            var tnombre = document.miForm.TNOMBRE.value;
            var tnombre1 = document.miForm.TNOMBRE1.value;
            var tnombre2 = document.miForm.TNOMBRE2.value;
            var tapelli1 = document.miForm.TAPELLI1.value;
            var tapelli2 = document.miForm.TAPELLI2.value;
            var NORDEN = document.miForm.NORDEN.value;
            var CDOMICI = document.miForm.CDOMICI.value;
            var CPAIS = document.miForm.CPAIS_DIRECCION.value;
            var CPROVIN = document.miForm.CPROVIN.value;
            var CPOBLAC = document.miForm.CPOBLAC.value;
            var COCUPACION = document.miForm.COCUPACION.value;
             
            parent.f_aceptar_axisctr101(tnombre,tnombre1,tnombre2,tapelli1,tapelli2,vctipide,vtidenti,
                                            document.miForm.CSEXPER.value,document.miForm.FNACIMI.value,
                                            document.miForm.NNUMIDE.value,document.miForm.SPERSON.value,NORDEN,CDOMICI,CPAIS,CPROVIN,CPOBLAC,COCUPACION,
                                            document.miForm.CESTCIV.value);
        }
       
        
         <!-- Bug 0027955/0152213 - JSV (05/09/2013) INI-->
        function f_ajax_set_riesgo(nombre,nombre1,nombre2,ape1,ape2,ctipide,tidenti,csexper,fnacimi,fnif,sperson_anti,NORDEN,CDOMICI,CPAIS,CPROVIN,CPOBLAC,COCUPACION,CESTCIV) {
        
            if (objValidador.validaEntrada()) {
               
                   var qs="operation=ajax_set_riesgo";
                   qs=qs+"&TIPO=1";
                   qs=qs+"&TNOMBRE="+nombre;
                   qs=qs+"&TNOMBRE1="+nombre1;
                   qs=qs+"&TNOMBRE2="+nombre2;
                   qs=qs+"&TAPELLI1="+ape1;
                   qs=qs+"&TAPELLI2="+ape2;
                   qs=qs+"&CTIPIDE="+ctipide;
                   qs=qs+"&TIDENTI="+tidenti;
                   qs=qs+"&CSEXPER="+csexper;
                   qs=qs+"&FNACIMI="+fnacimi;
                   qs=qs+"&FNIF="+fnif;
                   qs=qs+"&SPERSON="+sperson_anti;
                   qs=qs+"&NORDEN="+NORDEN;
                   qs=qs+"&CDOMICI="+CDOMICI;
                   qs=qs+"&CPAIS="+CPAIS;
                   qs=qs+"&CPROVIN="+CPROVIN;
                   qs=qs+"&CPOBLAC="+CPOBLAC;
                   qs=qs+"&COCUPACION="+COCUPACION;
                   qs=qs+"&CESTCIV="+CESTCIV;
                   qs=qs+"&NNUMNIF="+fnif;
            
                   objAjax.invokeAsyncCGI("axis_axisctr100.do", callbackAjaxSetRiesgo, qs, this);
            }               
               
        }
        
        function callbackAjaxSetRiesgo(ajaxResponse) { 
            var doc = objAjax.domParse(ajaxResponse);
            
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                f_but_aceptar2(2);
            }                
        }
          <!-- Bug 0027955/0152213 - JSV (05/09/2013) FIN-->
          
         function f_habilitar_campos(){
            var selects = document.getElementsByTagName("select");
          
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
             
        }
        
        function f_but_buscar(){
            //llamar a funcion ajax para borrar el asegurado
            f_abrir_axisper001();
        }

        ///////////////// Gestionar ventana modal /////////////////////////
        function f_abrir_axisper001() {
            objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&ORIGEN=AXISCTR101");
        }
            
        function f_cerrar_axisper001() {
            objUtiles.cerrarModal("axisper001");
        }
            
        function f_aceptar_axisper001 (selectedPerson){
            document.miForm.SPERSON.value=selectedPerson;
            var sperson_antiguo = "${SPERSON2MODIFY}";
            
            if(sperson_antiguo==null||sperson_antiguo=="") {
                sperson_antiguo = "${__formdata.SPERSON2MODIFY}";
            }
            
            f_cerrar_axisper001();
            if(sperson_antiguo==null||sperson_antiguo=="") {
                objUtiles.ejecutarFormulario("modal_axisctr101.do", "buscar_datos_persona", document.miForm, "_self");
            } else {
                document.miForm.SPERSON2MODIFY.value = sperson_antiguo;
                objUtiles.ejecutarFormulario("modal_axisctr101.do", "modificar_datos_persona", document.miForm, "_self");
            }               
        }

        function f_actualitza_ctipper(CTIPPER) {
            formdataTIDENTI = '${__formdata.TIDENTI}';
            if ( CTIPPER != formdataTIDENTI) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisctr101.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_actualitza_ctipper_ajax(CTIPPER){
        	formdataTIDENTI = '${__formdata.TIDENTI}';
            if ( CTIPPER != formdataTIDENTI) {
            	objAjax.invokeAsyncCGI("modal_axisctr101.do", callbackAjaxActualitzaCtipper, "operation=ajax_actualitza_ctipper&TIDENTI=" + objDom.getValorComponente(document.miForm.TIDENTI), this, objJsMessages.jslit_cargando);
        
            }
        }    
        
        function callbackAjaxActualitzaCtipper (ajaxResponseText){  
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CATRIBU");
                
                var CTIPIDECombo = document.miForm.CTIPIDE;     
                objDom.borrarOpcionesDeCombo(CTIPIDECombo);
                objDom.addOpcionACombo('<%= Integer.MIN_VALUE %>', '- <axis:alt f="axisctr101" c="LIT_SELEC" lit="108341"/> - ', CTIPIDECombo, 0);
                for (i = 0; i < elementos.length; i++) {                           
                    var CATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CATRIBU"), i, 0);
                    var TATRIBU = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TATRIBU"), i, 0);                                     
                    
                    objDom.addOpcionACombo(CATRIBU, TATRIBU, CTIPIDECombo, i+1);
                }
            }
            
        }    
            
        
        
        
        ///////////////////// Fin ventana modal /////////////////////////// 
        
        ///////////////////// Borrar el riesgo antes de realizar un buscar ////
        
        function f_borrar_persona(obj){
            objAjax.invokeAsyncCGI("axis_axisctr101.do", callbackAjaxDeletePersona, "operation=ajax_borrar_persona&SPERSON="+document.miForm.SPERSON.value, obj, objJsMessages.jslit_borrando_registro);
        }
        
        function callbackAjaxDeletePersona(ajaxResponseText) {
            // Just DO IT
            /*try {                
                var doc=objAjax.domParse(ajaxResponseText);                 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            */
        }                    
        
        ///////////////////////////////////////////////////////////////////////
        function f_but_1000434() {
            f_but_cancelar();
        }       
        
        function f_but_9001141() {
            f_canviar_persona();
        }       
        
        function f_canviar_persona(){
            f_abrir_axisper001();
        }
        
        function  f_abrir_axisper005(faceptar, SPERSON) {
            // Si SPERSON está informado, quiere decir que modificamos una persona.
            // Si SPERSON == true, es una alta de nueva persona, invocada des de AXISPER001.
            
            if (objUtiles.estaVacio(faceptar))
                faceptar = "";
                
            if (typeof SPERSON == 'boolean') {
                // Alta
                SPERSON = "";
            } 
            objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=" + faceptar + "&SPERSON=" + SPERSON+"&ORIGEN=AXISCTR101");
        }
        function f_cerrar_axisper005(faceptar) {
            objUtiles.cerrarModal("axisper005");
            
            if (!objUtiles.estaVacio(faceptar)) 
                if (faceptar.indexOf("axisper001") > 0)
                    // Reabrir modal AXPER001 de nuevo
                    objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=" + faceptar);
        }
        
        function f_aceptar_axisper005 (faceptar, SPERSON) {
            
            document.miForm.SPERSON.value=SPERSON;
                       
            var sperson_antiguo = "${SPERSON2MODIFY}";
            
            if(sperson_antiguo==null||sperson_antiguo=="") {
                sperson_antiguo = "${__formdata.SPERSON2MODIFY}";
            }
            
            objUtiles.cerrarModal("axisper005");
            if(sperson_antiguo==null||sperson_antiguo=="") {
                objUtiles.ejecutarFormulario("modal_axisctr101.do", "buscar_datos_persona", document.miForm, "_self");
            } else {
                document.miForm.SPERSON2MODIFY.value = sperson_antiguo;
                objUtiles.ejecutarFormulario("modal_axisctr101.do", "modificar_datos_persona", document.miForm, "_self");
            }               
            
        }
        
    </script>
  </head>
    <body class=" " onload="f_onload()" >
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="respuestas" name="respuestas" value=""/>  
            <input type="hidden" name="SPERSON" id="SPERSON" value="${SPERSON}"/>
            <input type="hidden" name="SPERSON2MODIFY" id="SPERSON2MODIFY" value="${SPERSON2MODIFY}"/>
            <input type="hidden" name="TIPO" id="TIPO" value="${__formdata.TIPO}"/>
            <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
            <input type="hidden" name="axisctr100_selectedPerson" id="axisctr100_selectedPerson" value="${__formdata.axisctr100_selectedPerson}"/>
            <input type="hidden" id="CDOMICI" name="CDOMICI" value="${__formdata.CDOMICI}"/>
            <input type="hidden" id="SEGUIR" name="SEGUIR" value="${__formdata.SEGUIR}"/>
            <input type="hidden" id="CPAIS" name="CPAIS" value="${__formdata.CPAIS}"/>
            <input type="hidden" name="CMODOCOT" id="CMODOCOT" value="${__formdata.CMODOCOT}"/>
            
			
            <c:if test="${axisctr100_selectedPerson}">
                <input type="hidden" name="CTIPIDE" id="CTIPIDE" value="${__formdata.CTIPIDE}"/>
            </c:if> 
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><b id="label_DETALL_RISC_DER"><axis:alt f="axisctr101" c="DETALL_RISC_DER" lit="1000199" /></b></c:param>
                <c:param name="producto"><b id="label_DETALL_RISC_IZQ"><axis:alt f="axisctr101" c="DETALL_RISC_IZQ" lit="1000199" /></b></c:param>
                <c:param name="form">axisctr101</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr101" c="BUSCADOR" lit="1000235" /></c:param>
                <c:param name="nid" value="axisper001" />
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr101" c="TITULOaxisper005" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper005"/>
            </c:import>
            
            <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--Datos      -->
                         <div class="titulo" id="label_DADES_RISC"><img src="images/flecha.gif"/><axis:alt f="axisctr101" c="DADES_RISC" lit="1000100" /></div>
                        <table class="area" align="center">
                             <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            
                            <tr>
                                <axis:ocultar f="axisctr101" c="TIDENTI" dejarHueco="false">
                                    <!-- Tipo persona -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr101" c="TIDENTI" lit="102844" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="CTIPIDE" dejarHueco="false">
                                    <!-- Tipo Documento -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr101" c="CTIPIDE" lit="150996" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="NNUMIDE" dejarHueco="false">
                                    <!-- Documento  -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr101" c="NNUMIDE" lit="105330" /></b>
                                    </td>
                                </axis:ocultar>
                                 <!-- Sexo -->
                                 <axis:ocultar f="axisctr101" c="CSEXPER" dejarHueco="false">
                                <td class="titulocaja" id="tit_CSEXPER">
                                    <b><axis:alt f="axisctr101" c="CSEXPER" lit="100962" /></b>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisctr101" c="CESTCIV" dejarHueco="false">
                                <td class="titulocaja" id="tit_CESTCIV">
                                    <b><axis:alt f="axisctr101" c="CESTCIV" lit="9900955" /></b>
                                </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr101" c="TIDENTI" dejarHueco="false">
                                    <!-- Tipo persona -->
                                    <td class="campocaja"> 
                                       <select name = "TIDENTI" id ="TIDENTI" size="1" onchange="f_actualitza_ctipper(this.value)"  <axis:atr f="axisctr101" c="TIDENTI" a="modificable=true&isInputText=false"/> class="campowidthselect campo campotexto" <c:if test="${axisctr100_selectedPerson}">disabled</c:if> >
                                            <option value = "<%= Integer.MIN_VALUE %>" selected >-<axis:alt f="axisctr101" c="SINVALOR" lit="108341"/>-</option>
                                            <c:forEach var="tipoper" items="${axisctr100_comboTipoPer}">
                                                <option value = "${tipoper.CATRIBU}"
                                                     <c:if test="${tipoper.CATRIBU == __formdata.CTIPPER || tipoper.CATRIBU == __formdata.TIDENTI}">selected</c:if>> <!-- TIDENTI -->
                                                    ${tipoper.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="CTIPIDE" dejarHueco="false">
                                    <!-- Tipo documento -->
                                    <td class="campocaja">
                                        <select name = "CTIPIDE" id = "CTIPIDE"  <axis:atr f="axisctr101" c="CTIPIDE" a="modificable=true&isInputText=false"/> id ="CTIPIDE" size="1" onchange="" class="campowidthselect campo campotexto" <c:if test="${axisctr100_selectedPerson}">disabled</c:if> >
                                            <option value = "<%= Integer.MIN_VALUE %>" selected >-<axis:alt f="axisctr101" c="SINVALOR" lit="108341"/>-</option>
                                            <c:forEach var="documents" items="${axisctr100_comboTipoDocu}">
                                                <option value = "${documents.CATRIBU}"
                                                    <c:if test="${documents.CATRIBU == __formdata.CTIPIDE}">selected</c:if>>
                                                    ${documents.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>     
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="NNUMIDE" dejarHueco="false">
                                    <!-- Documento -->
                                    <td class="campocaja">
                                        <input type="text" class="campo campowidth campotexto" style="width:100%;" <axis:atr f="axisctr101" c="NNUMIDE" a="modificable=true&isInputText=false"/> id="NNUMIDE" name="NNUMIDE" size="15" 
                                        value="${__formdata.NNUMIDE}"  <c:if test="${axisctr100_selectedPerson}">readonly</c:if> />
                                      <%--    <c:if test="${axisctr100_selectedPerson}">
                                           <c:if test="${!SPERSON}">
                                            <img id="recargar_persona" alt="Substituir persona" title="Substituir persona" src="images/new.gif" onclick="f_but_buscar()" />
                                             </c:if>
                                        </c:if>--%>
                                    </td>  
                                </axis:ocultar>
                                <!-- Sexo -->
                                <axis:ocultar f="axisctr101" c="CSEXPER" dejarHueco="false">
                                <td class="campocaja" >
                                    <select name = "CSEXPER" id ="CSEXPER"  <axis:atr f="axisctr101" c="CSEXPER" a="obligatorio=true&modificable=true&isInputText=false"/> size="1" onchange="" class="campowidthselect campo campotexto" 
                                    <c:if test="${axisctr100_selectedPerson && (!empty(__formdata.CSEXPER) || !empty(__formdata.CMODOCOT))}"><axis:atr f="axisctr101" c="CSEXPER" a="obligatorio=false&modificable=false&isInputText=false"/></c:if> 
                                     title="<axis:alt f='axisctr101' c='CSEXPER' lit='100962'/>" style="width:50%">
                                        <option value = "<%= Integer.MIN_VALUE %>" selected >-<axis:alt f="axisctr101" c="SINVALOR" lit="108341"/>-</option>
                                        <c:forEach var="sexos" items="${axisctr100_comboSexo}">
                                            <option value = "${sexos.CATRIBU}"
                                                <c:if test="${sexos.CATRIBU == __formdata.CSEXPER}">selected</c:if> >
                                                ${sexos.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CESTCIV" f="axisctr101" dejarHueco="false">
                                <td class="campocaja" >
                                        <select name="CESTCIV" id="CESTCIV"  <axis:atr f="axisctr101" c="CESTCIV" a="modificable=true&isInputText=false&obligatorio=true"/> size="1" onchange="" class="campowidthselect campo campotexto" 
                                        <c:if test="${axisctr100_selectedPerson && !empty(__formdata.CESTCIV)}"><axis:atr f="axisctr101" c="CESTCIV" a="obligatorio=false&modificable=false&isInputText=false"/></c:if>                                         
                                        title="<axis:alt f='axisctr101' c='CESTCIV' lit='9900955'/>" style="width:40%">
                                            <option value="<%= Integer.MIN_VALUE %>" selected >-<axis:alt f="axisctr101" c="SINVALOR" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${axisctr100_comboEstados}">
                                                <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CESTCIV}">selected</c:if>>
                                                        ${element.TATRIBU} 
                                                 </option>
                                            </c:forEach>
                                        </select>
                                </td> 
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr101" c="TNOMBRE" dejarHueco="false">
                                    <!-- Nombre -->
                                    <td class="titulocaja" id="tit_TNOMBRE">
                                        <b id="label_TNOMBRE"><axis:alt f="axisctr101" c="TNOMBRE" lit="120168" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TNOMBRE1" dejarHueco="false">
                                    <!-- Nombre -->
                                    <td class="titulocaja" id="tit_TNOMBRE1">
                                        <b id="label_TNOMBRE1"><axis:alt f="axisctr101" c="TNOMBRE1" lit="120168" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TNOMBRE2" dejarHueco="false">
                                    <!-- Nombre -->
                                    <td class="titulocaja" id="tit_TNOMBRE2">
                                        <b id="label_TNOMBRE2"><axis:alt f="axisctr101" c="TNOMBRE2" lit="9902260" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TAPELLI1" dejarHueco="false">
                                    <!-- 1er Apellido -->
                                    <td class="titulocaja">
                                        <b id="label_TAPELLI1"><axis:alt f="axisctr101" c="TAPELLI1" lit="108243" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TAPELLI2" dejarHueco="false">
                                    <!-- 2º Apellido -->
                                    <td class="titulocaja" id="tit_TAPELLI2">
                                        <b id="label_TAPELLI2"><axis:alt f="axisctr101" c="TAPELLI2" lit="108246" /></b>
                                    </td>
                                </axis:ocultar>
                                <!-- Fecha de nacimiento -->
                                <axis:ocultar f="axisctr101" c="FNACIMI" dejarHueco="false">
                                <td class="titulocaja">
                                    <b id="label_FNACIMI"><axis:alt f="axisctr101" c="FNACIMI" lit="1000064" /></b>
                                </td>
                               </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr101" c="TNOMBRE" dejarHueco="false">
                                    <!-- Nombre -->
                                     <td class="campocaja" id="td_TNOMBRE">
                                        <input type="text" class="campowidthinput campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                        value="${__formdata.TNOMBRE}" <axis:atr f="axisctr101" c="TNOMBRE" a="modificable=true&isInputText=false"/>  <c:if test="${axisctr100_selectedPerson}">readonly</c:if> />
                                     </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TNOMBRE1" dejarHueco="false">
                                    <!-- Nombre -->
                                     <td class="campocaja" id="td_TNOMBRE1">
                                        <input type="text" class="campowidthinput campo campotexto" id="TNOMBRE1" name="TNOMBRE1" size="15"
                                        value="${__formdata.TNOMBRE1}" <axis:atr f="axisctr101" c="TNOMBRE1" a="modificable=true&isInputText=false"/>  <c:if test="${axisctr100_selectedPerson}">readonly</c:if> />
                                     </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TNOMBRE2" dejarHueco="false">
                                    <!-- Nombre -->
                                     <td class="campocaja" id="td_TNOMBRE2">
                                        <input type="text" class="campowidthinput campo campotexto" id="TNOMBRE2" name="TNOMBRE2" size="15"
                                        value="${__formdata.TNOMBRE2}" <axis:atr f="axisctr101" c="TNOMBRE2" a="modificable=true&isInputText=false"/>  <c:if test="${axisctr100_selectedPerson}">readonly</c:if> />
                                     </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TAPELLI1" dejarHueco="false">
                                    <!-- Apellido 1 -->
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr101" c="TAPELLI1" a="modificable=true&isInputText=false"/>  id="TAPELLI1" name="TAPELLI1" size="15"
                                        value="${__formdata.TAPELLI1}" <c:if test="${axisctr100_selectedPerson}">readonly</c:if>  />
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr101" c="TAPELLI2" dejarHueco="false">
                                    <!-- Apellido 2 -->
                                     <td class="campocaja" id="td_TAPELLI2">
                                        <input type="text" class="campowidthinput campo campotexto" id="TAPELLI2" name="TAPELLI2" size="15" <axis:atr f="axisctr101" c="TAPELLI2" a="modificable=true&isInputText=false"/> 
                                        value="${__formdata.TAPELLI2}"  <c:if test="${axisctr100_selectedPerson}">readonly</c:if> />
                                    </td>
                                </axis:ocultar>
                                <!-- Fecha naciemiento -->
                                <axis:ocultar f="axisctr101" c="FNACIMI" dejarHueco="false">
                                <td class="campocaja">
                                                <jsp:useBean id="today" class="java.util.Date" /> 
                                                <c:set var="fecha_nac"><fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/></c:set>
                                          
                                                <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr101" c="FNACIMI" a="modificable=true&obligatorio=true&formato=fecha"/>  id="FNACIMI" name="FNACIMI" size="15"
                                                value="${fecha_nac}" title="<axis:alt f='axisctr101' c='FNACIMI' lit='1000064'/>" style="width:50%" 
                                                <c:if test="${axisctr100_selectedPerson && (!empty(__formdata.FNACIMI) || !empty(__formdata.CMODOCOT))}">
                                                    <axis:atr f="axisctr101" c="FNACIMI" a="modificable=false&obligatorio=false&formato=fecha"/></c:if>
                                                />
                                                <c:if test="${__configform.axisctr101__FNACIMI__modificable != 'false'}">
                                                	<c:if test="${ empty(__formdata.FNACIMI)}">  <!-- Bug 42962/238521 && empty(__formdata.CMODOCOT)-->
                                                    <a style="vertical-align:middle;"><img 
                                                    id="popup_calendario_nacimiento" alt="<axis:alt f="axisctr101" c="SINVALOR" lit="108341"/>" title="<axis:alt f="axisctr101" c="FNACIMI" lit="1000064" />" src="images/calendar.gif"/></a>
                                                    </c:if>
                                                </c:if>
                                </td>
                                </axis:ocultar>
                                
                                
                            </tr>
                            <tr>
                                <td class="campocaja"></td>
                                <td class="campocaja"></td>
                                <td class="campocaja"></td>
                             </tr>     
                             <tr>
                             <axis:ocultar c="TOCUPACION" f="axisctr101" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr101" c="TOCUPACION" lit="9904804"/></b>
                                        </td>  
                                    </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar c="TOCUPACION" f="axisctr101" dejarHueco="false">
                                      <td class="campocaja" colspan="3">
                                            <select name="COCUPACION" id="COCUPACION" size="1" class="campowidthselect campo campotexto" style="width:90%;" 
                                                <axis:atr f="axisctr101" c="COCUPACION" a="obligatorio=true"/> title="<axis:alt f="axisctr101" c="TOCUPACION" lit="9904804"/>"
                                                 <c:if test="${axisctr100_selectedPerson && !empty(__formdata.COCUPACION)}">disabled obligatorio="false"</c:if>>&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper010" c="SNV_COMBO" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.lstProfesiones}">
                                                    <option value = "${element.CPROFES}" 
                                                    <c:if test="${element.CPROFES == __formdata.COCUPACION}"> selected </c:if> />
                                                        ${element.TPROFES} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                      </td>
                                      </axis:ocultar>
                            </tr>
                             <tr>
								<axis:ocultar f="axisctr101" c="CPAIS_DIRECCION" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr101" c="TPAIS" lit="100816"/></b>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr101" c="CPROVIN" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr101" c="TPROVIN" lit="100756"/></b>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr101" c="CPOBLAC" dejarHueco="false">
                                <td class="titulocaja">                                    
                                    <b><axis:alt f="axisctr101" c="TPOBLAC" lit="100817"/></b>
                                </td>
								</axis:ocultar>

                            </tr>
                             
                             <tr>
								<axis:ocultar f="axisctr101" c="CPAIS_DIRECCION" dejarHueco="false">
                                <td class="campocaja">
                                
                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.CPAIS_DIRECCION}" name="CPAIS_DIRECCION" id="CPAIS_DIRECCION" onchange="f_onchange_CPAIS_DIRECCION()" style="width:18%;" 
                                    title="<axis:alt f="axisctr101" c="CPAIS_DIRECCION" lit="100816"/>" <axis:atr f="axisctr101" c="CPAIS_DIRECCION" a="obligatorio=true"/>  <c:if test="${axisctr100_selectedPerson && (!empty(__formdata.CPAIS_DIRECCION) || !empty(__formdata.CMODOCOT))}"><axis:atr f="axisctr101" c="CPAIS_DIRECCION" a="modificable=false&obligatorio=false&formato=entero"/></c:if>/>&nbsp;
                                    <c:if test="${!axisctr100_selectedPerson}">
                                    <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    </c:if>
                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr101" c="CPROVIN" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                     title="<axis:alt f="axisctr101" c="CPROVIN" lit="100756"/>" <axis:atr f="axisctr101" c="CPROVIN" a="obligatorio=true"/>  <c:if test="${axisctr100_selectedPerson && !empty(__formdata.CPROVIN)}"><axis:atr f="axisctr101" c="CPROVIN" a="modificable=false&obligatorio=false&formato=entero"/></c:if>/>
                                    &nbsp;
                                    <img id="findProvincia" style="visibility:${(empty __formdata.CPAIS_DIRECCION || (axisctr100_selectedPerson && !empty(__formdata.CPROVIN)) ) ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS_DIRECCION.value)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                </axis:ocultar>
								<axis:ocultar f="axisctr101" c="CPOBLAC" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                    title="<axis:alt f="axisctr101" c="CPOBLAC" lit="100817"/>"
                                       <axis:atr f="axisctr101" c="CPOBLAC" a="obligatorio=true"/> <c:if test="${axisctr100_selectedPerson  && !empty(__formdata.CPOBLAC)}"><axis:atr f="axisctr101" c="CPOBLAC" a="modificable=false&obligatorio=false&formato=entero"/></c:if>/>
                                    &nbsp;<img id="findPoblacion" style="visibility:${(empty __formdata.CPROVIN || (axisctr100_selectedPerson && !empty(__formdata.CPOBLAC))) ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value,null)"/>                
                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td>
								</axis:ocultar>
                             
                             </tr>
                             
                        </table>
                        <!-- Fin datos -->
                    </td>
                </tr>
                
                <tr>

                 </tr>                
            </table>
            
            
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr101</c:param>
                <c:param name="f">axisctr101</c:param>
                <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axisctr101">cancelar</axis:visible><axis:visible c="BT_BUSCARx" f="axisctr101">,buscar</axis:visible><axis:visible c="BT_CONTINUAR" f="axisctr101">,1000434</axis:visible><axis:ocultar c="BUT_CANVIARPERSONA" f="axisctr101" dejarHueco="false"><c:if test="${!empty SPERSON}">,9001141</c:if></axis:ocultar><axis:visible c="BT_ACEPTAR" f="axisctr101">,aceptar</axis:visible></c:param>
            </c:import>
        </form>
        
        <c:import url="../include/mensajes.jsp" />
        
        <c:if test="${__configform.axisctr101__FNACIMI__modificable != 'false'}">
            <c:if test="${empty(__formdata.FNACIMI)}"> <!-- Bug 42962/238521 && empty(__formdata.CMODOCOT)-->
                <script type="text/javascript">
                   
                    Calendar.setup({
                        inputField     :    "FNACIMI",    
                        ifFormat       :    "%d/%m/%Y",     
                        button         :    "popup_calendario_nacimiento",  
                        singleClick    :    true,
                        firstDay       :    1
                    });
                </script>
            </c:if>
        </c:if>
      </div>
    </body>
</html>
