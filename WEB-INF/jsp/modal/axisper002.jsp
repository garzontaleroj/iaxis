<%/* Revision:# iF2bu8hTbN3TwRWObPlNWQ== # */%>
<%-- 
*  Fichero: axisper002.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
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

<c:if test="${param.embedded != 'true'}"> 
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
</c:if>

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
        
        function f_onload_axisper002() {
        
        f_onchange_CPAIS();
        
        f_onchange_CPROVIN();
        f_onchange_CPOBLAC();
        if (!objUtiles.estaVacio(document.axisper002Form.sinProvincias) && document.axisper002Form.sinProvincias.value == 1 )
         objDom.setVisibilidadPorId("findPoblacion", "hidden");
        
        	   <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisper002');
					</c:if>
            var grabarOK = '${requestScope.grabarOK}';
            var embedded = "${param.embedded}";
            if (embedded == "true")
                document.getElementById("but_salir").value = "<axis:alt f='axisper002' c='SALIR' lit='108211'/>";
                        
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                // Se ha grabado correctamente la dirección
                // Cerrar modal y volver a la pantalla padre            
                if (embedded == "true")
                    f_aceptar_axisper002();            
                else
                    parent.f_aceptar_axisper002();            
            
            f_cargar_propiedades_pantalla(); 
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                var embedded = "${param.embedded}";
                var FACEPTAR = document.axisper002Form.faceptar.value;
                
                try { document.axisper002Form.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.axisper002Form.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.axisper002Form.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                if (embedded == "true")
                    objUtiles.ejecutarFormulario("modal_axisper006.do?FACEPTAR="+FACEPTAR, "grabarDireccion", document.axisper002Form, "_self", objJsMessages.jslit_cargando);   
                else
                    objUtiles.ejecutarFormulario("modal_axisper002.do?FACEPTAR="+FACEPTAR, "grabarDireccion", document.axisper002Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_salir() {
            var embedded = "${param.embedded}";
            if (embedded == "true")
                f_cerrar_axisper002();
            else
                parent.f_cerrar_axisper002();
        }                
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.axisper002Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisper002.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        function f_but_9000554() {
                formdataSPERSON = '${__formdata.SPERSON}';
                formdataCDOMICI = '${__formdata.CDOMICI}';
             if (!objUtiles.estaVacio(formdataSPERSON) && !objUtiles.estaVacio(formdataSPERSON) ){
               objAjax.invokeAsyncCGI("modal_axisper002.do?SPERSON="+formdataSPERSON+"&CDOMICI="+formdataCDOMICI, callbackAjaxinfohost, "operation=ajaxgetInfoHost", this);
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
                          if (!objUtiles.estaVacio(document.axisper002Form.sinProvincias) && document.axisper002Form.sinProvincias.value == 1 )
                                objDom.setVisibilidadPorId("findPoblacion2", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");
                       if (!objUtiles.estaVacio(document.axisper002Form.sinProvincias) && document.axisper002Form.sinProvincias.value == 1 )
                       objDom.setVisibilidadPorId("findPoblacion2", "visible");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        if (objUtiles.estaVacio(document.axisper002Form.sinProvincias) || document.axisper002Form.sinProvincias.value != 1 ){
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                        }else{
                            objDom.setVisibilidadPorId("findPoblacion2", "visible");
                        }
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");
                        objDom.setVisibilidadPorId("findPoblacion2", "hidden");
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
                    
                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";



                       var PAUTOCALLE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PAUTOCALLE"), 0, 0);
                        if (PAUTOCALLE == 1) {

                            document.getElementById("TNOMVIA").value =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0);
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
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS");
                objDom.setVisibilidadPorId("findPoblacion2", "hidden");
            }
        }
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                if(document.axisper002Form.sinProvincias.value != 1){
                 qs=qs+"&op="+"CPOBLAC";
               }else{
                 qs=qs+"&op="+"CPOBLACSINPROV";
               }
                
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                objDom.setVisibilidadPorId("findPoblacion2", "hidden");
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
                objAjax.invokeAsyncCGI("modal_axisper002.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                objDom.setVisibilidadPorId("findPoblacion2", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
                 //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc,false)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (!objUtiles.estaVacio(document.axisper002Form.sinProvincias) && document.axisper002Form.sinProvincias.value == 1 )
                                objDom.setVisibilidadPorId("findPoblacion2", "visible");
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
                            if (objUtiles.estaVacio(document.axisper002Form.sinProvincias) || document.axisper002Form.sinProvincias.value != 1 ){
                                objDom.setVisibilidadPorId("findPoblacion", "visible");
                            }else{
                                objDom.setVisibilidadPorId("findPoblacion2", "visible");
                            }
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
        
         
         function callbackAjaxinfohost(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc);  
             
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
                  if (!objUtiles.estaVacio(document.axisper002Form.sinProvincias) && document.axisper002Form.sinProvincias.value == 1 )
                                objDom.setVisibilidadPorId("findPoblacion2", "visible");
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
              if (objUtiles.estaVacio(document.axisper002Form.sinProvincias) || document.axisper002Form.sinProvincias.value != 1 ){
                objDom.setVisibilidadPorId("findPoblacion", "visible");
              }else{
                  objDom.setVisibilidadPorId("findPoblacion2", "visible");
              }
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }else if (CODIGO_CONSULTA == "LISTA_POBLACION_NOPROV") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorPorId("CPROVIN", CPROVIN);
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
			document.axisper002Form.CPOSTAL.focus();            
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}		

    </script>  
  <c:if test="${param.embedded != 'true'}">    
  </head>
  <body onload="f_onload_axisper002()">
  	
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>  
  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>
  </c:if>
  
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
	
    <div id="wrapper" class="wrapper">
    <form name="axisper002Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" name="CDOMICI"  value="${__formdata.CDOMICI}"/>
        <input type="hidden" name="faceptar" value="${__formdata.faceptar}"/>
        <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
        <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        <input type="hidden" name="sinProvincias" id="sinProvincias" value="${__formdata.sin_provincias}"/>
        <c:if test="${param.embedded != 'true'}">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisper002" c="formulario" lit="1000212" /></c:param>
            <c:param name="producto"><axis:alt f="axisper002" c="producto" lit="1000212" /></c:param>
            <c:param name="form">axisper002</c:param>
        </c:import>
        </c:if>

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
                                <b><axis:alt f="axisper002" c="CTIPDIR" lit="100565"/></b>
                            </td>
                            
                            <axis:ocultar c="TALIAS" f="axisper002" dejarHueco="false">
                            <td class="titulocaja">
                                <b id="label_TALIAS"><axis:alt f="axisper002" c="TALIAS" lit="9910234"/></b>
                            </td>   
                            </axis:ocultar>   
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja">
                                <select name="CTIPDIR" id="CTIPDIR" size="1" class="campowidthselect campo campotexto" style="width:80%;"
                                <axis:atr f="axisper002" c="CTIPDIR" a="obligatorio=true&isInputText=false"/> title="<axis:alt f="axisper002" c="CTIPDIR" lit="100565"/>">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoDireccion}">
                                        <option value = "${element.CATRIBU}" 
                                        <c:if test="${element.CATRIBU == __formdata.CTIPDIR}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            
                             <axis:ocultar c="TALIAS" f="axisper002" dejarHueco="false">   
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TALIAS}" name="TALIAS" id="TALIAS" maxlength="200" onkeypress="return soloLetrasNumeros(event);"
                                           >
                                </td>
                            </axis:ocultar>
                            
                        </tr>
                        <axis:visible f="axisper002" c="DSP_DIRECCION">
                        <tr>
                            <td> 
                                &nbsp;
                            </td>
                            <axis:ocultar c="CSIGLAS" f="axisper002" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="CSIGLAS" lit="110028"/></b>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="TNOMVIA" lit="110029"/></b>
                            </td>                             
                            <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="NNUMVIA" lit="800440"/></b>
                            </td>
                            <axis:ocultar c="TCOMPLE" f="axisper002" dejarHueco="false">
                            <td id="tit_TCOMPLE" class="titulocaja">
                                <b id="label_TCOMPLE"><axis:alt f="axisper002" c="TCOMPLE" lit="110031"/></b>
                            </td>
                            </axis:ocultar>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CSIGLAS" f="axisper002" dejarHueco="false">
                            <td class="campocaja">
                                <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto_ob" style="width:80%;">&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                        <option value = "${element.CSIGLAS}" 
                                        <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                            ${element.TDENOM} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:ocultar>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);" 
                                style="width:95%;" maxlength="200"/>
                            </td>                            
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" onkeypress="return ValidNum(event);" 
                                style="width:20%;"  maxlength="5"/>
                            </td>
                            <axis:visible c="TCOMPLE" f="axisper002">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                style="width:95%;" maxlength="100"/>
                            </td>
                            </axis:visible>
                                                         
                        </tr>
                        </axis:visible>
                        <axis:visible f="axisper002" c="DSP_DIRECCIONCOL">  
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
                                <axis:visible f="axisper002" c="CVIAVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CVIAVP" lit="9902408"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="TNOMVIA"> 
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper002" c="TNOMVIA" lit="9903010"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="CLITVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CLITVP" lit="9902409"/></b>
                                </td>                                
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="CBISVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CBISVP" lit="9902410"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="CORVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CORVP" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisper002" c="CVIAVP"> 
                                <td class="campocaja">
                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" onchange="f_cargar_propiedades_pantalla()"
                                        <axis:atr f="axisper002" c="CVIAVP" a="obligatorio=false"/> title="<axis:alt f="axisper002" c="CVIAVP" lit="9902408"/>">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                       	<c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="TNOMVIA"> 
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                    style="width:95%;" maxlength="200" <axis:atr f="axisper002" c="TNOMVIA" a="obligatorio=false"/> />
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="CLITVP"> 
                                <td class="campocaja">
                                    <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                     <axis:atr f="axisper002" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axisper002" c="CLITVP" lit="9902409"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="CBISVP"> 
                                <td class="campocaja">
                                    <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCBISVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="CORVP"> 
                                <td class="campocaja">
                                    <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
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
                            <tr>
                                <axis:visible f="axisper002" c="NVIAADCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="NVIAADCO" lit="9902414"/></b>
                                </td>
				</axis:visible>
				<axis:visible f="axisper002" c="CLITCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CLITCO" lit="9902409"/></b>
                                </td>
				</axis:visible>
				<axis:visible f="axisper002" c="CORCO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CORCO" lit="9902411"/></b>
                                </td>
                                </axis:visible>

				<axis:visible f="axisper002" c="NPLACACO">
                                <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="NPLACACO" lit="9902415"/></b>
                                </td>
                                </axis:visible>                                
                                
                                <axis:visible f="axisper002" c="COR2CO">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="COR2CO" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                               <axis:visible f="axisper002" c="NVIAADCO">
                               <td class="campocaja">
                                   <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" onkeypress="return ValidNum(event);"
                                    style="width:70%;" formato="entero" <axis:atr f="axisper002" c="NVIAADCO" a="obligatorio=false"/> title="<axis:alt f="axisper002" c="NVIAADCO" lit="9902414"/>"/>
                               </td>
                               </axis:visible>
                                <axis:visible f="axisper002" c="CLITCO">
                                <td class="campocaja">
                                    <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>                                
                                <axis:visible f="axisper002" c="CORCO">
                                <td class="campocaja">
                                    <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
                                <axis:visible f="axisper002" c="NPLACACO">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" 
                                      <axis:atr f="axisper002" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" onkeypress="return ValidNum(event);"
                                      title="<axis:alt f="axisper002" c="NPLACACO" lit="9902415"/>"/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="COR2CO">
                                <td class="campocaja">
                                    <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
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
                               <axis:visible f="axisper002" c="CDET1IA" >
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CDET1IA" lit="9902417"/></b>
                                </td>
                                </axis:visible>
                                   <axis:visible f="axisper002" c="TNUM1IA" >
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper002" c="TNUM1IA" lit="9902418"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="CDET2IA" >
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CDET2IA" lit="9902419"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper002" c="TNUM2IA" >
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper002" c="TNUM2IA" lit="9902420"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisper002" c="CDET1IA" >
                                <td class="campocaja">
                                    <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="TNUM1IA" >
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100"/>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="CDET2IA" >
                                <td class="campocaja">
                                    <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                  
                                <axis:visible f="axisper002" c="TNUM2IA" >  
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100"/>
                                </td>
                                </axis:visible>
                                 
                          
						  </tr>
                            <tr>
                                <axis:visible f="axisper002" c="CDET3IA" >  
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CDET3IA" lit="9902421"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="TNUM3IA" >  
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisper002" c="TNUM3IA" lit="9902422"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisper002" c="CDET3IA" >  
                                <td class="campocaja">
                                    <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper002" c="TNUM3IA" >                                  
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100"/>
                                </td>
                                </axis:visible>
                            </tr>
                            </table>
                            </td>
                            </tr>
                        </axis:visible>
                        <axis:visible f="axisper002" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper002" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>                               
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="TNOMVIA" lit="110029"/></b>
                                </td>                              
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="NNUMVIA" lit="9904598"/></b>
                                </td>                                 
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axisper002" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper002" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" onkeypress="return soloLetrasNumeros(event);"
                                    style="width:95%;"/>
                                </td>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:15%;"  maxlength="100"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <axis:ocultar c="NNUMVIA" f="axisper002" dejarHueco="false">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" onkeypress="return ValidNum(event);"
                                    style="width:15%;"/>
                                    &nbsp;&nbsp;&nbsp;
                                     </axis:ocultar>
                                      <axis:ocultar c="TCOMPLE" f="axisper002" dejarHueco="false">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                        style="width:15%;"/>
                                     </axis:ocultar>
                                </td>                                
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper002" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper002" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper002" c="TNUM2IA" lit="9904595"/>" maxlength="100"/>
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper002" c="TNUM3IA" lit="9904596"/>" maxlength="100"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper002" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" onkeypress="return soloLetrasNumeros(event);"
                                            style="width:90%;"  title="<axis:alt f="axisper002" c="LOCALIDAD" lit="9903353"/>" />
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
                            <axis:ocultar c="CPOSTAL" f="axisper002" dejarHueco="false">
                                 <td class="titulocaja">
                                    <b><axis:alt f="axisper002" c="CPOSTAL" lit="101081"/></b>
                                </td>
                            </axis:ocultar>
                             <axis:ocultar c="CPAIS" f="axisper002" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="CPAIS" lit="100816"/></b>
                            </td>
                             </axis:ocultar>
                           <axis:ocultar c="CPROVIN" f="axisper002">
                           <td class="titulocaja">
                                <b><axis:alt f="axisper002" c="CPROVIN" lit="100756"/></b>
                            </td>
                            </axis:ocultar>
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisper002" c="CPOBLAC" lit="100817"/></b>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CPOSTAL" f="axisper002" dejarHueco="false">
                                 <td class="campocaja"> 
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"  onkeypress="return ValidNum(event);"
                                    style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)"
                                    title="<axis:alt f="axisper002" c="CPOSTAL" lit="101081"/>"
                                           <axis:atr f="axisper002" c="CPOSTAL" a="obligatorio=true"/>/>
									&nbsp;
									<axis:ocultar c="CPOSTALFIND" f="axisper002" dejarHueco="false">
										<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
									</axis:ocultar>
                                </td>  
                            </axis:ocultar>
                            <axis:ocultar c="CPAIS" f="axisper002" dejarHueco="false">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" 
                                title="<axis:alt f="axisper002" c="CPAIS_DIRECCION" lit="100816"/>" <axis:atr f="axisper002" c="CPAIS" a="obligatorio=true&modificable=true"/> 
                                onchange="f_onchange_CPAIS()" style="width:18%;" />&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="CPROVIN" f="axisper002">
                            <td class="campocaja">

                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"   
								title="<axis:alt f="axisper002" c="TPROVIN" lit="100756"/>"
								<axis:atr f="axisper002" c="CPROVIN" a="obligatorio=true&modificable=true"/>    />
                                &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisper002Form.CPAIS.value)"/>                
                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="CPOBLAC" f="axisper002">
                            <td class="campocaja">

                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"  
								title="<axis:alt f="axisper002" c="TPOBLAC" lit="100817"/>"
								<axis:atr f="axisper002" c="CPOBLAC" a="obligatorio=true&modificable=true"/>      />
                                &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisper002Form.CPROVIN.value, document.axisper002Form.CPOSTAL.value)"/>                
                                &nbsp;<img id="findPoblacion2" style="visibility:${ ( __formdata.sin_provincias == 1 && !empty __formdata.CPAIS ) ? 'visible' : 'hidden'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.axisper002Form.CPAIS.value, document.axisper002Form.CPAIS.value)"/>             
                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                            </td>
                            </axis:ocultar>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper002</c:param><c:param name="f">axisper002</c:param>
            <c:param name="__botones">salir<c:if test="${!empty __formdata.esHost && __formdata.esHost == 0}">,9000554</c:if>,aceptar</c:param>
        </c:import>
    </form>
  </div>
<c:if test="${param.embedded != 'true'}">    
        <c:import url="../include/mensajes.jsp" />
    </body>    
</html>
</c:if>   

