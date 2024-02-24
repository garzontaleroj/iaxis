<%/* Revision:# T6Lr0cYtfkT/6JYyuRVcIQ== # */%>
<%-- 
*  Fichero: axisfic002.jsp
*  @author <a href = "mailto:erhernandez@csi-ti.com">Edgar Hernandez</a>
*
*  Fecha: 12/07/2016
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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
      <!-- Idioma del calendario, en funci�n del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** --> 
	
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function soloLetrasNumeros(e){
	       key = e.keyCode || e.which;
	       tecla = String.fromCharCode(key).toLowerCase();
	       letras = " �����abcdefghijklmn�opqrstuvwxyz1234567890";
	       especiales = "8-37-39-46";
	
	       tecla_especial = false
	       for(var i in especiales){
	            if(key == especiales[i]){
	                tecla_especial = true;
	                break;
	            }
	        }
	
	        if(letras.indexOf(tecla)==-1 && !tecla_especial){
	            return false;
	        }
	 }
        
        function f_onload_axisfic002() {
            <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisfic002');
			</c:if>
			f_cargar_propiedades_pantalla();
            revisarEstilos();
            var resultado = '${requestScope.resultado}';
            if (!objUtiles.estaVacio(resultado) && resultado == "0"){
                parent.f_aceptar_axisfic002();  
            }
            
            formdataPAIS = '${__formdata.CPAIS}';
            if(objUtiles.estaVacio(formdataPAIS)){
                formdataPAIS = '${__configform.axisfic002__CPAIS__valordefecto}';
            }
            
            if (!objUtiles.estaVacio(formdataPAIS)){
	            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
	                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
	            }
         	}
         	
         	var formdataCCIIU = '${__formdata.CCIIU}';
         	 if (!objUtiles.estaVacio(formdataCCIIU)){
	              f_onchange_CIIU();
         	}
		//  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona condici�n ERRACEPTAR
  			if( '${__formdata.ERRACEPTAR}' != "") {
				alert('${__formdata.ERRACEPTAR}');
				//limpiaCampos("CFOTORUT");
				//limpiaCampos("FRUT");
			}
                //  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
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
            
               
        function f_but_salir() {
    		objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
    	}
        
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
	            try { document.axisfic002Form.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
	            try { document.axisfic002Form.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
	            try { document.axisfic002Form.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
	            formdataCMODO = '${__formdata.CMODO}';
	            if (!objUtiles.estaVacio(formdataCMODO) && formdataCMODO != "1"){
	                objUtiles.ejecutarFormulario("modal_axisfic002.do", "aceptar", document.axisfic002Form, "_self", objJsMessages.jslit_cargando);  
	            }else{
	            	f_but_cancelar();
	            }  
            }
        }
        
        function f_but_cancelar() {        
            revisarEstilos();
            parent.f_cerrar_axisfic002();
        }                
        
        function f_but_salir() {
        	revisarEstilos();
        	parent.f_cerrar_axisfic002();
        }
        
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.axisfic002Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisfic002.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
         if(entrada.value.length>0){
           entrada.value=jDate.formateaFecha(entrada.value);
               
             if(jDate.validaFecha(entrada.value)){
                 entrada.value=jDate.formateaFecha(entrada.value);
             }else{
                 alert("<axis:alt f="axisfic002" c="ALER_ERR" lit="1000421"/>");
             }
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
					
                    // Pa�s
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
                    
                    // 34989/209710 - Autopoblar el campo TNOMVIA.
                    // Poner en el campo "Street name" lo mismo que se est� colocando din�micamente
                    // en el campo TPOBLAC_span.  Esto se debe realizar solo si el par�metro
                    // pautocalle es 1.
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";

                        if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("PAUTOCALLE")[0]) ) {
                            if(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PAUTOCALLE"), 0, 0) == 1){
                                document.getElementById("TNOMVIA").value =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0);
                            }
                        }
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";    
                        document.getElementById("TNOMVIA").value = "";
                    }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
      
      function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPAIS';
                objAjax.invokeAsyncCGI("modal_axisfic002.do", callbackajaxdireccion, qs, this, null, origen)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                objDom.setVisibilidadPorId("findPoblacion2", "hidden");
                limpiaCampos("CPAIS");
            }
        }
        
        function f_onchange_CIIU() {
            var CIIU=objDom.getValorPorId("CCIIU");
            if (!objUtiles.estaVacio(CIIU)){
                var qs="operation=ajax_ciiu";
                qs=qs+"&CIIU="+CIIU;
                var origen = 'CIIU';
                objAjax.invokeAsyncCGI("modal_axisfic002.do", callbackajaxciiu, qs, this, null, origen)
            } 
        }
      
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPOBLAC="+CPOBLAC;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPOBLAC';
                objAjax.invokeAsyncCGI("modal_axisfic002.do", callbackajaxdireccion, qs, this, null, origen)
            } else {
                objDom.setValorPorId("CPOBLAC", "");
                objDom.setValorHTMLPorId("TPOBLAC_span", "");
                limpiaCampos("CPOBLAC");
            }
        }
        
        function f_onchange_CPROVIN() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPROVIN';
                objAjax.invokeAsyncCGI("modal_axisfic002.do", callbackajaxdireccion, qs, this, null, origen)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText,origen){
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
                           
                            if(${ __formdata.sin_provincias == 1 } ){
                                
                                objDom.setVisibilidadPorId("findPoblacion2","visible");
                                
                            }
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
                }else{
                    //Si ha habido errores en la recepci�n de alg�n cambio limpiaremos los que dependen de �l
                    if(origen == 'CPAIS'){
                            limpiaCampos("CPAIS");
                            objDom.setVisibilidadPorId("findProvincia", "hidden");
                            objDom.setValorHTMLPorId("TPAIS_span", "");
                    }
                    
                    if(origen == 'CPROVIN'){
                            limpiaCampos("CPROVIN");
                            objDom.setVisibilidadPorId("findPoblacion", "hidden");
                            objDom.setValorHTMLPorId("TPROVIN_span", "");
                    }
                    
                    if(origen == 'CPOBLAC'){
                            objDom.setValorHTMLPorId("TPOBLAC_span", "");
                    }
                
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function callbackajaxciiu (ajaxResponseText,origen){
            try{ 
            
                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CIIU")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CIIU", "");
                            objDom.setValorHTMLPorId("TCCIIU_span", "<b></b>");
                            limpiaCampos("CIIU");
                           
                        }else{
                        
                        	
                            objDom.setValorPorId("CIIU", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CIIU"), 0, 0));
                           
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TCIIU")[0])){
                            
                                objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCIIU"), 0, 0) + "</b>");
                                
                                limpiaCampos("CIIU");
                            }
                        }
                    }
                    }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
       function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
            objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
             "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
       }
       
       function f_abrir_axisciiu001(CODIGO, LITERAL){
            objUtiles.abrirModal("axisciiu001", "src", "modal_axisciiu001.do?operation=form&CODIGO=" + CODIGO +"&LITERAL=" + LITERAL);
       }
       
       function f_aceptar_axisciiu001(CODIGO, TEXTO){
           f_cerrar_axisciiu001();
           if (!objUtiles.estaVacio(TEXTO)){
           
               objDom.setValorPorId("CCIIU", CODIGO);
               objDom.setValorHTMLPorId("TCCIIU_span", "<b>" + TEXTO + "</b>");
            }else{   
               limpiaCampos("CCIIU");
            }
        }   
       
       function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA,CPROVIN){
           f_cerrar_axiscom001();
           if (!objUtiles.estaVacio(TEXTO))
               TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
           if (CODIGO_CONSULTA == "LISTA_PAIS") {
               objDom.setValorPorId("CPAIS", CODIGO);
               objDom.setVisibilidadPorId("findProvincia", "visible"); 
               
               if(${ __formdata.sin_provincias == 1 } ){
                   objDom.setVisibilidadPorId("findPoblacion2", "visible");    
               }
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
               
           }  else if (CODIGO_CONSULTA == "LISTA_POBLACION_NOPROV") {
               objDom.setValorPorId("CPOBLAC", CODIGO);
               objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
                if(${ __formdata.sin_provincias == 1 } ){
                   //alert(CPROVIN);
                   objDom.setValorPorId("CPROVIN", CPROVIN);
               }
           }
       }
       
       function f_cerrar_axiscom001() {
           objUtiles.cerrarModal("axiscom001");
       }        
        
       function f_cerrar_axisciiu001() {
           objUtiles.cerrarModal("axisciiu001");
       }    
        
       /****************************************************************************************/
       /************************************** AXISPER025****************************************/
       /****************************************************************************************/    
            function f_abrir_axisper025(selectedPerson) {
            	formdataCAGENTE = '${__formdata.CAGENTE}';
                objUtiles.abrirModal("axisper025", "src", "modal_axisper025.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+formdataCAGENTE+"&CTIPPER=1");   
                
             }  	
       
           function f_aceptar_axisper025(selectedPerson){
               f_cerrar_axisper025();
               objUtiles.ejecutarFormulario("modal_axisfic002.do", "form", document.axisfic002Form, "_self", objJsMessages.jslit_cargando);
           }
           function f_cerrar_axisper025(){
           
               objUtiles.cerrarModal("axisper025");
           }
         
           function f_borrar_persona_rel(SPERSON_REL,selectedPerson,selectedAgente) {
               var answer = confirm(objJsMessages.jslit_confirma_borrar);
               if (answer)         
                 objUtiles.ejecutarFormulario("modal_axisfic002.do.do?subpantalla=masdatos&SPERSONSelected="+selectedPerson+"&SPERSON_REL=" + SPERSON_REL+"&CAGENTEselected="+selectedAgente, "eliminarPERREL", document.miForm, "_self", objJsMessages.jslit_cargando);   
           }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
       function limpiaCampos (CAMPO){
           if(objUtiles.utilEquals(CAMPO, "CPAIS")){
               //Limpio prov�ncia
               objDom.setValorPorId("CPROVIN", "");
               objDom.setValorHTMLPorId("TPROVIN_span", "");
               
               objDom.setVisibilidadPorId("findPoblacion", "hidden");
           }
           
           if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
               objUtiles.utilEquals(CAMPO, "CPROVIN")){
                   //Limpio poblaci�n
                   objDom.setValorPorId("CPOBLAC", "");
                   objDom.setValorHTMLPorId("TPOBLAC_span", "");
           }
	   //  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona campo CFOTORUT
           if(objUtiles.utilEquals(CAMPO, "CFOTORUT")) {
        	 //Limpio FRUT
               objDom.setValorPorId("FRUT", "");
               objDom.setValorHTMLPorId("CFOTORUT", "0");
           }
       }   //  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
		
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
		
		function f_aceptar_axisper042(CPOSTAL){
			f_cerrar_modal("axisper042");
			objDom.setValorPorId("CPOSTAL", CPOSTAL);
			document.axisfic002Form.CPOSTAL.focus();            
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
		
		/****************************************************************************************/
        /************************************** VARIOS****************************************/
        /****************************************************************************************/           
        function f_consultar_per_rel (selectedPerson,selectedAgente){
            document.miForm.CAGENTE.value = selectedAgente;
            SPERSON = "${dades_persona.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisfic002.do?SPERSON_AUX="+selectedPerson+"&SPERSON="+SPERSON, "consultarPerRel", document.miForm, "_self", objJsMessages.jslit_cargando);
        } 
		
         
        function f_actualiza_frut()
        {      
            //alert("Antes de la recarga axisfic002");
            f_cargar_propiedades_pantalla(); 
            
        }
        // INI CP0023M_SYS_PERS_val  - JLTS - 19/11/2018 -- Se adiciona la funci�n f_onlyletters
		function f_onlyletters(t) {
			if (t.value.match(/[^A-Z \u00f1\u00d1]/g))  {
				alert("<axis:alt f='axisper008' c='ERRORNUM' lit='9907933'/>");
				t.value = t.value.replace(/[^A-Z \u00f1\u00d1]/g, '');
			}
		}
		// FIN CP0023M_SYS_PERS_val  - JLTS - 19/11/2018 -- Se adiciona la funci�n f_onlyletters
		
		function pag(pagina){
				window.open(pagina, '_blank');
			}
		
    </script>  
    
    <style type="text/css">
		
		.link {
		    color: #0033FF;
		    text-decoration: underline;
		    cursor:pointer;
		    text-align: left;
		}
	</style>

  </head>
  <body onload="f_onload_axisfic002()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisciiu001|axisciiu001</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
	<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisfic002" c="MODPER025" lit="9902250"/>
      </c:param>
      <c:param name="nid" value="axisper025"/>
    </c:import>
	 
    <form name="axisfic002Form" action="modal_axisfic002.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CMODO" value="${__formdata.CMODO}"> 
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="SFINANCI" value="${__formdata.SFINANCI}"/>
	<!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona NMOVIMI -->
        <input type="hidden" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
	<!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
        <input type="hidden" name="CDOMICI"  value="${__formdata.CDOMICI}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
    <!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
        <input type="hidden" name="CTIPPER"  value="${__formdata.CTIPPER}"/>
    <!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER -->
        <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
	<!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona ERRACEPTAR -->
        <input type="hidden" name="ERRACEPTAR" id="ERRACEPTAR" value="${sessionScope.ERRACEPTAR}"/>
	<!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
        <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />  
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfic002" c="formulario" lit="9902028" /></c:param>
            <c:param name="producto"><axis:alt f="axisfic002" c="producto" lit="9902028" /></c:param>
            <c:param name="form">axisfic002</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                    	<tr>
			               <th style="width:20%;height:0px"></th>
                           <th style="width:20%;height:0px"></th>
                           <th style="width:20%;height:0px"></th>
                           <th style="width:20%;height:0px"></th>
                           <th style="width:20%;height:0px"></th>
                       	</tr> 
                       	<tr>         
                       	     
                           <axis:visible f="axisfic002" c="FCCOMER">
                             <td class="titulocaja" id="LIT_FCCOMER" colspan="1">
                               <b><axis:alt f="axisfic002" c="FCCOMER" lit="9909140"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="CFOTORUT">
                             <td class="titulocaja" id="LIT_CFOTORUT" colspan="1">
                               <b><axis:alt f="axisfic002" c="CFOTORUT" lit="9909085"/></b>
                             </td>
                           </axis:visible>   
                           
                    
                           
	                         <td class="titulocaja" colspan="1">
	                           <b id="label_FRUT"><axis:alt f="axisfic002" c="LIT_FRUT" lit="9909086"/></b>
	                         </td>
	                       
		                           
                           
                           <axis:visible f="axisfic002" c="TTITULO">
                             <td class="titulocaja" id="LIT_TTITULO" colspan="2">
                               <b><axis:alt f="axisfic002" c="TTITULO" lit="9909087"/></b>
                             </td>
                           </axis:visible>
                                        
                        </tr> 
                        <tr>
                        
                           <axis:visible f="axisfic002" c="FCCOMER" >
                               <td class="campocaja" colspan="1">
                                 <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona condicion de readonly con FCCOMER -->
								 <!-- INI - 15905 - CJAD - 19/07/2021 - Campo fecha de camara de comercio  -->
                                  <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisfic002" c="FCCOMER"  a="&formato=fecha"/>  alt="<axis:alt f="axisfic002" c="FCCOMER" lit="9909140"/>" title="<axis:alt f="axisfic002" c="FCCOMER"   lit="9909140"/>"
                                         name="FCCOMER" id="FCCOMER"  value="<fmt:formatDate value="${__formdata.FCCOMER}" pattern="dd/MM/yyyy" />" style="width:90%;" <c:if test="${__formdata.FCCOMER == '1'}"> readonly="readonly"</c:if> class="campowidthinput campo campotexto"/>
                                           <axis:visible c="ICO_FCCOMER" f="axisfic002">
                                                <a id="icon_FCCOMER" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic002" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic002" c="ICO_FCCOMER" lit="9909140" />" src="images/calendar.gif"/></a>
                                           </axis:visible>
								<!-- FIN - 15905 - CJAD - 19/07/2021 - Campo fecha de camara de comercio  -->
                                <!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
                               </td>
                           </axis:visible>
                           
                           <axis:visible f="axisfic002" c="CFOTORUT" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CFOTORUT" id="CFOTORUT" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                           				onchange="f_actualiza_frut()"
                                        title="<axis:alt f="axisfic002" c="CFOTORUT" lit="9909085"/>"
                                        <axis:atr f="axisfic002" c="CFOTORUT" />
                                        <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp;<!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic002" c="C_CFOTORUT" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstSiNo}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CFOTORUT}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                              </td>
                          </axis:visible> 
                          
                          
                               <td class="campocaja" colspan="1">
                                  <input type="text"  onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisfic002" c="FRUT" a="&formato=fecha"/>  alt="<axis:alt f="axisfic002" c="FRUT" lit="9909140"/>" title="<axis:alt f="axisfic002" c="FRUT" lit="9909086"/>"
                                         name="FRUT" id="FRUT"  value="<fmt:formatDate value="${__formdata.FRUT}" pattern="dd/MM/yyyy" />" style="width:90%;" class="campowidthinput campo campotexto"/>
					 <!--  INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se adiciona condicion FRUT -->
                                         <c:if test="${__formdata.FRUT == null}">
                                         <axis:ocultar c="ICO_FRUT" f="axisfic002">
                                                <a id="icon_FRUT" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic002" c="SELECT" lit="108341"/>"  title="<axis:alt f="axisfic002" c="ICO_FRUT" lit="9909086" />" src="images/calendar.gif"/></a>
                                         </axis:ocultar>
                                         </c:if>
					 <!--  FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019 -->
                               </td>
                        
                          
                          <axis:visible f="axisfic002" c="TTITULO" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		 
                                 		value="${__formdata.TTITULO}" name="TTITULO" id="TTITULO" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909087" lit="9909087"/>"
                                        <axis:atr f="axisfic002" c="TTITULO" />/>        
                               </td>
                          </axis:visible>                                          
                        </tr> 
                        <tr>         
                       	     
                           <axis:visible f="axisfic002" c="CFOTOCED">
                             <td class="titulocaja" id="LIT_CFOTOCED" colspan="1">
                               <b><axis:alt f="axisfic002" c="CFOTOCED" lit="9909088"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="FEXPICED">
                             <td class="titulocaja" id="LIT_FEXPICED" colspan="1">
                               <b><axis:alt f="axisfic002" c="FEXPICED" lit="9909089"/></b>
                             </td>
                           </axis:visible>
                           
                                                               
                          	 <td class="titulocaja">
                                <b><axis:alt f="axisfic002" c="CPAIS" lit="100816"/></b>
                             </td>
                            
                             <td class="titulocaja">
                                <b><axis:alt f="axisfic002" c="CPROVIN" lit="100756"/></b>
                             </td>
                            
                             <td class="titulocaja">                                    
                                <b><axis:alt f="axisfic002" c="CPOBLAC" lit="100817"/></b>
                             </td>
                             
                         </tr>   
                         <tr>
                         
                          <axis:visible f="axisfic002" c="CFOTOCED" >
                               <td class="campocaja" colspan="1">  
			                    <!-- INI IAXIS-7751 -JLTS - 25/02/2020 - Se adiciona el onchange -->     
                           		<select name="CFOTOCED" id="CFOTOCED" size="1" class="campowidthselect campo campotexto" style="width:90%;" onchange="f_cargar_propiedades_pantalla();"
                                        title="<axis:alt f="axisfic002" c="CFOTOCED" lit="9909088"/>" 
                                        <axis:atr f="axisfic002" c="CFOTOCED" />
                                        <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp;<!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic002" c="C_CFOTOCED" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstSiNo}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CFOTOCED}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                                <!-- FIN IAXIS-7751 -JLTS - 25/02/2020 -->
                              </td>
                          </axis:visible>
                          
                          <axis:visible f="axisfic002" c="FEXPICED" >
                               <td class="campocaja" colspan="1">
                                  <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisfic002" c="FEXPICED" />  alt="<axis:alt f="axisfic002" c="FEXPICED" lit="9909089"/>" title="<axis:alt f="axisfic002" c="FEXPICED" lit="9909089"/>"
                                         name="FEXPICED" id="FEXPICED"  value="<fmt:formatDate value="${__formdata.FEXPICED}" pattern="dd/MM/yyyy" />" style="width:90%;" class="campowidthinput campo campotexto"/>
                                           <axis:visible c="ICO_FEXPICED" f="axisfic002">
                                                <a id="icon_FEXPICED" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic002" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic002" c="ICO_FEXPICED" lit="9909089" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible>
        
                           <axis:ocultar c="CPOSTAL" f="axisfic002" dejarHueco="false">
                            <td class="campocaja" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" 
                                size="15" <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                value="${__formdata.CPAIS}<c:if test="${empty __formdata.CPAIS}">${__configform.axisfic002__CPAIS__valordefecto}</c:if>" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()"
                                style="width:18%;" 
                                        title="<axis:alt f="axisfic002" c="CPAIS" lit="100816"/>"
                                        <axis:atr f="axisfic002" c="CPAIS"/>/>
                                        &nbsp;<%-- <c:if test="${__formdata.CMODO != '1'}"> --%>  <!-- POST-123 -->
                                        <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/><%-- </c:if> --%>
                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                            </td>
                           </axis:ocultar> 
                            <axis:ocultar c="CPROVIN" f="axisfic002" dejarHueco="false">
                            <td class="campocaja" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                	   value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  
                                       title="<axis:alt f="axisfic002" c="CPROVIN" lit="100756"/>"
                                       <axis:atr f="axisfic002" c="CPROVIN" />/>
                                &nbsp;<%-- <c:if test="${__formdata.CMODO != '1'}">  --%> <!-- POST-123 --><img id="findProvincia" style="visibility:${empty __formdata.CPAIS && empty __configform.axisfic002__CPAIS__valordefecto ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisfic002Form.CPAIS.value)"/><%-- </c:if> --%>                
                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                            </td>
                            </axis:ocultar>
                            <td class="campocaja" colspan="1">
                                <input type="text" class="campowidthinput campo campotexto" size="15" <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                	   value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                       title="<axis:alt f="axisfic002" c="CPOBLAC" lit="100817"/>"
                                       <axis:atr f="axisfic002" c="CPOBLAC" />/>
                                &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN  ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisfic002Form.CPROVIN.value, '')"/>
                               <c:if test='${ __formdata.sin_provincias == 1}'> &nbsp;<img id="findPoblacion2" style="visibility:hidden;cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.axisfic002Form.CPAIS.value, document.axisfic002Form.CPAIS.value)"/></c:if>                
                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                            </td>
                            
                        </tr>
                        <tr>         
                       	     
                           <axis:visible f="axisfic002" c="TINFOAD">
                             <td class="titulocaja" id="LIT_TINFOAD" colspan="2">
                               <b><axis:alt f="axisfic002" c="TINFOAD" lit="9909090"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="CCIIU">
                             <td class="titulocaja" id="LIT_CCIIU" colspan="1">
                               <b><axis:alt f="axisfic002" c="CCIIU" lit="9909091"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="CTIPSOCI">
                             <td class="titulocaja" id="LIT_CTIPSOCI" colspan="1">
                               <b><axis:alt f="axisfic002" c="CTIPSOCI" lit="9903269"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="CESTSOC">
                             <td class="titulocaja" id="LIT_CESTSOC" colspan="1">
                               <b><axis:alt f="axisfic002" c="CESTSOC" lit="9909092"/></b>
                             </td>
                           </axis:visible> 
                        
                        </tr>
                        <tr>
                        
                           <!-- Cambio Para bug/IAXIS-15897 : Start -->
                           <axis:visible f="axisfic002" c="TINFOAD" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto link" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		value="https://www.superfinanciera.gov.co/inicio/simev/registro-nacional-de-valores-y-emisores-rnve/informacion-emisores/calificaciones-80206" name="TINFOAD" id="TINFOAD" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909090" lit="9909090"/>"
                                        <axis:atr f="axisfic002" c="TINFOAD" /> onClick="pag('https://www.superfinanciera.gov.co/inicio/simev/registro-nacional-de-valores-y-emisores-rnve/informacion-emisores/calificaciones-80206')"/>        
                               </td>
                           </axis:visible>  
                           <!-- Cambio Para bug/IAXIS-15897 : End --> 
                                                     
                          <axis:visible f="axisfic002" c="CCIIU" >
                               <td class="campocaja" colspan="1">       
                           		<input type="text" class="campowidthinput campo campotexto" 
                                size="15" <%-- <c:if test="${__formdata.CMODO == '1'}"> readonly="readonly" </c:if> --%>
                                value="${__formdata.CCIIU}" name="CCIIU" id="CCIIU" onchange="f_onchange_CIIU()"
                                style="width:18%;" 
                                        title="<axis:alt f="axisfic002" c="CCIIU" lit="9909091"/>"
                                        <axis:atr f="axisfic002" c="CCIIU" />/>
                                        &nbsp;<%-- <c:if test="${__formdata.CMODO != '1'}"> --%><img id="findCCIIU" border="0" src="images/find.gif" onclick="f_abrir_axisciiu001(null, null)" style="cursor:pointer"/><%-- </c:if> --%>
                                &nbsp;<span id="TCCIIU_span"><b>${__formdata.TCCIIU}</b></span>         
                              </td>
                          </axis:visible>
                          
                          <axis:visible f="axisfic002" c="CTIPSOCI" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CTIPSOCI" id="CTIPSOCI" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="CTIPSOCI" lit="9903269"/>"
                                        <axis:atr f="axisfic002" c="CTIPSOCI" />
                                        <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp;  <!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic002" c="C_CTIPSOCI" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoSociedad}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPSOCI}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                              </td>
                          </axis:visible> 
                          
                          <axis:visible f="axisfic002" c="CESTSOC" >
                               <td class="campocaja" colspan="1">       
                           		<select name="CESTSOC" id="CESTSOC" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="CESTSOC" lit="9909092"/>"
                                        <axis:atr f="axisfic002" c="CESTSOC" />
                                        <%-- <c:if test="${__formdata.CMODO == '1'}"> disabled="disabled" </c:if> --%>>&nbsp; <!-- POST-123 -->
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisfic002" c="C_CESTSOC" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstEstadoSociedad}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CESTSOC}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>            
                              </td>
                          </axis:visible> 
                        	
                        </tr>
                        <tr>
                        	
                           <axis:visible f="axisfic002" c="TOBJSOC">
                             <td class="titulocaja" id="LIT_TOBJSOC" colspan="2">
                               <b><axis:alt f="axisfic002" c="TOBJSOC" lit="9909069"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="TEXPERI">
                             <td class="titulocaja" id="LIT_TEXPERI" colspan="2">
                               <b><axis:alt f="axisfic002" c="TEXPERI" lit="9909093"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="FCONSTI">
                             <!-- INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona condici�n con el CTIPPER -->
                             <c:if test="${__formdata.CTIPPER == 2}">
                               <td class="titulocaja" id="LIT_FCONSTI" colspan="1">
                                 <b><axis:alt f="axisfic002" c="FCONSTI" lit="9909070"/></b>
                               </td>
                             </c:if>
                             <c:if test="${__formdata.CTIPPER == 1}">
                               <td class="titulocaja" id="LIT_FCONSTI" colspan="1">
                                 <b><axis:alt f="axisfic002" c="FCONSTI" lit="1000064"/></b>
                               </td>
                             </c:if>
                             <!-- FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona condici�n con el CTIPPER -->
                           </axis:visible> 
                           
                        </tr>
                        <tr>
                        	<axis:visible f="axisfic002" c="TOBJSOC" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		value="${__formdata.TOBJSOC}" name="TOBJSOC" id="TOBJSOC" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909069" lit="9909069"/>"
                                        <axis:atr f="axisfic002" c="TOBJSOC" />/>        
                               </td>
                            </axis:visible> 
                        	
                        	<axis:visible f="axisfic002" c="TEXPERI" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		value="${__formdata.TEXPERI}" name="TEXPERI" id="TEXPERI" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909093" lit="9909093"/>"
                                        <axis:atr f="axisfic002" c="TEXPERI" />/>        
                               </td>
                           </axis:visible>
                           
                           <axis:visible f="axisfic002" c="FCONSTI" >
                               <td class="campocaja" colspan="1">
                                  <input type="text" onblur="javascript:f_formatdate(this,'')" formato="fecha" <axis:atr f="axisfic002" c="FCONSTI"/>  alt="<axis:alt f="axisfic002" c="FCONSTI" lit="9909070"/>" title="<axis:alt f="axisfic002" c="FCONSTI" lit="9909070"/>"
                                         name="FCONSTI" id="FCONSTI"  value="<fmt:formatDate value="${__formdata.FCONSTI}" pattern="dd/MM/yyyy" />" style="width:90%;" class="campowidthinput campo campotexto"/>
                                           <axis:visible c="ICO_FCONSTI" f="axisfic002">
                                                <a id="icon_FCONSTI" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisfic002" c="SELECT" lit="108341"/>" title="<axis:alt f="axisfic002" c="ICO_FCONSTI" lit="9909070" />" src="images/calendar.gif"/></a>
                                  </axis:visible>
                               </td>
                           </axis:visible> 
                        
                        </tr>  
                        <tr>
                        	
                            <axis:visible f="axisfic002" c="TVIGENC">
                             <td class="titulocaja" id="LIT_TVIGENC" colspan="2">
                               <b><axis:alt f="axisfic002" c="TVIGENC" lit="9909094"/></b>
                             </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="TDESCRIP">
                             <td class="titulocaja" id="LIT_TDESCRIP" colspan="2">
                               <b>Incidentes Judiciales vigentes</b>
                             </td>
                           </axis:visible> 
                           
                           
                           
                        </tr>
                        <tr>
                        	
                        	<axis:visible f="axisfic002" c="TVIGENC" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		value="${__formdata.TVIGENC}" name="TVIGENC" id="TVIGENC" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909094" lit="9909094"/>"
                                        <axis:atr f="axisfic002" c="TVIGENC" />/>        
                               </td>
                           </axis:visible> 
                           
                           <axis:visible f="axisfic002" c="TDESCRIP" >
                           		<td class="campocaja" colspan="2">
                                 <input type="text" class="campowidthinput campo campotexto" size="15" onkeypress="return soloLetrasNumeros(event)"
                                 		value="${__formdata.TDESCRIP}" name="TDESCRIP" id="TDESCRIP" style="width:90%;"
                                        title="<axis:alt f="axisfic002" c="lit_9909134" lit="9909134"/>"
                                        <axis:atr f="axisfic002" c="TDESCRIP"/>/>        
                               </td>
                           </axis:visible> 
                        	
                        </tr>   		  
                    </table>
                    
                    
                    <axis:visible c="DSP_PER_REL" f="axisfic002">
				    <!-- *************************  PERSONAS RELACIONADAS  ********************* -->
				    <div class="titulo"><a name="posicionPorColorcar__PER_REL" id="posicionPorColorcar__PER_REL" ></a>
				      <b><axis:alt f="axisfic002" c="LIT_DSP_PERREL" lit="9902247"/></b>
				    </div>
				    <table class="seccion"  onclick="objSeccion.actualizarPosicionPorColocarCookie('axisfic002','PER_REL');return true;">
				      <!--  TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se comentariza por no proceder en este m�dulo -->
				      <axis:visible f="axisfic002" c="BT_NVPERREL">
				      <c:if test="${! ocultarIconosEdicion && __configform.axisfic002__BT_ANADIR_PERREL__visible != 'false'}">
				        <div style="float:right;">
				          
				            <img border="0"
				                 alt="<axis:alt f='axisfic002' c='LIT_ANADIR_G' lit='104825'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                 title="<axis:alt f='axisfic002' c='LIT_ANADIR_F' lit='104825'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                 src="images/new.gif"
				                 onclick="f_abrir_axisper025('${dades_persona.SPERSON}')"/>
				          
				        </div>
				      </c:if>
				      </axis:visible>
				      <tr>
				        <td>
				        
				        
				          <!-- DisplayTag PERREL -->
				          <c:set var="title1">
				            <axis:alt f="axisfic002" c="TTIPPER_REL" lit="9902248"/>
				          </c:set>
				          <c:set var="title2">
				            <axis:alt f="axisfic002" c="NNUMIDE" lit="105330"/>
				          </c:set>
				          <c:set var="title3">
				            <axis:alt f="axisfic002" c="TNOMBRE" lit="105940"/>
				          </c:set>
				          <c:set var="title4">
				            <axis:alt f="axisfic002" c="DIRECCION" lit="105889"/>
				          </c:set>
				          <c:set var="title5">
				            <axis:alt f="axisfic002" c="TELEFONO" lit="9000992"/>
				          </c:set>
				          <c:set var="title6">
				            <axis:alt f="axisfic002" c="MAIL" lit="109792"/>
				          </c:set>                              
				          <axis:visible f="axisfic002" c="PPARTICIPACION">
				          <c:set var="title7">
				            <axis:alt f="axisfic002" c="PPARTICIPACION" lit="104818"/>
				          </c:set>  
				          <c:set var="title8">
				            <axis:alt f="axisfic002" c="ISLIDER" lit="9906692"/>
				          </c:set> 
				          </axis:visible>
				          
				          <div class="displayspace">
				            <display:table name="${dades_persona.PERSONAS_REL}"
				                           id="T_IAX_PERSONAS_REL" export="false"
				                           class="dsptgtable" pagesize="-1"
				                           defaultsort="1"
				                           defaultorder="ascending"
				                           sort="list" cellpadding="0"
				                           cellspacing="0"
				                           requestURI="axis_axisfic002.do?paginar=true&subpantalla=datosgenerales">
				              <%@ include file="../include/displaytag.jsp"%>
				              <display:column title="${title1}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.TTIPPER_REL"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				                <div class="dspText">
				                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TTIPPER_REL}
				                </div>
				              </display:column>
				              <display:column title="${title2}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.NNUMIDE"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				                <div class="dspText">
				                  ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.NNUMIDE}
				                </div>
				              </display:column>
				              <display:column title="${title3}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.TNOMBRE"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				                <div class="dspText">
				                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TNOMBRE} 
				                </div>
				              </display:column>
				              <display:column title="${title4}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.DIRECCION"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				               <div class="dspText">
				                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.DIRECCION} 
				                </div>
				              </display:column>
				              <display:column title="${title5}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.TELEFONO"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				               <div class="dspText">
				                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.TELEFONO} 
				                </div>
				              </display:column>
				              <display:column title="${title6}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.MAIL"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				               <div class="dspText">
				                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.MAIL} 
				                </div>
				              </display:column>    
				              <axis:visible f="axisfic002" c="PPARTICIPACION">
				              <display:column title="${title7}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.PPARTICIPACION"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				               <div class="dspText">
				                    ${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.PPARTICIPACION} 
				                </div>
				              </display:column>    
				              </axis:visible> 
				              
				               <axis:visible f="axisfic002" c="ISLIDER">
				              <display:column title="${title8}"
				                              sortable="true"
				                              sortProperty="OB_IAX_PERSONAS_REL.ISLIDER"
				                              headerClass="sortable fixed"
				                              media="html" autolink="false">
				               <div class="dspText">
				                    <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==0}"> 
				                  <axis:alt f='axisfic002' c='NO' lit='101779'/>
				                   </c:if>
				                   <c:if test="${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.ISLIDER==1}"> 
				                 <axis:alt f='axisfic002' c='SI' lit='101778'/>
				                   </c:if>
				                </div>
				              </display:column>    
				              </axis:visible> 
				              
				             
				              <axis:visible f="axisfic002" c="BT_DELPERREL">
				              <c:if test="${! ocultarIconosEdicion && __configform.axisfic002__BT_BORRAR_PERREL__visible != 'false'}">
				                <display:column title="" sortable="false"
				                                sortProperty=""
				                                headerClass="headwidth5 sortable fixed"
				                                media="html"
				                                autolink="false">
				                  <div class="dspIcons">
				                    
				                      <img border="0"
				                           alt="<axis:alt f='axisfic002' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                           title="<axis:alt f='axisfic002' c='LIT_ELIMINAR' lit='1000127'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                           src="images/delete.gif"
				                           onclick="f_borrar_persona_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.SPERSON}','${dades_persona.CAGENTE}')"/>
				                    
				                  </div>
				                </display:column>
				              </c:if>
				              </axis:visible>
				              
				               <axis:visible f="axisfic002" c="BT_CONS_PERREL">              
				                <display:column title="" sortable="false"
				                                sortProperty=""
				                                headerClass="headwidth5 sortable fixed"
				                                media="html"
				                                autolink="false">
				                  <div class="dspIcons">
				                    
				                      <img border="0"
				                           alt="<axis:alt f='axisfic002' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                           title="<axis:alt f='axisfic002' c='LIT_MASDATOS' lit='1000439'/> <axis:alt f='axisfic002' c='LIT_PERREL' lit='9901375'/>"
				                           src="images/mas.gif"
				                           onclick="f_consultar_per_rel('${T_IAX_PERSONAS_REL.OB_IAX_PERSONAS_REL.SPERSON_REL}','${dades_persona.CAGENTE}')"/>
				                    
				                  </div>
				                </display:column>
				             
				              </axis:visible>
				            </display:table>
				          </div>
				        </td>
				      </tr>
				    </table>
				    <!-- ************************* FIN DATOS PERSONAS RELACIONADAS ********************* -->
				</axis:visible>
                    
                </td>
            </tr>
        </table>			
		
		<!-- POST-123 -->
	        <c:import url="../include/botonera_nt.jsp">
	            <c:param name="f">axisfic002</c:param>
	            <c:param name="f">axisfic002</c:param>	            
	            <%-- <c:param name="__botones"><c:if test="${__formdata.CMODO != 1}"> cancelar,aceptar,</c:if><c:if test="${__formdata.CMODO == 1}">salir</c:if> </c:param>--%>
            <c:param name="__botones">cancelar,aceptar,salir</c:param>
	        </c:import>
	        
    </form>
<!-- INI-CES -29/05/2019 Ajuste para que despliegue los calendarios en modo 0 = Alta, y 2 = Modificaci�n porque 1 = Consulta -->
	<%--	<c:if test="${__formdata.CMODO != '1'}"> --%> 
	    <script type="text/javascript">
			Calendar.setup({
				inputField     :    "FCCOMER",
				ifFormat       :    "%d/%m/%Y",
				button         :    "icon_FCCOMER", 
				singleClick    :    true,
				firstDay       :    1
			});
			
			Calendar.setup({
		        inputField     :    "FRUT",    
		        ifFormat       :    "%d/%m/%Y",     
		        button         :    "icon_FRUT",  
		        singleClick    :    true,
		        firstDay       :    1
		    });
			
			Calendar.setup({
		        inputField     :    "FEXPICED",    
		        ifFormat       :    "%d/%m/%Y",     
		        button         :    "icon_FEXPICED",  
		        singleClick    :    true,
		        firstDay       :    1
		    });
			
			Calendar.setup({
		        inputField     :    "FCONSTI",    
		        ifFormat       :    "%d/%m/%Y",     
		        button         :    "icon_FCONSTI",  
		        singleClick    :    true,
		        firstDay       :    1
		    });
		</script>
 <%-- </c:if>    --%> <!-- POST-123 -->  
<!-- END-CES -29/05/2019 Ajuste para que despliegue los calendarios en modo 0 = Alta, y 2 = Modificaci�n porque 1 = Consulta -->
       		<c:import url="../include/mensajes.jsp" />
		</div>
    </body>    
</html>
