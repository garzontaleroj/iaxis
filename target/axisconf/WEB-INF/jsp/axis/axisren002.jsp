<%/*
*  Fichero: axisren002.jsp
*  Fecha: 14/03/2011
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
    <title><axis:alt f="axisren002" c="LIT_TITULO" lit="100905"/></title> <%-- CONSULTA DE RECIBOS --%>
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
            var npoliza = "${__formdata.OOCABRENTA.NPOLIZA}";
           
            if (objUtiles.estaVacio(npoliza)) 
                 f_but_buscar();
            f_cargar_propiedades_pantalla();
        }
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisren002", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            document.miForm.TFILE.value = '';
            document.miForm.TFILE_CARTAS.value = '';
            f_abrir_modal('axisren001');
        }
        
        function f_aceptar_axisren001(SSEGURO,SRECREN){
            f_cerrar_modal('axisren001');
            document.miForm.SSEGURO.value = SSEGURO;
            document.miForm.SRECREN.value = SRECREN;
            objUtiles.ejecutarFormulario("axis_axisren002.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
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
            if(cual=="axisren001"){
                f_but_salir();
            }
        }
           
        function f_aceptar_modal(cual, params) {
            f_cerrar_modal(cual);
            if (cual == 'axisadm037')
                objUtiles.ejecutarFormulario("axis_axisren002.do" + params, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_detallrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm003', "src", "axis_axisadm003.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisren002');        
        }
        
        function f_modificarrecibo(NRECIBO){
           objUtiles.abrirModal('axisadm018', "src", "axis_axisadm018.do?operation=form&NRECIBO=" + NRECIBO+'&origen=axisren002');        
        }
        function f_but_aceptar(){
             objUtiles.ejecutarFormulario("axis_axisren002.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_9000745(){
             objUtiles.ejecutarFormulario("axis_axisren002.do", "generar_listados", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_but_140646(){
             objUtiles.ejecutarFormulario("axis_axisren002.do", "generar_cartas", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_set_revisar(thiss,NRECIBO){
        var CDEVSIT = thiss.checked ? 2 : 1;
        var sdevolu = "${__formdata.SDEVOLU}";
        
        var params = "?NRECIBO="+NRECIBO;
        params = params + "&CDEVSIT="+CDEVSIT;
        params = params + "&SDEVOLU="+sdevolu;
        
        
        objAjax.invokeAsyncCGI("axis_axisren002.do"+params, callbackGuardarSetRecRevis, 
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
        
        /* Aceptar - actualizar pagos renta */
        function f_but_100009(thiss,NRECIBO){
        
        //alert("Actualizar pagos!!");
             
        
        var params = "?IBASE="+document.miForm.IBASE.value;
        params = params + "&PRETENC="+document.miForm.PRETENC.value;
        params = params + "&SRECREN="+document.miForm.SRECREN.value;
        params = params + "&CTIPBAN="+document.miForm.CTIPBAN.value;
        params = params + "&SSEGURO="+document.miForm.SSEGURO.value;
        params = params + "&NCTACOR="+document.miForm.NCTACOR.value;
        params = params + "&ISINRET="+document.miForm.ISINRET.value;
        params = params + "&ICONRET="+document.miForm.ICONRET.value;
        params = params + "&IRETENC="+document.miForm.IRETENC.value;
        params = params + "&CESTREC="+document.miForm.CESTREC.value;
        params = params + "&FMOVINI="+document.miForm.FMOVINI.value;
        
            if (objValidador.validaEntrada()){
                            objAjax.invokeAsyncCGI("axis_axisren002.do"+params, callbackActualizarPagosRenta, 
                            "operation=ajax_actpagosrenta",
                            this, objJsMessages.jslit_cargando);  //this
                            
            }
        
        }
        

         function callbackActualizarPagosRenta (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 
                 alert("<axis:alt f="axisren002" c="ALERTA_OP_PAGOS" lit="1000405" />");  
                 
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        
        /* Calcular rentas */
        function f_but_9901110(thiss,NRECIBO){
        
        
        var params = "?IBASE="+document.miForm.IBASE.value;
        params = params + "&PRETENC="+document.miForm.PRETENC.value;
        params = params + "&SRECREN="+document.miForm.SRECREN.value;
        params = params + "&CTIPBAN="+document.miForm.CTIPBAN.value;
        params = params + "&SSEGURO="+document.miForm.SSEGURO.value;
        params = params + "&NCTACOR="+document.miForm.NCTACOR.value;
        params = params + "&ISINRET="+document.miForm.ISINRET.value;
        params = params + "&ICONRET="+document.miForm.ICONRET.value;
        params = params + "&IRETENC="+document.miForm.IRETENC.value;
        params = params + "&CESTREC="+document.miForm.CESTREC.value;
        params = params + "&FMOVINI="+document.miForm.FMOVINI.value;
                if (objValidador.validaEntrada()){
                        objAjax.invokeAsyncCGI("axis_axisren002.do"+params, callbackCalcularRentas, 
                        "operation=ajax_calcrentas",
                        this, objJsMessages.jslit_cargando);  //this
                }
        
        }
         
        
         function callbackCalcularRentas (ajaxResponseText){
            try{ 
            
           //alert("volviendo de reclacular");
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                 
                 alert("<axis:alt f="axisren002" c="ALERTA_OP_CALC" lit="1000405" />");  
                 //alert(document.miForm.SSEGURO.value);
                 //alert(document.miForm.SRECREN.value);
                 f_aceptar_axisren001(document.miForm.SSEGURO.value,document.miForm.SRECREN.value);
                 
                 
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }

        
        
        /* Bloqueo próximos pagos */
        function f_but_9901112(thiss,NRECIBO){
        
        //alert("Próximos pagos");
        var params = "?IBASE="+document.miForm.IBASE.value;
        params = params + "&PRETENC="+document.miForm.PRETENC.value;
        params = params + "&SRECREN="+document.miForm.SRECREN.value;
        params = params + "&CTIPBAN="+document.miForm.CTIPBAN.value;
        params = params + "&SSEGURO="+document.miForm.SSEGURO.value;
        params = params + "&NCTACOR="+document.miForm.NCTACOR.value;
        params = params + "&ISINRET="+document.miForm.ISINRET.value;
        params = params + "&ICONRET="+document.miForm.ICONRET.value;
        params = params + "&IRETENC="+document.miForm.IRETENC.value;
        params = params + "&CESTREC="+document.miForm.CESTREC.value;
        params = params + "&FMOVINI="+document.miForm.FMOVINI.value;
                if (objValidador.validaEntrada()){
                        objAjax.invokeAsyncCGI("axis_axisren002.do"+params, callbackBloqProxpagos, 
                        "operation=ajax_blogproxpagos",
                        this, objJsMessages.jslit_cargando);  //this
                        
                }
        
        }
        
      
        
        function callbackBloqProxpagos (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                   
                   alert("<axis:alt f="axisren002" c="ALERTA_OP_BLOQ" lit="1000405" />");
                 
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        
        /* *********************************************************************************************** */
        /* ***********************************     recalcular     **************************************** */
        /* *********************************************************************************************** */
        
        function f_cambio_base(){
        //alert("cambio base");
        var IBASE_on = this.quitarPuntosComasNumero(document.miForm.IBASE.value);  //BASE
        var PRETENC_on = this.quitarPuntosComasNumero(document.miForm.PRETENC.value); //%
        var IRETENC_on = this.quitarPuntosComasNumero(document.miForm.IRETENC.value); //IRETEN
        var ISINRET_on = this.quitarPuntosComasNumero(document.miForm.ISINRET.value); //IBRUTO
              
                    document.miForm.IRETENC.value = objNumero.formateaNumero(IBASE_on * (PRETENC_on/100));    //IRETEN
                    document.miForm.ICONRET.value = objNumero.formateaNumero(ISINRET_on - (IBASE_on * (PRETENC_on/100)));  //INETO
        }
        
        function f_cambio_bruto(){
        //alert("cambio bruto");
         var IRETENC_on = this.quitarPuntosComasNumero(document.miForm.IRETENC.value);
         var ISINRET_on = this.quitarPuntosComasNumero(document.miForm.ISINRET.value);
         
                    document.miForm.ICONRET.value = objNumero.formateaNumero(ISINRET_on - IRETENC_on);   //NETO
        }
        
        
        this.quitarPuntosComasNumero = function (valor) {
            var valor1 = objNumero.quitarSeparadorMiles(valor);
            var valor2 = objNumero.quitarSeparadorDecimales(valor1);
            return valor2;
        }

         function f_validar_base(){
         //alert('Antes de validar base');
         var IBASE_on = this.quitarPuntosComasNumero(document.miForm.IBASE.value); //BASE
         var ISINRET_on = this.quitarPuntosComasNumero(document.miForm.ISINRET.value); //BRUTO
         
         //alert(IBASE_on);
         //alert(ISINRET_on);
                   if(eval(IBASE_on)>eval(ISINRET_on)){
                            alert("<axis:alt f="axisren002" c="ALERTA_IBASE" lit="9901975" />");
                            document.miForm.IBASE.value = objNumero.formateaNumero(ISINRET_on-0); //ponemos el máximo del bruto
                            f_validar_base();
                   }else{
                        f_cambio_base();
                   }
                   
        }
        
        
        function f_validar_bruto(){
         //alert('Antes de validar base');
         var IBASE_on = this.quitarPuntosComasNumero(document.miForm.IBASE.value); //BASE
         var ISINRET_on = this.quitarPuntosComasNumero(document.miForm.ISINRET.value); //BRUTO
         
         //alert(IBASE_on);
         //alert(ISINRET_on);
                   if(eval(IBASE_on)>eval(ISINRET_on)){
                            alert("<axis:alt f="axisren002" c="ALERTA_IBRUTO" lit="9901975" />");
                            document.miForm.ISINRET.value = objNumero.formateaNumero(IBASE_on-0); //ponemos el máximo del bruto
                            f_validar_bruto();
                   }else{
                        f_cambio_bruto();
                   }
                   
        }
        
        
        
        function f_validar_preten(){
         //alert('Antes de validar base');
         var PRETENC_on = this.quitarPuntosComasNumero(document.miForm.PRETENC.value); //%
       
         
         //alert(IBASE_on);
         //alert(ISINRET_on);
                   if(eval(PRETENC_on)> 100){
                            alert("<axis:alt f="axisren002" c="ALERTA_IPRETENC" lit="1000390" />");
                            document.miForm.PRETENC.value = 100; //ponemos 0
                            f_validar_preten();
                   }else{
                        f_validar_base();
                   }
                   
        }
        
        
        f_validar_preten
      
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisren002" c="LIT_PANTALLA" lit="9901075"/></c:param>     <%-- Gestión de devoluciones--%>
                <c:param name="formulario"><axis:alt f="axisren002" c="LIT_FORMULARIO" lit="9901075"/></c:param> <%-- Gestión de devoluciones --%>
                <c:param name="form">axisren002</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisren002" c="LIT_MODAL_AXISREN001" lit="1000206" /></c:param>
                <c:param name="nid" value="axisren001" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisren002" c="LIT_MODAL_AXISADM003" lit="1000564" /></c:param>
                <c:param name="nid" value="axisadm003" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisren002" c="LIT_MODAL_AXISADM018" lit="102058" /></c:param>
                <c:param name="nid" value="axisadm018" />
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisren002" c="LIT_MODAL_IMPRIMIR" lit="1000205" />|true</c:param>
        </c:import>   
        
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SDEVOLU" id="SDEVOLU" value="${__formdata.SDEVOLU}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" name="TFILE" id="TFILE" value="${__formdata.TFILE}"/>
         <input type="hidden" name="TFILE_CARTAS" id="TFILE_CARTAS" value="${__formdata.TFILE_CARTAS}"/>

        <div class="separador">&nbsp;</div>       
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titulo">
                    <img src="images/flecha.gif"/><axis:alt f="axisren002" c="LIT_IMG_1" lit="9001858" />
                    <img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisren002" c="LIT_IMG_2" lit="100797" />" onclick="f_but_buscar();" style="cursor:pointer"/>                
                    </div>
                    <table class="seccion">
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
                                            <axis:visible f="axisren002" c="NPOLIZA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_NPOLIZA" lit="100624" /></b>
                                                </td>
                                            </axis:visible>
                                            <!-- Certificado -->
                                            <axis:visible f="axisren002" c="NCERTIF" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_NCERTIF" lit="101168" /></b>
                                                </td>
                                             </axis:visible>	
                                             <!-- Fecha efecto -->
                                             <axis:visible f="axisren002" c="FEFECTO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_FEFECTO" lit="100883" /></b>
                                                </td>
                                             </axis:visible>
                                           
	                                             
                                        </tr>
                                        <tr>
                                        <axis:visible f="axisren002" c="NPOLIZA">
                                                    
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NPOLIZA" name="NPOLIZA" size="15"
                                                    value="${__formdata.OOCABRENTA.NPOLIZA}" <axis:atr f="axisren002" c="NPOLIZA" a="modificable=false"/>/>
                                                     </td>     
                                                     
                                          </axis:visible> 
                                          <axis:visible f="axisren002" c="NCERTIF">
                                                    
                                                     <td class="campocaja">
                                                    <input style="width:20%" type="text" class="campowidthinput campo campotexto" id="NCERTIF" name="NCERTIF" size="15"
                                                    value="${__formdata.OOCABRENTA.NCERTIF}" <axis:atr f="axisren002" c="NCERTIF" a="modificable=false"/>/>
                                           </axis:visible>   
                                            <axis:visible f="axisren002" c="FEFECTO">
                                                     
                                                   <td class="campocaja" >
                                                    <input style="width:94%" type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOCABRENTA.FEFECTO}"/>" <axis:atr f="axisren002" c="FEFECTO" a="modificable=false"/>/>
                                                    </td>  
                                                     
                                          </axis:visible> 
                                         
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisren002" c="TOMADOR" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_TOMADOR" lit="101027" /></b>
                                                </td>
                                         </axis:visible>	
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisren002" c="TOMADOR">
                                                 <td class="campocaja" colspan="3">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="TOMADOR" name="TOMADOR" size="15"
                                                    value ="${__formdata.OOCABRENTA.TOMADOR}" title="<axis:alt f="axisren002" c="ALT_TOMADOR" lit="100885"/>" <axis:atr f="axisren002" c="TOMADOR" a="modificable=false&formato=fecha"/>/>
                                                </td>
                                         </axis:visible>
                                         </tr>
                                         <tr>
                                         <axis:visible f="axisren002" c="PRIMERASE" >
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisren002" c="LIT_PRIMERASE" lit="9901050" /></b>
                                                </td>
                                         </axis:visible>
                                         <axis:visible f="axisren002" c="NEDADPRIMERASEG" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_NEDADPRIMERASEG" lit="9000478" /></b>
                                                </td>
                                         </axis:visible>
                                         <axis:visible f="axisren002" c="TTIPBAN" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_TTIPBAN" lit="9001200" /></b>
                                                </td>
                                         </axis:visible>
                                         <axis:visible f="axisren002" c="CBANCAR" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_CBANCAR" lit="100965" /></b>
                                                </td>
                                         </axis:visible>
                                         </tr>
                                         <tr>
                                                <axis:visible f="axisren002" c="PRIMERASE">
                                                 <td class="campocaja" colspan="2">
                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="PRIMERASE" name="PRIMERASE" size="15"
                                                    value ="${__formdata.OOCABRENTA.PRIMERASEG}" title="<axis:alt f="axisren002" c="LIT_TIT_PRIMERASE" lit="100885"/>" <axis:atr f="axisren002" c="PRIMERASE" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="NEDADPRIMERASEG">
                                                       <td class="campocaja" >
                                                            <input style="width:30%" type="text" class="campowidthinput campo campotexto" id="NEDADPRIMERASEG" name="NEDADPRIMERASEG" size="15"
                                                    value="${__formdata.OOCABRENTA.NEDADPRIMERASEG}" <axis:atr f="axisren002" c="NEDADPRIMERASEG" a="modificable=false"/>/>
                                                     </td>   
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="TTIPBAN">
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="TTIPBAN" name="TTIPBAN" size="15"
                                                    value="${__formdata.OOCABRENTA.TTIPBAN}" <axis:atr f="axisren002" c="TTIPBAN" a="modificable=false"/>/>
                                                     </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="CBANCAR">
                                                     <td class="campocaja">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="CBANCAR" name="CBANCAR" size="15"
                                                    value="${__formdata.OOCABRENTA.CBANCAR}" <axis:atr f="axisren002" c="CBANCAR" a="modificable=false"/>/>
                                                     </td>
                                                </axis:visible>
                                         
                                         </tr>
                                         <tr>
                                            <axis:visible f="axisren002" c="IRENTA" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_IRENTA" lit="9001897" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisren002" c="PRIMERPAG" >
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisren002" c="LIT_PRIMERPAG" lit="9901167" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisren002" c="FPRXGEN" >
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisren002" c="LIT_FPRXGEN" lit="9001902" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisren002" c="FVENCIM" >
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisren002" c="LIT_FVENCIM" lit="100885" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisren002" c="FFINREN" >
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axisren002" c="LIT_FFINREN" lit="9001904" /></b>
                                                </td>
                                             </axis:visible>
                                         </tr>
   
                                         <tr>
                                                <axis:visible f="axisren002" c="IRENTA">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="IBRUREN" name="IBRUREN" size="15"
                                                    value ="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.OOCABRENTA.IBRUREN}'/>"  <axis:atr f="axisren002" c="IBRUREN" a="modificable=false&formato=decimal"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="FPRIMERPAGO">
                                                <td class="campocaja" >
                                                            <input style="width:75%" type="text" class="campowidthinput campo campotexto" id="FPRIMERPAGO" name="FPRIMERPAGO" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOCABRENTA.FPRIMERPAGO}"/>" <axis:atr f="axisren002" c="CUSUARI" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="FPRXGEN">
                                                <td class="campocaja" >
                                                            <input style="width:75%" type="text" class="campowidthinput campo campotexto" id="FPROXGEN" name="FPROXGEN" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOCABRENTA.FPROXGEN}"/>" <axis:atr f="axisren002" c="CUSUARI" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="FVENCIM">
                                                <td class="campocaja" >
                                                            <input style="width:75%" type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOCABRENTA.FVENCIM}"/>" <axis:atr f="axisren002" c="CUSUARI" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="FFINRENTA">
                                                <td class="campocaja" >
                                                            <input style="width:75%" type="text" class="campowidthinput campo campotexto" id="FFINRENTA" name="FFINRENTA" size="15"
                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOCABRENTA.FFINRENTA}"/>" <axis:atr f="axisren002" c="CUSUARI" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                           
                                         </tr>
                                      
                                         <tr>
                                            <axis:visible f="axisren002" c="FPAGO" >
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisren002" c="LIT_FPAGO" lit="102719" /></b>
                                                </td>
                                             </axis:visible>
                                             <axis:visible f="axisren002" c="TMOTIVO" >
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axisren002" c="LIT_TMOTIVO" lit="102577" /></b>
                                                </td>
                                             </axis:visible>
                                             
                                         </tr>
                                         
                                         <tr>
                                                <axis:visible f="axisren002" c="TFORMAPAGO">
                                                 <td class="campocaja">
                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="TFORMAPAGO" name="TFORMAPAGO" size="15"
                                                    value ="${__formdata.OOCABRENTA.TFORMAPAGO}"  <axis:atr f="axisren002" c="TFORMAPAGO" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                <axis:visible f="axisren002" c="TMOTIVO">
                                                <td class="campocaja" colspan="2">
                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="TMOTIVO" name="TMOTIVO" size="15"
                                                    value="${__formdata.OOCABRENTA.TMOTIVO}" <axis:atr f="axisren002" c="TMOTIVO" a="modificable=false"/>/>
                                                </td>
                                                </axis:visible>
                                                              
                                         </tr>
                                         
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                     
                        <!-- ****************************** segunda seccion *************************** -->
                        </td>
            </tr>
        </table>
                    
                        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <div class="titulo">
                                    <img src="images/flecha.gif"/><axis:alt f="axisren002" c="LIT_IMG_3" lit="9001908" />
                                    <!--img id="find" border="0" src="images/find.gif" alt="<axis:alt f="axisren002" c="LIT_IMG_4" lit="100797" />" onclick="f_but_buscar();" style="cursor:pointer"/-->                
                                    </div>
                                    <table class="seccion">
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
                                                           <axis:visible f="axisren002" c="NPAGO" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_NPAGO" lit="9001909" /></b>
                                                                </td>
                                                             </axis:visible>	
                                                           <axis:visible f="axisren002" c="FFECEFE" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_FFECEFE" lit="1000562" /></b>
                                                                </td>
                                                             </axis:visible>	
                                                             <axis:visible f="axisren002" c="TNOMBRE" >
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisren002" c="LIT_TNOMBRE" lit="9001911" /></b>
                                                                </td>
                                                             </axis:visible>
                                                            <axis:visible f="axisren002" c="FFECPAG" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_FFECPAG" lit="100883" /></b>
                                                                </td>
                                                             </axis:visible>
                                                                 
                                                        </tr>
                                                        <tr>
                                                        <axis:visible f="axisren002" c="SRECREN">
                                                                    
                                                                     <td class="campocaja">
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="SRECREN" name="SRECREN" size="15"
                                                                    value="${__formdata.OOPAGORENTA.SRECREN}" <axis:atr f="axisren002" c="NPOLIZA" a="modificable=false"/>/>
                                                                     </td>     
                                                             
                                                          </axis:visible> 
                                                          <axis:visible f="axisren002" c="FFECEFE">
                                                                    
                                                                     <td class="campocaja">
                                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="FFECEFE" name="FFECEFE" size="15"
                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOPAGORENTA.FFECEFE}"/>" <axis:atr f="axisren002" c="FFECEFE" a="modificable=false"/>/>
                                                           </axis:visible>  
                                                           <axis:visible f="axisren002" c="TNOMBRE">
                                                                    
                                                                     <td class="campocaja" colspan="2">
                                                                    <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="TNOMBRE" name="TNOMBRE" size="15"
                                                                    value="${__formdata.OOPAGORENTA.TNOMBRE}" <axis:atr f="axisren002" c="TNOMBRE" a="modificable=false"/>/>
                                                           </axis:visible>
                                                           <axis:visible f="axisren002" c="FFECPAG">
                                                                     
                                                                   <td class="campocaja" >
                                                                    <input style="width:94%" type="text" class="campowidthinput campo campotexto" id="FFECPAG" name="FFECPAG" size="15"
                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOPAGORENTA.FFECPAG}"/>" <axis:atr f="axisren002" c="FFECEFE" a="modificable=false"/>/>
                                                                    </td>  
                                                                     
                                                          </axis:visible> 
                                                            
                                                         </tr>
                                                         <tr>
                                                         <axis:visible f="axisren002" c="FANUL" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_FANUL" lit="140214" /></b>
                                                                </td>
                                                         </axis:visible>	
                                                          <axis:visible f="axisren002" c="MOTIV" >
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisren002" c="LIT_MOTIV" lit="102577" /></b>
                                                                </td>
                                                         </axis:visible>
                                                          <axis:visible f="axisren002" c="REMESA" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_REMESA" lit="108527" /></b>
                                                                </td>
                                                         </axis:visible>
                                                         </tr>
                                                         
                                                         <tr>
                                                            <axis:visible f="axisren002" c="FFECANU">
                                                                 <td class="campocaja">
                                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="FANUL" name="FANUL" size="15"
                                                                    value ="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOPAGORENTA.FFECANU}"/>" title="<axis:alt f="axisren002" c="ALT_FANUL" lit="100885"/>" <axis:atr f="axisren002" c="ALT_FANUL2" a="modificable=false&formato=fecha"/>/>
                                                                </td>
                                                            </axis:visible>
                                                            <axis:visible f="axisren002" c="TMOTANU">
                                                                 <td class="campocaja" colspan="2">
                                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="TMOTANU" name="TMOTANU" size="15"
                                                                    value ="${__formdata.OOPAGORENTA.TMOTANU}" title="<axis:alt f="axisren002" c="ALT_TMOTANU" lit="100885"/>" <axis:atr f="axisren002" c="ALT_TMOTANU2" a="modificable=false&formato=fecha"/>/>
                                                                </td>
                                                            </axis:visible>
                                                            <axis:visible f="axisren002" c="NREMESA">
                                                                 <td class="campocaja">
                                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="NREMESA" name="NREMESA" size="15"
                                                                    value ="${__formdata.OOPAGORENTA.NREMESA}" title="<axis:alt f="axisren002" c="ALT_NREMESA" lit="100885"/>" <axis:atr f="axisren002" c="ALT_NREMESA2" a="modificable=false&formato=fecha"/>/>
                                                                </td>
                                                            </axis:visible>
                                                         </tr>
                                                         <tr>
                                                             <axis:ocultar f="axisren002" c="CTIPBAN" dejarHueco="false">
                                                                <td class="titulocaja" >
                                                                    <b><axis:alt f="axisren002" c="LIT_CTIPBAN" lit="9001200" /></b>
                                                                </td>
                                                             </axis:ocultar>
                                                             <axis:visible f="axisren002" c="NCTACOR" >
                                                                <td class="titulocaja" colspan="2">
                                                                    <b><axis:alt f="axisren002" c="LIT_NCTACOR" lit="100965" /></b>
                                                                </td>
                                                             </axis:visible>
                                                              <axis:ocultar f="axisren002" c="CESTREC" dejarHueco="false">
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_CESTREC" lit="101510" /></b>
                                                                </td>
                                                             </axis:ocultar>
                                                              <axis:visible f="axisren002" c="FMOVIMI" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_FMOVIMI" lit="101006" /></b>
                                                                </td>
                                                             </axis:visible>
                                                         </tr>
                                                         <tr>
                                                    
                                                                <axis:ocultar f="axisren002" c="CTIPBAN" dejarHueco="CTIPBAN">
                                                                 <td class="campocaja">
                                                                    <select name="CTIPBAN" id ="CTIPBAN" size="1"  class="campowidthinput campo campotexto" obligatorio="true" style="width:90%"
                                                                                title="<axis:alt f="axisren002" c="LIT_CTIPBAN" lit="9001200" />" onchange=""
                                                                                <axis:atr f="axisren002" c="CTIPBAN" a="isInputText=false&obligatorio=true"/>>
                                                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisren002" c="LIT_SEL_CTIPBAN" lit="108341" /> - </option>                                                                                                        
                                                                                    <c:forEach items="${__formdata.valores.tipo_cuenta}" var="item">
                                                                                        <option value = "${item.CATRIBU}" <c:if test="${!empty __formdata.OOPAGORENTA.CTIPBAN && __formdata.OOPAGORENTA.CTIPBAN == item.CATRIBU}"> selected </c:if> >${item.CATRIBU} - ${item.TATRIBU}</option>
                                                                                    </c:forEach>
                                                                    </select>
                                                                    
                                                                </td>
                                                                </axis:ocultar>
                                                               
                                                                <axis:visible f="axisren002" c="NCTACOR">
                                                                       <td class="campocaja" colspan="2">
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="NCTACOR" name="NCTACOR" size="15"
                                                                    value="${__formdata.OOPAGORENTA.NCTACOR}" <axis:atr f="axisren002" c="NCTACOR" a="modificable=true"/>/>
                                                                     </td>   
                                                                </axis:visible>
                                                                <axis:ocultar f="axisren002" c="CESTREC" dejarHueco="false">
                                                                     <td class="campocaja">
                                                                            <select name="CESTREC" id ="CESTREC" size="1"  class="campowidthinput campo campotexto" obligatorio="true" style="width:90%"
                                                                                title="<axis:alt f="axisren002" c="LIT_CESTREC" lit="101510" />" onchange=""
                                                                                <axis:atr f="axisren002" c="CESTREC" a="isInputText=false&obligatorio=true"/>>
                                                                                    <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisren002" c="LIT_SEL_CESTREC" lit="108341" /> - </option>                                                                                                        
                                                                                    <c:forEach items="${__formdata.valores.mapa_estados}" var="item">
                                                                                        <option value = "${item.CATRIBU}" <c:if test="${!empty __formdata.OOPAGORENTA.CESTREC && ( __formdata.OOPAGORENTA.CESTREC == item.CATRIBU)}"> selected </c:if>>${item.TATRIBU}</option>
                                                                                    </c:forEach>
                                                                            </select>
                                                                     </td>
                                                                </axis:ocultar>
                                                          
                                                                <axis:visible f="axisren002" c="FMOVINI">
                                                                     <td class="campocaja">
                                                                            <input style="width:70%" type="text" class="campowidthinput campo campotexto" id="FMOVINI"  name="FMOVINI" size="15"
                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.OOPAGORENTA.FMOVINI}"/>" <axis:atr f="axisren002" c="FMOVINI" a="modificable=true&obligatorio=true"/>/>
                                                                            <axis:visible f="axisren002" c="BT_FMOVINI"><a id="icon_FMOVINI" style="vertical-align:middle;"><img id="BT_FMOVINI" border="0" alt="<axis:alt c="FMOVIMI_TITLE_1" f="axisren002" lit="108341"/>" 
                                                                          title="<axis:alt c="FMOVINI_TITLE" f="axisagd004" lit="108341"/>" src="images/calendar.gif"/></a></axis:visible>
                                                                     </td>
                                                                </axis:visible>
                                                    
                                                         </tr>
                                                         <tr>
                                                             <axis:visible f="axisren002" c="ISINRET" >
                                                                <td class="titulocaja" >
                                                                    <b><axis:alt f="axisren002" c="LIT_ISINRET" lit="109058" /></b>
                                                                </td>
                                                             </axis:visible>
                                                            <axis:visible f="axisren002" c="IBASE" >
                                                                <td class="titulocaja">
                                                                    <b><axis:alt f="axisren002" c="LIT_IBASE" lit="109476" /></b>
                                                                </td>
                                                             </axis:visible>
                                                             <axis:visible f="axisren002" c="PRETENC" >
                                                                <td class="titulocaja" >
                                                                    <b>%</b>
                                                                </td>
                                                             </axis:visible>
                                                             <axis:visible f="axisren002" c="IRETENC" >
                                                                <td class="titulocaja" >
                                                                    <b><axis:alt f="axisren002" c="LIT_IRETENC" lit="101714" /></b>
                                                                </td>
                                                             </axis:visible>
                                                             <axis:visible f="axisren002" c="ICONRET" >
                                                                <td class="titulocaja" >
                                                                    <b><axis:alt f="axisren002" c="LIT_ICONRET" lit="1000527" /></b>
                                                                </td>
                                                             </axis:visible>
                                                         </tr>
                                                          
                                                         <tr>
                                                         
                                                               
                                                                
                                                                <axis:visible f="axisren002" c="ISINRET">
                                                                <td class="campocaja" >
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="ISINRET" name="ISINRET" size="15" onchange="f_validar_bruto()"
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.OOPAGORENTA.ISINRET}'/>" <axis:atr f="axisren002" c="ISINRET" a="modificable=true&formato=decimal"/>/>
                                                                </td>
                                                                </axis:visible>
                                                                
                                                                <axis:visible f="axisren002" c="IBASE">
                                                                 <td class="campocaja">
                                                                    <input style="width:50%" type="text" class="campowidthinput campo campotexto" id="IBASE" name="IBASE" size="15"  onchange="f_validar_base();"
                                                                    value ="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.OOPAGORENTA.IBASE}'/>"  <axis:atr f="axisren002" c="IBASE" a="modificable=true&formato=decimal"/>/>
                                                                </td>
                                                                </axis:visible>
                                                                <axis:visible f="axisren002" c="PRETENC">
                                                                <td class="campocaja" >
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="PRETENC" name="PRETENC" size="15" onchange="f_validar_preten();"
                                                                    value="${__formdata.OOPAGORENTA.PRETENC}" <axis:atr f="axisren002" c="PRETENC" a="modificable=true"/>/>
                                                                </td>
                                                                </axis:visible>
                                                                
                                                                 <axis:visible f="axisren002" c="IRETENC">
                                                                <td class="campocaja" >
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="IRETENC" name="IRETENC" size="15" onchange="f_cambio_bruto()" readonly
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.OOPAGORENTA.IRETENC}'/>" <axis:atr f="axisren002" c="IRETENC" a="modificable=true&formato=decimal"/>/>
                                                                </td>
                                                                </axis:visible>
                                                                
                                                                <axis:visible f="axisren002" c="ICONRET">
                                                                <td class="campocaja" >
                                                                            <input style="width:90%" type="text" class="campowidthinput campo campotexto" id="ICONRET" name="ICONRET" size="15" readonly
                                                                    value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value='${__formdata.OOPAGORENTA.ICONRET}'/>" <axis:atr f="axisren002" c="ICONRET" a="modificable=true&formato=decimal"/>/>
                                                                </td>
                                                                </axis:visible>
                                                           
                                                         </tr>

                                                    </table>
                                                </td>
                                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>   
                    
                        
                        <!-- ************************************************************************** -->
                        
                 </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisren002</c:param><c:param name="f">axisren002</c:param>
            <c:param name="__botones">salir,100009,9901110,9901112</c:param> 
        </c:import>
    
    </form>
    
    <axis:visible f="axisren002" c="BT_FMOVINI">
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