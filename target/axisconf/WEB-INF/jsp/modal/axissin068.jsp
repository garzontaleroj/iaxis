<%/* Revision:# lFc3t09u+3MG83wjDqbopw== # */%>

<%--
/**
*  Fichero: axissin068.jsp
*  
*  Titulo: Modal mantetenimniento proceso judicial
*
*  Fecha: 03/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c="titulo" f="axissin068" lit="9909217"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    
    <script type="text/javascript">
    
            
        function f_onload() {
            try{  
	            if (${requestScope.grabarOK == true}) {
	                parent.f_aceptar_axissin068();
	            }
	    
	            f_cargar_propiedades_pantalla(); 
	        
	            formdataCPOSTAL = '${__formdata.CPOSTAL}';
	            f_campos_adicionales();
 
                if (!objUtiles.estaVacio(formdataCPOSTAL)){
                    f_onblur_CPOSTAL(formdataCPOSTAL);
                }            
            } catch (e) {}   

        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()) {            
                objUtiles.ejecutarFormulario ("modal_axissin068.do", "guardar", document.Axissin0068Form, "_self", objJsMessages.jslit_cargando);
            }
        }
        
        function f_but_cancelar(){
            parent.f_aceptar_axissin068();
         
        }
        function f_cerrar_modal(pantalla){
        
            objUtiles.cerrarModal(pantalla);
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
        
        
        
        /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
      function f_onchange_CEVENTO() {
            var CEVENTO=objDom.getValorPorId("CEVENTO");
            if (!objUtiles.estaVacio(CEVENTO)){
                var qs="operation=ajax_eventos";
                qs=qs+"&op="+"CEVENTO";
                qs=qs+"&CEVENTO="+CEVENTO
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("axis_axissin006.do", callbackajaxevento, qs, this)
            } else {
                objDom.setValorPorId("CEVENTO", "");
                objDom.setValorHTMLPorId("TEVENTO_span", "");
                objDom.setVisibilidadPorId("findEvento", "hidden");
                limpiaCampos("CEVENTO");
            }
        }        

        
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
					

                    // PaÃ­s
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
                    

                    // PoblaciÃ³n
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
               
            } else {
             /*   objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
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
              
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }

        /**************************************  RESTO FUNCIONES POBLACION *******************************/
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.Axissin0068Form.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_CP){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION+"&TIPO=DATE&CODIGO_CP=" + CODIGO_CP);
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
            else if (CODIGO_CONSULTA == "LISTA_EVENTOS") {
            try{
                objDom.setValorPorId("CEVENTO", CODIGO);
                objDom.setValorHTMLPorId("TEVENTO_span", "<b>" + TEXTO + "</b>");
                }catch(e){alert(e);}
            }
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function f_aceptar_axisper042(CPOSTAL){
                objUtiles.cerrarModal("axisper042");
		objDom.setValorPorId("CPOSTAL", CPOSTAL);
		document.Axissin0068Form.CPOSTAL.focus();  
		objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);  
	}
			
	function f_abrir_axisper042 () {
		objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
	}
        function f_abrir_axisprf000(){
            objUtiles.abrirModal('axisprf000',"src","modal_axisprf000.do?operation=form&pantalla=destinatario");
        }
        
        function f_aceptar_modal(pantalla, param){
            objUtiles.cerrarModal(pantalla);
            if(pantalla=="axisprf000"){           
                var valores = param.split("&");
                var sprofes =valores[0].split("=");
                var nnumide =valores[2].split("=");
                var tnombre =valores[3].split("=");
                var parametros = sprofes+"&"+nnumide+"&"+tnombre;
                objDom.setValorPorId("SPROFES",sprofes[1]);
                objDom.setValorPorId("NNUMIDEPROFES",nnumide[1]);
                objDom.setValorPorId("NOMBREPROFES",tnombre[1]);
                
            }

        }
        function f_but_salir(){
                objUtiles.cerrarModal("axisprf000");
           }

        function f_abrir_axisper008() {
            objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&faceptar=f_aceptar_axisper008_2&ORIGEN=AXISSIN068" );
        }
        
        function f_aceptar_axisper008_2(selectedPerson,selectedAgent){
            
            f_cerrar_axisper008();
            f_aceptar_persona(selectedPerson);
            
        }
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
        }
        
        function f_aceptar_persona(SPERSON){                 
            if (!objUtiles.estaVacio(SPERSON)){ 
                objAjax.invokeAsyncCGI("modal_axissin068.do?SPERSON_R="+SPERSON, callbackAjaxVerPersona2, "operation=ver_persona", this, objJsMessages.jslit_cargando); 
            }
        }
        
        function f_actualizar_persona (){
            objAjax.invokeAsyncCGI("modal_axissin068.do", callbackAjaxActualizarPersona2, "operation=actualizar_persona&NNUMIDE=" + document.getElementById("NNUMIDEAPO").value, this, objJsMessages.jslit_actualizando_registro);
        }
        function callbackAjaxActualizarPersona2(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDEAPO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDEAPO", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("NOMBREAPO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        objDom.setValorPorId("SAPODERA",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                
                    } else {
                        objDom.setValorPorId("NOMBREAPO", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NOMBREAPO", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function callbackAjaxVerPersona2(ajaxResponseText) {
       
            var doc = objAjax.domParse(ajaxResponseText);
            
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDEAPO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDEAPO", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0])) {
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                        var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                        objDom.setValorPorId("NOMBREAPO",  NOMBRE + ' ' + APELLIDO1 + ' ' + APELLIDO2);
                        objDom.setValorPorId("SAPODERA",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
     
                    } else if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0])) {   
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        objDom.setValorPorId("NOMBREAPO", APELLIDO1);   
                        objDom.setValorPorId("SAPODERA",objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
     
                    }else{
                        objDom.setValorPorId("NOMBREAPO", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NOMBREAUDEN", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        function f_aceptar_axissin069(){
            f_cerrar_modal("axissin069");
            objUtiles.ejecutarFormulario ("modal_axissin068.do", "form", document.Axissin0068Form, "_self", objJsMessages.jslit_cargando);
          
        } 
        function f_aceptar_axissin082(){
            f_cerrar_modal("axissin082");
            objUtiles.ejecutarFormulario ("modal_axissin068.do", "form", document.Axissin0068Form, "_self", objJsMessages.jslit_cargando);
          
        }
     // INI AXIS-3597 EA 2019-05-16 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL LA PANTALLA
        function f_borrar_valpretension_axissin066(param){
            objAjax.invokeAsyncCGI("modal_axissin068.do", callbackAjaxBorrarvalpretensionaxissin066, "operation=borrar&"+'NSINIES_RES='+'${__formdata.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.NTRAMIT}'+'&TIPO_DEL=4&NORDEN_RES='+'${__formdata.NORDEN}'+param, this, objJsMessages.jslit_actualizando_registro);
        }
        function callbackAjaxBorrarvalpretensionaxissin066(ajaxResponseText) {
        	try{
                var doc = objAjax.domParse(ajaxResponseText);
                                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) { 
        	objDom.setValorPorId("ITOTPRET", objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTPRET"), 0, 0));
        	objDom.setValorPorId("ITOTASEG", objDom.getValorNodoDelComponente(doc.getElementsByTagName("ITOTASEG"), 0, 0));
                }   
                
            }catch(e){
            }        
        }
     // FIN AXIS-3597 EA 2019-05-16 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL LA PANTALLA
      //INI AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA
        function f_borrar_val_axissin069(param){
            objAjax.invokeAsyncCGI("modal_axissin068.do", callbackAjaxBorrarvalpretensionaxissin069, "operation=borrar&"+'NSINIES_RES='+'${__formdata.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.NTRAMIT}'+'&TIPO_DEL=2&NORDEN_RES='+'${__formdata.NORDEN}'+param, this, objJsMessages.jslit_actualizando_registro);
            
            
        }
        function callbackAjaxBorrarvalpretensionaxissin069(ajaxResponseText) {
        	
        
        }
      //FIN AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION MODIFICACION Y ELIMINACION DE (Beneficiarios y Demandado(s) / Demandante(s)) SIN AFECTAR EL RESTO DEL LA PANTALLA
        
        function f_aceptar_axissin066(){
            f_cerrar_modal("axissin066");
            objUtiles.ejecutarFormulario ("modal_axissin068.do", "form", document.Axissin0068Form, "_self", objJsMessages.jslit_cargando);
          
        }
        
        function f_campos_adicionales(){
            var CTSENTE =objDom.getValorPorId("CTSENTE");
            if(CTSENTE != 2 && CTSENTE != 3){
            	ocultar_campos();
            }else 
                if(CTSENTE == 2 || CTSENTE == 3){
                	ocultar_campos();
                    objDom.setVisibilidadPorId("VTSENTE_td", "visible");
                	objDom.setVisibilidadPorId("VTSENTE_tit", "visible");
                }
        }
        
        function ocultar_campos(){
        	objDom.setVisibilidadPorId("VTSENTE_td", "hidden");
        	objDom.setVisibilidadPorId("VTSENTE_tit", "hidden");        	
        }
        

	//  JGONZALEZ SE AÃADEN CAMPOS PARA DATOS DETALLADOS DE LOS DESPACHOS
        function f_cargar_poblaciones(thiss, name){
			if(name == "CPROVINO")
				objAjax.invokeAsyncCGI("modal_axissin068.do", callbackAjaxCargarCombosPoblacionesOrigen, "operation=ajax_cargarPoblaciones&PROVINCIA="+thiss, this, objJsMessages.jslit_cargando);
			else
				objAjax.invokeAsyncCGI("modal_axissin068.do", callbackAjaxCargarCombosPoblacionesFinal, "operation=ajax_cargarPoblaciones&PROVINCIA="+thiss, this, objJsMessages.jslit_cargando);
        }
        
        function callbackAjaxCargarCombosPoblacionesOrigen(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CCPOBLACOcombo = document.Axissin0068Form.CPOBLACO;
                objDom.borrarOpcionesDeCombo(CCPOBLACOcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin068" c="SNV_COMBO" lit="108341"/> - ', CCPOBLACOcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0); 
                    
                    objDom.addOpcionACombo(VALOR, TEXTO, CCPOBLACOcombo, i+1);
                }
            }
        }
        
        function callbackAjaxCargarCombosPoblacionesFinal(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("VALOR");
                var CCPOBLACFcombo = document.Axissin0068Form.CPOBLACF;
                objDom.borrarOpcionesDeCombo(CCPOBLACFcombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin068" c="SNV_COMBO" lit="108341"/> - ', CCPOBLACFcombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var VALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), i, 0);
                    var TEXTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TEXTO"), i, 0); 
                    
                    objDom.addOpcionACombo(VALOR, TEXTO, CCPOBLACFcombo, i+1);
                }
            }
        }
        function f_onclickCheckbox(thiss) {
            thiss.value =  ((thiss.checked)?1:0);
         }
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9909217"/></c:param>
        </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9909217"/></c:param>
	</c:import>
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisprf000|<axis:alt c="axisprf000_TITULO" f="axisprf000" lit="9904783"/></c:param>
	</c:import>
        
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper008|<axis:alt c="axisper008_TITULO" f="axisprf000" lit="1000235"/></c:param>
	</c:import>
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin069|<axis:alt c="axissin069_TITULO" f="axissin069" lit="9909366"/></c:param>
        </c:import>	
        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin082|<axis:alt c="axissin082_TITULO" f="axissin082" lit="9910189"/></c:param>
        </c:import>	

        <c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axissin066|<axis:alt c="axissin066_TITULO" f="axissin066" lit="9909365"/></c:param>
        </c:import>	
    
     <!--********** CALENDARIO ************************* -->
      <!-- Hoja de estilo del Calendario -->
      <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
      <!-- Script principal del calendario -->
      <script type="text/javascript" src="scripts/calendar.js"></script>
      <!-- Idioma del calendario, en funciÃ³n del Locale -->
      <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
      <!-- Setup del calendario -->
      <script type="text/javascript" src="scripts/calendar-setup.js"></script>
     <!--*********************************** -->   
    
    
    <form name="Axissin0068Form" action="" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SPROFES" id="SPROFES" value="${__formdata.SPROFES}"/>
    <input type="hidden" name="NORDEN" id="NORDEN" value="${__formdata.NORDEN}"/>
    <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="SAPODERA" id="SAPODERA" value="${__formdata.SAPODERA}"/>
    <input type="hidden" name="GUARDADO" id="GUARDADO" value="${__formdata.GUARDADO}"/>
    <input type="hidden" name="CTRAMITAD" id="CTRAMITAD" value="${__formdata.CTRAMITAD}"/>
    <input type="hidden" name="isNew" id="isNew" value="${__formdata.isNew}"/>
	<input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="titulo" f="axissin068" lit="9909217"/></c:param>
        <c:param name="formulario"><axis:alt c="form" f="axissin068" lit="9909217"/></c:param>
        <c:param name="form">axissin068</c:param>
    </c:import>
    <!-- MODAL -->
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>
      
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper042|axisper042</c:param>
    </c:import>
  

    <div class="separador">&nbsp;</div>
    <table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
        <tr>
            <td>
                <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin068" lit="9909218" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center"--> <!-- UNO -->
                            <tr>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:17%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                
                            </tr>
                            <tr>
                              <axis:ocultar f="axissin068" c="NRECLAMA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin068" c="NRECLAMA" lit="9909219"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin068" c="NPOLIZA" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin068" c="NPOLIZA" lit="9906444"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin068" c="NCERTIF" dejarHueco="false"> 
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin068" c="NCERTIF" lit="101236"></axis:alt></b>
                                  </td>
                              </axis:ocultar>

                            </tr>
                            <tr>               
                                <td class="campocaja">
                                <axis:visible f="axissin068" c="NRECLAMA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NRECLAMA" name="NRECLAMA" size="15"   
                                     <axis:atr f="axissin068" c="NRECLAMA" a="modificable=false"/>  value="${__formdata.NRECLAMA}" title="<axis:alt c="NRECLAMA" f="axissin068" lit="9909219" />" alt="<axis:alt c="NRECLAMA" f="axissin068" lit="9909219" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin068" c="NPOLIZA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NPOLIZA" name="NPOLIZA" size="15"   
                                     <axis:atr f="axissin068" c="NPOLIZA" a="modificable=false"/>  value="${__formdata.NPOLIZA}" title="<axis:alt c="NPOLIZA" f="axissin068" lit="9906444" />" alt="<axis:alt c="NPOLIZA" f="axissin068" lit="9906444" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin068" c="NCERTIF">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:20%"   id="NCERTIF" name="NCERTIF" size="5"   
                                     <axis:atr f="axissin068" c="NCERTIF" a="modificable=false"/>  value="${__formdata.NCERTIF}" title="<axis:alt c="NCERTIF" f="axissin068" lit="101236" />" alt="<axis:alt c="NCERTIF" f="axissin068" lit="101236" />" /> 
                                 </axis:visible>
                                </td>
                               
                              </tr>
                              <tr>
                              <axis:ocultar f="axissin068" c="NRADICA" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin068" c="NRADICA" lit="9909199"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin068" c="TTRAMITAD" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" colspan="2" >
                                        <b><axis:alt f="axissin068" c="TTRAMITAD" lit="9909220"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:ocultar f="axissin068" c="TIEXTERNO" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" >
                                        <b><axis:alt f="axissin068" c="TIEXTERNO" lit="9909221"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              <axis:visible c="CORALPROC" f="axissin068">                            
                        <td class="titulocaja">
                            <b><axis:alt f="axissin068" c="CORALPROC" lit="89908029"/></b><!-- ¿El proceso se llevara a cabo de manera Oral? -->
                        </td>
                        </axis:visible> 

                            </tr>
                            <tr>               
                                <td class="campocaja">
                                <axis:visible f="axissin068" c="NRADICA">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="NRADICA" name="NRADICA" size="15"   
                                     <axis:atr f="axissin068" c="NRADICA" a="modificable=false"/>  value="${__formdata.NRADICA}" title="<axis:alt c="NRADICA" f="axissin068" lit="9909199" />" alt="<axis:alt c="NRADICA" f="axissin068" lit="9909199" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2">
                                <axis:visible f="axissin068" c="TTRAMITAD">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:65%"   id="TTRAMITAD" name="TTRAMITAD" size="15"   
                                     <axis:atr f="axissin068" c="TTRAMITAD" a="modificable=false"/>  value="${__formdata.TTRAMITAD}" title="<axis:alt c="NPOLIZA" f="axissin068" lit="9909220" />" alt="<axis:alt c="TTRAMITAD" f="axissin068" lit="9909220" />" /> 
                                 </axis:visible>
                                </td>
                                <td class="campocaja">
                                <axis:visible f="axissin068" c="TIEXTERNO">
                                    <input type="text" class="campowidthinput campo campotexto" style="width:100%"   id="TIEXTERNO" name="TIEXTERNO" size="15"   
                                     <axis:atr f="axissin068" c="TIEXTERNO" a="modificable=true&obligatorio=false"/>  value="${__formdata.TIEXTERNO}" title="<axis:alt c="TIEXTERNO" f="axissin068" lit="9909221" />" alt="<axis:alt c="TIEXTERNO" f="axissin068" lit="9909221" />" /> 
                                 </axis:visible>
                                </td>
                               <!-- ¿El proceso se llevara a cabo de manera Oral?-->
                      <axis:visible f="axissin083" c="CORALPROC" >
                         <td class="campocaja">
                            <select name = "CORALPROC" id ="CORALPROC" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                           	title="<axis:alt f="axissin083" c="CORALPROC" lit="89908029"/>">                                                    
                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin083" c="C_CORALPROC" lit="1000348"/> - </option>
                               		<c:forEach var="ITEM" items="${__formdata.oral_proceso}">
                                   		 <option value = "${ITEM.CATRIBU}" 
                                    		<c:if test="${ITEM.CATRIBU == __formdata.CORALPROC}">selected</c:if>>
                                             ${ITEM.TATRIBU}
                                 		</option>
                               	   </c:forEach>
                            </select>
                         </td>
                        </axis:visible> 
                              </tr>
                              <tr>
                              <axis:ocultar f="axissin068" c="CPROCESO" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" colspan="2" >
                                        <b><axis:alt f="axissin068" c="CPROCESO" lit="9909222"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                               <axis:ocultar f="axissin068" c="TPROCESO" dejarHueco="false"> <!-- TODO C -->
                                  <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin068" c="TPROCESO" lit="9909223"></axis:alt></b>
                                  </td>
                              </axis:ocultar>
                              </tr>
                              <tr>
                                 <axis:ocultar c="CPROCESO" f="axissin068" dejarHueco="false">
                                 <!-- Clase Proceso -->
                                <td class="campocaja" colspan="2">
                                    <select name = "CPROCESO" id="CPROCESO" style="width:100%" size="1"  class="campowidthselect campo campotexto" <axis:atr f="axissin068" c="CPROCESO" a="modificable=true&obligatorio=true"/> 
                                     alt="<axis:alt c="CPROCESO" f="axissin068" lit="9909222" />" title="<axis:alt c="CPROCESO" f="axissin068" lit="9909222" />" > 
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                                <c:forEach var="clases" items="${__formdata.listaClases}">
                                                    <option value = "${clases.CATRIBU}"
                                                        <c:if test="${clases.CATRIBU == __formdata.CPROCESO}">selected</c:if>>
                                                        ${clases.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>  
                                </axis:ocultar>
                                <axis:ocultar c="TPROCESO" f="axissin068" dejarHueco="false">
                                 <!-- Tipo Proceso -->
                                <td class="campocaja" colspan="2">
                                    <select name = "TPROCESO" id="TPROCESO" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                     <axis:atr f="axissin068" c="TPROCESO" a="modificable=true&obligatorio=true"/> 
                                     alt="<axis:alt c="TPROCESO" f="axissin068" lit="9909223" />" title="<axis:alt c="TPROCESO" f="axissin068" lit="9909223" />" > 
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                                <c:forEach var="tipos" items="${__formdata.listaTipos}">
                                                    <option value = "${tipos.CATRIBU}"
                                                        <c:if test="${tipos.CATRIBU == __formdata.TPROCESO}">selected</c:if>>
                                                        ${tipos.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                    </select>
                                </td>  
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="9909224" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                    <tr>
                                 <!-- C.P -->
                                     <td class="titulocaja">
                                         <b><axis:alt c="CPOSTAL" f="axissin068" lit="9909225" /></b>
                                     </td>
                                     
                                     <!-- Pais -->
                                     <td class="titulocaja">
                                         <b><axis:alt c="CPAIS" f="axissin068" lit="100816" /></b>
                                     </td>
                                     <!-- Provincia -->
                                     <td class="titulocaja">
                                         <b><axis:alt c="CPROVIN" f="axissin068" lit="9902610" /></b>
                                     </td>
         
                                     <!--  PoblaciÃ³n -->
                                     <td class="titulocaja">
                                         <b><axis:alt c="CPOBLAC" f="axissin068" lit="9902611" /></b>
                                     </td>
                                 </tr>
                                 <tr>
                                      <!-- C.P -->
                                    <td class="campocaja">
                                         <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                         <axis:atr f="axissin068" c="CPOSTAL" a="modificable=true&obligatorio=true"/> 
                                     
                                         style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" title="<axis:alt c="CPOSTAL" f="axissin068" lit="9909225" />" alt="<axis:alt c="CPOSTAL" f="axissin068" lit="9909225" />" />
         								&nbsp;
         								<axis:ocultar c="CPOSTALFIND" f="axissin068" dejarHueco="false">
         									<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
         								</axis:ocultar>
                                     </td>                                
                                     <td class="campocaja">
                                         <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.CPAIS}" 
                                         <axis:atr f="axissin068" c="CPAIS" a="modificable=true&obligatorio=true"/> 
                                         title="<axis:alt c="CPAIS" f="axissin068" lit="100816" />" alt="<axis:alt c="CPAIS" f="axissin068" lit="100816" />" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:18%;" />&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('100816', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                         &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                     </td>
                                     <td class="campocaja">
                                         <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" 
                                         <axis:atr f="axissin068" c="CPROVIN" a="modificable=true&obligatorio=true"/> 
                                         title="<axis:alt c="CPROVIN" f="axissin068" lit="9902610" />" alt="<axis:alt c="CPROVIN" f="axissin068" lit="9902610" />" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"  />
                                         &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('9902610', 'LISTA_PROVINCIA', document.Axissin0068Form.CPAIS.value)"/>                
                                         &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                     </td>
                                     
                                     <td class="campocaja">
                                         <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" 
                                         <axis:atr f="axissin068" c="CPOBLAC" a="modificable=true&obligatorio=true"/> 
                                         title="<axis:alt c="CPOBLAC" f="axissin068" lit="9902611" />" alt="<axis:alt c="CPOBLAC" f="axissin068" lit="9902611" />" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" />
                                         &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('9902611', 'LISTA_POBLACION', document.Axissin0068Form.CPROVIN.value,document.Axissin0068Form.CPOSTAL.value)"/>                
                                         &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                     </td>
    
        
                                 
                                </tr>
                                </table>
                                </td>
                             </tr>
                             <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="NNUMIDEPROFES" f="axissin068" lit="9909226" /></b>
                                </td>
                            </tr>
                             <tr>
                                <td class="campocaja"  >
                                    <axis:visible f="axissin068" c="NNUMIDEPROFES">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NNUMIDEPROFES" f="axissin068" lit="9909226" />" title="<axis:alt c="NNUMIDEPROFES" f="axissin068" lit="9909226" />"
                                              <axis:atr f="axissin068" c="NNUMIDEPROFES" a="modificable=true"/>
                                             id="NNUMIDEPROFES" style="width:80%" name="NNUMIDEPROFES" size="100" value="${__formdata.NNUMIDEPROFES}"/>
                                    <img id="findProfesional" border="0" src="images/find.gif" onclick="f_abrir_axisprf000()" style="cursor:pointer" alt=""/>                
                                    </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2" >
                                    <axis:visible f="axissin068" c="NOMBREPROFES">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NOMBREPROFES" f="axissin068" lit="9909226" />" title="<axis:alt c="TLAUDIE" f="axissin068" lit="9909226" />"
                                              <axis:atr f="axissin068" c="NOMBREPROFES" a="modificable=false"/>
                                             id="NOMBREPROFES" style="width:100%" name="NOMBREPROFES" size="100" value="${__formdata.NOMBREPROFES}"/>
                                    </axis:visible>
                                </td>
                             </tr>
                             <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="9909227" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>
                                            <td class="titulocaja">
                                                <div style="float:right;" id="BT_SIN_NUEVO_TRAM_PJ">
                                                <axis:visible f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ"> <!-- tramitaciones JUDICIAL -->
                                                    <div id="BT_SIN_NUEVO_TRAM_PJ">
                                                    <c:if test="${__formdata.isNew == 0}">
                                                        <a href="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=form&TIPO=1&isNew=1&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN});">
                                                        <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9000906"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9000906"/>" src="images/new.gif"/></a>
                                                    </c:if>
                                                    </div>
                                                </axis:visible>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="tdpersonasDeman">
                                    
                                            <c:set var="title0"><axis:alt f="axissin068" c="TTIPPER" lit="100565" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="NNUMIDE" lit="9905773" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="TNOMBRE" lit="105940" /></c:set> <!-- Nombre de la persona-->
                                            <c:set var="lista_personas" value="${__formdata.personasDeman}" />
                                            <div class="displayspace">
                                              <display:table name="${lista_personas}" id="DETPER_PJ" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="TTIPPER" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TTIPPER}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}</div>    
                                                </display:column>												
                                                
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_DETPER_PJ"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_DETPER_PJ"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_DETPER_PJ" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_DETPER_PJ" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=init&isNew=0&NSINIES='+'${__formdata.NSINIES}'+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&NORDEN='+'${__formdata.NORDEN}'+'&NNUMIDE='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}'+'&TNOMBRE='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}'+'&NTIPPER='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NTIPPER}'+'&TIPO=1&NPERSONA='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_DETPER_PJ"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}">
                                                    <div class="dspIcons" id="BT_SIN_ELIMINAR_DETPER_PJ"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                     style="cursor:pointer;" onclick="f_borrar_val_axissin069('&NVALOR='+'${DETPER_PJ.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                        
                                               
                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                                     </table>
                                </td>
                             </tr>
                             <tr>
                               
                                 <td class="titulocaja">
                                     <b><axis:alt c="FRECEP" f="axissin068" lit="9909228" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FNOTIFI" f="axissin068" lit="9900795" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FVENCIMI" f="axissin068" lit="9909229" /></b>
                                 </td>
                                 <td class="titulocaja">
                                     <b><axis:alt c="FRESPUES" f="axissin068" lit="9909230" /></b>
                                 </td>
                                  <td class="titulocaja">
                                     <b><axis:alt c="FCONCIL" f="axissin068" lit="9909231" /></b>
                                 </td>
                                  <td class="titulocaja">
                                     <b><axis:alt c="FDESVIN" f="axissin068" lit="9910767" /></b>
                                 </td>
                             </tr>
                             <tr>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="FRECEP">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FRECEP"  name="FRECEP"  style="width:40%" alt="<axis:alt c="FRECEP" f="axissin068" lit="9909228"/>" title="<axis:alt c="FRECEP" f="axissin068" lit="9909228" />"
                                    <axis:atr f="axissin068" c="FRECEP" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRECEP}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FRECEP"><img id="popup_calendario_FRECEP" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="FNOTIFI">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FNOTIFI"  name="FNOTIFI"  style="width:40%" alt="<axis:alt c="FNOTIFI" f="axissin068" lit="9900795"/>" title="<axis:alt c="FNOTIFI" f="axissin068" lit="9900795" />"
                                    <axis:atr f="axissin068" c="FNOTIFI" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNOTIFI}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FNOTIFI"><img id="popup_calendario_FNOTIFI" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="FVENCIMI">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FVENCIMI"  name="FVENCIMI"  style="width:40%" alt="<axis:alt c="FVENCIMI" f="axissin068" lit="9909229"/>" title="<axis:alt c="FVENCIMI" f="axissin068" lit="9909229" />"
                                    <axis:atr f="axissin068" c="FVENCIMI" a="modificable=true&formato=fecha&obligatorio=true"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FVENCIMI}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FVENCIMI"><img id="popup_calendario_FVENCIMI" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="FRESPUES">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FRESPUES"  name="FRESPUES"  style="width:40%" alt="<axis:alt c="FRESPUES" f="axissin068" lit="9909230"/>" title="<axis:alt c="FRESPUES" f="axissin068" lit="9909230" />"
                                    <axis:atr f="axissin068" c="FRESPUES" a="modificable=true&formato=fecha"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FRESPUES}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FRESPUES"><img id="popup_calendario_FRESPUES" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="FCONCIL">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FCONCIL"  name="FCONCIL"  style="width:40%" alt="<axis:alt c="FCONCIL" f="axissin068" lit="9909231"/>" title="<axis:alt c="FCONCIL" f="axissin068" lit="9909231" />"
                                    <axis:atr f="axissin068" c="FCONCIL" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCONCIL}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FCONCIL"><img id="popup_calendario_FCONCIL" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td class="campocaja"  >
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FDESVIN"  name="FDESVIN"  style="width:40%" alt="<axis:alt c="FDESVIN" f="axissin068" lit="9910767"/>" title="<axis:alt c="FDESVIN" f="axissin068" lit="9910767" />"
                                    <axis:atr f="axissin068" c="FDESVIN" a="modificable=true&formato=fecha&obligatorio=false"/> value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESVIN}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FDESVIN"><img id="popup_calendario_FDESVIN" src="images/calendar.gif"/></a>&nbsp;&nbsp;
                                </td>                             
                             </tr>
                             <tr>
                                 <td class="titulocaja">
                                     <b><axis:alt c="TPRETEN" f="axissin068" lit="9909232" /></b>
                                 </td>
                             </tr>
                             <tr>
                                <td colspan="6" style="width:100%;" class="campocaja">
                                <axis:ocultar c="TPRETEN" f="axissin068" dejarHueco="false">
                                    <textarea  <axis:atr f="axissin068" c="TPRETEN" a="modificable=true&obligatorio=true"/> maxlength="2000" class="campowidthinput campo campotexto" style="width:100%;" name="TPRETEN" id="TPRETEN" >${__formdata.TPRETEN}</textarea>
                                </axis:ocultar>
                                </td>
                            </tr>
                             <tr>
                                 <td class="titulocaja">
                                     <b><axis:alt c="TEXCEP1" f="axissin068" lit="9909233" /></b>
                                 </td>
                             </tr>
                            <tr>
                                <td colspan="6" style="width:100%;" class="campocaja">
                                <axis:ocultar c="TEXCEP1" f="axissin068" dejarHueco="false">
                                    <textarea class="campowidthinput campo campotexto" style="width:100%;"  maxlength="2000" name="TEXCEP1" id="TEXCEP1">${__formdata.TEXCEP1}</textarea>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                 <td class="titulocaja">
                                     <b><axis:alt c="TEXCEP2" f="axissin068" lit="9909234" /></b>
                                 </td>
                             </tr>
                            <tr>
                                <td colspan="6" style="width:100%;" class="campocaja">
                                <axis:ocultar c="TEXCEP2" f="axissin068" dejarHueco="false">
                                    <textarea class="campowidthinput campo campotexto" style="width:100%;"  maxlength="2000" name="TEXCEP2" id="TEXCEP2">${__formdata.TEXCEP2}</textarea>
                                </axis:ocultar>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td class="titulocaja" colspan="2" >
                                    <b><axis:alt c="CCONTI" f="axissin068" lit="9909237" /></b>
                                </td>
                            </tr>    
                            <tr>   
                             <axis:visible f="axissin068" c="CCONTI" >                      
                                <td class="campocaja" colspan="2" >
                                    <select name = "CCONTI" id="CCONTI" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                      <axis:atr f="axissin068" c="CCONTI" a="modificable=true&isInputText=false"/>
                                        alt="<axis:alt c="CCONTI" f="axissin068" lit="9909237" />" title="<axis:alt c="CCONTI" f="axissin068" lit="9909237" />" > 
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                        <c:forEach var="tipos" items="${__formdata.listaContingencia}">
                                            <!-- <option value = "${tipos.CATRIBU}"
                                                <c:if test="${tipos.CATRIBU == __formdata.NCONTIN}">selected</c:if>>
                                                ${tipos.TATRIBU}
                                            </option>-->
                                            <option value = "${tipos.CATRIBU}"
                                                <c:if test="${tipos.CATRIBU == __formdata.CCONTI}">selected</c:if>>
                                                ${tipos.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>           
                                </td>
                                  </axis:visible> 
                            </tr>
                            
                            
                            
               	<!--  JGONZALEZ SE AÃADEN CAMPOS PARA DATOS DETALLADOS DE LOS DESPACHOS-->
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="89906049" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
	                                    <tr>
							                <td class="titulocaja">
					                            <b><axis:alt c="CDESPAO" f="axissin068" lit="9909240" /></b>
					                        </td>
			                                <td class="titulocaja">
			                                    <b><axis:alt f="axissin068" c="CDESCO" lit="9908834" /></b>
			                                </td>
							               	<td class="titulocaja">
							                	<b><axis:alt f="axissin068" c="CPROVINO" lit="100756"/></b>
							               	</td>
							                <td class="titulocaja">
							                    <b><axis:alt f="axissin068" c="CPOBLACO" lit="9903660"/></b>
							                </td>
	                            		</tr>
	                            		   
			                            <tr>
											<td class="campocaja">
					                            <select name = "CDESPAO" id="CDESPAO" style="width:100%"  class="campowidthselect campo campotexto" 
					                                alt="<axis:alt c="CDESPAO" f="axissin068" lit="9909240" />" title="<axis:alt c="CDESPAO" f="axissin068" lit="9909240" />" > 
					                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
					                                <c:forEach var="tipos" items="${__formdata.listaDespachos}">
					                                    <option value = "${tipos.CATRIBU}"
					                                        <c:if test="${tipos.CATRIBU == __formdata.CDESPAO}">selected</c:if>>
					                                        ${tipos.TATRIBU}
					                                    </option>
					                                </c:forEach>
					                            </select>
					                        </td>
					                        
			                                <td class="campocaja">
			                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="CDESCO" f="axissin068" lit="9908834" />" title="<axis:alt c="CDESCO" f="axissin068" lit="9908834" />"
			                                              value="${__formdata.CDESCO}" id="CDESCO" style="width:100%" name="CDESCO"/>
			                                </td>
			                                            
							                <td class="campocaja"  id="td_CPROVINO" >
							                    <select name="CPROVINO" id="CPROVINO" class="campowidthselect campo campotexto_op" style="width:100%;"
			                                             <axis:atr f="axissin068" c="CPROVINO" a="modificable=true&obligatorio=true"/>
						                                title="<axis:alt f="axissin068" c="td_CPROVINO" lit="100756"/>"
							                            onchange="f_cargar_poblaciones(this.value, this.name)">
							                        <option value="<%= Integer.MIN_VALUE %>">
							                            - <axis:alt f="axissin068" c="SELEC" lit="1000348"/> - 
							                        </option>
							                        <c:forEach var="provincias" items="${__formdata.PROVINCIAS}">
							                        <option value = "${provincias.CODIGO}"
							                                <c:if test="${__formdata.CPROVINO == provincias.CODIGO}"> selected </c:if>>
							                            ${provincias.TEXTO}
							                        </option>
							                        </c:forEach>
							                    </select>
							                </td>                                        
			                                            
						                    <td class="campocaja" id="td_CPOBLACO">
						                        <select name = "CPOBLACO" id="CPOBLACO" paramMap="true"
				                                              <axis:atr f="axissin068" c="CPOBLACO" a="modificable=true&obligatorio=true"/>
						                                title="<axis:alt f="axissin068" c="td_CPOBLACO" lit="9903660"/>"
						                                class="campowidthselect campo campotexto">
						                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin068" c="SNV_COMBO" lit="1000348"/> - </option>
						                            <c:forEach var="poblacioneso" items="${__formdata.POBLACIONESO}">
						                                <option value = "${poblacioneso.VALOR}"
						                                <c:if test="${__formdata.CPOBLACO == poblacioneso.VALOR}"> selected </c:if>>
						                                ${poblacioneso.TEXTO}</option>
						                            </c:forEach>
						                        </select>
						                    </td>
			                            </tr>
                            
               	<!--  JGONZALEZ SE AÃADEN CAMPOS PARA DATOS DETALLADOS DE LOS DESPACHOS-->
	                                    <tr>
											<td class="titulocaja">
					                            <b><axis:alt c="CDESPA" f="axissin068" lit="9909238" /></b>
					                        </td>
			                                <td class="titulocaja">
			                                    <b><axis:alt f="axissin068" c="CDESCF" lit="9908834" /></b>
			                                </td>
							               	<td class="titulocaja">
							                	<b><axis:alt f="axissin068" c="CPROVINF" lit="100756"/></b>
							               	</td>
							                <td class="titulocaja">
							                    <b><axis:alt f="axissin068" c="CPOBLACF" lit="9903660"/></b>
							                </td>
			                            </tr>  
			                             
			                            <tr>  
					                        <td class="campocaja">
					                            <select name = "CDESPA" id="CDESPA" style="width:100%" class="campowidthselect campo campotexto" 
					                                alt="<axis:alt c="CDESPA" f="axissin068" lit="9909238" />" title="<axis:alt c="CDESPA" f="axissin068" lit="9909238" />" > 
					                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
					                                <c:forEach var="tipos" items="${__formdata.listaDespachos}">
					                                    <option value = "${tipos.CATRIBU}"
					                                        <c:if test="${tipos.CATRIBU == __formdata.CDESPA}">selected</c:if>>
					                                        ${tipos.TATRIBU}
					                                    </option>
					                                </c:forEach>
					                            </select>
					                        </td>
					                        
			                                <td class="campocaja">
			                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="CDESCF" f="axissin068" lit="9908834" />" title="<axis:alt c="CDESCF" f="axissin068" lit="9908834" />"
			                                              value="${__formdata.CDESCF}" id="CDESCF" style="width:100%" name="CDESCF"/>
			                                </td>
			                                            
							                <td class="campocaja"  id="CPROVINF" >
							                    <select name="CPROVINF" id="CPROVINF" class="campowidthselect campo campotexto_op" style="width:100%;" 
						                                title="<axis:alt f="axissin068" c="td_CPROVINF" lit="100756"/>"
							                            onchange="f_cargar_poblaciones(this.value, this.name)">
							                        <option value="<%= Integer.MIN_VALUE %>">
							                            - <axis:alt f="axissin068" c="SELEC" lit="1000348"/> - 
							                        </option>
							                        <c:forEach var="provincias" items="${__formdata.PROVINCIAS}">
							                        <option value = "${provincias.CODIGO}"
							                                <c:if test="${__formdata.CPROVINF == provincias.CODIGO}"> selected </c:if>>
							                            ${provincias.TEXTO}
							                        </option>
							                        </c:forEach>
							                    </select>
							                </td>                                        
			                                            
						                    <td class="campocaja" id="td_CPOBLACF">
						                        <select name = "CPOBLACF" id="CPOBLACF" paramMap="true" 
						                                title="<axis:alt f="axissin068" c="td_CPOBLACF" lit="9903660"/>"
						                                class="campowidthselect campo campotexto">
						                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin068" c="SNV_COMBO" lit="1000348"/> - </option>
						                            <c:forEach var="poblacionesf" items="${__formdata.POBLACIONESF}">
						                                <option value = "${poblacionesf.VALOR}"
						                                <c:if test="${__formdata.CPOBLACF == poblacionesf.VALOR}"> selected </c:if>>
						                                ${poblacionesf.TEXTO}</option>
						                            </c:forEach>
						                        </select>
						                    </td>                        
			                            </tr>
                                </table>
                                </td>
                             </tr>
                            
                            
                            <axis:ocultar c="TAUDIENCIA" f="axissin068" dejarHueco="false"><!-- Se oculta para que las audiencias se inputen en la agenda de citaciones -->
	                            <tr>
	                                <td class="titulocaja" colspan="6">
	                                    <div class="titulo"> 
	                                        <img  src="images/flecha.gif"/>
	                                        <axis:alt c="flecha" f="axissin068" lit="9909235" /> 
	                                    </div>  
	                                    <div class="separador">&nbsp;</div>
	                            
	                            
<!---------------- INICIO TABLA-->
	                                    <table class="seccion" style="padding: 20px;">
	                                        <tr>
	                                            <td class="titulocaja">
	                                                <div style="float:right;" id="BT_SIN_NUEVA_AUDIENCIA">
	                                                <axis:visible f="axissin068" c="BT_SIN_NUEVA_AUDIENCIA"> <!-- tramitaciones JUDICIAL -->
	                                                    <div id="BT_SIN_NUEVA_AUDIENCIA">
	                                                    <c:if test="${__formdata.isNew == 0}">
	                                                        <a href="javascript:objUtiles.abrirModal('axissin082','src', 'modal_axissin082.do?operation=form&TIPO=1&isNew=1&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&CTRAMITAD='+'${__formdata.CTRAMITAD}');">
	                                                        <img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_NUEVA_AUDIENCIA" lit="9909235"/>" title="<axis:alt f="axissin068" c="BT_SIN_NUEVA_AUDIENCIA" lit="9909235"/>" src="images/new.gif"/></a>
	                                                    </c:if>
	                                                    </div>
	                                                </axis:visible>
	                                                </div>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td>
	                                    
	                                            <c:set var="title0"><axis:alt f="axissin068" c="NAUDIEN" lit="9910195" /></c:set><!-- Numero de audiencia -->
	                                            <c:set var="title1"><axis:alt f="axissin068" c="FAUDIEN" lit="9909200" /></c:set><!-- Fecha de audiencia -->
	                                            <c:set var="title2"><axis:alt f="axissin068" c="HAUDIEN" lit="9909201" /></c:set><!-- Hora de audiencia -->
	                                            <c:set var="title3"><axis:alt f="axissin068" c="TAUDIEN" lit="9909236" /></c:set><!-- Clase de audiencia -->
	                                            <c:set var="title4"><axis:alt f="axissin068" c="TLAUDIE" lit="9909239" /></c:set> <!-- Lugar de audiencia -->
	                                            <c:set var="title5"><axis:alt f="axissin068" c="NOMBREAUDEN" lit="9909244" /></c:set> <!-- Abogado que asiste -->
	                                            <c:set var="title6"><axis:alt f="axissin068" c="CESTADO" lit="100587" /></c:set> <!-- Estado audiencia -->                                            
	                                            
	                                            
	                                            <div class="displayspace">
	                                              <display:table name="${__formdata.AUDIENCIAS}" id="LISTA_AUDIENCIAS" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
	                                               requestURI="">
	                                                <%@ include file="../include/displaytag.jsp"%>
	                                                <display:column title="${title0}" sortable="true" sortProperty="NAUDIEN" headerClass="sortable" media="html" autolink="false" >
	                                                     <div class="dspText">${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NAUDIEN}</div>    
	                                                </display:column>
	                                                
	                                                <display:column title="${title1}" sortable="false"  headerClass="sortable" media="html" autolink="false" >
	                                                     <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.FAUDIEN}"/></div>
	                                                </display:column>
	                                                
	                                                <display:column title="${title2}" sortable="true" sortProperty="HAUDIEN" headerClass="sortable" media="html" autolink="false" >
	                                                     <div class="dspText">${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.HAUDIEN}</div>    
	                                                </display:column>    
	
	                                                <display:column title="${title3}" sortable="true" sortProperty="TAUDIEN" headerClass="sortable" media="html" autolink="false" >
	                                                    <c:forEach var="tipos" items="${__formdata.listaClases}">
	                                                        <c:if test="${tipos.CATRIBU == LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.TAUDIEN}">
	                                                            <div class="dspText">${tipos.TATRIBU}</div> 
	                                                        </c:if>
	                                                    </c:forEach>
	                                                </display:column>  
	
	                                                <display:column title="${title4}" sortable="true" sortProperty="TLAUDIE" headerClass="sortable" media="html" autolink="false" >
	                                                     <div class="dspText">${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.TLAUDIE}</div>    
	                                                </display:column>  
	
	                                                <display:column title="${title5}" sortable="true" sortProperty="NOMBREAUDEN" headerClass="sortable" media="html" autolink="false" >
	                                                     <div class="dspText">${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NOMBREAUDEN}</div>    
	                                                </display:column>  
	
	                                                <display:column title="${title6}" sortable="true" sortProperty="CESTADO" headerClass="sortable" media="html" autolink="false" >                                                     
	                                                    <c:forEach var="tipos" items="${__formdata.listaEstados}">
	                                                        <c:if test="${tipos.CATRIBU == LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.CESTADO}">
	                                                            <div class="dspText">${tipos.TATRIBU}</div>
	                                                        </c:if>
	                                                    </c:forEach>
	                                                </display:column>
	                                                
	                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_AUDIENCIA"> <!--boton editar audiencia asociada -->
	                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
	                                                    <c:if test="${(!empty LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NAUDIEN)}">
	                                                        <div class="dspIcons" id="BT_SIN_EDITAR_AUDIENCIA"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_AUDIENCIA" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_AUDIENCIA" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
	                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin082','src', 'modal_axissin082.do?operation=init&TIPO=1&isNew=0&NSINIES='+'${__formdata.NSINIES}'+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&NORDEN='+'${__formdata.NORDEN}'+'&NAUDIEN='+'${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NAUDIEN}'+'&CTRAMITAD='+'${__formdata.CTRAMITAD}');"/></div>
	                                                    </c:if>
	                                                </display:column> 
	                                                </axis:visible>
	                                               
	                                                <axis:visible f="axissin006" c="BT_SIN_ELIMINAR_AUDIENCIA"> <!--boton Eliminar audiencia asociada -->
	                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
	                                                   <c:if test="${!empty LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NAUDIEN}">
	                                                    <div class="dspIcons"><img border="0"  src="images/delete.gif" width="15px" height="15px"
	                                                    style="cursor:pointer;" onclick="javascript:objUtiles.ejecutarFormulario('modal_axissin068.do?NSINIES_RES='+'${__formdata.NSINIES}'+'&NTRAMIT_RES='+'${__formdata.NTRAMIT}'+'&TIPO_DEL=3&NORDEN_RES='+'${__formdata.NORDEN}'+'&NVALOR='+'${LISTA_AUDIENCIAS.OB_IAX_SIN_T_JUDICIAL_AUDIEN.NAUDIEN}', 'borrar', document.Axissin0068Form, '_self', objJsMessages.jslit_cargando);"/>
	                                                    </div>
	                                                    </c:if>
	                                                </display:column> 
	                                                </axis:visible>
	                                        
	                                               
	                                            </display:table>
	                                            </div>
	                                            </td>
	                                        </tr>
	                                     </table>
<!---------------- FIN TABLA-->
	                                </td>
	                            </tr>
                            </axis:ocultar>
                            
                            <tr>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt c="CPOSICI" f="axissin068" lit="9909253" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt c="CDEMAND" f="axissin068" lit="9909254" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width:100%;" class="campocaja">
                                <axis:ocultar c="CPOSICI" f="axissin068" dejarHueco="false">
                                    <select name = "CPOSICI" id="CPOSICI" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CPOSICI" f="axissin068" lit="9909253" />" title="<axis:alt c="CPOSICI" f="axissin068" lit="9909253" />" > 
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                        <c:forEach var="posiciones" items="${__formdata.listaPosiciones}">
                                        <option value = "${posiciones.CATRIBU}"
                                                            <c:if test="${posiciones.CATRIBU == __formdata.CPOSICI}">selected</c:if>>
                                                            ${posiciones.TATRIBU}
                                        </option>
                                        </c:forEach>
                                    </select>
                                </axis:ocultar>
                                </td>
                                <td colspan="2" style="width:100%;" class="campocaja">
                                <axis:ocultar c="CDEMAND" f="axissin068" dejarHueco="false">
                                    <select name = "CDEMAND" id="CDEMAND" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CDEMAND" f="axissin068" lit="9909254" />" title="<axis:alt c="CDEMAND" f="axissin068" lit="9909254" />" > 
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                        <c:forEach var="clases" items="${__formdata.listaClasesDemanda}">
                                        <option value = "${clases.CATRIBU}"
                                                            <c:if test="${clases.CATRIBU == __formdata.CDEMAND}">selected</c:if>>
                                                            ${clases.TATRIBU}
                                        </option>
                                        </c:forEach>
                                    </select>
                                </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="NNUMIDEAPO" f="axissin068" lit="9909255" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="NNUMIDEAPO">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NNUMIDEAPO" f="axissin068" lit="9909255" />" title="<axis:alt c="NNUMIDEAPO" f="axissin068" lit="9909255" />"
                                              <axis:atr f="axissin068" c="NNUMIDEAPO" a="modificable=true"/>
                                              onchange="javascript:f_actualizar_persona();"
                                              value="${__formdata.NNUMIDEAPO}"
                                             id="NNUMIDEAPO" style="width:80%" name="NNUMIDEAPO" size="100" />
                                    <img id="findPersonaAudi" border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>                
                                </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2" >
                                <axis:visible f="axissin068" c="NOMBREAPO">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="NOMBREAPO" f="axissin068" lit="9909255" />" title="<axis:alt c="NOMBREAPO" f="axissin068" lit="9909255" />"
                                              <axis:atr f="axissin068" c="NOMBREAPO" a="modificable=false"/>
                                              value="${__formdata.NOMBREAPO}"
                                             id="NOMBREAPO" style="width:100%" name="NOMBREAPO" size="100" />
                                </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="IDEMAND" f="axissin068" lit="9909256" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja"  >
                                <axis:visible f="axissin068" c="IDEMAND">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="IDEMAND" f="axissin068" lit="9909256" />" title="<axis:alt c="IDEMAND" f="axissin068" lit="9909256" />"
                                              <axis:atr f="axissin068" c="IDEMAND" a="modificable=true&obligatorio=true"/>
                                             value="${__formdata.IDEMAND}"
                                             id="IDEMAND" style="width:100%" name="IDEMAND" size="100" />            
                                </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="9909257" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>
                                            <td class="titulocaja" colspan="6">
                                                <div style="float:right;" id="BT_SIN_NUEVO_PRETEN">
                                                <axis:visible f="axissin006" c="BT_SIN_NUEVO_PRETEN"> <!-- Nueva pretension-->
                                                    <div id="BT_SIN_NUEVO_PRETEN">
                                                    <c:if test="${__formdata.isNew == 0}">
                                                        <a href="javascript:objUtiles.abrirModal('axissin066','src', 'modal_axissin066.do?operation=form&isNew=1&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO});">
                                                        <img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_NUEVO_PRETEN" lit="9909232"/>" title="<axis:alt f="axissin068" c="BT_SIN_NUEVO_PRETEN" lit="9909232"/>" src="images/new.gif"/></a>
                                                    </c:if>
                                                    </div>
                                                </axis:visible>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
					    <!---IAXIS3595 AABC 06/05/2019 PROCESO JUDICIAL--->
                                            <td colspan="6" id="TDVALPRETENSION">
                                    
                                            <c:set var="title0"><axis:alt f="axissin068" c="TGARANT" lit="9909013" /></c:set><!-- Amparo -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="TMONEDA" lit="89907052" /></c:set><!--Moneda-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="ICAPITAL" lit="9902924" /></c:set> <!-- Valor asegurado-->
                                            <c:set var="title3"><axis:alt f="axissin065" c="TMONEDAFAUL" lit="108645" /></c:set><!--Moneda-->
                                            <c:set var="title4"><axis:alt f="axissin068" c="IPRETEN" lit="9903367" /></c:set> <!-- Valor pretension-->
                                            <c:set var="title5"><axis:alt f="axissin068" c="CUSUALT" lit="9001265" /></c:set> <!-- Valor pretension-->
                                            <c:set var="title6"><axis:alt f="axissin068" c="FMODIFI" lit="9000564" /></c:set> <!-- Valor pretension-->
                                             
                                            <div class="displayspace">
                                              <display:table name="${__formdata.GARANTIAS}" id="VALPRETENSION" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="true" sortProperty="TGARANT" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.TGARANT}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="CMONEDA" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}</div>    
                                                </display:column>    

                                               <display:column title="${title2}" sortable="true" sortProperty="ICAPITAL" headerClass="sortable" media="html" autolink="false" >  
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}"/></div>
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="true" sortProperty="TMONEDAFAUL" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${__formdata.CMONEDAFAUL}</div>    
                                                </display:column>  
                                                
                                                <display:column title="${title4}" sortable="true" sortProperty="IPRETEN" headerClass="sortable" media="html" autolink="false" >
                                                   <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN}"/></div>
                                                </display:column> 
                                                <display:column title="${title5}" sortable="true" sortProperty="CUSUALT" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CUSUALT}</div>    
                                                </display:column>
                                                <display:column title="${title6}" sortable="true" sortProperty="FMODIFI" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.FMODIFI}</div>    
                                                </display:column>
                                                <!---IAXIS3595 AABC 06/05/2019 PROCESO JUDICIAL--->
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_PRETENSION"> <!--boton editar persona asociada -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_PRETENSION"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_PRETENSION" lit="100002"/>" title1="<axis:alt f="axissin068" c="BT_SIN_EDITAR_PRETENSION" lit="9901356"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin066','src','modal_axissin066.do?operation=form&isNew=0&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN}+'&SSEGURO='+${__formdata.SSEGURO}+'&CGARANT='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}+'&CMONEDA='+'${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CMONEDA}'+'&ICAPITAL='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.ICAPITAL}+'&IPRETEN='+${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.IPRETEN});"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin068" c="BT_SIN_ELIMINAR_PRETENSION"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}">
                                                   <div class="dspIcons" id="BT_SIN_ELIMINAR_PRETENSION"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                     style="cursor:pointer;" onclick="f_borrar_valpretension_axissin066('&NVALOR='+'${VALPRETENSION.OB_IAX_SIN_T_VALPRETENSION.CGARANT}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                               
                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"/>
                                            <td class="titulocaja"/>
                                            <td class="titulocaja">
                                                <b><axis:alt c="ITOTASEG" f="axissin068" lit="9909259" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="ITOTPRET" f="axissin068" lit="9909260" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td class="campocaja"/>
                                            <td class="campocaja"/>
                                            <td class="campocaja">
                                            <axis:visible f="axissin068" c="ITOTASEG">    
                                                <input   type="text" class="campowidthinput campo campotexto" 
                                                alt="<axis:alt c="ITOTASEG" f="axissin068" lit="9909259" />" title="<axis:alt c="ITOTASEG" f="axissin068" lit="9909259" />"
                                                value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ITOTASEG}"/>" 
                                                <axis:atr f="axissin068" c="ITOTASEG" a="modificable=false"/>
                                                id="ITOTASEG" style="width:50%" name="ITOTASEG" />            
                                            </axis:visible>
                                            </td>
                                            <td class="campocaja">
                                            <axis:visible f="axissin068" c="ITOTPRET">    
                                                <input   type="text" class="campowidthinput campo campotexto" 
                                                alt="<axis:alt c="ITOTPRET" f="axissin068" lit="9909260" />" title="<axis:alt c="ITOTPRET" f="axissin068" lit="9909260" />"
                                                 value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.ITOTPRET}"/>" 
                                                <axis:atr f="axissin068" c="ITOTPRET" a="modificable=false"/>
                                                id="ITOTPRET" style="width:50%" name="ITOTPRET"  />            
                                            </axis:visible>
                                            </td>
                                        </tr>
                                     </table>
                                </td>
                             </tr>
                             <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="FTDEMAN" f="axissin068" lit="9909261" /></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt c="ICONDEN" f="axissin068" lit="9909262" /></b>
                                </td>
                            </tr>
                            <tr>
                                <td style="titulocaja" class="campocaja">
                                <axis:visible f="axissin068" c="FTDEMAN">
                                    <input   type="text"  class="campowidthinput campo campotexto" id="FTDEMAN"  name="FTDEMAN"  style="width:40%" 
                                    alt="<axis:alt c="FTDEMAN" f="axissin068" lit="9909261"/>" 
                                    title="<axis:alt c="FTDEMAN" f="axissin068" lit="9909261" />"
                                    <axis:atr f="axissin068" c="FTDEMAN" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTDEMAN}"/>"/>                                    
                                    <a style="vertical-align:middle;" id="icon_FTDEMAN"><img id="popup_calendario_FTDEMAN" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                </axis:visible>
                                </td>
                                <td colspan="2" style="width:100%;" class="campocaja">
                                <axis:visible f="axissin068" c="ICONDEN">    
                                    <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="ICONDEN" f="axissin068" lit="9909262" />" title="<axis:alt c="ICONDEN" f="axissin068" lit="9909262" />"
                                              value="${__formdata.ICONDEN}"
                                              <axis:atr f="axissin068" c="ICONDEN" a="modificable=true"/>
                                             id="ICONDEN" style="width:100%" name="ICONDEN" size="100"/>            
                                </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja" colspan="6">
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="1000079" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>
                                            <td class="titulocaja">
                                                <div style="float:right;" id="BT_SIN_NUEVO_BENEF">
                                                <axis:visible f="axissin006" c="BT_SIN_NUEVO_BENEF"> <!-- beneficiarios -->
                                                    <div id="BT_SIN_NUEVO_BENEF">
                                                    <c:if test="${__formdata.isNew == 0}">
                                                        <a href="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=form&TIPO=2&isNew=1&NSINIES='+${__formdata.NSINIES}+'&NTRAMIT='+${__formdata.NTRAMIT}+'&NORDEN='+${__formdata.NORDEN});">
                                                        <img border="0" alt="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9000906"/>" title="<axis:alt f="axissin006" c="BT_SIN_NUEVO_TRAM_PJ" lit="9000906"/>" src="images/new.gif"/></a>
                                                    </c:if>
                                                    </div>
                                                </axis:visible>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="tdpersonasBenef">
                                    
                                            <c:set var="title0"><axis:alt f="axissin068" c="TTIPPER" lit="9906386" /></c:set><!-- Tipo de persona -->
                                            <c:set var="title1"><axis:alt f="axissin068" c="NNUMIDE" lit="9905773" /></c:set><!--Numero identificacion-->
                                            <c:set var="title2"><axis:alt f="axissin068" c="TNOMBRE" lit="105940" /></c:set> <!-- Nombre de la persona-->
                                            <c:set var="title3"><axis:alt f="axissin068" c="IIMPORTE" lit="9905283" /></c:set> <!-- Importe a pagar-->
                                            <c:set var="lista_personas1" value="${__formdata.personasBenef}" />
                                            <div class="displayspace">
                                            
                                              <display:table name="${lista_personas1}" id="DETPER_BENEF" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               requestURI="">
                                               
                                                <%@ include file="../include/displaytag.jsp"%>
                                               
                                                <display:column title="${title0}" sortable="true" sortProperty="TTIPPER" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TTIPPER}</div>    
                                                </display:column>
                                                <display:column title="${title1}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}</div>    
                                                </display:column>    

                                                <display:column title="${title2}" sortable="true" sortProperty="TNOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}</div>    
                                                </display:column>
                                                
                                                <display:column title="${title3}" sortable="true" sortProperty="IIMPORTE" headerClass="sortable" media="html" autolink="false" >
                                                     <div class="dspText">${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.IIMPORTE}</div>    
                                                </display:column>	
                                                
                                                <axis:visible f="axissin068" c="BT_SIN_EDITAR_BENEF"> <!--boton editar beneficiario -->
                                                <display:column title="${title7}" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                    <c:if test="${(!empty DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE)}">
                                                        <div class="dspIcons" id="BT_SIN_EDITAR_BENEF"><img border="0" alt="<axis:alt f="axissin068" c="BT_SIN_EDITAR_BENEF" lit="100002"/>" title1="<axis:alt f="axissin006" c="BT_SIN_EDITAR_BENEF" lit="100002"/>" src="images/lapiz.gif" width="15px" height="15px"
                                                        style="cursor:pointer;" onclick="javascript:objUtiles.abrirModal('axissin069','src', 'modal_axissin069.do?operation=init&TIPO=2&isNew=0&NSINIES='+'${__formdata.NSINIES}'+'&NTRAMIT='+'${__formdata.NTRAMIT}'+'&NORDEN='+'${__formdata.NORDEN}'+'&NNUMIDE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}'+'&TNOMBRE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.TNOMBRE}'+'&NTIPPER='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NTIPPER}'+'&NPERSONA='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}'+'&IIMPORTE='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.IIMPORTE}');"/></div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                               
                                                <axis:visible f="axissin068" c="BT_SIN_ELIMINAR_BENEF"> <!--boton Eliminar beneficiario asociado -->
                                                <display:column title="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <c:if test="${!empty DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NNUMIDE}">
                                                     <div class="dspIcons" id="BT_SIN_ELIMINAR_BENEF"><img border="0"  src="images/delete.gif" width="15px" height="15px"
                                                    style="cursor:pointer;"  onclick="f_borrar_val_axissin069('&NVALOR='+'${DETPER_BENEF.OB_IAX_SIN_T_JUDICIAL_DETPER.NPERSONA}');this.parentElement.parentElement.parentElement.remove();"/>
                                                    </div>
                                                    </c:if>
                                                </display:column> 
                                                </axis:visible>
                                              
                                               
                                            </display:table>
                                            </div>
                          
                                     
                                     
                                            </td>
                                        </tr>
                                     </table>
                                </td>
                            </tr>
                            <tr >
                                <td class="titulocaja" colspan="9" >
                                    <div class="titulo"> 
                                        <img  src="images/flecha.gif"/>
                                        <axis:alt c="flecha" f="axissin068" lit="89908034" /> 
                                    </div>  
                                    <div class="separador">&nbsp;</div>
                                    <table class="seccion" style="padding: 20px;">
                                        <tr>
                               
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt c="CSENTEN" f="axissin068" lit="9903489" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="FSENTE1" f="axissin068" lit="9909246" /></b>
                                            </td>
                                            <td class="titulocaja" colspan="1">
                                                <b><axis:alt c="CSENTEN2" f="axissin068" lit="9903489" /></b>
                                            </td>
                                            <td class="titulocaja" >
                                                <b><axis:alt c="FSENTE2" f="axissin068" lit="9909247" /></b>
                                            </td> 
                                            <!-- Unica Instancia -->
											<td class="titulocaja">
                                                <b><axis:alt c="UNICAINST" f="axissin068" lit="89908030" /></b>
                                            </td> 
                                            <!-- Fecha Unica Instancia -->
											<axis:ocultar f="axissin068" c="FUNICAINST" dejarHueco="false"> 
				                            <td class="titulocaja">
				                                <b><axis:alt f="axissin068" c="FUNICAINST_LIT" lit="89908031"/></b>
				                            </td>
				                       		</axis:ocultar>                             
                                            <td class="titulocaja">
                                                <b><axis:alt c="CASACION" f="axissin068" lit="9910267" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="FCASACI" f="axissin068" lit="9910268" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2">
                                                <select name = "CSENTEN" id="CSENTEN" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CSENTEN" f="axissin068" lit="9903489" />" title="<axis:alt c="CSENTEN" f="axissin068" lit="9903489" />" > 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaSentencia}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CSENTEN}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                            <td class="campocaja"  >
                                                <axis:visible f="axissin068" c="FSENTE1">
                                                <input   type="text"  class="campowidthinput campo campotexto" id="FSENTE1"  name="FSENTE1"  style="width:40%" 
                                                alt="<axis:alt c="FSENTE1" f="axissin068" lit="9909246"/>" title="<axis:alt c="FSENTE1" f="axissin068" lit="9909246" />"
                                                    <axis:atr f="axissin068" c="FSENTE1" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSENTE1}"/>"/>                                    
                                                <a style="vertical-align:middle;" id="icon_FSENTE1"><img id="popup_calendario_FSENTE1" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                                </axis:visible>
                                            </td>  
                                            <td class="campocaja" colspan="1">
                                                <select name = "CSENTEN2" id="CSENTEN2" style="width:100%" size="1"  class="campowidthselect campo campotexto" 
                                                    alt="<axis:alt c="CSENTEN2" f="axissin068" lit="9903489" />" title="<axis:alt c="CSENTEN2" f="axissin068" lit="9903489" />" > 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaSentencia}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CSENTEN2}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td> 
                                            <td class="campocaja"  >
                                                <axis:visible f="axissin068" c="FSENTE2">
                                                <input   type="text"  class="campowidthinput campo campotexto" id="FSENTE2"  name="FSENTE2"  style="width:40%" 
                                                alt="<axis:alt c="FSENTE2" f="axissin068" lit="9909247"/>" title="<axis:alt c="FSENTE2" f="axissin068" lit="9909247" />"
                                                    <axis:atr f="axissin068" c="FSENTE2" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSENTE2}"/>"/>                                    
                                                <a style="vertical-align:middle;" id="icon_FSENTE2"><img id="popup_calendario_FSENTE2" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                                </axis:visible>
                                            </td>
                                            <!-- Unica Instancia -->
 											<td class="campocaja">                                                
                                                <input   type="checkbox" onclick="f_onclickCheckbox(this)" class="campowidthinput campo campotexto" alt="<axis:alt c="UNICAINST" f="axissin068" lit="89908030" />" title="<axis:alt c="UNICAINST" f="axissin068" lit="89908030" />"
                                                          value="${__formdata.UNICAINST}" id="UNICAINST" style="width:100%" name="UNICAINST" <c:if test="${1 == __formdata.UNICAINST}">checked</c:if>>
                                                </input>
                                            </td> 
                                            <!-- Fecha Unica Instancia -->
												<td class="campocaja">
                                                <axis:visible f="axissin068" c="FUNICAINST">
                                                <input   type="text"  class="campowidthinput campo campotexto" id="FUNICAINST"  name="FUNICAINST"  style="width:40%" 
                                                alt="<axis:alt c="FUNICAINST" f="axissin068" lit="89908031"/>" title="<axis:alt c="FUNICAINST" f="axissin068" lit="89908031" />"
                                                    <axis:atr f="axissin068" c="FUNICAINST" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FUNICAINST}"/>"/>                                    
                                                <a style="vertical-align:middle;" id="icon_FUNICAINST"><img id="popup_calendario_FUNICAINST" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                                </axis:visible>
                                            </td>
                                            <td class="campocaja">                                                
                                                <input   type="checkbox" onclick="f_onclickCheckbox(this)" class="campowidthinput campo campotexto" alt="<axis:alt c="CASACION" f="axissin068" lit="101159" />" title="<axis:alt c="CASACION" f="axissin068" lit="101159" />"
                                                          value="${__formdata.CASACION}" id="CASACION" style="width:100%" name="CASACION" <c:if test="${1 == __formdata.CASACION}">checked</c:if>>
                                                </input>
                                            </td> 
                                            <td class="campocaja">
                                                <axis:visible f="axissin068" c="FCASACI">
                                                <input   type="text"  class="campowidthinput campo campotexto" id="FCASACI"  name="FCASACI"  style="width:40%" 
                                                alt="<axis:alt c="FCASACI" f="axissin068" lit="9910268"/>" title="<axis:alt c="FCASACI" f="axissin068" lit="9910268" />"
                                                    <axis:atr f="axissin068" c="FCASACI" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FCASACI}"/>"/>                                    
                                                <a style="vertical-align:middle;" id="icon_FCASACI"><img id="popup_calendario_FCASACI" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                                </axis:visible>
                                            </td> 
                                        </tr>
                                        <tr>     
                                            <td class="titulocaja" colspan="2">
                                                <b><axis:alt c="CTSENTE" f="axissin068" lit="9909263" /></b>
                                            </td>
                                            <td class="titulocaja">
                                                <b><axis:alt c="FTSENTE" f="axissin068" lit="104998" /></b>
                                            </td> 
                                            <td class="titulocaja" id="VTSENTE_tit" colspan="2">
                                                <b><axis:alt c="VTSENTE" f="axissin068" lit="101159" /></b>
                                            </td>                                           
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2">
                                                <select name = "CTSENTE" id="CTSENTE" style="width:100%" size="1"  class="campowidthselect campo campotexto" onchange="javascript:f_campos_adicionales();" 
                                                    alt="<axis:alt c="CTSENTE" f="axissin068" lit="9909263" />" title="<axis:alt c="CTSENTE" f="axissin068" lit="9909263" />" > 
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SV" f="axissin068" lit="1000348"/> - </option>
                                                    <c:forEach var="tipos" items="${__formdata.listaTerminacion}">
                                                        <option value = "${tipos.CATRIBU}"
                                                            <c:if test="${tipos.CATRIBU == __formdata.CTSENTE}">selected</c:if>>
                                                            ${tipos.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>  
                                            <td class="campocaja">
                                                <axis:visible f="axissin068" c="FTSENTE">
                                                <input   type="text"  class="campowidthinput campo campotexto" id="FTSENTE"  name="FTSENTE"  style="width:40%" 
                                                alt="<axis:alt c="FTSENTE" f="axissin068" lit="104998"/>" title="<axis:alt c="FTSENTE" f="axissin068" lit="104998" />"
                                                    <axis:atr f="axissin068" c="FTSENTE" a="modificable=true&formato=fecha&obligatorio=false"/> 
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FTSENTE}"/>"/>                                    
                                                <a style="vertical-align:middle;" id="icon_FTSENTE"><img id="popup_calendario_FTSENTE" src="images/calendar.gif"/></a>&nbsp;&nbsp;                                
                                                </axis:visible>
                                            </td> 
                                            <td class="campocaja" id="VTSENTE_td" colspan="04">
                                                <input   type="text" class="campowidthinput campo campotexto" alt="<axis:alt c="VTSENTE" f="axissin068" lit="101159" />" title="<axis:alt c="VTSENTE" f="axissin068" lit="101159" />"
                                                          value="${__formdata.VTSENTE}" <axis:atr f="axissin068" c="V" a="modificable=true"/> id="VTSENTE" style="width:100%" name="VTSENTE" size="100">
                                                </input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="titulocaja">
                                                <b><axis:alt c="TFALLO" f="axissin068" lit="9909264" /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="9" style="width:100%;" class="campocaja">
                                            <axis:ocultar c="TFALLO" f="axissin068" dejarHueco="false">
                                                <textarea class="campowidthinput campo campotexto" maxlength="2000" style="width:100%;" name="TFALLO" id="TFALLO">${__formdata.TFALLO}</textarea>
                                            </axis:ocultar>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                            </tr>
                            </table> <!-- UNO -->
            
            
            
                
                
            </td>
        </tr>
    </table>
  </td>
</tr>
</table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin068</c:param><c:param name="f">axissin068</c:param>
    <c:param name="f">axissin068</c:param>
         <c:param name="__botones"><axis:visible c="BT_CANCELAR" f="axissin068">,cancelar</axis:visible><axis:visible c="BT_ACEPTAR" f="axissin068">,aceptar</axis:visible></c:param> 
    </c:import> 
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FRECEP",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FRECEP", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FNOTIFI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FNOTIFI", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FVENCIMI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FVENCIMI", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FRESPUES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FRESPUES", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FCONCIL",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCONCIL", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FDESVIN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FDESVIN", 
                singleClick    :    true,
                firstDay       :    1
            });
               Calendar.setup({
                inputField     :    "FTDEMAN",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FTDEMAN", 
                singleClick    :    true,
                firstDay       :    1
            });         
               Calendar.setup({
                inputField     :    "FSENTE1",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FSENTE1", 
                singleClick    :    true,
                firstDay       :    1
            });  
               Calendar.setup({
                inputField     :    "FSENTE2",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FSENTE2", 
                singleClick    :    true,
                firstDay       :    1
            });  
               Calendar.setup({
                inputField     :    "FTSENTE",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FTSENTE", 
                singleClick    :    true,
                firstDay       :    1
            });  
               Calendar.setup({
                inputField     :    "FCASACI",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCASACI", 
                singleClick    :    true,
                firstDay       :    1
            });  
             
               Calendar.setup({
                   inputField     :    "FUNICAINST",     
                   ifFormat       :    "%d/%m/%Y",      
                   button         :    "popup_calendario_FUNICAINST", 
                   singleClick    :    true,
                   firstDay       :    1
               });
</script>
<c:import url="../include/mensajes.jsp" />
</body>
</html>
