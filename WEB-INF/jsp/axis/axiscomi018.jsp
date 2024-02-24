<%/*
*  Fichero: axiscomi018.jsp
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
      <axis:alt f="axiscomi018" c="LIT_TITULO" lit="100905"/>
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
           
            var idconv = "${__formdata.CONVENIO}";
            var modo = "${__formdata.MODO}";
          
            if (objUtiles.estaVacio(idconv) && modo == 'null'  ) {
               f_but_buscar();
            }
            
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscomi018", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            document.miForm.TFILE.value = '';
            document.miForm.TFILE_CARTAS.value = '';
            f_abrir_modal('axiscomi017');
        }
        
        function f_aceptar_axiscomi017(SSEGURO,SRECREN){
            f_cerrar_modal('axiscomi017');
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
            if (cual == 'axiscomi017')
                document.miForm.MODO.value = 'NUEVO';
        }
           
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm037')
                objUtiles.ejecutarFormulario("axis_axiscomi018.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada())
             objUtiles.ejecutarFormulario("axis_axiscomi018.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        /* *************************************************************************************************** */
        /* ***************************************** FUNCIONES PAGINA **************************************** */
        /* *************************************************************************************************** */
        
        function f_alta_convenio(){
            //alert("aqui 1");
            var IDCONVENIO=null;
            var MODO="NUEVO";
            //alert("aqui 2");
            f_cerrar_modal('axiscomi017');
            document.miForm.MODO.value = 'NUEVO';
            document.miForm.CONVENIO.value ="";// null;
            objUtiles.ejecutarFormulario("axis_axiscomi018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_editar_productos(){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var CONVENIO = document.miForm.CONVENIO.value; 
              var CRAMO = document.miForm.CRAMO.value;
              //alert("valor CRAMO= "+CRAMO+"**");
              objUtiles.abrirModal('axiscomi015', "src", "modal_axiscomi015.do?operation=form&PCONVENIO=" + CONVENIO+"&origen=axiscomi018&CRAMO="+CRAMO);  
        }
        
        function f_editar_convenio(CONVENIO,FINIVIG,MODO){
             document.miForm.CONVENIO.value=CONVENIO;
             document.miForm.FINIVIG.value=FINIVIG;
             f_cerrar_modal('axiscomi017');
             document.miForm.MODO.value = MODO;
             objUtiles.ejecutarFormulario("axis_axiscomi018.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
        function f_aceptar_axiscomi015(LISTAPRODUCTOS){
             f_cerrar_modal('axiscomi015');
             document.miForm.LISTAPRODUCTOS2.value=LISTAPRODUCTOS;
             objUtiles.ejecutarFormulario("axis_axiscomi018.do?LISTAPRODUCTOS="+LISTAPRODUCTOS+"&RECPROD=RECARGAR&NoRecargarLstComi=true", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_abrir_axisper021 () {
              //alert("dddd");
              var SSEGURO = "${__formdata.SSEGURO}";
              var CAGENTE = "${__formdata.CAGENTE}";
              //alert(CAGENTE+"*****"+SSEGURO);
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
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
          objAjax.invokeAsyncCGI("axis_axiscomi018.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }
      
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
               //alert(ajaxResponseText+"*************");
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     //alert("antes");
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                     
                     objDom.setValorPorId("TDESCRI", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
                     objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                     
                     objDom.setValorPorId("TNOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0));
                     objDom.setValorPorId("TAPELLI1", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0));
                     objDom.setValorPorId("TAPELLI2", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0));
        
                }          
             
            }catch(e){}
            }    
            
            function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
            
        function f_cerrar_axisctr014() {
            objUtiles.cerrarModal("axisctr014")
        }    
           
        function f_aceptar_axisctr014 (CAGENTE){
            objDom.setValorPorId("CAGENTE", CAGENTE);
            f_cerrar_axisctr014();
            objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
        }
        
        function f_actualizar_agente(){
            objAjax.invokeAsyncCGI("axis_axisadm047.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT) + 
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
                if(0 < numericoPCCOMISI && numericoPCCOMISI <= 100)
                    objAjax.invokeAsyncCGI("axis_axiscomi018.do", callbackAjaxInsertPor, "operation=ajax_insertpor&PCCOMISI="+PCCOMISIformateado+"&PCMODCOM="+PCMODCOM, this);
                else
                    alert("<axis:alt f="axiscoa004" c="LIT_9906245" lit="9906245"/>");
                

            }
            
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
          <axis:alt f="axiscomi018" c="LIT_PANTALLA" lit="9905089"/>
        </c:param>
        <%-- Gestión de devoluciones--%>
        <c:param name="formulario">
          <axis:alt f="axiscomi018" c="LIT_FORMULARIO" lit="9905089"/>
        </c:param>
        <%-- Gestión de devoluciones--%>
        <c:param name="form">axiscomi018</c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi018" c="LIT_MODAL_axiscomi017" lit=""/>
        </c:param>
        <c:param name="nid" value="axiscomi017"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi018" c="LIT_MODAL_axiscomi018" lit="9905092"/>
        </c:param>
        <c:param name="nid" value="axiscomi015"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi018" c="TIT_PAGE" lit="9904266"/>
        </c:param>
        <c:param name="nid" value="axisctr014"/>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi018" c="PERSONAS" lit="102073"/>
        </c:param>
        <c:param name="nid">axisper021</c:param>
      </c:import>
      <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
          <axis:alt f="axiscomi018" c="PERSONAS" lit="102073"/>
        </c:param>
        <c:param name="nid">axisper022</c:param>
      </c:import>
      <input type="hidden" name="operation" value=""/>
      <input type="hidden" name="SDEVOLU" id="SDEVOLU"  value="${__formdata.SDEVOLU}"/>
      <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
      <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
      <%-- <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}"/>--%>
      <input type="hidden" name="TFILE" id="TFILE" value="${__formdata.TFILE}"/>
      <input type="hidden" name="TFILE_CARTAS" id="TFILE_CARTAS" value="${__formdata.TFILE_CARTAS}"/>
      <input type="hidden" name="ORIGEN" id="ORIGEN" value=""></input>
      <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value=""></input>
      <input type="hidden" name="SNIP" id="SNIP" value=""></input>
      <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"></input>
      <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"></input>
      <input type="hidden" name="TNOMBRE" id="TNOMBRE" value="${__formdata.TNOMBRE}"></input>
      <input type="hidden" name="TAPELLI1" id="TAPELLI1" value="${__formdata.TAPELLI1}"></input>
      <input type="hidden" name="TAPELLI2" id="TAPELLI2"  value="${__formdata.TAPELLI2}"></input>
      <input type="hidden" name="CALCULARFIN" id="CALCULARFIN"  value="${__formdata.CALCULARFIN}"></input>
      
      <input type="hidden" name="LISTAPRODUCTOS2" id="LISTAPRODUCTOS2"  value="${__formdata.LISTAPRODUCTOS2}"></input>
      
      
      <div class="separador">&nbsp;</div>
      <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo">
              <img src="images/flecha.gif"/><axis:alt f="axiscomi018" c="LIT_IMG_1" lit="9905089"/>
               
              <img id="find" border="0" src="images/find.gif"
                   alt='<axis:alt f="axiscomi018" c="LIT_IMG_2" lit="100797" />'
                   onclick="f_but_buscar();" style="cursor:pointer"/>
            </div>
            <!-- ************************************************** SECCION CABECERA ***************************************************** -->
            <table class="seccion">
              <tr>
                <td>
                  <!-- Área 1 -->
                  <table class="area" align="center">
                    <tr>
                      <th style="width:20%;height:0px"> &nbsp;</th>
                      <th style="width:20%;height:0px"> &nbsp;</th>
                      <th style="width:20%;height:0px"> &nbsp;</th>
                      <th style="width:20%;height:0px"> &nbsp;</th>
                      <th style="width:20%;height:0px"> &nbsp;</th>
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><axis:alt f="axiscomi018" c="CONVENIO" lit="103465"/></b>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text" name="CONVENIO" id="CONVENIO"
                               style="width:65%;" value="${__formdata.CONVENIO}"
                               class="campowidthinput campo campotexto"
                               <axis:atr f="axiscomi018" c="CONVENIO" a="modificable=false&obligatorio=true"/>/>
                      </td>
                      <td class="campocaja" colspan="2">
                        <input type="text" name="CONVENIO_TEXT" id="CONVENIO_TEXT"
                               value="${__formdata.CONVENIO_TEXT}"
                               class="campowidthinput campo campotexto"
                               title='<axis:alt f="axiscomi018" c="x" lit="100588"/>'
                               <axis:atr f="axiscomi018" c="CONVENIO_TEXT" a="modificable=true&obligatorio=true"/>
                               <c:if test="${__formdata.MODO == 'MODIFICAR' || __formdata.MODO == 'NUEVAVIG' || __formdata.MODO == 'CONSULTAR' }">
                               <axis:atr f="axiscomi018" c="CONVENIO_TEXT" a="modificable=false&obligatorio=true"/>
                               </c:if> />
                      </td>
                    </tr>
                    <tr>
                      <axis:visible f="axiscomi018" c="FINIVIG">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi018" c="LIT_FINIVIG" lit="9000716"/></b>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi018" c="FFINVIG">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi018" c="LIT_FFINVIG" lit="9000717"/></b>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi018" c="FANULACION">
                        <td class="titulocaja">
                          <b><axis:alt f="axiscomi018" c="LIT_FANULACION" lit="140214"/></b>
                        </td>
                      </axis:visible>
                    </tr>
                    <tr>
                      <axis:visible f="axiscomi018" c="FINIVIG">
                        <td class="campocaja">
                          <input style="width:60%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="FINIVIG" name="FINIVIG" size="15"
                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>'
                                 title='<axis:alt f="axiscomi018" c="x" lit="9000716"/>'
                                 <axis:atr f="axiscomi018" c="FINIVIG" a="modificable=true&formato=fecha&obligatorio=true"/>
                                 <c:if test="${__formdata.MODO == 'MODIFICAR' || __formdata.MODO == 'CONSULTAR'}">
                                    <axis:atr f="axiscomi018" c="FINIVIG" a="modificable=false&formato=fecha&obligatorio=true"/>
                                  </c:if>  />
                          <c:if test="${__formdata.MODO != 'MODIFICAR'}">      
                          <a id="icon_FINIVIG" style="vertical-align:middle;"
                             href="#">
                            <img border="0"
                                 alt='<axis:alt f="axiscomi018" c="ddd" lit="9000716" />'
                                 title='<axis:alt f="axiscomi018" c="x1" lit="9000716" />'
                                 src="images/calendar.gif"/>
                          </a>
                          </c:if>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi018" c="FFINVIG">
                        <td class="campocaja">
                          <input style="width:60%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="FFINVIG" name="FFINVIG" size="15"
                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>'
                                 title='<axis:alt f="axiscomi018" c="x" lit="9000717"/>'
                                 <axis:atr f="axiscomi018" c="FFINVIG" a="modificable=true&formato=fecha&obligatorio=true"/>
                                 <c:if test="${__formdata.MODO == 'CONSULTAR'}">
                                    <axis:atr f="axiscomi018" c="FFINVIG" a="modificable=false&formato=fecha&obligatorio=true"/>
                                  </c:if> 
                                 />
                          <c:if test="${__formdata.MODO != 'CONSULTAR'}">        
                          <a id="icon_FFINVIG" style="vertical-align:middle;"
                             href="#">
                            <img border="0"
                                 alt='<axis:alt f="axiscomi018" c="ddd" lit="9000717" />'
                                 title='<axis:alt f="axiscomi018" c="x1" lit="9000717" />'
                                 src="images/calendar.gif"/>
                          </a>
                          </c:if>
                        </td>
                      </axis:visible>
                      <axis:visible f="axiscomi018" c="FANULACION">
                        <td class="campocaja">
                        
                          <input style="width:60%" type="text"
                                 class="campowidthinput campo campotexto"
                                 id="FANULACION" name="FANULACION" size="15"
                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FANULACION}"/>'
                                 title='<axis:alt f="axiscomi018" c="x" lit="140214"/>'
                                 <axis:atr f="axiscomi018" c="FANULACION" a="modificable=true&formato=fecha&obligatorio=false"/>
                                 <c:if test="${__formdata.MODO == 'NUEVO' || __formdata.MODO == 'NUEVAVIG' || __formdata.MODO == 'CONSULTAR'}">
                                 <axis:atr f="axiscomi018" c="FANULACION" a="modificable=false&formato=fecha&obligatorio=false"/>
                                 </c:if>
                                 />
                          <c:if test="${__formdata.MODO != 'NUEVO' && __formdata.MODO != 'NUEVAVIG' || __formdata.MODO == 'CONSULTAR'}">
                          <a id="icon_FANULACION" style="vertical-align:middle;"
                             href="#">
                            <img border="0"
                                 alt='<axis:alt f="axiscomi018" c="ddd" lit="140214" />'
                                 title='<axis:alt f="axiscomi018" c="x1" lit="140214" />'
                                 src="images/calendar.gif"/>
                          </a>
                          </c:if>
                        </td>
                      </axis:visible>
                    </tr>
                    <tr>
                      <td class="titulocaja">
                        <b><axis:alt f="axiscomi018" c="CAGENTE_TEXT" lit="9902363"/></b>
                        <%-- Intermediario--%>
                      </td>
                      <td class="titulocaja" colspan="3">
                        <b><axis:alt f="axiscomi018" c="NOMBRE_TEXT"
                                     lit="100588"/>&nbsp;<axis:alt f="axiscomi018" c="INTERMED_D" lit="9902363"/></b>
                        <%-- Descripción Intermediario--%>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT"
                               style="width:65%;" value="${__formdata.CAGENTE}"
                               class="campowidthinput campo campotexto"
                               title='<axis:alt f="axiscomi018" c="CAGENTE_TEXT" lit="9902363" />'
                               <axis:atr f="axiscomi018" c="CAGENTE" a="modificable=true&obligatorio=true"/>
                               onchange="f_actualizar_agente()"
                               <c:if test="${__formdata.MODO == 'MODIFICAR'|| __formdata.MODO == 'CONSULTAR' || __formdata.MODO == 'NUEVAVIG'}">
                                <axis:atr f="axiscomi018" c="CAGENTE" a="modificable=false&obligatorio=true"/>
                                </c:if>
                               />
                         <c:if test="${__formdata.MODO == 'NUEVO' }">       
                        <img border="0" src="images/find.gif"
                             onclick="f_abrir_axisctr014()"
                             style="cursor:pointer"/> </c:if>
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
                      <td class="titulocaja">
                        <b><axis:alt f="axiscomi018" c="MONTO" lit="9905096"/></b>
                      </td>
                    </tr>
                    <tr>
                      <td class="campocaja">
                        <input type="text" name="MONTO" id="MONTO"
                               style="width:65%;" value="${__formdata.MONTO}"
                               class="campowidthinput campo campotexto"
                               title='<axis:alt f="axiscomi018" c="MONTO" lit="9905096"/>'
                               <axis:atr f="axiscomi018" c="MONTO" a="modificable=true&obligatorio=true"/>
                               <c:if test="${__formdata.MODO == 'CONSULTAR'}">
                                <axis:atr f="axiscomi018" c="MONTO" a="modificable=false&obligatorio=true"/>
                               </c:if>
                               />
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <%-- </table>--%>
              <!-- ************************************************** SECCION DATOS ********************************************************* -->
              <%-- <div class="titulo"> <img src="images/flecha.gif"/><axis:alt
                   f="axiscomi018" c="LIT_IMG_DAT" lit="9904268" /> </div>
                   <table class="seccion" >--%>
              <tr>
                <td>
                  <!-- Área 1 -->
                  <table class="area" align="center">
                    <tr>
                      <th style="width:20%;height:0px">&nbsp;</th>
                      <th style="width:20%;height:0px">&nbsp;</th>
                      <th style="width:20%;height:0px">&nbsp;</th>
                      <th style="width:20%;height:0px">&nbsp;</th>
                      <th style="width:20%;height:0px">&nbsp;</th>
                    </tr>
                      
                    <tr>
                      <td class="campocaja" colspan="2">
                        <input style="width:50%" type="hidden"
                               class="campowidthinput campo campotexto"
                               id="TRAMO" name="TRAMO" size="15"
                               value="${__formdata.TRAMO}"
                               title='<axis:alt f="axiscomi018" c="ALT_TRAMO" lit="100885"/>'
                               <axis:atr f="axiscomi018" c="TRAMO" a="modificable=false"/>/>
                        <input style="width:50%" type="hidden"
                               class="campowidthinput campo campotexto"
                               id="CRAMO" name="CRAMO" size="15"
                               value="${__formdata.CRAMO}"
                               title='<axis:alt f="axiscomi018" c="ALT_CRAMO" lit="100885"/>'
                               <axis:atr f="axiscomi018" c="CRAMO" a="modificable=false"/>/>
                      </td>
                    </tr>
                    <!-- <div style="float:right;" id="DATOS_PRODUCTOS"><img id="DSP_PRODUCTOS_parent" src="images/lapiz.gif" onclick="f_editar_productos()" style="cursor:pointer"/></div>  -->
                    <!-- ************************************************************************************************************* -->
                    <!-- ************************************   LISTA INTERMEDIARIOS  ************************************************ -->
                    <!-- ************************************************************************************************************* -->
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi018" c="LIT_PRODUCTOS"
                                       lit="110916"/></b>
                        </div>
                        <c:if test="${__formdata.MODO == 'NUEVO'}">
                        <div style="float:right;" id="DATOS_PROD">
                          <img id="DATOS_PROD_parent" src="images/lapiz.gif"
                               onclick="f_editar_productos()"
                               style="cursor:pointer"/>
                        </div>
                        </c:if>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" colspan="2">
                        <table border="0" class="area" align="left"
                               style="width:100%;">
                          <tr>
                            <td>
                              <c:set var="title0">
                                <axis:alt f="axiscomi018" c="LISTA_PRODUCTO"
                                          lit="9902909"/>
                              </c:set>
                              <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.LSTPRODUCTOS}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="8"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               requestURI="axis_axiscomi018.do?paginar=true"
                                               sort="list" cellpadding="0"
                                               cellspacing="0">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column title="${title0}"
                                                  headerClass="sortable"
                                                  sortProperty="CCODCONV"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                      ${miListaId.TPRODUC}
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
                    <!-- ************************************************************************************************************* -->
                    <!-- ************************************   LISTA BENEFICIARIOS  ************************************************ -->
                    <!-- ************************************************************************************************************* -->
                    <tr>
                      <td class="campocaja" colspan="2">
                        <div style="float:left;">
                          <b><axis:alt f="axiscomi018" c="LISTA_NAME_BNF"
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
                                <axis:alt f="axiscomi018" c="LISTA_BENE"
                                          lit="1000372"/>
                              </c:set>
                              <c:set var="title1">
                                <axis:alt f="axiscomi018" c="LISTA_PORC"
                                          lit="101509"/>
                              </c:set>
                              <div class="seccion displayspaceGrande">
                                <display:table name="${sessionScope.LTSCOMI}"
                                               id="miListaId3" export="false"
                                               class="dsptgtable" pagesize="8"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               requestURI="modal_axiscomi017.do?paginar=true"
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
                                           title='<axis:alt f="axiscomi018" c="TDESCRI" lit=""/>'
                                           onchange="f_insertval(this.value,'${miListaId3.OB_IAX_COMISION.CATRIBU}')"
                                           <c:if test="${__formdata.MODO == 'CONSULTAR'}">
                                            <axis:atr f="axiscomi018" c="TDESCRI" a="modificable=false&obligatorio=false"/>
                                           </c:if> />
                                  </display:column>
                                </display:table>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axiscomi018</c:param>
        <c:param name="f">axiscomi018</c:param>
        <c:param name="__botones">salir<c:if test="${__formdata.MODO != 'CONSULTAR'}">,aceptar</c:if></c:param>
      </c:import>
    </form><axis:visible f="axiscomi018" c="BT_FMOVINI">
      <script type="text/javascript">
    
    Calendar.setup({
        inputField     :    "FMOVINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FMOVINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    
    <c:if test="${__formdata.MODO != 'MODIFICAR'}">  
     Calendar.setup({
        inputField     :    "FINIVIG",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FINIVIG", 
        singleClick    :    true,
        firstDay       :    1
    });
    </c:if>
    
    <c:if test="${__formdata.MODO != 'CONSULTAR'}">  
    Calendar.setup({
        inputField     :    "FFINVIG",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINVIG",  
        singleClick    :    true,
        firstDay       :    1
    });
    </c:if>
    
    <c:if test="${__formdata.MODO != 'NUEVO' && __formdata.MODO != 'NUEVAVIG' && __formdata.MODO != 'CONSULTAR'}">
    Calendar.setup({
        inputField     :    "FANULACION",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FANULACION",  
        singleClick    :    true,
        firstDay       :    1
    });
    </c:if>
    </script>
    </axis:visible><c:import url="../include/mensajes.jsp"/></body>
</html>