<%/*
*  Fichero: axisret002.jsp
*  Fecha: 04/09/2012
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisret002" c="LIT_TITULO" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="Stylesheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
        
        function f_onload() {  
            revisarEstilos();
            var idconv = "${__formdata.IDCONVENIO}";
             var modo = "${__formdata.MODO}";
           
            if (objUtiles.estaVacio(idconv) ) {
               f_but_buscar();
            }
            
            
            f_cargar_propiedades_pantalla();
            
            
            
        }
        
        function f_but_salir() {
            // bug 0024892
            var pIDCONVENIO=document.miForm.IDCONVENIO.value;
            var pPACCION = 0;
            objAjax.invokeAsyncCGI("axis_axisret002.do", callbackAjaxValidaConvenio, "operation=ajax_validaconvenio&pIDCONVENIO="+pIDCONVENIO+"&pPACCION="+pPACCION, this, objJsMessages.jslit_cargando);
        }

        function callbackAjaxValidaConvenio(ajaxResponseText){
            // bug 0024892
            // alert("callbackAjaxValidaConvenio --> "+ajaxResponseText);
            
            try {
            var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("PRESULT")[0])){
                        var PRESULT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("PRESULT"), 0, 0);
                        if (PRESULT!=null && PRESULT!='') {
                           // ¿ desea borrar el convenio ?
                           var confirma=confirm(PRESULT+" "+"<axis:alt f="axisret002" c="LIT_CONFIRMABORRAR" lit="9904592" />");
                           if (confirma) {
                               // Si el usuario confirma, borramos el convenio
                               var pIDCONVENIO=document.miForm.IDCONVENIO.value;
                               var pPACCION = 1;
                               objAjax.invokeAsyncCGI("axis_axisret002.do", callbackAjaxBorraConvenio, "operation=ajax_validaconvenio&pIDCONVENIO="+pIDCONVENIO+"&pPACCION="+pPACCION, this, objJsMessages.jslit_cargando);
                           }
                        }
                    } else {
                      objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisret002", "cancelar", document.miForm, "_self");
                    }  
                } else {
                  objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisret002", "cancelar", document.miForm, "_self");
                }                    
              }catch(e){}
        }
        
        function callbackAjaxBorraConvenio(ajaxResponseText){
            //  bug 0024892
            // alert("callbackAjaxBorraConvenio --> "+ajaxResponseText);
            var doc = objAjax.domParse(ajaxResponseText);
            if (objAppMensajes.existenErroresEnAplicacion(doc)){    
                   // alert("error al callbackAjaxBorraConvenio");      
               }
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisret002", "cancelar", document.miForm, "_self");
        }

        function f_but_buscar() {
            document.miForm.TFILE.value = '';
            document.miForm.TFILE_CARTAS.value = '';
            f_abrir_modal('axisret001');
        }
        
        function f_aceptar_axisret001(SSEGURO,SRECREN){
            f_cerrar_modal('axisret001');
            //document.miForm.SSEGURO.value = SSEGURO;
            //document.miForm.SRECREN.value = SRECREN;
            //objUtiles.ejecutarFormulario("axis_axisret002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            
        }
           
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm037')
                objUtiles.ejecutarFormulario("axis_axisret002.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_detallrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm003', "src", "axis_axisadm003.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisret002');        
        }
        
        function f_modificarrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm018', "src", "axis_axisadm018.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisret002');        
        }
        function f_but_aceptar(){
             objUtiles.ejecutarFormulario("axis_axisret002.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_9000745(){
             objUtiles.ejecutarFormulario("axis_axisret002.do", "generar_listados", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_140646(){
             objUtiles.ejecutarFormulario("axis_axisret002.do", "generar_cartas", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_set_revisar(thiss,NRECIBO){
        var CDEVSIT = thiss.checked ? 2 : 1;
        var sdevolu = "${__formdata.SDEVOLU}";
        
        var params = "?NRECIBO="+NRECIBO;
        params = params + "&CDEVSIT="+CDEVSIT;
        params = params + "&SDEVOLU="+sdevolu;
        
        
        objAjax.invokeAsyncCGI("axis_axisret002.do"+params, callbackGuardarSetRecRevis, 
                        "operation=ajax_guardarRecRevis",
                        this,objJsMessages.jslit_cargando);
        
        }
        
        function callbackGuardarSetRecRevis (ajaxResponseText) {

                var doc = objAjax.domParse(ajaxResponseText);
                // Comprobar errores
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   null;
                }
        }
        
        

        /* *************************************************************************************************** */
        /* ***************************************** FUNCIONES PAGINA **************************************** */
        /* *************************************************************************************************** */
        
        function f_alta_convenio(){
            //alert("aqui 1");
            var IDCONVENIO=null;
            var MODO="NUEVO";
            //alert("aqui 2");
            f_cerrar_modal('axisret001');
            objUtiles.abrirModal('axisret003', "src", "modal_axisret003.do?operation=form&IDCONVENIO="+IDCONVENIO+"&OK=KO"+'&origen=axisret002');  
        }
        
        
        function f_editar_cabecera_convenio(){
            //alert("aqui 1");
            var IDCONVENIO=document.miForm.IDCONVENIO.value;
            var CODCONV=document.miForm.CODCONV.value;
            var TDESCONV=document.miForm.TDESCONV.value;
            var CUSERAUT=document.miForm.CUSERAUT.value;
            var FINIVIG=document.miForm.FINIVIG.value;
            var FFINVIG=document.miForm.FFINVIG.value;
            var MODO="NUEVO";

            var SPERSON=document.miForm.SPERSON.value;
            var TNOMTOM=document.miForm.TNOMTOM.value;
            var NNUMIDE=document.miForm.NNUMIDE.value;

            objUtiles.abrirModal('axisret003', "src", "modal_axisret003.do?operation=form&IDCONVENIO="+IDCONVENIO+"&CODCONV_SEL="+CODCONV+"&TDESCONV_SEL="+TDESCONV+"&CUSERAUT_SEL="+CUSERAUT+"&FINIVIG_SEL="+FINIVIG+"&FFINVIG_SEL="+FFINVIG+"&SPERSON="+SPERSON+"&TNOMTOM="+TNOMTOM+"&NNUMIDE="+NNUMIDE+"&OK=KO"+'&origen=axisret002');  
        }
        
        function f_editar_productos(){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              var CRAMO = document.miForm.CRAMO.value;
              //alert("valor CRAMO= "+CRAMO+"**");
              objUtiles.abrirModal('axisret004', "src", "modal_axisret004.do?operation=form&IDCONVENIO=" + IDCONVENIO+"&origen=axisret002&CRAMO="+CRAMO);  
        }
        
        function f_anyadir_intermediario(){
              
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              var CAGENTE=document.miForm.CAGENTE.value;
              //alert("****************** "+CAGENTE);
              objUtiles.abrirModal('axisret005', "src", "modal_axisret005.do?operation=form&IDCONVENIO=" + IDCONVENIO+"&origen=axisret002&CAGENTE="+CAGENTE+"&MODO_AGENTE=CTIPAGE_4");  
        }
        
        function f_anyadir_beneficiario(){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              var CAGENTE=document.miForm.CAGENTE.value;
              //alert("****************** "+CAGENTE);
              objUtiles.abrirModal('axisret006', "src", "modal_axisret006.do?operation=form&IDCONVENIO=" + IDCONVENIO+"&origen=axisret002&MODO_AGENTE=CTIPAGE_4"+"&CAGENTE="+CAGENTE);  
        }
        
        function f_anyadir_cabecera(){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              objUtiles.abrirModal('axisret003', "src", "modal_axisret003.do?operation=form&IDCONVENIO=" + IDCONVENIO+"&origen=axisret002");  
        }
        
        function f_borrar_intermediario(CAGENTE){
              //////alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objUtiles.ejecutarFormulario("axis_axisret002.do?CAGENTE_DEL="+CAGENTE, "borrar_intermediario", document.miForm, "_self", objJsMessages.jslit_cargando); 
                }
        }
        
        function f_borrar_beneficiario(SPERSON){
              //alert("IDCNVENIO:" + document.miForm.IDCONVENIO.value);
              var IDCONVENIO = document.miForm.IDCONVENIO.value;
              var confirma=confirm(objJsMessages.jslit_confirma_borrar);
                if (confirma) {
                    objUtiles.ejecutarFormulario("axis_axisret002.do?SPERSON_DEL="+SPERSON, "borrar_beneficiario", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
        }
       
        function f_editar_convenio(IDCONVENIO){
             document.miForm.IDCONVENIO.value=IDCONVENIO;
             f_cerrar_modal('axisret001');
             objUtiles.ejecutarFormulario("axis_axisret002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
      
        /* **************************************************************************************************** */
        /* ********************************** TRATAMIENTO MODALES ********************************************* */
        /* **************************************************************************************************** */
        
        function f_aceptar_axisret004(){
             //alert("Antes de cerrar modal");
             f_cerrar_modal('axisret004');
             objUtiles.ejecutarFormulario("axis_axisret002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_aceptar_axisret005(){
             //alert("Antes de cerrar modal");
             f_cerrar_modal('axisret005');
             objUtiles.ejecutarFormulario("axis_axisret002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando); //init
        }
        
        function f_aceptar_axisret003(IDCONVENIO){
             //alert("Antes de cerrar modal IDCONEVNIO:"+IDCONVENIO);
             f_cerrar_modal('axisret003');
             document.miForm.IDCONVENIO.value=IDCONVENIO;
             objUtiles.ejecutarFormulario("axis_axisret002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
       function f_aceptar_axisret006(){
             //alert("Antes de cerrar modal");
             f_cerrar_modal('axisret006');
             objUtiles.ejecutarFormulario("axis_axisret002.do", "init", document.miForm, "_self", objJsMessages.jslit_cargando); //init
        }
        
        function f_cerrar_axisret006(){
             //alert("Antes de cerrar modal");
             f_cerrar_modal('axisret006');
            
        }
        
        /* *********************************************************************************************** */
        /* ***********************************     recalcular     **************************************** */
        /* *********************************************************************************************** */
        
        
        
  
        
       
      
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_PANTALLA" lit="9904208"/></c:param>     <%-- Gestión de devoluciones--%>
                <c:param name="formulario"><axis:alt f="axisret002" c="LIT_FORMULARIO" lit="9904208"/></c:param> <%-- Gestión de devoluciones --%>
                <c:param name="form">axisret002</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_MODAL_AXISRET001" lit="9904200" /></c:param>
                <c:param name="nid" value="axisret001" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_MODAL_AXISRET003" lit="9904266" /></c:param>
                <c:param name="nid" value="axisret003" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_MODAL_AXISRET004" lit="9904267" /></c:param>
                <c:param name="nid" value="axisret004" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_MODAL_AXISRET005" lit="9904206" /></c:param>
                <c:param name="nid" value="axisret005" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisret002" c="LIT_MODAL_AXISRET006" lit="9904183" /></c:param>
                <c:param name="nid" value="axisret006" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisret002" c="LIT_MODAL_IMPRIMIR" lit="1000205" />|true</c:param>
        </c:import>   
        
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SDEVOLU" id="SDEVOLU" value="${__formdata.SDEVOLU}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}"/>
        <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}"/>
        <input type="hidden" name="TFILE" id="TFILE" value="${__formdata.TFILE}"/>
         <input type="hidden" name="TFILE_CARTAS" id="TFILE_CARTAS" value="${__formdata.TFILE_CARTAS}"/>

        <div class="separador">&nbsp;</div>       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisret002" c="LIT_IMG_1" lit="9904267" />
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisret002" c="LIT_IMG_2" lit="100797" />" onclick="f_but_buscar();" style="cursor:pointer"/>                
                    </div>
                    <div style="float:right;" ><img  src="images/lapiz.gif" onclick="f_editar_cabecera_convenio()" style="cursor:pointer"/></div>
					<!-- ************************************************** SECCION CABECERA ***************************************************** -->
                    <table class="seccion" >
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <!-- Póliza -->
                                            <axis:visible f="axisret002" c="CODCONV" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret002" c="LIT_CODCONV" lit="109155" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axisret002" c="TDESCONV" >
                                                <td class="titulocaja" colspan="3">
                                                    <b><axis:alt f="axisret002" c="LIT_TDESCONV" lit="100588" /></b>
                                                </td>
                                             </axis:visible>	
                                            <axis:visible f="axisret002" c="TAUTORIZA" >
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisret002" c="LIT_TAUTORIZA" lit="9904202" /></b>
                                                </td>
                                             </axis:visible>
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisret002" c="CODCONV">
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="CODCONV" name="CODCONV" size="15"
                                                    value="${__formdata.CCODCONV}" <axis:atr f="axisret002" c="CODCONV" a="modificable=false"/>/>
                                                     </td>     
                                          </axis:visible> 
                                          <axis:visible f="axisret002" c="TDESCONV">
                                                    <td class="campocaja" colspan="3">
                                                    <input style="width:98%" type="text" class="campowidthinput campo campotexto" id="TDESCONV" name="TDESCONV" size="15"
                                                    value="${__formdata.TDESCONV}" <axis:atr f="axisret002" c="TDESCONV" a="modificable=false"/>/>
                                           </axis:visible>  
                                           <axis:visible f="axisret002" c="CUSERAUT">
                                                    <td class="campocaja">
                                                    <input style="width:98%" type="text" class="campowidthinput campo campotexto" id="CUSERAUT" name="CUSERAUT" size="15"
                                                    value="${__formdata.CUSERAUT}" <axis:atr f="axisret002" c="CUSERAUT" a="modificable=false"/>/>
                                           </axis:visible>  
                                        </tr>
                                        <tr>
                                             <!-- Fecha ini vig. -->
                                             <axis:visible f="axisret002" c="FINIVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret002" c="LIT_FINIVIG" lit="9000716" /></b>
                                                </td>
                                             </axis:visible>
                                              <!-- Fecha ini vig. -->
                                             <axis:visible f="axisret002" c="FFINVIG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret002" c="LIT_FFINVIG" lit="9000717" /></b>
                                                </td>
                                             </axis:visible>
                                              <!-- bug 0025815 -->
                                              <!-- Tomador -->
                                             <axis:visible f="axisret002" c="SPERSON" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisret002" c="LIT_SPERSON" lit="109360" /></b>
                                                </td>
                                             </axis:visible>
                                        </tr>
                                        
                                        <tr>
                                            <axis:visible f="axisret002" c="FINIVIG">
                                                    <td class="campocaja" >
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FINIVIG" name="FINIVIG" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>" <axis:atr f="axisret002" c="FINIVIG" a="modificable=false"/>/>
                                                    </td>  
                                            </axis:visible> 
                                            <axis:visible f="axisret002" c="FFINVIG">
                                                    <td class="campocaja" >
                                                    <input style="width:60%" type="text" class="campowidthinput campo campotexto" id="FFINVIG" name="FFINVIG" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINVIG}"/>" <axis:atr f="axisret002" c="FFINVIG" a="modificable=false"/>/>
                                                    </td>  
                                            </axis:visible> 
                                            <!-- bug 0025815 -->
                                            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}">
                                            <input type="hidden" id="NNUMIDE" name="NNUMIDE" value="${__formdata.NNUMIDE}">
                                            <axis:visible f="axisret002" c="SPERSON">
                                                    <td class="campocaja" colspan="2">
                                                    <input style="width:98%" type="text" class="campowidthinput campo campotexto" id="TNOMTOM" name="TNOMTOM" size="15"
                                                    value="${__formdata.TNOMTOM}" <axis:atr f="axisret002" c="TNOMTOM" a="modificable=false"/>/>
                                            </axis:visible>  
                                         </tr>
                                    </table>     
                                   
                                </td>
                                </tr>
                    </table>  

					<!-- ************************************************** SECCION DATOS ********************************************************* -->

					<div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisret002" c="LIT_IMG_DAT" lit="9904268" />
                                   
                    </div>
                    <table class="seccion" >
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                            <th style="width:20%;height:0px"></th>
                                        </tr>
                                         
                                        <tr>
                                                <td class="campocaja" colspan="2">
                                                    <input style="width:50%" type="hidden" class="campowidthinput campo campotexto" id="TRAMO" name="TRAMO" size="15"
                                                    value="${__formdata.TRAMO}" title="<axis:alt f="axisret002" c="ALT_TRAMO" lit="100885"/>" <axis:atr f="axisret002" c="TRAMO" a="modificable=false"/>/>
                                                    <input style="width:50%" type="hidden" class="campowidthinput campo campotexto" id="CRAMO" name="CRAMO" size="15"
                                                    value="${__formdata.CRAMO}" title="<axis:alt f="axisret002" c="ALT_CRAMO" lit="100885"/>" <axis:atr f="axisret002" c="CRAMO" a="modificable=false"/>/>
                                                 </td>
                                         </tr>
                                       
                                       
                                       <!-- <div style="float:right;" id="DATOS_PRODUCTOS"><img id="DSP_PRODUCTOS_parent" src="images/lapiz.gif" onclick="f_editar_productos()" style="cursor:pointer"/></div>  -->
                                       
                                                                            
                                         <!-- ************************************************************************************************************* -->
                                         <!-- ************************************   LISTA INTERMEDIARIOS  ************************************************ -->
                                         <!-- ************************************************************************************************************* -->
                                         
                                         <tr>
                                                <td class="campocaja" colspan="3">
                                                                <div style="float:left;"><b><axis:alt f="axisret002" c="LIT_PRODUCTOS" lit="110916"/></b></div>
                                                                <div style="float:right;" id="DATOS_PROD"><img id="DATOS_PROD_parent" src="images/lapiz.gif" onclick="f_editar_productos()" style="cursor:pointer"/></div>
                                                </td>                    
                                         </tr>
                                                        <!-- titulo -->
                                         <tr>
                                                <td align="left" colspan="3">
                                                     <table border="0" class="area" align="left" style="width:100%;">
                                                       
                                                        <tr>
                                                            <td>
                                                                <c:set var="title0"><axis:alt f="axisret002" c="LISTA_PRODUCTO" lit="9902909"/></c:set>
                                                                
                                                
                                                               
                    
                                                                <div class="seccion displayspaceGrande">
                                                                <display:table name="${lista_productos}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="axis_axisret002.do?paginar=true"
                                                                sort="list" cellpadding="0" cellspacing="0">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                  
                                                                    <%--display:column title="" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.SPRODUC}</div>
                                                                    </display:column--%>
                                                                    
                                                                    <display:column title="${title0}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId.TPRODUC}</div>
                                                                    </display:column>
                                                                  
                                                                 </display:table> 
                                                                </div>	
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                         </tr>
                                            
                                                   
                                       
                                         
                                         
                                         <!-- ************************************************************************************************************* -->
                                         <!-- ************************************   LISTA INTERMEDIARIOS  ************************************************ -->
                                         <!-- ************************************************************************************************************* -->
                                         
                                         <tr>
                                                <td class="campocaja" colspan="5">
                                                                <div style="float:left;"><b><axis:alt f="axisret001" c="LISTA_NAME_INT" lit="9904203"/></b></div>
                                                                <div style="float:right;" id="DATOS_CORRETAJE"><img id="DSP_CORRETAJE_parent" src="images/new.gif" onclick="f_anyadir_intermediario()" style="cursor:pointer"/></div>
                                                </td>                    
                                         </tr>
                                                        <!-- titulo -->
                                         <tr>
                                                <td align="left" colspan="5">
                                                     <table border="0" class="area" align="left" style="width:100%;">
                                                       
                                                        <tr>
                                                            <td>
                                                                <c:set var="title0"><axis:alt f="axisret002" c="LISTA_CAGENTE" lit="100584"/></c:set>
                                                                <c:set var="title1"><axis:alt f="axisret002" c="LISTA_TDESCRI" lit="105940"/></c:set>
                                                                <c:set var="title2"><axis:alt f="axisret002" c="LISTA_FINIVIG" lit="9000716"/></c:set>

                                                                <div class="seccion displayspaceGrande">
                                                                <display:table name="${lista_intermediarios}" id="miListaId2" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="axis_axisret002.do?paginar=true"
                                                                sort="list" cellpadding="0" cellspacing="0">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                  
                                                                    <display:column title="${title0}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId2.CAGENTE}</div>
                                                                    </display:column>
                                                                    <display:column title="${title1}" headerClass="sortable" sortProperty="TDESCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId2.TNOMAGE}</div>
                                                                    </display:column>
                                                                    <display:column title="${title4}" headerClass="headwidth5 sortable" sortProperty="TNOMTOM"  media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                            <img border="0"
                                                                                alt='<axis:alt f="axisret002" c="MENS_BORR" lit="9001333"/><axis:alt f="axisret002" c="MENS_ALT" lit="9902363"/>'
                                                                                title1='<axis:alt f="axisret002" c="MENS_BORR" lit="9001333"/><axis:alt f="axisret002" c="MENS_ALT" lit="9902363"/>'
                                                                                src="images/delete.gif"
                                                                                style="cursor:pointer;"
                                                                                onclick="f_borrar_intermediario('${miListaId2.CAGENTE}')"/>
                                                                        </div>
                                                                    </display:column>
                                                                 </display:table> 
                                                                </div>	
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                         
                                         
                                         
                                                                                  
                                         <!-- ************************************************************************************************************* -->
                                         <!-- ************************************   LISTA BENEFICIARIOS  ************************************************ -->
                                         <!-- ************************************************************************************************************* -->
                                         
                                         <tr>
                                                            <td class="campocaja" colspan="5">
                                                                <div style="float:left;"><b><axis:alt f="axisret001" c="LISTA_NAME_BNF" lit="9904204"/></b></div>
                                                                <div style="float:right;" id="DATOS_INT"><img id="DSP_INT_parent" src="images/new.gif" onclick="f_anyadir_beneficiario()" style="cursor:pointer"/></div>
                                                            </td>                    
                                         </tr>
                                                        <!-- titulo -->
                                         <tr>
                                                <td align="left" colspan="5">
                                                     <table border="0" class="area" align="left" style="width:100%;">
                                                       
                                                        <tr>
                                                            <td>
                                                                <c:set var="title0"><axis:alt f="axisret002" c="LISTA_BENE" lit="9001911"/></c:set>
                                                                <c:set var="title1"><axis:alt f="axisret002" c="LISTA_PORC" lit="101467"/></c:set>
                                                                  
                                                                <div class="seccion displayspaceGrande">
                                                                <display:table name="${lista_retornos}" id="miListaId3" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="axis_axisret002.do?paginar=true"
                                                                sort="list" cellpadding="0" cellspacing="0">
                                                                    <%@ include file="../include/displaytag.jsp"%>
                                                                  
                                                                    
                                                                     <display:column title="${title0}" headerClass="sortable" sortProperty="CCODCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId3.TNOMBEN}</div>
                                                                    </display:column>
                                                                    <display:column title="${title1}" headerClass="sortable" sortProperty="TDESCONV"  media="html" autolink="false" >
                                                                        <div class="dspText">${miListaId3.PRETORNO}</div>
                                                                    </display:column>
                                                                    <!-- bug 0025580 -->
                                                                    <!-- bug 0025815 -->

                                                                    
                                                                    <display:column title="${title4}" headerClass="headwidth5 sortable" sortProperty="TNOMTOM"  media="html" autolink="false" >
                                                                        <div class="dspIcons">
                                                                            <img border="0"
                                                                                alt='<axis:alt f="axisret002" c="MENS_BORR" lit="9001333"/><axis:alt f="axisret002" c="MENS_BEN" lit="9001911"/>'
                                                                                title1='<axis:alt f="axisret002" c="MENS_BORR" lit="9001333"/><axis:alt f="axisret002" c="MENS_BEN" lit="9001911"/>'
                                                                                src="images/delete.gif"
                                                                                style="cursor:pointer;"
                                                                                onclick="f_borrar_beneficiario('${miListaId3.SPERSON}')"/>
                                                                        </div>
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
					



					<!-- ************************************************************************************************************************** -->
					
					
                </td>
            </tr>
        </table>
        
                    
                      
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisret002</c:param><c:param name="f">axisret002</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <axis:visible f="axisret002" c="BT_FMOVINI">
    <script type="text/javascript">
    
    Calendar.setup({
        inputField     :    "FMOVINI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FMOVINI", 
        singleClick    :    true,
        firstDay       :    1
    });
    
    
    </script>
    </axis:visible>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>