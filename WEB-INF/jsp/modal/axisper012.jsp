<%/* Revision:# 2uGTzUm5bkJ/2/5Ms8a0Ag== # */%>
<%-- 
*  Fichero: axisper012.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 24/04/2008
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

    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
		
		function soloLetrasNumeros(e){
	 	       key = e.keyCode || e.which;
	 	       tecla = String.fromCharCode(key).toLowerCase();
	 	       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz1234567890";
	 	       especiales = "8-37-39-46";
	 	
	 	       tecla_especial = false;
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
		
        
        function f_onload_axisper012() {
        	  <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper012');
					</c:if>
            revisarEstilos();
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0"){
            parent.f_aceptar_axisper012("${__formdata.SPERSON}");  
            }
            
            formdataPAIS = '${__formdata.CPAIS}';
            if(objUtiles.estaVacio(formdataPAIS)){
                formdataPAIS = '${__configform.axisper012__CPAIS__valordefecto}';
            }
            
            if (!objUtiles.estaVacio(formdataPAIS)){
            if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
            }
         }
            // Inicio IAXIS-4832(1) 05/09/2019
            // Si viene de la pantalla de personas duplicadas axisper024, se marcará el Alias como obligatorio.
            var cdup = "${requestScope.CDUP}"; 
            if (!objUtiles.estaVacio(cdup)){
            	document.getElementById("TALIAS").setAttribute('obligatorio','true');    
            }
            // Fin IAXIS-4832(1) 05/09/2019
            //
            // Inicio IAXIS-7810 10/01/2020
            //
            var ctipide ="${__formdata.CTIPIDE}"; 
            // Los campos Código DANE, País, Departamento y Ciudad dejarán de ser obligatorios si el tipo de documento es
	        // 96: "Código persona extranjera".
            if (!objUtiles.estaVacio(ctipide) && ctipide == "96"){
            	document.getElementById("CPOSTAL").setAttribute('obligatorio','false');
            	document.getElementById("CPOBLAC").setAttribute('obligatorio','false');
            	document.getElementById("CPROVIN").setAttribute('obligatorio','false');
            	document.getElementById("CPAIS").setAttribute('obligatorio','false');
            }
            //
            // Fin IAXIS-7810 10/01/2020
            //
         f_cargar_propiedades_pantalla(); // BUG CONF-441 - 14/12/2016 - JAEG
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
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
            try { document.axisper012Form.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
            try { document.axisper012Form.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
            try { document.axisper012Form.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                objUtiles.ejecutarFormulario("modal_axisper012.do", "grabarDireccion", document.axisper012Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        
        
        function f_but_cancelar() {        
        	// Inicio IAXIS-4832(1) 05/09/2019
        	var cdup = "${requestScope.CDUP}"; 
        	
        	if(objUtiles.estaVacio(cdup)){
        		
        		revisarEstilos();
                parent.f_cerrar_axisper012();
        		
        	} else{
        		// Al ser una persona duplicada, se obliga a crear el Alias.
        		alert("Debe diligenciar el Alias");
        		
        	}
        	// Fin IAXIS-4832(1) 05/09/2019
        }                
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.axisper012Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisper012.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
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
                    
                    // 34989/209710 - Autopoblar el campo TNOMVIA.
                    // Poner en el campo "Street name" lo mismo que se está colocando dinámicamente
                    // en el campo TPOBLAC_span.  Esto se debe realizar solo si el parámetro
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
                objAjax.invokeAsyncCGI("modal_axisper012.do", callbackajaxdireccion, qs, this, null, origen)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                objDom.setVisibilidadPorId("findPoblacion2", "hidden");
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
                qs=qs+"&CPAIS="+CPAIS;
                qs=qs+"&CPOBLAC="+CPOBLAC;
                qs=qs+"&CPROVIN="+CPROVIN;
                qs=qs+"&dt="+(new Date().getTime());
                var origen = 'CPOBLAC';
                objAjax.invokeAsyncCGI("modal_axisper012.do", callbackajaxdireccion, qs, this, null, origen)
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
                objAjax.invokeAsyncCGI("modal_axisper012.do", callbackajaxdireccion, qs, this, null, origen)
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
                    //Si ha habido errores en la recepción de algún cambio limpiaremos los que dependen de él
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

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
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
			document.axisper012Form.CPOSTAL.focus();            
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}

    </script>  

  </head>
  <body onload="f_onload_axisper012()">
    <div id="wrapper" class="wrapper">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
	<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>

    
    <form name="axisper012Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CDOMICI"  value="${__formdata.CDOMICI}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
        <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="MENSWARNINFO" id ="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" />
        <input type="hidden" name="CTIPPER" id="CTIPPER" value="${__formdata.CTIPPER}"/>  <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
        

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisper012" c="formulario" lit="1000212" /></c:param>
            <c:param name="producto"><axis:alt f="axisper012" c="producto" lit="1000212" /></c:param>
            <c:param name="form">axisper012</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                        <tr>
                            <th style="width:4%;height:0px"></th>
                            <th style="width:21%;height:0px"></th>
                            <th style="width:21%;height:0px"></th>
                            <th style="width:21%;height:0px"></th>
                            <th style="width:21%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="CTIPDIR" lit="100565"/></b>
                            </td>
                            
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                            <axis:ocultar c="TALIAS" f="axisper012" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_TALIAS"><axis:alt f="axisper012" c="TALIAS" lit="9910234"/></b>
                            </td>   
                            </axis:ocultar>
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja">
                                <select name="CTIPDIR" id="CTIPDIR" size="1" class="campowidthselect campo campotexto" style="width:80%;"
                                        title="<axis:alt f="axisper012" c="CTIPDIR" lit="100565"/>"
                                        <axis:atr f="axisper012" c="CTIPDIR" a="obligatorio=true"/>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoDireccion}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPDIR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
			    <axis:ocultar c="TALIAS" f="axisper012" dejarHueco="false">   
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TALIAS}" name="TALIAS" id="TALIAS" maxlength="200" onkeypress="return soloLetrasNumeros(event);"
                                           title="<axis:alt f="axisper012" c="TALIAS" lit="9910234"/>" <axis:atr f="axisper012" c="TALIAS" a="obligatorio=false"/>/>
                                </td>
                            </axis:ocultar>
                            <!-- BUG CONF-441 - 14/12/2016 - JAEG -->
                        </tr>
                        <axis:visible f="axisper012" c="DSP_DIRECCION">  
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CSIGLAS" f="axisper012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="CSIGLAS" lit="110028"/></b>
                            </td>   
                            </axis:ocultar>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="TNOMVIA" lit="110029"/></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="NNUMVIA" lit="800440"/></b>
                            </td>
                            
                            <!-- 34989/209710 -->
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="TCOMPLE" lit="110031" /></b>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CSIGLAS" f="axisper012" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                        <option value = "${element.CSIGLAS}" 
                                        <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                            ${element.TDENOM} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <axis:visible f="axisper012" c="TNOMVIA"> 
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                style="width:95%;" maxlength="200" <axis:atr f="axisper012" c="TNOMVIA" a="obligatorio=false"/> 
                                title="<axis:alt f="axisper012" c="TNOMVIA" lit="9903010"/>"
                                />
                            </td>
                            </axis:visible>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                style="width:20%;" formato="entero" maxlength="5"/>
                            </td>       
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                style="width:95%;"  maxlength="100"/>
                            </td>
                                                           
                        </tr>
                        </axis:visible>
                        <%-- Direccion para colombia --%>
                        <axis:visible f="axisper012" c="DSP_DIRECCIONCOL">  
                        <tr>
                           <td></td> 
                           <td colspan ="4"> 
                            <table>
                            <tr>
                                <th style="width:19%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                           </tr>
                            <tr>
                                <axis:visible f="axisper012" c="CVIAVP">

                                <td class="titulocaja">
                                    <b><axis:alt f="axisper012" c="CVIAVP" lit="9902408"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="TNOMVIA">  
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper012" c="TNOMVIA" lit="9903010"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CLITVP"> 
                                <td class="titulocaja">
                                    <b id="label_CLITVP"><axis:alt f="axisper012" c="CLITVP" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CBISVP"> 
                                <td class="titulocaja">
                                    <b id="label_CBISVP"><axis:alt f="axisper012" c="CBISVP" lit="9902410"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CORVP"> 
                                <td class="titulocaja">
                                    <b id="label_CORVP"><axis:alt f="axisper012" c="CORVP" lit="9902411"/></b>
                                </td>
								</axis:visible>
                                
                            </tr>
                            <tr>
                             <axis:visible f="axisper012" c="CVIAVP">                                

                                <td class="campocaja">
                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" onchange="f_cargar_propiedades_pantalla()"> 
                                        <axis:atr f="axisper012" c="CVIAVP" a="obligatorio=false"/> title="<axis:alt f="axisper012" c="CVIAVP" lit="9902408"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="TNOMVIA">    
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" maxlength="200" onkeypress="return soloLetrasNumeros(event);"
                                    <axis:atr f="axisper012" c="TNOMVIA" a="obligatorio=false"/>
                                    title="<axis:alt f="axisper012" c="TNOMVIA" lit="9903010"/>"
                                     />
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CLITVP">    
                                <td class="campocaja">
                                    <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                     <axis:atr f="axisper012" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axisper012" c="CLITVP" lit="9902409"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CBISVP">    
                                <td class="campocaja">
                                    <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCBISVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CORVP">    
                                <td class="campocaja">
                                    <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORVP}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								
                            </tr>
                               <axis:visible f="axisper012" c="NVIAADCO">  

                                <td class="titulocaja">
                                    <b id="label_NVIAADCO"><axis:alt f="axisper012" c="NVIAADCO" lit="9902414"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CLITCO"> 
                                <td class="titulocaja">
                                    <b id="label_CLITCO"><axis:alt f="axisper012" c="CLITCO" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CORCO"> 
                                <td class="titulocaja">
                                    <b id="label_CORCO"><axis:alt f="axisper012" c="CORCO" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper012" c="NPLACACO" >
                                <td class="titulocaja">                                	 
                                    <b id="label_NPLACACO"><axis:alt f="axisper012" c="NPLACACO" lit="9902415"/></b>                                
                                </td>
                                </axis:visible>
                                	
                                <axis:visible f="axisper012" c="COR2CO">   
                                <td class="titulocaja">                                
                                    <b id="label_COR2CO"><axis:alt f="axisper012" c="COR2CO" lit="9902411"/></b>                                
                                </td>
                                </axis:visible>
                                 	
                            </tr>
                            <tr>
                              <axis:visible f="axisper012" c="NVIAADCO"> 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" onkeypress="return ValidNum(event);" 
                                       <axis:atr f="axisper012" c="NVIAADCO" a="obligatorio=false"/>    style="width:70%;" formato="entero" title="<axis:alt f="axisper012" c="NVIAADCO" lit="9902414"/>"/>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CLITCO"> 
                                <td class="campocaja">
                                    <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisper012" c="CORCO"> 
                                <td class="campocaja">
                                    <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>

                                
                                
                                <axis:visible f="axisper012" c="NPLACACO">
                                <td class="campocaja">                                	
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" onkeypress="return ValidNum(event);" 
                                      <axis:atr f="axisper012" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" title="<axis:alt f="axisper012" c="NPLACACO" lit="9902415"/>"/>                                  
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper012" c="COR2CO">
                                <td class="campocaja">
                                	
                                    <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCOR2CO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.COR2CO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                   
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                             	  <axis:visible f="axisper012" c="CDET1IA">
                                <td class="titulocaja">
                                	
                                    <b id="label_CDET1IA"><axis:alt f="axisper012" c="CDET1IA" lit="9902417"/></b>
                               
                                </td>
                                </axis:visible>
                               
                                <axis:visible f="axisper012" c="TNUM1IA" >
                                <td class="titulocaja" colspan="2">
                                
                                     <b id="label_TNUM1IA"><axis:alt f="axisper012" c="TNUM1IA" lit="9902418"/></b>
																	
                                </td>
                                </axis:visible>                                    	
                                
                                <axis:visible f="axisper012" c="CDET2IA">
                                <td class="titulocaja">                                	
                                    <b id="label_CDET2IA"><axis:alt f="axisper012" c="CDET2IA" lit="9902419"/></b>
                                  
                                </td>
                                </axis:visible>
                               
                                <axis:visible f="axisper012" c="TNUM2IA">
                                <td class="titulocaja" colspan="2">                                	
                                    <b id="label_TNUM2IA"><axis:alt f="axisper012" c="TNUM2IA" lit="9902420"/></b>                                  
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            	  <axis:visible f="axisper012" c="CDET1IA">
                                <td class="campocaja">                                	
                                    <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                    <axis:atr f="axisper012" c="CDET1IA" a="obligatorio=false"/>
                                    title="<axis:alt f="axisper012" c="TNUM1IA" lit="9902417"/>"
                                    >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
																	
                                </td>
                                </axis:visible>            
                                <axis:visible f="axisper012" c="TNUM1IA">                                              
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100" 
                                    	   <axis:atr f="axisper012" c="TNUM1IA" a="obligatorio=false"/>
                                    	   title="<axis:alt f="axisper012" c="TNUM1IA" lit="9902418"/>"
                                       />
                                </td>
                                </axis:visible>                                    
                                <axis:visible f="axisper012" c="CDET2IA">                                        
                                <td class="campocaja">
                                    <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>                                   
                                <axis:visible  f="axisper012" c="TNUM2IA">                                      
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100"   />
                                </td>
                                </axis:visible>                                    
                                
                            </tr>
                            <tr>
                                <axis:visible f="axisper012" c="CDET3IA">  
                                <td class="titulocaja">
                                    <b id="label_CDET3IA"><axis:alt f="axisper012" c="CDET3IA" lit="9902421"/></b>
                                </td>
                                 </axis:visible>
                                 <axis:visible  f="axisper012" c="TNUM3IA">
                                <td class="titulocaja" colspan="2">
                                    <b id="label_TNUM3IA"><axis:alt f="axisper012" c="TNUM3IA" lit="9902422"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisper012" c="CDET3IA">  
                                <td class="campocaja">
                                    <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisper012" c="TNUM3IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                      maxlength="100"  style="width:90%;"  />
                                </td>
                                </axis:visible>
                            </tr>
                            </table>
                            </td>
                            </tr>
                        </axis:visible>
                        <axis:visible f="axisper012" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper012" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper012" c="TNOMVIA" lit="110029"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper012" c="NNUMVIA" lit="9904598"/></b>
                                </td>                     
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper012" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper012" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <axis:visible f="axisper012" c="TNOMVIA"> 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                        style="width:95%;" <axis:atr f="axisper012" c="TNOMVIA" a="obligatorio=false"/>
                                    	title="<axis:alt f="axisper012" c="TNOMVIA" lit="9903010"/>"
                                        />
                                </td>
                                </axis:visible>
                                
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:15%;"  maxlength="100" 
									<axis:atr f="axisper012" c="TNUM1IA" a="obligatorio=false"/>
                                    	   title="<axis:alt f="axisper012" c="TNUM1IA" lit="9902418"/>"		
										 />
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA"  
                                    style="width:15%;" onkeypress="return ValidNum(event);" />
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:15%;"/>
                                </td>                                
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper012" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper012" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper012" c="TNUM2IA" lit="9904595"/>" maxlength="100" />
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper012" c="TNUM3IA" lit="9904596"/>" maxlength="100" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper012" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                            style="width:90%;"  title="<axis:alt f="axisper012" c="LOCALIDAD" lit="9903353"/>" />
                                    </td>
                                </tr>
                            </axis:visible>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td> 
                            <axis:ocultar c="CPOSTAL" f="axisper012" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_CPOSTAL"><axis:alt f="axisper012" c="CPOSTAL" lit="101081"/></b>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="CPAIS" lit="100816"/></b>
                            </td>
                            <axis:ocultar c="CPROVIN" f="axisper012" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper012" c="CPROVIN" lit="100756"/></b>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisper012" c="CPOBLAC" lit="100817"/></b>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CPOSTAL" f="axisper012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                       style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" onkeypress="return ValidNum(event);" 
                                       title="<axis:alt f="axisper012" c="CPOSTAL" lit="101081"/>"
                                       <axis:atr f="axisper012" c="CPOSTAL" a="obligatorio=true"/>/>
								&nbsp;
								<axis:ocultar c="CPOSTALFIND" f="axisper012" dejarHueco="false">
									<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
								</axis:ocultar>
                            </td> 
                            </axis:ocultar>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}<c:if test="${empty __formdata.CPAIS}">${__configform.axisper012__CPAIS__valordefecto}</c:if>" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()"
                                style="width:18%;" onkeypress="return ValidNum(event);" 
                                        title="<axis:alt f="axisper012" c="CPAIS" lit="100816"/>"
                                        <axis:atr f="axisper012" c="CPAIS" a="obligatorio=true"/>/>
                                        &nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                            </td>
                            <axis:ocultar c="CPROVIN" f="axisper012" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  
                                       title="<axis:alt f="axisper012" c="CPROVIN" lit="100756"/>" onkeypress="return ValidNum(event);" 
                                       <axis:atr f="axisper012" c="CPROVIN" a="obligatorio=true"/>/>
                                &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS && empty __configform.axisper012__CPAIS__valordefecto ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisper012Form.CPAIS.value)"/>                
                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                            </td>
                            </axis:ocultar>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                       title="<axis:alt f="axisper012" c="CPOBLAC" lit="100817"/>" onkeypress="return ValidNum(event);" 
                                       <axis:atr f="axisper012" c="CPOBLAC" a="obligatorio=true"/>/>
                                &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN  ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisper012Form.CPROVIN.value, document.axisper012Form.CPOSTAL.value)"/>
                               <c:if test='${ __formdata.sin_provincias == 1}'> &nbsp;<img id="findPoblacion2" style="visibility:hidden;cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.axisper012Form.CPAIS.value, document.axisper012Form.CPAIS.value)"/></c:if>                
                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                            </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper012</c:param><c:param name="f">axisper012</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>

        <c:import url="../include/mensajes.jsp" />
</div>
    </body>    

</html>
