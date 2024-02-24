<%/* Revision:# 7OOLuxm2EfhEZVjUHTOtlQ== # */%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ page import="axis.mvc.model.*" %><% //ecg20131002 %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axissin073" c="LIT_BUSC_SIMUL" lit="1000200"/></title>
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
            

            function f_onload() {
                f_cargar_propiedades_pantalla();    	
            }      
            
            function f_but_buscar(){
                f_cargar_listaVersionesDian();
            }
            
             function f_but_9002021() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            } 
            
            
            function f_but_editar(NRESOL) {
                f_abrir_axisadm206("MODIFICACION", NRESOL);
            }
            
            
             function cargaListasTramitaciones(NSINIES){      
 				
 				NSINIES = objDom.getValorPorId("NSINIES");
                objUtiles.ejecutarFormulario ("axis_axissin073.do", "cargaListasTramitaciones", document.miForm, "_self");    
            }
            
            function f_abrir_axissin019() {
                objDom.setValorPorId("indexTramitacio", "");
                objDom.setValorPorId("indexReserva", "");
                objDom.setValorPorId("indexPago", "");
                objDom.setValorPorId("indexRecobro", "");
                objUtiles.abrirModal("axissin019","src","modal_axissin019.do?operation=form&tipo=SINIESTRO");
            }


            function f_cerrar_axissin019() {
                objUtiles.cerrarModal("axissin019");
                f_but_cancelar();
            } 
            
             function f_aceptar_axissin019(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
               
               objUtiles.cerrarModal("axissin019");
               objDom.setValorPorId("NSINIES", NSINIES);
               objDom.setValorPorId("SSEGURO", SSEGURO);
               objDom.setValorPorId("SPRODUC", SPRODUC);
               objDom.setValorPorId("CACTIVI", CACTIVI);
               document.miForm.NSINIES.value = NSINIES;
               cargaListasTramitaciones(NSINIES);
            }
            
        /****************************************************************************************/
        /************************************** AXISPER008****************************************/
        /****************************************************************************************/        
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
            if(objUtiles.estaVacio(document.miForm.SPERSON.value)){
                f_but_salir();
                }     
        }     
        function f_abrir_axisper008() {
            objUtiles.abrirModal("axisper008","src","modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008&CMODO=CONSULTA");
        }
        function f_aceptar_mtn_axisper008 (selectedPerson,selectedAgente){
            objUtiles.cerrarModal("axisper008");
            
			if (!objUtiles.estaVacio(selectedPerson)){
                var qs="operation=ajax_documentos";
                qs=qs+"&selectedPerson="+selectedPerson+"&selectedAgente="+selectedAgente;
                var origen = 'selectedPerson';
                objAjax.invokeAsyncCGI("axis_axissin073.do", callbackajaxagencia, qs, this, null, origen)
            } 
        }
        
        function f_abrir_axisper008a() {
            objUtiles.abrirModal("axisper008","src","modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008a&CMODO=CONSULTA");
        }
        function f_aceptar_mtn_axisper008a (selectedPerson,selectedAgente){
            objUtiles.cerrarModal("axisper008");

            if (!objUtiles.estaVacio(selectedPerson)){
                var qs="operation=ajax_documentos";
                qs=qs+"&selectedPerson="+selectedPerson+"&selectedAgente="+selectedAgente;
                var origen = 'selectedPerson';
                objAjax.invokeAsyncCGI("axis_axissin073.do", callbackajaxaero, qs, this, null, origen)
            } 
        }
        
        function callbackajaxagencia (ajaxResponseText,origen){
            try{ 
            
                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                	
                	
                	var persona = doc.getElementsByTagName("OBPERSONA")[0];
                	
                	var NNUMIDE = objDom.getValorNodoDelComponente(persona.getElementsByTagName("NNUMIDE"), 0, 0);
                	var TAPELLI1 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TAPELLI1"), 0, 0);
                	var SPERSON_AGENCIA = objDom.getValorNodoDelComponente(persona.getElementsByTagName("SPERSON"), 0, 0);


                	document.getElementById("NOMBRE_AGENCIA").value = TAPELLI1;
                	document.getElementById("NNUMIDE_AGENCIA").value = NNUMIDE;
                	document.getElementById("SPERSON_AGENCIA").value = SPERSON_AGENCIA;
                	
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function callbackajaxaero (ajaxResponseText,origen){
            try{ 
            
                
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                	
                	
                	var persona = doc.getElementsByTagName("OBPERSONA")[0];
                	
                	var NNUMIDE = objDom.getValorNodoDelComponente(persona.getElementsByTagName("NNUMIDE"), 0, 0);
                	var TAPELLI1 = objDom.getValorNodoDelComponente(persona.getElementsByTagName("TAPELLI1"), 0, 0);
                	var SPERSON_AERO = objDom.getValorNodoDelComponente(persona.getElementsByTagName("SPERSON"), 0, 0);

                	document.getElementById("NOMBRE_AERO").value = TAPELLI1;
                	document.getElementById("NNUMIDE_AERO").value = NNUMIDE;
                	document.getElementById("SPERSON_AERO").value = SPERSON_AERO;
                	
             
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_but_9002045(){
		        var hayChecked = objUtiles.f_GuardaCasillasChecked("radioSelectTramit");
		        var hayChecked2 = objUtiles.f_GuardaCasillasChecked("radioSelectReserva");
		        if(typeof hayChecked == 'boolean') {
		            alert('<axis:alt f="axispro002" c="CCOMPANI" lit="9910856"/>');
		        }else{
		            objUtiles.ejecutarFormulario ("axis_axissin073.do", "crear_pagos", document.miForm, "_self"); 
		        }    
        }

		function f_actualizar_persona (){
                objAjax.invokeAsyncCGI("axis_axissin073.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&NNUMIDE=" + document.getElementById("NNUMIDE_AGENCIA").value, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function callbackAjaxActualizarPersona(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDE_AGENCIA", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDE_AGENCIA", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("NOMBRE_AGENCIA", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NOMBRE_AGENCIA", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NNUMIDE_AGENCIA", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_actualizar_persona2 (){
        
                objAjax.invokeAsyncCGI("axis_axissin073.do", callbackAjaxActualizarPersona, "operation=actualizar_persona&NNUMIDE=" + document.getElementById("NNUMIDE_AERO").value, this, objJsMessages.jslit_actualizando_registro);

        }
        
        function callbackAjaxActualizarPersona2(ajaxResponseText) {
        
            var doc = objAjax.domParse(ajaxResponseText);
            try {            
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0])) {
                        objDom.setValorPorId("NNUMIDE_AERO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NNUMIDE_AERO", "");
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE")[0])) {
                        objDom.setValorPorId("NOMBRE_AERO", objUtiles.stringTrim(objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0)));
                    } else {
                        objDom.setValorPorId("NOMBRE_AERO", "");
                    }
                
                } else {                       
                    objDom.setValorPorId("NNUMIDE_AERO", "");
                }
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
        
        function f_actualizarImporte (thiss) {
        
        var IOTROSGAS_AERO;
        
        	if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PIVA_AERO')){
        		var PIVA_AERO = parseFloat(thiss.value);
        		var ISINRET_AERO = parseFloat(f_get_float(objDom.getValorPorId("ISINRET_AERO")));
        		var VALOR_CALCULADO = (ISINRET_AERO * PIVA_AERO)/100;
        		objDom.setValorPorId("IIVA_AERO", validarNumeros(f_formatoscomas(String(VALOR_CALCULADO))));
        		objDom.setValorPorId("INETO_AERO", validarNumeros(f_formatoscomas(String(ISINRET_AERO + VALOR_CALCULADO))));
        		
        	}else if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'PIVA_AGENCIA')){
        	
        		var PIVA_AGENCIA = parseFloat(thiss.value);
        		var ISINRET_AGENCIA = parseFloat(f_get_float(objDom.getValorPorId("ISINRET_AGENCIA")));
        		var VALOR_CALCULADO = (ISINRET_AGENCIA * PIVA_AGENCIA)/100;
        		objDom.setValorPorId("IIVA_AGENCIA", validarNumeros(f_formatoscomas(String(VALOR_CALCULADO))));
        		objDom.setValorPorId("INETO_AGENCIA", validarNumeros(f_formatoscomas(String(ISINRET_AGENCIA + VALOR_CALCULADO))));
        		
        	}
        		
        		
       		IOTROSGAS_AERO = objDom.getValorPorId("IOTROSGAS_AERO");
       		if(objUtiles.estaVacio(IOTROSGAS_AERO)){
        		IOTROSGAS_AERO = "0";
        	}
        	
        	
        		
        	var INETO_AERO = objDom.getValorPorId("INETO_AERO");
        	
	        
        	var INETO_AGENCIA = objDom.getValorPorId("INETO_AGENCIA");
        	
        	if(objUtiles.estaVacio(INETO_AGENCIA)){
        		INETO_AGENCIA = "0";
        	}
        	
        	INETO_AERO = parseFloat(f_get_float(INETO_AERO));
        	INETO_AGENCIA = parseFloat(f_get_float(INETO_AGENCIA));
        	IOTROSGAS_AERO = parseFloat(f_get_float(IOTROSGAS_AERO));
        	
        	if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'IOTROSGAS_AERO')){
        		if(!objUtiles.estaVacio(objDom.getValorPorId("PIVA_AERO"))){
        			var PIVA_AERO = parseFloat(f_get_float(objDom.getValorPorId("PIVA_AERO")));}
        		else{
        			var PIVA_AERO = 0;
        		}	
        		if(!objUtiles.estaVacio(objDom.getValorPorId("PIVA_AERO"))){
        			var ISINRET_AERO = parseFloat(f_get_float(objDom.getValorPorId("ISINRET_AERO")));}
        		else{
        			var ISINRET_AERO = 0;
        		}	
        		var VALOR_CALCULADO = (ISINRET_AERO * PIVA_AERO)/100;
        		objDom.setValorPorId("IIVA_AERO", validarNumeros(f_formatoscomas(String(VALOR_CALCULADO))));
        		objDom.setValorPorId("INETO_AERO", validarNumeros(f_formatoscomas(String(ISINRET_AERO + VALOR_CALCULADO+ IOTROSGAS_AERO))));
         		INETO_AERO = ISINRET_AERO + VALOR_CALCULADO+ IOTROSGAS_AERO;
         	}
         	objDom.setValorPorId("IOTROSGAS_AERO", validarNumeros(f_formatoscomas(String(IOTROSGAS_AERO))));	  	
        	objDom.setValorPorId("ITOTFACTURA", validarNumeros(f_formatoscomas(String(INETO_AERO + INETO_AGENCIA))));
        }
        
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
             
            function f_formatear(thiss){
                thiss.value = validarNumeros(thiss.value);
            }
            
            function f_get_float(NUEMERO){
            	NUMERO = NUEMERO.replace(/\./g, "");
            	return NUMERO;
            }
            
            function f_formatoscomas(NUEMERO){
            	NUMERO = NUEMERO.replace(/\./g, ",");
            	return NUMERO;
            }

    </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="TTITULO" id="TTITULO" value=""/>
        <input type="hidden" name="CMODO" id="CMODO" value=""/>
        <input type="hidden" name="SPERSON_AGENCIA" id="SPERSON_AGENCIA" value="${__formdata.SPERSON_AGENCIA}"/>
        <input type="hidden" name="SPERSON_AERO" id="SPERSON_AERO" value="${__formdata.SPERSON_AERO}"/>
        
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axissin073" c="TITULO" lit="9910781" /></c:param>
                <c:param name="formulario"><axis:alt f="axissin073" c="TITULO" lit="9910781" /></c:param>
                <c:param name="form">axissin073</c:param>
        </c:import>
        
		<c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axissin019|<axis:alt f="axissin073" c="MODAL_AXISSIN019" lit="9001334"/></c:param>
        </c:import> 
        
        <c:import url="../include/modal_estandar.jsp">
	      <c:param name="titulo">
	        <axis:alt f="axisper009" c="MODPER008_TIT" lit="1000235"/>
	      </c:param>
	      <c:param name="nid" value="axisper008"/>
	    </c:import>
  
  
  
        
        
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>          
            <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                              
                            </tr>
                            <tr>
                                <axis:visible f="axissin073" c="NSINIES"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="NSINIES" lit="9905621" /></b>
                                        <img id="IMG_SIN_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axissin019()" style="cursor:pointer"/>
                                        
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="NSINIES" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NSINIES" id="NSINIES" value="${NSINIES}"  class="campo campotexto"  onchange = "cargaListasTramitaciones()"
                                        <axis:atr f="axissin073" c="NSINIES" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                            </tr>           
                        </table>
                        <div class="separador">&nbsp;</div>   
                        </tr>
                    </table>
                    
           <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin073" c="LIT_RESULTAT" lit="9910788" /></div>
           <!-- IAX -->
           
            <table class="seccion">
                 <tr>
                    <td>
                        <c:set var="title0"><axis:alt f="axissin073" c="TIPO" lit="100565"/></c:set>
                        <c:set var="title1"><axis:alt f="axissin073" c="TTRAMIT" lit="100559"/></c:set>
                        <c:set var="title2"><axis:alt f="axissin073" c="TTRAMITAD" lit="9910785"/></c:set>
                        <div class="displayspace">
                            <display:table name="${listaTramites}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axissin073.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" >
                                    <div class="dspIcons">
                                     <input value="${miListaId['NTRAMIT']}" type="radio" id="radioSelectTramit" name="radioSelectTramit"/></div>
                                </display:column>
                                
                                <display:column title="" sortable="true" sortProperty="NTRAMIT" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['NTRAMIT']}</a></div>
                                </display:column>
                                
                                <display:column title="${title0}" sortable="true" sortProperty="TIPO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TIPO']}</a></div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="TTRAMIT" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TTRAMIT']}</div>
                                </display:column>
                                
                                <display:column title="${title2}" sortable="true" sortProperty="TTRAMITAD" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TTRAMITAD']}</div>
                                </display:column>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>     
            
             <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin073" c="LIT_RESULTAT" lit="9910789" /></div>
           <!-- IAX -->
           
            <table class="seccion">
                 <tr>
                    <td>
                        <c:set var="title0"><axis:alt f="axissin073" c="TIPO" lit="100565"/></c:set>
                        <c:set var="title1"><axis:alt f="axissin073" c="COBERTURA" lit="9908743"/></c:set>
                        <c:set var="title2"><axis:alt f="axissin073" c="MONEDA" lit="9907718"/></c:set>
                        <c:set var="title3"><axis:alt f="axissin073" c="SALDO" lit="9910790"/></c:set>
                        <div class="displayspace">
                            <display:table name="${listaReservas}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="axis_axissin073.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" >
                                    <div class="dspIcons">
                                     <input value="${miListaId['NMOVRES']};${miListaId['CTIPRES']};${miListaId['CGARANT']};${miListaId['CMONRES']}" type="radio" id="radioSelectReserva" name="radioSelectReserva"/></div>
                                </display:column>
                                
                                <display:column title="" sortable="true" sortProperty="NMOVRES" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['NMOVRES']}</a></div>
                                </display:column>
                                
                                <display:column title="${title0}" sortable="true" sortProperty="TIPO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TIPO']}</a></div>
                                </display:column>
                                
                                <display:column title="${title1}" sortable="true" sortProperty="COBERTURA" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['TGARANT']}</div>
                                </display:column>
                                
                                <display:column title="${title2}" sortable="true" sortProperty="MONEDA" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText">${miListaId['CMONRES']}</div>
                                </display:column>
                                
                                <display:column title="${title3}" sortable="true" sortProperty="SALDO" headerClass="sortable"  media="html" autolink="false" > 
                                    <div class="dspText"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['SALDO']}"/></div>
                                </display:column>
                            </display:table>
                        </div>
                    </td>
                </tr>
            </table>  
            
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin073" c="LIT_RESULTAT" lit="9910819" /></div>
           <!-- IAX -->   
           
           <!--campos-->
             <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                              
                            </tr>
                            <tr>
                                <axis:visible f="axissin073" c="NNUMIDE_AGENCIA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="NNUMIDE_AGENCIA" lit="9910820" /></b>
                                        <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>
                                        
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="NNUMIDE_AGENCIA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NNUMIDE_AGENCIA" id="NNUMIDE_AGENCIA" value="${NNUMIDE_AGENCIA}"  class="campowidthinput campo campotexto"  onchange = "f_actualizar_persona()"
                                        	<axis:atr f="axissin073" c="NNUMIDE_AGENCIA" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="NOMBRE_AGENCIA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NOMBRE_AGENCIA" id="NOMBRE_AGENCIA" value="${NOMBRE_AGENCIA}"  class="campowidthinput campo campotexto" 
                                        	<axis:atr f="axissin073" c="NOMBRE_AGENCIA" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                            </tr>        
                            <tr>
                                <axis:visible f="axissin073" c="NNUMIDE_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="NNUMIDE_AERO" lit="9910821" /></b>
                                        <img id="find2" border="0" src="images/find.gif" onclick="f_abrir_axisper008a()" style="cursor:pointer"/>
                                        
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="NNUMIDE_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NNUMIDE_AERO" id="NNUMIDE_AERO" value="${__formdata.NNUMIDE_AERO}"  class="campowidthinput campo campotexto"  onchange = "f_actualizar_persona2()"
                                        	<axis:atr f="axissin073" c="NNUMIDE_AERO" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="NOMBRE_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NOMBRE_AERO" id="NOMBRE_AERO" value="${__formdata.NOMBRE_AERO}"  class="campowidthinput campo campotexto" "
                                        	<axis:atr f="axissin073" c="NOMBRE_AERO" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                            </tr>
                       </table>  
                       <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                              
                            </tr>   
                            <tr>
                                <axis:visible f="axissin073" c="NFACREF"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="NFACREF" lit="9903744" /></b>                                        
                                    </td>
                                </axis:visible>
                                <axis:visible f="axissin073" c="FFACREF"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="FFACREF" lit="9000956" /></b>                                        
                                    </td>
                                </axis:visible>
                                <axis:visible f="axissin073" c="PCCONPAG"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="PCCONPAG" lit="9000715" /></b>                                        
                                    </td>
                                </axis:visible>
                            </tr>                                    
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="NFACREF" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="NFACREF" id="NFACREF" value="${NFACREF}"  class="campowidthinput campo campotexto"  size="15" 
                                        	<axis:atr f="axissin073" c="NFACREF" a="modificable=true&obligatorio=true"/>/>
                                    </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="FFACREF" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${FFACREF}' pattern='dd/MM/yyyy'/>" name="FFACREF" id="FFACREF" 
                                            style="width:55%;" <axis:atr f="axissin073" c="FFACREF" a="modificable=true&obligatorio=true"/>/> 
                                            <a style="vertical-align:middle;"><img
                                            id="icon_FFACREF" border=0 alt="<axis:alt f="axissin071" c="LIT_FFACREF" lit="9000956"/>" title="<axis:alt f="axissin071" c="LIT_FFACREF" lit="9000956"/>" src="images/calendar.gif"/></a>
                                    </td>
                               </axis:ocultar>
                              <axis:visible f="axissin073" c="PCCONPAG"> 
                                   <td class="campocaja" id="td_PCCONPAG">
                                       <select name="PCCONPAG" id="PCCONPAG" size="1" class="campowidthselect campo campotexto"  style="width:90%;" <axis:atr f="axissin073" c="PCCONPAG" a="modificable=true&obligatorio=true"/>
                                               title="<axis:alt f="axissin073" c="PCCONPAG" lit="9000715"/>">
                                           <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin073" c="LIT_SELEC" lit="1000348"/> - </option>
                                           <c:forEach var="l_cconpag" items="${__formdata.LSTCCONPAG}">
                                               <option value = "${l_cconpag.CATRIBU}" />
                                                   ${l_cconpag.TATRIBU} 
                                               </option>
                                           </c:forEach>
                                       </select>
                                   </td>
                               </axis:visible>  
                               
                            </tr>      
                        </table>
                        <table class="area" align="center">
                            <tr>
                                <th style="width:80%;height:0px"></th>
                              
                            </tr> 
                            <tr>
                                <axis:visible f="axissin073" c="TSOBSERVA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="TSOBSERVA" lit="101162" /></b>                                        
                                    </td>
                                </axis:visible>
                            </tr>  
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="TSOBSERVA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                          <textarea  rows="2" class="campo campotexto"  style="width:100%;"  name="TSOBSERVA" id="TSOBSERVA">${TSOBSERVA}</textarea>
                                     </td>
                               </axis:ocultar>
                               
                            </tr>  
                       </table>  
                       <table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                              
                            </tr> 
                            
                            <tr>
                                <axis:visible f="axissin073" c="ISINRET_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="ISINRET_AERO" lit="9000938" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="PIVA_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="PIVA_AERO" lit="101340" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="IIVA_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="IIVA_AERO" lit="9001321" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="IOTROSGAS_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="IOTROSGAS_AERO" lit="9910824" /></b>                                        
                                    </td>
                                </axis:visible>	
                                
                                <axis:visible f="axissin073" c="INETO_AERO"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="INETO_AERO" lit="1000527" /></b>                                        
                                    </td>
                                </axis:visible>	
                            </tr>  
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="ISINRET_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="ISINRET_AERO" id="ISINRET_AERO" value="${ISINRET_AERO}"  class="campowidthinput campo campotexto"   size="15" onChange ="javascript:f_formatear(this);"
                                        	<axis:atr f="axissin073" c="ISINRET_AERO" a="modificable=true&obligatorio=true"/> />
                                     </td>
                               </axis:ocultar>
                               
                               <axis:visible f="axissin073" c="PIVA_AERO"> 
                                   <td class="campocaja" id="td_PIVA_AERO">
                                       <select name="PIVA_AERO" id="PIVA_AERO" size="1" class="campowidthselect campo campotexto" onChange ="javascript:f_actualizarImporte(this);" style="width:90%;" <axis:atr f="axissin073" c="PIVA_AERO" a="modificable=true&obligatorio=true"/>
                                               title="<axis:alt f="axissin073" c="PIVA_AERO" lit="9001320"/>">
                                           <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin073" c="LIT_SELEC" lit="1000348"/> - </option>
                                           <c:forEach var="e_piva" items="${__formdata.lstPIVA}">
                                               <option value = "${e_piva.PORCENT}" />
                                                   ${e_piva.TINDICA} 
                                               </option>
                                           </c:forEach>
                                       </select>
                                   </td>
                               </axis:visible>
                               <axis:ocultar f="axissin073" c="IIVA_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="IIVA_AERO" id="IIVA_AERO" value="${IIVA_AERO}"  class="campowidthinput campo campotexto"   size="15" 
                                        	<axis:atr f="axissin073" c="IIVA_AERO" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="IOTROSGAS_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="IOTROSGAS_AERO" id="IOTROSGAS_AERO" value="${IOTROSGAS_AERO}"  class="campowidthinput campo campotexto"   size="15"  onChange ="javascript:f_actualizarImporte(this);"/>
                                     </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="INETO_AERO" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="INETO_AERO" id="INETO_AERO" value="${INETO_AERO}"  class="campowidthinput campo campotexto"   size="15" 
                                        	<axis:atr f="axissin073" c="INETO_AERO" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>
                            </tr> 
                            
                       </table>  
                       
                       						<table class="area" align="center">
                            <tr>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                              
                            </tr> 
                            
                            <tr>
                                <axis:visible f="axissin073" c="ISINRET_AGENCIA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="ISINRET_AGENCIA" lit="9910825" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="PIVA_AGENCIA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="PIVA_AGENCIA" lit="101340" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="IIVA_AGENCIA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="IIVA_AGENCIA" lit="9001321" /></b>                                        
                                    </td>
                                </axis:visible>
                                
                                <axis:visible f="axissin073" c="INETO_AGENCIA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="INETO_AGENCIA" lit="9910826" /></b>                                        
                                    </td>
                                </axis:visible>	
                                
                                <axis:visible f="axissin073" c="ITOTFACTURA"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin073" c="ITOTFACTURA" lit="9910827" /></b>                                        
                                    </td>
                                </axis:visible>	
                            </tr>  
                            <tr>
                           
                               <axis:ocultar f="axissin073" c="ISINRET_AGENCIA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="ISINRET_AGENCIA" id="ISINRET_AGENCIA" value="${ISINRET_AGENCIA}"  class="campowidthinput campo campotexto"   size="15" onChange ="javascript:f_formatear(this);"
                                        	<axis:atr f="axissin073" c="ISINRET_AGENCIA" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>

                               <axis:visible f="axissin073" c="PIVA_AGENCIA"> 
                                   <td class="campocaja" id="td_PIVA_AGENCIA">
                                       <select name="PIVA_AGENCIA" id="PIVA_AGENCIA" size="1" class="campowidthselect campo campotexto" onChange ="javascript:f_actualizarImporte(this);" style="width:90%;" <axis:atr f="axissin073" c="PIVA_AGENCIA" a="modificable=true&obligatorio=true"/>
                                               title="<axis:alt f="axissin073" c="PIVA_AGENCIA" lit="9001320"/>">
                                           <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin073" c="LIT_SELEC" lit="1000348"/> - </option>
                                           <c:forEach var="e_piva" items="${__formdata.lstPIVA}">
                                               <option value = "${e_piva.PORCENT}" />
                                                   ${e_piva.TINDICA} 
                                               </option>
                                           </c:forEach>
                                       </select>
                                   </td>
                               </axis:visible>
                               
                               <axis:ocultar f="axissin073" c="IIVA_AGENCIA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="IIVA_AGENCIA" id="IIVA_AGENCIA" value="${IIVA_AGENCIA}"  class="campowidthinput campo campotexto"   size="15" 
                                        	 <axis:atr f="axissin073" c="IIVA_AGENCIA" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="INETO_AGENCIA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="INETO_AGENCIA" id="INETO_AGENCIA" value="${INETO_AGENCIA}"  class="campowidthinput campo campotexto"   size="15" 
                                        	<axis:atr f="axissin073" c="INETO_AGENCIA" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>
                               
                               <axis:ocultar f="axissin073" c="ITOTFACTURA" dejarHueco="false"> 
                                     <td class="campocaja">    
                                        <input type="text" name="ITOTFACTURA" id="ITOTFACTURA" value="${ITOTFACTURA}"  class="campowidthinput campo campotexto"   size="15" 
                                        	<axis:atr f="axissin073" c="ITOTFACTURA" a="modificable=true&obligatorio=true"/>/>
                                     </td>
                               </axis:ocultar>
                            </tr> 
                            
                       </table>   

	         
                       <div class="separador">&nbsp;</div>   
                      </tr>
                  </table>      
                       
                    </td>
                </tr>
                <tr>                    
                </tr>  
            </table>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin073</c:param>
                <c:param name="f">axissin073</c:param>
                <c:param name="__botones">9002021<axis:visible f="axissin073" c="BT_9002045">,9002045</axis:visible></c:param>
            </c:import>
    </form>
<c:import url="../include/mensajes.jsp" />
<script type="text/javascript">
           Calendar.setup({
               inputField     :    "FFACREF",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FFACREF", 
               singleClick    :    true,
              firstDay       :    1
        });
     </script>
</body>
</html>

