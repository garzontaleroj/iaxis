<%/* Revision:# /HHrM2VbL9OhNDcfBJp6cQ== # */%>
<%/*9907743
*  Fichero: axisage031.jsp
*
*  @author <a href = "mailto:rfonollet@csi-ti.com">Ramon Fonollet</a>
*
*
*  Fecha: 09/04/2015
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
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
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
		//AAC_INI-CONF_379-20160927        
		function mostrar(nombreCapa,nombreDIV){ 
	    // yay readability
	    var el = document.getElementById(nombreDIV);
    	for (var lx=0, ly=0;
        	 el != null;
         	lx += el.offsetLeft, ly += el.offsetTop, el = el.offsetParent);

		
		var sec = document.getElementById(nombreCapa);
		sec.style.top  = ly + 20;
		sec.style.left= lx - 500;
		//sec.offsetParent=el;
		  document.getElementById(nombreCapa).style.visibility="visible"; 
		} 
		function ocultar(nombreCapa){ 
		    document.getElementById(nombreCapa).style.visibility="hidden"; 
		}
		//AAC_FI-CONF_379-20160927 
		        
        function f_onload() {
        
        <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
				retocarPAGE_CSS('axisage031');
	</c:if>

            var modo = "${CMODO}";
     

            if (objUtiles.estaVacio(modo) || modo=='ELIMINAR'){
                f_abrir_axisage029();
            } 
            if (modo=='SALIR'){
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage031", "cancelar", document.miForm, "_self");
            }
            // Retocar tabla en IE
            if(modo=='ALTA'){
            
            document.getElementById("mt").disabled=true;
            document.getElementById("dmt").disabled=true;
            document.getElementById("recibo_inputp").disabled=true;
            document.getElementById("mtCI").disabled=true;
            document.getElementById("dmtCI").disabled=true;
            document.getElementById("ANADIRRECIBOP").disabled=true;
            

             
            var checkboxes=document.getElementsByName("seleccionaRecibos"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
           
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].disabled=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            
            var checkboxesPL =  document.getElementsByName("seleccionaPL"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxesPL.length;i++) //recoremos todos los controles
            {
           
                if(checkboxesPL[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxesPL[i].disabled=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
              var inputDif = document.getElementsByName("dif_input"); //obtenemos todos los controles del tipo Input
            for(i=0;i<inputDif.length;i++) //recoremos todos los controles
            {
            
                if(inputDif[i].type == "text") //solo si es un checkbox entramos
                {
                    inputDif[i].readOnly=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                    inputDif[i].className  += " campodisabled";
                }
            }
              var inputDifpyg = document.getElementsByName("difpyg_input"); //obtenemos todos los controles del tipo Input
            for(i=0;i<inputDifpyg.length;i++) //recoremos todos los controles
            {
         
                if(inputDifpyg[i].type == "text") //solo si es un checkbox entramos
                {
                    inputDifpyg[i].readOnly=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                    inputDifpyg[i].className += " campodisabled";
                }
            }
            
            var checkboxesLiqui = document.getElementsByName("seleccionaLiquidacion"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxesLiqui.length;i++) //recoremos todos los controles
            {
                if(checkboxesLiqui[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxesLiqui[i].disabled=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
        }

        if(document.getElementById("SPROLIQ")!=null){
            	document.getElementById("SPROLIQ").className += " campodisabled";
            }
            if(document.getElementById("TAGENTE")!=null){
            	document.getElementById("TAGENTE").className += " campodisabled";
            }
            if(document.getElementById("CUSUARIO")!=null){
            	document.getElementById("CUSUARIO").className += " campodisabled";
            }
            if(document.getElementById("TTOMADOR")!=null){
            	document.getElementById("TTOMADOR").className += " campodisabled";	
            }
            if(document.getElementById("IIMPORTE")!=null){
            	document.getElementById("IIMPORTE").className += " campodisabled";
            }
            if(document.getElementById("IDIMPORTE")!=null){
            	document.getElementById("IDIMPORTE").className += " campodisabled";
            }
            if(document.getElementById("TOTAL01")!=null){
            	document.getElementById("TOTAL01").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02")!=null){
            	document.getElementById("TOTAL02").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02B")!=null){
            	document.getElementById("TOTAL02B").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02C")!=null){
            	document.getElementById("TOTAL02C").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02D")!=null){
            	document.getElementById("TOTAL02D").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02E")!=null){
            	document.getElementById("TOTAL02E").className += " campodisabled";
            }
            if(document.getElementById("TOTAL02F")!=null){
            	document.getElementById("TOTAL02F").className += " campodisabled";
            }
            if(document.getElementById("TOTAL03")!=null){
            	document.getElementById("TOTAL03").className += " campodisabled";
            }
            if(document.getElementById("recibo_inputp")!=null){
            	document.getElementById("recibo_inputp").className += " campodisabled";
            }
            if(document.getElementById("IDIFGLOBAL")!=null){
            	document.getElementById("IDIFGLOBAL").className += " campodisabled";
            }
            if(document.getElementById("TOTAL04")!=null){
            	document.getElementById("TOTAL04").className += " campodisabled";
            }
            if(document.getElementById("FLIQUIDA")!=null){
            	document.getElementById("FLIQUIDA").className += " campotexto_ob";
            }
            if(document.getElementById("CEMPRES")!=null){
            	document.getElementById("CEMPRES").className += " campotexto_ob";
            }    
       
            /*JMT PRBMANT-78 19/08/2016: se comenta la funcion porque hace que la pantalla vaya lenta, 
			y se añaden los .className += " campodisabled" en los dos for anteriores*/
          //  f_cargar_propiedades_pantalla(); 

        }
        
        // Modal Detalle busqueda autoliquidaciones
        
        function f_abrir_axisage029() {
            
            objUtiles.abrirModal("axisage029","src","modal_axisage029.do?operation=form");
        }     
        
        // Modal Detalle Documentos de cobro 
        function f_abrir_axisage032() {
            
            objUtiles.abrirModal("axisage032","src","modal_axisage032.do?operation=form");
        }
        
        // Modal Detalle Provisiones 
        function f_abrir_axisadm003 (NRECIBO) {
            objUtiles.abrirModal('axisadm003', "src", "axis_axisadm003.do?operation=form&NRECIBO=" + NRECIBO + '&origen=axisage031'); 
        }
        
        function f_cerrar_axisage029() {
          objDom.setValorPorId ("MODO","ALTA");
           objUtiles.cerrarModal("axisage029");
            objUtiles.ejecutarFormulario("axis_axisage031.do", "cargar_alta", document.miForm, "_self", objJsMessages.jslit_cargando);  
          
        }
        
        function f_cerrar_axisage032() {
           objUtiles.cerrarModal("axisage032");
        }   
        
        function f_cerrar_axisage034() {
            objUtiles.cerrarModal("axisage034");
         }   


        function f_cargar_axisage029(SPROLIQ,CESTAUTO,CAGENTE,CEMPRES) {
            f_cerrar_axisage029();
            objDom.setValorPorId ("CESTAUTO",CESTAUTO);
            objDom.setValorPorId ("CEMPRES",CEMPRES);
            objUtiles.ejecutarFormulario("axis_axisage031.do?SPROLIQ_aux="+SPROLIQ+"&CESTAUTO_aux="+CESTAUTO+"&CAGENTE_aux="+CAGENTE+"&CEMPRES_aux="+CEMPRES, "cargar", document.miForm, "_self", objJsMessages.jslit_cargando);              
        }
        
        function f_alta_axisage029(){
            objDom.setValorPorId ("MODO","ALTA");
             objUtiles.cerrarModal("axisage029");
            objUtiles.ejecutarFormulario("axis_axisage031.do", "cargar_alta", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        
        function f_aceptar_axisage032(CBANCO,TBANCO,CESTADO,TESTADO,DOCUM,IIMPORTE,FDOC,TNATRIE,NLIQLIN) {
            f_cerrar_axisage032();
            objUtiles.ejecutarFormulario("axis_axisage031.do?CBANCO_aux=" + CBANCO + "&TBANCO_aux=" + TBANCO + "&CESTADO_aux=" + CESTADO + "&TESTADO_aux=" + TESTADO + "&DOCUM_aux=" + DOCUM + "&IIMPORTE_aux=" + IIMPORTE + "&FDOC_aux=" + FDOC + "&TNATRIE_aux=" + TNATRIE + "&NLIQLIN_aux=" + NLIQLIN, "aceptar_axisage032", document.miForm, "_self", objJsMessages.jslit_cargando);  
        }
        
        function f_aceptar_axisage034(SPROLIQ,CAGENTE,CEMPRES) {
            f_cerrar_axisage034();            
            objDom.setValorPorId ("SPROLIQ",SPROLIQ);
             var lista="${lista_liquida_documentos}";
            if(lista!="[]"){
            f_but_guardar();
            }else{
            //objUtiles.ejecutarFormulario("axis_axisage031.do?SPROLIQ_aux=" + SPROLIQ, "aceptar_axisage034", document.miForm, "_self", objJsMessages.jslit_cargando);
            objUtiles.ejecutarFormulario("axis_axisage031.do?SPROLIQ_aux=" + SPROLIQ + "&AGENTE_aux="+CAGENTE + "&CEMPRES_aux="+CEMPRES, "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);                        
            }
        }
        
        function f_but_guardar() {
            var hayDatos = ${!empty sessionScope.lista_liquida_documentos};
            
            if (objDom.getValorPorId("CAGENTE")=="")
            {
            	alert("<axis:alt f="axisage031" c="CAGENTETOMADOR" lit="9904590"/>");
            }
            else
            {     
	            	objUtiles.ejecutarFormulario("axis_axisage031.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
	       	}
        }
                
        function f_but_salir() {
        var lista="${lista_liquida_documentos}";
         var SPROLIQ = document.getElementById('SPROLIQ').value;
           var CAGENTE=document.getElementById('CAGENTE').value;
           var CEMPRES=document.getElementById('HCEMPRES').value;
           
            var answer = confirm("<axis:alt f="axisage031" c="BORRRARDOCUMENTO" lit="100000"/>");
            if (answer){  
                if(lista=="[]"){
                    
                        objUtiles.ejecutarFormulario("axis_axisage031.do?PSPROLIQ="+SPROLIQ+"&PCAGENTE="+CAGENTE+"&PCEMPRES="+CEMPRES+"&PCMODO=SALIR", "borrar_liquidacion", document.miForm, "_self", objJsMessages.jslit_cargando);  
                    }
                    else{
               objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisage031", "cancelar", document.miForm, "_self");
           }
           }
        
      
            

        }
        
        function f_but_9001771() {
        
            var IMPORTE_OK = document.getElementById('IDIFGLOBAL').value; 
            var DOCU_SIZE = document.getElementById('miListaId_documentos').length;
            var hayDatos = ${!empty sessionScope.lista_liquida_documentos};
            
            if (IMPORTE_OK <= 0  || IMPORTE_OK == "0,00" || IMPORTE_OK.includes("-")  ){
            	
                if (hayDatos){
                	objUtiles.ejecutarFormulario("axis_axisage031.do", "liquidar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }else{
                	alert("<axis:alt f="axisage031" c="IMPORTE_OK" lit="9907913"/>");
                }
            }else{
                alert("<axis:alt f="axisage031" c="IMPORTE_OK" lit="9907790"/>");
            }  
        }
        
        function f_but_9907854(){
            
            var CAGENTE = objDom.getValorPorId("CAGENTE");
            var CEMPRES = objDom.getValorPorId("HCEMPRES");
            var TEMPRES = document.getElementById("CEMPRES").options[document.getElementById("CEMPRES").selectedIndex].text;
        
            objUtiles.abrirModal("axisctr080", "src", "axis_axisctr080.do?operation=form&PMODO=1&CAGENTE=" + CAGENTE + "&CEMPRES=" + CEMPRES + "&TEMPRES=" + TEMPRES + "&origen=axisage031");
            
        }
        
        function f_cerrar_axisctr080(){
            objUtiles.cerrarModal("axisctr080");
            
        }

        function f_cerrar_modal(cual){
             objUtiles.cerrarModal(cual);
        }
        
        /*******************************************
                  Formateo Numeros
         ********************************************/
         function validarNumeros(IMPORTE){
             if (!objUtiles.estaVacio(IMPORTE)){
                 IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                 if(objNumero.validaNumero(IMPORT, true)){
                     return this.formateaNumeroCero(IMPORT, true);
                 }
                 else{
                     return   '';
                 }
             }
             else return IMPORTE;
         }
        
        function formateaNumeroCero(entrada, isDecimal){
            // es crida al reformateixador  ###.###,00
            var fnum=objNumero.formateaNumero(entrada,isDecimal);
            if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                fnum += objNumero.getSeparadorDecimales() + '00';
            }
            // si es tracta d'un 0 el converteix a 0,00
            if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
            return fnum;

        }
         
       /* function f_formatear(thiss){
            thiss.value = validarNumeros(thiss.value);
        }
        
        function f_calculoma(thiss){               
            f_formatear(thiss);
        }   */
        
        /*******************************************
                 Actualizar/Buscar Agente
         ********************************************/
        
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
            f_actualizar_agente ();
        } 
        
        function f_abrir_axisctr014() {
            if (objValidador.validaEntrada()) {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
        }
                        
        
        function f_abrir_axisper008() {
            if (objValidador.validaEntrada()) {
                objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008_caj015&ORIGEN=AXISAGE031" );
            }
        }
        
        function f_aceptar_mtn_axisper008_caj015 (selectedPerson,selectedAgent){
            
            f_cerrar_axisper008();
            f_aceptar_tomadores(selectedPerson);
            
        }        
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
        }
        
        function f_aceptar_tomadores(SPERSON){
                 
            if (!objUtiles.estaVacio(SPERSON)){          
              objAjax.invokeAsyncCGI("axis_axisage031.do?SPERSON="+SPERSON, callbackAjaxVerPersona, "operation=ver_persona", this, objJsMessages.jslit_cargando);
            }
          }
        
        function f_actualizar_persona (){
            if (objValidador.validaEntrada()) {
              objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&CTOMADOR=" + document.getElementById("CTOMADOR").value+"&CEMPRES="+ document.getElementById("CEMPRES"), this, objJsMessages.jslit_actualizando_registro);
            }
        }
        
        function callbackAjaxActualizarPersona(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("CTOMADOR", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("CTOMADOR", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("TTOMADOR", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        objDom.setValorPorId("CAGENTE", "");
                        objDom.setValorPorId("TAGENTE", "");
                                objUtiles.ejecutarFormulario("axis_axisage031.do?TOMADOR_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)+"&CEMPRES="+ document.getElementById("CEMPRES"), "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);   
                    } else {
                        objDom.setValorPorId("TTOMADOR", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("TTOMADOR", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function callbackAjaxVerPersona(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("CTOMADOR", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("CTOMADOR", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0])) {
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                        var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                        objDom.setValorPorId("TTOMADOR",  NOMBRE + ' ' + APELLIDO1 + ' ' + APELLIDO2);
                        objDom.setValorPorId("CAGENTE", "");
                        objDom.setValorPorId("TAGENTE", "");                        
                        objUtiles.ejecutarFormulario("axis_axisage031.do?TOMADOR_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0), "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);                            
                    } else if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0])) {   
                        var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                        objDom.setValorPorId("TTOMADOR", APELLIDO1);
                      /*  objDom.setValorPorId("CAGENTE", "");*/
                        objDom.setValorPorId("TAGENTE", "");                        
                         objUtiles.ejecutarFormulario("axis_axisage031.do?TOMADOR_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0)+'&CEMPRES='+document.getElementById('CEMPRES').value+'&SPROLIQ='+document.getElementById('SPROLIQ').value+'&CAGENTE='+doc.getElementsByTagName("CAGENTE").value, "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando); 
                    }else{
                        objDom.setValorPorId("TTOMADOR", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("TTOMADOR", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        
        function f_aceptar_axisctr014 (CAGENTE){
            f_cerrar_axisctr014();
            var SPROLIQ = document.getElementById('SPROLIQ').value;
            var CEMPRES=document.getElementById('HCEMPRES').value;
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarAgente, "operation=actualizar_agente&PACAGENTE=" + CAGENTE+"&PASPROLIQ="+SPROLIQ+"&PACEMPRES="+CEMPRES, this, objJsMessages.jslit_actualizando_registro);
           
        }
        
        function callbackAjaxCambiarAgente(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                var SPROLIQ = document.getElementById('SPROLIQ').value;
                var CEMPRES=document.getElementById('HCEMPRES').value
                objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                objDom.setValorPorId("TAGENTE", NOMBREformateado);
                
                objUtiles.ejecutarFormulario("axis_axisage031.do?AGENTE_aux="+CAGENTE + "&CEMPRES_aux="+CEMPRES, "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_actualizar_agente(){
            if (objValidador.validaEntrada()) {
                     var SPROLIQ = document.getElementById('SPROLIQ').value;
         var CAGENTE=document.getElementById('CAGENTE').value;
         var CEMPRES=document.getElementById('HCEMPRES').value;
                objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarAgente, "operation=actualizar_agente&PACAGENTE=" + CAGENTE+"&PASPROLIQ="+SPROLIQ+"&PACEMPRES="+CEMPRES, this, objJsMessages.jslit_actualizando_registro);
            }
        }
        
        function callbackAjaxActualizarAgente(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            var modo = "${CMODO}";
            
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0])) {
                        objDom.setValorPorId("CAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0)));
                    } else {
                        objDom.setValorPorId("CAGENTE", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("TAGENTE", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                        //EJECUTAMOS LA NUEVA PANTALLA  
                        
                        //objUtiles.abrirModal("axisage034","form","modal_axisage034.do?operation=form&SPROLIQ=" + document.getElementById("SPROLIQ").value + "&CEMPRES=" + document.getElementById("CEMPRES").value + "&CAGECLAVE=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0));
                        objUtiles.abrirModal('axisage034', "src", "modal_axisage034.do?operation=form&CMODO="+modo+"&SPROLIQ=" + document.getElementById("SPROLIQ").value + "&CEMPRES=" + document.getElementById("CEMPRES").value + "&CAGECLAVE=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0) + "&FLIQUIDA=" + document.getElementById("FLIQUIDA").value  + "&CUSUARIO=" + document.getElementById("CUSUARIO").value );
                        //objUtiles.ejecutarFormulario("axis_axisage031.do?AGENTE_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0), "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);                        
                    } else {
                        objDom.setValorPorId("TAGENTE", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("TAGENTE", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_actualizar_check_pl(NUMRECIBO){
            
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarPl, "operation=actualizar_check_pl&NUMRECIBO=" + NUMRECIBO, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxActualizarPl (ajaxResponseText) {
            
            var doc = objAjax.domParse(ajaxResponseText);

            // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
  
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");
               objDom.setValorPorId("TOTAL02B", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_02"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02C", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_03"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02D", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_04"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02E", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02F", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_07"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL03", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_06"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
                              
               var cosa;
               var cosa2;
               //if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("marcado"), 0, 0)==0)
            //	{
              // 	cosa ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".readOnly=true";
              // 	cosa2 ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".value=0";
            //	}
               //else
            	//cosa ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".readOnly=false";            	   
             
               
              // eval(cosa);
             //  eval(cosa2);
            }
        }
        
        
        function f_actualizar_dif (NRECIBO, VALOR) {        	
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarDif,"operation=actualizar_dif&NRECIBO_aux=" + NRECIBO + "&VALOR_aux=" + VALOR , this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_difpyg (NRECIBO, VALOR) {        	
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarDifpyg,"operation=actualizar_difpyg&NRECIBO_aux=" + NRECIBO + "&VALOR_aux=" + VALOR , this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_dif_global (VALOR) {        	
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarDifGlobal,"operation=actualizar_difglobal&VALOR_aux=" + VALOR , this, objJsMessages.jslit_actualizando_registro);
        }
        
		function callbackAjaxActualizarDifGlobal (ajaxResponseText) {
            
            var doc = objAjax.domParse(ajaxResponseText);
            
             // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
            	
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");                             
               objDom.setValorPorId("TOTAL02B", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_02"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02C", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_03"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02D", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_04"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02E", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02F", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_07"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL03", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_06"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));                              
             
               //quitamos la comprobación de comision mayor que diferencia
              //if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("difer"), 0, 0)==1)
            	//{
            	//   var cosa2;
            	//   alert("<axis:alt f="axisage031" c="CAGENTETOMADOR" lit="9908152"/>");
            	//   cosa2 ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".value=0";
            	//   eval(cosa2);
            	//}
            }
        }
        
         function callbackAjaxActualizarDifpyg (ajaxResponseText) {
            
            var doc = objAjax.domParse(ajaxResponseText);
            
             // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");
               objDom.setValorPorId("TOTAL02B", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_02"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02C", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_03"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02D", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_04"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02E", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02F", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_07"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL03", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_06"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));                              
              //quitamos la comprobación de comision mayor que diferencia
              //if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("difer"), 0, 0)==1)
            	//{
            	//   var cosa2;
            	//   alert("<axis:alt f="axisage031" c="CAGENTETOMADOR" lit="9908152"/>");
            	//   cosa2 ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".value=0";
            	//   eval(cosa2);
            	//}
            }
        }
        
        

        function callbackAjaxActualizarDif (ajaxResponseText) {
            
            var doc = objAjax.domParse(ajaxResponseText);

            // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
            	
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");
               objDom.setValorPorId("TOTAL02B", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_02"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02C", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_03"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02D", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_04"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02E", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}))
               objDom.setValorPorId("TOTAL02F", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_07"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL03", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_06"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));                              
               //quitamos la comprobación de comision mayor que diferencia
               //if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("difer"), 0, 0)==1)
            	//{
            	 //  var cosa2;
            	 //  alert("<axis:alt f="axisage031" c="CAGENTETOMADOR" lit="9908152"/>");
            	 //  cosa2 ="document.miForm.dif_input_"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("recibo"), 0, 0)+".value=0";
            	 //  eval(cosa2);
            	//}
            }
        }
        
        function f_actualizar_check_recibo(NUMRECIBO){
            
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarRecibo, "operation=actualizar_check_recibo&NUMRECIBO=" + NUMRECIBO, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_check_apunte(NUMAPU){
            
            objAjax.invokeAsyncCGI("axis_axisage031.do", callbackAjaxActualizarApunte, "operation=actualizar_check_apunte&NUMAPU=" + NUMAPU, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxActualizarRecibo (ajaxResponseText) {
            
            var doc = objAjax.domParse(ajaxResponseText);

            // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
  
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");
               objDom.setValorPorId("TOTAL02", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_01"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02B", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_02"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02C", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_03"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02D", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_04"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02E", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL02F", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_07"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("TOTAL03", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_06"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
			   objDom.setValorPorId("IDIFGLOBAL", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_recibos_05"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));             
			  if (objDom.getValorPorId("MODO")=="ALTA" && objDom.getValorPorId("CAGENTE")=="" && objDom.getValorPorId("TTOMADOR")!=""){
                   objUtiles.ejecutarFormulario("axis_axisage031.do?AGENTE_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("codi_agente"), 0, 0) + "&RECIBO=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("numero_recibo"), 0, 0) + "&NAGENTE_aux=" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("nom_agente"), 0, 0), "actualizar_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);   
               }
               
               
            }
        }
        
        function callbackAjaxActualizarApunte (ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            
            // Comprobar errores
            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            
               var locale = objDom.getValorPorId("LOCALE").replace("_","-");
               objDom.setValorPorId("TOTAL04", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_apuntes"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
               objDom.setValorPorId("IDIMPORTE", parseFloat(objDom.getValorNodoDelComponente(doc.getElementsByTagName("total_dif_dg"), 0, 0)).toLocaleString(locale, {minimumFractionDigits: 2}));
            }
        }
        
        function marcarTodos() 
        {
            var checkboxes = document.getElementsByName("seleccionaRecibos"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            objUtiles.ejecutarFormulario("axis_axisage031.do", "marcar_todos", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function desmarcarTodos() 
        {
            
            var checkboxes = document.getElementsByName('seleccionaRecibos'); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=false; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            objUtiles.ejecutarFormulario("axis_axisage031.do", "desmarcar_todos", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function marcarTodosCI() 
        {
            var checkboxes = document.getElementsByName("seleccionaPL"); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=true; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            objUtiles.ejecutarFormulario("axis_axisage031.do", "marcar_todosci", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function desmarcarTodosCI() 
        {
            
            var checkboxes = document.getElementsByName('seleccionaPL'); //obtenemos todos los controles del tipo Input
            for(i=0;i<checkboxes.length;i++) //recoremos todos los controles
            {
                if(checkboxes[i].type == "checkbox") //solo si es un checkbox entramos
                {
                    checkboxes[i].checked=false; //si es un checkbox le damos el valor del checkbox que lo llamó (Marcar/Desmarcar Todos)
                }
            }
            objUtiles.ejecutarFormulario("axis_axisage031.do", "desmarcar_todosci", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        
        function f_borrar_documento(NLIQLIN){
          
            var lista="${lista_liquida_documentos}";
            var textoDiv=lista.split("}");
        
            if(textoDiv.length<=2){
                alert("<axis:alt f="axisage031" c="BORRRARDOCUMENTO" lit="1000402"/>");
            }
            else{
                  var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer){              
                      objUtiles.ejecutarFormulario("axis_axisage031.do?NLIQLIN_aux=" + NLIQLIN, "borrarDocumento", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
                }
            }
        }
        
        function f_modificar_documento(NLIQLIN,TCOBRO,CCOBRO,DOCUMENTO,TBANCO,BANCO,IMPORTE,FDOCUMENTO,OBSERVACIONES){

            objUtiles.abrirModal("axisage032","src","modal_axisage032.do?operation=modificar&NLIQLIN_aux=" + NLIQLIN + "&TCOBRO_aux=" + TCOBRO + "&CCOBRO_aux=" + CCOBRO + "&DOCUMENTO_aux=" + DOCUMENTO + "&TBANCO_aux=" + TBANCO + "&BANCO_aux=" + BANCO + "&IMPORTE_aux=" + IMPORTE + "&FDOCUMENTO_aux=" + FDOCUMENTO + "&OBSERVACIONES_aux=" + OBSERVACIONES);
            
        }
        
        function f_anadir_recibo(){
            
            var recibo_radio = document.getElementById('seleccionaRecibo');
            var nrecibo_input = document.getElementById('recibo_input');       
            var nrecibo_inputp = document.getElementById('recibo_inputp');   
            var CAGENTE_aux = document.getElementById('CAGENTE'); 
            var TOMADOR_aux = document.getElementById('CTOMADOR'); 
            var CEMPRES = document.getElementById("HCEMPRES");
            if(CEMPRES.value != 23){
                if (recibo_radio.checked == true && nrecibo_input.value != ""){
    
                    if (TOMADOR_aux != null){
                        objUtiles.ejecutarFormulario("axis_axisage031.do?NREC=" + nrecibo_input.value + "&CAGENTE_aux=" + CAGENTE_aux.value + "&TOMADOR_aux=" + TOMADOR_aux.value, "anadir_recibo", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
                    }else{
                        objUtiles.ejecutarFormulario("axis_axisage031.do?NREC=" + nrecibo_input.value + "&CAGENTE_aux=" + CAGENTE_aux.value, "anadir_recibo", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
                    }
                } 
            }else if(nrecibo_inputp.value != ""){
                if (TOMADOR_aux != null){
                    objUtiles.ejecutarFormulario("axis_axisage031.do?NREC=" + nrecibo_inputp.value + "&CAGENTE_aux=" + CAGENTE_aux.value + "&TOMADOR_aux=" + TOMADOR_aux.value, "anadir_recibo", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
                }else{
                    objUtiles.ejecutarFormulario("axis_axisage031.do?NREC=" + nrecibo_inputp.value + "&CAGENTE_aux=" + CAGENTE_aux.value, "anadir_recibo", document.miForm, "_self", objJsMessages.jslit_actualizando_registro);
                }
            }  
        }       
        
        function f_but_1000127(){
           var SPROLIQ = document.getElementById('SPROLIQ').value;
           var CAGENTE=document.getElementById('CAGENTE').value;
           var CEMPRES=document.getElementById('HCEMPRES').value;
           var modo = "${CMODO}";
           if(modo=='MODIFICACION'){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){              
                objUtiles.ejecutarFormulario("axis_axisage031.do?PSPROLIQ="+SPROLIQ+"&PCAGENTE="+CAGENTE+"&PCEMPRES="+CEMPRES+"&PCMODO=ELIMINAR", "borrar_liquidacion", document.miForm, "_self", objJsMessages.jslit_cargando);  
            }
           }
            //objAjax.invokeAsyncCGI("axis_axisage031.do", callbackElminar, "operation=borrar_liquidacion&SPROLIQ="+SPROLIQ+"&CAGENTE="+CAGENTE+"&CEMPRES="+CEMPRES, this, objJsMessages.jslit_actualizando_registro);   
        }
        function consultar_nuevo() {
        var lista="${lista_liquida_documentos}";

         var SPROLIQ = document.getElementById('SPROLIQ').value;
         var CAGENTE=document.getElementById('CAGENTE').value;
         var CEMPRES=document.getElementById('HCEMPRES').value;
         var answer = confirm("<axis:alt f="axisage031" c="BORRRARDOCUMENTO" lit="9907782"/>");
        if (answer){ 
           if(lista=="[]"){
                         f_abrir_axisage029();
                        objUtiles.ejecutarFormulario("axis_axisage031.do?PSPROLIQ="+SPROLIQ+"&PCAGENTE="+CAGENTE+"&PCEMPRES="+CEMPRES+"&PCMODO=ELIMINAR", "borrar_liquidacion", document.miForm, "_self", objJsMessages.jslit_cargando);  
                    }
                    else{
               f_abrir_axisage029();
           }
        }
           
        
        
        }
        
      
    </script>
  </head>
  
    <body onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
        
        <c:set var="modalidad">
            <c:choose>
                <c:when test="${CMODO eq 'CONSULTA'}">
                    <axis:alt f="axisage031" c="CONSULTA" lit="109142" />
                </c:when>
                <c:when test="${CMODO eq 'MODIFICACION'}">
                    <axis:alt f="axisage031" c="MODIFICACION" lit="9907853" />
                </c:when>
                <c:when test="${CMODO eq 'ALTA'}">
                    <axis:alt f="axisage031" c="ALTA" lit="9001816" />
                </c:when>
            </c:choose>
        </c:set>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad">${modalidad}</c:param>
                <c:param name="formulario"><axis:alt c="formulario" f="axisage031" lit="9907661" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisage031" lit="9907661" /></c:param>
                <c:param name="form">axisage031</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage031" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage031" c="TIT_AXISPER001" lit="1000235" /></c:param>
                <c:param name="nid" value="axisper008" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage031" c="TIT_AXISAGE029" lit="9907742" /></c:param>
                <c:param name="nid" value="axisage029" />
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage031" c="TIT_AXISAGE032" lit="9907743" /></c:param>
                <c:param name="nid" value="axisage032" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage031" c="TIT_AXISADM001" lit="1000564" /></c:param>
                <c:param name="nid" value="axisadm003" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisage034" c="TIT_AXISAGE034" lit="9908188" /></c:param>
                <c:param name="nid" value="axisage034" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisctr080|<axis:alt f="axisage031" c="LIT_MOD_006" lit="9001947"/><%-- Búsqueda de Agentes --%></c:param>
            </c:import>
            
            <input type="hidden" name="operation"/>
            <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
            <input type="hidden" id="LOCALE" name="LOCALE" value="${sessionScope.__locale}"/>
            <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>     
           
            <input type="hidden" id="HCEMPRES" name="HCEMPRES" value="${CEMPRESSEL}"/>
            <input type="hidden" id="HCESTADO" name="HCESTADO" value="${liquida_cabecera.CESTAUTOLIQ}"/>
            
            
            <!-- Area de campos  -->
            <div class="separador">&nbsp;</div>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <div class="titulo"><img src="images/flecha.gif"/><axis:alt c="flecha" f="axisage031" lit="9907661" /></div>
                    <!--campos-->
                    <table class="seccion" align="center">
                      <tr>
                        <td class="campocaja" >                        
                            <img id="DSP_DATOS_GENERALES_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_DATOS_GENERALES', this)" style="cursor:pointer"/>
                            <b><axis:alt f="axisage031" c="DSP_DATOS_GENERALES" lit="103593"/></b>
                            <hr class="titulo">
                        </td>
                      </tr>
                      
                      <tr id="DSP_DATOS_GENERALES_children">
                        <td align="left">
                          <table class="area" align="center">
                            <tr>
                                    
                                <th style="width:20%;height:0%;"/>
                                <th style="width:20%;height:0%;"/>
                                <th style="width:35%;height:0%;"/>
                                <th style="width:25%;height:0%;"/>
                                
                            </tr>
                            <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="SPROLIQ" f="axisage031" lit="9901183" /></b>
                                    <img id="FIND_LIQ" src="images/find.gif" onclick="consultar_nuevo()" style="cursor:pointer"/>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="FLIQUIDA" f="axisage031" lit="100562" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="CAGENTE" f="axisage031" lit="9903137" /></b>
                                </td> 
                                <td class="titulocaja">
                                    <b><axis:alt c="CUSUARIO" f="axisage031" lit="9905522" /></b>
                                </td> 
                                
                            </tr>   
                                
                            <tr>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${liquida_cabecera.SPROLIQ}" name="SPROLIQ" id="SPROLIQ" size="1"
                                    style="width:90%" title="<axis:alt c="SPROLIQ" f="axisage031" lit="9901183"/>" <axis:atr f="axisage031" c="SPROLIQ" a="modificable=false"/>/>
                                </td>                                  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${liquida_cabecera.FLIQUID}"/>" name="FLIQUIDA" id="FLIQUIDA"  style="width:85%"
                                    <axis:atr f="axisage031" c="FLIQUIDA" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisage031" c="FLIQUIDA" lit="100562"/>"/> 
                                    <a id="icon_FLIQUIDA" style="vertical-align:middle" href="#"><img id="popup_calendario_FLIQUIDA" border="0" alt="<axis:alt f="axisage031" c="FLIQUIDA_CAL" lit="108341"/>" title="<axis:alt f="axisage031" c="TIT_FLIQUIDA" lit="100959" />" src="images/calendar.gif"/></a>
                                </td>  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${liquida_cabecera.CAGENTE}" name="CAGENTE" id="CAGENTE" size="1"
                                    style="width:20%" title="<axis:alt c="CAGENTE" f="axisage031" lit="9903137"/>" onchange="javascript:f_actualizar_agente();" <axis:atr f="axisage031" c="CAGENTE" a="modificable=false"/>/>
                                    <axis:visible f="axisage031" c="IAGENTE">
                                        <img border="0" id="IAGENTE" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    </axis:visible>
                                    <input readonly="true" type="text" name="TAGENTE" id="TAGENTE" value="${liquida_cabecera.MEDIADOR}" class="campowidthinput campo campotexto" style="width:70%" />
                                    <axis:ocultar f="axisage031" c="LIQUIDAAGE">                                          
                                          <input type="button" id="LIQUIDAAGE" onclick="f_actualizar_agente();" class="boton" value="<axis:alt f="axisage031" c="TIT_LIQUIDAAGE" lit="9000574"/>"/>
                                    </axis:ocultar>
                                </td> 
                                <td class="campocaja">
                                     <input type="text" class="campowidthinput campo campotexto" value="${liquida_cabecera.CUSUARI}" name="CUSUARIO" id="CUSUARIO" size="1"
                                    style="width:92%" title="<axis:alt c="CUSUARIO" f="axisage031" lit="9905522"/>" <axis:atr f="axisage031" c="CUSUARIO" a="modificable=false"/>/>
                                </td> 
                                 
                            </tr>
                             <tr>
                            
                                <td class="titulocaja">
                                    <b><axis:alt c="CEMPRES" f="axisage031" lit="101619"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="FCOBRO" f="axisage031" lit="9000805" /></b>
                                </td>   
                                <td class="titulocaja">
                                    <axis:visible f="axisage031" c="ITOMADOR">
                                        <b><axis:alt c="TOMADOR" f="axisage031" lit="109360" /></b>
                                    </axis:visible>
                                </td>   
                                <td class="titulocaja">
                                    <b><axis:alt c="IIMPORTE" f="axisage031" lit="9904351" /></b>
                                    
                                </td> 
                                
                            </tr>
                             <tr>
                                <td class="campocaja">
                                   <select name="CEMPRES" id="CEMPRES" size="1" class="campowidthselect campo campotexto" style="width:90%" <axis:atr f="axisage031" c="CEMPRES" a="modificable=false&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt c="LIT_SEL" f="axisage031" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${LIST_EMPRESAS}">
                                            <option value = "${element.CEMPRES}"
                                            <c:choose>
                                                <c:when test="${CEMPRESSEL == element.CEMPRES}">selected</c:when>
                                            </c:choose>>
                                                ${element.TEMPRES} 
                                            </option>
                                        </c:forEach>
                                    </select>  
                                </td>  
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${liquida_cabecera.FCOBRO}"/>" name="FCOBRO" id="FCOBRO"  style="width:85%"
                                    <axis:atr f="axisage031" c="FCOBRO" a="modificable=false"/> title="<axis:alt f="axisage031" c="FCOBRO" lit="9000805"/>"/> 
                                    <a id="icon_FCOBRO" style="vertical-align:middle" href="#"><img id="popup_calendario_FCOBRO" border="0" alt="<axis:alt f="axisage031" c="FCOBRO_CAL" lit="108341"/>" title="<axis:alt f="axisage031" c="TIT_FCOBRO" lit="100959" />" src="images/calendar.gif"/></a>
                                </td>  
                                <td class="campocaja">
                                    <axis:visible f="axisage031" c="ITOMADOR">
                                        <input type="text" class="campowidthinput campo campotexto" value="${CTOMADOR}" name="CTOMADOR" id="CTOMADOR" size="1"
                                        style="width:20%" title="<axis:alt c="CTOMADOR" f="axisage031" lit="109360"/>" onchange="javascript:f_actualizar_persona();" <axis:atr f="axisage031" c="CTOMADOR" a="modificable=false"/>/>
                                      	<axis:visible f="axisage031" c="IMGTOMADOR">
                                            <img border="0" id="ITOMADOR" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>
                                        </axis:visible>
                                        <input readonly="true" type="text" name="TTOMADOR" id="TTOMADOR" value="${TTOMADOR}" class="campowidthinput campo campotexto" style="width:70%" />
                                    </axis:visible>
                                </td>      
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total_documentos}"/>" name="IIMPORTE" id="IIMPORTE" size="15"
                                    style="width:92% ; text-align:right" title="<axis:alt c="IIMPORTE" f="axisage031" lit="9904351"/>" <axis:atr f="axisage031" c="IIMPORTE" a="modificable=false"/>/>
                                </td>  
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <axis:visible f="axisage031" c="CESTADO">
                                        <b><axis:alt c="CESTADO" f="axisage031" lit="9907741" /></b>
                                    </axis:visible>
                                </td>
                                <td></td>
                                <td></td>
                                <td class="titulocaja">
                                    <axis:visible f="axisage031" c="IDIMPORTE">
                                        <b><axis:alt c="IDIMPORTE" f="axisage031" lit="9907744" /></b>
                                    </axis:visible>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                    <axis:visible f="axisage031" c="CESTADO">
                                        <select name="CESTADO" id="CESTADO" size="1" class="campowidthselect campo campotexto" style="width:90%" <axis:atr f="axisage031" c="CESTADO" a="modificable=false&isInputText=false"/> <axis:alt f="axisage031" c="CESTADO" lit="9907741"/>>
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage031" c="SELECC" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${ESTADO_LIQUIDA}">
                                                <option value = "${element.CATRIBU}"
                                                <c:choose>
                                                    <c:when test="${liquida_cabecera.CESTAUTOLIQ == element.CATRIBU}">selected</c:when>
                                                </c:choose>>
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select> 
                                    </axis:visible>
                                </td>
                                <td></td>
                                <td></td>
                                <td class="campocaja">
                                    <axis:visible f="axisage031" c="IDIMPORTE">
                                        <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${total_dif_dg}"/>" name="IDIMPORTE" id="IDIMPORTE" size="15"
                                        style="width:92% ; text-align:right" title="<axis:alt c="IDIMPORTE" f="axisage031" lit="9907744"/>" onChange = "javascript:f_calculoma(this);" <axis:atr f="axisage031" c="IDIMPORTE" a="modificable=false"/>/>
                                    </axis:visible>
                                </td>
                                
                            </tr>
       
                        </table>
                        <div class="separador">&nbsp;</div>
                      </td>
                    </tr>
                    
                    <tr>
                        <td class="campocaja" >                        
                            <img id="DSP_DOCUMENTOS_COBRO_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_DOCUMENTOS_COBRO', this)" style="cursor:pointer"/>
                            <b><axis:alt f="axisage031" c="DSP_DOCUMENTOS_COBRO" lit="9001358"/></b>
                            <hr class="titulo">
                        </td>
                    </tr>
                    
                    <tr id="DSP_DOCUMENTOS_COBRO_children">
                      <td align="center">

                        <!-- Nombre columnas tablas -->
                        <c:set var="title1"><axis:alt c="FORMACOBRO" f="axisage031" lit="9902893"/></c:set> 
                        <c:set var="title2"><axis:alt c="DOCUMENTO" f="axisage031" lit="9903661"/></c:set> 
                        <c:set var="title3"><axis:alt c="BANCO" f="axisage031" lit="100879"/></c:set>  
                        <c:set var="title4"><axis:alt c="IIMPORTE" f="axisage031" lit="9904351"/></c:set> 
                        <c:set var="title5"><axis:alt c="FDOCUMENTO" f="axisage031" lit="9903313"/></c:set> 
                        <c:set var="title6"><axis:alt c="OBSERVACIONES" f="axisage031" lit="101162"/></c:set>   
                        <div style="width:98%" align="right">
                            <axis:visible f="axisage031" c="DOC">
                                <img border="0" id="DOC" onclick="f_abrir_axisage032()" alt="<axis:alt f="axisage031" c="DOC" lit="9902032"/>" src="images/document.gif" style="cursor:pointer"/>
                            </axis:visible>
                        </div>
                        <div class="seccion displayspaceGrande" style="width:98%">
                            <display:table name="${lista_liquida_documentos}" id="miListaId_documentos" export="false" class="dsptgtable" pagesize="8" defaultsort="2" defaultorder="ascending" requestURI="axis_axisage031.do?paginar=true&operation=form" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="CCOBRO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.TCOBRO}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="DOCUMENTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.DOCUMENTO}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="BANCO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.TBANCO}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="IMPORTE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_documentos.IMPORTE}"/></div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="FDOCUMENTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><fmt:formatDate value="${miListaId_documentos.FDOCUMENTO}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="OBSERVACIONES" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_documentos.OBSERVACIONES}</div>
                                </display:column>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><axis:visible f="axisage031" c="DELETE"><img id="DELETE" src="images/delete.gif" onclick="f_borrar_documento('${miListaId_documentos.NLIQLIN}')" style="cursor:pointer"/></axis:visible></div>
                                </display:column> 
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><axis:visible f="axisage031" c="MODIFICAR"><img id="MODIFICAR" src="images/lapiz.gif" onclick="f_modificar_documento('${miListaId_documentos.NLIQLIN}','${miListaId_documentos.TCOBRO}','${miListaId_documentos.CCOBRO}','${miListaId_documentos.DOCUMENTO}','${miListaId_documentos.TBANCO}','${miListaId_documentos.BANCO}','${miListaId_documentos.IMPORTE}','${miListaId_documentos.FDOCUMENTO}','${miListaId_documentos.OBSERVACIONES}')" style="cursor:pointer"/></axis:visible></div>
                                </display:column> 
                            </display:table>
                        
                            <c:choose>
                            <c:when test="${!empty lista_liquida_documentos &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId_documentos");</script>
                            </c:when>
                            </c:choose>
                        </div>     
                        <div class="separador">&nbsp;</div>
                        <div align="center" class="titulocaja">
                            <b><axis:alt c="TOTAL01" f="axisage031" lit="1000529" /></b>
                             <input type="text" class="campowidthinput campo campotexto" name="TOTAL01" id="TOTAL01" size="1" readonly="true" onchange="javascript:f_calculoma(this);"
                                    style="width:150px ; text-align:right" title="<axis:alt c="TOTAL01" f="axisage031" lit="1000529"/>" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.total_documentos}"/>"/>
                        </div>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                      </td>
                    </tr>

                    <axis:visible c="DSP_RECIBOS_PENDIENTES" f="axisage031">
                    <tr>
                        <td class="campocaja" >                        
                            <img id="DSP_RECIBOS_PENDIENTES_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_RECIBOS_PENDIENTES', this)" style="cursor:pointer"/>
                            <b><axis:alt f="axisage031" c="DSP_RECIBOS_PENDIENTES" lit="9001635"/></b>
                            <hr class="titulo">
                        </td>
                    </tr>
                    
                    <tr id="DSP_RECIBOS_PENDIENTES_children">
                      <td align="center">
                        <table align="center" style="width:90%">
                            <tr>
                                <td class="titulocaja" align="center">
                                    <axis:visible f="axisage031" c="seleccionaRecibo">
                                        <input type="radio" id="seleccionaReciboPendiente" name="seleccionaRecibo" checked="true"/>
                                        <b><axis:alt c="seleccionaReciboPendiente" f="axisage031" lit="9001635" /></b>
                                    </axis:visible>
                                </td>
                                <td class="titulocaja" align="center">
                                    <axis:visible f="axisage031" c="seleccionaRecibo">
                                        <input type="radio" id="seleccionaRecibo" name="seleccionaRecibo" />
                                        <b><axis:alt c="seleccionaRecibo" f="axisage031" lit="100895" /></b>
                                        <input type="text" class="campowidthinput campo campotexto" value="" name="recibo_input" id="recibo_input" size="1"
                                               style="width:150px" title="<axis:alt c="RECIBO_CK" f="axisage031" lit="100895"/>"/>
                                    </axis:visible>
                                </td>
                                <td class="titulocaja" align="right">
                                    <axis:visible f="axisage031" c="ANADIRRECIBO">
                                        <input type="button" id="ANADIRRECIBO" onclick="f_anadir_recibo()" class="boton" value="<axis:alt f="axisage031" c="ANADIR" lit="104825"/>"/>
                                    </axis:visible>
                                </td>
                            </tr>
                            
                        </table>
                        <div class="separador">&nbsp;</div>

                        <!-- Nombre columnas tablas -->
                        <c:set var="title1"><axis:alt c="R_E" f="axisage031" lit="9904010"/></c:set> 
                        <c:set var="title2"><axis:alt c="RECIBO" f="axisage031" lit="100895"/></c:set> 
                        <c:set var="title3"><axis:alt c="FP_FRA" f="axisage031" lit="9902938"/></c:set>  
                        <c:set var="title4"><axis:alt c="EFECTO" f="axisage031" lit="101332"/></c:set> 
                        <c:set var="title5"><axis:alt c="POLIZA" f="axisage031" lit="109546"/></c:set> 
                        <c:set var="title6"><axis:alt c="TOTALR" f="axisage031" lit="1000563"/></c:set>  
                        <c:set var="title7"><axis:alt c="COMISION" f="axisage031" lit="101509"/></c:set>  
                        <c:set var="title8"><axis:alt c="IRPF" f="axisage031" lit="112579"/></c:set> 
                        <c:set var="title9"><axis:alt c="LIQUIDO" f="axisage031" lit="110332"/></c:set>  
                        <c:set var="title10"><axis:alt c="DIF" f="axisage031" lit="9901680"/></c:set> 
                        <c:set var="title11"><axis:alt c="PL" f="axisage031" lit="9907745"/></c:set> 
                        <c:set var="title12"><axis:alt c="DIFPYG" f="axisage031" lit="9908280"/></c:set> 
                        <c:set var="title13"><axis:alt c="AGENTE" f="axisage031" lit="100584"/></c:set> 
						<c:set var="title14"><axis:alt c="ITOTCARG" f="axisage031" lit="89906162"/></c:set>                         
                        <div class="seccion displayspaceGrande" style="width:98%">
                            <display:table name="${lista_liquida_recibos}" id="miListaId_recibos" export="false" class="dsptgtable" pagesize="-1" defaultsort="0" defaultorder="ascending" requestURI="axis_axisage031.do?paginar=true&operation=form" sort="external" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="checkbox" id="seleccionaRecibos" name="seleccionaRecibos" onclick="f_actualizar_check_recibo('${miListaId_recibos.NRECIBO}')" <axis:atr f="axisage031" c="seleccionaRecibos" a="modificable=true&isInputText=false"/> <c:if test="${miListaId_recibos.CH == '1'}">checked</c:if> /></div>
                                </display:column> 
                                <display:column title="${title13}" sortable="true" sortProperty="CAGENTE" headerClass="sortable" style="width:8%" media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">${miListaId_recibos.CAGENTE}</a></div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="CTIPREC" headerClass="sortable" style="width:8%" media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">${miListaId_recibos.TTIPREC}</a></div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="NRECIBO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">${miListaId_recibos.NRECIBO}</a></div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="FP" headerClass="sortable" style="width:8%" media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">${miListaId_recibos.FP}</a></div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" style="width:8%" media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')"><fmt:formatDate value="${miListaId_recibos.FEFECTO}" pattern="dd/MM/yyyy"/></a></div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable" style="width:10%" media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">${miListaId_recibos.NPOLIZA}</a></div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="ITOTALR" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right">
                                    <a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.ITOTALR}"/>
                                    </a></div>
                                </display:column>
								<display:column title="${title14}" sortable="true" sortProperty="ITOTCARG" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right">
                                    <a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.ITOTCARG}"/>
                                    </a></div>
                                </display:column>
                                <display:column title="${title10}" sortable="true" sortProperty="DIF" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" align="center"><input type="text" style="text-align:right" class="campowidthinput campo campotexto" onchange="f_actualizar_dif('${miListaId_recibos.NRECIBO}', this.value);" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.DIF}"/>" name="dif_input" id="dif_input_${miListaId_recibos.NRECIBO}" size="1" style="width:50px" 
                                    <axis:atr f="axisage031" c="dif_input" a="modificable=false"/>/></div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="COMISION" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right">
                                    <a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.COMISION}"/>
                                    </a></div>
                                </display:column>
                                <display:column title="${title8}" sortable="true" sortProperty="IRPF" headerClass="sortable"  media="html" autolink="false" >                                    
                                    <div class="dspText" style="text-align:right">
                                    <a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.IRPF}"/>
                                    </a>
                                    </div>
                                </display:column>
                                <display:column title="${title9}" sortable="true" sortProperty="LIQUIDO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right">                                    
                                        <a href="javascript:f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')">
                                    <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_recibos.LIQUIDO}"/>
                                    </a></div>
                                </display:column>
                                <display:column title="${title11}" sortable="true" sortProperty="PL" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><div class="dspIcons"><input type="checkbox" id="seleccionaPL" name="seleccionaPL" onclick="f_actualizar_check_pl('${miListaId_recibos.NRECIBO}')" <axis:atr f="axisage031" c="seleccionaPL" a="modificable=true&isInputText=false"/> <c:if test="${miListaId_recibos.PL == '1'}">checked</c:if> /></div>
                                </display:column>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><img id="FIND" src="images/find.gif" onclick="f_abrir_axisadm003('${miListaId_recibos.NRECIBO}')" alt="" style="cursor:pointer"/ ></div>
                                </display:column> 
<!--                                 AAC_INI-CONF_379-20160927 -->
								<display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html" style="width:5%"	autolink="false">
									<div class="dspIcons" id="DETREC">
<%-- 								<c:if test="${miListaId_recibos.CESTREC == 0}"> --%>
										<img border="0"
										alt="<axis:alt f="axisadm003" c="CESTREC" lit="9000791"/>"
										title1="<axis:alt f="axisadm003" c="CESTREC" lit="9000791"/>"
										src="images/mes.gif" width="11px" height="11px"
										style="cursor: pointer;"
										onclick="javascript:mostrar('SECCION_A${miListaId_recibos.SMOVREC}','DETREC')" onmouseover="javascript:mostrar('SECCION_B${miListaId_recibos.SMOVREC}','DETREC')" 
                                                                            onmouseout="javascript:ocultar('SECCION_B${miListaId_recibos.SMOVREC}')"/>
<%-- 									</c:if> --%>
									</div>
								</display:column>
								<display:column class="seccion_informacion">
                                                                    <div id="SECCION_B${miListaId_recibos.SMOVREC}" style="height:100px;width:500px;" class="seccion_informacion">
                                                                        <!-- INICIO SECCION -->
                                                                         <table class="area" align="center">
                                                                             <tr>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                                <th style="width:20%;height:0px"></th>
                                                                             </tr>
                                                                             <tr>
                                                                                <%-- Campo 1 --%>
                                                                                <axis:ocultar c="IMPPEND" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="IMPPEND" lit="9909767"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="VABONO" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="VABONO" lit="9001849"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="FABONO" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="FABONO" lit="9909769"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="DOCRECAUD" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="DOCRECAUD" lit="9909770"/></b>
                                                                                </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="CORTEPROD" f="axisadm003" dejarHueco="false">
                                                                                <td class="titulocaja" style="border: 1px solid #DDDDDD;">
                                                                                   <b><axis:alt f="axisadm003" c="CORTEPROD" lit="9909771"/></b>
                                                                                </td>
                                                                                </axis:ocultar>                                                                        
                                                                            </tr>
                                                                             <tr>
                                                                                <axis:ocultar c="IMPPEND" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white; border-right-width: 0px;padding-right:0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="IMPPEND" name="IMPPEND" width<axis:atr f="axisadm003" c="IMPPEND" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${miListaId_recibos.IMPPEND}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="VABONO" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;padding-right:0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="VABONO" name="VABONO" <axis:atr f="axisadm003" c="VABONO" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${miListaId_recibos.VABONO}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="FABONO" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;padding-right:0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="FABONO" name="FABONO" <axis:atr f="axisadm003" c="FABONO" a="modificable=false&obligatorio=false"/>  
                                                                                            value="${miListaId_recibos.FABONO}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
                                                                                <axis:ocultar c="DOCRECAUD" f="axisadm003" dejarHueco="false">
                                                                                    <td class="campocaja" style="background-color:white;border-right-width: 0px;padding-right:0px;">
                                                                                        <input type="text" class="campo campotexto campodisabled" id="DOCRECAUD" name="DOCRECAUD" <axis:atr f="axisadm003" c="DOCRECAUD" a="modificable=false&obligatorio=false"/> size="15" 
                                                                                            value="${miListaId_recibos.DOCRECAUD}" readonly="readonly"/>
                                                        
                                                                                    </td>
                                                                                </axis:ocultar>
																				<axis:ocultar f="axisage003" c="CORTEPROD"
																					dejarHueco="false">
																					<td class="campocaja" style="background-color:white;border-right-width: 0px;padding-right:0px;align:center;"><input type="checkbox"
																						name="CORTEPROD" id="CORTEPROD"
																						onclick="actualitzarCheckbox(this)"
																						title="<axis:alt f='axisage003' c='CORTEPROD' lit='9909824'/>"
																						<c:if test="${miListaId_recibos.CORTEPROD == 1}">checked</c:if>
																						value="${miListaId_recibos.CORTEPROD}"
																						<axis:atr f="axisage003" c="CORTEPROD" a="modificable=false&isInputText=false"/> /></td>
																					</td>
																				</axis:ocultar>
															</tr>
                                                                        </table>
                                                                    </div>
                                                                </display:column>
                                                                <!--AAC_FI-CONF_379-20160927 -->
                                                                
                            </display:table>
                        
                            <c:choose>
                            <c:when test="${!empty lista_liquida_recibos &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                <script language="javascript">objUtiles.retocarDsptagtable("miListaId_recibos");</script>
                            </c:when>
                            </c:choose>
                        </div>
                        
                        <div class="titulocaja">
                        <table>
                            <tr>
                                <th style="width:50%;height:0%;"/>
                                <th style="width:50%;height:0%;"/>
                            </tr>
                            <tr>
                                <td align="right" class="titulocaja" width="50" >
                                    <b><axis:alt c="TOTAL02" f="axisage031" lit="1000529" /></b>
                                </td>
                                <td style="width:100%;">
                                    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02" id="TOTAL02" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_01}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>
                                    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02E" id="TOTAL02E" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_05}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02E" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>
                                    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02B" id="TOTAL02B" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_02}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02B" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>
                                    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02C" id="TOTAL02C" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_03}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02C" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>
                                    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02D" id="TOTAL02D" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_04}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02D" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>
                                 <!--    <input type="text" class="campowidthinput campo campotexto" name="TOTAL02F" id="TOTAL02F" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[CMONEDAPROD]}" value="${sessionScope.total_recibos_07}"/>"
                                            style="width:15%;display: inline-block; text-align:right" title="<axis:alt c="TOTAL02F" f="axisage031" lit="1000529"/>" readonly="true" onchange="javascript:f_calculoma(this);"/>        
                                 --></td>
                             </tr>
                        </table>
                        </div>
                        <div align="center" style="width:98%">
                           <table align="center" >
                              <tr>
                                <th style="width:45%;height:0%;"/>
                                <th style="width:55%;height:0%;"/>
                              </tr>
                              <tr>
                                <td class="titulocaja" align="left"  style="min-width: 400px;">
                                    <axis:visible f="axisage031" c="MARCARDESMARCAR">
                                        <input type="button" id="mt" name="mt"  onclick="marcarTodos()" class="boton"  value="<axis:alt f="axisage031" c="MARCAR" lit="9904510"/>" style="cursor:pointer"/>
                                        <input type="button" id="dmt" name="dmt" onclick="desmarcarTodos()" class="boton"  value="<axis:alt f="axisage031" c="DESMARCAR" lit="9904511"/>" style="cursor:pointer"/>
                                    </axis:visible>
				   <axis:ocultar f="axisage031" c="ANADIRRECIBOP">
                                          <input type="text" class="campowidthinput campo campotexto" value="" name="recibo_inputp" id="recibo_inputp" size="1"
                                               style="width:20%" title="<axis:alt c="RECIBO_CK" f="axisage031" lit="100895"/>"/>
                                          <input type="button" id="ANADIRRECIBOP" onclick="f_anadir_recibo()" class="boton" value="<axis:alt f="axisage031" c="ANADIR" lit="9001046"/>"/>
                                    </axis:ocultar>
                                </td>
                                <td class="titulocaja" style="min-width: 400px;">
                                    <axis:visible f="axisage031" c="TOTAL03">
                                        <b><axis:alt c="seleccionaPendiente" f="axisage031" lit="9907746" /></b>
                                        <input type="text" class="campowidthinput campo campotexto" name="TOTAL03" id="TOTAL03" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.total_recibos_06}"/>"
                                               style="width:18%; text-align:right" title="<axis:alt c="TOTAL03" f="axisage031" lit="9907746"/>" readonly="true"/>
                                    </axis:visible>                                   
                                   <axis:visible f="axisage031" c="MARCARCI">
                                            <input type="button" onclick="desmarcarTodosCI()" id="dmtCI" name="dmtCI" class="boton" value="<axis:alt f="axisage031" c="MARCAR" lit="9908244"/>" style="cursor:pointer;float: right;margin-left:10px;"/>
                                            <input type="button" onclick="marcarTodosCI()" id="mtCI" name="mtCI"  class="boton" value="<axis:alt f="axisage031" c="MARCAR" lit="9908243"/>" style="cursor:pointer;float: right;"/>
                                    </axis:visible>
                                </td>
                                <td class="titulocaja">
                                    
                                </td>
                              </tr>
                              <tr>
                              <td class="titulocaja">
                                    
                                </td>
                              <td class="titulocaja" align="left">
                               <axis:ocultar f="axisage031" c="IDIFGLOBAL">
                               			  <b><axis:alt c="IDIFGLOBAL" f="axisage031" lit="9906899" /></b>
                                          <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.total_recibos_05}"/>" name="IDIFGLOBAL" onChange = "f_actualizar_dif_global(this.value)" id="IDIFGLOBAL" size="1"
                                               style="width:20% ;text-align:right" <axis:atr f="axisage031" c="IDIFGLOBAL" a="modificable=true"/> title="<axis:alt c="IDIFGLOBAL" f="axisage031" lit="100895"/>" readonly="true"/>                                          
                                    </axis:ocultar>
                                    </td>
                              </tr>
                            </table>
                        </div>
                        <div class="separador">&nbsp;</div>
                        <div class="separador">&nbsp;</div>
                      </td>
                    </tr>
                    </axis:visible>
                    <axis:visible c="DSP_APUNTES_PENDIENTES" f="axisage031">
                    <tr>
                        <td class="campocaja" >                        
                            <img id="DSP_APUNTES_PENDIENTES_parent" src="images/menys.gif" onclick="objEstilos.toggleDisplay('DSP_APUNTES_PENDIENTES', this)" style="cursor:pointer"/>
                            <b><axis:alt f="axisage031" c="DSP_APUNTES_PENDIENTES" lit="9907768"/></b>
                            <hr class="titulo">
                        </td>
                    </tr>
                    
                    <tr id="DSP_APUNTES_PENDIENTES_children">
                      <td align="center">

                        <!-- Nombre columnas tablas -->
                        <c:set var="title1"><axis:alt c="LINEA" f="axisage031" lit="9907747"/></c:set> 
                        <c:set var="title2"><axis:alt c="TIPO" f="axisage031" lit="9905645"/></c:set> 
                        <c:set var="title3"><axis:alt c="POLIZA" f="axisage031" lit="109546"/></c:set>  
                        <c:set var="title4"><axis:alt c="REFERENCIA" f="axisage031" lit="9902225"/></c:set> 
                        <c:set var="title5"><axis:alt c="FVALOR" f="axisage031" lit="102512"/></c:set> 
                        <c:set var="title6"><axis:alt c="CONCEPTO" f="axisage031" lit="9903074"/></c:set>  
                        <c:set var="title7"><axis:alt c="DEBE" f="axisage031" lit="9000499"/></c:set>  
                        <c:set var="title8"><axis:alt c="HABER" f="axisage031" lit="101004"/></c:set> 
                        <c:set var="title9"><axis:alt c="DESCRIPCION" f="axisage031" lit="101761"/></c:set> 
                        <c:set var="title10"><axis:alt c="AGENTE" f="axisage031" lit="100584"/></c:set> 
                        
                        <div class="seccion displayspaceGrande" style="width:98%">
                           <display:table name="${lista_liquida_apuntes}" id="miListaId_apuntes" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" requestURI="axis_axisage031.do?paginar=false&operation=form" sort="list" cellpadding="0" cellspacing="0">
                                 <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="checkbox" id="seleccionaLiquidacion" name="seleccionaLiquidacion" onclick="f_actualizar_check_apunte('${miListaId_apuntes.NNUMLIN}')" value="" <c:if test="${miListaId_apuntes.CH == '1'}">checked</c:if> <axis:atr f="axisage031" c="seleccionaLiquidacion" a="modificable=true&isInputText=false"/>/></div>
                                </display:column> 
                                <display:column title="${title10}" sortable="true" sortProperty="CAGENTE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.CAGENTE}</div>
                                </display:column>
                                <display:column title="${title1}" sortable="true" sortProperty="NNUMLIN" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.NNUMLIN}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TIPO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.TIPO}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="POLIZA" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.POLIZA}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="REFEREN" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.REFEREN}</div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="FVALOR" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><fmt:formatDate value="${miListaId_apuntes.FVALOR}" pattern="dd/MM/yyyy"/></div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="CONCEPTO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.CONCEPTO}</div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="DEBE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_apuntes.DEBE}"/></div>
                                </display:column>
                                <display:column title="${title8}" sortable="true" sortProperty="HABER" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText" style="text-align:right"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId_apuntes.HABER}"/></div>
                                </display:column>
                                <display:column title="${title9}" sortable="true" sortProperty="DESCRIPCION" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId_apuntes.DESCRIPCION}</div>
                                </display:column>
                            </display:table>
                        
                            <c:choose>
                                <c:when test="${!empty lista_liquida_apuntes &&  !(fn:containsIgnoreCase(header['User-Agent'],'ipad') )}">
                                    <script language="javascript">objUtiles.retocarDsptagtable("miListaId_apuntes");</script>
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="separador">&nbsp;</div>
                        <div align="center" class="titulocaja">
                            <axis:visible f="axisage031" c="TOTAL04">
                                <b><axis:alt c="TOTAL04" f="axisage031" lit="9907746" /></b>
                                 <input type="text" class="campowidthinput campo campotexto" name="TOTAL04" id="TOTAL04" size="1" value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.total_apuntes}"/>"
                                        style="width:150px ; text-align:right" onchange="f_calculoma(this);" title="<axis:alt c="TOTAL04" f="axisage031" lit="9907746"/>" readonly="true"/>
                            </axis:visible>
                        </div>
                      </td>
                    </tr>
                    </axis:visible>                                        
                   </table>
                 </td>
               </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisage031</c:param>        
                <c:param name="__botones">salir<axis:visible f="axisage031" c="BOTON_CTS">,9907854</axis:visible><axis:visible f="axisage031" c="BOTON_GUARDAR">,guardar</axis:visible><axis:visible f="axisage031" c="BOTON_ELIM">,1000127</axis:visible><axis:visible f="axisage031" c="BOTON_LIQ">,9001771</axis:visible></c:param>
            </c:import>
        </form>
        
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FLIQUIDA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FLIQUIDA", 
                singleClick    :    true,
                firstDay       :    1
            });

            Calendar.setup({
                inputField     :    "FCOBRO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FCOBRO", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
        
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>
