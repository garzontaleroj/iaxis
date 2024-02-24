<%/* Revision:# 80ACRDRFO2XSLu37p/po8A== # */%>
<%/**
*  Fichero: axisctr102.jsp
* 
*  Busqueda de simulación
*	
*
*
*  Fecha: 26/01/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %><% //ecg20131002 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%
//ecg20131002 http://mantis.srvcsi.com/view.php?id=26795#c154608 acceso directo desde aplicacion externa
UsuarioBean usuario=(UsuarioBean)session.getAttribute("__usuario");
String CONTINUE=(String)usuario.getContenedor().remove("CONTINUE");
usuario.getContenedor().remove("CONTINUE");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr102" c="LIT_BUSC_SIMUL" lit="1000200"/></title>
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
        <script type="text/javascript">
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/

var pendientePreseleccionarSPRODUC=""; //ecg20131002 http://mantis.srvcsi.com/view.php?id=26795#c154608 acceso directo desde aplicacion externa
            function f_onload() {
				var puedoBuscarProductos=true;
<%
if (CONTINUE!=null) { //ecg20131002 http://mantis.srvcsi.com/view.php?id=26795#c154608 acceso directo desde aplicacion externa
    if (CONTINUE.startsWith("axismenu:axisctr102|SPRODUC_Y_CRAMO=")) { //axismenu:axisctr102|SPRODUC_Y_CRAMO=7000_107_18000|SIMULACION
        String miSPRODUC_Y_CRAMO=CONTINUE.substring(CONTINUE.indexOf("|SPRODUC_Y_CRAMO=")+17);
        miSPRODUC_Y_CRAMO=miSPRODUC_Y_CRAMO.substring(0, miSPRODUC_Y_CRAMO.indexOf("|"));

		//ecg20131002 http://mantis.srvcsi.com/view.php?id=26795#c154608
        String[] miSPRODUC_Y_CRAMOs=org.apache.commons.lang.StringUtils.splitPreserveAllTokens(miSPRODUC_Y_CRAMO,'_'); //pued evenir SPRODUC_CRAMO[_][CAGENTE]
        String miSPRODUC=null;
        String miCRAMO=null;
        String miCAGENTE=null;
        
        if (miSPRODUC_Y_CRAMOs.length>0 && miSPRODUC_Y_CRAMOs[0].trim().length()>0) {
            miSPRODUC=miSPRODUC_Y_CRAMOs[0];
        }
        if (miSPRODUC_Y_CRAMOs.length>1 && miSPRODUC_Y_CRAMOs[1].trim().length()>0) {
            miCRAMO=miSPRODUC_Y_CRAMOs[1];
        }
        if (miSPRODUC_Y_CRAMOs.length>2 && miSPRODUC_Y_CRAMOs[2].trim().length()>0) {
            miCAGENTE=miSPRODUC_Y_CRAMOs[2];
        }
        
    %>
    //alert("<%=miCRAMO%> y <%=miSPRODUC%> y <%=miCAGENTE%>")
	
	<% if (miCAGENTE!=null) { %>
		<%
		java.util.HashMap axisctr_agenteMap=new java.util.HashMap();
		axisctr_agenteMap.put("CODI", new java.math.BigDecimal(miCAGENTE));
		axisctr_agenteMap.put("NOMBRE", miCAGENTE);
		session.setAttribute("axisctr_agente", axisctr_agenteMap);
		%>
		objDom.setValorPorId("CAGENTE","<%=miCAGENTE%>");
		document.miForm.CAGENTE_TEXT.value="<%=miCAGENTE%>";
		document.miForm.NOMBRE_TEXT.value="<%=miCAGENTE%>";

		document.miForm.CAGENTE_TEXT.readOnly=true;
		document.miForm.CAGENTE_TEXT_IMG.style.visibility="hidden";
	<% } %>
	 
	<% if (miCRAMO!=null) { %>
		document.miForm.ramoProducto.value="<%=miCRAMO%>";
		document.miForm.CRAMO.value="<%=miCRAMO%>";
	<% } %>

	<% if (miSPRODUC!=null) { %>
		pendientePreseleccionarSPRODUC="<%=miSPRODUC%>";
		puedoBuscarProductos=false;
		f_cargar_productos_combo();//("<%=miCRAMO%>");
	<%}%>
	 
 	 
    <% } //end-if CONTINUE tipo axismenu:axisctr001|SPRODUC=
}
%>                

			f_cargar_propiedades_pantalla();
                if (!objUtiles.estaVacio (document.miForm.ramoProducto.value) &&
                    document.miForm.BUSCANDO.value == 0) {
                    if (puedoBuscarProductos) { f_cargar_productos_combo(); }
                }
                
                if (document.miForm.BUSCANDO.value != 0) {
                    document.miForm.BUSCANDO.value = 0;
                }
            }
            
            function f_but_aceptar() {
                f_seleccionar_simulacion();
            }
            
            function f_but_anterior() {}
            
            //Cambiamos el valor del combo
            function f_seleccionar_producto(){             
                objDom.setValorPorId ("SPRODUC", objUtiles.utilSplit(document.miForm.SPRODUCTO.value, "/")[0]);
                objDom.setValorPorId ("TTITULO", objUtiles.utilSplit(document.miForm.SPRODUCTO.value, "/")[1]);
            }
            
           function f_cargar_productos_combo(){
                CRAMO = document.miForm.ramoProducto.value;
                CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                if (!objUtiles.estaVacio (CRAMO) ){                 
                    objDom.setValorComponente(document.miForm.CRAMO, document.miForm.ramoProducto.value);
                    //objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else{                    
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                }
                objAjax.invokeAsyncCGI("axis_axisctr102.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO)+"&CAGENTE="+CAGENTE, this, objJsMessages.jslit_cargando);
            }     
            
            function callbackAjaxCargarProductos (ajaxResponseText){            
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUCTO;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo('<%= Integer.MIN_VALUE %>', '- <axis:alt f="axisctr102" c="LIT_SELEC" lit="108341"/> - ', SPRODUCCombo, 0);
                    for (i = 0; i < elementos.length; i++) {                           
                        var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                        //objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        objDom.addOpcionACombo(SPRODUC+"/"+TITULO, TITULO, SPRODUCCombo, i+1);
                    }
                    document.miForm.SPRODUC.value='';
                    amagarDisplay();
                }
				
				//ecg20131002 cuando venimos de un SPRODUC preseleccionado, hemos de recorrer el cambo despues de recuperar sus valores, y preseleccioanr el dato
				//objUtiles.sleep(5000);
				if (pendientePreseleccionarSPRODUC.length>0) {
					document.miForm.SPRODUC.value=pendientePreseleccionarSPRODUC;
					var selObj=  document.miForm.SPRODUCTO;
					for(var ii=0;ii<selObj.options.length;ii++){
						if(objUtiles.utilSplit(selObj.options[ii].value, "/")[0] ==pendientePreseleccionarSPRODUC){
							selObj.selectedIndex=ii;
							break;
						}
					}
					pendientePreseleccionarSPRODUC=""; //ya lo hemos preseleccioando, asi que lo vaciamos. Vaciar significa ya no hacer mas caso.
				}			
            }            
            
            function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axisctr102' c='LIT_NOREGS' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
            function f_but_nuevo(){
            		if (objValidador.validaEntrada()) {
		                objDom.setValorPorId ("SPRODUC", objUtiles.utilSplit(document.miForm.SPRODUCTO.value, "/")[0]);
		                objDom.setValorPorId ("TTITULO", objUtiles.utilSplit(document.miForm.SPRODUCTO.value, "/")[1]);
		                
		                if (!objUtiles.estaVacio(document.getElementById("SPRODUC").value) &&
		                document.getElementById("SPRODUC").value > 0
		                ) {   
		                    <axis:visible f="axisctr102" c="AGENT_DEFECTE">
		                        objUtiles.ejecutarFormulario("axis_axisctr102.do", "nuevo", document.miForm, "_self");
		                    </axis:visible>
		                    <axis:visible f="axisctr102" c="MODAL_AGENT">
		                        f_abrir_axisctr076();
		                    </axis:visible>
		                }else{
		                    //Seleccione un producto
		                    alert (objJsMessages.jslit_selecciona_producto);
		                }
								}	                
            }
            
            function f_abrir_axisctr076() {
                objUtiles.abrirModal("axisctr076","src","modal_axisctr076.do?operation=form&CAGENTECXT="+document.miForm.CAGENTECXT.value,1100,550);
            }

            function f_cerrar_axisctr076() {
                 objUtiles.cerrarModal("axisctr076")
            }

            function f_aceptar_axisctr076(CAGENTE){
                f_cerrar_axisctr076();
                document.miForm.CAGENTECXT.value = CAGENTE;
                objUtiles.ejecutarFormulario("axis_axisctr102.do", "nuevo", document.miForm, "_self");
            }            
            
            function f_but_buscar(){
                document.miForm.BUSCANDO.value = 1;
                f_cargar_productos();
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
            
            function f_seleccionar_simulacion (SSEGURO,TTITULO){ 
                //Ejecutamos formulario según producto seleccionado 
                if (!objUtiles.estaVacio (SSEGURO)){
                    objDom.setValorPorId ("SSEGURO", SSEGURO);
                    objDom.setValorPorId ("TTITULO", TTITULO);   
                }else{
                    var hayAlgunChecked = objUtiles.f_GuardaCasillasChecked ("radioSolicitud");
                    if (!hayAlgunChecked) {
                        alert (objJsMessages.jslit_selecciona_producto);
                        return;
                    }else
                        objDom.setValorPorId ("SSEGURO", objUtiles.utilSplit(hayAlgunChecked));  
                }
                document.miForm.BUSCANDO.value = 1;
                objUtiles.ejecutarFormulario ("axis_axisctr102.do", "buscar_simulacion", document.miForm, "_self");    
            }
            
            function f_cargar_productos(){
                // Busca la lista de simulaciones asociadas que cumplen el filtro establecido                  
                objUtiles.ejecutarFormulario ("axis_axisctr102.do", "busqueda_simulaciones", document.miForm, "_self");     
            }
            
            /* *************************************** TRATAMIENTO AGENTE LCF * ************************************ */
            function f_actualizar_agente(){
                 if(document.miForm.CAGENTE_TEXT){
                    objAjax.invokeAsyncCGI("axis_axisctr102.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
                 }
            }
            
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=SIMULACION");
            }
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                }
                /* TRATAMIENTO AGENTE LCF */
                //Al volver de cargar agente recargammos los ramos y el producto
                 f_recargar_ramos();  /* TRATAMIENTO AGENTE LCF */       
                 
            }
            
                 
            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);
                
                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
               if (objUtiles.estaVacio(objDom.getValorPorId("CAGENTE_TEXT"))) {
                    var mensajesAlert = "<axis:alt f='axisctr102' c='MENSAAGE' lit='9903266'/>";
                    alert(mensajesAlert);
               }
               if (!objUtiles.estaVacio (document.miForm.CAGENTE_TEXT.value) ){
                 f_recargar_ramos();  /* TRATAMIENTO AGENTE LCF */       
                }else{
                    var RamoCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RamoCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr102" c="SNV_COMBO" lit="108341"/> - ', RamoCombo, 0);
                     var SPRODUCCombo = document.miForm.SPRODUCTO;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr102" c="LIT_SELEC" lit="108341"/> - ', SPRODUCCombo, 0);
                }
                 
                }
             
            }
            
             function f_recargar_ramos(){
                    //alert("Antes de recargar ramos");
                   // if (!objUtiles.estaVacio (document.miForm.ramoProducto.value) ){
                        CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                        objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxRecargarRamos, "operation=ajax_recargar_ramos&CAGENTE=" + CAGENTE +
                                   "&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
                   // }
            }
            
             /* TRATAMIENTO AGENTE LCF */
             function callbackAjaxRecargarRamos (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CRAMO");
                    var RamoCombo = document.miForm.ramoProducto;     
                    objDom.borrarOpcionesDeCombo(RamoCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr102" c="SNV_COMBO" lit="108341"/> - ', RamoCombo, 0);
                    for (i = 0; i < elementos.length; i++) {
                        var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                        var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);    
                        objDom.addOpcionACombo(CRAMO, TITULO, RamoCombo, i+1);
                    }
                }
                document.miForm.ramoProducto.value=<%= Integer.MIN_VALUE %>;
                    CAGENTE  = document.miForm.CAGENTE_TEXT.value;
                objAjax.invokeAsyncCGI("axis_axisctr102.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=null&CAGENTE="+CAGENTE, this, objJsMessages.jslit_cargando);
                
            } 
            
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
	<!-- <%=CONTINUE%> -->
	<!-- ${sessionScope.axisctr_agente} -->
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="CMODO" id="CMODO" value=""/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value=""/>    
        <input type="hidden" name="PRODUCTO" id="PRODUCTO" value=""/>    
        <input type="hidden" name="MODO" id="MODO" value=""/>
        <input type="hidden" name="CAGENTECXT" id="CAGENTECXT" value="${__formdata.CAGENTECXT}"/>
        <input type="hidden" name="BUSCANDO" id="BUSCANDO" value="${__formdata.BUSCANDO}"/>
        <input type="hidden" name="tipo" id="tipo" value="SIMUL"/>    
        
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axisctr102" c="TITULO" lit="108021" /></c:param>
                <c:param name="formulario"><axis:alt f="axisctr102" c="TITULO" lit="108021" /></c:param>
                <c:param name="form">axisctr102</c:param>
        </c:import>
                       
                        
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr102" c="TIT_BUSCPERS" lit="1000235" /></c:param>
        <c:param name="nid" value="axisctr076" />
        </c:import>   
        <!-- modal estándar -->
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr001" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>          
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr102" c="LIT_FILTRO" lit="1000178" /></div>
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:40%;height:0px"></th>
                              
                            </tr>
                            <tr>
                            <axis:visible f="axisctr102" c="CAGENTE"> 
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisctr102" c="CAGENTE" lit="100584" /></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="TAGENTE" lit="105940" /></b>
                                    </td>
                                </axis:visible>
                                <axis:ocultar f="axisctr102" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:visible f="axisctr102" c="SPRODUC"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="SPRODUC" lit="100829" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                
                            </tr>                              
                            <tr>
                            <!-- TRATAMIENTO AGENTE LCF -->
                               <axis:ocultar f="axisctr102" c="CAGENTE" dejarHueco="false"> 
                                    <td class="campocaja" colspan="2">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" title="<axis:alt f="axisctr102" c="CAGENTE" lit="100584" />" value="${sessionScope.axisctr_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%" formato="entero"
                                        <axis:atr f="axisctr102" c="CAGENTE_TEXT" a="modificable=true&obligatorio=true"/> onchange="f_actualizar_agente()" />
                                        <axis:ocultar f="axisctr102" c="CAGENTE_TEXT_IMG" dejarHueco="false"> 
                                        <img border="0" id="CAGENTE_TEXT_IMG" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        </axis:ocultar>
                                    </td>
                                     <td class="campocaja">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                               </axis:ocultar>
                               <axis:ocultar f="axisctr102" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos_combo()" 
                                                class="campowidthselect campo campotexto" <axis:atr f="axisctr102" c="ramoProducto" a="isInputText=false"/>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr102" c="LIT_SELEC" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>      

                                <axis:visible f="axisctr102" c="axisctr102_comboProductos"> <!-- TODO C -->
                                    <td class="campocaja" >
                                        <select title="<axis:alt f="axisctr102" c="SPRODUC" lit="100829" />" name = "SPRODUCTO" style="width:95%;" id ="SPRODUCTO" size="1" onchange="f_seleccionar_producto()"  class="campowidthselect campo campotexto"
                                        	  <axis:atr f="axisctr102" c="SPRODUCTO" a="modificable=true&obligatorio=true"/> >
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr102" c="LIT_SELEC_PRD" lit="103155"/> - </option>
                                            <c:forEach var="productos" items="${sessionScope.axisctr102_comboProductos}">
                                                <option value = "${productos.SPRODUC}/${productos.TTITULO}"
                                                    <c:if test="${productos.SPRODUC == __formdata.SPRODUC}">selected</c:if>>
                                                    ${productos.TTITULO}                            
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                             </tr>
                             <tr>
                                <axis:visible f="axisctr102" c="TNATRIE"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="TNATRIE" lit="109528" /></b>                                        
                                    </td>
                                </axis:visible>                                
                                <axis:ocultar f="axisctr102" c="NPOLIZA" dejarHueco="true">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="NPOLIZA" lit="100836"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:visible f="axisctr102" c="TRIESGO"> 
                                    <td class="titulocaja"  colspan="2">
                                        <b><axis:alt f="axisctr102" c="TRIESGO" lit="102524" /></b>                                                                                
                                    </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <axis:visible f="axisctr102" c="TNATRIE"> 
                                    <td class="campocaja">
                                        <input style="width:60%"  type="text" name="SOLICIT" id="SOLICIT" value="${sessionScope.selectedProducto.SOLICIT}" class="campowidthinput campo campotexto"
                                        formato="entero" title="<axis:alt f="axisctr102" c="SOLICIT" lit="109528"/>"/>
                                    </td>
                                </axis:visible>
                                <axis:ocultar f="axisctr102" c="NPOLIZA" dejarHueco="true">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisctr102" c="NPOLIZA" lit="100836" />" size="15"/>
                                    </td>
                                </axis:ocultar>                                
                                <axis:visible f="axisctr102" c="TRIESGO"> 
                                    <td class="campocaja"   colspan="2">
                                        <input  type="text" style="width:94%;" name="TRIESGO" id="TRIESGO" value="${sessionScope.selectedProducto.TRIESGO}" class="campowidthinput campo campotexto"/>
                                    </td>
                                </axis:visible>
                                <td></td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        
                        <axis:visible c="DSP_TOMADOR" f="axisctr102">
                            <table class="seccion">
                                <tr>
                                 <td align="left">
                                 <table class="area" align="center">
                        

                                <tr>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                    <th style="width:25%;height:0px"></th>
                                </tr>
                                <tr>
                                    <td class="campocaja">
                                    <div style="float:left;">
                                        <b><axis:alt f="axisctr102" c="TOMADOR" lit="101027"/></b>
                                    </div>
                                    </td>
                                </tr>  
                                <tr>
                                    <axis:ocultar f="axisctr102" c="NNUMIDE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="NNUMIDE" lit="105330"></axis:alt> </b>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr102" c="BUSCAR" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="BUSCAR" lit="105940" /></b>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr102" c="FCOTIZACION" dejarHueco="false">                                
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr102" c="FCOTIZACION" lit="9906480" /></b>
                                    </td>
                                    </axis:ocultar>
                                </tr>
                                <tr>
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE"/>
                                    </td>
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.BUSCAR}" name="BUSCAR" id="BUSCAR" size="15"/>
                                    </td>
                                   <axis:ocultar f="axisctr102" c="FCOTIZACION" dejarHueco="false">
                                        <td class="campocaja">
                                            <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="FCOTIZACION" name="FCOTIZACION" size="15" title="<axis:alt f="axisctr102" c="FCOTIZACION" lit="9906480"/>"
                                            value="<fmt:formatDate value='${__formdata.FCOTIZACION}' pattern='dd/MM/yyyy'/>"
                                            <axis:atr f="axisctr102" c="FCOTIZACION" a="obligatorio=false&formato=fecha"/> /><a id="icon_FCOTIZACION" style="vertical-align:middle;" href="#"><img id="popup_calendario_FCOTIZACION" border="0" alt="<axis:alt f="axisctr102" c="FCOTIZACION" lit="9906480" />" title="<axis:alt f="axisctr102" c="FCOTIZACION" lit="9906480" />" src="images/calendar.gif"/></a>
                                        </td>                                  
                                   </axis:ocultar> 
                                   </tr>
                                   </table>
                                   </td>
                                   </tr>
                                   </table>
                            
                        </axis:visible>
                        <tr>
                            <axis:visible f="axisctr102" c="BT_BUSCAR">
                                    <td align="right">
                                        <input type="button" class="boton" id="but_buscar" value="<axis:alt f="axisctr102" c="BT_BUSCAR" lit="100797" />" onclick="f_but_buscar()" />
                                    </td>
                                </axis:visible>
                        </tr>
                    </td>
                </tr>
                <tr>                    
                </tr>  
            </table>
            
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr102" c="LIT_RESULTAT" lit="1000345" /></div>
           <!-- IAX -->
            <table class="seccion">
                <tr>
                    <td>
                        <c:set var="title0"><axis:alt f="axisctr102" c="SSEGURO" lit="109528"/></c:set>
                        <c:set var="title1"><axis:alt f="axisctr102" c="TRIESGO" lit="102524"/></c:set>
                        <c:set var="title2"><axis:alt f="axisctr102" c="TPRODUC" lit="1000111"/></c:set>
                        <c:set var="title3"><axis:alt f="axisctr102" c="TSITUAC" lit="9906479"/></c:set>
                        <c:set var="productoId">${sessionScope.axisctr_producto.SPRODUC}</c:set>
                        <div class="displayspace">
                            <display:table name="${axisctr102_listaSimulaciones}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axisctr102.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                            <%@ include file="../include/displaytag.jsp"%>
                            <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" >
                                <div class="dspIcons">
                                <input <c:if test="${solicitudId == miListaId['SSEGURO']}">checked</c:if> 
                                    value="${miListaId['SSEGURO']}" type="radio" id="radioSolicitud" name="radioSolicitud"/></div>
                            </display:column>
                            <display:column title="${title0}" sortable="true" sortProperty="SSEGURO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText"><a href="javascript:f_seleccionar_simulacion('${miListaId['SSEGURO']}','${miListaId['TPRODUC']}');">${miListaId['SSEGURO']}</a></div>
                            </display:column>
                            <display:column title="${title1}" sortable="true" sortProperty="TRIESGO" headerClass="sortable"  media="html" autolink="false" >
                                <div class="dspText">${miListaId['TRIESGO']}</div>
                            </display:column>
                            <display:column title="${title2}" sortable="true" sortProperty="TPRODUC" headerClass="sortable"  media="html" autolink="false" > <%-- bug:26071 20013/02/13 amj  LCOL_C001-QT 301/309. Pantalla busqueda agentes. Se cambia sortProperty="TRIESGO"  por sortProperty="TPRODUC" --%>
                                <div class="dspText">${miListaId['TPRODUC']}</div>
                            </display:column>
                            <axis:visible c="TSITUAC" f="axisctr102">
                                <display:column title="${title3}" sortable="true" sortProperty="TSITUAC" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TSITUACION']}</div>
                                </display:column>
                            </axis:visible>
                            </display:table>
                            <c:choose>
                            <c:when test="${empty axisctr102_listaSimulaciones}">                        
                                <script language="javascript">
                                   objLista.esconderListaSpans();
                                   objLista.esconderListaLinks();     
                                </script>
                            </c:when>
                            </c:choose>
                        </div>
                    </td>
                </tr>
            </table>
         </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr102</c:param>
        <c:param name="f">axisctr102</c:param>
        <c:param name="__botones">salir<axis:visible f="axisctr102" c="BT_NUEVO">,nuevo</axis:visible><axis:visible f="axisctr102" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
    </c:import>
</form>
<c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
<axis:visible f="axisctr102" c="FCOTIZACION">
    Calendar.setup({
        inputField     :    "FCOTIZACION",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "popup_calendario_FCOTIZACION",  
        singleClick    :    true,
        firstDay       :    1
    });
    </axis:visible>
</script>
</body>
</html>

