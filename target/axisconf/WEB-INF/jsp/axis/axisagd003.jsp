<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%--
      NOMBRE:    axisagd003.jsp
      Fecha: 17/11/2010
      PROPÓSITO (descripción pantalla): 
      Buscador Agenda
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0         17/11/2010   XPL               1. Creación de la pantalla. Bug. 16417 CRT003 - Análisis Agenda de usuario
      2.0         25/02/2011   JMF               2. 0017744 CRT - Mejoras en agenda
      
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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
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
                    }else{
                        objDom.setValorPorId("CACTIVI","");
                        objDom.setValorPorId("SPRODUC","");
                        objDom.setValorPorId("SSEGURO","");
                        objDom.setValorPorId("TCLAGD_OUT","");
                        objDom.setValorPorId("SSEGURO", "");
                        objDom.setValorPorId("TCLAGD", "");
                    }
	 	f_cargar_propiedades_pantalla();
	    }
           
          function f_limpiar(){
          	try{
             	var formsH = document.getElementsByTagName("form")[0];
            	var inputs = document.getElementsByTagName("input");
                  for(var i=0;i<inputs.length;i++){
                     if(inputs[i].attributes.length>0) {
                        var inputId = inputs[i].getAttribute("id");
                         objDom.setValorPorId(inputId + "_MODIFVISIBLE", "");
                    
                    }
                }
              }catch(e){}
            
            }
           function f_but_buscar() {
           
                if (objValidador.validaEntrada()){
                     f_limpiar();
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    objUtiles.ejecutarFormulario("axis_axisagd003.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    f_cargar_propiedades_pantalla();  // CONF-347-20161201-RCS
                }
           }
           
           function f_but_aceptar() {
                 //parent.f_modcons_age(document.miForm.IDAPU.value,document.miForm.IDAGD.value);                 
                 f_abrir_modal("axisagd004");
           }
           
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value;
                f_abrir_modal(cual, optionalQueryString);
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value;
                                        
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
                objUtiles.ejecutarFormulario("axis_axisagd004.do", "buscar", document.miForm, "_self", objJsMessages.jsbuscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_cerrar_modal_004(){
             objUtiles.cerrarModal("axisagd004");
             //objUtiles.ejecutarFormulario("axis_axisagd003.do", "buscar", document.miForm, "_self", objJsMessages.jsbuscando_polizas);
             f_but_buscar();
            }
           
           function f_but_cancelar() {
                //parent.f_cerrar_modal('axisagd003');
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisagd003", "cancelar", document.miForm, "_self");
           }
           
           function f_seleccionar(IDAPUNTE,IDAGENDA){                     
                f_marcar(IDAPUNTE,IDAGENDA);
                  f_abrir_modal("axisagd004");
                  //parent.f_modcons_age(IDAPUNTE,IDAGENDA);
           }
           function f_marcar(IDAPUNTE,IDAGENDA){
           
               document.miForm.IDAPU.value = IDAPUNTE;
               document.miForm.IDAGD.value = IDAGENDA;
                  
           }
           
           function f_but_nuevo(){
               document.miForm.IDAPUNTE.value = '';
               document.miForm.IDAGENDA.value = '';
               document.miForm.NUEVO.value = 1;
               optionalQueryString = "&NUEVO=1&IDAPUNTE=&IDAGENDA=";
                f_abrir_modal("axisagd004", optionalQueryString);
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
                            alert("<axis:alt c='VALIDA_FECHA' f='axisagd003' lit='1000421'/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
              function f_cargar_valores_grupo(valor){
                    if (!objUtiles.estaVacio(valor))    { 
           var qs="operation=ajax_busqueda_valores_grupo";
                    qs=qs+"&CGRUPO="+valor;
                objAjax.invokeAsyncCGI("axis_axisagd003.do", callbackAjaxCargar, qs, this, objJsMessages.jslit_cargando);
                }else{
                     f_cargar_propiedades_pantalla();
                }
         
         }
         
         
    

            function callbackAjaxCargar (ajaxResponseText){
            	
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("CVALOR");
                    
                    var TGRUPOCOMBO = document.miForm.TGRUPO;
                    TGRUPOCOMBO.className  = TGRUPOCOMBO.className.replace('disabled', '');
                    objDom.borrarOpcionesDeCombo(TGRUPOCOMBO);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt c='SNV_COMBO' f='axisagd003' lit='108341'/> - ', TGRUPOCOMBO, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CVALOR"), i, 0);
                            var TVALOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALOR"), i, 0);                                     
                            objDom.addOpcionACombo(CVALOR, TVALOR, TGRUPOCOMBO, i+1);
                        }
                   if (elementos.length > 0 ){
                      f_cargar_propiedades_pantalla();
                    }
                }
            } 
            
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
}
function ocultar(nombreCapa){ 
    document.getElementById(nombreCapa).style.visibility="hidden"; 
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
                var elementos = doc.getElementsByTagName("OB_IAX_INFO");
                    var NPOLIZA = '';
                    var NCERTIF = '';

                         for (i = 0; i < elementos.length; i++) {
                         
                            var NOMBRE_COLUMNA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE_COLUMNA"), i, 0);
                            var VALOR_COLUMNA = objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR_COLUMNA"), i, 0);
                            if (objUtiles.utilEquals(NOMBRE_COLUMNA,'NPOLIZA'))
                                NPOLIZA = VALOR_COLUMNA;
                                
                            if (objUtiles.utilEquals(NOMBRE_COLUMNA,'NCERTIF'))
                                NCERTIF = VALOR_COLUMNA;
                          }
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
        function f_cargar(){
            objDom.setValorPorId("CACTIVI","");
            objDom.setValorPorId("SPRODUC","");
            objDom.setValorPorId("SSEGURO","");
            objDom.setValorPorId("TCLAGD_OUT","");
            objDom.setValorPorId("SSEGURO", "");
            objDom.setValorPorId("TCLAGD", "");
            f_carga_dependencias();
        }
        function f_dep_chckUsuari()
        {
              document.miForm.CHECKCUSUARI.value = document.getElementById("CHECKCUSUARI").checked ? "1" : "0";
        }
        
         //RECIBOS
        function f_but_buscar_recibo(){          
            objUtiles.abrirModal('axisadm021', "src", "modal_axisadm021.do?operation=form");  
        }
        
        /*function f_aceptar_modal_recerca_rebut(NRECIBO){
            f_cerrar_modal('axisadm021');
            objDom.setValorPorId("NRECIBO", NRECIBO);
            objDom.setValorPorId("TCLAGD_OUT", NRECIBO);
            objDom.setValorPorId("TCLAGD", NRECIBO);           
        }  */

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
        // CONF-347-20161201-RCS - Ini
		function f_abrir_axisper021(){
        	objUtiles.abrirModal ("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&faceptar=f_aceptar_persona&ORIGEN=AXISAGD004");
        }
        function f_aceptar_persona(selectedPerson, CAGENTE, SNIP, modal) {
        	f_cerrar_modalespersona(modal);
        	objDom.setValorPorId("TCLAGD_OUT",selectedPerson);
        }
        function f_cerrar_modalespersona(pantalla){
   		 objUtiles.cerrarModal(pantalla);
   	    }
        // CONF-347-20161201-RCS - Fin
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
<!--         Iaxis 2134 AABC MODIFICACION DE TITULO GESTION TAREA -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisagd004|<axis:alt c="TIT_AXISAGD004" f="axisagd003" lit="9909021"/></c:param>
    </c:import>
        <!-- AXISADM001 RECIBOS-->
     <c:import url="../include/modal_estandar.jsp">
            <c:param name="axisadm021">axisadm021|<axis:alt f="axisagd003" c="TITULOAXISADM001" lit="1000552"/></c:param>
     </c:import>
          <!-- CONF-347-20161201-RCS - Se inserta el import de la pantalla axisper021-->
     <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper021" c="TIT_AXISCTR014" lit="1000234" /></c:param>
                <c:param name="nid" value="axisper021" />
     </c:import>
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="IDAPU" name="IDAPU" value="${__formdata.IDAPU}"/>
            <input type="hidden" id="IDAGD" name="IDAGD" value="${__formdata.IDAGD}"/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
       
       <input type="hidden" id="IDAGENDA" name="IDAGENDA" value="${__formdata.IDAGENDA}"/>
       <input type="hidden" id="NUEVO" name="NUEVO" value="${__formdata.NUEVO}"/>
       <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
       <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
       <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" id="TCLAGD" name="TCLAGD" value="${__formdata.TCLAGD}"/>    
       
                  <!-- AXISSIN019 CERCADOR SINIESTRO  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axissin019|<axis:alt c="axissin019_TITULO" f="axisagd003" lit="9001334"/></c:param>
    </c:import>  
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr019|<axis:alt c="axisctr019_TITULO" f="axisagd003" lit="1000188"/></c:param>
    </c:import>   
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="FORM" f="axisagd003" lit="9001188"/></c:param>
                <c:param name="producto"><axis:alt c="FORM" f="axisagd003" lit="9001188"/></c:param>
                <c:param name="form">axisagd003</c:param>
            </c:import>
            <!-- Area de campos  -->
            
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:16.6%;height:0px"></th>
                                <th style="width:16.6%;height:0px"></th>
                                <th style="width:16.6%;height:0px"></th>
                                <th style="width:16.6%;height:0px"></th>
                                <th style="width:16.6%;height:0px"></th>
                                <th style="width:16.6%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisagd003" c="IDAPUNTE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisagd003" c="IDAPUNTE" lit="9001189" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="CCLAGD" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt c="CCLAGD" f="axisagd003" lit="9901654"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="TCLAGD">
                                    <td class="titulocaja"  id = "tit_TCLAGD">
                                        <b id="label_TCLAGD"><axis:alt f="axisagd003" c="TCLAGD" lit="9901655"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="CCONAPU">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisagd003" c="CCONAPU" lit="9000715"/></b>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisagd003" c="CESTAPU">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisagd003" c="CESTAPU" lit="9001191"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                               <axis:ocultar f="axisagd003" c="IDAPUNTE" dejarHueco="false">
                                <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axisagd003" c="IDAPUNTE" a="modificable=true"/> 
                                    style="width:80%;" value="${__formdata.IDAPUNTE}" 
                                    name="IDAPUNTE" id="IDAPUNTE" title="<axis:alt f="axisagd003" c="IDAPUNTE" lit="9001189" />" size="15" 
                                    />
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="CCLAGD" dejarHueco="false"> 
                                    <td class="campocaja" id = "td_CCLAGD">
                                        <select name = "CCLAGD" id="CCLAGD" onchange="f_cargar();"
                                        style="width:95%;" size="1"  title="<axis:alt c="CCLAGD" f="axisagd003" lit="9901654"/>"
                                        <axis:atr f="axisagd003" c="CCLAGD" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="modelos" items="${__formdata.listValores.lstmodulos}">
                                                <option value = "${modelos.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CCLAGD && modelos.CATRIBU == __formdata.CCLAGD}">selected</c:if>>
                                                    ${modelos.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisagd003" c="TCLAGD" dejarHueco="false">
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
                            </axis:visible>
			    <!-- CONF-347-20161201-RCS - Ini -->
			    <axis:visible f="axisagd004" c="ICON_TGRUPO_PER">
				<img border="0" id="ICON_TGRUPO_PER" name="ICON_TGRUPO_PER"
				src="images/find.gif" value="1" onclick="f_abrir_axisper021()"
				style="cursor: pointer" />
			    </axis:visible>
			    <!-- CONF-347-20161201-RCS - Fin -->
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="CCONAPU" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "CCONAPU" id="CCONAPU" style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="CCONCEPTO" lit="9000715"/>"
                                        <axis:atr f="axisagd003" c="CCONAPU" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="conceptos" items="${__formdata.listValores.lstconcepto}">
                                                <option value = "${conceptos.CATRIBU}"
                                                    <c:if test="${conceptos.CATRIBU == __formdata.CCONAPU}">selected</c:if>>
                                                    ${conceptos.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                                  <axis:ocultar f="axisagd003" c="CESTAPU" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "CESTAPU" id="CESTAPU" style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="CESTAPU" lit="9001191"/>"
                                        <axis:atr f="axisagd003" c="CESTAPU" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="estados" items="${__formdata.listValores.lstestados}">
                                                <option value = "${estados.CATRIBU}"
                                                    <c:if test="${estados.CATRIBU == __formdata.CESTAPU}">selected</c:if>>
                                                    ${estados.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                 
                               
                            </tr>
                            <tr>
                            
                                <!-- Concepto Apunte -->
                                <axis:ocultar f="axisagd003" c="CTIPAPU" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisagd003" c="CTIPAPU" lit="9001195"/></b>
                                </td>
                                </axis:ocultar>
                               <axis:ocultar f="axisagd003" c="CGRUPO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisagd003" c="CGRUPO" lit="9001801"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="TGRUPO" dejarHueco="false">
                                <td class="titulocaja" id ="tit_TGRUPO">
                                    <b id="label_TGRUPO"><axis:alt f="axisagd003" c="TGRUPO" lit="9901656"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Fecha Alta -->
                                <axis:ocultar f="axisagd003" c="FRECORDATORIO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisagd003" c="FRECORDATORIO" lit="9901674"/></b>                                
                                </td>
                                </axis:ocultar>
                                <!-- Fecha Alta -->
                                <axis:ocultar f="axisagd003" c="FALTA" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisagd003" c="FALTA" lit="9001192"/></b>                                
                                </td>
                                </axis:ocultar>
                                <!-- Usuario -->
                                <axis:ocultar f="axisagd003" c="CUSUARI" dejarHueco="false">
                                <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                </axis:ocultar>
                                <axis:ocultar c="CHECKCUSUARI" f="axisagd003" dejarHueco="false">
                                </axis:ocultar>

                                <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                <axis:ocultar f="axisagd003" c="CAPUAGE" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisagd003" c="CAPUAGE" lit="9901437"/></b>  
                                </td>
                                </axis:ocultar>

                                </tr>
                                <tr>
                                   <axis:ocultar f="axisagd003" c="CTIPAPU" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "CTIPAPU" id="CTIPAPU" style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="CTIPAPU" lit="9001195"/>"
                                        <axis:atr f="axisagd003" c="CTIPAPU" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="tipos" items="${__formdata.listValores.lsttipos}">
                                                <option value = "${tipos.CATRIBU}"
                                                    <c:if test="${tipos.CATRIBU == __formdata.CTIPAPU}">selected</c:if>>
                                                    ${tipos.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                    <axis:ocultar f="axisagd003" c="CGRUPO" dejarHueco="false"> 
                                    <td class="campocaja" >
                                        <select name = "CGRUPO" id="CGRUPO" onchange="f_cargar_valores_grupo(this.value);" style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="CGRUPO" lit="9001801"/>"
                                        <axis:atr f="axisagd003" c="CGRUPO" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="grupos" items="${__formdata.listValores.lstgrupos}">
                                                <option value = "${grupos.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CGRUPO && grupos.CATRIBU == __formdata.CGRUPO}">selected</c:if>>
                                                    ${grupos.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisagd003" c="TGRUPO" dejarHueco="false">
                                <td class="campocaja" id ="td_TGRUPO">
                                   <select name = "TGRUPO" id="TGRUPO"  style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="TGRUPO" lit="9901656"/>"
                                    <axis:atr f="axisagd003" c="TGRUPO" a="modificable=true&isInputText=false"/> 
                                    class="campowidthselect campo campotexto">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                        <c:forEach var="grupos" items="${__formdata.listValores.lstvaloresgrupos}">
                                            <option value = "${grupos.CVALOR}"
                                                <c:if test="${grupos.CVALOR == __formdata.TGRUPO}">selected</c:if>>
                                                ${grupos.TVALOR}
                                            </option>
                                        </c:forEach>
                                    </select>                                        
                                </td>
                                </axis:ocultar>
                                <axis:ocultar c="FRECORDATORIO" f="axisagd003" dejarHueco="false">
                                    <td class="campocaja">
                                         <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                                         id="FRECORDATORIO" name="FRECORDATORIO" title="<axis:alt f="axisagd003" c="FALTA" lit="9001192"/>" size="15" 
                                         onchange="javascript:f_formatdate(this,'')"
                                         value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FRECORDATORIO}'/>" 
                                         <axis:atr f="axisagd003" c="FRECORDATORIO" a="modificable=true&formato=fecha"/> />
                                         <a id="icon_FRECORDATORIO" style="vertical-align:middle;" href="#">
                                         <img id="popup_calendario_FRECORDATORIO" border="0"  src="images/calendar.gif"/>
                                         </a>
                                    </td>
                                </axis:ocultar>  
                                   <axis:ocultar c="FALTA" f="axisagd003" dejarHueco="false">
                                    <td class="campocaja">
                                         <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                                         id="FALTA" name="FALTA" title="<axis:alt f="axisagd003" c="FALTA" lit="9001192"/>" size="15" 
                                         onchange="javascript:f_formatdate(this,'')"
                                         value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FALTA}'/>" 
                                         <axis:atr f="axisagd003" c="FALTA" a="modificable=true&formato=fecha"/> />
                                         <a id="icon_FALTA" style="vertical-align:middle;" href="#">
                                         <img id="popup_calendario_FALTA" border="0"  src="images/calendar.gif"/>
                                         </a>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisagd003" c="CUSUARI" dejarHueco="false"> 
                                </axis:ocultar>
                                <axis:ocultar c="CHECKCUSUARI" f="axisagd003" dejarHueco="false">
                                </axis:ocultar>
                                
                                <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                <axis:ocultar f="axisagd003" c="CAPUAGE" dejarHueco="false"> 
                                    <td class="campocaja" >
                                        <select name = "CAPUAGE" id="CAPUAGE" style="width:95%;" size="1"  title="<axis:alt f="axisagd003" c="CAPUAGE" lit="9901437"/>"
                                        <axis:atr f="axisagd003" c="CAPUAGE" a="modificable=true&isInputText=false"/> 
                                        class="campowidthselect campo campotexto">
                                            <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd003" lit="108341"/> - </option>
                                            <c:forEach var="CAPUAGES" items="${__formdata.listValores.lstapuage}">
                                                <option value = "${CAPUAGES.CATRIBU}"
                                                    <c:if test="${!empty __formdata.CAPUAGE && CAPUAGES.CATRIBU == __formdata.CAPUAGE}">selected</c:if>>
                                                    ${CAPUAGES.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar> 
                                
                            </tr>
                        </table>
                       <jsp:useBean id="today" class="java.util.Date" /> 
                       <axis:visible f="axisagd003" c="DSP_AGENDA">
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisagd003" c="NAPUNTE" lit="9001189" /></c:set>
                            <c:set var="title2"><axis:alt c="CCLAGD" f="axisagd003" lit="9901654"/></c:set>
                            <c:set var="title3"><axis:alt f="axisagd003" c="CCONAPU" lit="9000715"/></c:set>                           
                            <c:set var="title4"><axis:alt f="axisagd003" c="CTIPAPU" lit="9001195"/></c:set>
                            <c:set var="title5"><axis:alt f="axisagd003" c="FALTA" lit="9001192"/></c:set>
                            <c:set var="title6"><axis:alt f="axisagd003" c="TITULO" lit="100785"/></c:set>
                            <c:set var="title7"><axis:alt f="axisagd003" c="CUSUARI" lit="9902245"/></c:set> 
                            <c:set var="title8"><axis:alt f="axisagd003" c="CGRUPO" lit="9001801"/></c:set>
                            <c:set var="title9"><axis:alt f="axisagd003" c="CESTAPU" lit="9001191"/></c:set>
                            <c:set var="title10"><axis:alt f="axisagd003" c="FRECORDATORIO" lit="9901674"/></c:set>
                            <c:set var="title12"><axis:alt f="axisagd003" c="FESTADO" lit="9000450"/></c:set>
                             <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
                            <c:set var="title13"><axis:alt f="axisagd003" c="TITTAPU1" lit="9001196"/></c:set>
                            <c:set var="title14"><axis:alt f="axisagd003" c="FALTA1" lit="9001192"/></c:set>
                             <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
                            <c:set var="title15"><axis:alt f="axisagd003" c="TAPUNTE" lit="9001197"/></c:set>
                            <!-- Bug 0017744 - 25/02/2011 - JMF -->
                            <c:set var="title11"><axis:alt f="axisagd003" c="CUSUARI_REG" lit="9902246"/></c:set>

                            <div class="seccion displayspaceGrande" id="TRANSF">
                           
                                <display:table name="${__formdata.resultagenda}" id="miListaId" export="false" class="dsptgtable" pagesize="-1"  defaultorder="ascending" requestURI="axis_axisagd003.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axisagd003" c="IDAPUNTE">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 8 -->
                                    <display:column title="${title1}" sortable="true" sortProperty="IDAPUNTE" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaId['IDAPUNTE']}</div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisagd003" c="CCLAGD">
                                    <!-- Bug 0017744 - 25/02/2011 - JMF tamany 15 -->
                                    <display:column title="${title2}" sortable="true" sortProperty="CCLAGDx" headerClass="sortable fixed"  media="html" autolink="false" >    
                                        <div class="dspNumber">
                                            <c:if test="${!empty miListaId['DESTCLAGD']}">
                                                ${miListaId['DESTCLAGD']} - ${miListaId['TCLAGD_OUT']}
                                            </c:if>
                                        </div>
                                            
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisagd003" c="CCONAPU">
                                    <display:column title="${title3}" sortable="true" sortProperty="TCONAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TCONAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    
                                    <!--INI Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisagd003" c="TITTAPU1">
                                    <display:column title="${title13}" sortable="true" sortProperty="TITTAPU1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TTITAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                   
                                    <axis:visible f="axisagd003" c="FALTA1">
                                    <display:column title="${title14}" sortable="true" sortProperty="FALTA1" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FALTA']}"/>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    <!--FIN Bug 0036507 - 06/10/2015 - KJSC -->
                                    <axis:visible f="axisagd003" c="CUSUARI_REG">
                                    <display:column title="${title7}" sortable="true" sortProperty="CUSUARI_REG" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TORIGEN']}<c:if test="${!empty miListaId['TUSUORIDESC']}"> - ${miListaId['TUSUORIDESC']}</c:if></div>
                                    </display:column>
                                    </axis:visible>

                                    <!-- Bug 0017744 - 25/02/2011 - JMF -->
                                    <axis:visible f="axisagd003" c="CUSUARI_ASI">
                                    <display:column title="${title11}" sortable="true" sortProperty="CUSUARI_ASI" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TDESTINO']} - ${miListaId['TDESCGRUPO']}</div>
                                    </display:column>
                                    </axis:visible>

                                    <axis:visible f="axisagd003" c="CTIPAPU">
                                    <display:column title="${title4}" sortable="true" sortProperty="TTIPAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">${miListaId['TTIPAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                     <axis:visible f="axisagd003" c="FESTAPU">
                                    <display:column title="${title12}" sortable="true" sortProperty="FESTAPU" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                       
                                        
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FESTAPU']}"/>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisagd003" c="FRECOR">
                                    <display:column title="${title10}" sortable="true" sortProperty="FRECORDATORIO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                         <c:set var="color">
                                                        <c:choose>
                                                            <c:when test="${axis:compararFechas(miListaId['FRECORDATORIO'],today)<0}">
                                                                red
                                                            </c:when>
                                                            <c:otherwise>
                                                                black
                                                               </c:otherwise>
                                                        </c:choose>
                                                    </c:set>
                                        
                                         <font color = "${color}"><fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FRECORDATORIO']}"/></font>
                                       </div>
                                    </display:column>
                                    </axis:visible>
                                   
                                    <axis:visible f="axisagd003" c="CGRUPO_DSP">
                                    <display:column title="${title8}" sortable="true" sortProperty="CGRUPO" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspText">
                                            <c:if test="${!empty miListaId['TLISTGRUPO']}">
                                                ${miListaId['TLISTGRUPO']}
                                            </c:if>
                                            <c:if test="${!empty miListaId['DESTGRUPO']}">
                                                <c:if test="${!empty miListaId['TLISTGRUPO']}">-</c:if>
                                            </c:if>
                                            <c:if test="${!empty miListaId['DESTGRUPO']}">
                                                ${miListaId['DESTGRUPO']} 
                                            </c:if>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisagd003" c="CESTAPU">
                                    <display:column title="${title9}" sortable="true" sortProperty="TESTAPU" headerClass="sortable fixed" media="html" autolink="false" >
                                        <div class="dspText">${miListaId['TESTAPU']}</div>
                                    </display:column>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisagd003" c="TAPUNTE">
                                    <display:column title="${title15}" 
                                                    sortable="true" 
                                                    sortProperty="TAPUNTE" 
                                                    headerClass="sortable fixed" 
                                                    media="html" 
                                                    autolink="false" >
                                    <div class="dspText">
                                        ${miListaId['TAPUNTE']}
                                    </div>
                                    </display:column>
                                    </axis:visible>
                                    
                                      <axis:visible f="axisagd003" c="BT_EDITAR">
                                    <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspIcons" >
                                        <img border="0" alt="<axis:alt c="BT_EDITAR" f="axisagd003" lit="1000113"/>" title1="<axis:alt c="BT_EDITAR" f="axisagd003" lit="1000113"/>" src="images/lapiz.gif" width="16px" height="16px"
                                        style="cursor:pointer;" onClick="javascript:f_seleccionar('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}')" />
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    
                                     <axis:visible f="axisagd003" c="BT_CONSULTAR">
                                    <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html"  autolink="false" >
                                        <div class="dspIcons" >
                                        <img border="0" alt="<axis:alt c="BT_CONSULTAR" f="axisagd003" lit="1000113"/>" title1="<axis:alt c="BT_CONSULTAR" f="axisagd003" lit="1000113"/>" src="images/informacion.gif" width="12px" height="12px"
                                        style="cursor:pointer;" onClick="javascript:f_seleccionar('${miListaId['IDAPUNTE']}','${miListaId['IDAGENDA']}')" />
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                    
                        
                            <axis:visible f="axisagd003" c="BT_MASDATOS_AGENDA">
                                <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html"  autolink="false" >
                                    <div class="dspIcons">
                                    	<img border="0" alt="<axis:alt c="BT_MASDATOS_AGENDA" f="axisagd003" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_AGENDA" f="axisagd003" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                 			style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_A${miListaId['IDAPUNTE']}')"  onmouseover="javascript:mostrar('SECCION_A${miListaId['IDAPUNTE']}','TRANSF')"  /></div>
                                </display:column>   
                            </axis:visible>
                                <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                
                                <display:column class="seccion_informacion">
                                <div id="SECCION_A${miListaId['IDAPUNTE']}" class="seccion_informacion">
                                    <!-- INICIO SECCION -->
                                   
    
                                    <table class="area" align="center">
                                         <tr>
                                            <th style="width:50%;height:0px"></th>
                                            <th style="width:50%;height:0px"></th>
                                            
                                         </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title5}</b>
                                            </td>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title7}</b>
                                            </td>
                                        </tr>
                                         <tr>
                                      
                                      
                                      
                                          <axis:visible f="axisagd003" c="FALTA">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="FALTA_" name="FALTA_" size="15" style="width:90%"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" 
                                                        value="${miListaId['FALTA']}"/>" readonly="readonly"/>
    
                                            </td>
                                          </axis:visible>
                                          <axis:visible f="axisagd003" c="CUSUARI_MD">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="CUSUARI_MD" name="CUSUARI_MD" size="15" style="width:90%"
                                                value="${miListaId['CUSUARI']}" readonly="readonly"/>
                                              
                                              </td>
                                          </axis:visible>
                                            
                                        </tr>
                                         <tr>
                                            <%-- Campo 1 --%>
                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                <b>${title6}</b>
                                            </td>
                                        </tr>
                                        <tr>
                                      
                                      
                                      
                                          <axis:visible f="axisagd003" c="TITTAPU">
                                            <%-- Campo 1 --%>
                                              <td class="campocaja" colspan="2" style="background-color:white;border-right-width: 0px;">
                                                <input type="text" class="campo campotexto" id="TITTAPU__" name="TITTAPU__" size="15" style="width:90%"
                                                value="${miListaId['TTITAPU']}" readonly="readonly"/>
    
                                            </td>
                                          </axis:visible>
                                            
                                            
                                        </tr>
                                        </table>
    
    
                                </div>
                            </display:column>
                                    </display:table>
                                </div>
                         </axis:visible>
                    </td>
                </tr>
            </table>
    
     </form>
    
    
        <!-- Inicio. Sólo si vamos a tener un campo fecha !-->
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FALTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FALTA", 
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
           <c:param name="f">axisagd003</c:param>
            <c:param name="__botones"><axis:ocultar f="axisagd003" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisagd003" c = "BT_BUSCAR" dejarHueco="false">,buscar</axis:ocultar><axis:ocultar f="axisagd003" c = "BT_NUEVO" dejarHueco="false">,nuevo</axis:ocultar>  </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


