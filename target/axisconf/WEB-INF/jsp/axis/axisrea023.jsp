<%/**23.jsp
*  Asociación de fórmulas a garantías
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
        <title><axis:alt f="axisrea023" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
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

                 // f_abrir_axisrea024();
                 
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario("flujodetrabajo.do?forigen=axisrea023", "cancelar", document.miForm, "_self");
            }
            
            function f_but_editar() {
                var PERMITE_EDICION = '${requestScope.OB_IAX_CODICONTRATO_REA.CVALID}';   //1: No se puede modificar, porque lo hemos validado, y ha de ser procesado por el proceso batch
                if(PERMITE_EDICION!=null && PERMITE_EDICION!='1'){
                    f_cerrar_axisrea001();
                    param = "&SCONTRA_MOD="+objDom.getValorPorId("SCONTRA");
                    objUtiles.ejecutarFormulario("axis_axisrea023.do?" + param, "ModificarContrato", document.miForm, "_self", objJsMessages.jslit_cargando);             
                }else{
                    alert("<axis:alt f="axisrea005" c="LIT_CCOMPANI" lit="9902171"/>");
                }
            }
            
            /****************************************************************************************/
            /********************************** MODAL AXPLANTILLAJSP_MODAL **************************/
            /****************************************************************************************/
            var ptho=null;
            function f_nuevo_axisrea024(MODO) {
                SPRODUC= document.miForm.SPRODUC.value;
                CRAMO= document.miForm.CRAMO.value;
                CGARANT= document.miForm.CGARANT.value;
                SCONTRA= document.miForm.SCONTRA.value;
                NVERSIO= document.miForm.NVERSIO.value;
                //alert("SPRODUC:"+SPRODUC);
                //alert("CACTIVI:"+CACTIVI);
                //alert("CGARANT:"+CGARANT);
                //alert("SCONTRA:"+SCONTRA);
                //alert("NVERSIO:"+NVERSIO);
                objUtiles.abrirModal("axisrea024", "src", "modal_axisrea024.do?operation=form&SPRODUC="+SPRODUC+"&CRAMO="+CRAMO+"&CGARANT="+CGARANT+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&MODO="+MODO);  
            }
            
            function f_cerrar_axisrea024() {
                objUtiles.cerrarModal('axisrea024');
                
            }   
            
             function f_cerrar_modal(modal) {            
                f_cerrar_axisrea024();
            }
            
            function f_nuevo_axisrea023(pNUEVO) {                     
                document.miForm.NOU.value = pNUEVO;
                f_cerrar_axisrea001();               
                document.miForm.FCONINI.value = "";
                document.miForm.FCONFIN.value = "";
                document.miForm.TCONTRA.value = "";              
                document.miForm.SCONQP.value = "";
                document.miForm.PCEDIDO.value = "";
                document.miForm.ICAPACI.value = "";
                document.miForm.TOBSERV.value = "";
              
                objUtiles.ejecutarFormulario("axis_axisrea023.do", "BorrarObjCache", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisrea024() {
               f_cerrar_axisrea024();           
               objUtiles.ejecutarFormulario("axis_axisrea023.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                 objUtiles.ejecutarFormulario("axis_axisrea023.do?", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_modif_axisrea024(CCAMPO,CLAVE,CGARANT,SCONTRA,NVERSIO,CODIGO,SPRODUC) {
               
                var CRAMO_AUX = document.miForm.CRAMO.value;  //TODO: Faltaría por poner!!!
                var MODO = "MOD";
                //alert("  CCAMPO:"+CCAMPO+"  CLAVE:"+CLAVE+"  CGARANT:"+CGARANT+"  SCONTRA:"+SCONTRA+"  NVERSIO:"+NVERSIO + "SPRODUC:" + SPRODUC+"  CODIGO:"+CODIGO);
                objUtiles.abrirModal("axisrea024", "src", "modal_axisrea024.do?operation=form&SPRODUC="+SPRODUC+"&CRAMO="+CRAMO_AUX+"&CGARANT="+CGARANT+"&SCONTRA="+SCONTRA+"&NVERSIO="+NVERSIO+"&MODO="+MODO+"&CODIGO="+CODIGO+"&CCAMPO="+CCAMPO+"&CLAVE="+CLAVE);  
            }
            
            
            /****************************************************************************************/
            /******************************* CALLBACKS AJAX *****************************************/
            /****************************************************************************************/
            
            /* ************************* CAMBIA PRODUCTO **************************** */
            
            
            
            function f_actualiza_producto(){
                //  objValidador.validaEntrada();
                //alert("Antes del cambio producto");
                CRAMO = document.miForm.CRAMO.value;
                objAjax.invokeAsyncCGI("axis_axisrea023.do", callbackAjaxActualizaProducto, 
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
                objAjax.invokeAsyncCGI("axis_axisrea023.do", callbackAjaxActualizaGarantia, 
                    "operation=ajax_actualiza_garantia&SPRODUC=" + SPRODUC + "&CRAMO="+CRAMO, this,objJsMessages.jslit_actualizando_registro);
                    
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
                objAjax.invokeAsyncCGI("axis_axisrea023.do", callbackAjaxActualizaVersion, 
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
            
            function f_borrar_formula(CCAMPO,CLAVE,CGARANT,SCONTRA,NVERSIO,CODIGO,SPRODUC) {  
                
                document.miForm.SCONTRA_DEL.value = SCONTRA;
                document.miForm.NVERSIO_DEL.value = NVERSIO;
                document.miForm.SPRODUC_DEL.value = SPRODUC;
                //document.miForm.CACTIVI_DEL.value = CACTIVI;
                document.miForm.CGARANT_DEL.value = CGARANT;
                document.miForm.CCAMPO_DEL.value = CCAMPO;
                document.miForm.CLAVE_DEL.value = CLAVE;
                
                objUtiles.ejecutarFormulario("axis_axisrea023.do", "borrar_formula", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
         
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
            <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/> 
            <input type="hidden" id="NOU" name="NOU" value="${__formdata.NOU}"/> 
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/> <!-- TODO: ELIMINAR LOS QUE SEAN NECESARIOS -->
         
            <input type="hidden" id="SCONTRA_DEL" name="SCONTRA_DEL" value="${__formdata.SCONTRA_DEL}"/>
            <input type="hidden" id="NVERSIO_DEL" name="NVERSIO_DEL" value="${__formdata.NVERSIO_DEL}"/>
            <input type="hidden" id="SPRODUC_DEL" name="SPRODUC_DEL" value="${__formdata.SPRODUC_DEL}"/>
            <input type="hidden" id="CACTIVI_DEL" name="CACTIVI_DEL" value="${__formdata.CACTIVI_DEL}"/>
            <input type="hidden" id="CGARANT_DEL" name="CGARANT_DEL" value="${__formdata.CGARANT_DEL}"/>
            <input type="hidden" id="CCAMPO_DEL" name="CCAMPO_DEL" value="${__formdata.CCAMPO_DEL}"/>
            <input type="hidden" id="CLAVE_DEL" name="CLAVE_DEL" value="${__formdata.CLAVE_DEL}"/>
            <input type="hidden" id="CODIGO_DEL" name="CCLAVE_DEL" value="${__formdata.CODIGO_DEL}"/>
 
            <input type="hidden" id="CTIPREA" name="CTIPREA" value="${requestScope.OB_IAX_CODICONTRATO_REA.CTIPREA}"/> 
         <!-- Pantalla modal -->
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisrea024|<axis:alt f="axisrea024" c="LIT_MODAL_AXISREA024_AS" lit="9902279" /></c:param>
            </c:import>

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisrea023" c="LIT_NOMBRE_FOMRULARIO" lit="9902470" /></c:param>
                <c:param name="producto"><axis:alt f="axisrea023" c="ALT_NOMBRE_PANTALLA" lit="9902470" /></c:param>
                <c:param name="form">axisrea023</c:param>
            </c:import>
           
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>
               
                  <div class="titulo">&nbsp;
                    <img src="images/flecha.gif"/>
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisrea023" c="LIT_IMG_BUSCAR" lit="100002" />" onclick="f_abrir_axisrea024('MOD');" style="cursor:pointer"/>
                        
                  </div>
                  <!-- Detalle cabecera de contrato -->
                  <table class="seccion">
                    <tr>
                  
                      <td> 
                        <!-- Campos detalle de cabecera de contrato _ Area 1 _ -->
                        <table class="area" align="center">
                          <tr> <!-- Se establecen las columnas -->
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                          </tr>
                          <tr> <!-- Area 1. Línea 1. Títulos de campos -->
                          <axis:visible f="axisrea023" c="CRAMO">
                            <td class="titulocaja" ><!-- CRAMO  -->
                              <b><axis:alt f="axisrea023" c="LIT_CRAMO" lit="100784"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea023" c="SPRODUC">
                            <td class="titulocaja" ><!-- PRODUCTO -->
                              <b><axis:alt f="axisrea023" c="LIT_SPRODUC" lit="100829"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea023" c="CGARANT">
                            <td class="titulocaja" ><!--GARANTIA -->
                              <b><axis:alt f="axisrea023" c="LIT_CGARANT" lit="100561"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea023" c="SCONTRA">
                            <td class="titulocaja" ><!--CONTRATO -->
                              <b><axis:alt f="axisrea023" c="LIT_CONTRAT" lit="101945"/></b>
                            </td>
                          </axis:visible>  
                          <axis:visible f="axisrea023" c="NVERSIO">
                            <td class="titulocaja" ><!--NVERSION -->
                              <b><axis:alt f="axisrea023" c="LIT_NVERSIO" lit="9001146"/></b>
                            </td>
                          </axis:visible>  
                          </tr>
                          <tr> <!-- Linea de campos de entrada -->
                          
                                <td class="campocaja" colspan="1"> <%-- CRAMO --%>
                                        <axis:ocultar f="axisrea023" c="CRAMO"> <!-- Linia 1. Columna 2. -->
                                            <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" onchange="f_actualiza_producto(); "  obligatorio="false" style="width:90%;">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea023" c="ALT_CRAMO_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaRamo}">
                                                    <option value = "${element.CRAMO}" 
                                                    <c:if test="${element.CRAMO == __formdata.CRAMO}"> selected </c:if> >
                                                     ${element.TRAMO} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                  </td>
                          
                                <td class="campocaja" colspan="1"> <%-- SPRODUC --%>
                                        <axis:ocultar f="axisrea023" c="SPRODUC"> <!-- Linia 1. Columna 2. -->
                                            <select name="SPRODUC" id="SPRODUC" size="1" class="campowidthselect campo campotexto" onchange="f_actualiza_garantia();"  obligatorio="false" style="width:90%;">                               
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea023" c="ALT_SPRODUC_SEL" lit="108341"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaProducto}">
                                                    <option value = "${element.SPRODUC}" 
                                                    <c:if test="${element.SPRODUC == __formdata.SPRODUC}"> selected </c:if> >
                                                     ${element.TTITULO} 
                                                    </option>
                                                </c:forEach>
                                            </select>     
                                        </axis:ocultar>    
                                  </td>
                                  
                                  <td class="campocaja" colspan="1"> <%-- CGARANT --%>
                                    <axis:ocultar f="axisrea023" c="CGARANT"> <!-- Linia 1. Columna 2. -->
                                        <select name="CGARANT" id="CGARANT" size="1" class="campowidthselect campo campotexto" onchange="" obligatorio="false"  style="width:90%;">                               
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea023" c="ALT_CGARANT_SEL" lit="108341"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listaGarantia}">
                                                <option value = "${element.CGARANT}" 
                                                <c:if test="${element.CGARANT == __formdata.CGARANT}"> selected </c:if> >
                                                 ${element.TGARANT} 
                                                </option>
                                            </c:forEach>
                                        </select>     
                                    </axis:ocultar>    
                                  </td>
                                  <td class="campocaja" colspan="1"> <%-- SCONTRA --%>
                                    <axis:ocultar f="axisrea023" c="SCONTRA"> <!-- Linia 1. Columna 2. -->
                                        <select name="SCONTRA" id="SCONTRA" size="1" class="campowidthselect campo campotexto" 
											<axis:atr f="axisrea023" c="SCONTRA" a="modificable=true&isInputText=true&obligatorio=true"/> 
											onchange="f_actualiza_version()" obligatorio="true" style="width:90%;" 
											title="<axis:alt f="axisrea023" c="LIT_CONTRAT" lit="101945"/>" >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea023" c="ALT_SCONTRA_SEL" lit="108341"/> - </option>
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
                                    <axis:ocultar f="axisrea023" c="NVERSIO"> <!-- Linia 1. Columna 2. -->
                                        <select name="NVERSIO" id="NVERSIO" size="1" class="campowidthselect campo campotexto" 
											<axis:atr f="axisrea023" c="NVERSIO" a="modificable=true&isInputText=true&obligatorio=true"/> 
											onchange="" obligatorio="true" style="width:90%;" 
											title="<axis:alt f="axisrea023" c="LIT_NVERSIO" lit="9001146"/>">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea023" c="ALT_NVERSIO_SEL" lit="108341"/> - </option>
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
                            <axis:visible f="axisrea023" c="SCONTRA">
                                <td class="titulocaja" colspan="4"><!--Lista Fórmulas -->
                                  <b><axis:alt f="axisrea023" c="LIT_LIST_FORMULAS_1" lit="9000745"/> <axis:alt f="axisrea023" c="LIT_LIST_FORMULAS_1" lit="9001678"/></b>
                                </td>
                                
                                <td>
                                    <axis:visible f="axisrea023" c="ALTA_FORMULA">
                                                   <a href="javascript:f_nuevo_axisrea024('ALTA')"><img style="float:right;" border="0" alt="<axis:alt f="axisrea023" c="ALT_IMG_NUEVO" lit="9001816"/>&nbsp;<axis:alt f="axisrea023" c="ALT_IMG_NUEVO_DOC" lit="108347"/>" title="<axis:alt f="axisrea023" c="ALT_IMG_NUEVO_OS" lit="9001816"/>&nbsp;<axis:alt f="axisrea023" c="ALT_IMG_NUEVO_OS_TIT" lit="108347"/>" src="images/new.gif"/></a>
                                    </axis:visible>
                                </td>
                            </axis:visible>
                          </tr>
                          <tr>
                            <td colspan="5"> 
                            
                            <table class="area" align="left"> <!-- multirregistro de tramos -->
                                    <tr>
                                      <td>
                                        <c:set var="title1"><axis:alt f="axisrea023" c="ALT_TIP_FORMULA" lit="100565"/>&nbsp;<axis:alt f="axisrea023" c="ALT_TIP_FORMULA_2" lit="108347"/></c:set>  <%-- Tipo formula --%>
                                        <c:set var="title2"><axis:alt f="axisrea023" c="ALT_DESCRIPCION" lit="100588"/></c:set>   <%-- Descripción --%>
                                        <c:set var="title3"><axis:alt f="axisrea023" c="ALT_FORMULA" lit="108347"/></c:set>   <%-- Fórmula --%>
                                        <c:set var="title4"><axis:alt f="axisrea023" c="ALT_BORRAR" lit="9001333"/></c:set>   <%-- Borrar --%>
                                        <c:set var="title5"><axis:alt f="axisrea023" c="ALT_MODIFICAR" lit="9000552"/></c:set>   <%-- Modificar --%>
                                        <c:set var="title6"><axis:alt f="axisrea023" c="ALT_SPRODUC" lit="100829"/></c:set>   <%-- SPRODUC --%>
                                        <c:set var="title7"><axis:alt f="axisrea023" c="ALT_CGARANT" lit="100561"/></c:set>   <%-- CGARANT --%>
                                        <div class="displayspace" id="dt_tramos">
                                          <display:table name="${__formdata.listaFormulas}" id="T_IAX_FORMULAS_REA" export="false" class="dsptgtable" 
                                          pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                          requestURI="axis_axisrea023.do?operation=form&paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                                                                                              
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_FORMULAS_REA.CCAMPO}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TCAMPO" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_FORMULAS_REA.TCAMPO}</div>
                                            </display:column>
                                            <display:column title="${title6}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_FORMULAS_REA.TPRODUC}</div>
                                            </display:column>
                                             <display:column title="${title7}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.TGARANT" headerClass="sortable fixed"  media="html" autolink="false" >                                    
                                              <div class="dspText">${T_IAX_FORMULAS_REA.TGARANT}</div>
                                            </display:column>
                                            <axis:visible f="axisrea023" c="BT_EDIT">
                                                <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspIcon"><a href="javascript:f_modif_axisrea024('${T_IAX_FORMULAS_REA.CCAMPO}', '${T_IAX_FORMULAS_REA.CLAVE}', '${T_IAX_FORMULAS_REA.CGARANT}',  '${T_IAX_FORMULAS_REA.SCONTRA}', '${T_IAX_FORMULAS_REA.NVERSIO}',  '${T_IAX_FORMULAS_REA.CODIGO}', '${T_IAX_FORMULAS_REA.SPRODUC}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA_DOS" lit="9000552"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DP" lit="9000552"/>" src="images/lapiz.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible f="axisrea023" c="BT_BORRAR">
                                                <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TRAMOS_REA.CCAMPO" headerClass="headwidth5 sortable fixed"  media="html" autolink="false" >                                    
                                                    <div class="dspIcon"><a href="javascript:f_borrar_formula('${T_IAX_FORMULAS_REA.CCAMPO}', '${T_IAX_FORMULAS_REA.CLAVE}', '${T_IAX_FORMULAS_REA.CGARANT}',  '${T_IAX_FORMULAS_REA.SCONTRA}', '${T_IAX_FORMULAS_REA.NVERSIO}',  '${T_IAX_FORMULAS_REA.CODIGO}', '${T_IAX_FORMULAS_REA.SPRODUC}');"><img border="0" alt="<axis:alt f="axisrea003" c="ALT_IMG_ISCONTA_REL" lit="9001333"/>" title="<axis:alt f="axisrea003" c="ALT_ISONTA_LIT_DR" lit="9001333"/>" src="images/delete.gif"/></a> </div>
                                                </display:column>
                                            </axis:visible>
                                          </display:table>                                                                                                    
                                        </div>  
                                      </td>
                                    </tr>
                                </table>
                            </td>
                          </tr>
                        
                </td>
                </tr>
              </table>

            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea023</c:param><c:param name="f">axisrea023</c:param>
            <c:param name="__botones">salir,buscar</c:param> 
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>