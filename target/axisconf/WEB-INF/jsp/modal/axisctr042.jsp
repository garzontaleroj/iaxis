<%/* Revision:# VHDRpAUvYLzBfCH6MKd23g== # */%>
<%-- 
*  Fichero: axisctr042.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*
*  Fecha: 24/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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
        
        
        function f_onload_axisctr042() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr042');
					</c:if>
            var grabarOK = ${requestScope.grabarOK == true};
                        
            if (grabarOK){
                // Se ha grabado correctamente la dirección
                // Cerrar modal y volver a la pantalla padre            
                parent.f_aceptar_modal("axisctr042"); 
            }
            f_cargar_propiedades_pantalla();
          
            //f_onchange_CPAIS();
          
        }
        
        
       function doPaste(obj){     
       maxLength = 250;
       var oTR = obj.document.selection.createRange();
       var iInsertLength = maxLength - obj.value.length + oTR.text.length;   
       try {
          var sData = window.clipboardData.getData("Text").substr(0,iInsertLength);           
          oTR.text = sData;          
          }
          catch (err) {           
          }
         
          if (window.event) { //IE
            window.event.returnValue = null;
          } else {
            //not IE
            obj.value = obj.value.substr(0,maxLength);
            return false;
          }    
        } 
        
        function f_but_aceptar() {            
            if (objValidador.validaEntrada()) {

                try { document.axisctr042Form.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.axisctr042Form.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.axisctr042Form.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                
              //  document.axisctr042Form.CSIGLAS_COD.value = objUtiles.utilSplit(objDom.getValorComponente(document.axisctr042Form.CSIGLAS), "/")[0];
              //  document.axisctr042Form.CSIGLAS_TEXT.value = objUtiles.utilSplit(objDom.getValorComponente(document.axisctr042Form.CSIGLAS), "/")[1];
                
                objUtiles.ejecutarFormulario("modal_axisctr042.do", "grabarRieDomicilio", document.axisctr042Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        
      
        function f_but_cancelar() {     
          try{           
                    parent.f_cerrar_modal("axisctr042");            
           }
           catch(e){ 
            <axis:visible c="BT_SIGUIENTE"  f="axisctr042">
                   objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr041", "cancelar", document.axisctr042Form, "_self");                   
            </axis:visible>       
            
           }
        }                
    
        
        function f_but_anterior() 
        { 
            objUtiles.ejecutarFormulario("modal_axisctr042.do", "anterior", document.axisctr042Form, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_siguiente() {
        
             if (objValidador.validaEntrada()) {
                try { document.axisctr042Form.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                try { document.axisctr042Form.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                try { document.axisctr042Form.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                
                document.axisctr042Form.CSIGLAS_COD.value = objUtiles.utilSplit(objDom.getValorComponente(document.axisctr042Form.CSIGLAS), "/")[0];
                document.axisctr042Form.CSIGLAS_TEXT.value = objUtiles.utilSplit(objDom.getValorComponente(document.axisctr042Form.CSIGLAS), "/")[1];               
                objUtiles.ejecutarFormulario("modal_axisctr042.do", "siguiente", document.axisctr042Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.axisctr042Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axisctr042.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
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
      
      function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
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
                objAjax.invokeAsyncCGI("modal_axisctr042.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
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

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION 
              + "&CODIGO_CP="+document.axisctr042Form.CPOSTAL.value);
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
        
        
        function f_but_1000102() {
            objUtiles.ejecutarFormulario("modal_axisctr042.do", "datostomador", document.axisctr042Form, "_self", objJsMessages.jslit_cargando);   
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
			document.axisctr042Form.CPOSTAL.focus();            
		}
		
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
		

    </script>  
  </head>
  
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload_axisctr042()">
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
    
    <form name="axisctr042Form" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>        
        <input type="hidden" name="CDOMICI" id="CDOMICI" value="${__formdata.CDOMICI}"/>
        <input type="hidden" name="TPAIS"  id="TPAIS" value="${__formdata.TPAIS}"/>
        <input type="hidden" name="TPROVIN" id="TPROVIN" value="${__formdata.TPROVIN}"/>
        <input type="hidden" name="TPOBLAC" id="TPOBLAC" value="${__formdata.TPOBLAC}"/>
        <input type="hidden" name="UNICO" id="UNICO" value="${__formdata.UNICO}"/>
        <input type="hidden" name="CSIGLAS_COD" id="CSIGLAS_COD" value="${__formdata.CSIGLAS_COD}"/>
        <input type="hidden" name="CSIGLAS_TEXT" id="CSIGLAS_TEXT" value="${__formdata.CSIGLAS_TEXT}"/>
        
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt c="TITULO" f="axisctr042" lit="9901647"/></c:param> <%-- Domicilio del Riesgo --%>
            <c:param name="producto"><axis:alt c="TITULO" f="axisctr042" lit="9901647"/></c:param>   <%-- Domicilio del Riesgo --%>
            <c:param name="form">axisctr042</c:param>
        </c:import>



        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <!-- Seccion direccion NO normalizada -->
                    <axis:visible c="NO_NORMALIZADA" f="axisctr042">
                    <table class="seccion">
                        <tr>
                            <th style="width:4%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                            <th style="width:25%;height:0px"></th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisctr042" c="TDOMICI" lit="9000415"/></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPOSTAL" lit="101081"/></b>
                            </td>
                        </tr>                      
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.TDOMICI}" name="TDOMICI" id="TDOMICI"                                 
                                style="width:95%;"/>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                style="width:60%;" onblur="f_onblur_CPOSTAL(this.value)"/>
								&nbsp;
								<axis:ocultar c="CPOSTALFIND" f="axisctr042" dejarHueco="false">
									<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
								</axis:ocultar>
                            </td>                                
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>                                
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPAIS" lit="100816"/></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPROVIN" lit="100756"/></b>
                            </td>
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisctr042" c="CPOBLAC" lit="100817"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:18%;" 
                                <axis:atr f="axisctr042" c="CPAIS" a="formato=entero"/> title="<axis:alt f="axisctr042" c="CPAIS" lit="100816"/>"/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                            </td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"
                                <axis:atr f="axisctr042" c="CPROVIN" a="formato=entero"/> title="<axis:alt f="axisctr042" c="CPROVIN" lit="100756"/>"/>&nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisctr042Form.CPAIS.value)"/>                
                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                            </td>
                            
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                <axis:atr f="axisctr042" c="CPOBLAC" a="formato=entero"/> title="<axis:alt f="axisctr042" c="CPOBLAC" lit="100817"/>"/>
                                &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisctr042Form.CPROVIN.value+'|'+document.axisctr042Form.CPOSTAL.value)"/>                
                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                            </td>                        
                        </tr>
                    </table>
                   </axis:visible>
                    <!-- Seccion direccion normalizada -->
                    <axis:visible c="NORMALIZADA" f="axisctr042">
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:visible c="CSIGLAS" f="axisctr042">
                            <td class="titulocaja" >
                                <b><axis:alt f="axisctr042" c="CSIGLAS" lit="110028" /></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="TNOMVIA" f="axisctr042">
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axisctr042" c="TNOMVIA" lit="110029" /></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="NNUMVIA" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="NNUMVIA" lit="9000969"/></b> <!--Num. via -->
                            </td>
                            </axis:visible>
                            
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:visible c="CSIGLAS" f="axisctr042">
                            <td class="campocaja" >
                                <select name="CSIGLAS" id="CSIGLAS" title="<axis:alt f="axisctr042" c="CSIGLAS" lit="110028" />"  size="1" 
                                        class="campowidthselect campo campotexto" <axis:atr f="axisctr042" c="CSIGLAS" a="isInputText=false&modificable=true"/>>
                                    <option value = "/"> - <axis:alt f="axisctr042" c="SELECCIONAR" lit="108341"/> - </option>
                                    <c:forEach var="tipovia" items="${listtipovia}">
                                        <option value = "${tipovia.CSIGLAS}/${tipovia.TDENOM}"
                                            <c:if test="${(!empty __formdata.CSIGLAS)&& tipovia.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if>>
                                            ${tipovia.TDENOM}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                            <axis:visible c="TNOMVIA" f="axisctr042">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" 
                                           value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA"
                                           <axis:atr f="axisctr042" c="TNOMVIA" a="modificable=true&obligatorio=true"/>/>
                                </td>
                            </axis:visible>
                            <axis:visible c="NNUMVIA" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="5" 
                                       value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" style="width:30%;" 
                                       <axis:atr f="axisctr042" c="NNUMVIA" a="modificable=true&formato=entero"/>/>
                            </td>                             
                            </axis:visible>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:visible c="TCOMPLE" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="TCOMPLE" lit="9901149"/></b> <!--DEscripció -->
                            </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:visible c="TCOMPLE" f="axisctr042">
                            <td class="campocaja" colspan="4">
                                <textarea onpaste= "doPaste(this)" class="campo" name="TCOMPLE" id="TCOMPLE" rows="3"                                 
                                onkeydown=" if(this.value.length>= 250 && event.keyCode != 32 && event.keyCode != 13 && event.keyCode > 47){return false;}"
                                cols="50" style="wdith:99%" <axis:atr f="axisctr042" c="TCOMPLE" a="modificable=true"/>>${__formdata.TCOMPLE}</textarea>                                      
                                <%--<input type="text" class="campowidthinput campo campotexto" size="15" 
                                onkeydown=" if(this.value.length>= 10 && event.keyCode != 8 && event.keyCode != 46){return false;}"
                                       value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" maxlength="250"
                                       <axis:atr f="axisctr042" c="TCOMPLE" a="modificable=true"/>/>--%>
                            </td> 
                            </axis:visible>
                        </tr> 
                        </table>
                    </axis:visible>
                        <%-- Direccion para colombia --%>
                        <axis:visible f="axisctr042" c="DSP_DIRECCIONCOL">  
                        <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            
                        </tr>
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
                                <axis:visible f="axisctr042" c="CVIAVP">

                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CVIAVP" lit="9902408"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="TNOMVIA">  
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr042" c="TNOMVIA" lit="9903010"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CLITVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CLITVP" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CBISVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CBISVP" lit="9902410"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CORVP"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CORVP" lit="9902411"/></b>
                                </td>
								</axis:visible>
                                
                            </tr>
                            <tr>
                             <axis:visible f="axisctr042" c="CVIAVP">                                

                                <td class="campocaja">
                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" <axis:atr f="axisctr042" c="CVIAVP" a="obligatorio=true"/> 
                                    title="<axis:alt f="axisctr042" c="CVIAVP" lit="9902408"/>"> 
                                         title="<axis:alt f="axisctr042" c="CVIAVP" lit="9902408"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible c="TNOMVIA" f="axisctr042">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto_ob" size="15" onkeypress="return soloLetrasNumeros(event);" 
                                           value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA"
                                           <axis:atr f="axisctr042" c="TNOMVIA" a="modificable=true&obligatorio=true"/>
                                           title="<axis:alt f="axisctr042" c="TNOMVIA" lit="9903010"/>"
                                           />
                                </td>
                            </axis:visible>
								<axis:visible f="axisctr042" c="CLITVP">    
                                <td class="campocaja">
                                    <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                     <axis:atr f="axisctr042" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axisctr042" c="CLITVP" lit="9902409"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CBISVP">    
                                <td class="campocaja">
                                    <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCBISVP}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CORVP">    
                                <td class="campocaja">
                                    <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
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
                               <axis:visible f="axisctr042" c="NVIAADCO">  

                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="NVIAADCO" lit="9902414"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CLITCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CLITCO" lit="9902409"/></b>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CORCO"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CORCO" lit="9902411"/></b>
                                </td>
                                </axis:visible>
                                
                                <axis:visible f="axisctr042" c="NPLACACO" >
                                <td class="titulocaja">                                	 
                                    <b><axis:alt f="axisctr042" c="NPLACACO" lit="9902415"/></b>                                
                                </td>
                                </axis:visible>
                                	
                                <axis:visible f="axisctr042" c="COR2CO">   
                                <td class="titulocaja">                                
                                    <b><axis:alt f="axisctr042" c="COR2CO" lit="9902411"/></b>                                
                                </td>
                                </axis:visible>
                                 	
                            </tr>
                            <tr>
                              <axis:visible f="axisctr042" c="NVIAADCO"> 
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" maxlength="5" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" onkeypress="return ValidNum(event);" 
                                       style="width:70%;" formato="entero" title="<axis:alt f="axisctr042" c="NVIAADCO" lit="9902414"/>"
                                       <axis:atr f="axisctr042" c="NVIAADCO" a="modificable=true&obligatorio=true"/>/>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CLITCO"> 
                                <td class="campocaja">
                                    <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCLITCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
								<axis:visible f="axisctr042" c="CORCO"> 
                                <td class="campocaja">
                                    <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCORCO}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
								</axis:visible>
                                
                                <axis:visible f="axisctr042" c="NPLACACO">
                                <td class="campocaja">                                	
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" onkeypress="return ValidNum(event);" 
                                      <axis:atr f="axisctr042" c="NPLACACO" a="obligatorio=true"/> style="width:70%;" formato="entero" title="<axis:alt f="axisctr042" c="NPLACACO" lit="9902415"/>"/>                                  
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisctr042" c="COR2CO">
                                <td class="campocaja">
                                	
                                    <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
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
                             	  <axis:visible f="axisctr042" c="CDET1IA">
                                <td class="titulocaja">
                                	
                                    <b><axis:alt f="axisctr042" c="CDET1IA" lit="9902417"/></b>
                               
                                </td>
                                </axis:visible>
                               
                                <axis:visible f="axisctr042" c="TNUM1IA" >
                                <td class="titulocaja" colspan="2">
                                
                                    <b><axis:alt f="axisctr042" c="TNUM1IA" lit="9902418"/></b>
																	
                                </td>
                                </axis:visible>                                    	
                                
                                <axis:visible f="axisctr042" c="CDET2IA">
                                <td class="titulocaja">                                	
                                    <b><axis:alt f="axisctr042" c="CDET2IA" lit="9902419"/></b>
                                  
                                </td>
                                </axis:visible>
                               
                                <axis:visible f="axisctr042" c="TNUM2IA">
                                <td class="titulocaja" colspan="2">                                	
                                    <b><axis:alt f="axisctr042" c="TNUM2IA" lit="9902420"/></b>                                  
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                            	  <axis:visible f="axisctr042" c="CDET1IA">
                                <td class="campocaja">                                	
                                    <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
																	
                                </td>
                                </axis:visible>            
                                <axis:visible f="axisctr042" c="TNUM1IA">                                              
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100" />
                                </td>
                                </axis:visible>                                    
                                <axis:visible f="axisctr042" c="CDET2IA">                                        
                                <td class="campocaja">
                                    <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>                                   
                                <axis:visible  f="axisctr042" c="TNUM2IA">                                      
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" onkeypress="return soloLetrasNumeros(event);"
                                       style="width:90%;" maxlength="100" />
                                </td>
                                </axis:visible>                                    
                                
                            </tr>
                            <tr>
                                <axis:visible f="axisctr042" c="CDET3IA">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="CDET3IA" lit="9902421"/></b>
                                </td>
                                 </axis:visible>
                                 <axis:visible  f="axisctr042" c="TNUM3IA">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr042" c="TNUM3IA" lit="9902422"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisctr042" c="CDET3IA">  
                                <td class="campocaja">
                                    <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr042" c="BLANCO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstCDET}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible>
                                
                                <axis:visible  f="axisctr042" c="TNUM3IA">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" onkeypress="return soloLetrasNumeros(event);"
                                      maxlength="100"  style="width:90%;" />
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisctr042" c="FGISX">  
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr042" c="FGISX" lit="9909534"/></b>
                                </td>
                                 </axis:visible>
                                 <axis:visible  f="axisctr042" c="FGISY">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr042" c="FGISY" lit="9901592"/></b>
                                </td>
                                </axis:visible>
                                <axis:visible  f="axisctr042" c="DESCRIPCION">
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr042" c="DESCRIPCION" lit="101761"/></b>
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisctr042" c="FGISX">  
                                <td class="campocaja">
                                     <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.FGISX}" name="FGISX" id="FGISX" 
                                      maxlength="100"  style="width:90%;" />
                                </td>
                                </axis:visible>
                                <axis:visible  f="axisctr042" c="FGISY">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.FGISY}" name="FGISY" id="FGISY" 
                                      maxlength="100"  style="width:90%;" />
                                </td>
                                </axis:visible>
                                <axis:visible  f="axisctr042" c="DESCRIPCION">
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.DESCRIPCION}" name="DESCRIPCION" id="DESCRIPCION" 
                                      maxlength="100"  style="width:90%;" />
                                </td>
                                </axis:visible>
                            </tr>
                            </table>
                            </td>
                            </tr>
                        </axis:visible>
                        
                        
                         <tr>
                            <td>
                                &nbsp;
                            </td> 
                            <axis:ocultar c="CPOSTAL" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPOSTAL" lit="101081"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:ocultar c="CPAIS" f="axisctr042" dejarHueco="false">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPAIS" lit="100816"/></b>
                            </td>
                            </axis:ocultar>
                            <axis:visible c="CPROVIN" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="CPROVIN" lit="100756"/></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="CPOBLAC" f="axisctr042">
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisctr042" c="CPOBLAC" lit="100817"/></b>
                            </td>
                            </axis:visible>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:ocultar c="CPOSTAL" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                style="text-transform:uppercase;width:40%;" onblur="f_onblur_CPOSTAL(this.value)"
                                <axis:atr f="axisctr042" c="CPOSTAL" a="modificable=true"/>/>
								&nbsp;
								<axis:ocultar c="CPOSTALFIND" f="axisctr042" dejarHueco="false">
									<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
								</axis:ocultar>
                            </td>  
                            </axis:ocultar>
                            <axis:ocultar c="CPAIS" f="axisctr042" dejarHueco="false">
                            <td class="campocaja" style="white-space:nowrap;">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:20%;" 
                                <axis:atr f="axisctr042" c="CPAIS" a="formato=entero&modificable=true&obligatorio=true"/> title="<axis:alt f="axisctr042" c="CPAIS" lit="100816"/>"/>&nbsp;
                               <!-- <axis:visible c="BUS_CPAIS" f="axisctr042">-->
                                <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                               <!-- </axis:visible> -->
                                &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                            </td>
                            </axis:ocultar>
                            <axis:visible c="CPROVIN" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:20%;"
                                <axis:atr f="axisctr042" c="CPROVIN" a="formato=entero"/> title="<axis:alt f="axisctr042" c="CPROVIN" lit="100756"/>" <axis:atr f="axisctr042" c="CPROVIN" a="formato=entero&modificable=true&obligatorio=true"/> />&nbsp;
                                <axis:visible c="BUS_CPROVIN" f="axisctr042">
                                <img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.axisctr042Form.CPAIS.value)"/>                
                                </axis:visible>
                                &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                            </td>
                            </axis:visible>
                            <axis:visible c="CPOBLAC" f="axisctr042">
                            <td class="campocaja" colspan="2">
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:20%;"
                                <axis:atr f="axisctr042" c="CPOBLAC" a="formato=entero"/> <axis:atr f="axisctr042" c="CPOBLAC" a="formato=entero&modificable=true&obligatorio=true"/> title="<axis:alt f="axisctr042" c="CPOBLAC" lit="100817"/>"/>
                                &nbsp;
                                <axis:visible c="BUS_CPOBLAC" f="axisctr042">
                                <img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.axisctr042Form.CPROVIN.value)"/>                
                                </axis:visible>
                                &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                            </td>     
                            </axis:visible>
                        </tr>
                        <axis:visible c="NORMALIZADA" f="axisctr042">
                        <tr>
                            <td>
                                &nbsp;
                            </td>     
                            <axis:visible c="FGISX" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="FGISX" lit="9901026"/></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="FGISY" f="axisctr042">
                            <td class="titulocaja">
                                <b><axis:alt f="axisctr042" c="FGISY" lit="9901027"/></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="FGISZ" f="axisctr042">
                            <td class="titulocaja">                                    
                                <b><axis:alt f="axisctr042" c="FGISZ" lit="9901028"/></b>
                            </td>
                            </axis:visible>
                            <axis:visible c="CVALIDA" f="axisctr042">
                            <td class="titulocaja" colspan="2">                                    
                                <b><axis:alt f="axisctr042" c="CVALIDA" lit="9901029"/></b>
                            </td>
                            </axis:visible>
                            
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <axis:visible c="FGISX" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                       value="${__formdata.FGISX}" name="FGISX" id="FGISX" style="width:25%;"
                                       <axis:atr f="axisctr042" c="FGISX" a="modificable=true"/>/>
                            </td>
                            </axis:visible>
                            <axis:visible c="FGISY" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                       value="${__formdata.FGISY}" name="FGISY" id="FGISY" style="width:25%;"
                                       <axis:atr f="axisctr042" c="FGISY" a="modificable=true"/>/>
                            </td>
                            </axis:visible>
                            <axis:visible c="FGISZ" f="axisctr042">
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto" size="15" 
                                       value="${__formdata.FGISZ}" name="FGISZ" id="FGISZ" style="width:25%;"
                                       <axis:atr f="axisctr042" c="FGISZ" a="modificable=true"/>/>
                            </td>  
                            </axis:visible>
                            <axis:visible c="CVALIDA" f="axisctr042">
                            <td class="campocaja">
                                <select name = "CVALIDA" id="CVALIDA" title="<axis:alt f="axisctr042" c="CVALIDA" lit="9002142" />"  size="1" 
                                        class="campowidthselect campo campotexto" 
                                        <axis:atr f="axisctr042" c="CVALIDA" a="isInputText=false&modificable=true"/>>
                                    <option value = ""> - <axis:alt f="axisctr042" c="SELECCIONAR" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${listvalida}">
                                        <option value = "${listados.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CVALIDA)&& listados.CATRIBU == __formdata.CVALIDA}"> selected </c:if>>
                                            ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            </axis:visible>
                        </tr>
                    </axis:visible>
                </td>
            </tr>
        </table>			

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr042</c:param>
            <c:param name="__botones">cancelar<axis:visible c="BT_TOMADOR" f="axisctr042">,1000102</axis:visible><axis:visible c="BT_ANTERIOR"  f="axisctr042">,anterior</axis:visible><axis:visible c="BT_ACEPTAR" f="axisctr042">,aceptar</axis:visible><axis:visible c="BT_SIGUIENTE" f="axisctr042">,siguiente</axis:visible> </c:param>            
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
    </div>
</html>

