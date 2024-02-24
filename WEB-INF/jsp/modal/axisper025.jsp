<%/* Revision:# 7hTDNywhYQprYpHoqxUflQ== # */%>
<%-- 
*  Fichero: axisper025.jsp
*
*  Fecha: 26/07/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="axis.util.Constantes" %>
<%@ page import="java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function soloLetrasNumeros(e){
	       key = e.keyCode || e.which;
	       tecla = String.fromCharCode(key).toLowerCase();
	       letras = " abcdefghijklmnopqrstuvwxyz1234567890";
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
        
        var nav4 = window.Event ? true : false;
		function ValidNum(evt) {
		    // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
		    	var key = nav4 ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57));
		}
		
		var nav = window.Event ? true : false;
		function ValidNumComa(evt) {
		    	var key = nav ? evt.which : evt.keyCode;
			    return (key <= 13 || (key >= 48 && key <= 57)|| key==44);
		}
        
        function f_onload() {    
           
            var SPERRELOUT = "${__formdata.SPERRELOUT}"; 
            if (!objUtiles.estaVacio(SPERRELOUT))
            {
                parent.f_aceptar_axisper025("${__formdata.SPERSON}");
            }
if(document.getElementsByName("CTIPPER")[0].value == 0){
       document.getElementById("CAGRUPA").style.visibility='visible';
       document.getElementById("labelCAGRUPA").style.visibility='visible';
       document.getElementById("labelFAGRUPA").style.visibility='visible';
       document.getElementById("FAGRUPA").style.visibility='visible';
       document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
       document.getElementById("CAGRUPA").setAttribute("obligatorio", true);
       //INI IAXIS-3670 16/04/2019 AP
       document.getElementById("label_ISLIDER").style.visibility="visible";
       document.getElementById("ISLIDER").style.visibility="visible";
       document.getElementById("label_PPARTICIPACION").style.visibility="visible";
       document.getElementById("PPARTICIPACION").style.visibility="visible";
       document.getElementById("PPARTICIPACION").setAttribute("obligatorio", true);
       document.getElementById("LIT_TLIMIT").style.visibility='hidden';
       document.getElementById("TLIMIT").style.visibility="hidden";
       //FIN IAXIS-3670 16/04/2019 AP
       }
         
            f_cargar_propiedades_pantalla();   
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
            
                var SPERSON_REL = objDom.getValorPorId("SPERSON_REL");
                var FAGRUPA = "'${__formdata.FECHA_AGRUPAC}'";
                if(FAGRUPA == "''"){
                FAGRUPA = '${FECHA_AGRUPAC}';
                }
                objUtiles.ejecutarFormulario("modal_axisper025.do?SPER_AUX="+SPERSON_REL+"&FAGRUPA_SESSION="+FAGRUPA, "grabarPersona", document.miForm, "_self", objJsMessages.jslit_cargando); 
               
            }
          
        }
       
	function f_but_cancelar() {
            parent.f_cerrar_axisper025();
        }      
        
	// Inicio IAXIS-4832(8) 09/09/2019
	// Se agrega la función limpiar_campos a fin de hacer un borrado general para enviar la información correcta
	// dependiendo el tipo de persona y mantener la consistencia de los datos de la persona según su tipo. Por 
	// otro lado, se indenta la función para mejorar su entendimiento.    
	function f_change_ctipper() {
		
		f_limpiar_campos();  
       	
       	if(document.getElementsByName("CTIPPER")[0].value == 0){
       		document.getElementById("CAGRUPA").style.visibility='visible';
	        document.getElementById("labelCAGRUPA").style.visibility='visible';
	        document.getElementById("labelFAGRUPA").style.visibility='visible';
	        document.getElementById("FAGRUPA").style.visibility='visible';
	        document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
	        document.getElementById("CAGRUPA").setAttribute("obligatorio", true);
	        //INI IAXIS-3670 16/04/2019 AP
	        document.getElementById("label_ISLIDER").style.visibility="visible";
	        document.getElementById("ISLIDER").style.visibility="visible";
	        document.getElementById("label_PPARTICIPACION").style.visibility="visible";
	        document.getElementById("PPARTICIPACION").style.visibility="visible";
	        document.getElementById("PPARTICIPACION").setAttribute("obligatorio", true);
	        document.getElementById("LIT_TLIMIT").style.visibility='hidden';
	        document.getElementById("TLIMIT").style.visibility="hidden";
	    } else if (document.getElementsByName("CTIPPER")[0].value == 5){
	    	document.getElementById("CAGRUPA").style.visibility='hidden';
	        document.getElementById("labelCAGRUPA").style.visibility='hidden';
	        document.getElementById("labelFAGRUPA").style.visibility='hidden';
	        document.getElementById("FAGRUPA").style.visibility='hidden';
	        document.getElementById("CAGRUPA").value = -2147483648; 
	        document.getElementById("FAGRUPA").value = ''; 
	        document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
	        document.getElementById("CAGRUPA").setAttribute("obligatorio", false);
	        //
            document.getElementById("label_ISLIDER").style.visibility="visible";
            document.getElementById("ISLIDER").style.visibility="visible";
            document.getElementById("label_PPARTICIPACION").style.visibility="visible";
            document.getElementById("PPARTICIPACION").style.visibility="visible";
            document.getElementById("PPARTICIPACION").setAttribute("obligatorio", true);
            document.getElementById("LIT_TLIMIT").style.visibility='visible';
            document.getElementById("TLIMIT").style.visibility="visible";   
        } else if ((document.getElementsByName("CTIPPER")[0].value == 1) || (document.getElementsByName("CTIPPER")[0].value == 2) || (document.getElementsByName("CTIPPER")[0].value == 6) || (document.getElementsByName("CTIPPER")[0].value == 11) || (document.getElementsByName("CTIPPER")[0].value == 12)){
        	document.getElementById("CAGRUPA").style.visibility='hidden';
            document.getElementById("labelCAGRUPA").style.visibility='hidden';
            document.getElementById("labelFAGRUPA").style.visibility='hidden';
            document.getElementById("FAGRUPA").style.visibility='hidden';
            document.getElementById("CAGRUPA").value = -2147483648; 
            document.getElementById("FAGRUPA").value = ''; 
            document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
            document.getElementById("CAGRUPA").setAttribute("obligatorio", false);
            //
	        document.getElementById("label_ISLIDER").style.visibility="hidden";
	        document.getElementById("ISLIDER").style.visibility="hidden";
	        document.getElementById("label_PPARTICIPACION").style.visibility="hidden";
	        document.getElementById("PPARTICIPACION").style.visibility="hidden";
	        document.getElementById("PPARTICIPACION").setAttribute("obligatorio", false);
	        document.getElementById("LIT_TLIMIT").style.visibility='visible';
	        document.getElementById("TLIMIT").style.visibility="visible";
        } else if(document.getElementsByName("CTIPPER")[0].value == 7){
       		document.getElementById("CAGRUPA").style.visibility='hidden';
	        document.getElementById("labelCAGRUPA").style.visibility='hidden';
	        document.getElementById("labelFAGRUPA").style.visibility='hidden';
	        document.getElementById("FAGRUPA").style.visibility='hidden';
	        document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
	       
	        //INI IAXIS-3670 16/04/2019 AP
	        document.getElementById("label_ISLIDER").style.visibility="hidden";
	        document.getElementById("ISLIDER").style.visibility="hidden";
	        document.getElementById("label_PPARTICIPACION").style.visibility="hidden";
	        document.getElementById("PPARTICIPACION").style.visibility="hidden";
	       	        document.getElementById("LIT_TLIMIT").style.visibility='hidden';
	        document.getElementById("TLIMIT").style.visibility="hidden";
	    } 
        
        else {
        	document.getElementById("LIT_TLIMIT").style.visibility='visible';
      		document.getElementById("TLIMIT").style.visibility='visible';
	        //
	        document.getElementById("CAGRUPA").style.visibility='hidden';
	        document.getElementById("labelCAGRUPA").style.visibility='hidden';
	        document.getElementById("labelFAGRUPA").style.visibility='hidden';
	        document.getElementById("FAGRUPA").style.visibility='hidden';
	        document.getElementById("CAGRUPA").value = -2147483648; 
	        document.getElementById("FAGRUPA").value = ''; 
	        document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
	        document.getElementById("CAGRUPA").setAttribute("obligatorio", false);
	        //
	        document.getElementById("label_ISLIDER").style.visibility="hidden";
	        document.getElementById("ISLIDER").style.visibility="hidden";
	        document.getElementById("label_PPARTICIPACION").style.visibility="visible";
	        document.getElementById("PPARTICIPACION").style.visibility="visible";
	        document.getElementById("PPARTICIPACION").setAttribute("obligatorio", true);
	        //FIN IAXIS-3670 16/04/2019 AP
        }
       	
       	f_cargar_propiedades_pantalla();
            
    }
        
    function f_limpiar_campos() {
    	
    	// Se limpian todos, sin excepción.
    	objDom.setValorPorId("NNUMIDE", "");
    	objDom.setValorPorId("NOMBRE", "");
    	objDom.setValorPorId("TELEFONO", "");
    	objDom.setValorPorId("DIRECCION", "");
    	objDom.setValorPorId("MAIL", "");
    	objDom.setValorPorId("PPARTICIPACION", "");
    	objDom.setValorPorId("ISLIDER", <%= Integer.MIN_VALUE %>);
    	objDom.setValorPorId("CAGRUPA", "");
    	objDom.setValorPorId("FAGRUPA", "");
    	objDom.setValorPorId("TLIMIT", "");
        	
    }
        
    // Fin IAXIS-4832(8) 09/09/2019
        
		<%-- Inici BFP 28/12/2011 bug: 20678 --%>
        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            <%--if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                }
            }--%>
            if (entrada.value != ''){
                if((entrada.value.length == 8) || (entrada.value.length == 10)){
                    entrada.value = jDate.formateaFecha(entrada.value);
                    if(jDate.validaFecha(entrada.value)){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    }else{
                        alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                        entrada.value = "";
                    }
                }else{
                    alert("<axis:alt f="axisper010" c="MENSAJE2" lit="1000421"/>");
                    entrada.value = "";
                }
            }
            
        }
        <%-- Fi BFP 28/12/2011 bug: 20678 --%>
        
        /* ************************************************************************************************* */
      /* **************************************** axisper021 ********************************************* */
      /* ************************************************************************************************* */
       
      function f_abrir_axisper021 () {
            var SSEGURO = "${__formdata.SSEGURO}";
            var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }   
      
      function f_cerrar_axisper021(){
         f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
            //alert("al entrar en el parent***");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }
      
      function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        //alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);
        
        f_cerrar_modalespersona(modal);
        
        //alert("Em cerrar persona2");
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.miForm.ORIGEN.value = porigen;
        document.miForm.SNIP.value = SNIP;      
        document.miForm.CAGENTE_VISIO.value = CAGENTE;

         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("modal_axisper025.do?SPERSON_REL="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }
 //funcion que valida cambios en islider
      function f_change_isLider() {
    if (document.getElementById("CAGRUPA").value > 0) {
        if (document.getElementById("ISLIDER").value != "1") {
            document.getElementById("FAGRUPA").setAttribute("disabled", true);
            document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
            var valueAgrupaC = document.getElementById("CAGRUPA").value;
            if (fechaAgrupacMapa.get(valueAgrupaC.toString()) != undefined) {
                var jDate = new JsFecha();

                document.getElementById("FAGRUPA_AUX").value = fechaAgrupacMapa.get(valueAgrupaC.toString());
                document.getElementById("FAGRUPA").value = fechaAgrupacMapa.get(valueAgrupaC.toString());
            }
        } else {
            document.getElementById("FAGRUPA").removeAttribute("disabled");
            document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
        }
    }
}
      
//funcion que valida las operaciones de fecha de agrupacion consrcio
 var fechaAgrupacMapa = new Map();
 var fechaAgrupaC;
 var fechaAgrupaC_AUX = '';
function f_change_cagrupa(map) {
fechaAgrupacMapa = new Map();
    if (document.getElementById("CAGRUPA").value > 0) {
        document.getElementById("FAGRUPA").setAttribute("obligatorio", true);
    } else {
        document.getElementById("FAGRUPA").setAttribute("obligatorio", false);
    }
  
    fechaAgrupaC_AUX = '${FECHA_AGRUPAC}';
   if(fechaAgrupaC_AUX != ''){
   fechaAgrupaC = fechaAgrupaC_AUX;
   }else{
    fechaAgrupaC = "${__formdata.FECHA_AGRUPAC}";
   }
   
    var valueAgrupaC = document.getElementById("CAGRUPA").value;
    if (fechaAgrupaC != "{}") {
        var fechaac = (fechaAgrupaC.replace("{", "").replace("}", "")).toString();
        var splitFechaac = fechaac.split(",");
        for (i = 0; i < splitFechaac.length; i++) {
            var splitAux = splitFechaac[i].split("=");
            fechaAgrupacMapa.set(splitAux[0].replace(" ", "").toString(), splitAux[1].toString());
        }

        if (valueAgrupaC > 0) {
            if (fechaAgrupacMapa.get(valueAgrupaC.toString()) != undefined) {
                var jDate = new JsFecha();

                document.getElementById("FAGRUPA_AUX").value = fechaAgrupacMapa.get(valueAgrupaC.toString());
                document.getElementById("FAGRUPA").value = fechaAgrupacMapa.get(valueAgrupaC.toString());
                if (document.getElementById("ISLIDER").value != "1") {
                    document.getElementById("FAGRUPA").setAttribute("disabled", true);
                    document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
                } else {
                    document.getElementById("FAGRUPA").removeAttribute("disabled");
                    document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
                }
            } else {
                document.getElementById("FAGRUPA").value = '';
                document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
                document.getElementById("FAGRUPA").removeAttribute("disabled");
            }
        } else {
            if (valueAgrupaC < 0) {
                document.getElementById("FAGRUPA").value = '';
                document.getElementById("FAGRUPA").setAttribute("disabled", true);
                document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
            } else {
                document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
                document.getElementById("FAGRUPA").removeAttribute("disabled");
            }
        }
    } else {
        if (valueAgrupaC < 0) {
            document.getElementById("FAGRUPA").value = '';
        } else {
            document.getElementById("popup_calendario_FAGRUPA").style.visibility = "visible";
            document.getElementById("FAGRUPA").removeAttribute("disabled");
        }
    }

    f_cargar_propiedades_pantalla();
    

}
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
               //alert(ajaxResponseText);
               
                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE_COMPLETO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NOMBRE_COMPLETO")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE_COMPLETO"), 0, 0) : "");
                     var TMAIL = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TMAIL")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TMAIL"), 0, 0) : "");
                     var TELEFONO_FIJO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TELEFONO_FIJO")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TELEFONO_FIJO"), 0, 0) : "");
                     var DIRECCION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TDOMICI")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TDOMICI"), 0, 0) : "");    
                     
                     
                     
                     objDom.setValorPorId("NOMBRE", NOMBRE_COMPLETO);   
                     objDom.setValorPorId("SPERSON_REL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));         
                     document.miForm.SPERSON_REL.value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);

                     objDom.setValorPorId("MAIL", TMAIL);
                     objDom.setValorPorId("TELEFONO", TELEFONO_FIJO);
                     objDom.setValorPorId("DIRECCION", DIRECCION);
                     
                     // Inicio IAXIS-4832(8) 09/09/2019
                     /*var PPARTICIPACION = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("PPARTICIPACION")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("PPARTICIPACION"), 0, 0) : ""); 
                     objDom.setValorPorId("PPARTICIPACION", PPARTICIPACION);*/
                     // Fin IAXIS-4832(8) 09/09/2019
					 
					 var TLIMIT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TLIMIT")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TLIMIT"), 0, 0) : ""); 
                     objDom.setValorPorId("TLIMIT", TLIMIT);
                     objDom.setValorPorId("FAGRUPA", '');
                     objDom.setValorPorId("CAGRUPA", '');
                     document.getElementById("FAGRUPA").setAttribute("disabled", true);
                    document.getElementById("popup_calendario_FAGRUPA").style.visibility = "hidden";
                }          
             
            }catch(e){}
        }
        
        
      
      
    </script>
	<!--********** CALENDARIO ************************* -->
          <!-- Hoja de estilo del Calendario -->
          <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
          <!-- Script principal del calendario -->
          <script type="text/javascript" src="scripts/calendar.js"></script>
          <!-- Idioma del calendario, en funcin del Locale -->
          <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
          <!-- Setup del calendario -->
          <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
		
  </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="faceptar" name="faceptar" value="${__formdata.faceptar}"/>
            <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a servidor para grabar --%>
            <input type="hidden" id="isNew"  name="isNew" value="${__formdata.isNew}"/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" id="CTIPPER" name="CCTIPPER" value="${__formdata.CTIPPER}"/>
            <input type="hidden" id="SPERSON_REL" name="SPERSON_REL" value="${__formdata.SPERSON_REL}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="ORIGEN" name="ORIGEN" id="ORIGEN" value="" />
            <input type="hidden" id="SNIP" name="SNIP" id="SNIP" value="" />
            <input type="hidden" id="CAGENTE_VISIO" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="" />
            <input type="hidden" id="SPERRELOUT" name="SPERRELOUT" value="${__formdata.SPERRELOUT}"/>                       
            <input type="hidden" id="FAGRUPA_AUX" name="FAGRUPA_AUX" /> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper025" c="TIT025" lit="9902250" /></c:param>
                <c:param name="producto"><axis:alt f="axisper025" c="TIT025" lit="9902250" /></c:param>
                <c:param name="form">axisper025</c:param>
            </c:import>
            
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper025" c="MOD_PANTALLA_PERS" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021" />
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper025" c="MOD_PANTALLA_APERS" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022" />
             </c:import>

            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                       
                        <div class="separador">&nbsp;</div>
                        
                        <table class="seccion">
                            <tr>                                
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:10%;height:0px"></th>
                            </tr>
                            <tr>          
                            
                                <axis:visible f="axisper025" c="CTIPPER">
                                        <td class="titulocaja" id="LIT_CTIPPER">
                                            <b><axis:alt f="axisper025" c="CTIPPER" lit="100565"/></b>
                                        </td>
                                </axis:visible>                                
                                <axis:visible f="axisper025" c="SPERSON">
                                    <td class="titulocaja"> <b><axis:alt f="axisper025" c="LIT_SPERSON" lit="105330"/></b></td><!-- Document -->  
                                </axis:visible>  
                                
                                 <axis:visible f="axisper025" c="NOMBRE">
                                    <td class="titulocaja"> <b><axis:alt f="axisper025" c="LIT_NOMBRE" lit="105940"/></b></td><!-- Nombre -->  
                                </axis:visible>       
                            </tr>
                            <tr>
                                <axis:visible f="axisper025" c="CTIPPER">
                                    <td class="campocaja">
                                        <select name="CTIPPER" id="CTIPPER" 
                                            <axis:atr f="axisper025" c="CTIPPER" a="modificable=true&obligatorio=true"/> 
                                            title='<axis:alt f="axisper025" c="CTIPPER" lit="100565"/>'                                            
                                            size="1" class="campowidthselect campo campotexto_ob" style="width:80%;" onchange="f_change_ctipper()" >&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper025" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.tipPers}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                            
                                <axis:visible f="axisper025" c="SPERSON" >
                                    <td class="campocaja">                                            
                                        <input type="text" name="NNUMIDE" id="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:75%"
                                        title='<axis:alt f="axisper025" c="LIT_SPERSON" lit="105330"/>'
                                        <axis:atr f="axisper025" c="NNUMIDE" a="modificable=false&obligatorio=true"/>  />                                        
                                        <axis:visible f="axisper025" c="BUSC_PERS">
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                        </axis:visible>                                                 
                                    </td>
                                </axis:visible>
                                
                                <axis:ocultar f="axisper025" c="NOMBRE" dejarHueco="false">
                                    <td class="campocaja" colspan="3">
                                        <input type="text" name="NOMBRE" id="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto" style="width:95%"
                                        <axis:atr f="axisper025" c="NOMBRE" a="modificable=false"/> /> 
                                    </td>
                                    <td></td>
                                </axis:ocultar>                               
                            </tr>
                            <tr>
                                <%-- Seccion 2 --%>                                
                                <axis:visible f="axisper025" c="TELEFONO">
                                        <td class="titulocaja" id="LIT_TELEFONO">
                                            <b><axis:alt f="axisper025" c="TELEFONO" lit="9000992"/></b>
                                        </td>
                                </axis:visible>
                                <axis:visible f="axisper025" c="DIRECCION">
                                        <td class="titulocaja" id="LIT_TDIRECCION">                                            
                                            <b><axis:alt f="axisper025" c="DIRECCION" lit="105889"/></b>
                                        </td>
                                </axis:visible>
                                <axis:visible f="axisper025" c="MAIL">
                                        <td class="titulocaja" id="LIT_MAIL">
                                            <b><axis:alt f="axisper025" c="MAIL" lit="109792"/></b>                                            
                                        </td>
                                </axis:visible>   
                                <axis:visible f="axisper025" c="PPARTICIPACION">
                                    <td class="titulocaja" id="tit_PPARTICIPACION"> 
                                    <b id="label_PPARTICIPACION" style="visibility:hidden"><axis:alt f="axisper025" c="LIT_PPARTICIPACION" lit="104818"/></b></td><!-- Participacin -->  
                                </axis:visible>  
                                 <axis:visible f="axisper025" c="ISLIDER">
                                        <td class="titulocaja" id="LIT_ISLIDER">
                                               <b id="label_ISLIDER" style="visibility:hidden"><axis:alt f="axisper025" c="LIT_ISLIDER" lit="9906692"/></b></td><!-- Participacin --> 
                                       </td>
                                </axis:visible> 
                                
                           </tr>
                           <tr>
                           
                                <axis:visible f="axisper025" c="TELEFONO">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    <axis:atr f="axisper025" c="TELEFONO" a="modificable=false&obligatorio=false"/> 
                                    size="15" 
                                    value="${__formdata.TELEFONO}" name="TELEFONO" id="TELEFONO" style="width:90%;"/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper025" c="DIRECCION">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axisper025" c="DIRECCION" a="modificable=false&obligatorio=false"/> 
                                    size="15" 
                                    value="${__formdata.DIRECCION}" name="DIRECCION" id="DIRECCION" style="width:90%;"/>
                                </td>
                                </axis:visible>
                                <axis:visible f="axisper025" c="MAIL">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" 
                                    <axis:atr f="axisper025" c="MAIL" a="modificable=false&obligatorio=false"/> 
                                    size="15" 
                                    value="${__formdata.MAIL}" name="MAIL" id="MAIL" style="width:85%;"/>
                                </td>
                           		</axis:visible>
                           <axis:visible f="axisper025" c="PPARTICIPACION" >
                                    <td class="campocaja" id="td_PPARTICIPACION">                                            
                                        <input type="text" name="PPARTICIPACION" id="PPARTICIPACION" value="${__formdata.PPARTICIPACION}" class="campowidthinput campo campotexto" style="width:75%;visibility:hidden"
                                        title='<axis:alt f="axisper025" c="LIT_PPARTICIPACION" lit="104818"/>' onkeypress="return ValidNumComa(event);"
                                        <axis:atr f="axisper025" c="PPARTICIPACION" a="modificable=true&obligatorio=false"/> />                                                                                                                        
                                    </td>
                                </axis:visible>
                            <axis:visible f="axisper025" c="ISLIDER">
                                    <td class="campocaja">
                                        <select name="ISLIDER" id="ISLIDER" 
                                        <axis:atr f="axisper025" c="ISLIDER" a="modificable=false"/> 
                                            title='<axis:alt f="axisper025" c="ISLIDER" lit="9906692"/>'                                            
                                            size="1" class="campowidthselect campo campotexto_ob" style="width:100%;visibility:hidden" onchange="f_change_isLider()"  >&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper025" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.lider}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.ISLIDER}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                           </tr>
						   <tr>
                             <%-- Seccion 3 --%>                                
                                <axis:visible f="axisper025" c="TLIMIT">
                                        <td class="titulocaja" id="LIT_TLIMIT">
                                            <b><axis:alt f="axisper025" c="TLIMIT" lit="9909393"/></b>
                                        </td>
                                </axis:visible>
								<axis:visible f="axisper025" c="CAGRUPA">
                                        <td class="titulocaja" id="LIT_CAGRUPA">
                                            <b id="labelCAGRUPA" style="visibility:hidden"><axis:alt f="axisper025" c="TCAGRUPA" lit="111471"/></b>
                                        </td>
                                </axis:visible>
                                
                                <axis:visible f="axisper025" c="TFAGRUPA">
                                        <td class="titulocaja" id="LIT_FAGRUPA">
                                            <b id="labelFAGRUPA" style="visibility:hidden"><axis:alt f="axisper025" c="TFAGRUPA" lit="100562"/></b>
                                        </td>
                                </axis:visible>
                                 
                           </tr>
                           <tr>
                                <axis:visible f="axisper025" c="TLIMIT">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" onkeypress="return soloLetrasNumeros(event)"
                                        <axis:atr f="axisper025" c="TLIMIT" a="modificable=true&obligatorio=true"/> 
                                        size="15" 
                                        value="${__formdata.TLIMIT}" name="TLIMIT" id="TLIMIT" style="width:90%;"/>
                                    </td>
                                </axis:visible>

                                
                                <axis:visible f="axisper025" c="CAGRUPA">
                                    <td class="campocaja">
                                        <select name="CAGRUPA" id="CAGRUPA" 
                                            <axis:atr f="axisper025" c="AGRUPA" a="modificable=false"/> 
                                            title='<axis:alt f="axisper025" c="CAGRUPA" lit="111471"/>'                                            
                                            size="1" class="campowidthselect campo campotexto_ob" style="width:80%;visibility:hidden" onchange="f_change_cagrupa(${FECHA_AGRUPA})" >&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper025" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.agrupacionesConsorcio}">
                                                <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CAGRUPA}"> selected </c:if> />
                                                    ${element.TATRIBU} 
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>
                                
                                                            
                                
                                <axis:ocultar c="FAGRUPA" f="axisper025" dejarHueco="false">
                              <!-- 28/12/2011
                                    afegim onblur="javascript:f_formatdate(this,'')"
                                    bug: 20678
                                    BFP
                              -->
                               <td class="campocaja" id="td_FAGRUPA">
                                    <input onchange="actFecha()" onblur="javascript:f_formatdate(this,'')" disabled="true" type="text" <c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}" > <axis:atr f="axisper025" c="FAGRUPA" a="modificable=false"/> </c:if> class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FAGRUPA}"/>" name="FAGRUPA" id="FAGRUPA"  style="width:65%;visibility:hidden"
                                    <axis:atr f="axisper025" c="FAGRUPA" a="modificable=true&formato=fecha&obligatorio=false"/> title="<axis:alt f="axisper025" c="FAGRUPA" lit="100562"/>"/> 
                                     <a style="vertical-align:middle;"><img id="popup_calendario_FAGRUPA" style="visibility:hidden" alt="<axis:alt f="axisper025" c="FAGRUPA" lit="100562"/>" title="<axis:alt f="axisper025" c="FAGRUPA" lit="100562" />" src="images/calendar.gif"/></a>
                                     
                                </td>
                                </axis:ocultar>
                           </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>			
            
            <div class="separador">&nbsp;</div>
           
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisper025</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
        </form>

        
 <script type="text/javascript">
           Calendar.setup({
                inputField     :    "FAGRUPA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FAGRUPA", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            function actFecha(){
              document.getElementById("FAGRUPA_AUX").value = document.getElementById("FAGRUPA").value;
            }
        </script>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>
