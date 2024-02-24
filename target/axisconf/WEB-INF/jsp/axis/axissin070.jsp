<%/* Revision:# U7STn/zSCWTHmX9RWdiJdQ== # */%>


<%
	/*
	*  Fichero: axissin070.jsp
	*  Fecha: 03/02/2009
	*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}" />
<%@ page import="java.util.*" %>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes" />
<html>
<head>
<link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="stylesheet" href="styles/displaytag.css">
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->
<!--*********************************** -->
<style>
.bold {
	font-weight: bold;
	font-size: 10px;
}

.campo {
	width: 200px;
}

.selectdisabled {
	background-color: transparent /* This hides the background */;
	background-image: none;
	-webkit-appearance: none /* Webkit Fix */;
	border: none;
	box-shadow: none;
}
</style>
<script language="Javascript" type="text/javascript">
	/****************************************************************************************/
	/*********************************** NAVEGACION *****************************************/
	/****************************************************************************************/

	function f_onload() {
		<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}"> 
		Calendar.setup({
			inputField : "FINGRESO",
			ifFormat : "%d/%m/%Y",
			button : "icon_FINGRESO",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FTERMINO",
			ifFormat : "%d/%m/%Y",
			button : "icon_FTERMINO",
			singleClick : true,
			firstDay : 1
		});
		Calendar.setup({
			inputField : "FSALIDA",
			ifFormat : "%d/%m/%Y",
			button : "icon_FSALIDA",
			singleClick : true,
			firstDay : 1
		});
		
		</c:if>
		 if (${requestScope.grabarOK == true}) {
	            parent.f_aceptar_axissin070();
	        }
		
	     //bug4713 apoyo tecnico item por defecto
	       <c:if test="${__formdata.NUEVO == 'OK'}"> 
	       var obj = new Object();
	        obj.value= 'AI00'
	        f_cambia_cunitra(obj);
	       </c:if>
		   
  
	       
		
		f_cargar_propiedades_pantalla();		
	}

	function f_cambia_cunitra(obj){   
	 	if (obj.value != "null"){
            objAjax.invokeAsyncCGI("axis_axissin070.do", callbackAjaxSelectedCunitra,"operation=ajax_selected_cunitra&CUNITRA="+obj.value,this, objJsMessages.jslit_actualizando_registro);
            }
	}

    function callbackAjaxSelectedCunitra(ajaxResponseText) {
        var tramitadoresCombo = document.miForm.CTRAMITAD;
        try {
           var doc=objAjax.domParse(ajaxResponseText);                 
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                    objDom.borrarOpcionesDeCombo(tramitadoresCombo);
                    
                    for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                        var TTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0].childNodes[0].nodeValue : "");
                        var CTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0].childNodes[0].nodeValue : "");

                        objDom.addOpcionACombo(CTRAMITAD, CTRAMITAD+' - '+TTRAMITAD, tramitadoresCombo, i);
                    }
                }else{
                    objDom.borrarOpcionesDeCombo (tramitadoresCombo);
                    objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                }
            }
            
        } catch (e) {
            objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
            alert(objJsMessages.jslit_sin_tramitadores);
        }
    }    
	
	
	
	
	
	function cargar_pantalla_por_clase() {
		f_cargar_propiedades_pantalla();
		
	}

	function isNumberKey(evt)
	   {
	       var charCode = (evt.which) ? evt.which : event.keyCode
	       if (charCode > 31 && (charCode < 48 || charCode > 57))
	           return false;
	        return true;
	   }
	
	function getTime(dato){
		var d = dato;
		var dateParts = new Date((Number(d.split("/")[2])), (Number(d.split("/")[1]) - 1), (Number(d.split("/")[0])));
		var dateis = dateParts.getTime();
		return dateis;
	}
	function f_but_aceptar() {
		if (objValidador.validaEntrada()){		
			if(getTime(document.miForm.FINGRESO.value)<=getTime(document.miForm.FTERMINO.value)){  
					if(getTime(document.miForm.FSALIDA.value) != null && getTime(document.miForm.FSALIDA.value)<getTime(document.miForm.FINGRESO.value) ){
						alert("<axis:alt f='axissin070' c='TFECHAS' lit='9909946' />");
					}else{						
						document.miForm.action="axis_axissin070.do?operation=aceptar";
						document.miForm.target="_self";       
			            document.miForm.submit();
				    	objUtiles.cerrarModal("axissin070");
					}
			}else{
				alert("<axis:alt f='axissin070' c='TFECHAS' lit='9909945' />");	
			}
        }
	}
	
	function responseDF(response){}

	function f_but_cancelar() {
		parent.f_but_cerrar_axissin070();
	}
	

	
		
	function callBackResponse(response){
		document.miForm.action="axis_axissin070.do?operation=aceptar";
		document.miForm.target="_self";       
        document.miForm.submit();  
	}
	

	
	function f_cerrar_axiscom001() {
        objUtiles.cerrarModal("axiscom001");
    }
	
	//@BRSP
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
          
        }
        
        function f_buscar_TPAIS(CPAIS) {
                <%if (((java.util.Map) request.getAttribute("__formdata")) != null) {
				java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
				if (((java.util.Map) formdata.get("listValores")) != null) {
					java.util.Map lista = (java.util.Map) formdata.get("listValores");
					if (((java.util.ArrayList) lista.get("lstPaises")) != null) {
						java.util.ArrayList paises = (java.util.ArrayList) lista.get("lstPaises");
						for (int i = 0; i < paises.size(); i++) {
							java.util.HashMap paisHash = (java.util.HashMap) paises.get(i);%>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}
					}
				}
			}%> 
        }
        /**************************************IAXIS3602 Modification start*******************************/
        function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
        
        function f_onchange_CPOBLAC(CPOBLAC){
            //Se obtiene el codigo DANE ingresado por el usuario o calculado con anterioridad
            var CPOSTAL = objDom.getValorPorId("CPOSTAL");
            var CPROVIN = objDom.getValorPorId("CPROVIN");
            var CPAIS = objDom.getValorPorId("CPAIS");
            var CPOBLAC = objDom.getValorPorId("CPOBLAC");
            //Se verifica si el campo del codigo DANE esta vacio para calcularlo
            if (objUtiles.estaVacio(CPOSTAL)){
               if (!objUtiles.estaVacio(CPROVIN)&&!objUtiles.estaVacio(CPOBLAC)&&!objUtiles.estaVacio(CPAIS)){
                          //Si los campos de departamento, pais y municipio estan diligenciados, se calcula el codigo DANE
                          CPOSTAL = ("00" + CPROVIN).slice(-2).concat(("000" + CPOBLAC).slice(-3));
                          //Se valida el codigo DANE en base de datos. 
                          objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOBLAC, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
               }
            }
      }
        
        function callbackAjaxOnblurCPOBLAC(ajaxResponseText) {
    		try{
                 var doc = objAjax.domParse(ajaxResponseText);                            
    			 if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                               if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])
                                   &&objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])
                                   &&objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])
                                   ) {
    				                   var CPROVIN = objDom.getValorPorId("CPROVIN");
                                       var CPOBLAC = objDom.getValorPorId("CPOBLAC");
                                       objDom.setValorPorId("CPOSTAL",("00" + CPROVIN).slice(-2).concat(("000" + CPOBLAC).slice(-3)));
                                       document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                                       document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                                       document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                                       
                                       
    				}
    				
    			}
    		} catch (e) {
    		    if (isDebugAjaxEnabled == "true")
    				alert (e.name + " " + e.message);
    		}
        }
        
        /**************************************IAXIS3602 Modification close*******************************/
        
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
            }catch (e) {
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
			document.miForm.CPAIS.focus();     
			objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);        
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
		function f_abrir_axisper021_persona() {			
			objUtiles.abrirModal("axisper021", "src",
					"modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE=&SSEGURO=&faceptar=f_aceptar_persona_axisper021&ORIGEN=AXISSIN070");
		}
		function f_cerrar_axisper021() {
			objUtiles.cerrarModal("axisper021");
	<%session.removeAttribute("faceptar");%>
		}
		
		
		function f_aceptar_persona(selectedPerson, CAGENTE, SNIP, modal) {
			try {
				$("#CAGENTE").val(CAGENTE);
				var porigen = 'INT';
				f_cerrar_axisper021()
				objDom.setValorPorId("SPERSON", selectedPerson);
				objAjax.invokeAsyncCGI("modal_axiscga002.do",
							callbackajaxGetPersona,
							"operation=ajax_get_persona&SPERSON_REL=" + selectedPerson
							+ "&CAGENTE1=" + CAGENTE,
							this, objJsMessages.jslit_actualizando_registro);
				

			} catch (e) {
				if (isDebugAjaxEnabled == "true")
					alert(e.name + " " + e.message);
			}
		}
		
		function callbackajaxGetPersona(ajaxResponseText) {
			var doc = objAjax.domParse(ajaxResponseText);
			//alert(ajaxResponseText);
			if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

				//document.miForm.NNUMIDE.value = '';
				document.miForm.CUNITRA.value = '';
				document.miForm.SPERSON.value = '';

				var TNOMBRE = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TNOMBRE")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TNOMBRE"), 0, 0) : "");

				var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TAPELLI1")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TAPELLI1"), 0, 0) : "");

				var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("TAPELLI2")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("TAPELLI2"), 0, 0) : "");

				var CTIPIDE = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("CTIPIDE")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("CTIPIDE"), 0, 0) : "");

				var NNUMIDE = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("NNUMIDE")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("NNUMIDE"), 0, 0) : "");

				var SPERSON = ((objUtiles.hayValorElementoXml(doc
						.getElementsByTagName("SPERSON")[0])) ? objDom
						.getValorNodoDelComponente(doc
								.getElementsByTagName("SPERSON"), 0, 0) : "");

				//document.miForm.NNUMIDE.value = NNUMIDE;
				document.miForm.CUNITRA.value = TAPELLI1 + "" + TAPELLI2 + " ,"
						+ TNOMBRE;

				objDom.setValorPorId("SPERSON", SPERSON);

			}
		}
</script>
</head>
<body onload="f_onload()">




	<c:import url="../include/precargador_ajax.jsp">
		<c:param name="imagen" value="images/ajax-loader.gif"></c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axissin070_a" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axissin070_b" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axissin070_c" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041"
				lit="9002274" />
		</c:param>
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
    </c:import>

	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042"
				lit="9002274" />
		</c:param>
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt c="TITULO_021" f="axiscga001" lit="1000178" />
		</c:param>
		<c:param name="nid" value="axisper021" />
	</c:import>
	
<form name="miForm" id="miForm" action="" method="POST">
	<c:import url="../include/titulo_nt.jsp">
		<c:param name="producto">
			<axis:alt f="axissin070" c="TITULO" lit="9909852" />
		</c:param>
		<c:param name="formulario">
			<axis:alt f="axissin070" c="TITULO" lit="9909852" />
		</c:param>
		<c:param name="form">axissin070</c:param>
	</c:import>



	<input type="hidden" name="CDOMICI" value="${__formdata.DETSIN_TRAMITA_APOYOS.CDOMICI}" />
	<input type="hidden" name="TPAIS" value="${__formdata.DETSIN_TRAMITA_APOYOS.TPAIS}" />
	<input type="hidden" name="TPROVIN" value="${__formdata.DETSIN_TRAMITA_APOYOS.TPROVIN}" />
	<input type="hidden" name="TPOBLAC" value="${__formdata.DETSIN_TRAMITA_APOYOS.TPOBLAC}" /> 
	<input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.DETSIN_TRAMITA_APOYOS.CAGENTE}" />
	<input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.DETSIN_TRAMITA_APOYOS.SPERSON}" />
	<input type="hidden" name="TPERSON" id="TPERSON" value="${__formdata.DETSIN_TRAMITA_APOYOS.TPERSON}" />

    <input type="hidden" name="MENSWARNINFO" id="MENSWARNINFO" value="${__formdata.MENSWARNINFO}" /> 
	<input type="hidden" name="SINTAPOY" id="SINTAPOY" value="${__formdata.SINTAPOY}" /> 
	<input type="hidden" name="NSINIES" id="NSINIES" value="${__formdata.NSINIES}" /> 
	<input type="hidden" name="NTRAMIT" id="NTRAMIT" value="${__formdata.NTRAMIT}" /> 
	<input type="hidden" name="ACTIONMOD" id="ACTIONMOD" value="${__formdata.ACTIONMOD}" />


	<div class="separador">&nbsp;</div>
	<table  class="mainModalDimensions base"  align="center" cellpadding="0" cellspacing="0"><!--id="tabla1" -->
		<tr>
			<td>
	            <!-- Seccion -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin070" lit="9909852" /> 
                </div>  
				<table class="seccion">
	                <tr>
	                    <td align="left">
	                    
	                        	<table class="area" align="center"--> <!-- UNO -->
		
									<tr>
										<axis:ocultar dejarHueco="false" f="axissin070" c="CUNITRA">
											<td>
												<span class="bold"><axis:alt f="axissin070" c="CUNITRA" lit="9909849"></axis:alt></span><br />
													<select title="<axis:alt f='axissin070' c='CUNITRA' lit='9909849' />"  style="width: 200px;"
														alt="<axis:alt f='axissin070' c='CUNITRA' lit='9909849' />" name="CUNITRA" id="CUNITRA"
														size="1" onchange="f_cambia_cunitra(this)" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CUNITRA" a="isInputText=false&modificable=true&obligatorio=true"/>>
															<option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin070" c="BLANCO" lit="1000348"/> - </option>
															<c:forEach var="unidadesTramitacion" items="${__formdata.listValores.lstcunitra}">
																<option value="${unidadesTramitacion.CTRAMITAD}"<c:if test="${unidadesTramitacion.CTRAMITAD == __formdata.DETSIN_TRAMITA_APOYOS.CUNITRA}">selected</c:if>>
																	${unidadesTramitacion.TTRAMITAD}
																</option>
															</c:forEach>
													</select> 
											</td>
						
										</axis:ocultar>				
									
										<axis:ocultar dejarHueco="false" f="axissin070" c="CTRAMITAD">                        
						                	<td>
					                       		<span class="bold"><axis:alt f="axissin070" c="CTRAMITAD" lit="140769"></axis:alt></span><br/>
						                           <select name = "CTRAMITAD" id ="CTRAMITAD" size="1"
						                           <axis:atr f="axissin070" c="CTRAMITAD" a="modificable=true&isInputText=false&obligatorio=true"/> 
						                           	style="width:80%" class="campowidthselect campo campotexto_ob">                                                    
						                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin070" c="SNV_COMBO" lit="1000348"/> - </option>
						                               <c:forEach var="tramitadores" items="${__formdata.listValores.lsttramit}">
						                                   <option value = "${tramitadores.CTRAMITAD}" <c:if test="${tramitadores.CTRAMITAD == __formdata.DETSIN_TRAMITA_APOYOS.CTRAMITAD}"> selected </c:if>>
						                                       ${tramitadores.CTRAMITAD} - ${tramitadores.TTRAMITAD} 
						                                   </option>
						                               </c:forEach>
						                           </select>
			                      			</td>
						            	</axis:ocultar>
									</tr>									
										
									<tr>
										<axis:ocultar dejarHueco="false" f="axissin070" c="FINGRESO">
											<td><span class="bold"><axis:alt f="axissin070" c="FINGRESO" lit="9909845"></axis:alt></span><br />
												<input type="text" name="FINGRESO" id="FINGRESO" size="15" class="campo campotexto"
												style="width: 200px;"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DETSIN_TRAMITA_APOYOS.FINGRESO}"/>"
												title="<axis:alt f='axissin070' c='FINGRESO' lit='9909845'/>"
												alt="<axis:alt f='axissin070' c='FINGRESO' lit='9909845'/>"
												<axis:atr f="axissin070" c="FINGRESO" a="formato=fecha&modificable=true&obligatorio=true"/> />
												<a style="vertical-align: middle;"> <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">
														<img id="icon_FINGRESO" alt="<axis:alt f="axissin070" c="FINGRESO" lit="9909845"/>"
															title="<axis:alt f="axissin070" c="FINGRESO" lit="9909845" />" src="images/calendar.gif" />
													</c:if>
											</a></td>
										</axis:ocultar>
						
										<axis:ocultar dejarHueco="false" f="axissin070" c="FTERMINO">
											<td><span class="bold"><axis:alt f="axissin070" c="FTERMINO" lit="9909846"></axis:alt></span><br />
												<input type="text" name="FTERMINO" id="FTERMINO" size="15" class="campo campotexto"
												style="width: 200px;"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DETSIN_TRAMITA_APOYOS.FTERMINO}"/>"
												title="<axis:alt f='axissin070' c='FTERMINO' lit='9909846'/>"
												alt="<axis:alt f='axissin070' c='FTERMINO' lit='9909846'/>"
												<axis:atr f="axissin070" c="FTERMINO" a="formato=fecha&modificable=true&obligatorio=true"/> />
												<a style="vertical-align: middle;"> <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">
														<img id="icon_FTERMINO" alt="<axis:alt f="axissin070" c="FTERMINO" lit="9909846"/>"
															title="<axis:alt f="axissin070" c="FTERMINO" lit="9909846" />" src="images/calendar.gif" />
													</c:if>
											</a></td>
										</axis:ocultar>
						
										<axis:ocultar dejarHueco="false" f="axissin070" c="FSALIDA">
											<td><span class="bold"><axis:alt f="axissin070" c="FSALIDA" lit="9909847"></axis:alt></span><br />
												<input type="text" name="FSALIDA" id="FSALIDA" size="15" class="campo campotexto"
												style="width: 200px;"
												value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.DETSIN_TRAMITA_APOYOS.FSALIDA}"/>"
												title="<axis:alt f='axissin070' c='FSALIDA' lit='9909847'/>"
												alt="<axis:alt f='axissin070' c='FSALIDA' lit='9909847'/>"
												<axis:atr f="axissin070" c="FSALIDA" a="formato=fecha&modificable=true&obligatorio=false"/> />
												<a style="vertical-align: middle;"> <c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">
														<img id="icon_FSALIDA" alt="<axis:alt f="axissin070" c="FSALIDA" lit="9909847"/>"
															title="<axis:alt f="axissin070" c="FSALIDA" lit="9909847" />" src="images/calendar.gif" />
													</c:if>
											</a></td>
										</axis:ocultar>
										<td></td>
									</tr>
										
										
										
								<!-- SECCION DE UBICACION -->
								<tr>
	                                <td class="titulocaja" colspan="6">
	                					<div class="separador">&nbsp;</div>
	                                    <div class="titulo"> 
	                                        <img  src="images/flecha.gif"/>
	                                        <axis:alt c="flecha" f="axissin070" lit="9909851" /> 
	                                    </div>  
	                                    <table class="seccion" style="padding: 20px;">
								
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="TOBSERVA">
													<td colspan="4"><span class="bold"><axis:alt f="axissin070"
																c="TOBSERVA" lit="9909850"></axis:alt></span><br /> <textarea rows="5" style="width: 120%;"
															name="TOBSERVA" id="TOBSERVA" class="campowidthinput campo campotexto"
															<axis:atr f="axissin070" c="TOBSERVA" a="modificable=true"/>
															alt="<axis:alt f="axissin070" c="TOBSERVA" lit="9909850" />"
															title="<axis:alt f="axissin070" c="TOBSERVA" lit="9909850" />">${__formdata.DETSIN_TRAMITA_APOYOS.TOBSERVA}</textarea></td>
												</axis:ocultar>
											</tr>
								
											<tr>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CTIPDIR">
													<td colspan="5"><span class="bold"><axis:alt f="axissin070" c="CTIPDIR"
																lit="100565"></axis:alt></span><br /> <select
														title="<axis:alt f='axissin070' c='CTIPDIR' lit='100565' />"
														alt="<axis:alt f='axissin070' c='CTIPDIR' lit='100565' />" name="CTIPDIR" id="CTIPDIR"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CTIPDIR" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="element" items="${__formdata.listValores.lstTipoDireccion}">
																<option value="${element.CATRIBU}"
																	<c:if test="${element.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CTIPDIR}">selected</c:if>>${element.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
								
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="CSIGLAS">
													<td><span class="bold"><axis:alt f="axissin070" c="CSIGLAS" lit="1000348"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CSIGLAS' lit='1000348' />"
														alt="<axis:alt f='axissin070' c='CSIGLAS' lit='1000348' />" name="CSIGLAS" id="CSIGLAS"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CSIGLAS" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
																<option value="${element.CSIGLAS}"
																	<c:if test="${element.CSIGLAS == __formdata.DETSIN_TRAMITA_APOYOS.CSIGLAS}">selected</c:if>>${element.TDENOM}
																</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNOMVIA0">
													<td><span class="bold"><axis:alt f="axissin070" c="TNOMVIA0" lit="110029"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="TNOMVIA0" id="TNOMVIA0"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNOMVIA0}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNOMVIA0" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNOMVIA0" lit="110029" />"
														title="<axis:alt f="axissin070" c="TNOMVIA0" lit="110029" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="NNUMVIA">
													<td><span class="bold"><axis:alt f="axissin070" c="NNUMVIA" lit="800440"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="NNUMVIA" id="NNUMVIA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.NNUMVIA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="NNUMVIA" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="NNUMVIA" lit="800440" />"
														title="<axis:alt f="axissin070" c="NNUMVIA" lit="800440" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TCOMPLE">
													<td><span class="bold"><axis:alt f="axissin070" c="TCOMPLE" lit="110031"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="TCOMPLE" id="TCOMPLE"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TCOMPLE}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TCOMPLE" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TCOMPLE" lit="110031" />"
														title="<axis:alt f="axissin070" c="TCOMPLE" lit="110031" />" /></td>
												</axis:ocultar>
												<td></td>
								
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="CVIAVP">
													<td><span class="bold"><axis:alt f="axissin070" c="CVIAVP" lit="9902408"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CVIAVP' lit='9902408' />"
														alt="<axis:alt f='axissin070' c='CVIAVP' lit='9902408' />" name="CVIAVP" id="CVIAVP" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CVIAVP" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstTipoVia}">
																<option value="${clase.CSIGLAS}"
																	<c:if test="${clase.CSIGLAS == __formdata.DETSIN_TRAMITA_APOYOS.CVIAVP}">selected</c:if>>${clase.TDENOM}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNOMVIA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNOMVIA" lit="9903010"></axis:alt></span><br />
														<input type="text" name="TNOMVIA" id="TNOMVIA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNOMVIA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNOMVIA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNOMVIA" lit="9903010" />"
														title="<axis:alt f="axissin070" c="TNOMVIA" lit="9903010" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CLITVP">
													<td><span class="bold"><axis:alt f="axissin070" c="CLITVP" lit="9909856"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CLITVP' lit='9909856' />"
														alt="<axis:alt f='axissin070' c='CLITVP' lit='9909856' />" name="CLITVP" id="CLITVP" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CLITVP" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCLITVP}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CLITVP}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CBISVP">
													<td><span class="bold"><axis:alt f="axissin070" c="CBISVP" lit="9909860"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CBISVP' lit='9909860' />"
														alt="<axis:alt f='axissin070' c='CBISVP' lit='9909860' />" name="CBISVP" id="CBISVP" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CBISVP" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCBISVP}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CBISVP}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CORVP">
													<td><span class="bold"><axis:alt f="axissin070" c="CORVP" lit="9902411"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CORVP' lit='9902411' />"
														alt="<axis:alt f='axissin070' c='CORVP' lit='9902411' />" name="CORVP" id="CORVP" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CORVP" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="element" items="${__formdata.listValores.lstCORVP}">
																<option value="${element.CATRIBU}"
																	<c:if test="${element.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CORVP}">selected</c:if>>${element.TATRIBU}
																</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="NVIAADCO">
													<td><span class="bold"><axis:alt f="axissin070" c="NVIAADCO" lit="9909855"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="NVIAADCO" id="NVIAADCO"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.NVIAADCO}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="NVIAADCO" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="NVIAADCO" lit="9909855" />"
														title="<axis:alt f="axissin070" c="NVIAADCO" lit="9909855" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CLITCO">
													<td><span class="bold"><axis:alt f="axissin070" c="CLITCO" lit="9909856"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CLITCO' lit='9909856' />"
														alt="<axis:alt f='axissin070' c='CLITCO' lit='9909856' />" name="CLITCO" id="CLITCO" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CLITCO" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCLITCO}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CLITCO}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CORCO">
													<td><span class="bold"><axis:alt f="axissin070" c="CORCO" lit="9909862"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CORCO' lit='9909862' />"
														alt="<axis:alt f='axissin070' c='CORCO' lit='9909862' />" name="CORCO" id="CORCO" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CORCO" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCLITVP}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CORCO}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
								
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="NPLACACO">
													<td><span class="bold"><axis:alt f="axissin070" c="NPLACACO" lit="9902415"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="NPLACACO" id="NPLACACO"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.NPLACACO}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="NPLACACO" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="NPLACACO" lit="9902415" />"
														title="<axis:alt f="axissin070" c="NPLACACO" lit="9902415" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="COR2CO">
													<td><span class="bold"><axis:alt f="axissin070" c="COR2CO" lit="9902411"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='COR2CO' lit='9902411' />"
														alt="<axis:alt f='axissin070' c='COR2CO' lit='9902411' />" name="COR2CO" id="COR2CO" size="1"
														onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="COR2CO" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCOR2CO}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.COR2CO}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
											</tr>
								
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="CDET1IA">
													<td><span class="bold"><axis:alt f="axissin070" c="CDET1IA" lit="9902417"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CDET1IA' lit='9902417' />"
														alt="<axis:alt f='axissin070' c='CDET1IA' lit='9902417' />" name="CDET1IA" id="CDET1IA"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CDET1IA" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCDET}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CDET1IA}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM1IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM1IA" lit="9902418"></axis:alt></span><br />
														<input type="text" name="TNUM1IA" id="TNUM1IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM1IA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNUM1IA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM1IA" lit="9902418" />"
														title="<axis:alt f="axissin070" c="TNUM1IA" lit="9902418" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="CDET2IA">
													<td><span class="bold"><axis:alt f="axissin070" c="CDET2IA" lit="9902419"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CDET2IA' lit='9902419' />"
														alt="<axis:alt f='axissin070' c='CDET2IA' lit='9902419' />" name="CDET2IA" id="CDET2IA"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CDET2IA" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCDET}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CDET2IA}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM2IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM2IA" lit="9902415"></axis:alt></span><br />
														<input type="text" name="TNUM2IA" id="TNUM2IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM2IA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNUM2IA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM2IA" lit="9902415" />"
														title="<axis:alt f="axissin070" c="TNUM2IA" lit="9902415" />" /></td>
												</axis:ocultar>
												<td></td>
								
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="CDET3IA">
													<td><span class="bold"><axis:alt f="axissin070" c="CDET3IA" lit="9902421"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CDET3IA' lit='9902421' />"
														alt="<axis:alt f='axissin070' c='CDET3IA' lit='9902421' />" name="CDET3IA" id="CDET3IA"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CDET3IA" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstCDET}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CDET3IA}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM3IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM3IA" lit="9902422"></axis:alt></span><br />
														<input type="text" name="TNUM3IA" id="TNUM3IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM3IA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNUM3IA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM3IA" lit="9902422" />"
														title="<axis:alt f="axissin070" c="TNUM3IA" lit="9902422" />" /></td>
												</axis:ocultar>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
								
											</tr>
								
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="CSIGLAS">
													<td><span class="bold"><axis:alt f="axissin070" c="CSIGLAS" lit="110028"></axis:alt></span><br />
														<select title="<axis:alt f='axissin070' c='CSIGLAS' lit='110028' />"
														alt="<axis:alt f='axissin070' c='CSIGLAS' lit='110028' />" name="CSIGLAS" id="CSIGLAS"
														size="1" onchange="cargar_pantalla_por_clase();" class="campowidthselect campo campotexto_ob"
														<axis:atr f="axissin070" c="CSIGLAS" a="isInputText=false&modificable=true"/>>
															<option selected value>-
																<axis:alt f="axissin070" c="BLANCO" lit="1000348" /> -
															</option>
															<c:forEach var="clase" items="${__formdata.listValores.lstTipoVia}">
																<option value="${clase.CATRIBU}"
																	<c:if test="${clase.CATRIBU == __formdata.DETSIN_TRAMITA_APOYOS.CSIGLAS}">selected</c:if>>${clase.TATRIBU}</option>
															</c:forEach>
													</select></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNOMVIA2">
													<td><span class="bold"><axis:alt f="axissin070" c="TNOMVIA2" lit="110029"></axis:alt></span><br />
														<input type="text" name="TNOMVIA2" id="TNOMVIA2"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNOMVIA2}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNOMVIA2" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNOMVIA2" lit="110029" />"
														title="<axis:alt f="axissin070" c="TNOMVIA2" lit="110029" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM1IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM1IA" lit="9904598"></axis:alt></span><br />
														<input onkeypress="return isNumberKey(event)" type="text" name="TNUM1IA" id="TNUM1IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM1IA}" class="campowidthinput campo campotexto"
														style="width: 50%;"
														<axis:atr f="axissin070" c="TNUM1IA" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM1IA" lit="9904598" />"
														title="<axis:alt f="axissin070" c="TNUM1IA" lit="9904598" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="NNUMVIA">
													<td><input onkeypress="return isNumberKey(event)" type="text" name="NNUMVIA" id="NNUMVIA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.NNUMVIA}" class="campowidthinput campo campotexto"
														style="width: 50%;"
														<axis:atr f="axissin070" c="NNUMVIA" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="NNUMVIA" lit="9904598" />"
														title="<axis:alt f="axissin070" c="NNUMVIA" lit="9904598" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TCOMPLE">
													<td><input onkeypress="return isNumberKey(event)" type="text" name="TCOMPLE" id="TCOMPLE"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TCOMPLE}" class="campowidthinput campo campotexto"
														style="width: 50%;"
														<axis:atr f="axissin070" c="TCOMPLE" 
											a="formato=entero&modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TCOMPLE" lit="9904598" />"
														title="<axis:alt f="axissin070" c="TCOMPLE" lit="9904598" />" /></td>
												</axis:ocultar>
								
								
											</tr>
											<tr>
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM2IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM2IA" lit="9904595"></axis:alt></span><br />
														<input type="text" name="TNUM2IA" id="TNUM2IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM2IA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNUM2IA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM2IA" lit="9904595" />"
														title="<axis:alt f="axissin070" c="TNUM2IA" lit="9904595" />" /></td>
												</axis:ocultar>
								
												<axis:ocultar dejarHueco="false" f="axissin070" c="TNUM3IA">
													<td><span class="bold"><axis:alt f="axissin070" c="TNUM3IA" lit="9904596"></axis:alt></span><br />
														<input type="text" name="TNUM3IA" id="TNUM3IA"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.TNUM3IA}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="TNUM3IA" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="TNUM3IA" lit="9904596" />"
														title="<axis:alt f="axissin070" c="TNUM3IA" lit="9904596" />" /></td>
												</axis:ocultar>
												<td></td>
												<td></td>
												<td></td>
								
											</tr>
											
											<tr>
												<axis:ocultar c="CPOSTAL" f="axissin070" dejarHueco="false">
													<td class="campocaja"><b><axis:alt f="axissin070" c="CPOSTAL" lit="101081" /></b><br />
														<input type="text" class="campowidthinput campo campotexto" size="15" 
														value="${__formdata.DETSIN_TRAMITA_APOYOS.CPOSTAL}" name="CPOSTAL" id="CPOSTAL"
														style="text-transform: uppercase; width: 60%;" onblur="f_onblur_CPOSTAL(this.value)"
														title="<axis:alt f="axissin070" c="CPOSTAL" lit="101081"/>"
														<axis:atr f="axissin070" c="CPOSTAL" a="isInputText=false&modificable=true&obligatorio=true"/> /> &nbsp; <c:if
															test="${__formdata.ACTIONMOD != 'CONSULTA'}">
															<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();"
																style="cursor: pointer" alt="" />
														</c:if></td>
												</axis:ocultar>
								
												<td class="campocaja"><span class="bold"><axis:alt f="axissin070" c="CPAIS"
															lit="100816"></axis:alt></span><br /> <input type="text" class="campowidthinput campo campotexto" 
													size="15"
													value="${__formdata.DETSIN_TRAMITA_APOYOS.CPAIS}<c:if test="${empty __formdata.CPAIS}">${__configform.axisper012__CPAIS__valordefecto}</c:if>"
													name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width: 18%;"
													title="<axis:alt f="axissin070" c="CPAIS" lit="100816"/>"
													<axis:atr f="axissin070" c="CPAIS" a="isInputText=false&modificable=true&obligatorio=true"/> /> <c:if
														test="${__formdata.ACTIONMOD != 'CONSULTA'}">&nbsp;<img id="findPais" border="0"
															src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)"
															style="cursor: pointer" />
													</c:if> &nbsp;<span id="TPAIS_span"><b>${__formdata.DETSIN_TRAMITA_APOYOS.TPAIS}</b></span></td>
												<td class="campocaja"><span class="bold"><axis:alt f="axissin070" c="TDEPB"
															lit="9902610"></axis:alt></span><br /> <input type="text" class="campowidthinput campo campotexto" 
													size="15" value="${__formdata.DETSIN_TRAMITA_APOYOS.CPROVIN}" name="CPROVIN" id="CPROVIN"
													onchange="f_onchange_CPROVIN()" style="width: 18%;"
													title="<axis:alt f="axissin070" c="CPROVIN" lit="100756"/>"
													<axis:atr f="axissin070" c="CPROVIN" a="isInputText=false&modificable=true&obligatorio=true"/> /> <c:if
														test="${__formdata.ACTIONMOD != 'CONSULTA'}">&nbsp;<img id="findProvincia"
															style="visibility:${empty __formdata.DETSIN_TRAMITA_APOYOS.CPAIS && empty __configform.axisper012__CPAIS__valordefecto ? 'hidden' : 'visible'};cursor:pointer"
															border="0" src="images/find.gif"
															onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)" />
													</c:if> &nbsp;<span id="TPROVIN_span"><b>${__formdata.DETSIN_TRAMITA_APOYOS.TPROVIN}</b></span></td>
												<td class="campocaja"><span class="bold"><axis:alt f="axissin070" c="CCIUDAD"
															lit="9908410"></axis:alt></span><br /> <input type="text" class="campowidthinput campo campotexto" 
													size="15" value="${__formdata.DETSIN_TRAMITA_APOYOS.CPOBLAC}" name="CPOBLAC" id="CPOBLAC"
													onblur="f_onchange_CPOBLAC()" style="width: 18%;"
													title="<axis:alt f="axissin070" c="CPOBLAC" lit="100817"/>"
													<axis:atr f="axissin070" c="CPOBLAC" a="isInputText=false&modificable=true&obligatorio=true"/> /> <c:if
														test="${__formdata.ACTIONMOD != 'CONSULTA'}"> &nbsp;<img id="findPoblacion"
															style="visibility:${empty __formdata.DETSIN_TRAMITA_APOYOS.CPROVIN  ? 'hidden' : 'visible'};cursor:pointer"
															border="0" src="images/find.gif"
															onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value, document.miForm.CPOSTAL.value)" />
														<c:if test='${ __formdata.sin_provincias == 1}'> &nbsp;<img id="findPoblacion2"
																style="visibility: hidden; cursor: pointer" border="0" src="images/find.gif"
																onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION_NOPROV', document.miForm.CPAIS.value, document.miForm.CPAIS.value)" />
														</c:if>
													</c:if> &nbsp;<span id="TPOBLAC_span"><b>${__formdata.DETSIN_TRAMITA_APOYOS.TPOBLAC}</b></span>
												</td>
												
												<axis:ocultar dejarHueco="false" f="axissin070" c="LOCALIDAD">
													<td><span class="bold"><axis:alt f="axissin070" c="LOCALIDAD" lit="9903353"></axis:alt></span><br />
														<input type="text" name="LOCALIDAD" id="LOCALIDAD"
														value="${__formdata.DETSIN_TRAMITA_APOYOS.LOCALIDAD}" class="campowidthinput campo campotexto"
														style="width: 90%;"
														<axis:atr f="axissin070" c="LOCALIDAD" a="modificable=true&obligatorio=false"/>
														alt="<axis:alt f="axissin070" c="LOCALIDAD" lit="9903353" />"
														title="<axis:alt f="axissin070" c="LOCALIDAD" lit="9903353" />" /></td>
												</axis:ocultar>
											</tr>
	
	                                	</table>
	                                </td>
	                             </tr>
	                             
	                             <tr>
	                                <td class="titulocaja" colspan="6">
	                					<div class="separador">&nbsp;</div>
	                                    <div class="titulo"> 
	                                        <img  src="images/flecha.gif"/>
	                                        <axis:alt c="flecha" f="axissin070" lit="101162" /> 
	                                    </div>  
	                					<div class="separador">&nbsp;</div>
												<axis:ocultar dejarHueco="false" f="axissin070" c="TOBSERVA2">
															
													<textarea rows="5" style="width: 100%;"
													name="TOBSERVA2" id="TOBSERVA2" class="campowidthinput campo campotexto"
													<axis:atr f="axissin070" c="TOBSERVA2" a="modificable=true&obligatorio=false"/>
													alt="<axis:alt f="axissin070" c="TOBSERVA2" lit="101162" />"
													title="<axis:alt f="axissin070" c="TOBSERVA2" lit="101162" />">${__formdata.DETSIN_TRAMITA_APOYOS.TOBSERVA2}</textarea>
												</axis:ocultar>
	                                </td>
	                             </tr>	                             	
	
							</table> <!-- UNO -->
	
			            </td>
			        </tr>
				</table>	
			</td>
		</tr>
	</table>
	
	<div class="separador">&nbsp;</div>
	<c:if test="${__formdata.ACTIONMOD != 'CONSULTA'}">
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axissin070</c:param>
			<c:param name="f">axissin070</c:param>
			<c:param name="__botones">cancelar,aceptar</c:param>
		</c:import>
	</c:if>
	<c:if test="${__formdata.ACTIONMOD == 'CONSULTA'}">
		<c:import url="../include/botonera_nt.jsp">
			<c:param name="f">axissin070</c:param>
			<c:param name="__botones">cancelar</c:param>
		</c:import>
	</c:if>
</form>
<c:import url="../include/mensajes.jsp" />
</body>
</html>