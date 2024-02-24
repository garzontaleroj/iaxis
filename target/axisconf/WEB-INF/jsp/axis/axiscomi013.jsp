<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axiscomi013.jsp
*  Fecha: 04/09/2012
*/
%>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>
      <axis:alt f="axiscomi013" c="LIT_TITULO" lit="100905"/>
    </title>
    <%-- CONSULTA DE RECIBOS--%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    <%-- Inicio Sólo si vamos a tener un campo fecha --%>
    <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all"
          href="styles/calendar-green.css" title="green"/>
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript"
            src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
    <%-- fin Sólo si vamos a tener un campo fecha--%>
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {  
           
            var idconv = "${__formdata.IDCONVENIO}";
            var modo = "${__formdata.MODO}";
          
            if (objUtiles.estaVacio(idconv) && modo == 'null'  ) {
               f_but_buscar();
            }
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscomi013", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            document.miForm.TFILE.value = '';
            document.miForm.TFILE_CARTAS.value = '';
            f_abrir_modal('axiscomi014');
        }
        
        function f_aceptar_axiscomi014(SSEGURO,SRECREN){
            f_cerrar_modal('axiscomi014');
        }

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
            if (cual == 'axiscomi014')
                document.miForm.MODO.value = 'NUEVO';
        }
           
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm037')
                objUtiles.ejecutarFormulario("axis_axiscomi013.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada())
             objUtiles.ejecutarFormulario("axis_axiscomi013.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        // INI IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el asegurado
        function f_but_almacenar(){
            objUtiles.ejecutarFormulario("axis_axiscomi013.do", "almacenar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        // FIN IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el asegurado
        
        // INI IAXIS 4081 AABG: Se crea funcion para eliminar y editar tasa-prima un asegurado temporal
        function f_borrar_asegurado(NNUMIDE, obj){
            var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){
                objDom.setValorPorId("NNUMIDE", NNUMIDE);
                 objUtiles.ejecutarFormulario("axis_axiscomi013.do", "f_borrar_asegurado", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }                               
        }
        
        function f_asociar_tasa_garantia(SPRODUC, TPRODUC, obj){
            objUtiles.abrirModal("axiscomi021", "src", "modal_axiscomi021.do?operation=form&SPRODUC="+SPRODUC+"&TPRODUC="+TPRODUC+"&DONDE=AXISCOMI021");
        } 
        // FIN IAXIS 4081 AABG: Se crea funcion para eliminar y editar tasa-prima un asegurado temporal
        
        /* *************************************************************************************************** */
        /* ***************************************** FUNCIONES PAGINA **************************************** */
        /* *************************************************************************************************** */
        
        function f_alta_convenio(){          
            var IDCONVENIO=null;
            var MODO="NUEVO";
            //alert("aqui 2");
            f_cerrar_modal('axiscomi014');
            document.miForm.MODO.value = 'NUEVO';
            document.miForm.IDCONVENIO.value ="";// null;    
         // FIN IAXIS 4081 AABG: Se agregar attr para limpiar o no variables de sesion
            objUtiles.ejecutarFormulario("axis_axiscomi013.do?borrarinfo=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
         // FIN IAXIS 4081 AABG: Se agregar attr para limpiar o no variables de sesion
        }
        
        function f_editar_productos(){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var PIDCONVCOMESP = document.miForm.IDCONVENIO.value; 
              var CRAMO = document.miForm.CRAMO.value;
              //alert("valor CRAMO= "+CRAMO+"**");
              objUtiles.abrirModal('axiscomi015', "src", "modal_axiscomi015.do?operation=form&PIDCONVCOMESP=" + PIDCONVCOMESP+"&origen=axiscomi013&CRAMO="+CRAMO);  
        }
        
        function f_editar_convenio(IDCONVENIO){
             document.miForm.IDCONVENIO.value=IDCONVENIO;
             f_cerrar_modal('axiscomi014');
             document.miForm.MODO.value = 'MODIFICAR';
             objUtiles.ejecutarFormulario("axis_axiscomi013.do?borrarinfo=1", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
        function f_aceptar_axiscomi015(LISTAPRODUCTOS){
             f_cerrar_modal('axiscomi015');
             objUtiles.ejecutarFormulario("axis_axiscomi013.do?LISTAPRODUCTOS="+LISTAPRODUCTOS+"&RECPROD=RECARGAR&NoRecargarLstComi=true", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisper021 () {
              //alert("dddd");
              var SSEGURO = "${__formdata.SSEGURO}";
              var CAGENTE = "${__formdata.CAGENTE}";
              //alert(CAGENTE+"*****"+SSEGURO);
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO+"&DONDE=AXISCOMI013");
      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }   
      
      function f_cerrar_axisper021(){
         f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
            //alert("NOVA PERSONA: ");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE}";
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
        //document.miForm.SPERSON.value = SPERSON;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("axis_axiscomi013.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }
      
      function callbackAjaxActualitzaPersona (ajaxResponseText) {
          try{
             //alert(ajaxResponseText+"*************");
              var doc = objAjax.domParse(ajaxResponseText);
      
              if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                   //alert("antes");
                   objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   //var VALIDA_TNOMBRE = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE1")[0]));
                   var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                   var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                   var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                   objDom.setValorPorId("TDESCRI", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
                   objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                   
                   //objDom.setValorPorId("TNOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0)); -- TASK EDSS 72
                   objDom.setValorPorId("TNOMBRE", NOMBRE);
                   objDom.setValorPorId("TAPELLI1", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0));
                   objDom.setValorPorId("TAPELLI2", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0));
      
              }          
           
          }catch(e){}
          }   
            
            function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form&CONDICION=NUEVA_PRODUCCION_ACTIVO");
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axiscomi013.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axiscomi013.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
            "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO), this, objJsMessages.jslit_cargando);
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
            }
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
        
        function f_insertval(PCCOMISI,PCMODCOM){
           //alert("PCCOMISI"+PCCOMISI);
            if (!objUtiles.estaVacio(PCCOMISI)){
                var PCCOMISIformateado=objNumero.formateaNumero(PCCOMISI, true);
                var numericoPCCOMISI=hacerNumerico(PCCOMISIformateado);
                //alert("numericoPCCOMISI:"+numericoPCCOMISI)
                if(0 < numericoPCCOMISI && numericoPCCOMISI < 100)
                    objAjax.invokeAsyncCGI("axis_axiscomi013.do", callbackAjaxInsertPor, "operation=ajax_insertpor&PCCOMISI="+PCCOMISIformateado+"&PCMODCOM="+PCMODCOM, this);
                else
                    alert("<axis:alt f="axiscoa004" c="LIT_1000390" lit="1000390"/>");
                

            }
            
   
           /*           if (!objUtiles.estaVacio(PCCOMISI)){
           var numericoPCCOMISI=funcion(PCCOMISI);
            if(0 < numericoPCCOMISI && numericoPCCOMISI < 100)
                objAjax.invokeAsyncCGI("axis_axiscomi013.do", callbackAjaxInsertPor, "operation=ajax_insertpor&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM, this);
            else
                alert("<axis:alt f="axiscoa004" c="LIT_1000390" lit="1000390"/>");
           }
           else*/
//                objAjax.invokeAsyncCGI("axis_axiscomi013.do", callbackAjaxInsertPor, "operation=ajax_insertpor&PCCOMISI="+PCCOMISI+"&PCMODCOM="+PCMODCOM, this);
        }
        
        function callbackAjaxInsertPor(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
        }
        
        
 function hacerNumerico(miDato) {
 //alert("miDato"+miDato)
   var miDatoStripped=objNumero.stripNonNumeric(miDato);
    //alert("miDatoStripped"+miDatoStripped)

   if (miDatoStripped.indexOf(objNumero.getSeparadorDecimales())>=0) { //separador decimal ha sido una ",", hay q cambiarlo a un punto
       miDatoStripped=objNumero.cambiarSeparadorDecimalesPorMiles(miDatoStripped);
   }
   return (eval(miDatoStripped));
  }        
    </script>
  </head>
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}"
        onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><form name="miForm" action="" method="POST">
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="LIT_PANTALLA" lit="9904822"/>
        </c:param>
        <%-- Gestión de devoluciones--%>
        <c:param name="formulario">
          <axis:alt f="axiscomi013" c="LIT_FORMULARIO" lit="9904822"/>
        </c:param>
        <%-- Gestión de devoluciones--%>
        <c:param name="form">axiscomi013</c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="LIT_MODAL_axiscomi014" lit=""/>
        </c:param>
        <c:param name="nid" value="axiscomi014"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="LIT_MODAL_axiscomi015" lit=""/>
        </c:param>
        <c:param name="nid" value="axiscomi015"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="TIT_PAGE" lit="9904266"/>
        </c:param>
        <c:param name="nid" value="axisctr014"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="PERSONAS" lit="102073"/>
        </c:param>
        <c:param name="nid">axisper021</c:param>
      </c:import>
      <%-- INI IAXIS 4081 AABG: Se referencia la nueva modal para tasa--%>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi021" c="TASA" lit="9901974"/>
        </c:param>
        <c:param name="nid">axiscomi021</c:param>
      </c:import>
      <%-- FIN IAXIS 4081 AABG: Se referencia la nueva modal para tasa--%>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi013" c="PERSONAS" lit="102073"/>
        </c:param>
        <c:param name="nid">axisper022</c:param>
      </c:import>
      <input type="hidden" name="operation" value=""/>
      <input type="hidden" name="SDEVOLU" id="SDEVOLU"
             value="${__formdata.SDEVOLU}"/>
      <input type="hidden" name="SSEGURO" id="SSEGURO"
             value="${__formdata.SSEGURO}"/>
      <input type="hidden" name="CAGENTE" id="CAGENTE"
             value="${__formdata.CAGENTE}"/>
      <%-- <input type="hidden" name="IDCONVENIO" id="IDCONVENIO"
           value="${__formdata.IDCONVENIO}"/>--%>
      <input type="hidden" name="TFILE" id="TFILE" value="${__formdata.TFILE}"/>
      <input type="hidden" name="TFILE_CARTAS" id="TFILE_CARTAS"
             value="${__formdata.TFILE_CARTAS}"/>
      <input type="hidden" name="ORIGEN" id="ORIGEN" value=""></input>
      <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value=""></input>
      <input type="hidden" name="SNIP" id="SNIP" value=""></input>
      <input type="hidden" name="SPERSON" id="SPERSON"
             value="${__formdata.SPERSON}"></input>
      <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"></input>
      <input type="hidden" name="TNOMBRE" id="TNOMBRE"
             value="${__formdata.TNOMBRE}"></input>
      <input type="hidden" name="TAPELLI1" id="TAPELLI1"
             value="${__formdata.TAPELLI1}"></input>
      <input type="hidden" name="TAPELLI2" id="TAPELLI2"
             value="${__formdata.TAPELLI2}"></input>
             
      <div class="separador">&nbsp;</div>
      <table class="mainTableDimensions base" align="center" cellpadding="0"
             cellspacing="0">
        <tr>
          <td>
            <div class="titulo">
              <img src="images/flecha.gif"/><axis:alt f="axiscomi013"
                                                      c="LIT_IMG_1"
                                                      lit="9904848"/>
               
              <img id="find" border="0" src="images/find.gif"
                   alt='<axis:alt f="axiscomi013" c="LIT_IMG_2" lit="100797" />'
                   onclick="f_but_buscar();" style="cursor:pointer"/>
            </div>
            <!-- ************************************************** SECCION CABECERA ***************************************************** -->
            <table class="seccion">
              <tr>
                <td>
                  <!-- Área 1 -->
                  <table class="area" align="center">
                    <tr>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                    </tr>
                    <tr>
                      <!-- Póliza -->
                      <axis:visible f="axiscomi013" c="IDCONVENIO">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi013" c="LIT_IDCONVENIO"
                                       lit="109155"/></b>
                        </td>
                      </axis:visible>
                      <!-- Certificado -->
                      <axis:visible f="axiscomi013" c="TDESCONV">
                        <td class="titulocaja" colspan="3">
                          <b><axis:alt f="axiscomi013" c="LIT_TDESCONV"
                                       lit="100588"/></b>
                        </td>
                      </axis:visible>
                    </tr>
                    <tr>
                      <axis:visible f="axiscomi013" c="IDCONVENIO">
                        <td class="campocaja">
                          <input style="width:90%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="IDCONVENIO" name="IDCONVENIO" size="15"
                                 value="${__formdata.IDCONVENIO}"
                                 <axis:atr f="axiscomi013" c="IDCONVENIO" a="modificable=false&obligatorio=true"/>/>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi013" c="TDESCONV">
                        <td class="campocaja" colspan="3">
                          <input style="width:98%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="TDESCONV" name="TDESCONV" size="15"
                                 value="${__formdata.TDESCONV}"
                                 title='<axis:alt f="axiscomi013" c="x" lit="100588"/>'
                                 <axis:atr f="axiscomi013" c="TDESCONV" a="modificable=true&obligatorio=true"/>/>
                        </td>
                      </axis:visible>
                    </tr>
                    <tr>
                      <axis:visible f="axiscomi013" c="FINIVIG">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi013" c="LIT_FINIVIG"
                                       lit="9000716"/></b>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi013" c="FFINVIG">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi013" c="LIT_FFINVIG"
                                       lit="9000717"/></b>
                        </td>
                      </axis:visible>
                      <td class="titulocaja">
                          <b><axis:alt f="axiscomi013" c="LIT_CUSUALT"
                                       lit="9905522"/></b>
                      </td>
                    </tr>
                    <tr>
                      <axis:visible f="axiscomi013" c="FINIVIG">
                        <td class="campocaja">
                          <input style="width:60%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="FINIVIG" name="FINIVIG" size="15"
                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>'
                                 title='<axis:alt f="axiscomi013" c="x" lit="9000716"/>'
                                 <axis:atr f="axiscomi013" c="FINIVIG" a="modificable=true&formato=fecha&obligatorio=true"/>/>
                          <a id="icon_FINIVIG" style="vertical-align:middle;"
                             href="#">
                            <img border="0"
                                 alt='<axis:alt f="axiscomi013" c="ddd" lit="9000716" />'
                                 title='<axis:alt f="axiscomi013" c="x1" lit="9000716" />'
                                 src="images/calendar.gif"/>
                          </a>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi013" c="FFINVIG">
                        <td class="campocaja">
                          <input style="width:60%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="FFINVIG" name="FFINVIG" size="15"
                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>'
                                 title='<axis:alt f="axiscomi013" c="x" lit="9000717"/>'
                                 <axis:atr f="axiscomi013" c="FFINVIG" a="modificable=true&formato=fecha&obligatorio=false"/>/>
                          <a id="icon_FFINVIG" style="vertical-align:middle;"
                             href="#">
                            <img border="0"
                                 alt='<axis:alt f="axiscomi013" c="ddd" lit="9000717" />'
                                 title='<axis:alt f="axiscomi013" c="x1" lit="9000717" />'
                                 src="images/calendar.gif"/>
                          </a>
                        </td>
                      </axis:visible>
                      <td>
                        <input style="width:60%" type="text"
                         class="campowidthinput campo campotexto"
                         id="CUSUALT" name="CUSUALT" size="20"
                         value="${__formdata.CUSUALT}"
                         title='<axis:alt f="axiscomi013" c="CUSUALT" lit="9905522"/>'
                         <axis:atr f="axiscomi013" c="CUSUALT" a="modificable=false"/>/>
                      </td>    
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><axis:alt f="axisret005" c="CAGENTE_TEXT"
                                     lit="9902363"/></b>
                        <%-- Intermediario--%>
                      </td>
                      <td class="titulocaja" colspan="3">
                        <b><axis:alt f="axisret005" c="NOMBRE_TEXT"
                                     lit="100588"/>&nbsp;<axis:alt f="axisret005"
                                                                   c="INTERMED_D"
                                                                   lit="9902363"/></b>
                        <%-- Descripción Intermediario--%>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT"
                               style="width:65%;" value="${__formdata.CAGENTE}"
                               class="campowidthinput campo campotexto"
                               title='<axis:alt f="axisret005" c="CAGENTE_TEXT" lit="9902363"/>'
                               <axis:atr f="axisctr001" c="CAGENTE" a="modificable=true&obligatorio=true"/>
                               onchange="f_actualizar_agente()"/>
                        <img border="0" src="images/find.gif"
                             onclick="f_abrir_axisctr014()"
                             style="cursor:pointer"/>
                        &nbsp;&nbsp;&nbsp;
                      </td>
                      <td class="campocaja" colspan="3">
                        <input readonly="true" type="text" style="width:50%;"
                               name="NOMBRE_TEXT" id="NOMBRE_TEXT"
                               value="${__formdata.NOMBRE_TEXT}"
                               class="campowidthinput campo campotexto"/>
                      </td>
                      <td class="titulocaja">&nbsp;</td>
                    </tr>
                    <tr>
                      <!-- Codigo -->
                      <axis:ocultar f="axiscomi013" c="NNUMIDE"  dejarHueco="false">
                          <td class="titulocaja">
                            <b id="label_NNUMIDE"><axis:alt f="axiscomi013" c="NNUMIDE" lit="109360"/></b>
                          </td>
                      </axis:ocultar>
                      <td class="titulocaja">
                        <b><axis:alt f="axiscomi013" c="DESCRIPCION" lit=""/></b>
                      </td>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscomi013" c="NNUMIDE"
                                    dejarHueco="false">
                        <!-- TODO C -->
                        <td class="campocaja">
                          <input type="text"
                                 class="campowidthinput campo campotexto"
                                 value="${__formdata.NNUMIDE}" name="NNUMIDE"
                                 id="NNUMIDE" style="width:65%"
                                 title='<axis:alt f="axiscomi013" c="NNUMIDE" lit="109360" />'
                                 <axis:atr f="axiscomi013" c="NNUMIDE" a="modificable=false&obligatorio=false"/>
                                 onchange=""/>
                          <img border="0" src="images/find.gif"
                               onclick="f_abrir_axisper021()"
                               style="cursor:pointer"/>
                        </td>
                        <td class="titulocaja" colspan="2">
                          <input type="text" class="campo campotexto"
                                 value="${__formdata.TNOMBRE} ${__formdata.TAPELLI1} ${__formdata.TAPELLI2}"
                                 name="TDESCRI" id="TDESCRI"
                                 style="width:100%" readonly="true"
                                 title='<axis:alt f="axiscomi013" c="TDESCRI" lit="109360"/>'/>
                        </td>
                        <!--INI IAXIS 4081 AABG: Se agrega boton para agregar temporalmente el asegurado  -->
                        <td>
                            <a id="icon_ADD_ASEGURADO" style="vertical-align:middle;" onclick="f_but_almacenar()"
                                 href="#">
                                <img border="0"
                                     alt='<axis:alt f="axiscomi013" c="ddd" lit="1000081" />'
                                     title='<axis:alt f="axiscomi013" c="x1" lit="1000081" />'
                                     src="images/formulap.gif"/>
                              </a>
                        </td>
                        <!--FIN IAXIS 4081 AABG: Se agrega boton para agregar temporalmente el asegurado  -->
                      </axis:ocultar>
                    </tr>
                    
                    <!--INI IAXIS XXXX BJHB: ANEXO DE LA ACTIVIDAD A LOS CONVENIOS 19-04-2022-->
                    <tr>
                      <axis:ocultar f="axiscomi013" c="CACTIVI"  dejarHueco="false">
                          <td class="titulocaja">
                            <b id="label_CACTIVI"><axis:alt f="axiscomi013" c="CACTIVI" lit="103481"/></b>
                          </td>
                      </axis:ocultar>
                    </tr>
                    <tr>
                      <axis:ocultar f="axiscomi013" c="CACTIVI"  dejarHueco="false">
                          <td class="campocaja">
                                <select name="CACTIVI" id ="CACTIVI" size="1" onchange="" class="campowidthselect campo campotexto" 
                                <axis:atr f="axiscomi013" c="CACTIVI" a="modificable=true&obligatorio=true"/>
                                title='<axis:alt f="axiscomi013" c="x" lit="103481"/>'> 
                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr019" c="BLANCO" lit="108341" /> - </option>
                                    <option value = "2" <c:if test="${__formdata.CACTIVI == '2'}">selected</c:if>><axis:alt f="axisctr019" c="BLANCO" lit="89908167" /></option>
                                    <option value = "1" <c:if test="${__formdata.CACTIVI == '1'}">selected</c:if>><axis:alt f="axisctr019" c="BLANCO" lit="89908168" /></option>
                                    <option value = "3" <c:if test="${__formdata.CACTIVI == '3'}">selected</c:if>><axis:alt f="axisctr019" c="BLANCO" lit="89908169" /></option>
                                </select>
                          </td>
                      </axis:ocultar>
                    </tr>
                    <!--FIN IAXIS XXXX BJHB: ANEXO DE LA ACTIVIDAD A LOS CONVENIOS -->
                  </table>
                </td>
              </tr>
              <%-- </table>--%>
              <!-- ************************************************** SECCION DATOS ********************************************************* -->
              <%-- <div class="titulo"> <img src="images/flecha.gif"/><axis:alt
                   f="axiscomi013" c="LIT_IMG_DAT" lit="9904268" /> </div>
                   <table class="seccion" >--%>
              <tr>
                <td>
                  <!-- Área 1 -->
                  <table class="area" align="center">
                    <tr>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                      <th style="width:20%;height:0px">
                        &nbsp;
                      </th>
                    </tr>
                    <tr>
                      <td class="campocaja" colspan="2">
                        <input style="width:50%" type="hidden"
                               class="campowidthinput campo campotexto"
                               id="TRAMO" name="TRAMO" size="15"
                               value="${__formdata.TRAMO}"
                               title='<axis:alt f="axiscomi013" c="ALT_TRAMO" lit="100885"/>'
                               <axis:atr f="axiscomi013" c="TRAMO" a="modificable=false"/>/>
                        <input style="width:50%" type="hidden"
                               class="campowidthinput campo campotexto"
                               id="CRAMO" name="CRAMO" size="15"
                               value="${__formdata.CRAMO}"
                               title='<axis:alt f="axiscomi013" c="ALT_CRAMO" lit="100885"/>'
                               <axis:atr f="axiscomi013" c="CRAMO" a="modificable=false"/>/>
                      </td>
                    </tr>
                    <!-- <div style="float:right;" id="DATOS_PRODUCTOS"><img id="DSP_PRODUCTOS_parent" src="images/lapiz.gif" onclick="f_editar_productos()" style="cursor:pointer"/></div>  -->
                    <!-- ************************************************************************************************************* -->
                    <!-- ************************************   LISTA INTERMEDIARIOS  ************************************************ -->
                    <!-- ************************************************************************************************************* -->
                    
                    <!-- INI IAXIS 4081 AABG: Tabla temporal para tomadores -->
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi014" c="LIT_ASEGURADOS"
                                       lit="100645"/></b>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" colspan="2">
                        <table border="0" class="area" align="left"
                               style="width:100%;">
                          <tr>
                            <td>
                              <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.axisctr_asegurados}"
                                               id="axisctr_asegurados" export="false"
                                               class="dsptgtable" pagesize="8"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0">
                                  <%@ include file="../include/displaytag.jsp"%>
                                      <display:column title="${title1}"
                                                     sortable="true"
                                                     sortProperty="NNUMIDE"
                                                     headerClass="sortable"
                                                     media="html"
                                                     autolink="false">
                                         <div class="dspText">
                                             ${axisctr_asegurados.OB_IAX_TOMADORES.NNUMIDE}
                                         </div>
                                     </display:column>
                                      <display:column title="${title2}"
                                                     sortable="true"
                                                     sortProperty="TNOMBRE"
                                                     headerClass="sortable"
                                                     media="html"
                                                     autolink="false">
                                         <div class="dspText">
                                             ${axisctr_asegurados.OB_IAX_TOMADORES.TAPELLI1}
                                             ${axisctr_asegurados.OB_IAX_TOMADORES.TAPELLI2}
                                             <c:if test="${!empty axisctr_asegurados.OB_IAX_TOMADORES.TNOMBRE}">,
                                             ${axisctr_asegurados.OB_IAX_TOMADORES.TNOMBRE}</c:if>
                                         </div>
                                     </display:column>
                                      <display:column title=""
                                                      headerClass="headwidth5 sortable"
                                                      media="html"
                                                      autolink="false">
                                          <div class="dspIcons">
                                              <a href="javascript:f_borrar_asegurado('${axisctr_asegurados.OB_IAX_TOMADORES.NNUMIDE}', this)">
                                                  <img border="0"
                                                       alt='<axis:alt f="${pantalla}" c="ICO_DEL_TOMADOR" lit="1000127" />'
                                                       title='<axis:alt f="${pantalla}" c="ICO_DEL_TOMADOR" lit="1000127" />'
                                                       src="images/delete.gif"/>
                                              </a>
                                          </div>
                                      </display:column>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>   
                     <tr>
                      <td>&nbsp;&nbsp;&nbsp;</td>
                    </tr>   
                    <!-- FIN IAXIS 4081 AABG: Tabla temporal para tomadores -->
                    
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi014" c="LIT_PRODUCTOS"
                                       lit="110916"/></b>
                        </div>
                        <div style="float:right;" id="DATOS_PROD">
                          <img id="DATOS_PROD_parent" src="images/lapiz.gif"
                               onclick="f_editar_productos()"
                               style="cursor:pointer"/>
                        </div>
                      </td>
                    </tr>
                    <!-- INI IAXIS 4081 AABG: Se agrega propiedad Editar para configurar la tasa de garantias -->
                    <!-- ************************************************************************************************************* -->
                    <!-- ************************************   LISTA PRODUCTOS  ************************************************ -->
                    <!-- ************************************************************************************************************* -->
                    <tr>
                      <td align="left" colspan="2">
                        <table border="0" class="area" align="left"
                               style="width:100%;">
                          <tr>
                            <td>
                              <c:set var="title0">
                                <axis:alt f="axiscomi014" c="LISTA_PRODUCTO"
                                          lit="9902909"/>
                              </c:set>
                              <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.LSTPRODUCTOS}"
                                               id="LSTPRODUCTOS" export="false"
                                               class="dsptgtable" pagesize="8"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               requestURI="axis_axiscomi013.do?paginar=true"
                                               sort="list" cellpadding="0"
                                               cellspacing="0">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title0}"
                                                  headerClass="sortable"
                                                  sortProperty="TPRODUC"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${LSTPRODUCTOS.TPRODUC}
                                    </div>
                                  </display:column>
                                  <display:column title=""
                                                      headerClass="headwidth5 sortable"
                                                      media="html"
                                                      autolink="false">
                                          <div class="dspIcons">
                                              <a href="javascript:f_asociar_tasa_garantia('${LSTPRODUCTOS.SPRODUC}', '${LSTPRODUCTOS.TPRODUC}', this)">
                                                  <img border="0"
                                                       alt='<axis:alt f="${pantalla}" c="ICO_EDIT_TASA" lit="100002" />'
                                                       title='<axis:alt f="${pantalla}" c="ICO_EDIT_TASA" lit="100002" />'
                                                       src="images/lapiz.gif"/>
                                              </a>
                                          </div>
                                  </display:column>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <!-- FIN IAXIS 4081 AABG: Se agrega propiedad Editar para configurar la tasa de garantias -->
                    <tr>
                      <td>&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <!-- ************************************************************************************************************* -->
                    <!-- ************************************   LISTA BENEFICIARIOS  ************************************************ -->
                    <!-- ************************************************************************************************************* -->
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi014" c="LISTA_NAME_BNF"
                                       lit="105048"/></b>
                        </div>
                      </td>                      
                    </tr>
                    <!-- titulo -->
                    <tr>
                      <td align="left" colspan="2">
                        <table border="0" class="area" align="left"
                               style="width:100%;">
                          <tr>
                            <td>
                              <c:set var="title0">
                                <axis:alt f="axiscomi014" c="LISTA_BENE"
                                          lit="1000372"/>
                              </c:set>
                              <c:set var="title1">
                                <axis:alt f="axiscomi014" c="LISTA_PORC"
                                          lit="101509"/>
                              </c:set>
                              <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.LTSCOMI}"
                                               id="miListaId3" export="false"
                                               class="dsptgtable" pagesize="8"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               requestURI="modal_axiscomi014.do?paginar=true"
                                               sort="list" cellpadding="0"
                                               cellspacing="0">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title0}"
                                                  headerClass="sortable"
                                                  sortProperty="CCODCONV"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId3.OB_IAX_COMISION.TATRIBU}
                                    </div>
                                  </display:column>
                                  <display:column title="${title1}"
                                                  headerClass="sortable"
                                                  sortProperty="TDESCONV"
                                                  media="html" autolink="false">
                                    <input type="text" class="campo campotexto"
                                           value='<fmt:formatNumber value="${miListaId3.OB_IAX_COMISION.PCCOMISI}" pattern="0.#######" />'
                                           name="TDESCRI" id="TDESCRI" size="15"
                                           style="width:70%" formato="decimal"
                                           title='<axis:alt f="axiscomi013" c="TDESCRI" lit=""/>'
                                           onchange="f_insertval(this.value,'${miListaId3.OB_IAX_COMISION.CATRIBU}')"/>
                                    <%-- <input type="text" class="campo
                                         campotexto"
                                         value="${miListaId3.OB_IAX_COMISION.PCCOMISI}"
                                         name="TDESCRI" id="TDESCRI" size="15"
                                         style="width:70%" title="<axis:alt
                                         f="axiscomi013" c="TDESCRI" lit=""/>"
                                         onchange="f_insertval(this.value,'${miListaId3.OB_IAX_COMISION.CATRIBU}')"/>--%>
                                  </display:column>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>                      
                    </tr>
                    
                    
                    <!-- INI IAXIS 4081 AABG: Nueva tabla para Tasa y Prima minima -->
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi014" c="LIT_FORMULARIO_1"
                                       lit="89907078"/></b>
                        </div>
                      </td>
                      <!-- FIN IAXIS 4081 AABG: Nueva tabla para Tasa y Prima minima  -->
                    </tr>
                    <tr>&nbsp;&nbsp;</tr>
                    <tr>
                    <!-- INI IAXIS 4081 AABG: Nueva tabla para Tasa y Prima minima  -->                         
                          <!-- PRIMA -->
                            <td class="titulocaja">
                              <b><axis:alt f="axiscomi013" c="LISTA_PRIMA"
                                           lit="101368"/></b>
                            </td>
                          <!-- PRIMA USD-->
                            <td class="titulocaja">
                              <b><axis:alt f="axiscomi013" c="LISTA_PRIMA_USD"
                                           lit="89907080"/></b>
                            </td>
                          <!-- PRIMA EUR-->
                            <td class="titulocaja">
                              <b><axis:alt f="axiscomi013" c="LISTA_PRIMA_EUR"
                                           lit="89907081"/></b>
                            </td>
                            <!-- GASTOS EXPEDICION -->
                            <td class="titulocaja" colspan="4">
                              <b><axis:alt f="axiscomi013" c="LISTA_GASTOS_EXP"
                                           lit="9902596"/></b>
                            </td>    
                    </tr>
                    <tr>
                            <td class="campocaja">
                              <input style="width:90%" type="text"
                                     class="campowidthinput campo campotexto"
                                     id="NPRIMA" name="NPRIMA" size="15"
                                     value="${__formdata.NPRIMA}"'
                                     <axis:atr f="axiscomi013" c="NPRIMA" a="modificable=true&obligatorio=true"/>/>
                            </td>
                            <td class="campocaja">
                              <input style="width:90%" type="text"
                                     class="campowidthinput campo campotexto"
                                     id="NPRIMAUSD" name="NPRIMAUSD" size="15"
                                     value="${__formdata.NPRIMAUSD}"'
                                     <axis:atr f="axiscomi013" c="NPRIMAUSD" a="modificable=true&obligatorio=false"/>/>
                            </td>
                            <td class="campocaja">
                              <input style="width:90%" type="text"
                                     class="campowidthinput campo campotexto"
                                     id="NPRIMAEUR" name="NPRIMAEUR" size="15"
                                     value="${__formdata.NPRIMAEUR}"'
                                     <axis:atr f="axiscomi013" c="NPRIMAEUR" a="modificable=true&obligatorio=false"/>/>
                            </td>
                            <td class="campocaja">
                              <input style="width:90%" type="text"
                                     class="campowidthinput campo campotexto"
                                     id="NGASTEXP" name="NGASTEXP" size="15"
                                     value="${__formdata.NGASTEXP}"'
                                     <axis:atr f="axiscomi013" c="NGASTEXP" a="modificable=true&obligatorio=true"/>/>
                            </td>
                    </tr>
                    <!-- FIN IAXIS 4081 AABG: Nueva tabla para Tasa y Prima minima  -->
                    
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscomi013</c:param>
        <c:param name="f">axiscomi013</c:param>
        <c:param name="__botones">salir,aceptar</c:param>
      </c:import>
    </form><axis:visible f="axiscomi013" c="BT_FMOVINI">
      <script type="text/javascript">
    
    Calendar.setup({
        inputField     :    "FMOVINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FMOVINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    
     Calendar.setup({
        inputField     :    "FINIVIG",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIVIG", 
        singleClick    :    true,
        firstDay       :    1
    });
    
    Calendar.setup({
        inputField     :    "FFINVIG",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINVIG",  
        singleClick    :    true,
        firstDay       :    1
    });
    
    </script>
    </axis:visible><c:import url="../include/mensajes.jsp"/></body>
</html>