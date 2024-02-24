<%-- 
*  Fichero: axisrea026.jsp
*  Alta/Mod. Asociación de fórmulas a Contratos
*  Fecha: 09/08/2011
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

        function f_onload_axisrea026() {
           f_cargar_propiedades_pantalla();
                       
            var grabarOK = '${requestScope.grabarOK}';
            if (!objUtiles.estaVacio(grabarOK) && grabarOK == "0")
                    parent.f_aceptar_axisrea026();             
                
        }
        
       
        function f_but_aceptar() {
           
             if (objValidador.validaEntrada()) {           
                    //objUtiles.ejecutarFormulario("modal_axisrea026.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);                      
                    f_grabar_datos();
            }
           
        }
        
        function f_but_cancelar() { 
               parent.f_cerrar_modal("axisrea026");                
        }    
        
         function f_actualitza_plocal()
         {      
                //alert("Antes de cargar***" );
                f_cargar_propiedades_pantalla();
              
               var CTRAMO = objDom.getValorPorId("CTRAMO");   
                
       
         }
         
      function f_actualiza_number(CAMPON){                                             
                objDom.setValorPorId(CAMPON,objNumero.formateaNumeroMoneda(objDom.getValorPorId(CAMPON),false));
         }    
         
         
         /* ************************************   *********************************** */
         /* *********************************************************************************************** */
         
        function f_grabar_datos() {
               
                var cadena_valores = "";

                        var NVERSIO = null;
                        if(document.miForm.NVERSIO)
                            { 
                            NVERSIO = document.miForm.NVERSIO.value; 
                            }else{
                            NVERSIO = document.miForm.NVERSIO_AUX.value; 
                            }
                        var SCONTRA = null;
                        if(document.miForm.SCONTRA)
                            { 
                            SCONTRA = document.miForm.SCONTRA.value; 
                            }else{
                            SCONTRA = document.miForm.SCONTRA_AUX.value; 
                            }
                        var SPRODUC = null;
                        if(document.miForm.SPRODUC)
                            { 
                            SPRODUC = document.miForm.SPRODUC.value; 
                            }else{
                            SPRODUC = document.miForm.SPRODUC_AUX.value; 
                            }
                        var CGARANT = null;
                        if(document.miForm.CGARANT)
                            { 
                            CGARANT = document.miForm.CGARANT.value; 
                            }else{
                            CGARANT = document.miForm.CGARANT_AUX.value; 
                            }
                        var CRAMO = null;
                        if(document.miForm.CRAMO)
                            { 
                            CRAMO = document.miForm.CRAMO.value; 
                            }else{
                            CRAMO = document.miForm.CRAMO_AUX.value; 
                            }
                        var CACTIVI = null;
                        if(document.miForm.CRAMO)
                            { 
                            CACTIVI = document.miForm.CACTIVI.value; 
                            }else{
                            CACTIVI = document.miForm.CACTIVI_AUX.value; 
                            }
                        var CTIPSEG = null;
                        if(document.miForm.CTIPSEG)
                            { 
                            CTIPSEG = document.miForm.CTIPSEG.value; 
                            }else{
                            CTIPSEG = document.miForm.CTIPSEG_AUX.value; 
                            }
                        var CMODALI = null;
                        if(document.miForm.CMODALI)
                            { 
                            CMODALI = document.miForm.CMODALI.value; 
                            }else{
                            CMODALI = document.miForm.CMODALI_AUX.value; 
                            }
                        var ILIMSUB = null;
                        if(document.miForm.ILIMSUB)
                            { 
                            ILIMSUB = document.miForm.ILIMSUB.value; 
                            }else{
                            ILIMSUB = document.miForm.ILIMSUB_AUX.value; 
                            }
            
                        

                cadena_valores = "NVERSIO=" + NVERSIO + "&SCONTRA=" + SCONTRA +
                "&SPRODUC=" + SPRODUC + "&CGARANT=" + CGARANT +
                "&CRAMO=" + CRAMO + "&CACTIVI=" + CACTIVI + "&CTIPSEG=" + CTIPSEG + "&CMODALI=" + CMODALI + "&ILIMSUB=" + ILIMSUB;
                //alert("cadena_de_valores: "+cadena_valores
                
                objAjax.invokeAsyncCGI("modal_axisrea026.do", callbackActualizarDatos, "operation=ajax_grabar&"+cadena_valores, this, objJsMessages.jslit_cargando);
                
                }        
            
          
          
     
                function callbackActualizarDatos(ajaxResponseText) {
                        
                        try {            
                            var doc = objAjax.domParse(ajaxResponseText);
                          
                            if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                             
                                        alert("<axis:alt f="axisrea026" c="LIT_CRAMO" lit="109904"/>");
                                        parent.f_aceptar_axisrea026();  
                                             
                            }
                                 
                        
                        } catch (e) {
                              if (isDebugAjaxEnabled == "true")
                                alert (e.name + " " + e.message);
                        }
                }    
         
    
    
    
    /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            /* ************************* CAMBIA PRODUCTO **************************** */
            
            
            
            function f_actualiza_producto(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                objAjax.invokeAsyncCGI("axis_axisrea026.do", callbackAjaxActualizaProducto, 
                    "operation=ajax_actualiza_producto&CRAMO="+CRAMO, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaProducto(ajaxResponseText) {
                //alert(ajaxResponseText);
                var productoCombo =  document.miForm.SPRODUC;
                
                objDom.borrarOpcionesDeCombo(productoCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                              
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                  
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            objDom.borrarOpcionesDeCombo(productoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, 0);
                         
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                          
                                var SPRODUC = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("SPRODUC")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("SPRODUC")[0].childNodes[0].nodeValue : "");
                                var TTITULO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(SPRODUC, TTITULO, productoCombo, i+1);
                              
                            }
                        }else{
                     
                            objDom.borrarOpcionesDeCombo (productoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
                        }
                        
                        f_actualiza_garantia();
                    }else{
                        f_actualiza_garantia();
                    }
                    
                    
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            /* ************************* CAMBIA ACTIVIDAD **************************** */
            function f_actualiza_garantia(){
                //  objValidador.validaEntrada();
                //alert("Antes actualiza garantia");
                SPRODUC= document.miForm.SPRODUC.value;
                //alert("SPRODUC: "+SPRODUC);
                CRAMO = document.miForm.CRAMO.value;
                CACTIVI = document.miForm.CACTIVI.value;
                objAjax.invokeAsyncCGI("modal_axisrea026.do", callbackAjaxActualizaGarantia, 
                    "operation=ajax_actualiza_garantia&SPRODUC=" + SPRODUC + "&CRAMO="+CRAMO +"&CACTIVI="+CACTIVI, this,objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaGarantia(ajaxResponseText) {
                var garantiaCombo = document.miForm.CGARANT;
                //alert(ajaxResponseText);
 
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                        
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(garantiaCombo);
                             objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", garantiaCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var CGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CGARANT")[0].childNodes[0].nodeValue : "");
                                var TGARANT = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TGARANT")[0].childNodes[0].nodeValue : "");
                                
                                objDom.addOpcionACombo(CGARANT, TGARANT, garantiaCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (garantiaCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", garantiaCombo, null);
                        }
                    }
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", garantiaCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            /* ************************* CAMBIA CONTRATO **************************** */
            function f_actualiza_version(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio contrato");
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("modal_axisrea026.do", callbackAjaxActualizaVersion, 
                    "operation=ajax_actualiza_version&SCONTRA="+SCONTRA, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaVersion(ajaxResponseText) {
                //alert(ajaxResponseText);
                var versionCombo = document.miForm.NVERSIO;
               
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                                        
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                            objDom.borrarOpcionesDeCombo(versionCombo);
                             objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, 0);
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                                var NVERSIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("NVERSIO")[0].childNodes[0].nodeValue : "");
                                var TCONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TCONTRA")[0].childNodes[0].nodeValue : "");
                                objDom.addOpcionACombo(NVERSIO, TCONTRA, versionCombo, i+1);
                            }
                        }else{
                            objDom.borrarOpcionesDeCombo (versionCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                        }
                    }
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            function f_borrar_formula(SCONTRA,NVERSIO,SPRODUC,CACTIVI,CGARANT,CCAMPO,CCLAVE) {  
                
                document.miForm.SCONTRA_DEL.value = SCONAGR;
                document.miForm.NVERSIO_DEL.value = CIDIOMA;
                document.miForm.SPRODUC_DEL.value = TCONAGR;
                document.miForm.CACTIVI_DEL.value = TCONAGR;
                document.miForm.CGARANT_DEL.value = TCONAGR;
                document.miForm.CCAMPO_DEL.value = TCONAGR;
                document.miForm.CCLAVE_DEL.value = TCONAGR;
                
                objUtiles.ejecutarFormulario("modal_axisrea026.do", "borrar_formula", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
         
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
         
         

    </script>
  
  
  </head>
  <body onload="f_onload_axisrea026()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <!--form name="axisrea026Form" action="" method="POST"-->
    <form name="miForm" action="modal_axisrea026.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="H_MODIF" id="H_MODIF" value="${__formdata.H_MODIF}"/>
        <input type="hidden" name="CTRAMO_MOD" id="CTRAMO_MOD" value="${__formdata.CTRAMO_MOD}"/>
        <input type="hidden" name="SCTRXL" id="SCTRXL"  value="${__formdata.SCTRXL}"/>
        <input type="hidden" name="NVERXL" id="NVERXL"  value="${__formdata.NVERXL}"/>
        
        <c:if test="${__formdata.MODO=='MOD'}"> 
            <input type="hidden" name="SPRODUC_AUX" id="SPRODUC_AUX"  value="${__formdata.SPRODUC}"/>
            <input type="hidden" name="CACTIVI_AUX" id="CACTIVI_AUX"  value="${__formdata.CACTIVI}"/>
            <input type="hidden" name="CGARANT_AUX" id="CGARANT_AUX"  value="${__formdata.CGARANT}"/>
            <input type="hidden" name="SCONTRA_AUX" id="SCONTRA_AUX"  value="${__formdata.SCONTRA}"/>
            <input type="hidden" name="NVERSIO_AUX" id="NVERSIO_AUX"  value="${__formdata.NVERSIO}"/>
            <input type="hidden" name="CRAMO_AUX" id="CRAMO_AUX"  value="${__formdata.CRAMO}"/>
            <input type="hidden" name="CACTIVI_AUX" id="CACTIVI_AUX"  value="${__formdata.CACTIVI}"/>
            <input type="hidden" name="CTIPSEG_AUX" id="CTIPSEG_AUX"  value="${__formdata.CTIPSEG}"/>
            <input type="hidden" name="CMODALI_AUX" id="CMODALI_AUX"  value="${__formdata.CMODALI}"/>
        </c:if>
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisrea026" c="LIT_NOMBRE_PANTALLA" lit="9902281" /></c:param>
            <c:param name="producto"><axis:alt f="axisrea026" c="ALT_NOMBRE_PANTALLA" lit="9902281" /></c:param>
            <c:param name="form">axisrea026</c:param>
        </c:import>


        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
          
            <tr>
                <td>
                
                    <!-- TRAMOS -->
                    <table class="seccion">
                    <tr>
                  
                        <td> 
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center">
                          <tr> <!-- Se establecen las columnas -->
                            <th style="width:33%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                            <th style="width:33%;height:0px"></th>
                          </tr>
                          
                          
                          
                          <tr>
                                  <axis:visible f="axisrea026" c="CRAMO">
                                    <td class="titulocaja" ><!-- CRAMO  -->
                                      <b><axis:alt f="axisrea026" c="LIT_CRAMO" lit="100784"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea026" c="CMODALI">
                                    <td class="titulocaja" ><!-- CMODALI  -->
                                      <b><axis:alt f="axisrea026" c="LIT_CMODALI" lit="100943"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea026" c="CTIPSEG">
                                    <td class="titulocaja" ><!-- CTIPSEG  -->
                                      <b><axis:alt f="axisrea026" c="LIT_CTIPSEG" lit="102098"/></b>
                                    </td>
                                  </axis:visible>  
                          </tr>
                         
                          <tr> <!-- Linea de campos de entrada -->
                          
                                <td class="campocaja" colspan="1"> <%-- CRAMO --%>
                                        <axis:ocultar f="axisrea025" c="CRAMO"> <!-- Linia 1. Columna 2. -->
                                            <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled="disabled"</c:if> onchange="f_actualiza_producto(); " obligatorio="false" style="width:90%;">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_CRAMO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaRamo}">
                                                    <option value = "${element.CRAMO}" 
                                                    <c:if test="${element.CRAMO == __formdata.CRAMO}"> selected </c:if> >
                                                     ${element.TRAMO} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                  </td>
                                  <td>
                                        <input type="text" class="campo campotexto"  obligatorio="false" id="CMODALI" name="CMODALI" style="width:80%"  <c:if test="${__formdata.MODO=='MOD'}" >disabled="disabled"</c:if> 
                                                      value="${__formdata.CMODALI}" <axis:atr f="axisrea026" c="CMODALI" a="modificable=true"/>/>
                                  </td>
                                  <td>
                                        <input type="text" class="campo campotexto"  obligatorio="false" id="CTIPSEG" name="CTIPSEG" style="width:80%"  <c:if test="${__formdata.MODO=='MOD'}" >disabled="disabled"</c:if> 
                                                      value="${__formdata.CTIPSEG}" <axis:atr f="axisrea026" c="CTIPSEG" a="modificable=true"/>/>
                                  </td>
                         </tr>
                         
                          <tr>
                                  <axis:visible f="axisrea026" c="SPRODUC">
                                    <td class="titulocaja" ><!-- PRODUCTO -->
                                      <b><axis:alt f="axisrea026" c="LIT_SPRODUC" lit="100829"/></b>
                                    </td>
                                  </axis:visible> 
                                  <axis:visible f="axisrea026" c="CACTIVI">
                                    <td class="titulocaja" ><!--ACTIVIDAD -->
                                      <b><axis:alt f="axisrea026" c="LIT_CACTIVI" lit="103481"/></b>
                                    </td>
                                  </axis:visible> 
                                  <axis:visible f="axisrea026" c="CGARANT">
                                    <td class="titulocaja" ><!--GARANTIA -->
                                      <b><axis:alt f="axisrea026" c="LIT_CGARANT" lit="100561"/></b>
                                    </td>
                                  </axis:visible>  
                          
                          </tr>
                         
                         <tr> 
                                <td class="campocaja" colspan="1"> <%-- SPRODUC --%>
                                        <axis:ocultar f="axisrea025" c="SPRODUC"> <!-- Linia 1. Columna 2. -->
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto"  <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if>  onchange="f_actualiza_actividad();" obligatorio="false" style="width:90%;">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_SPRODUC_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaProducto}">
                                                    <option value = "${element.SPRODUC}" 
                                                    <c:if test="${element.SPRODUC == __formdata.SPRODUC}"> selected </c:if> >
                                                     ${element.TTITULO} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                  </td>
                                  
                                   <td class="campocaja" colspan="1"> <%-- CACTIVI --%>  
                                    <axis:ocultar f="axisrea025" c="CACTIVI"> <!-- Linia 1. Columna 2. -->
                                        <select name="CACTIVI" id="CACTIVI" size="1" class="campowidthselect campo campotexto"  <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if>  onchange="f_actualiza_garantia();" obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_CACTIVI_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaActividad}">
                                                <option value = "${element.CACTIVI}" 
                                                <c:if test="${element.CACTIVI == __formdata.CACTIVI}"> selected </c:if> >
                                                  ${element.TTITULO} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                  
                                  <td class="campocaja" colspan="1"> <%-- CGARANT --%>
                                    <axis:ocultar f="axisrea026" c="CGARANT"> <!-- Linia 1. Columna 2. -->
                                        <select name="CGARANT" id="CGARANT" size="1" class="campowidthselect campo campotexto" onchange=""  <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if>  obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea026" c="ALT_CGARANT_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaGarantia}">
                                                <option value = "${element.CGARANT}" 
                                                <c:if test="${element.CGARANT == __formdata.CGARANT}"> selected </c:if> >
                                                 ${element.TGARANT} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                  </td>
 
                              </tr>
                    
                               
                               <tr>
                                  <axis:visible f="axisrea026" c="SCONTRA">
                                    <td class="titulocaja" ><!--CONTRATO -->
                                      <b><axis:alt f="axisrea026" c="LIT_CONTRAT" lit="101945"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea026" c="NVERSIO">
                                    <td class="titulocaja" ><!--NVERSION -->
                                      <b><axis:alt f="axisrea026" c="LIT_NVERSIO" lit="9001146"/></b>
                                    </td>
                                  </axis:visible> 
                                   <axis:visible f="axisrea026" c="ILIMSUB">
                                    <td class="titulocaja" ><!--ILIMSUB -->
                                      <b><axis:alt f="axisrea026" c="LIT_ILIMSUB" lit="9906292"/></b>
                                    </td>
                                  </axis:visible>  
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="1"> <%-- SCONTRA --%>
                                    <axis:ocultar f="axisrea026" c="SCONTRA"> <!-- Linia 1. Columna 2. -->
                                        <select name="SCONTRA" id="SCONTRA" size="1" class="campowidthselect campo campotexto"  <axis:atr f="axisrea026" c="SCONTRA" a="modificable=true&isInputText=true&obligatorio=false"/>     onchange="f_actualiza_version()" obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea026" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaContrato}">
                                                <option value = "${element.SCONTRA}" 
                                                <c:if test="${element.SCONTRA == __formdata.SCONTRA}"> selected </c:if> >
                                                 ${element.SCONTRA} - ${element.TDESCRIPCION} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                 </td>
                                 <td class="campocaja" colspan="1"> <%-- NVERSIO --%>
                                    <axis:ocultar f="axisrea026" c="NVERSIO"> <!-- Linia 1. Columna 2. -->
                                        <select name="NVERSIO" id="NVERSIO" size="1" class="campowidthselect campo campotexto"  <axis:atr f="axisrea026" c="NVERSIO" a="modificable=true&isInputText=true&obligatorio=false"/>    onchange="" obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea026" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaVersion}">
                                                <option value = "${element.NVERSIO}" 
                                                <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                 ${element.TCONTRA} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                </td>
                                <td class="campocaja" colspan="1"> <%-- ILIMSUB --%>
                                    <axis:ocultar f="axisrea026" c="ILIMSUB"> 
                                        <input type="text" class="campo campotexto"  obligatorio="false" id="ILIMSUB" name="ILIMSUB" style="width:100%"  <c:if test="${__formdata.MODO=='MOD'}" >disabled="disabled"</c:if> 
                                                      value="${__formdata.ILIMSUB}" <axis:atr f="axisrea026" c="ILIMSUB" a="modificable=true"/>/>
                                    </axis:ocultar>    
                                </td>                            
                         
                                </tr>        
                                                                                                 
                    </table>
                    
                            
        <!-- ************************* FIN DATOS TRAMOS  ********************* -->     			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea026</c:param><c:param name="f">axisrea026</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>        
    </form> 
    
    <c:import url="../include/mensajes.jsp" />
    
   </body>
</html>