<%/** Axisrea025.jsp
*  Asociación de productos a contratos
*  Fecha: 08/08/2011
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">


<html>
    <head>
        <title><axis:alt f="axisrea025" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {    
               
               f_cargar_propiedades_pantalla();
               var numContrato = 0;

                //  f_abrir_axisrea026();
                 
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea025", "cancelar", document.miForm, "_self");
            }
            
            function f_but_editar() {
                var PERMITE_EDICION = '${requestScope.OB_IAX_CODICONTRATO_REA.CVALID}';   //1: No se puede modificar, porque lo hemos validado, y ha de ser procesado por el proceso batch
                if(PERMITE_EDICION!=null && PERMITE_EDICION!='1'){
                    f_cerrar_axisrea026();
                    param = "&SCONTRA_MOD="+objDom.getValorPorId("SCONTRA");
                    objUtiles.ejecutarFormulario("axis_axisrea025.do?" + param, "ModificarContrato", document.miForm, "_self", objJsMessages.jslit_cargando);             
                }else{
                    alert("<axis:alt f="axisrea055" c="LIT_CCOMPANI" lit="9902171"/>");
                }
            }
            
             function f_but_cancelar() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea025", "cancelar", document.miForm, "_self");
            }
            
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_abrir_axisrea026(MODO) {
                
               
                SPRODUC= document.miForm.SPRODUC.value;
                CRAMO= document.miForm.CRAMO.value;
                CGARANT= document.miForm.CGARANT.value;
                SCONTRA= document.miForm.SCONTRA.value;
                NVERSIO= document.miForm.NVERSIO.value;
                //CCOLECT= document.miForm.CCOLECT.value;
                CACTIVI=document.miForm.CACTIVI.value;
                CTIPSEG=document.miForm.CTIPSEG.value;
                CMODALI=document.miForm.CMODALI.value;
      
                objUtiles.abrirModal("axisrea026", "src", "modal_axisrea026.do?operation=form&SPRODUC="+SPRODUC+"&CRAMO="+CRAMO+"&CGARANT="+CGARANT+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&MODO="+MODO+"&CMODALI="+CMODALI+"&CACTIVI="+CACTIVI+"&CTIPSEG="+CTIPSEG);  
      
            }
            
            
            function f_modif_axisrea026(SPRODUC,CRAMO,CGARANT,SCONTRA,NVERSIO,CCOLECT,CACTIVI,CTIPSEG,CMODALI,ILIMSUB) {
                
                var MODO = "MOD";
                //alert("SPRODUC: "+SPRODUC+"CRAMO: "+CRAMO+"CGARANT: "+CGARANT+"SCONTRA: "+SCONTRA+"NVERSIO: "+NVERSIO+"CCOLECT: "+CCOLECT+"CACTIVI: "+CACTIVI+"CTIPSEG: "+CTIPSEG+"CMODALI: "+CMODALI);
                //alert("  CMODALI:"+CMODALI+"  CGARANT:"+CGARANT+"  SCONTRA:"+SCONTRA+"  NVERSIO:"+NVERSIO + "  SPRODUC:" + SPRODUC+"   CACTIVI:"+CACTIVI);
                objUtiles.abrirModal("axisrea026", "src", "modal_axisrea026.do?operation=form&SPRODUC="+SPRODUC+"&CRAMO="+CRAMO+"&CGARANT="+CGARANT+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&MODO="+MODO+"&CCOLECT="+CCOLECT+"&CACTIVI="+CACTIVI+"&CTIPSEG="+CTIPSEG+"&CMODALI="+CMODALI+"&ILIMSUB="+ILIMSUB);  
          
            }
            
            function f_cerrar_axisrea026() {
                objUtiles.cerrarModal('axisrea026');
                
            }   
            
             function f_cerrar_modal(modal) {            
                f_cerrar_axisrea026();
            }
            
            function f_nuevo_axisrea026(pNUEVO) {                     
                document.miForm.NOU.value = pNUEVO;
                f_cerrar_axisrea001();               
                document.miForm.FCONINI.value = "";
                document.miForm.FCONFIN.value = "";
                document.miForm.TCONTRA.value = "";              
                document.miForm.SCONQP.value = "";
                document.miForm.PCEDIDO.value = "";
                document.miForm.ICAPACI.value = "";
                document.miForm.TOBSERV.value = "";
              
                objUtiles.ejecutarFormulario("axis_axisrea025.do", "BorrarObjCache", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
           
            
            function f_but_buscar() {
               //alert("Antes de realizar la búsqueda");
               //alert(document.miForm.CACTIVI.value);
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axisrea025.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_aceptar() {
               //alert("Antes de guardar");
               objUtiles.ejecutarFormulario("axis_axisrea025.do", "guardar_contrato", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_borrar_producto(SPRODUC,CRAMO,CGARANT,SCONTRA,NVERSIO,CCOLECT,CACTIVI,CTIPSEG,CMODALI) {
            
            document.miForm.SCONTRA_DEL.value = SCONTRA;
            document.miForm.SPRODUC_DEL.value = SPRODUC;
            document.miForm.CTIPSEG_DEL.value = CTIPSEG;
            document.miForm.SVERSION_DEL.value = NVERSIO;
            document.miForm.CRAMO_DEL.value = CRAMO;
            document.miForm.CMODALI_DEL.value = CMODALI;
            document.miForm.CCOLECT_DEL.value = CCOLECT;
            document.miForm.CTIPSEG_DEL.value = CTIPSEG;
            document.miForm.CACTIVI_DEL.value = CACTIVI;
            document.miForm.CGARANT_DEL.value = CGARANT;
            
               //alert("Antes de guardar");
               objUtiles.ejecutarFormulario("axis_axisrea025.do", "borrar_producto", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            /* ************************* CAMBIA PRODUCTO **************************** */
            
            function f_aceptar_axisrea026() {
               f_cerrar_axisrea026();           
               objUtiles.ejecutarFormulario("axis_axisrea025.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_actualiza_producto(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                objAjax.invokeAsyncCGI("axis_axisrea025.do", callbackAjaxActualizaProducto, 
                    "operation=ajax_actualiza_producto&CRAMO="+CRAMO, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaProducto(ajaxResponseText) {
                //alert(ajaxResponseText);
                var productoCombo =  document.miForm.SPRODUC;
                
                objDom.borrarOpcionesDeCombo(productoCombo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
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
                            
                        }
                        
                        f_actualiza_actividad();
                    }else{
                     
                            objDom.borrarOpcionesDeCombo (productoCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", productoCombo, null);
                             f_actualiza_actividad();
                    }
                        
                        
                 
                    
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            /* ************************* CAMBIA ACTIVIDAD *************************** */
            
            function f_actualiza_actividad(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                SPRODUC = document.miForm.SPRODUC.value;
                objAjax.invokeAsyncCGI("axis_axisrea025.do", callbackAjaxActualizaActividad, 
                    "operation=ajax_actualiza_actividad&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC, this, objJsMessages.jslit_actualizando_registro);
                    
            }
            function callbackAjaxActualizaActividad(ajaxResponseText) {
                //alert(ajaxResponseText);
                //alert("Antes de actualizar actividad");
                var actividadCombo =  document.miForm.CACTIVI;
                
                objDom.borrarOpcionesDeCombo(actividadCombo);
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
            try {
                    var doc=objAjax.domParse(ajaxResponseText);
                              
                    if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                  
                        if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                       
                            objDom.borrarOpcionesDeCombo(actividadCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, 0);
                         
                            for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                          
                                var CACTIVI = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CACTIVI")[0].childNodes[0].nodeValue : "");
                                var TTITULO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTITULO")[0].childNodes[0].nodeValue : "");
                              
                                objDom.addOpcionACombo(CACTIVI, TTITULO, actividadCombo, i+1);
                              
                            }
                        }else{
                     
                            objDom.borrarOpcionesDeCombo (actividadCombo);
                            objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                        }
                        
                        f_actualiza_garantia();
                    }else{
                        f_actualiza_garantia();
                    }
                    
               //alert("Vuelta");     
                
                } catch (e) {
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", actividadCombo, null);
                    alert(objJsMessages.jslit_sin_motivos);
                }
            }
            
            
            
            
            
            /* ************************* CAMBIA GARANTIA **************************** */
            function f_actualiza_garantia(){
                //objValidador.validaEntrada();
                //alert("Antes actualiza garantia");
                SPRODUC= document.miForm.SPRODUC.value;
                //alert("SPRODUC: "+SPRODUC);
                CRAMO = document.miForm.CRAMO.value;
                CACTIVI = document.miForm.CACTIVI.value;
                //alert("CACTIVI:"+CACTIVI);
                objAjax.invokeAsyncCGI("axis_axisrea025.do", callbackAjaxActualizaGarantia, 
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
                objAjax.invokeAsyncCGI("axis_axisrea025.do", callbackAjaxActualizaVersion, 
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
            
             /* ************************* CAMBIA CONTRATO **************************** */
            function f_actualiza_version(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio contrato");
                SCONTRA= document.miForm.SCONTRA.value;
                objAjax.invokeAsyncCGI("axis_axisrea025.do", callbackAjaxActualizaVersion, 
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
                
                document.miForm.SCONTRA_DEL.value = SCONTRA;
                document.miForm.NVERSIO_DEL.value = NVERSIO;
                document.miForm.SPRODUC_DEL.value = SPRODUC;
                document.miForm.CACTIVI_DEL.value = CACTIVI;
                document.miForm.CGARANT_DEL.value = CGARANT;
                document.miForm.CCAMPO_DEL.value = CCAMPO;
                document.miForm.CCLAVE_DEL.value = CCLAVE;
                
                objUtiles.ejecutarFormulario("axis_axisrea025.do", "borrar_formula", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
         
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */   
         
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            /* ********************************************************************************************************* */
            
        </script>
    </head>
    <body  onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/> 
            <input type="hidden" id="NOU" name="NOU" value="${__formdata.NOU}"/> 
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/> 
            
            <input type="hidden" id="SCONTRA_DEL" name="SCONTRA_DEL" value="${__formdata.SCONTRA_DEL}"/> 
            <input type="hidden" id="SPRODUC_DEL" name="SPRODUC_DEL" value="${__formdata.SPRODUC_DEL}"/> 
            <input type="hidden" id="SVERSION_DEL" name="SVERSION_DEL" value="${__formdata.SVERSION_DEL}"/> 
            <input type="hidden" id="CRAMO_DEL" name="CRAMO_DEL" value="${__formdata.CRAMO_DEL}"/> 
            <input type="hidden" id="CMODALI_DEL" name="CMODALI_DEL" value="${__formdata.CMODALI_DEL}"/> 
            <input type="hidden" id="CCOLECT_DEL" name="CCOLECT_DEL" value="${__formdata.CCOLECT_DEL}"/> 
            <input type="hidden" id="CTIPSEG_DEL" name="CTIPSEG_DEL" value="${__formdata.CTIPSEG_DEL}"/> 
            <input type="hidden" id="CACTIVI_DEL" name="CACTIVI_DEL" value="${__formdata.CACTIVI_DEL}"/> 
            <input type="hidden" id="CGARANT_DEL" name="CGARANT_DEL" value="${__formdata.CGARANT_DEL}"/> 
         <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea026|<axis:alt f="axisrea026" c="LIT_MODAL_AXISREA024" lit="9902281" /></c:param>
            </c:import>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea025" c="LIT_NOMBRE_FOMRULARIO" lit="9902271" /></c:param>
                 <c:param name="producto"><axis:alt f="axisrea025" c="ALT_NOMBRE_PANTALLA" lit="9902271" /></c:param>
                <c:param name="form">axisrea025</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
               
                  <div class="titulo">&nbsp;
                    <img src="images/flecha.gif"/>
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea025" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_axisrea024();" style="cursor:pointer"/>
                        
                  </div>
                  <!-- Detalle cabecera de contrato -->
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
                                  <axis:visible f="axisrea025" c="CRAMO">
                                    <td class="titulocaja" ><!-- CRAMO  -->
                                      <b><axis:alt f="axisrea025" c="LIT_CRAMO" lit="100784"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea025" c="CMODALI">
                                    <td class="titulocaja" ><!-- CMODALI  -->
                                      <b><axis:alt f="axisrea025" c="LIT_CMODALI" lit="100943"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea025" c="CTIPSEG">
                                    <td class="titulocaja" ><!-- CTIPSEG  -->
                                      <b><axis:alt f="axisrea025" c="LIT_CTIPSEG" lit="102098"/></b>
                                    </td>
                                  </axis:visible>  
                          </tr>
                         
                          <tr> <!-- Linea de campos de entrada -->
                          
                                <td class="campocaja" colspan="1"> <%-- CRAMO --%>
                                        <axis:ocultar f="axisrea025" c="CRAMO"> <!-- Linia 1. Columna 2. -->
                                            <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> onchange="f_actualiza_producto(); " obligatorio="false" style="width:90%;">                               
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
                                        <input type="text" class="campo campotexto"  obligatorio="false" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> id="CMODALI" name="CMODALI" style="width:80%"
                                                      value="${__formdata.CMODALI}" <axis:atr f="axisrea029" c="CMODALI" a="modificable=true"/>/>
                                  </td>
                                  <td>
                                        <input type="text" class="campo campotexto"  obligatorio="false" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> id="CTIPSEG" name="CTIPSEG" style="width:80%"
                                                      value="${__formdata.CTIPSEG}" <axis:atr f="axisrea029" c="CTIPSEG" a="modificable=true"/>/>
                                  </td>
                         </tr>
                         
                          <tr>
                                  <axis:visible f="axisrea025" c="SPRODUC">
                                    <td class="titulocaja" ><!-- PRODUCTO -->
                                      <b><axis:alt f="axisrea025" c="LIT_SPRODUC" lit="100829"/></b>
                                    </td>
                                  </axis:visible> 
                                  <axis:visible f="axisrea025" c="CACTIVI">
                                    <td class="titulocaja" ><!--ACTIVIDAD -->
                                      <b><axis:alt f="axisrea025" c="LIT_CACTIVI" lit="103481"/></b>
                                    </td>
                                  </axis:visible> 
                                  <axis:visible f="axisrea025" c="CGARANT">
                                    <td class="titulocaja" ><!--GARANTIA -->
                                      <b><axis:alt f="axisrea025" c="LIT_CGARANT" lit="100561"/></b>
                                    </td>
                                  </axis:visible>  
                          
                          </tr>
                         
                         <tr> 
                                <td class="campocaja" colspan="1"> <%-- SPRODUC --%>
                                        <axis:ocultar f="axisrea025" c="SPRODUC"> <!-- Linia 1. Columna 2. -->
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> onchange="f_actualiza_actividad();" obligatorio="false" style="width:90%;">                               
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
                                        <select name="CACTIVI" id="CACTIVI" size="1" class="campowidthselect campo campotexto" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> onchange="f_actualiza_garantia();" obligatorio="false" style="width:90%;">                               
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
                                    <axis:ocultar f="axisrea025" c="CGARANT"> <!-- Linia 1. Columna 2. -->
                                        <select name="CGARANT" id="CGARANT" size="1" class="campowidthselect campo campotexto" onchange="" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_CGARANT_SEL" lit="108341"/> - </option>
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
                                  <axis:visible f="axisrea025" c="SCONTRA">
                                    <td class="titulocaja" ><!--CONTRATO -->
                                      <b><axis:alt f="axisrea025" c="LIT_CONTRAT" lit="101945"/></b>
                                    </td>
                                  </axis:visible>  
                                  <axis:visible f="axisrea025" c="NVERSIO">
                                    <td class="titulocaja" ><!--NVERSION -->
                                      <b><axis:alt f="axisrea025" c="LIT_NVERSIO" lit="9001146"/></b>
                                    </td>
                                  </axis:visible>  
                                </tr>
                                <tr>
                                    <td class="campocaja" colspan="1"> <%-- SCONTRA --%>
                                    <axis:ocultar f="axisrea025" c="SCONTRA"> <!-- Linia 1. Columna 2. -->
                                        <select name="SCONTRA" id="SCONTRA" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea025" c="SCONTRA" a="modificable=true&isInputText=true&obligatorio=false"/>  onchange="f_actualiza_version()" obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
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
                                    <axis:ocultar f="axisrea025" c="NVERSIO"> <!-- Linia 1. Columna 2. -->
                                        <select name="NVERSIO" id="NVERSIO" size="1" <c:if test="${__formdata.MODO=='MOD'}" >disabled</c:if> class="campowidthselect campo campotexto"  <axis:atr f="axisrea025" c="NVERSIO" a="modificable=true&isInputText=true&obligatorio=false"/>  onchange="" obligatorio="false" style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea025" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaVersion}">
                                                <option value = "${element.NVERSIO}" 
                                                <c:if test="${element.NVERSIO == __formdata.NVERSIO}"> selected </c:if> >
                                                 ${element.TCONTRA} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                </td>
                            
                         
                                </tr>
                               
                          <div class="separador">&nbsp;</div>
                          <tr>
                            <axis:visible f="axisrea025" c="SCONTRA">
                                <td class="titulocaja" colspan="4"><!--Lista Fórmulas -->
                                  <b><axis:alt f="axisrea025" c="LIT_LIST_PROD_1" lit="9000745"/>&nbsp;<axis:alt f="axisrea025" c="LIT_LIST_PROD_DESC" lit="110916"/></b>
                                </td>
                                
                                <td>
                                    <axis:visible f="axisrea025" c="ALTA_FORMULA">
                                                   <a href="javascript:f_abrir_axisrea026('ALTA')"><img style="float:right;" border="0" alt="<axis:alt f="axisrea025" c="ALT_IMG_NUEVO" lit="9001816"/>" title="<axis:alt f="axisrea025" c="ALT_IMG_NUEVO_OP" lit="9001816"/>" src="images/new.gif"/></a>
                                    </axis:visible>
                                </td>
                            </axis:visible>
                          </tr>
                          <tr>
                            <td colspan="5">
                            
                            <table class="area" align="left"> <!-- multirregistro de tramos -->
                                    <tr>
                                      <td>
                                        <c:set var="title1"><axis:alt f="axisrea025" c="ALT_TRAMO" lit="101945"/>/<axis:alt f="axisrea025" c="ALT_VERSION" lit="9001146"/></c:set>  <%-- Contrato --%>
                                        <c:set var="title2"><axis:alt f="axisrea025" c="ALT_NRODEN" lit="100784"/></c:set>   <%-- Ramo --%>
                                        <c:set var="title3"><axis:alt f="axisrea025" c="ALT_BORDERO" lit="100943"/></c:set>   <%-- Modalidad --%>
                                        <c:set var="title4"><axis:alt f="axisrea025" c="ALT_IMPTRAMO" lit="102098"/></c:set>   <%-- Tipo seguro --%>
                                        <c:set var="title5"><axis:alt f="axisrea025" c="ALT_QUOTE" lit="9001021"/></c:set>   <%-- % Colectivo --%>
                                        <c:set var="title6"><axis:alt f="axisrea025" c="ALT_PROTECCION" lit="103481"/></c:set>   <%-- Actividad --%>
                                        <c:set var="title7"><axis:alt f="axisrea025" c="ALT_VERS_GARANT" lit="100561"/></c:set>   <%-- Garantía --%>
                                        <c:set var="title8"><axis:alt f="axisrea025" c="ALT_VERS_TPRODCT" lit="100829"/></c:set>   <%-- TPRODUC --%>
                                        <c:set var="title9"><axis:alt f="axisrea025" c="ALT_VERS_BORRAR_OPC" lit="9001333"/></c:set>   <%-- Borrar --%>
                                        <c:set var="title10"><axis:alt f="axisrea025" c="ALT_VERS_EDIT_OPC" lit="9901356"/></c:set>   <%-- Editar --%>

                                        <div class="displayspace" id="dt_tramos">
                                          <display:table name="${__formdata.listaProductos}" id="T_IAX_PROD" export="false" class="dsptgtable" 
                                          pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                          requestURI="axis_axisrea025.do?operation=form&paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <%--display:column headerClass="headwidth5 sortable" title="" media="html" autolink="false" >
                                              <div class="dspIcons">
                                                <input value="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMO }" <c:if test="${T_IAX_TRAMOS_REA.OB_IAX_TRAMOS_REA.CTRAMO==__formdata.OB_IAX_TRAMOS_REA.CTRAMO}">checked</c:if> onclick="javascript:f_seleccionar_tramo()" type="radio" id="radioCTRAMO" name="radioCTRAMO" selected="true"/>
                                              </div>
                                            </display:column--%>                                                                       
                                            <display:column title="${title1}" sortable="true" sortProperty="T_IAX_PROD.SCONTRA" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.SCONTRA} - ${T_IAX_PROD.NVERSIO}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="T_IAX_PROD.TRAMO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.TRAMO}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="T_IAX_PROD.CMODALI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.CMODALI}</div>
                                            </display:column>
                                            <display:column title="${title4}" sortable="true" sortProperty="T_IAX_PROD.CTIPSEG" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.CTIPSEG}</div>
                                            </display:column>
                                            <display:column title="${title5}" sortable="true" sortProperty="T_IAX_PROD.CCOLECT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.CCOLECT} <c:if test="${! empty T_IAX_PROD.OB_IAX_TRAMOS_REA.PLOCAL}"> %</c:if></div>
                                            </display:column>
                                            <display:column title="${title6}" sortable="true" sortProperty="T_IAX_PROD.TACTIVI" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.TACTIVI}</div>
                                            </display:column>
                                            <display:column title="${title7}" sortable="true" sortProperty="T_IAX_PROD.TGARANT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.TGARANT}</div>
                                            </display:column>
                                            <display:column title="${title8}" sortable="true" sortProperty="T_IAX_PROD.TPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_PROD.TPRODUC}</div>
                                            </display:column>
                                            <axis:visible f="axisrea025" c="BT_EDIT">
                                                <display:column title="${title10}" sortable="true" sortProperty="T_IAX_PROD.SCONTRA" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspIcon"><a href="javascript:f_modif_axisrea026('${T_IAX_PROD.SPRODUC}', '${T_IAX_PROD.CRAMO}', '${T_IAX_PROD.CGARANT}', '${T_IAX_PROD.SCONTRA}','${T_IAX_PROD.NVERSIO}','${T_IAX_PROD.CCOLECT}','${T_IAX_PROD.CACTIVI}','${T_IAX_PROD.CTIPSEG}','${T_IAX_PROD.CMODALI}','${T_IAX_PROD.ILIMSUB}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA" lit="9000552"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT" lit="9000552"/>" src="images/lapiz.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea025" c="BT_BORRAR">
                                                <display:column title="${title9}" sortable="true" sortProperty="T_IAX_PROD.SCONTRA" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspIcon"><a href="javascript:f_borrar_producto('${T_IAX_PROD.SPRODUC}', '${T_IAX_PROD.CRAMO}', '${T_IAX_PROD.CGARANT}', '${T_IAX_PROD.SCONTRA}','${T_IAX_PROD.NVERSIO}','${T_IAX_PROD.CCOLECT}','${T_IAX_PROD.CACTIVI}','${T_IAX_PROD.CTIPSEG}','${T_IAX_PROD.CMODALI}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA_DESC" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DESC" lit="9001333"/>" src="images/delete.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                          </display:table>
                                        </div>  
                                      </td>
                                    </tr>
                                </table>
                            </td>
                          </tr>
               </table>
           

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea025</c:param><c:param name="f">axisrea025</c:param>
            <c:param name="__botones">cancelar,buscar,aceptar</c:param> 
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>