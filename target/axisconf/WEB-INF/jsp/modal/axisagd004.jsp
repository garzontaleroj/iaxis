<%/* Revision:# XRxmHwvYETjac5C6XEFnKg== # */%>
<%--
      NOMBRE:    axisagd004.jsp
      Fecha: 23/11/2010
      PROPSITO (descripcin pantalla): 
      Ejemplo : Pantalla Agenda Usuario
  
      REVISIONES:
      Ver        Fecha        Autor             Descripcin
      ---------  ----------  ---------------  ------------------------------------
      1.0        23/11/2010   XPL               1. Creacin de la pantalla. 16417: CRT003 - Anlisis Agenda de usuario
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Slo si vamos a tener un campo fecha --%>
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
        <%-- fin Slo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var IDAPUNTE = objDom.getValorPorId("IDAPUNTE");
                var IDAGENDA = objDom.getValorPorId("IDAGENDA");
                var NUEVO = "${__formdata.NUEVO}";                
                var OK = "${__formdata.OK}";
                
                if (!objUtiles.estaVacio(OK)){
                     f_but_salir();
                }
                
                try{
                	var CGRUPO = "${__formdata.CGRUPO}";
                    var CUSUARI = "${__formdata.CUSUARI}";
                    if (!objUtiles.estaVacio(CUSUARI)){
	                    document.getElementById("TD_CGRUPO").style.display="none";
	                    document.getElementById("TD_CGRUPO").style.visibility="hidden";                            
	                    document.getElementById("TIT_CGRUPO").style.display="none";
	                    document.getElementById("TIT_CGRUPO").style.visibility="hidden";
	                    
	                    document.getElementById("TD_TGRUPO").style.display="none";
	                    document.getElementById("TD_TGRUPO").style.visibility="hidden";
	                    document.getElementById("TIT_TGRUPO").style.display="none";
	                    document.getElementById("TIT_TGRUPO").style.visibility="hidden";
	                    
	                    document.getElementById("CUSUARI").style.display="";
	                    document.getElementById("CUSUARI").style.visibility="visible";
	                    
	                    document.getElementById("TD_CUSUARI").style.display="";
	                    document.getElementById("TD_CUSUARI").style.visibility="visible";
	                    document.getElementById("TIT_CUSUARI").style.display="";
	                    document.getElementById("TIT_CUSUARI").style.visibility="visible";
	                    document.miForm.CGRUPO.value = '<%= Integer.MIN_VALUE %>';
	                    document.miForm.TGRUPO.value = '';
	                    
	                    document.getElementById("CUSUARI").style.display="";
	                    document.getElementById("CUSUARI").style.visibility="visible";
	                    
	                    document.getElementById("CGRUPO").style.display="none";
	                    document.getElementById("CGRUPO").style.visibility="hidden";
	                    document.getElementById("TGRUPO").style.display="none";
	                    document.getElementById("TGRUPO").style.visibility="hidden";
                            
                    }else if (!objUtiles.estaVacio(CGRUPO)){
	                    document.getElementById("TD_CUSUARI").style.display="none";
	                    document.getElementById("TD_CUSUARI").style.visibility="hidden";
	                    document.getElementById("TIT_CUSUARI").style.display="none";
	                    document.getElementById("TIT_CUSUARI").style.visibility="hidden";
	                    
	                    document.getElementById("TD_CGRUPO").style.display="";
	                    document.getElementById("TD_CGRUPO").style.visibility="visible";
	                    document.getElementById("TIT_CGRUPO").style.display="";
	                    document.getElementById("TIT_CGRUPO").style.visibility="visible";
	                    
	                    document.getElementById("TD_TGRUPO").style.display="";
	                    document.getElementById("TD_TGRUPO").style.visibility="visible";
	                    document.getElementById("TIT_TGRUPO").style.display="";
	                    document.getElementById("TIT_TGRUPO").style.visibility="visible";
	                    
	                    document.miForm.CUSUARI.value = '<%= Integer.MIN_VALUE %>';
	                    
	                    document.getElementById("CGRUPO").style.display="";
	                    document.getElementById("CGRUPO").style.visibility="visible";
	                    document.getElementById("TGRUPO").style.display="";
	                    document.getElementById("TGRUPO").style.visibility="visible";
	                    
	                    document.getElementById("CUSUARI").style.display="none";
	                    document.getElementById("CUSUARI").style.visibility="hidden";
                    }
                        
                    <c:if test="${__configform.axisagd004__CUSUARI_ORI__visible != 'false'}">
                    	var CUSUARI_ORI = "${__formdata.CUSUARI_ORI}";
                        if (!objUtiles.estaVacio(CUSUARI_ORI)){
	                        document.getElementById("TD_CGRUPO_ORI").style.display="none";
	                        document.getElementById("TD_CGRUPO_ORI").style.visibility="hidden";                            
	                        document.getElementById("TIT_CGRUPO_ORI").style.display="none";
	                        document.getElementById("TIT_CGRUPO_ORI").style.visibility="hidden";
	                        
	                        document.getElementById("TD_TGRUPO_ORI").style.display="none";
	                        document.getElementById("TD_TGRUPO_ORI").style.visibility="hidden";
	                        document.getElementById("TIT_TGRUPO_ORI").style.display="none";
	                        document.getElementById("TIT_TGRUPO_ORI").style.visibility="hidden";
	                        
	                        document.getElementById("CUSUARI_ORI").style.display="block";
	                        document.getElementById("CUSUARI_ORI").style.visibility="visible";
	                        
	                        document.getElementById("TD_CUSUARI_ORI").style.display="block";
	                        document.getElementById("TD_CUSUARI_ORI").style.visibility="visible";
	                        document.getElementById("TIT_CUSUARI_ORI").style.display="block";
	                        document.getElementById("TIT_CUSUARI_ORI").style.visibility="visible";
	                        document.miForm.CGRUPO_ORI.value = '<%= Integer.MIN_VALUE %>';
	                        document.miForm.TGRUPO_ORI.value = '';
	                        
	                        document.getElementById("CUSUARI_ORI").style.display="block";
	                        document.getElementById("CUSUARI_ORI").style.visibility="visible";
	                        
	                        document.getElementById("CGRUPO_ORI").style.display="none";
	                        document.getElementById("CGRUPO_ORI").style.visibility="hidden";
	                        document.getElementById("TGRUPO_ORI").style.display="none";
	                        document.getElementById("TGRUPO_ORI").style.visibility="hidden";
                                    
                        }else{
                            document.getElementById("TD_CUSUARI_ORI").style.display="none";
                            document.getElementById("TD_CUSUARI_ORI").style.visibility="hidden";
                            document.getElementById("TIT_CUSUARI_ORI").style.display="none";
                            document.getElementById("TIT_CUSUARI_ORI").style.visibility="hidden";
                            
                            document.getElementById("TD_CGRUPO_ORI").style.display="block";
                            document.getElementById("TD_CGRUPO_ORI").style.visibility="visible";
                            document.getElementById("TIT_CGRUPO_ORI").style.display="block";
                            document.getElementById("TIT_CGRUPO_ORI").style.visibility="visible";
                            
                            document.getElementById("TD_TGRUPO_ORI").style.display="block";
                            document.getElementById("TD_TGRUPO_ORI").style.visibility="visible";
                            document.getElementById("TIT_TGRUPO_ORI").style.display="block";
                            document.getElementById("TIT_TGRUPO_ORI").style.visibility="visible";
                            
                            document.miForm.CUSUARI_ORI.value = '<%= Integer.MIN_VALUE %>';
                            
                            document.getElementById("CGRUPO_ORI").style.display="block";
                            document.getElementById("CGRUPO_ORI").style.visibility="visible";
                            document.getElementById("TGRUPO_ORI").style.display="block";
                            document.getElementById("TGRUPO_ORI").style.visibility="visible";
                            
                            document.getElementById("CUSUARI_ORI").style.display="none";
                            document.getElementById("CUSUARI_ORI").style.visibility="hidden";                        
                        }
                    </c:if>
                        
                }catch(e){}
            
                var CCLAGD = "${__formdata.CCLAGD}";
                     
                if (!objUtiles.estaVacio(CCLAGD) ){                            
	                if ( CCLAGD == 1 ){
	                	if (!objUtiles.estaVacio(objDom.getValorPorId("SSEGURO")))  {
	                    	var qs="operation=ajax_busqueda_poliza";
	                        	qs=qs+"&SSEGURO="+objDom.getValorPorId("SSEGURO");
	                        
	                    	objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackajaxPoliza, qs, this);
	                    }
	                }else if ( CCLAGD == 0 ){
	                   if (!objUtiles.estaVacio(objDom.getValorPorId("NSINIES")))  {
	                        var qs="operation=ajax_busqueda_siniestro";
	                            qs=qs+"&NSINIES="+objDom.getValorPorId("NSINIES");
	                        objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackajaxSiniestro, qs, this);
	                    }                            
	                }
	                else if ( CCLAGD == 2 ){
	                   if (!objUtiles.estaVacio(objDom.getValorPorId("NRECIBO")))  {
	                        var qs="operation=ajax_busqueda_recibo";
	                            qs=qs+"&NRECIBO="+objDom.getValorPorId("NRECIBO");
	                        objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackajaxRecibo, qs, this);
	                    }
	                
	                }
	                else if (CCLAGD == 4){
	                	document.getElementById("CCLAGD").disabled = true;
	            	}
                }
        
              	<c:if test="${empty __formdata.FESTAPU}">
			        try{
				        var fecha=new Date();
				        <jsp:useBean id="now2" class="java.util.Date" />
				        document.getElementById("FESTAPU").value = "<fmt:formatDate pattern='dd/MM/yyyy' value='${now2}'/>";
				    }catch(e){}
        		</c:if>
        
        		f_cargar_propiedades_pantalla();//Funcin que nos carga todas las propiedades de pantalla
 	        }
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                //f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("modal_axisagd004.do", "buscar", document.miForm, "_self", objJsMessages.jsbuscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                parent.f_cerrar_modal_004('axisagd004');
                //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisagd004", "cancelar", document.miForm, "_self");
            }
            
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
	                try{
	                    if (!objUtiles.estaHidden("CUSUARI")){
	                        if (objUtiles.estaVacio( document.getElementById("CUSUARI").value )||  document.getElementById("CUSUARI").value  < 0  ){
	                            alert("<axis:alt c='CMP_OBL' f='axisagd004' lit='1000165'/> : <axis:alt c='CUSUARI' f='axisagd004' lit='100894'/>");
	                          	return;
	                        }
	                    }
	                    if (!objUtiles.estaHidden("CCLAGD")){
	                        if (!objUtiles.estaVacio( document.getElementById("CCLAGD").value ) && objUtiles.estaVacio( document.getElementById("TCLAGD_OUT").value )){
	                            alert("<axis:alt c='CMP_OBL' f='axisagd004' lit='1000165'/> : <axis:alt c='CCLAGD' f='axisagd004' lit='9901654'/>");                        
	                            return;
	                    	}
	                	}
	                }catch(e){}
	                
                    //Validamos los campos de pantalla, ahora llamaramos a la funcin que tocara
                    objUtiles.ejecutarFormulario("modal_axisagd004.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
	                   
	                //$("#operation").val("aceptar");
	                //objAjax.invokeAsyncCGI("modal_axisagd004.do", callBackResponse, $("#miForm").serialize(), this, objJsMessages.jslit_actualizando_registro);
                }
            }
            
            function callBackResponse(response){
				f_but_salir(); 
            }
            
            function f_modcons_age(IDAPUNTE,IDAGENDA, nuevo){

               document.miForm.IDAPUNTE.value = IDAPUNTE;
               document.miForm.IDAGENDA.value = IDAGENDA;
               document.miForm.NUEVO.value = nuevo;
               
               objUtiles.ejecutarFormulario("modal_axisagd004.do", "form", document.miForm, "_self",  objJsMessages.jslit_cargando);
           }
            
            
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt c='VALIDA_FECHA' f='axisagd004' lit='1000421'/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
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
            function f_act_vision(vision){            
	            if (vision == 0){
	                document.getElementById("TD_CGRUPO").style.display="none";
	                document.getElementById("TD_CGRUPO").style.visibility="hidden";
	                document.getElementById("TIT_CGRUPO").style.display="none";
	                document.getElementById("TIT_CGRUPO").style.visibility="hidden";
	                
	                document.getElementById("TD_TGRUPO").style.display="none";
	                document.getElementById("TD_TGRUPO").style.visibility="hidden";
	                document.getElementById("TIT_TGRUPO").style.display="none";
	                document.getElementById("TIT_TGRUPO").style.visibility="hidden";
	                
	                document.getElementById("TD_CUSUARI").style.display="";
	                document.getElementById("TD_CUSUARI").style.visibility="visible";
	                document.getElementById("TIT_CUSUARI").style.display="";
	                document.getElementById("TIT_CUSUARI").style.visibility="visible";
	    
	                document.miForm.CGRUPO.value = '<%= Integer.MIN_VALUE %>';
	                document.miForm.TGRUPO.value = '';
	                try{
	                	document.miForm.TGRUPO_MODIFVISIBLE.value = '';
	                	document.miForm.TGRUPO_MODIFVISIBLE.value = '';
	              	}catch(e){}
                        document.getElementById("CUSUARI").style.display="";
                        document.getElementById("CUSUARI").style.visibility="visible";
                        
                        document.getElementById("CGRUPO").style.display="none";
                        document.getElementById("CGRUPO").style.visibility="hidden";
                        document.getElementById("TGRUPO").style.display="none";
                        document.getElementById("TGRUPO").style.visibility="hidden";
	    
	            }else{
	                document.getElementById("TD_CUSUARI").style.display="none";
	                document.getElementById("TD_CUSUARI").style.visibility="hidden";
	                document.getElementById("TIT_CUSUARI").style.display="none";
	                document.getElementById("TIT_CUSUARI").style.visibility="hidden";
	                
	                document.getElementById("TD_CGRUPO").style.display="";
	                document.getElementById("TD_CGRUPO").style.visibility="visible";
	                document.getElementById("TIT_CGRUPO").style.display="";
	                document.getElementById("TIT_CGRUPO").style.visibility="visible";
	                
	                document.getElementById("TD_TGRUPO").style.display="";
	                document.getElementById("TD_TGRUPO").style.visibility="visible";
	                document.getElementById("TIT_TGRUPO").style.display="";
	                document.getElementById("TIT_TGRUPO").style.visibility="visible";
	                
	                document.miForm.CUSUARI.value = '<%= Integer.MIN_VALUE %>';
	                try{
	                	document.miForm.CUSUARI_MODIFVISIBLE.value = '';
	                }catch(e){}
                        document.getElementById("CGRUPO").style.display="";
                        document.getElementById("CGRUPO").style.visibility="visible";
                        document.getElementById("TGRUPO").style.display="";
                        document.getElementById("TGRUPO").style.visibility="visible";
                        
                        document.getElementById("CUSUARI").style.display="none";
                        document.getElementById("CUSUARI").style.visibility="hidden";
	            }
	            document.miForm.RD_VISION.value = vision;
        }
        
        
        
        function f_act_vision_o(vision){

            if (vision == 0){
                document.getElementById("TD_CGRUPO_ORI").style.display="none";
                document.getElementById("TD_CGRUPO_ORI").style.visibility="hidden";
                document.getElementById("TIT_CGRUPO_ORI").style.display="none";
                document.getElementById("TIT_CGRUPO_ORI").style.visibility="hidden";
                
                document.getElementById("TD_TGRUPO_ORI").style.display="none";
                document.getElementById("TD_TGRUPO_ORI").style.visibility="hidden";
                document.getElementById("TIT_TGRUPO_ORI").style.display="none";
                document.getElementById("TIT_TGRUPO_ORI").style.visibility="hidden";
                
                document.getElementById("TD_CUSUARI_ORI").style.display="";
                document.getElementById("TD_CUSUARI_ORI").style.visibility="visible";
                document.getElementById("TIT_CUSUARI_ORI").style.display="";
                document.getElementById("TIT_CUSUARI_ORI").style.visibility="visible";
    
                document.miForm.CGRUPO_ORI.value = '<%= Integer.MIN_VALUE %>';
                document.miForm.TGRUPO_ORI.value = '';
                
				document.getElementById("CUSUARI_ORI").style.display="block";
				document.getElementById("CUSUARI_ORI").style.visibility="visible";
                        
				document.getElementById("CGRUPO_ORI").style.display="none";
				document.getElementById("CGRUPO_ORI").style.visibility="hidden";
				document.getElementById("TGRUPO_ORI").style.display="none";
				document.getElementById("TGRUPO_ORI").style.visibility="hidden";
    
            }else{
                document.getElementById("TD_CUSUARI_ORI").style.display="none";
                document.getElementById("TD_CUSUARI_ORI").style.visibility="hidden";
                document.getElementById("TIT_CUSUARI_ORI").style.display="none";
                document.getElementById("TIT_CUSUARI_ORI").style.visibility="hidden";
                
                document.getElementById("TD_CGRUPO_ORI").style.display="";
                document.getElementById("TD_CGRUPO_ORI").style.visibility="visible";
                document.getElementById("TIT_CGRUPO_ORI").style.display="";
                document.getElementById("TIT_CGRUPO_ORI").style.visibility="visible";
                
                document.getElementById("TD_TGRUPO_ORI").style.display="";
                document.getElementById("TD_TGRUPO_ORI").style.visibility="visible";
                document.getElementById("TIT_TGRUPO_ORI").style.display="";
                document.getElementById("TIT_TGRUPO_ORI").style.visibility="visible";
                

                document.miForm.CUSUARI_ORI.value = '<%= Integer.MIN_VALUE %>';
                document.getElementById("CGRUPO_ORI").style.display="";
                document.getElementById("CGRUPO_ORI").style.visibility="visible";
                document.getElementById("TGRUPO_ORI").style.display="";
                document.getElementById("TGRUPO_ORI").style.visibility="visible";
                
                document.getElementById("CUSUARI_ORI").style.display="none";
                document.getElementById("CUSUARI_ORI").style.visibility="hidden";
            }
            document.miForm.RD_VISION_ORI.value = vision;
          //  f_cargar_propiedades_pantalla();

        }
        
        // Modal Buscador
        function f_abrir_axisctr019 () {
            objUtiles.abrirModal("axisctr019", "src", "modal_axisctr019.do?operation=form");
        }
        
        function f_cerrar_axisctr019() {
            objUtiles.cerrarModal("axisctr019");
        }   
        function f_aceptar_axisctr019 (SSEGURO) {
            f_cerrar_axisctr019();
            
           objDom.setValorPorId("SSEGURO", SSEGURO);
           objDom.setValorPorId("TCLAGD", SSEGURO);
           var qs="operation=ajax_busqueda_poliza";
                    qs=qs+"&SSEGURO="+SSEGURO;
                objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackajaxPoliza, qs, this);
        }
                
        
         function callbackajaxPoliza (ajaxResponseText){
         try{

                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("NOMBRE_COLUMNA");
                var pol = '';
                  for (i = 0; i < elementos.length; i++) {
                  
                   var NOMBRE_COLUMNA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE_COLUMNA"), i, 0);
                   var VALOR_COLUMNA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR_COLUMNA"), i, 0);                                     
                   if (elementos.length-1 == i)
                   pol =  pol+VALOR_COLUMNA;
                   else
                    pol =  pol+VALOR_COLUMNA+' - ';
                  }
                   objDom.setValorPorId("TCLAGD_OUT",pol);
                     }
                  }catch(e){}
                  
                   
        }   
        
        function callbackajaxSiniestro (ajaxResponseText){
            //alert(ajaxResponseText);
            try{
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var SSEGURO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), 0, 0);
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), 0, 0);
                    var CACTIVI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), 0, 0);
                      objDom.setValorPorId("CACTIVI",CACTIVI);
                      objDom.setValorPorId("SPRODUC",SPRODUC);
                      objDom.setValorPorId("SSEGURO",SSEGURO);
                  }
                  }catch(e){}
        }    
        
        
        function callbackajaxRecibo (ajaxResponseText){
         try{
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var NRECIBO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NRECIBO"), 0, 0);
                   objDom.setValorPorId("TCLAGD_OUT",NRECIBO);
                   objDom.setValorPorId("NRECIBO",NRECIBO);
                  }
                  }catch(e){}
        }   
        
        
        
        function f_abrir_axissin019() {
                objUtiles.abrirModal("axissin019","src","modal_axissin019.do?operation=form&tipo=SINIESTRO");
         }

         function f_aceptar_axissin019(NSINIES, SSEGURO, SPRODUC, CACTIVI) {
           objUtiles.cerrarModal("axissin019");
           objDom.setValorPorId("TCLAGD_OUT", NSINIES);
           objDom.setValorPorId("TCLAGD", NSINIES);
           objDom.setValorPorId("NSINIES", NSINIES);
           objDom.setValorPorId("SSEGURO", SSEGURO);
           objDom.setValorPorId("SPRODUC", SPRODUC);
           objDom.setValorPorId("CACTIVI", CACTIVI);
        }
        
        function f_cerrar_axissin019(){
              objUtiles.cerrarModal("axissin019");
        }
        
        //RECIBOS
        function f_but_buscar_recibo(){          
            objUtiles.abrirModal('axisadm021', "src", "modal_axisadm021.do?operation=form");  
        }
        
        /*function f_aceptar_modal_recerca_rebut(NRECIBO){
            f_cerrar_modal('axisadm001');
            objDom.setValorPorId("NRECIBO", NRECIBO);
            objDom.setValorPorId("TCLAGD_OUT", NRECIBO);
            objDom.setValorPorId("TCLAGD", NRECIBO);           
        }   */  

        function f_cerrar_axisadm021(NRECIBO_NULL) {
            objUtiles.cerrarModal("axisadm021");
        }  
		
        function f_aceptar_axisadm021 (NRECIBO){
            objDom.setValorPorId("NRECIBO", NRECIBO);
			objDom.setValorPorId("TCLAGD_OUT", NRECIBO);
            objDom.setValorPorId("TCLAGD", NRECIBO);   
            f_cerrar_axisadm021();
            /*objUtiles.ejecutarFormulario ("axis_axisadm017.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);*/
        }		
        
        
        function f_but_polissa() {
             objUtiles.ejecutarFormulario("modal_axisagd004.do", "consultarPolissa", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         function f_but_sinistre() {
             objUtiles.ejecutarFormulario("modal_axisagd004.do", "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         //Falta 
          function f_but_recibo() {
             objUtiles.ejecutarFormulario("modal_axisagd004.do", "navegarRecibo", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         function f_habilitar_fecha(thiss){
         try{
              var cestapunew = thiss.value;
              var CESTAPU = "${__formdata.CESTAPU}";
                  if (cestapunew == CESTAPU){
                        document.getElementById("FESTAPU").readOnly   = true;
                        document.getElementById("icon_FESTAPU").style.visibility="hidden";
                        document.getElementById("FESTAPU").value ="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTAPU}'/>"
         
                  }else{
                        document.getElementById("FESTAPU").readOnly   = false;
                        document.getElementById("icon_FESTAPU").style.visibility="visible";
                        var fecha=new Date();
                        <jsp:useBean id="now" class="java.util.Date" />
                        document.getElementById("FESTAPU").value = "<fmt:formatDate pattern='dd/MM/yyyy' value='${now}'/>";
                   }
            }catch(e){}
         }
         
         function f_cargar_valores_grupo(valor){
             if (!objUtiles.estaVacio(valor))    { 
               var qs="operation=ajax_busqueda_valores_grupo";
                        qs=qs+"&CGRUPO="+valor;
                    objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackAjaxCargar, qs, this, objJsMessages.jslit_cargando);
             }else{
                     f_cargar_propiedades_pantalla();
                }
         }
         
         
    

            function callbackAjaxCargar (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CVALOR");
                    
                    var TGRUPOCOMBO = document.miForm.TGRUPO;     
                    objDom.borrarOpcionesDeCombo(TGRUPOCOMBO);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt c='SNV_COMBO' f='axisagd004' lit='108341'/>  - ', TGRUPOCOMBO, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALOR"), i, 0);
                            var TVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALOR"), i, 0);  
                            
                                                                
                            objDom.addOpcionACombo(CVALOR, " "+CVALOR+ " - "+ TVALOR, TGRUPOCOMBO, i+1);
                        }
                   
                     if (elementos.length > 0 )
                      f_cargar_propiedades_pantalla();
                }
            }   
            
            
            
             function f_cargar_valores_grupo_ori(valor){
             if (!objUtiles.estaVacio(valor))    { 
               var qs="operation=ajax_busqueda_valores_grupo";
                        qs=qs+"&CGRUPO="+valor;
                    objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackAjaxCargar_ori, qs, this, objJsMessages.jslit_cargando);
             }else{
                     f_cargar_propiedades_pantalla();
                }
         }       
         
    

            function callbackAjaxCargar_ori (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CVALOR");
                    
                    var TGRUPOCOMBO = document.miForm.TGRUPO_ORI;     
                    objDom.borrarOpcionesDeCombo(TGRUPOCOMBO);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt c='SNV_COMBO' f='axisagd004' lit='108341'/>  - ', TGRUPOCOMBO, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALOR"), i, 0);
                            var TVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALOR"), i, 0);                                     
                            objDom.addOpcionACombo(CVALOR, TVALOR, TGRUPOCOMBO, i+1);
                        }
                   
                     if (elementos.length > 0 )
                      f_cargar_propiedades_pantalla();
                }
            }   
            
            function f_but_9902154(){
                 var tempCCLAGD = "&CCLAGD="+"${__formdata.CCLAGD}";
                 objUtiles.abrirModal("axisagd007", "src", "modal_axisagd007.do?operation=form"+tempCCLAGD,600,400);
            }
       
         
            function f_aceptar_mensaje(TMENSAJE, CTIPRES){
            
              objUtiles.cerrarModal("axisagd007");
               var IDAPUNTE = objDom.getValorPorId("IDAPUNTE");
                var IDAGENDA = objDom.getValorPorId("IDAGENDA");
               var qs="operation=ajax_set_chat";
                    qs=qs+"&TTEXTO="+TMENSAJE+"&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA;
                if ((CTIPRES != null) && (CTIPRES!='undefined')){
                     qs=qs+"&CTIPRES="+CTIPRES;
                }
                objAjax.invokeAsyncCGI("modal_axisagd004.do", callbackajaxMensaje, qs, this);
                
                //Recargamos para volver a obtener la FESTAPU y los cambios de estados producidos al responder.
                objUtiles.ejecutarFormulario("modal_axisagd004.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                                
            }
            
         
         function callbackajaxMensaje (ajaxResponseText){
         try{
        // alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                     var tbody = objLista.obtenerBodyLista("miListaId");
                        var tr = objLista.obtenerFilasBodyLista("miListaId", tbody);                  
                        
                        objLista.borrarFilasDeLista ("miListaId", "4", "<axis:alt f="axisagd004" c="SNV" lit="1000254" />");
                        
                        if (objDom.existeTag(doc, "CUSUARI"))
                            // Si hay registros, eliminamos el tr "No se han encontrado datos"
                            objLista.borrarFilaVacia(tbody, tr);
                            
                        
                        // Bucle para insertar cada una de las filas
                        for (var i = 0; i < objDom.numeroDeTags(doc, "CUSUARI") ; i++) {
                            // Obtenemos el estilo para la fila que insertaremos
                            
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            // Creamos un array de columnas a aadir a la nueva fila del displayTag
                            var newtd = new Array(4);                                                                                                                                                
                                                                                               
                            var CUSUARI   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CUSUARI")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CUSUARI"), i, 0) : "";
                            var CGRUPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CGRUPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGRUPO"), i, 0) : "";                            
                            var TGRUPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TGRUPO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGRUPO"), i, 0) : "";                                     
                            var FALTA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FALTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FALTA"), i, 0) : "";                                                                    
                            var TTEXTO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTEXTO")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTEXTO"), i, 0) : "";                                                                    
                            
                            // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                            //newtd[0] = objLista.addRadioButtonEnLista("radioNCODINT", NCODINT,
                            //"javascript:f_recargar_tipoInteres('" + NCODINT + "')");  
                            
                            //newtd[0] = objLista.addNumeroEnLista(SPROCES);
                            
                            newtd[0] = objLista.addTextoEnListaDim(CUSUARI, null, "10%");       
                          /*  if (!objUtiles.estaVacio(CGRUPO) || !objUtiles.estaVacio(TGRUPO)){
                                 if (!objUtiles.estaVacio(TGRUPO))
                                    newtd[1] = objLista.addTextoEnListaDim(CGRUPO +"-"+ TGRUPO, null, "10%");
                                 else
                                    newtd[1] = objLista.addTextoEnListaDim(CGRUPO , null, "10%");
                                 
                            }else{
                                newtd[1] = objLista.addTextoEnListaDim("", null, "10%");;
                            }*/
                            
                          try{
                            FALTA = formateaTimeStamp2(FALTA);
                          }catch(e){
                              try{
                                FALTA = formateaTimeStamp(FALTA);
                              }catch(e){
                                FALTA = FALTA;
                              }
                          }
                           newtd[1] = objLista.addTextoEnListaDim(FALTA, null, "10%");
                          //  newtd[2] = objLista.addTextoEnListaDim(FALTA, null, "10%");
                            var newtds = document.createElement("td");
                            if (document.all) {
                                //Para ie que no deja generar el name via runtime
                                textArea = document.createElement("<textarea class='campo campotexto' readonly  cols=80 rows=1>");
                            } 
                            else {
                                textArea = document.createElement("textarea");
                                textArea.cols = 80;
                                textArea.rows = 1;                
                                textArea.setAttribute("disabled", true);                    
                                textArea.className = 'campo campotexto';
                            }
                            textArea.innerHTML  = TTEXTO;
                            newtds.appendChild(textArea);
                            
                            newtd[2] = newtds;
                            //objLista.crearTextArea("MENSAJE_"+SPROCES,TMENSAJE, "MENSAJE_"+SPROCES , "MENSAJE_"+SPROCES  ,50,3,"campo campotexto",true,"50px");
                             
                            //objLista.addTextoEnLista(TMENSAJE);
                            //objLista.crearTextArea("textarea_observaciones", TMENSAJE, "TOBSERVA_0_0", "TOBSERVA_0_0", 2, 50, "campo campotexto", "visible", "block", true, "50px");                                  
                            
                            // Aadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody);        
                          
                        }
                        
                        // Si  hemos borrado el que tenamos seleccionado (el radiobutton marcado)
                        // En el callback tendremos que seleccionar el primer registro.
                        //if (!objUtiles.estaVacio(seleccionarPrimerRegistro) && seleccionarPrimerRegistro == true)
                            //f_selecciona_primer_NCODINT();
                    } // Fi if 
                    revisarEstilos();
                  
                    
                        
              
          }catch(e){}
        }   

  
         function formateaTimeStamp (timeStamp) {
        // try{
            if (!objUtiles.estaVacio(timeStamp) && timeStamp.length >= 8) {
                var year  = timeStamp.substring(0,4);
                var month = timeStamp.substring(4,6);
                var day   = timeStamp.substring(6,8);
                return (day + "/" + month + "/" + year);
            }
      
          //  }catch(e){ alert(e.name+" "+e.message);}
        }
        
        /**
        * Convierte un TimeStamp tipo 1967-03-09 00:00:00.0 a String formato dd/MM/yyyy
        * @param {String} El String en formato TimeStamp a convertir.
        * @return {String} El String en formato dd/MM/yyyy
        */
        function formateaTimeStamp2  (timeStamp) {
         
        // try{  
         if (!objUtiles.estaVacio(timeStamp) && timeStamp.length >= 10) {
                var year  = timeStamp.substring(0,4);
                var month = timeStamp.substring(5,7);
                var day   = timeStamp.substring(8,10);
                return (day + "/" + month + "/" + year);
            }
             //     }catch(e){ alert(e.name+" "+e.message);}
        }
         
        // CONF-347-01/12/2016-RCS - Ini
        function f_abrir_axisper021(){
        	objUtiles.abrirModal ("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_persona&ORIGEN=AXISAGD004");
        }
        function f_aceptar_persona(selectedPerson, CAGENTE, SNIP, modal) {
        	f_cerrar_modalespersona(modal);
        	objDom.setValorPorId("TCLAGD_OUT",selectedPerson);
        	objDom.setValorPorId("TCLAGD", selectedPerson);   
        }
        function f_cerrar_modalespersona(pantalla){
   		 objUtiles.cerrarModal(pantalla);
   	    }
        // CONF-347-01/12/2016-RCS - Fin
         
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

 
      <!-- AXISSIN019 CERCADOR SINIESTRO  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axissin019|<axis:alt c="axissin019_TITULO" f="axisagd004" lit="9001334"/></c:param>
    </c:import>  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisagd004" lit="1000188"/></c:param>
    </c:import>    
    <!-- AXISADM001 RECIBOS-->
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisadm021|<axis:alt f="axisagd004" c="TITULOAXISADM001" lit="1000552"/></c:param>
     </c:import>
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="axisagd007">axisagd007|<axis:alt f="axisagd004" c="TITULOAXISAGD007" lit="9902104"/></c:param>
     </c:import>
     <!-- CONF-347-01/12/2016-RCS - Se importa la pantalla axisper021 -->
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper021" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisper021" />
     </c:import>


    <form name="miForm" id="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
       <input type="hidden" id="IDAPUNTE" name="IDAPUNTE" value="${__formdata.IDAPUNTE}"/>
       <input type="hidden" id="IDAGENDA" name="IDAGENDA" value="${__formdata.IDAGENDA}"/>
       <input type="hidden" id="CCLAGD_" name="CCLAGD_" value="${__formdata.CCLAGD}"/>
       <input type="hidden" id="CCONAPU_" name="CCONAPU_" value="${__formdata.CCONAPU}"/>
       
       <input type="hidden" id="NUEVO" name="NUEVO" value="${__formdata.NUEVO}"/>
       <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
       <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
       <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
       <input type="hidden" id="NRECIBO" name="NRECIBO" value="${__formdata.NRECIBO}"/>
       <input type="hidden" id="TCLAGD" name="TCLAGD" value="${__formdata.TCLAGD}"/>
       <input type="hidden" id="IDTCLAGD" name="IDTCLAGD" value="${__formdata.IDTCLAGD}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisagd004" lit="9001247"/></c:param>
                <c:param name="form">axisagd004</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- rea de campos  -->
	<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td>
				<div class="titulo" >
                	<div style="float:left;">
                		<img src="images/flecha.gif"/><axis:alt c="form" f="TITULO" lit="9001247"/>
                   		<axis:ocultar f="axisagd004" c="BT_BUSCARAGENDA" dejarHueco="false">                   
                      		<img border="0" alt="<axis:alt c="BT_BUSCARAGENDA" f="axisagd004" lit="9001722"/>" title="<axis:alt c="BT_BUSCARAGENDA" f="axisagd004" lit="9001722"/>" src="images/find.gif" onclick="parent.f_cerrar_modal('axisagd004')" style="cursor:pointer"/>
                   			<c:if test="${!empty __formdata.IDAPUNTE}"> - <axis:alt c="NUM_APUNTE" f="axisagd004" lit="9001189"/> : ${__formdata.IDAPUNTE}</c:if>
                   		</axis:ocultar>                       
                   	</div>
                </div>

				<table class="seccion">       
			    	<tr>
			        	<td>
			            	<table class="area" align="center">
			                	<tr>
			                     	<th style="width:25%;height:0%;"/>
			                     	<th style="width:25%;height:0%;"/>
			                     	<th style="width:25%;height:0%;"/>
			                    	<th style="width:25%;height:0%;"/>
			                   	</tr>    
			                   	<tr>
			                    	<axis:ocultar c="RD_USUARIO" f="axisagd004" dejarHueco="false">
				                    	<td class="titulocaja">
				                        	<b><axis:alt f="axisagd004" c="VISION" lit="9901927"/></b>
				                     	</td>
			                     	</axis:ocultar>
			                    </tr>
			                    <tr>
			                    	<%-- TCS-809 26/02/2019 AP <td class="titulocaja">
		                            	<axis:ocultar c="RD_USUARIO" f="axisagd004" dejarHueco="false">
	                                    	<input type="radio" id="RD_VISION" name="RD_VISION" value="0" onclick="f_act_vision(0);"
	                                       	<axis:atr f="axisagd004" c="RD_USUARIO"  a="modificable=true&isInputText=false"/>
	                                       	<c:if test="${!empty __formdata.CUSUARI   }">checked</c:if>/> <b><axis:alt f="axisagd004" c="CUSUARI" lit="100894"/></b>	                           
		                               	</axis:ocultar>
		                                <axis:ocultar c="RD_GRUPO" f="axisagd004" dejarHueco="false">
		                                	<input type="radio" id="RD_VISION" name="RD_VISION" value="1" onclick="f_act_vision(1);"
		                                    <axis:atr f="axisagd004" c="RD_GRUPO"  a="modificable=true&isInputText=false"/>
		                                   	<c:if test="${!empty __formdata.CGRUPO && empty __formdata.CUSUARI}">checked</c:if>/> <b><axis:alt f="axisagd004" c="CGRUPO" lit="9001801"/></b>
		                               	</axis:ocultar>
	                            	</td> TCS-809 26/02/2019 AP --%>
			                   	</tr>
			                    <tr>
			                    	<axis:ocultar f="axisagd004" c="CUSUARI" dejarHueco="false">
			                        	<td class="titulocaja" id="TIT_CUSUARI">
			                            	<b><axis:alt f="axisagd004" c="CUSUARI" lit="100894"/></b>  
			                        	</td>
			                    	</axis:ocultar>
			                    	<%--TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="CGRUPO" dejarHueco="false">
			                        	<td class="titulocaja" id ="TIT_CGRUPO">
			                            	<b id="label_CGRUPO"><axis:alt f="axisagd004" c="CGRUPO" lit="9001801"/></b>
			                        	</td>
			                   		</axis:ocultar> TCS-809 26/02/2019 AP --%>
			                    	<%-- TCS-809 26/02/2019 AP<axis:ocultar f="axisagd004" c="TGRUPO" dejarHueco="false">
			                        	<td class="titulocaja" id ="TIT_TGRUPO">
			                            	<b id="label_TGRUPO"><axis:alt f="axisagd004" c="TGRUPO" lit="9901656"/></b>
			                       		</td>
			                    	</axis:ocultar> TCS-809 26/02/2019 AP --%>			                        
			                    </tr>
			                    <tr>
			                    	<axis:ocultar f="axisagd004" c="CUSUARI" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja" id="TD_CUSUARI">
			                            	<select name = "CUSUARI" id="CUSUARI" style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="CUSUARI" lit="100894"/>"
			                            		<axis:atr f="axisagd004" c="CUSUARI" a="modificable=true&isInputText=false"/> 
			                            		class="campowidthselect campo campotexto">
			                                	<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                	<c:forEach var="usuarios" items="${__formdata.listValores.lstusuarios}">
			                                    	<option value = "${usuarios.CUSER}"
			                                        	<c:if test="${usuarios.CUSER == __formdata.CUSUARI}">selected</c:if>>
			                                       			${usuarios.CUSER} - ${usuarios.NOMBRE}
			                                    	</option>
			                                    </c:forEach>
			                            	</select>
			                        	</td>
			                   		</axis:ocultar> 
			                    	<%-- TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="CGRUPO" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja" id ="TD_CGRUPO">
			                            	<select name = "CGRUPO" id="CGRUPO" onchange="f_cargar_valores_grupo(this.value);" style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="CGRUPO" lit="9001801"/>"
			                                	<axis:atr f="axisagd004" c="CGRUPO" a="modificable=true&isInputText=false"/> 
			                                	class="campowidthselect campo campotexto">
			                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="grupos" items="${__formdata.listValores.lstgrupos}">
			                                        <option value = "${grupos.CATRIBU}"
			                                            <c:if test="${grupos.CATRIBU == __formdata.CGRUPO}">selected</c:if>>
			                                        		${grupos.TATRIBU}
			                                        </option>
			                                    </c:forEach>
			                            	</select>
			                        	</td>
			                        </axis:ocultar> TCS-809 26/02/2019 AP --%>			                        
			                        <%--TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="TGRUPO" dejarHueco="false">			                        
			                        	<td class="campocaja" id ="TD_TGRUPO">			
			                            	<select name = "TGRUPO" id="TGRUPO"  style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="TGRUPO" lit="9901656"/>"
			                                	<axis:atr f="axisagd004" c="TGRUPO" a="modificable=true&isInputText=false"/> 
			                                	class="campowidthselect campo campotexto">
			                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="grupos" items="${__formdata.listValores.lstvaloresgrupos}">
			                                    	<option value = "${grupos.CVALOR}"
			                                        	<c:if test="${grupos.CVALOR == __formdata.TGRUPO}">selected</c:if>>
			                                            	${grupos.TVALOR}
			                                        </option>
			                                    </c:forEach>
			                                </select>
			                        	</td>
			                        </axis:ocultar> TCS-809 26/02/2019 AP --%>                       
			                    </tr>
			                    <%-- ORIGEN --%>
			                    <%--TCS-809 26/02/2019 AP <tr>
			                    	<axis:ocultar c="RD_USUARIO_ORI" f="axisagd004" dejarHueco="false">
			                        	<td class="titulocaja">
			                            	<b><axis:alt f="axisagd004" c="ORIGEN" lit="9902244"/></b>
			                            </td>
			                    	</axis:ocultar>
			                    </tr>TCS-809 26/02/2019 AP --%>
			                   <%-- TCS-809 26/02/2019 AP <tr>
			                       	<td class="titulocaja">
				                    	<axis:ocultar c="RD_USUARIO_ORI" f="axisagd004" dejarHueco="false">
			                            	<input type="radio" id="RD_VISION_ORI" name="RD_VISION_ORI" value="0" onclick="f_act_vision_o(0);"
			                               	<axis:atr f="axisagd004" c="RD_USUARIO_ORI"  a="modificable=true&isInputText=false"/>
			                                <c:if test="${!empty __formdata.CUSUARI_ORI}">checked</c:if>/> <b><axis:alt f="axisagd004" c="CUSUARI_ORI" lit="100894"/></b>
				                    	</axis:ocultar>
				                        <axis:ocultar c="RD_GRUPO_ORI" f="axisagd004" dejarHueco="false">                           
				                        	<input type="radio" id="RD_VISION_ORI" name="RD_VISION_ORI" value="1" onclick="f_act_vision_o(1);"
				                            <axis:atr f="axisagd004" c="RD_GRUPO_ORI"  a="modificable=true&isInputText=false"/>
				                            <c:if test="${!empty __formdata.CGRUPO_ORI && empty __formdata.CUSUARI_ORI}">checked</c:if>/> <b><axis:alt f="axisagd004" c="CGRUPO_ORI" lit="9001801"/></b>
				                    	</axis:ocultar>
			                    	</td>
			                    </tr> TCS-809 26/02/2019 AP--%>
			                    <tr>
			                        <!-- Usuario ORIGEN -->
			                       <%--TCS-809 26/02/2019 AP  <axis:ocultar f="axisagd004" c="CUSUARI_ORI" dejarHueco="false">
			                        	<td class="titulocaja" id ="TIT_CUSUARI_ORI">
			                            	<b><axis:alt f="axisagd004" c="CUSUARI_ORI" lit="100894"/></b>  
			                        	</td>
			                    	</axis:ocultar> TCS-809 26/02/2019 AP --%>
			                       <%-- TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="CGRUPO_ORI" dejarHueco="false">
			                        	<td class="titulocaja" id ="TIT_CGRUPO_ORI">
			                            	<b id="label_CGRUPO_ORI"><axis:alt f="axisagd004" c="CGRUPO_ORI" lit="9001801"/></b>
			                        	</td>
			                        </axis:ocultar> TCS-809 26/02/2019 AP --%>
			                        <%--TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="TGRUPO_ORI" dejarHueco="false">
			                        	<td class="titulocaja" id ="TIT_TGRUPO_ORI">
			                            	<b id="label_TGRUPO_ORI"><axis:alt f="axisagd004" c="TGRUPO_ORI" lit="9901656"/></b>
			                        	</td>
			                        </axis:ocultar> TCS-809 26/02/2019 AP --%>                     
			                    </tr>
			                    <tr>			                    
			                        <%-- GRUPO ORI --%>
			                    	<%-- TCS-809 26/02/2019 AP<axis:ocultar f="axisagd004" c="CUSUARI_ORI" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja" id ="TD_CUSUARI_ORI">
			                                <select name = "CUSUARI_ORI" id="CUSUARI_ORI" style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="CUSUARI_ORI" lit="100894"/>"
			                                	<axis:atr f="axisagd004" c="CUSUARI_ORI" a="modificable=true&isInputText=false"/> 
			                                	class="campowidthselect campo campotexto">
			                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV_ORI" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="usuarios" items="${__formdata.listValores.lstusuarios}">
			                                        <option value = "${usuarios.CUSER}"
			                                            <c:if test="${usuarios.CUSER == __formdata.CUSUARI_ORI}">selected</c:if>>
			                                            	${usuarios.CUSER}
			                                        </option>
			                               		</c:forEach>
			                           		</select>
			                        	</td>
			                   		</axis:ocultar> TCS-809 26/02/2019 AP --%>
			                      	<%--TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="CGRUPO_ORI" dejarHueco="false"> <!-- TODO C -->
			                            <td class="campocaja" id ="TD_CGRUPO_ORI">
			                                <select name = "CGRUPO_ORI" id="CGRUPO_ORI" onchange="f_cargar_valores_grupo_ori(this.value);" style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="CGRUPO_ORI" lit="9001801"/>"
			                                <axis:atr f="axisagd004" c="CGRUPO_ORI" a="modificable=true&isInputText=false"/> 
			                                class="campowidthselect campo campotexto">
			                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV_ORI" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="grupos" items="${__formdata.listValores.lstgrupos}">
			                                        <option value = "${grupos.CATRIBU}"
			                                            <c:if test="${grupos.CATRIBU == __formdata.CGRUPO_ORI}">selected</c:if>>
			                                            ${grupos.TATRIBU}
			                                        </option>
			                                    </c:forEach>
			                                </select>
			                            </td>
			                        </axis:ocultar> TCS-809 26/02/2019 AP --%>
			                        <%--TCS-809 26/02/2019 AP <axis:ocultar f="axisagd004" c="TGRUPO_ORI" dejarHueco="false">
			                        	<td class="campocaja" id ="TD_TGRUPO_ORI">
			                            	<select name = "TGRUPO_ORI" id="TGRUPO_ORI"  style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="TGRUPO_ORI" lit="9901656"/>"
			                                	<axis:atr f="axisagd004" c="TGRUPO_ORI" a="modificable=true&isInputText=false"/> 
			                                	class="campowidthselect campo campotexto">
			                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV_ORI" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="grupos" items="${__formdata.listValores.lstvaloresgrupos_ori}">
			                                        <option value = "${grupos.CVALOR}"
			                                            <c:if test="${grupos.CVALOR == __formdata.TGRUPO_ORI}">selected</c:if>>
			                                            ${grupos.TVALOR}
			                                        </option>
			                                    </c:forEach>
			                                </select>
			                        	</td>
			                    	</axis:ocultar> TCS-809 26/02/2019 AP --%>
			                    </tr>			                    
			                    <tr>
			                    	<axis:ocultar f="axisagd004" c="CCLAGD" dejarHueco="false">
			                    		<td class="titulocaja">
			                        		<b><axis:alt c="CCLAGD" f="axisagd004" lit="9901654"/></b>
			                    		</td>
			                    	</axis:ocultar>
			                    	<axis:ocultar f="axisagd004" c="TCLAGD">
			                        	<td class="titulocaja"  id = "tit_TCLAGD">
			                            	<b id="label_TCLAGD"><axis:alt f="axisagd004" c="TCLAGD" lit="9901655"/></b>
			                        	</td>
			                    	</axis:ocultar>
			                    </tr>
			                    <tr>
			                    	<axis:ocultar f="axisagd004" c="CCLAGD" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja" id = "td_CCLAGD">
			                                <select name = "CCLAGD" id="CCLAGD" onchange="document.miForm.TCLAGD.value='';f_cargar_propiedades_pantalla();" style="width:95%;" size="1"  title="<axis:alt c="CCLAGD" f="axisagd004" lit="9901654"/>"
			                                <axis:atr f="axisagd004" c="CCLAGD" a="modificable=true&isInputText=false"/> 
			                                class="campowidthselect campo campotexto">
			                                    <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                    <c:forEach var="modelos" items="${__formdata.listValores.lstmodulos}">
			                                        <option value = "${modelos.CATRIBU}"
			                                            <c:if test="${modelos.CATRIBU == __formdata.CCLAGD}">selected</c:if>>
			                                            ${modelos.TATRIBU}
			                                        </option>
			                                    </c:forEach>
			                                </select>
			                            </td>
			                        </axis:ocultar> 
			                        <axis:ocultar f="axisagd004" c="TCLAGD" dejarHueco="false">
			                        	<td class="campocaja" id = "td_TCLAGD">
			                            	<input type="text" class="campo campotexto"
			                            		<axis:atr f="axisagd004" c="TCLAGD" a="modificable=false"/> 
			                            		style="width:80%;" value="${__formdata.TCLAGD_OUT}" 
			                            		name="TCLAGD_OUT" id="TCLAGD_OUT" title="<axis:alt f="axisagd004" c="TCLAGD" lit="9901655"/>" size="15" />			                            		
			                            	<axis:visible f="axisagd004" c="ICON_TGRUPO_SIN">
			                                	<img border="0" id ="ICON_TGRUPO_SIN" name ="ICON_TGRUPO_SIN" value="1" src="images/find.gif" onclick="f_abrir_axissin019()" style="cursor:pointer"/>
			                            	</axis:visible>
			                            	<axis:visible f="axisagd004" c="ICON_TGRUPO_POL">
			                                	<img border="0" id ="ICON_TGRUPO_POL" name ="ICON_TGRUPO_POL" src="images/find.gif" value="1" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
			                            	</axis:visible>
			                            	<axis:visible f="axisagd004" c="ICON_TGRUPO_REC">
			                                	<img border="0" id ="ICON_TGRUPO_REC" name ="ICON_TGRUPO_REC" src="images/find.gif" value="1" onclick="f_but_buscar_recibo()" style="cursor:pointer"/>
						    					<!-- CONF-347-01/12/2016-RCS ICON_TGRUPO_PER -->
			                            	</axis:visible>
			                             	<axis:visible f="axisagd004" c="ICON_TGRUPO_PER">
			                                	<img border="0" id ="ICON_TGRUPO_PER" name ="ICON_TGRUPO_PER" src="images/find.gif" value="1" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
												<!-- CONF-347-01/12/2016-RCS ICON_TGRUPO_PER -->
			                            	</axis:visible>
			                        	</td>
			                        	<%-- TCS-809 26/02/2019 AP 
			                        	<td class="campocaja" >
			                            	<axis:visible f="axisagd004" c="BT_CONSPOL">
			                               		<input type="button"  class="boton"  name="BT_CONSPOL" id="BT_CONSPOL" value="<axis:alt f="axisagd004" c="BT_CONSPOL" lit="151477"/>" onclick="f_but_polissa()" />
			                            	</axis:visible>
			                            	<axis:visible f="axisagd004" c="BT_CONSSINI">
			                                	<input type="button"  class="boton"  name="BT_CONSSINI" id="BT_CONSSINI" value="<axis:alt f="axisagd004" c="BT_CONSSINI" lit="1000432"/>" onclick="f_but_sinistre()" />
			                            	</axis:visible>
			                            	<axis:visible f="axisagd004" c="BT_CONSREC1">
			                                	<input type="button"  class="boton"  name="BT_CONSREC" id="BT_CONSREC" value="<axis:alt f="axisagd004" c="BT_CONSREC" lit="9901120"/>" onclick="f_but_recibo()" />
			                            	</axis:visible>
			                        	</td>
			                        	</c:if> TCS-809 26/02/2019 AP --%>
			                        </axis:ocultar>
			                    </tr>
			                    <tr>
			                        <!-- Titulo Ttulo Apunte -->
			                    	<axis:ocultar f="axisagd004" c="TTITAPU" dejarHueco="false">
			                        	<td class="titulocaja">
			                           		<b><axis:alt f="axisagd004" c="TTITAPU" lit="100785" /></b>
			                           	</td>
			                        </axis:ocultar>
			                    </tr>
			                    <tr>
			                        <!-- Ttulo Apunte -->
			                        <td class="campocaja" colspan="2">
				                        <axis:ocultar f="axisagd004" c="TTITAPU" dejarHueco="false">                        
				                               <input type="text" class="campowidthinput campo" size="30" value="${__formdata.TTITAPU}" name="TTITAPU" id="TTITAPU" 
				                               style="width:95%;" title="<axis:alt f="axisagd004" c="TTITAPU" lit="9001196" />" <axis:atr f="axisagd004" c="TTITAPU" a="modificable=true"/> />
				                        </axis:ocultar>
				                        			                        
				                         <!-- Titulo Ttulo Apunte -->
				                    	<axis:ocultar f="axisagd004" c="CPERAGD" dejarHueco="false">
				                        	<td class="titulocaja" align="right">
				                           		<b><axis:alt f="axisagd004" c="CPERAGD" lit="9901657" /></b>
				                           		<input type="checkbox" name="CPERAGD" id="CPERAGD"  value="${__formdata.CPERAGD}"
				                           		<axis:atr f="axisagd004" c="CPERAGD" a="modificable=true&isInputText=false"/>
				                           		onclick="javascript:f_actualizar_check(this)" <c:if test="${__formdata.CPERAGD==1}">checked</c:if>>  
				                           	</td>
				                        </axis:ocultar>
			                        </td>                    
			                    </tr>			                    
			                    
			                    <axis:ocultar f="axisagd004" c="TAPUNTE" dejarHueco="false">
				                    <tr>
				                        <!-- Titulo Texto Apunte -->
				                        <td class="titulocaja">
				                       		<b><axis:alt f="axisagd004" c="TAPUNTE" lit="9001197" /></b>
				                        </td>
				                    </tr>
				                    <tr>
				                    	<!-- Texto Apunte -->
				                       	<td colspan="3" style="width:100%;"   class="campocaja">
					                       	<textarea rows="6" cols="50" class="campo campotexto" style="width:100%;" 
					                       	<axis:atr f="axisagd004" c="TAPUNTE" a="modificable=true"/> name="TAPUNTE" id="TAPUNTE">${__formdata.TAPUNTE}</textarea>
				                       	</td>
				                    </tr>
			                    </axis:ocultar>
			                </table>
			        	</td>
			        </tr>
			
			        <tr>
			           	<td>
			            	<table class="area" align="center">
			               		<tr>
			                    	<th style="width:25%;height:0%;"/>
			                     	<th style="width:25%;height:0%;"/>
			                     	<th style="width:25%;height:0%;"/>
			                     	<th style="width:25%;height:0%;"/>
			                   	</tr>           
			                   	<tr>
			                       	<axis:ocultar f="axisagd004" c="CCONAPU">
			                         	<td class="titulocaja">
			                               	<b><axis:alt f="axisagd004" c="CCONAPU" lit="9000715"/></b>
			                            </td>
			                        </axis:ocultar>
			                        <axis:ocultar f="axisagd004" c="FRECORDATORIO">
			                           	<td class="titulocaja" id="tit_FRECORDATORIO">
			                               	<b id="label_FRECORDATORIO"><axis:alt f="axisagd004" c="FRECORDATORIO" lit="9901674"/></b>
			                            </td>
			                        </axis:ocultar>
			                      	<axis:ocultar f="axisagd004" c="CESTAPU">
			                           	<td class="titulocaja">
			                               	<b><axis:alt f="axisagd004" c="CESTAPU" lit="9001191"/></b>
			                           	</td>
			                       	</axis:ocultar>			                    
			                        <axis:ocultar f="axisagd004" c="FESTAPU" dejarHueco="false">
			                        	<td class="titulocaja">
			                           		<b><axis:alt f="axisagd004" c="FESTAPU" lit="9900983"/></b>
			                        	</td>
			                       	</axis:ocultar>			                                
			                   	</tr>			                   
			                   	<tr>                   
				                   	<axis:ocultar f="axisagd004" c="CCONAPU" dejarHueco="false"> <!-- TODO C -->
				                        <td class="campocaja">
				                           	<select name = "CCONAPU" id="CCONAPU" style="width:95%;" size="1" onchange="document.miForm.FRECORDATORIO.value='';f_cargar_propiedades_pantalla();"
				                            	title="<axis:alt f="axisagd004" c="CCONAPU" lit="9000715"/>"
				                            	<axis:atr f="axisagd004" c="CCONAPU" a="modificable=true&obligatorio=true&isInputText=false"/> 
				                            	class="campowidthselect campo campotexto">
				                                <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
				                                <c:forEach var="conceptos" items="${__formdata.listValores.lstconcepto}">
				                                    <option value = "${conceptos.CATRIBU}"
				                                        <c:if test="${conceptos.CATRIBU == __formdata.CCONAPU}">selected</c:if>>
				                                        ${conceptos.TATRIBU}
				                                    </option>
				                                </c:forEach>
				                            </select>
				                    	</td>
				                    </axis:ocultar> 
			                    	<axis:ocultar f="axisagd004" c="FRECORDATORIO" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja" id ="td_FRECORDATORIO">
			                            	<input type="text" style="width:60%" class="campowidthinput campo campotexto" 
			                             		id="FRECORDATORIO" name="FRECORDATORIO" title="<axis:alt f="axisagd004" c="FRECORDATORIO" lit="9901674"/>" size="15" 
			                             		onchange="javascript:f_formatdate(this,'');"
			                             		value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FRECORDATORIO}'/>" 
			                             		<axis:atr f="axisagd004" c="FRECORDATORIO" a="modificable=true&obligatorio=false&formato=fecha"/> />
			                             
		                             		<a id="icon_FRECORDATORIO" style="vertical-align:middle;" href="#">
		                             			<img id="popup_calendario_FRECORDATORIO" border="0" alt="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd004" lit="108341"/>" 
		                             			title="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd004" lit="108341"/>" src="images/calendar.gif"/>
		                             		</a>			                       
			                        	</td>
			                    	</axis:ocultar> 
			                    	<axis:ocultar f="axisagd004" c="CESTAPU" dejarHueco="false"> <!-- TODO C -->
			                        	<td class="campocaja">
			                            	<select name = "CESTAPU" id="CESTAPU" style="width:95%;" size="1"  
			                            		title="<axis:alt f="axisagd004" c="CESTAPU" lit="9001191"/>"
			                            		onchange = "f_habilitar_fecha(this);"
			                            		<axis:atr f="axisagd004" c="CESTAPU" a="modificable=true&obligatorio=true&isInputText=false"/> 
			                            		class="campowidthselect campo campotexto">
			                                	<option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                	<c:forEach var="estados" items="${__formdata.listValores.lstestados}">
			                                   		<option value = "${estados.CATRIBU}"
			                                        	<c:if test="${estados.CATRIBU == __formdata.CESTAPU}">selected</c:if>>
			                                        	${estados.TATRIBU}
			                                    	</option>
			                                	</c:forEach>
			                            	</select>
			                        	</td>
			                    	</axis:ocultar> 
			                     	<axis:ocultar c="FESTAPU" f="axisagd004" dejarHueco="false">
				                        <td class="campocaja">
				                             <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
				                             	id="FESTAPU" name="FESTAPU" title="<axis:alt f="axisagd004" c="FESTAPU" lit="9900983"/>" size="15" 
				                             	onchange="javascript:f_formatdate(this,'')"
				                             	value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTAPU}'/>" 
				                             	<axis:atr f="axisagd004" c="FESTAPU" a="modificable=true&obligatorio=true&formato=fecha"/> />
				                             	
				                             <a id="icon_FESTAPU" style="vertical-align:middle;" href="#">
				                             	<img id="popup_calendario_FESTAPU" border="0" alt="<axis:alt c="FESTAPU_TITLE" f="axisagd004" lit="108341"/>" 
				                             	title="<axis:alt c="FESTAPU_TITLE" f="axisagd004" lit="108341"/>" src="images/calendar.gif"/>
				                             </a>
				                        </td>
			                    	</axis:ocultar>
			                   	</tr>
			                    <!-- CONF-347-01/12/2016-RCS - Ini -->
								<%-- TCS-809 26/02/2019 AP <tr>
									<axis:ocultar f="axisagd004" c="RESAPUN" dejarHueco="false">
										<td class="titulocaja" id="td_RESAPUN"><b><axis:alt f="axisagd004" c="RESAPUN" lit="9909680" /></b>
										</td>
									</axis:ocultar>
								</tr>	
								<tr>
									<axis:ocultar c="RESAPUN" f="axisagd004" dejarHueco="false">
										<td class="campocaja"><input type="text"
											style="width: 90%" class="campowidthinput campo campotexto"
											id="RESAPUN" name="RESAPUN"
											title="<axis:alt f="axisagd004" c="RESAPUN" lit="9909680"/>"
											size="15" onchange="" value='${__formdata.RESAPUN}' />			                  
										</td>
									</axis:ocultar>			                 
								</tr> TCS-809 26/02/2019 AP --%>
			                    <!-- CONF-347-01/12/2016-RCS - Fin -->
			                    <tr>
			                    	<c:if test="${!empty __formdata.FALTA}">
			                        	<!-- Titulo Fecha Alta -->
			                        	<axis:ocultar f="axisagd004" c="FALTA" dejarHueco="false">
			                        		<td class="titulocaja">
			                             		<b><axis:alt f="axisagd004" c="FALTA" lit="9001192"/></b>
			                        		</td>			                        
			                        	</axis:ocultar>
			                        </c:if>
			                        <!-- Titulo Usuario Alta -->
			                        <c:if test="${!empty __formdata.CUSUALT}">
			                        	<axis:ocultar f="axisagd004" c="CUSUALT" dejarHueco="false">
			                        		<td class="titulocaja">
			                             		<b><axis:alt f="axisagd004" c="CUSUALT" lit="9001630"/></b>
			                        		</td>
			                        	</axis:ocultar>
			                        </c:if>
			                    </tr>
			                    <tr>
			                    	<c:if test="${!empty __formdata.FALTA}">
			                        	<axis:ocultar c="FALTA" f="axisagd004" dejarHueco="false">
			                            	<td class="campocaja">
			                                	<input type="text" style="width:60%" class="campowidthinput campo campotexto" 
			                                 		id="FALTA" name="FALTA" title="<axis:alt f="axisagd004" c="FALTA" lit="9001192"/>" size="15" 
			                                 		onchange="javascript:f_formatdate(this,'')"
			                                 		value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FALTA}'/>" 
			                                 		<axis:atr f="axisagd004" c="FALTA" a="modificable=false&formato=fecha"/> />
			                                 		
			                                 	<a id="icon_FALTA" style="vertical-align:middle;" href="#">
			                                 		<img id="popup_calendario_FALTA" border="0" alt="<axis:alt c="FALTA_TITLE" f="axisagd004" lit="108341"/>" 
			                                 		title="<axis:alt c="FALTA_TITLE" f="axisagd004" lit="108341"/>" src="images/calendar.gif"/>
			                                 	</a>
			                            	</td>
			                        	</axis:ocultar>
			                        </c:if>
			                        <c:if test="${!empty __formdata.CUSUALT}">
			                        	<axis:ocultar f="axisagd004" c="CUSUALT" dejarHueco="false"> <!-- TODO C -->
			                               	<td class="campocaja">
			                                    <select name = "CUSUALT" id="CUSUALT" style="width:95%;" size="1"  title="<axis:alt f="axisagd004" c="CUSUALT1" lit="100894"/>"
			                                    	<axis:atr f="axisagd004" c="CUSUALT" a="modificable=false&isInputText=false"/> 
			                                    	class="campowidthselect campo campotexto">
			                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd004" lit="108341"/> - </option>
			                                        <c:forEach var="usuarios" items="${__formdata.listValores.lstusuarios}">
			                                            <option value = "${usuarios.CUSER}"
			                                                <c:if test="${usuarios.CUSER == __formdata.CUSUALT}">selected</c:if>>
			                                                ${usuarios.CUSER}
			                                            </option>
			                                        </c:forEach>
			                                    </select>
			                                </td>
			                            </axis:ocultar> 
			                        </c:if>
			                    </tr>
			                    
			                    <axis:visible f="axisagd004" c="DSP_MENSAJES">
			                    	<c:if test="${!empty __formdata.IDAPUNTE}">
			                      		<tr>
			                    			<td colspan="4">
			                        			<div class="titulo" >
				                            		<div style="float:left;">
				                                		<img src="images/flecha.gif"/><axis:alt c="MENSAJES" f="axisagd004" lit="1000277"/>
				                           			</div>
			                        			</div>
			                    			</td>
			                    		</tr>
			                     		<tr>
			                        		<td colspan="4">
			                        			<div class="separador">&nbsp;</div>
			                            		<!-- DisplayTag Plizas -->
					                            <c:set var="title5"><axis:alt f="axisagd003" c="FALTA" lit="9001192"/></c:set>
					                            <c:set var="title7"><axis:alt f="axisagd003" c="CUSUARI_CRE" lit="9901860"/></c:set> 
					                            <c:set var="title8"><axis:alt f="axisagd003" c="CGRUPO" lit="9001801"/></c:set>
					                            <c:set var="title9"><axis:alt f="axisagd003" c="TTEXTO" lit="100566"/></c:set>
					                            <c:set var="title10"><axis:alt f="axisagd003" c="ACCION" lit="9000844"/></c:set>			                            
			                            		<!-- Bug 0017744 - 25/02/2011 - JMF -->
			                            		<c:set var="title11"><axis:alt f="axisagd003" c="CUSUARI_REG" lit="9901859"/></c:set>

			                            		<div class="displayspaceGrande">
			                                		<display:table name="${__formdata.lstchat}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="modal_axisagd004.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
			                                    		<%@ include file="../include/displaytag.jsp"%>
			                                    		<axis:visible f="axisagd004" c="CUSUARI">
			                                    			<display:column title="${title7}" sortable="true" sortProperty="CUSUARI" headerClass="sortable fixed"  media="html" style="width:10%" autolink="false" >    
			                                        			<div class="dspText">${miListaId['CUSUARI']}</div>
			                                    			</display:column>
			                                    		</axis:visible>
			                                      		<axis:visible f="axisagd004" c="FALTA">
			                                    			<display:column title="${title5}" sortable="true" sortProperty="FALTA" headerClass="sortable fixed" media="html" style="width:10%" autolink="false" >
			                                        			<div class="dspText">
			                                        				<fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FALTA']}"/>
			                                       				</div>
			                                    			</display:column>
			                                    		</axis:visible>
			                                       		<axis:visible f="axisagd004" c="TTEXTO">
			                                    			<display:column title="${title9}" sortable="true" sortProperty="TTEXTO" headerClass="sortable fixed" media="html" style="width:55%" autolink="false" >
			                                        			<div class="dspText">
			                                        				<textarea class="campowidthselect campo campotexto" 
			                                        					title="<axis:alt f="axisagd004" c="MENSAJE" lit="9902104"/>"
			                                        					alt="<axis:alt f="axisagd004" c="MENSAJE" lit="9902104"/>"
			                                        					cols="80" rows="3" readonly >${miListaId['TTEXTO']}</textarea> </div>
			                                    			</display:column>
			                                    		</axis:visible>
			                                    		<axis:visible f="axisagd004" c="TRESPUE">
			                                    			<display:column title="${title10}" sortable="true" sortProperty="TRESPUE" headerClass="sortable fixed"  media="html" style="width:25%" autolink="false" >    
			                                        			<div class="dspText">${miListaId['TRESPUE']}</div>
			                                    			</display:column>
			                                    		</axis:visible>
			                                    	</display:table>
			                                	</div>
			                        		</td>
			                   			</tr>
			                   		</c:if>
			                	</axis:visible>			                   
			                </table>
			            </td>
			        </tr>
				</table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->
			</td>
		</tr>
	</table>
    
    <div class="separador">&nbsp;</div>
    
    </form>
    
    <script type="text/javascript">
	    Calendar.setup({
	        inputField     :    "FALTA",     
	        ifFormat       :    "%d/%m/%Y",      
	        button         :    "icon_FALTA", 
	        singleClick    :    true,
	        firstDay       :    1
	    });
	    Calendar.setup({
	        inputField     :    "FESTAPU",     
	        ifFormat       :    "%d/%m/%Y",      
	        button         :    "icon_FESTAPU", 
	        singleClick    :    true,
	        firstDay       :    1
	    });
	    Calendar.setup({
	        inputField     :    "FRECORDATORIO",     
	        ifFormat       :    "%d/%m/%Y",      
	        button         :    "icon_FRECORDATORIO", 
	        singleClick    :    true,
	        firstDay       :    1
	    });    
    </script>
    <!-- fin Slo si vamos a tener un campo fecha !-->
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisagd004</c:param>
   <c:param name="__botones">salir,aceptar</c:param> <%--TCS-809 26/02/2019 AP--%>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>