<%--
      NOMBRE:    axisagd001.jsp
      Fecha: 23/11/2010
      PROPÓSITO (descripción pantalla): 
      Ejemplo : Pantalla Agenda Usuario
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        23/11/2010   XPL               1. Creación de la pantalla. 16417: CRT003 - Análisis Agenda de usuario
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
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var IDAPUNTE = "${__formdata.IDAPUNTE}";	 	
                var IDAGENDA = "${__formdata.IDAGENDA}";	 	
               
                var NUEVO = "${__formdata.NUEVO}";
                 if (objUtiles.estaVacio(NUEVO) && objUtiles.estaVacio(IDAPUNTE) && objUtiles.estaVacio(IDAGENDA))     
                    f_abrir_modal("axisagd002");
            try{   
             var CGRUPO = "${__formdata.CGRUPO}";
                if (objUtiles.estaVacio(CGRUPO)){
                        document.getElementById("TD_CGRUPO").style.display="none";
                        document.getElementById("TD_CGRUPO").style.visibility="hidden";
                        

                        
                        
                        document.getElementById("TIT_CGRUPO").style.display="none";
                        document.getElementById("TIT_CGRUPO").style.visibility="hidden";
                        
                        document.getElementById("TD_TGRUPO").style.display="none";
                        document.getElementById("TD_TGRUPO").style.visibility="hidden";
                        document.getElementById("TIT_TGRUPO").style.display="none";
                        document.getElementById("TIT_TGRUPO").style.visibility="hidden";
                        
                        document.getElementById("CUSUARI").style.display="block";
                        document.getElementById("CUSUARI").style.visibility="visible";
                        
                        document.getElementById("TD_CUSUARI").style.display="block";
                        document.getElementById("TD_CUSUARI").style.visibility="visible";
                        document.getElementById("TIT_CUSUARI").style.display="block";
                        document.getElementById("TIT_CUSUARI").style.visibility="visible";
                        document.miForm.CGRUPO.value = '<%= Integer.MIN_VALUE %>';
                        document.miForm.TGRUPO.value = '';
                        
                        document.getElementById("CUSUARI").style.display="block";
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
                        
                        document.getElementById("TD_CGRUPO").style.display="block";
                        document.getElementById("TD_CGRUPO").style.visibility="visible";
                        document.getElementById("TIT_CGRUPO").style.display="block";
                        document.getElementById("TIT_CGRUPO").style.visibility="visible";
                        
                        document.getElementById("TD_TGRUPO").style.display="block";
                        document.getElementById("TD_TGRUPO").style.visibility="visible";
                        document.getElementById("TIT_TGRUPO").style.display="block";
                        document.getElementById("TIT_TGRUPO").style.visibility="visible";
                        
 document.miForm.CUSUARI.value = '<%= Integer.MIN_VALUE %>';
                        
                         document.getElementById("CGRUPO").style.display="block";
                        document.getElementById("CGRUPO").style.visibility="visible";
                        document.getElementById("TGRUPO").style.display="block";
                        document.getElementById("TGRUPO").style.visibility="visible";
                        
                        document.getElementById("CUSUARI").style.display="none";
                        document.getElementById("CUSUARI").style.visibility="hidden";
                       
                       
                       
                    
                    }
                    }catch(e){}
            
                     var CCLAGD = "${__formdata.CCLAGD}";
                     
                     if (!objUtiles.estaVacio(CCLAGD) ){
                     
                            if ( CCLAGD == 1 ){
                                var qs="operation=ajax_busqueda_poliza";
                                    qs=qs+"&SSEGURO="+objDom.getValorPorId("SSEGURO");
                                objAjax.invokeAsyncCGI("axis_axisagd001.do", callbackajaxPoliza, qs, this);
                            }else if ( CCLAGD == 0 ){
                                    var qs="operation=ajax_busqueda_siniestro";
                                        qs=qs+"&NSINIES="+objDom.getValorPorId("NSINIES");
                                    objAjax.invokeAsyncCGI("axis_axisagd001.do", callbackajaxSiniestro, qs, this);
                            
                            }
                    }

        
        
        
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
 	    }
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("axis_axisagd001.do", "buscar", document.miForm, "_self", objJsMessages.jsbuscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisagd001", "cancelar", document.miForm, "_self");
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                try{
                    if (!objUtiles.estaHidden("CUSUARI")){
                        if (objUtiles.estaVacio( document.getElementById("CUSUARI").value )||  document.getElementById("CUSUARI").value  < 0  ){
                            alert("<axis:alt c='CMP_OBL' f='axisagd001' lit='1000165'/> : <axis:alt c='CUSUARI' f='axisagd001' lit='100894'/>");
                          return;
                        }
                        }
                    if (!objUtiles.estaHidden("CGRUPO")   ){
                        if (objUtiles.estaVacio( document.getElementById("CGRUPO").value ) ||
                        (objUtiles.estaVacio( document.getElementById("TGRUPO").value ) ||   document.getElementById("TGRUPO").value  < 0  )){
                            alert("<axis:alt c='CMP_OBL' f='axisagd001' lit='1000165'/> : <axis:alt c='CGRUPO' f='axisagd001' lit='9001801'/>");                        
                            return;
                        }  
                    }
                    if (!objUtiles.estaHidden("CCLAGD"))
                        if (!objUtiles.estaVacio( document.getElementById("CCLAGD").value ) && objUtiles.estaVacio( document.getElementById("TCLAGD").value )){
                            alert("<axis:alt c='CMP_OBL' f='axisagd001' lit='1000165'/> : <axis:alt c='CCLAGD' f='axisagd001' lit='9901654'/>");                        
                            return;
                        }
                    }catch(e){}
                           
                
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisagd001.do", "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
            }
            function f_modcons_age(IDAPUNTE,IDAGENDA, nuevo){
            
                f_cerrar_modal("axisagd002");
               document.miForm.IDAPUNTE.value = IDAPUNTE;
               document.miForm.IDAGENDA.value = IDAGENDA;
               document.miForm.NUEVO.value = nuevo;
               
               objUtiles.ejecutarFormulario("axis_axisagd001.do", "form", document.miForm, "_self",  objJsMessages.jslit_cargando);
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
                            alert("<axis:alt c='VALIDA_FECHA' f='axisagd001' lit='1000421'/>");
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
                 thiss.value = objNumero.formateaNumeroMoneda(thiss.value, null);
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
                
                document.getElementById("TD_CUSUARI").style.display="block";
                document.getElementById("TD_CUSUARI").style.visibility="visible";
                document.getElementById("TIT_CUSUARI").style.display="block";
                document.getElementById("TIT_CUSUARI").style.visibility="visible";
    
                document.miForm.CGRUPO.value = '<%= Integer.MIN_VALUE %>';
                document.miForm.TGRUPO.value = '';
                                        document.getElementById("CUSUARI").style.display="block";
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
                
                document.getElementById("TD_CGRUPO").style.display="block";
                document.getElementById("TD_CGRUPO").style.visibility="visible";
                document.getElementById("TIT_CGRUPO").style.display="block";
                document.getElementById("TIT_CGRUPO").style.visibility="visible";
                
                document.getElementById("TD_TGRUPO").style.display="block";
                document.getElementById("TD_TGRUPO").style.visibility="visible";
                document.getElementById("TIT_TGRUPO").style.display="block";
                document.getElementById("TIT_TGRUPO").style.visibility="visible";
                

                document.miForm.CUSUARI.value = '<%= Integer.MIN_VALUE %>';
                                     document.getElementById("CGRUPO").style.display="block";
                        document.getElementById("CGRUPO").style.visibility="visible";
                        document.getElementById("TGRUPO").style.display="block";
                        document.getElementById("TGRUPO").style.visibility="visible";
                        
                        document.getElementById("CUSUARI").style.display="none";
                        document.getElementById("CUSUARI").style.visibility="hidden";
            }
            document.miForm.RD_VISION.value = vision;
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
                objAjax.invokeAsyncCGI("axis_axisagd001.do", callbackajaxPoliza, qs, this);
        }
        
         function callbackajaxPoliza (ajaxResponseText){
         try{
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var NPOLIZA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), 0, 0);
                    var NCERTIF = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCERTIF"), 0, 0);
                    var pol =  NPOLIZA+' - '+NCERTIF;
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
        function f_but_polissa() {
             objUtiles.ejecutarFormulario("axis_axisagd001.do", "consultarPolissa", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         function f_but_sinistre() {
             objUtiles.ejecutarFormulario("axis_axisagd001.do", "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
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
           var qs="operation=ajax_busqueda_valores_grupo";
                    qs=qs+"&CGRUPO="+valor;
                objAjax.invokeAsyncCGI("axis_axisagd001.do", callbackAjaxCargar, qs, this, objJsMessages.jslit_cargando);
         
         }
         
         
    

            function callbackAjaxCargar (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CVALOR");
                    
                    var TGRUPOCOMBO = document.miForm.TGRUPO;     
                    objDom.borrarOpcionesDeCombo(TGRUPOCOMBO);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt c='SNV_COMBO' f='axisagd001' lit='108341'/>  - ', TGRUPOCOMBO, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALOR"), i, 0);
                            var TVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALOR"), i, 0);                                     
                            objDom.addOpcionACombo(CVALOR, TVALOR, TGRUPOCOMBO, i+1);
                        }
                   

                }
            }      
        
         
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisagd002|<axis:alt c="axisagd002_TITULO" f="axisagd001" lit="9001188"/></c:param>
    </c:import>
      <!-- AXISSIN019 CERCADOR SINIESTRO  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axissin019|<axis:alt c="axissin019_TITULO" f="axisagd001" lit="9001334"/></c:param>
    </c:import>  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisagd001" lit="1000188"/></c:param>
    </c:import>        


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
       <input type="hidden" id="IDAPUNTE" name="IDAPUNTE" value="${__formdata.IDAPUNTE}"/>
       <input type="hidden" id="IDAGENDA" name="IDAGENDA" value="${__formdata.IDAGENDA}"/>
       <input type="hidden" id="NUEVO" name="NUEVO" value="${__formdata.NUEVO}"/>
       <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
       <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
       <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" id="TCLAGD" name="TCLAGD" value="${__formdata.TCLAGD}"/>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisagd001" lit="9001247"/></c:param>
                <c:param name="form">axisagd001</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                    <td>
                    <div class="titulo" >
                <div style="float:left;">
                <img src="images/flecha.gif"/><axis:alt c="form" f="TITULO" lit="9001247"/>
                   <axis:ocultar f="axisagd001" c="BT_BUSCARAGENDA" dejarHueco="false">                   
                      <img border="0" alt="<axis:alt c="BT_BUSCARAGENDA" f="axisagd001" lit="9001722"/>" title="<axis:alt c="BT_BUSCARAGENDA" f="axisagd001" lit="9001722"/>" src="images/find.gif" onclick="f_abrir_modal('axisagd002')" style="cursor:pointer"/>
                   <c:if test="${!empty __formdata.IDAPUNTE}"> - <axis:alt c="NUM_APUNTE" f="axisagd001" lit="9001189"/> : ${__formdata.IDAPUNTE}</c:if>
                   </axis:ocultar>                       
                   </div>
                </div>
                        <!--campos-->
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
                    <td class="titulocaja">
                            <b><axis:alt f="axisagd001" c="VISION" lit="9000708"/></b>
                     </td>
                     </tr>
                     <tr>
                             <axis:ocultar c="RD_USUARIO" f="axisagd001" dejarHueco="false">
                                  <td class="titulocaja">
                                      <input type="radio" id="RD_VISION" name="RD_VISION" value="0" onclick="f_act_vision(0);"
                                       <axis:atr f="axisagd001" c="RD_USUARIO"  a="modificable=true&isInputText=false"/>
                                       <c:if test="${!empty __formdata.CUSUARI  || empty __formdata.CGRUPO }">checked</c:if>/> <b><axis:alt f="axisagd001" c="CUSUARI" lit="100894"/></b> 
                           
                               </axis:ocultar>
                                <axis:ocultar c="RD_GRUPO" f="axisagd001" dejarHueco="false">
                           
                                      <input type="radio" id="RD_VISION" name="RD_VISION" value="1" onclick="f_act_vision(1);"
                                       <axis:atr f="axisagd001" c="RD_GRUPO"  a="modificable=true&isInputText=false"/>
                                       <c:if test="${!empty __formdata.CGRUPO}">checked</c:if>/> <b><axis:alt f="axisagd001" c="CGRUPO" lit="9001801"/></b>
                                   </td>
                               </axis:ocultar>
                   </tr>
                    <tr >
                     <!-- Usuario -->
                        <axis:ocultar f="axisagd001" c="CUSUARI" dejarHueco="false">
                        <td class="titulocaja" id ="TIT_CUSUARI">
                            <b><axis:alt f="axisagd001" c="CUSUARI" lit="100894"/></b>  
                        </td>
                        </axis:ocultar>
                       <axis:ocultar f="axisagd001" c="CGRUPO" dejarHueco="false">
                        <td class="titulocaja" id ="TIT_CGRUPO">
                            <b id="label_CGRUPO"><axis:alt f="axisagd001" c="CGRUPO" lit="9001801"/></b>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisagd001" c="TGRUPO" dejarHueco="false">
                        <td class="titulocaja" id ="TIT_TGRUPO">
                            <b id="label_TGRUPO"><axis:alt f="axisagd001" c="TGRUPO" lit="9901656"/></b>
                        </td>
                        </axis:ocultar> 
                        
                    </tr>
                    <tr >
                     <axis:ocultar f="axisagd001" c="CUSUARI" dejarHueco="false"> <!-- TODO C -->
                            <td class="campocaja" id ="TD_CUSUARI">
                                <select name = "CUSUARI" id="CUSUARI" style="width:95%;" size="1"  title="<axis:alt f="axisagd001" c="CUSUARI" lit="100894"/>"
                                <axis:atr f="axisagd001" c="CUSUARI" a="modificable=true&isInputText=false"/> 
                                class="campowidthselect campo campotexto">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                    <c:forEach var="usuarios" items="${__formdata.listValores.lstusuarios}">
                                        <option value = "${usuarios.CUSER}"
                                            <c:if test="${usuarios.CUSER == __formdata.CUSUARI}">selected</c:if>>
                                            ${usuarios.CUSER}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar> 
                      <axis:ocultar f="axisagd001" c="CGRUPO" dejarHueco="false"> <!-- TODO C -->
                            <td class="campocaja" id ="TD_CGRUPO">
                                <select name = "CGRUPO" id="CGRUPO" onchange="f_cargar_valores_grupo(this.value);f_cargar_propiedades_pantalla();" style="width:95%;" size="1"  title="<axis:alt f="axisagd001" c="CGRUPO" lit="9001801"/>"
                                <axis:atr f="axisagd001" c="CGRUPO" a="modificable=true&isInputText=false"/> 
                                class="campowidthselect campo campotexto">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                    <c:forEach var="grupos" items="${__formdata.listValores.lstgrupos}">
                                        <option value = "${grupos.CATRIBU}"
                                            <c:if test="${grupos.CATRIBU == __formdata.CGRUPO}">selected</c:if>>
                                            ${grupos.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar> 
                        <axis:ocultar f="axisagd001" c="TGRUPO" dejarHueco="false">
                        <td class="campocaja" id ="TD_TGRUPO">
                           <%-- <input type="text" class="campowidthinput campo campotexto"
                            <axis:atr f="axisagd001" c="TGRUPO" a="modificable=true"/> 
                            style="width:80%;" value="${__formdata.TGRUPO}" 
                            name="TGRUPO" id="TGRUPO"  size="15" 
                            title="<axis:alt f='axisagd001' c='TGRUPO' lit='9901656'/>" >--%>

                              <select name = "TGRUPO" id="TGRUPO"  style="width:95%;" size="1"  title="<axis:alt f="axisagd001" c="TGRUPO" lit="9901656"/>"
                                <axis:atr f="axisagd001" c="TGRUPO" a="modificable=true&isInputText=false"/> 
                                class="campowidthselect campo campotexto">
                                    <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                    <c:forEach var="grupos" items="${__formdata.listValores.lstvaloresgrupos}">
                                        <option value = "${grupos.CVALOR}"
                                            <c:if test="${grupos.CVALOR == __formdata.TGRUPO}">selected</c:if>>
                                            ${grupos.TVALOR}
                                        </option>
                                    </c:forEach>
                                </select>                            
                           
                        </td>
                        
                        </axis:ocultar>
                       
                    </tr>

                    <tr>
                    <axis:ocultar f="axisagd001" c="CCLAGD" dejarHueco="false">
                    <td class="titulocaja">
                        <b><axis:alt c="CCLAGD" f="axisagd001" lit="9901654"/></b>
                    </td>
                    </axis:ocultar>
                    <axis:ocultar f="axisagd001" c="TCLAGD">
                        <td class="titulocaja"  id = "tit_TCLAGD">
                            <b id="label_TCLAGD"><axis:alt f="axisagd001" c="TCLAGD" lit="9901655"/></b>
                        </td>
                    </axis:ocultar>
                    </tr>
                    
                    <tr>
                        <axis:ocultar f="axisagd001" c="CCLAGD" dejarHueco="false"> <!-- TODO C -->
                            <td class="campocaja" id = "td_CCLAGD">
                                <select name = "CCLAGD" id="CCLAGD" onchange="document.miForm.TCLAGD.value='';f_cargar_propiedades_pantalla();" style="width:95%;" size="1"  title="<axis:alt c="CCLAGD" f="axisagd001" lit="9901654"/>"
                                <axis:atr f="axisagd001" c="CCLAGD" a="modificable=true&isInputText=false"/> 
                                class="campowidthselect campo campotexto">
                                    <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                    <c:forEach var="modelos" items="${__formdata.listValores.lstmodulos}">
                                        <option value = "${modelos.CATRIBU}"
                                            <c:if test="${modelos.CATRIBU == __formdata.CCLAGD}">selected</c:if>>
                                            ${modelos.TATRIBU}
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar> 
                        <axis:ocultar f="axisagd001" c="TCLAGD" dejarHueco="false">
                        <td class="campocaja" id = "td_TCLAGD">
                            <input type="text" class="campo campotexto"
                            <axis:atr f="axisagd001" c="TCLAGD" a="modificable=false"/> 
                            style="width:80%;" value="${__formdata.TCLAGD_OUT}" 
                            name="TCLAGD_OUT" id="TCLAGD_OUT" title="<axis:alt f="axisagd001" c="TCLAGD" lit="9901655"/>" size="15" />
                            <axis:visible f="axisagd001" c="ICON_TGRUPO_SIN">
                                <img border="0" id ="ICON_TGRUPO_SIN" name ="ICON_TGRUPO_SIN" value="1" src="images/find.gif" onclick="f_abrir_axissin019()" style="cursor:pointer"/>
                            </axis:visible>
                            <axis:visible f="axisagd001" c="ICON_TGRUPO_POL">
                                <img border="0" id ="ICON_TGRUPO_POL" name ="ICON_TGRUPO_POL" src="images/find.gif" value="1" onclick="f_abrir_axisctr019()" style="cursor:pointer"/>
                            </axis:visible>
                        </td>
                        <td class="campocaja" >
                            <axis:visible f="axisagd001" c="BT_CONSPOL">
                                 <input type="button"  class="boton"  name="BT_CONSPOL" id="BT_CONSPOL" value="<axis:alt f="axisagd001" c="BT_CONSPOL" lit="151477"/>" onclick="f_but_polissa()" />
                            </axis:visible>
                            <axis:visible f="axisagd001" c="BT_CONSSINI">
                                <input type="button"  class="boton"  name="BT_CONSSINI" id="BT_CONSSINI" value="<axis:alt f="axisagd001" c="BT_CONSSINI" lit="1000432"/>" onclick="f_but_sinistre()" />
                            </axis:visible>
                        </td>
                        </axis:ocultar>
                    
                    </tr>

                    <tr>
                        <!-- Titulo Título Apunte -->
                        <axis:ocultar f="axisagd001" c="TTITAPU" dejarHueco="false">
                           <td class="titulocaja">
                           <b><axis:alt f="axisagd001" c="TTITAPU" lit="100785" /></b>
                           </td>
                        </axis:ocultar>  
                        
                    </tr>
                    <tr>
                        <!-- Título Apunte -->
                        <td class="campocaja" colspan="2">
                        <axis:ocultar f="axisagd001" c="TTITAPU" dejarHueco="false">                        
                               <input type="text" class="campowidthinput campo" size="30" value="${__formdata.TTITAPU}" name="TTITAPU" id="TTITAPU" 
                               style="width:95%;" title="<axis:alt f="axisagd001" c="TTITAPU" lit="9001196" />" <axis:atr f="axisagd001" c="TTITAPU" a="modificable=true"/> />
                        </axis:ocultar>
                        
                         <!-- Titulo Título Apunte -->
                        <axis:ocultar f="axisagd001" c="CPERAGD" dejarHueco="false">
                           <td class="titulocaja" align="right">
                           <b><axis:alt f="axisagd001" c="CPERAGD" lit="9901657" /></b>
                           <input type="checkbox" name="CPERAGD" id="CPERAGD"  value="${__formdata.CPERAGD}"
                           <axis:atr f="axisagd001" c="CPERAGD" a="modificable=true&isInputText=false"/>
                           onclick="javascript:f_actualizar_check(this)" <c:if test="${__formdata.CPERAGD==1}">checked</c:if>>  
                           </td>
                        </axis:ocultar>  

                        </td>    
                                                 
                    </tr>
                    
                    <axis:ocultar f="axisagd001" c="TAPUNTE" dejarHueco="false">
                    <tr>
                        <!-- Titulo Texto Apunte -->
                        <td class="titulocaja">
                            
                            <b><axis:alt f="axisagd001" c="TAPUNTE" lit="9001197" /></b>
                        </td>
                    </tr>
                    <tr>
                        <!-- Texto Apunte -->
                       <td colspan="3" style="width:100%;"   class="campocaja">
                       <textarea rows="10" cols="50" class="campo campotexto" style="width:100%;" 
                       <axis:atr f="axisagd001" c="TAPUNTE" a="modificable=true"/> name="TAPUNTE" id="TAPUNTE">${__formdata.TAPUNTE}</textarea>
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
                        <axis:ocultar f="axisagd001" c="CCONAPU">
                            <td class="titulocaja">
                                <b><axis:alt f="axisagd001" c="CCONAPU" lit="9000715"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisagd001" c="FRECORDATORIO">
                            <td class="titulocaja" id="tit_FRECORDATORIO">
                                <b id="label_FRECORDATORIO"><axis:alt f="axisagd001" c="FRECORDATORIO" lit="9901674"/></b>
                            </td>
                        </axis:ocultar>
                      <axis:ocultar f="axisagd001" c="CESTAPU">
                            <td class="titulocaja">
                                <b><axis:alt f="axisagd001" c="CESTAPU" lit="9001191"/></b>
                            </td>
                        </axis:ocultar>
                    
                        <axis:ocultar f="axisagd001" c="FESTAPU" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd001" c="FESTAPU" lit="9900983"/></b>
                        </td>
                        </axis:ocultar>
                                
                   </tr>
                   
                   <tr>
                   
                   <axis:ocultar f="axisagd001" c="CCONAPU" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja">
                            <select name = "CCONAPU" id="CCONAPU" style="width:95%;" size="1" onchange="document.miForm.FRECORDATORIO.value='';f_cargar_propiedades_pantalla();"
                            title="<axis:alt f="axisagd001" c="CCONCEPTO" lit="9000715"/>"
                            <axis:atr f="axisagd001" c="CCONAPU" a="modificable=true&obligatorio=true&isInputText=false"/> 
                            class="campowidthselect campo campotexto">
                                <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                <c:forEach var="conceptos" items="${__formdata.listValores.lstconcepto}">
                                    <option value = "${conceptos.CATRIBU}"
                                        <c:if test="${conceptos.CATRIBU == __formdata.CCONAPU}">selected</c:if>>
                                        ${conceptos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar> 
                    <axis:ocultar f="axisagd001" c="FRECORDATORIO" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja" id ="td_FRECORDATORIO">
                            <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                             id="FRECORDATORIO" name="FRECORDATORIO" title="<axis:alt f="axisagd001" c="FRECORDATORIO" lit="9901674"/>" size="15" 
                             onchange="javascript:f_formatdate(this,'');"
                             value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FRECORDATORIO}'/>" 
                             <axis:atr f="axisagd001" c="FRECORDATORIO" a="modificable=true&obligatorio=true&formato=fecha"/> />
                             
                             <a id="icon_FRECORDATORIO" style="vertical-align:middle;" href="#">
                             <img id="popup_calendario_FRECORDATORIO" border="0" alt="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd001" lit="108341"/>" 
                             title="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd001" lit="108341"/>" src="images/calendar.gif"/>
                             </a>
                       
                        </td>
                    </axis:ocultar> 
                    <axis:ocultar f="axisagd001" c="CESTAPU" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja">
                            <select name = "CESTAPU" id="CESTAPU" style="width:95%;" size="1"  
                            title="<axis:alt f="axisagd001" c="CESTAPU" lit="9001191"/>"
                            onchange = "f_habilitar_fecha(this);"
                            <axis:atr f="axisagd001" c="CESTAPU" a="modificable=true&obligatorio=true&isInputText=false"/> 
                            class="campowidthselect campo campotexto">
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
                                <c:forEach var="estados" items="${__formdata.listValores.lstestados}">
                                    <option value = "${estados.CATRIBU}"
                                        <c:if test="${estados.CATRIBU == __formdata.CESTAPU}">selected</c:if>>
                                        ${estados.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar> 
                     <axis:ocultar c="FESTAPU" f="axisagd001" dejarHueco="false">
                        <td class="campocaja">
                             <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                             id="FESTAPU" name="FESTAPU" title="<axis:alt f="axisagd001" c="FESTAPU" lit="9900983"/>" size="15" 
                             onchange="javascript:f_formatdate(this,'')"
                             value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTAPU}'/>" 
                             <axis:atr f="axisagd001" c="FESTAPU" a="modificable=true&obligatorio=true&formato=fecha"/> />
                             <a id="icon_FESTAPU" style="vertical-align:middle;" href="#">
                             <img id="popup_calendario_FESTAPU" border="0" alt="<axis:alt c="FESTAPU_TITLE" f="axisagd001" lit="108341"/>" 
                             title="<axis:alt c="FESTAPU_TITLE" f="axisagd001" lit="108341"/>" src="images/calendar.gif"/>
                             </a>
                        </td>
                    </axis:ocultar>
                   </tr>
                   

                 
                    <tr>
                    <c:if test="${!empty __formdata.FALTA}">
                        <!-- Titulo Fecha Alta -->
                        <axis:ocultar f="axisagd001" c="FALTA" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd001" c="FALTA" lit="9001192"/></b>
                        </td>
                        
                        </axis:ocultar>
                        </c:if>
                        <!-- Titulo Usuario Alta -->
                         <c:if test="${!empty __formdata.CUSUALT}">
                        <axis:ocultar f="axisagd001" c="CUSUALT" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd001" c="CUSUALT" lit="9001630"/></b>
                        </td>
                        </axis:ocultar>
                        </c:if>
                    </tr>
                    <tr>
                        <c:if test="${!empty __formdata.FALTA}">
                        <axis:ocultar c="FALTA" f="axisagd001" dejarHueco="false">
                            <td class="campocaja">
                                 <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                                 id="FALTA" name="FALTA" title="<axis:alt f="axisagd001" c="FALTA" lit="9001192"/>" size="15" 
                                 onchange="javascript:f_formatdate(this,'')"
                                 value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FALTA}'/>" 
                                 <axis:atr f="axisagd001" c="FALTA" a="modificable=false&formato=fecha"/> />
                                 <a id="icon_FALTA" style="vertical-align:middle;" href="#">
                                 <img id="popup_calendario_FALTA" border="0" alt="<axis:alt c="FALTA_TITLE" f="axisagd001" lit="108341"/>" 
                                 title="<axis:alt c="FALTA_TITLE" f="axisagd001" lit="108341"/>" src="images/calendar.gif"/>
                                 </a>
                            </td>
                        </axis:ocultar>
                        </c:if>
                        <c:if test="${!empty __formdata.CUSUALT}">
                        <axis:ocultar f="axisagd001" c="CUSUALT" dejarHueco="false"> <!-- TODO C -->
                                <td class="campocaja">
                                    <select name = "CUSUALT" id="CUSUALT" style="width:95%;" size="1"  title="<axis:alt f="axisagd001" c="CUSUALT" lit="100894"/>"
                                    <axis:atr f="axisagd001" c="CUSUALT" a="modificable=false&isInputText=false"/> 
                                    class="campowidthselect campo campotexto">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd001" lit="108341"/> - </option>
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
    <!-- fin Sólo si vamos a tener un campo fecha !-->
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisagd001</c:param>
   <c:param name="__botones"><axis:ocultar f="axisagd001" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisagd001" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


