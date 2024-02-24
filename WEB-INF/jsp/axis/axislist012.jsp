<%/* Revision:# 6kD7p1hijvZKusULfwUjsw== # */%>
<%/**
   *  Fichero: axislist012.jsp
   *  @author <a href = "mailto:jherrera@csi-ti.com">Javier Herrera</a>
   *  
   *    Comentarios
   *
   *
   *  Fecha: 20/04/2017
   */
   %>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <head>
      <title></title>
      <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css">
      </link>
      <link rel="StyleSheet" href="styles/axisnt.css" type="text/css">
      </link>
      <link rel="stylesheet" href="styles/displaytag.css">
      </link>
      <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
      <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
      <c:import url="../include/carga_framework_js.jsp"/>
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
      <script type="text/javascript">        
         function validarFormulario() {
         	  
          if($("#nitTomador").val() == ""){
           alert("Debe buscar un tomador");  
           return false;
          }else if($("#CAGENTE_TEXT").val() == ""){
           alert("Debe buscar la sucursal");  
           return false;
          }else if(validarValoresPolizas()!= 0){
           if(validarValoresPolizas()== 1){
         	  alert("Debe agregar valores a todas las polizas"); 
           }else{
         	  alert("Debe anexar polizas al acuerdo de pago"); 
           }
           return false;
          }else if($("#lugarGeneracion").val() == ""){
           alert("Debe ingresar el lugar de generación.");  
           $("#lugarGeneracion").css("border-color", "red");
           $( "#lugarGeneracion" ).focus();
           return false;
          }else if($("#FEXP").val() == ""){
           alert("Debe seleccionar la fecha de expedición");  
           $("#FEXP").css("border-color", "red");
           $( "#FEXP" ).focus();
           return false;
          }else if($("#nroCuotas").val() == ""){
           alert("Debe ingresar el numero de cuotas");  
           $("#nroCuotas").css("border-color", "red");
           $( "#nroCuotas" ).focus();
           return false;
          }else if(validarValoresPorcentajes()!= 0){
           if(validarValoresPorcentajes()== 1){
         	  alert("Debe agregar valores a todos los porcentajes"); 
           }else{
         	  alert("Debe anexar cuotas al acuerdo de pago"); 
           }
           return false;
          }else{
           var sumaPorcentaje = 0;
           var retorno = true;
           var fila = $("#datosCuotas tr").length;
                 	for(var i=1;i<fila;i++){
                 		//sumaPorcentaje = sumaPorcentaje + parseInt($("#porcentaje"+i).val());mamb
                 		sumaPorcentaje = sumaPorcentaje + ($("#porcentaje"+i).val())
                 		if($("#fecha"+i).val() == ""){
                 			$("#fecha"+i).css("border-color", "red");
                 			alert("Debe seleccionar las fechas de pago correctas."); 
                 			retorno = false ;
                 			break;
                 		}else{
                 			$("#fecha"+i).css("border", "1px dotted #DDDDDD");
                 			retorno = true;
                 		}
                 	}
                 	if(retorno && sumaPorcentaje < 100){
                 		alert("Los suma de los porcentajes es menor del 100%"); 
                 		retorno = false;
                 	}
           return retorno;
          }
         }
         
         function ValidNum() {
            if (event.keyCode < 48 || event.keyCode > 57) {
                event.returnValue = false;
            }
         }
         
         function validarValoresPolizas() {
          
          var retorno = 0;
          var suma = 0;
          var fila = $("#polizas tr").length;
             if(fila > 1){
           	  	for(var i=1;i<fila;i++){
           	  		if($("#valorpoliza"+i).val() == ""){
           	  			$("#valorpoliza"+i).css("border-color", "red");
           	  			retorno =  1;
                 		}else{
                 			//SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
                 			if(parseInt($("#valorpoliza"+i).val())>parseInt($("#saldo"+i).text())){
                 				alert("El valor ingresado es mayor a el saldo del recibo");
                 				$("#valorpoliza"+i).val("");
                 			}else{                  			//fin steven
                 			$("#valorpoliza"+i).css("border", "1px dotted #DDDDDD");
                 			valor = parseInt($("#valorpoliza"+i).val());
                 			suma = suma + valor;
                 		    }
                 		}
               	}
           	  	$("#valorNumero").val(suma);
             }
             else{
           	  retorno =  2; 
             }
             validarValoresPorcentajes();
            return retorno;
         } 
         
         function validarValoresPorcentajes(){
          var retorno;
          var sumaPorcentaje = 0;
             var fila = $("#datosCuotas tr").length;
             if(fila > 1){
             	for(var i=1;i<fila;i++){
             		var valor = 0;
             		if($("#porcentaje"+i).val() != ""){
            			console.log($("#porcentaje"+i).val());
             			//valor = parseInt($("#porcentaje"+i).val());//TASK-55 ACUERDO PAGO 27/03/2023
             			valor = parseFloat( $("#porcentaje"+i).val());
             			console.log(valor);
             			if(valor > 100){
             				alert("El valor ingresado es mayor al 100%");
             				$("#porcentaje"+i).val("");
             				$("#valor"+i).val("");
             				retorno = 5;
             				$("#porcentaje"+i).css("border-color", "red");
             			}else{
             				sumaPorcentaje = sumaPorcentaje + valor;
             				console.log(sumaPorcentaje);
             				if(sumaPorcentaje > 100){
             					alert("La suma de los porcentajes es mas del 100%");
             					$("#valor"+i).val("");
             					$("#porcentaje"+i).val("");
             					retorno = 5;
             					$("#porcentaje"+i).css("border-color", "red");
             				}else{
             					//SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
             					//var valorPorcentaje = Math.round((valor * $("#valorNumero").val())/100);//TAS55 MAMB 23/02/2023
             					var valorPorcentaje = ((parseFloat(valor) * parseFloat($("#valorNumero").val()))/100).toFixed(2);
             			
             					//var valorPorcentaje = (valor * $("#valorNumero").val())/100;
                     			$("#valor"+i).val(valorPorcentaje);
                     			$("#porcentaje"+i).css("border", "1px dotted #DDDDDD");
                     			retorno = 0;
             				}
             			}
             		}else{
             			$("#valor"+i).val("");
         	$("#porcentaje"+i).val("");
         	$("#porcentaje"+i).css("border-color", "red");
         	retorno =  1;
             		}
         }
             }else{
         retorno = 2;
         	  }
             return retorno;
         }
         
         function f_onload() {
         f_cargar_propiedades_pantalla(); 
         }
         
         function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist012", "cancelar", document.miForm, "_self");
         }
         
         
         
         
         // FUNCIONALIDAD DEL MODAL DE IMPRESION   
         
         function f_aceptar_axislist003() {    
          if(validarFormulario()) {
           var nitTomador = $("#nitTomador").val();
           var tomador = $("#tomador").val();
           var codSucursal = $("#CAGENTE_TEXT").val();
           var sucursal = $("#NOMBRE_TEXT").val();
           var direccion = $("#direccion").val();
           var telefono = $("#telefono").val();
           var telefono_movil = $("#telefono_movil").val();
           var nitRepresentante = $("#nitRepresentante").val();
           var representante = $("#representante").val();
           var valorNumero = $("#valorNumero").val();
           var lugarGeneracion = $("#lugarGeneracion").val();
           var fexpedicion = $("#FEXP").val();
           var nroCuotas = $("#nroCuotas").val();
         
           var parametros ="operation=crear_acuerdo&nitTomador="+nitTomador+"&tomador="+tomador+"&codSucursal="+codSucursal+"&sucursal="+sucursal+"&direccion="+direccion+"&telefono="+telefono+"&telefono_movil="+telefono_movil+"&nitRepresentante="+nitRepresentante+"&representante="+representante+"&valorNumero="+valorNumero+"&lugarGeneracion="+lugarGeneracion+"&fexpedicion="+fexpedicion+"&nroCuotas="+nroCuotas;
           objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxCrearAcuerdo, parametros, this, objJsMessages.jslit_actualizando_registro);
          }
         }
         
         function callbackAjaxCrearAcuerdo(ajaxResponseText){
             var doc=objAjax.domParse(ajaxResponseText);
             if(!objAppMensajes.existenErroresEnAplicacion(doc)){
             var ID_ACUERDO_PAGO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PIDACUERDO"), 0, 0);
	          //SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO   
        	 alert("El número de acuerdo de pago generado es: "+ID_ACUERDO_PAGO);             
             var fila = $("#polizas tr").length;
             if(fila > 1){
             	for(var i=1;i<fila;i++){
                   //SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
             	   var NPOLIZA = $("#npoliza"+i).text();
                   var NRECIBO = $("#nrecibo"+i).text();
                   var SALDO = $("#saldo"+i).text();//cambie el val por text
                   var VALOR_POLIZA = $("#valorpoliza"+i).val();
                   var parametros_polizas ="TIPO=1&operation=crear_acuerdo_detalles&ID_ACUERDO_PAGO="+ID_ACUERDO_PAGO+"&NPOLIZA="+NPOLIZA+"&NRECIBO="+NRECIBO+"&SALDO="+SALDO+"&VALOR_POLIZA="+VALOR_POLIZA;
                   objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxCrearAcuerdoDetalles, parametros_polizas, this, objJsMessages.jslit_actualizando_registro);
                 }
             }
         
             fila = $("#datosCuotas tr").length;
             if(fila > 1){
             	for(var i=1;i<fila;i++){
             		//var NRO_CUOTA = i;
             		
             		var NRO_CUOTA = $("#nroCuota"+i).text();
                   var PORCENTAJE = $("#porcentaje"+i).val();
                   var VALOR_CUOTA = $("#valor"+i).val();
                 
                   var FECHA_PAGO = $("#fecha"+i).val();
                   var parametros_cuotas ="TIPO=2&operation=crear_acuerdo_detalles&ID_ACUERDO_PAGO="+ID_ACUERDO_PAGO+"&NRO_CUOTA="+NRO_CUOTA+"&PORCENTAJE="+PORCENTAJE+"&VALOR_CUOTA="+VALOR_CUOTA+"&FECHA_PAGO="+FECHA_PAGO;
                   objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxCrearAcuerdoDetalles, parametros_cuotas, this, objJsMessages.jslit_actualizando_registro);
                 }
             }
             objUtiles.abrirModal("axislist003", "src", "axis_axislist003.do?operation=form&CMODO=GENERAL&CEMPRES=24&SPRODUC=0&ID_ACUERDO_PAGO="+ID_ACUERDO_PAGO+"&REPORTE=AcpagprimApp");
         
             }  
                      
         }
         
         function f_cerrar_axislist003() {
             objUtiles.cerrarModal("axislist003");
             f_but_salir();
         }  
         
         
         function callbackAjaxCrearAcuerdoDetalles(ajaxResponseText){
          
         }
         
         //FIN FUNCIONALIDAD DEL MODAL DE IMPRESION   
         
         
         // FUNCIONALIDAD DEL MODAL DE POLIZAS      
         
         function f_abrir_axisctr019 () {
             objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
         }
         
         function f_cerrar_axisctr019() {                 
             objUtiles.cerrarModal("axisctr019");                          
         }
         
         function f_aceptar_axisctr019 (SSEGURO) {
             objUtiles.cerrarModal("axisctr019");
             document.miForm.SSEGURO.value=SSEGURO;    
             objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxAgregarPoliza, "operation=agregar_poliza&SSEGURO=" + SSEGURO, this, objJsMessages.jslit_actualizando_registro);
         }
         //SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
         function callbackAjaxAgregarPoliza(ajaxResponseText){
             var doc=objAjax.domParse(ajaxResponseText);
             if(!objAppMensajes.existenErroresEnAplicacion(doc)){
             var VCANTIDAD = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CANTIDAD"), 0, 0)-1;
                 for (i = 0 ; i <= VCANTIDAD;i++){
                     var NROPOLIZA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0);
                     var NRECIBO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), i, 0);
                     var SALDO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SALDO_RECIBO"), i, 0);
                     var PRODUCTO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRODUCTO"), i, 0);
	             agregar_poliza(NROPOLIZA,NRECIBO,SALDO,PRODUCTO);
                 }
             }
            else{
            	var MENSAJEERROR = "Poliza no tiene recibos para abonar";
                 alert (MENSAJEERROR);
            	}
            }
            	
         
         
         
         // FIN FUNICONALIDAD DEL MODAL DE POLIZAS     
         
         
         // FUNICONALIDAD DEL MODAL DE PERSONAS
         
         function f_abrir_axisper008() {
             objUtiles.abrirModal("axisper008","src","modal_axisper008.do?operation=form&CMODO=CONSULTA&faceptar=f_aceptar_mtn_axisper008");
         }
         
         function f_cerrar_axisper008(){
             objUtiles.cerrarModal("axisper008");   
         }    
         
         function f_aceptar_mtn_axisper008 (selectedPerson,selectedAgente){
                 f_cerrar_axisper008();
                 document.miForm.SPERSON.value = selectedPerson;
                 objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxCambiarPersona, "operation=ver_persona&SPERSON=" + selectedPerson+"&AGENTE="+selectedAgente, this, objJsMessages.jslit_actualizando_registro);
             }
         
         function callbackAjaxCambiarPersona(ajaxResponseText){
              var doc=objAjax.domParse(ajaxResponseText);
              if(!objAppMensajes.existenErroresEnAplicacion(doc)){
              var NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
              var TOMADOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
              var DIRECCION = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDOMICI"), 0, 0);
              var TELEFONO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TELEFONO"), 0, 0);
              var TELEFONO_MOVIL = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TELEFONO_MOVIL"), 0, 0);
              var NIT_REPRESENTANTE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NIT_REPRESENTANTE"), 0, 0);
              var REPRESENTANTE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("REPRESENTANTE"), 0, 0);
              
              // INI 23/02/2021 JRVG IAXIS-15066
              // if(NIT_REPRESENTANTE.length == 0 || /^\s+$/.test(NIT_REPRESENTANTE)){
              // REPRESENTANTE = TOMADOR;
              // NIT_REPRESENTANTE = NNUMIDE; }
              // FIN 23/02/2021 JRVG IAXIS-15066
              
              objDom.setValorPorId("nitTomador", NNUMIDE);
              objDom.setValorPorId("tomador", TOMADOR);
              objDom.setValorPorId("direccion", DIRECCION);
              objDom.setValorPorId("telefono", TELEFONO);
              objDom.setValorPorId("telefono_movil", TELEFONO_MOVIL);
              objDom.setValorPorId("nitRepresentante", NIT_REPRESENTANTE);
              objDom.setValorPorId("representante", REPRESENTANTE);
              }       
         }	
         
         
         // FIN FUNCIONALIDAD DEL MODAL DE PERSONAS
         
         
         //FUNCIONALIDAD DEL MODAL DE AGENTES
         function f_abrir_axisctr014() {
             objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION");
         }
         
         function f_cerrar_axisctr014() {
             objUtiles.cerrarModal("axisctr014")
         } 
         
         function f_aceptar_axisctr014 (CAGENTE){
             objDom.setValorPorId("CAGENTE", CAGENTE);
             f_cerrar_axisctr014();
             objAjax.invokeAsyncCGI("axis_axislist012.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
         }
         
         function callbackAjaxCambiarAgente(ajaxResponseText){
             var doc=objAjax.domParse(ajaxResponseText);
             if(!objAppMensajes.existenErroresEnAplicacion(doc)){
             var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
             var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
             objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
             objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
             }          
         }
         
         //FIN FUNCIONALIDAD DEL MODAL DE AGENTES
         
         //SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
         function agregar_poliza(npoliza,nrecibo,saldo,desproducto) {
               var table = document.getElementById("polizas");
               var fila = $("#polizas tr").length;
               var existe = false;
               var row = table.insertRow(fila);
               row.style.backgroundColor="#eeeeee";
               row.id = "fila"+fila;
               row.style.textAlign ="center";
         
               // Insert new cells (<td> elements) 
               var cell1 = row.insertCell(0);
               var cell2 = row.insertCell(1);
               var cell3 = row.insertCell(2);
               var cell4 = row.insertCell(3);
               var cell5 = row.insertCell(4);
               var cell6 = row.insertCell(5);
         
               var funcionEliminar = 'eliminar_poliza('+fila+');';
               
               var eliminar = document.createElement('img');
               eliminar.setAttribute('src', "images/delete.gif");
               eliminar.setAttribute('alt', "Eliminar poliza");
               eliminar.setAttribute('title', "Eliminar poliza");
               eliminar.setAttribute('onclick',funcionEliminar);           
         
               var aux = "npoliza"+fila;
               var labelPoliza = document.createElement('label');
               labelPoliza.setAttribute('id',aux);
               labelPoliza.innerHTML = npoliza;
               
               aux = "nrecibo"+fila;
               var labelCertif = document.createElement('label');
               labelCertif.setAttribute('id',aux);
               labelCertif.innerHTML = nrecibo;
               
               //Inicio Bug IAXIS-12966 JRVG - 02/03/2020
               aux = "desproducto"+fila; //desproducto
               var labeldescrip = document.createElement('label');
               labeldescrip.setAttribute('id',aux);
               labeldescrip.innerHTML = desproducto;
               //Fin Bug IAXIS-12966 JRVG - 02/03/2020
               
               aux = "saldo"+fila;
               var labelSaldo = document.createElement('label');
               labelSaldo.setAttribute('id',aux);
               labelSaldo.innerHTML = saldo;               
         
               cell1.style.padding = "2px 5px 2px 5px";
               cell2.style.padding = "2px 5px 2px 5px";
               cell3.style.padding = "2px 5px 2px 5px";
               cell4.style.padding = "2px 5px 2px 5px";
               cell5.style.padding = "2px 5px 2px 5px";
               
               var valorpoliza = document.createElement('input');
               valorpoliza.type = "text";
               valorpoliza.name = "valorpoliza"+fila;
               valorpoliza.value = "";
               valorpoliza.id = "valorpoliza"+fila; 
               valorpoliza.setAttribute('onkeypress','return ValidNum(event);');
               valorpoliza.setAttribute('onkeyup','return validarValoresPolizas();');
               valorpoliza.style.border = "1px dotted #DDDDDD";
               
               
               cell1.appendChild(labelPoliza);
               cell2.appendChild(labelCertif);
               //Inicio Bug IAXIS-12966 JRVG - 02/03/2020
               cell3.appendChild(labeldescrip);
               //Fin Bug IAXIS-12966 JRVG - 02/03/2020
               cell4.appendChild(labelSaldo);
               cell6.appendChild(eliminar);
               cell5.appendChild(valorpoliza); 
           }
         
           //Inicio Bug IAXIS-12966 JRVG - 02/03/2020
           //La Funcion Insert_poliza se encarga de reescribir el listado en la tabla #polizas, con el objetivo de reescribir el numero Id
            function insert_poliza(npoliza,nrecibo,saldo,desproducto,valor) {
    			 var table = document.getElementById("polizas");
                 var fila = $("#polizas tr").length;
                 var existe = false;
                 var row = table.insertRow(fila);
                 row.style.backgroundColor="#eeeeee";
                 row.id = "fila"+fila;
                 row.style.textAlign ="center";
       
	             // Insert new cells (<td> elements) 
	             var cell1 = row.insertCell(0);
	             var cell2 = row.insertCell(1);
	             var cell3 = row.insertCell(2);
	             var cell4 = row.insertCell(3);
	             var cell5 = row.insertCell(4);
	             var cell6 = row.insertCell(5);
	             
				 var funcionEliminar = 'eliminar_poliza('+fila+');';
	             var eliminar = document.createElement('img');
	             eliminar.setAttribute('src', "images/delete.gif");
	             eliminar.setAttribute('alt', "Eliminar poliza");
	             eliminar.setAttribute('title', "Eliminar poliza");
	             eliminar.setAttribute('onclick',funcionEliminar);           
	       
	             var aux = "npoliza"+fila;
	             var labelPoliza = document.createElement('label');
	             labelPoliza.setAttribute('id',aux);
	             labelPoliza.innerHTML = npoliza;
	             
	             aux = "nrecibo"+fila;
	             var labelCertif = document.createElement('label');
	             labelCertif.setAttribute('id',aux);
	             labelCertif.innerHTML = nrecibo;
	             
	             aux = "desproducto"+fila; //desproducto
	             var labeldescrip = document.createElement('label');
	             labeldescrip.setAttribute('id',aux);
	             labeldescrip.innerHTML = desproducto; 
	           
	             aux = "saldo"+fila;
	             var labelSaldo = document.createElement('label');
	             labelSaldo.setAttribute('id',aux);
	             labelSaldo.innerHTML = saldo; 
	
	             cell1.style.padding = "2px 5px 2px 5px";
	             cell2.style.padding = "2px 5px 2px 5px";
	             cell3.style.padding = "2px 5px 2px 5px";
	             cell4.style.padding = "2px 5px 2px 5px";
	             cell5.style.padding = "2px 5px 2px 5px";
	             
	             var valorpoliza = document.createElement('input');
	             valorpoliza.type = "text";
	             valorpoliza.name = "valorpoliza"+fila;
	             valorpoliza.value = valor;
	             valorpoliza.id = "valorpoliza"+fila; 
	             valorpoliza.setAttribute('onkeypress','return ValidNum(event);');
	             valorpoliza.setAttribute('onkeyup','return validarValoresPolizas();');
	             valorpoliza.style.border = "1px dotted #DDDDDD";
	             
	             cell1.appendChild(labelPoliza);
	             cell2.appendChild(labelCertif);
	             cell3.appendChild(labeldescrip);
	             cell4.appendChild(labelSaldo);
	             cell6.appendChild(eliminar);
	             cell5.appendChild(valorpoliza);
             
         }  //Fin Bug IAXIS-12966 JRVG - 02/03/2020

		 function eliminar_poliza(fila) {
        	var confirmar = confirm("¿Desea eliminar el registro?");

        	if(confirmar){
        		//Inicio Bug IAXIS-12966 JRVG - 02/03/2020
        		//console.log('Primero : Guardamos datos de tabla #poliza en Array');
			        var fila2 = document.getElementById('polizas').rows.length;
			        if(fila2 > 1){
		             	for(var i=1;i<2;i++){
		             		var parametros=[];
		                    var parame=[];
		                    $("#polizas tbody tr").each(function(i,e){
		                        var tr = [];
		                        $(this).find("td").each(function(index, element){
		                        	if(index != 4) {
		                        		 var td = {};
			                             td["Celda"+index] = $(this).find("label").text();
			                             tr.push(td);
		                        	 }else{
		                        		 var td = {};
			                             td["Celda"+index] = $(this).find("input").val();
			                             tr.push(td);  
		                        	 }});
		                        parametros.push(tr); 
		                    });
		                    //console.log(parametros);
		                    //console.log('Luego : Eliminamos filas en la tabla #polizas ');
				                for(var i=1;i<fila2;i++){
				            	   //console.log('Delete Fila :' + i);
				            	   $("#fila"+i).remove();
								   $("#valorNumero").val("");
				            	}
				              //console.log('Finalmente : Insertamos datos en la tabla con el nuevo Id');
				              //console.log('fila2 : '+fila2);
				           
				              for(var i=1;i<fila2;i++){
				            	  if (i!=fila){
					        		    insert_poliza(parametros[i][0].Celda0,
				            	                     parametros[i][1].Celda1,
				            	                     parametros[i][3].Celda3,
				            	                     parametros[i][2].Celda2,
				            	                     parametros[i][4].Celda4);
					        	    }
					        }
					  }
				} 
			}}
		   //Fin Bug IAXIS-12966 JRVG - 02/03/2020
		   
           function f_but_generar() {
           	
           if(validarValoresPolizas() == 0){
           	var nroCuotas = $("#nroCuotas").val();
           	if(nroCuotas < 1){
           		alert("Debe Ingresar el numero de cuotas");
           	}else{
               var table = document.getElementById("datosCuotas");
               for(var i = $("#datosCuotas tr").length;i>0;i--){
               	 $("#filaCuota"+i).remove();
               }
               
               for(var i = 0;i<nroCuotas;i++){
               var fila = $("#datosCuotas tr").length;
               var row = table.insertRow(fila);
               row.style.backgroundColor="#eeeeee";
               row.id = "filaCuota"+fila;
               row.style.textAlign ="center";
             
               var aux = "nroCuota"+fila;
               var nroCuota = document.createElement('label');
               nroCuota.setAttribute('id',aux);
               nroCuota.innerHTML = fila;
         
               var cell1 = row.insertCell(0); 
               cell1.style.margin = "70px";
               var cell2 = row.insertCell(1);
               cell2.style.width = "60px";
               var cell3 = row.insertCell(2);
               var cell4 = row.insertCell(3);
               cell3.style.width = "50px";
         
               var porcentaje = document.createElement('input');
               porcentaje.type = "text";
               porcentaje.name = "porcentaje"+fila;
               porcentaje.value = "";
               porcentaje.id = "porcentaje"+fila; 
              // porcentaje.setAttribute('onkeypress','return ValidNum(event);');TASK55 MAMB 23/02/2023
               porcentaje.setAttribute('onkeyup','return validarValoresPorcentajes();');
               porcentaje.style.border = "1px dotted #DDDDDD";
               
               var valor = document.createElement('input');
               valor.type = "text";
               valor.name = "valor"+fila;
               valor.value = "";
               valor.id = "valor"+fila;
               //valor.setAttribute('onkeypress','return ValidNum(event);');TASK55 MAMB 23/02/2023
               valor.setAttribute('disabled',true);
               
               var fecha = document.createElement('input');
               fecha.type = "date";
               fecha.name = "fecha"+fila;
               fecha.value = "";
               fecha.id = "fecha"+fila; 
               fecha.min = "2017-01-01";
         
               cell1.style.padding = "2px 5px 2px 5px";
               cell2.style.padding = "2px 5px 2px 5px";
               cell3.style.padding = "2px 5px 2px 5px";
               cell4.style.padding = "2px 5px 2px 5px";
               
               cell1.appendChild(nroCuota);
               cell2.appendChild(porcentaje);
               cell3.appendChild(valor);
               cell4.appendChild(fecha);
           	}
           	}
           }else{
           	alert("Debe agregar valores a las polizas");
           }
           	
           } 
           
           
           
      </script>
   </head>
   <body onload="f_onload()">
      <c:import url="../include/precargador_ajax.jsp">
         <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
      </c:import>
      <form name="miForm" action="" method="POST">
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
               <axis:alt f="axislist012" c="MODPER008_TIT" lit="1000235"/>
            </c:param>
            <c:param name="nid" value="axisper008"/>
         </c:import>
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
               axisctr019|
               <axis:alt f="axislist012" c="MOD_PANT_AXICTR019" lit="1000188"/>
            </c:param>
         </c:import>
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
               <axis:alt f="axislist012" c="TIT_AXISCTR014" lit="1000234" />
            </c:param>
            <c:param name="nid" value="axisctr014" />
         </c:import>
         <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo">
               <axis:alt f="axislist012" c="TIT_AXISLIST003" lit="9000745" />
            </c:param>
            <c:param name="nid" value="axislist003" />
         </c:import>
         <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
               <b>
                  <axis:alt f="axislist012" c="TITULO_FORM" lit="9910764"/>
               </b>
            </c:param>
            <c:param name="formulario">
               <b>
                  <axis:alt f="axislist012" c="TITULO_FORM" lit="9910764"/>
               </b>
            </c:param>
            <c:param name="form">axislist012</c:param>
         </c:import>
         <input type="hidden" name="operation" value=""/>
         <input type="hidden" name="SPERSON" value="${sessionScope.axisctr_persona.CODI}"/>
         <input type="hidden" name="SSEGURO" value="${sessionScope.axisctr_polizas.SSEGURO}"/>
         <input type="hidden" name="CAGENTE" id="CAGENTE" value="${sessionScope.axisctr_agente.CODI}"/>
        <%-- <input type="hidden" name="LRECIBOS" id="LRECIBOS" value="${sessionScope.axisctr_listaRecibos}"/>--%>
         <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr>
               <td>
                  <table class="seccion" align="center">
                     <tr>
                        <td></td>
                     </tr>
                     <tr>
                        <td>
                           <table class="area" align="center">
                              <tr>
                                 <th style="width:10%;height:0px"></th>
                                 <th style="width:10%;height:0px"></th>
                                 <th style="width:10%;height:0px"></th>
                                 <th style="width:10%;height:0px"></th>
                                 <th style="width:20%;height:0px"></th>
                                 <th style="width:20%;height:0px"></th>
                                 <th style="width:20%;height:0px"></th>
                              </tr>
                              <tr style="height:0px">
                                 <td class="titulocaja" id="tit_nitTomador">
                                    <%-- NIT TOMADOR--%>
                                    <b>
                                       <axis:alt f="axislist012" c="nitTomador" lit="9903359"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_CAGENTE" >
                                    <%--CODIGO DE SUCURSAL--%>
                                    <b>
                                       <axis:alt f="axislist012" c="CAGENTE" lit="9906506"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_TAGENTE" colspan="3">
                                    <%-- NOMBRE DE LA SUCURSAL--%>
                                    <b>
                                       <axis:alt f="axislist012" c="TAGENTE" lit="9910768"/>
                                    </b>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="campocaja" id="td_nitTomador">
                                    <input type="text" name="nitTomador" 
											title="<axis:alt f="axislist012" c="nitTomador" lit="100584" />" id="nitTomador" class="campowidthinput campo campotexto" style="width:70%"
											<axis:atr f="axislist012" c="nitTomador" a="modificable=false&obligatorio=true"/>
									</input>
                                    <img id="IMG_NIT_TOMADOR_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisper008()" style="cursor:pointer"/>
                                 </td>
                                 <td class="campocaja">
                                    <input type="text" name="CAGENTE_TEXT" title="<axis:alt f="axislist012" c="CAGENTE" lit="100584"/>" id="CAGENTE_TEXT" 
										class="campowidthinput campo campotexto" style="width:70%" formato="entero"
										<axis:atr f="axislist012" c="CAGENTE_TEXT" a="modificable=false&obligatorio=true"/>
										onchange="f_actualizar_agente()" 
									</input>
                                    <img id="IMG_CAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                 </td>
                                 <td class="campocaja" colspan="3">    
                                    <input readonly type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="titulocaja" id="tit_tomador" colspan="3">
                                    <%-- NOMBRE DEL TOMADOR--%>
                                    <b>
                                       <axis:alt f="axislist012" c="tomador" lit="9902210"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_direccion" colspan="2">
                                    <%-- DIRECCION DEL TOMADOR--%>
                                    <b>
                                       <axis:alt f="axislist012" c="direccion" lit="9910770"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_telefono">
                                    <%-- TELEFONO DEL TOMADOR--%>
                                    <b>
                                       <axis:alt f="axislist012" c="telefono" lit="9000992"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_telefono_movil">
                                    <%-- TELEFONO DEL TOMADOR--%>
                                    <b>
                                       <axis:alt f="axislist012" c="telefono_movil" lit="9903007"/>
                                    </b>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="campocaja" id="td_tomador" colspan="3">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="tomador" value="${sessionScope.axisctr_persona.TOMADOR}"  id="tomador" style="width:100%;"/>
                                 </td>
                                 <td class="campocaja" id="td_direccion" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="direccion" id="direccion" style="width:100%;"/>
                                 </td>
                                 <td class="campocaja" id="td_telefono">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="telefono" id="telefono" style="width:100%;"/>
                                 </td>
                                 <td class="campocaja" id="td_telefono_movil">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="telefono_movil" id="telefono_movil" style="width:100%;"/>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="titulocaja" id="tit_nitRepresentante">
                                    <%-- NIT REPRESENTANTE--%>
                                    <b>
                                       <axis:alt f="axislist012" c="nitRepresentante" lit="9910772"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_representante" colspan="4">
                                    <%-- NOMBRE DEL REPRESENTANTE--%>
                                    <b>
                                       <axis:alt f="axislist012" c="representante" lit="9910771"/>
                                    </b>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="campocaja" id="td_nitRepresentante" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="nitRepresentante" id="nitRepresentante" style="width:100%;"/>
                                 </td>
                                 <td class="campocaja" id="td_representante" colspan="4">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="representante" id="representante" style="width:100%;"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="7">
                                    <br/>
                                    <div style="float:left;">                            
                                       <b>Listado de polizas</b>
                                    </div>
                                    <div style="float:right;">                            
                                       <img border="0" alt="Añadir poliza" title="Añadir poliza" src="images/new.gif" onclick="f_abrir_axisctr019()"/>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                              <%-- SGM 4134 Modificar visualizacion de polizas(recibos)--%>
                                 <td colspan="7">
                                    <table id="polizas" border="0" cellspacing="0" cellpadding="3">
                                       <tr style="background: #dedede;">
                                          <th> Nro. Poliza</th>
                                          <th> Nro. Recibo</th>
                                          <th> Producto</th>
                                          <th> Saldo recibo</th>
                                          <th> Valor acuerdo</th>
                                          <th> </th>
                                       </tr>
                                    </table>
                                    <br/>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="titulocaja" id="tit_valorNumero" colspan="2">
                                    <%-- VALOR NUMERICO--%>
                                    <br/>
                                    <b>
                                       <axis:alt f="axislist012" c="valorNumero" lit="9910774"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_lugarGeneracion" colspan="2">
                                    <%-- LUGAR DE GENERACION --%>
                                    <br/>
                                    <b>
                                       <axis:alt f="axislist012" c="lugarGeneracion" lit="9909609"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_fechaGeneracion">
                                    <%-- FECHA DE GENERACION --%>
                                    <br/>
                                    <b>
                                       <axis:alt f="axislist012" c="fechaGeneracion" lit="9903739"/>
                                    </b>
                                 </td>
                                 <td class="titulocaja" id="tit_nroCuotas">
                                    <%-- NUMERO DE CUOTAS --%>
                                    <br/>
                                    <b>
                                       <axis:alt f="axislist012" c="nroCuotas" lit="9906182"/>
                                    </b>
                                 </td>
                              </tr>
                              <tr style="height:0px">
                                 <td class="campocaja" id="td_valorNumero" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="valorNumero" id="valorNumero" style="width:70%;" disabled="disabled"/>
                                 </td>
                                 <td class="campocaja" id="td_lugarGeneracion" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="lugarGeneracion" id="lugarGeneracion" style="width:80%;"/>
                                 </td>
                                 <td class="campocaja" id="td_FEXP">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEXP}"/>" 
										name="FEXP" id="FEXP"  style="width:40%;" title= "<axis:alt f="axislist012" c="FEXP" lit="1000064"/>"
										<axis:atr f="axislist012" c="FEXP" a="modificable=true&obligatorio=true&formato=fecha"/>
									</input>
                                    <a style="vertical-align:middle;"><img id="popup_calendario_FEXP" alt="<axis:alt f="axislist012" c="FNACIMI4" lit="108341"/>"  src="images/calendar.gif"/></a>
                                 </td>
				 <%-- SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO --%>
                                 <td class="campocaja" id="td_nroCuotas" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" name="nroCuotas" id="nroCuotas" style="width:30%;" onkeypress="return ValidNum(event);" maxlength ="2"/>
                                    <img border="0" alt="Generar información de pago" title="Generar información de pago" src="images/lapiz.gif" onclick="f_but_generar()"/>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="7">
                                    <br/>
                                    <div style="float:left;">                            
                                       <b>Valores de las cuotas a pagar</b>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td colspan="7">
                                    <table id="datosCuotas" border="0" cellspacing="0" cellpadding="3">
                                       <%-- <caption><h3>Valores de las cuotas a pagar</h3></caption> --%>
                                       <tr style="background: #dedede;">
                                          <th style="width:15%;"> Nro. Cuota</th>
                                          <th style="width:17%;"> Porcentaje</th>
                                          <th> Valor</th>
                                          <th style="width:17%;"> Fecha</th>
                                       </tr>
                                    </table>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="campocaja" style="text-align:left">
                                    <br/>
                                    <br/>
                                    <br/>
                                    <input type="button" class="boton" name="but_salir" value="<axis:alt f="axislist012" c="BUT_SALIR" lit="100000" />" onclick="f_but_salir()" />
                                 </td>
                                 <td class="campocaja" style="text-align:right" colspan="6">
                                    <br/>
                                    <br/>
                                    <br/>
                                    <input type="button" class="boton" name="but_imprimir" id="but_imprimir" value="<axis:alt f="axislist012" c="BUT_IMPRIMIR" lit="100001" />"  onclick="f_aceptar_axislist003()" />
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </form>
      <script type="text/javascript">
         Calendar.setup({
             inputField     :    "FEXP",     
             ifFormat       :    "%d/%m/%Y",      
             button         :    "popup_calendario_FEXP", 
             singleClick    :    true,
             firstDay       :    1
         });
         
         
      </script>
      <c:import url="../include/mensajes.jsp"/>
   </body>
</html>