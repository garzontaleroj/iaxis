<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:set var="pantalla" value="axisctr061"/>
<c:set var="literalPantalla">
    <axis:alt f="${pantalla}" c="LIT_PANTALLA" lit="9001186"/> <%-- Conductores --%>
</c:set>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title>${literalPantalla}</title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>


    
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

    <c:import url="../include/carga_framework_js.jsp" />
    
    <script type="text/javascript">        
        
        function f_onload() {
        
        
        var ok = "${__formdata.OK}";
        
         if (!objUtiles.estaVacio(ok))
            parent.f_aceptar_axisctr061();
            
            var offset_dt = objDom.getValorPorId("offset_dt");
            
            <axis:visible c="DSP_OCASIONAL" f="axisctr061">
            if (!objUtiles.estaVacio(offset_dt))
                document.getElementById("dt_conductores").scrollTop = parseInt(offset_dt);
            
            setInterval("f_set_offset_dt()", 100);
            </axis:visible>
            f_cargar_propiedades_pantalla();
        }
    
        function f_set_offset_dt() {
            objDom.setValorPorId("offset_dt", document.getElementById("dt_conductores").scrollTop);
        }
    
        function f_but_cancelar() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr061", "cancelar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_salir() {           
            parent.f_cerrar_axisctr061();
        }
               
        function f_but_anterior() {
            var SPERSON_HABITUAL = "${CONDUCTOR_HABITUAL.SPERSON}";
            objUtiles.ejecutarFormulario ("axis_axisctr061.do?SPERSON=" + SPERSON_HABITUAL, "anterior", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        function f_but_siguiente() {
            var SPERSON_HABITUAL = "${CONDUCTOR_HABITUAL.SPERSON}";
            
            if (objUtiles.estaVacio(SPERSON_HABITUAL))
                alert("<axis:alt f='axisctr061' c='MSG_CONDUCTOR_HAB' lit='9001324'/>");
            else {
                if (objValidador.validaEntrada())
                    objUtiles.ejecutarFormulario ("axis_axisctr061.do?SPERSON=" + SPERSON_HABITUAL, "siguiente", document.miForm, 
                    "_self", objJsMessages.jslit_cargando);
            }
        }
        function f_but_aceptar() {
            var SPERSON_HABITUAL = "${CONDUCTOR_HABITUAL.SPERSON}";
            
            if (objUtiles.estaVacio(SPERSON_HABITUAL))
                alert("<axis:alt f='axisctr061' c='MSG_CONDUCTOR_HAB' lit='9001324'/>");
            else {
                document.getElementById("TOCUPACION").readOnly = false;
                if (objValidador.validaEntrada())                
                    objUtiles.ejecutarFormulario ("axis_axisctr061.do?SPERSON=" + SPERSON_HABITUAL, "guardar_simulacion", document.miForm, 
                    "_self", objJsMessages.jslit_cargando);
                document.getElementById("TOCUPACION").readOnly = true;
            }
        }
        
        function f_set_conductor(SPERSON, NORDEN, TOMADOR_O_PROPIETARIO,PRINCIPAL) {                
            
            var SELECTED_NORDEN = NORDEN;

            if (objUtiles.estaVacio(SELECTED_NORDEN)) {
                // Si está vacío NORDEN, es porque estamos insertando un conductor ocasional.
                // El nuevo NORDEN a seleccionar, será el índice superior de la lista
                SELECTED_NORDEN = "${fn:length(requestScope.T_IAX_AUTCONDUCTORES) + 1}";
                objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
            }
            
            if (SELECTED_NORDEN == 0) {
                // No queremos seleccionar el primero, el habitual.
                SELECTED_NORDEN = null;
                objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
            }                    
            
            objDom.setValorPorId("CPRINCIPAL", PRINCIPAL);
            objUtiles.ejecutarFormulario ("axis_axisctr061.do?SPERSON=" + SPERSON + "&NORDEN=" + NORDEN + 
                "&TOMADOR_O_PROPIETARIO=" + TOMADOR_O_PROPIETARIO, "set_conductor", document.miForm, "_self", objJsMessages.jslit_cargando);
        }


        function f_set_conductor_tomaseg(SPERSON, NORDEN, TOMADOR_O_PROPIETARIO) {                
            
            var SELECTED_NORDEN = NORDEN;
            
            if (objUtiles.estaVacio(SELECTED_NORDEN)) {
                // Si está vacío NORDEN, es porque estamos insertando un conductor ocasional.
                // El nuevo NORDEN a seleccionar, será el índice superior de la lista
                SELECTED_NORDEN = "${fn:length(requestScope.T_IAX_AUTCONDUCTORES) + 1}";
                objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
            }
            
            if (SELECTED_NORDEN == 0) {
                // No queremos seleccionar el primero, el habitual.
                SELECTED_NORDEN = null;
                objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
            }                    
            
            objUtiles.ejecutarFormulario ("axis_axisctr061.do?SPERSON=" + SPERSON + "&NORDEN=" + NORDEN + 
                "&TOMADOR_O_PROPIETARIO=" + TOMADOR_O_PROPIETARIO, "set_conductor_tomaseg", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        // BUG 0026923/0151408 - JSV (26/08/2013) 
        function f_ajax_set_conductor(EXPER_MANUAL, SPERSON, NORDEN, NPUNTOS, FCARNET, CDOMICI, CPRINCIPAL, FNACIMI, CSEXO, EXPER_SINIE_MANUAL) {
             
            if (objUtiles.estaVacio(SPERSON))
                return;            
            if (!objUtiles.estaVacio(FCARNET) && FCARNET.length != 10)
                return;
                
            objDom.setValorPorId("CPRINCIPAL", CPRINCIPAL);
            
            if (objValidador.validaEntrada())
                objAjax.invokeAsyncCGI("axis_axisctr061.do", callbackAjaxSetConductor, "operation=ajax_set_conductor&SPERSON=" + SPERSON + 
                "&NORDEN=" + NORDEN + "&NPUNTOS=" + NPUNTOS + "&FCARNET=" + FCARNET + "&FNACIMI=" + FNACIMI + "&CSEXO=" + CSEXO + "&CDOMICI=" + CDOMICI
                 + "&CPRINCIPAL=" + CPRINCIPAL + "&EXPER_MANUAL="+EXPER_MANUAL + "&EXPER_SINIE_MANUAL="+EXPER_SINIE_MANUAL, this);
        }
        
        function f_ajax_set_conductor_EXPER_MANUAL(EXPER_MANUAL, SPERSON, NORDEN, NPUNTOS, FCARNET, CDOMICI, CPRINCIPAL, FNACIMI, CSEXO, EXPER_SINIE_MANUAL) {
            
            if (objUtiles.estaVacio(SPERSON))
                return;
            if (!objUtiles.estaVacio(FCARNET) && FCARNET.length != 10)
                return; 
            objDom.setValorPorId("CPRINCIPAL", CPRINCIPAL);
            
            objAjax.invokeAsyncCGI("axis_axisctr061.do", callbackAjaxSetConductor, "operation=ajax_set_conductor&SPERSON=" + SPERSON + 
                "&NORDEN=" + NORDEN + "&NPUNTOS=" + NPUNTOS + "&FCARNET=" + FCARNET + "&FNACIMI=" + FNACIMI + "&CSEXO=" + CSEXO + "&CDOMICI=" + CDOMICI
                 + "&CPRINCIPAL=" + CPRINCIPAL + "&EXPER_MANUAL="+EXPER_MANUAL + "&EXPER_SINIE_MANUAL="+EXPER_SINIE_MANUAL, this);
        }

        function f_selecciona_conductor(NORDEN) {
            // Muestra el detalle del conductor habitual
            objDom.setValorPorId("SELECTED_NORDEN", NORDEN);
            objUtiles.ejecutarFormulario ("axis_axisctr061.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }
        
        function f_eliminar_conductor(NORDEN, SPERSON) {
            objUtiles.ejecutarFormulario ("axis_axisctr061.do?NORDEN=" + NORDEN + "&SPERSON=" + SPERSON, 
            "eliminar_conductor", document.miForm, "_self", objJsMessages.jslit_cargando);                
        }
        
        /****************************************************************************************/
        /************************************** MODALES *****************************************/
        /****************************************************************************************/

        /****************************************************************************************/
        /************************************* AXISPER001 ***************************************/
        /****************************************************************************************/
        
        /* Funciones para añadir o modificar conductores habituales y ocasionales NOMINADOS */
        
        var NORDEN_2_MODIFY = null;
        
        function f_axisper001_anadir_conductor_ocasional_nominado() {
            objDom.setValorPorId("CPRINCIPAL", 0);
            objUtiles.abrirModal("axisper001", "src", "modal_axisper001.do?operation=form&faceptar=f_anadir_conductor_ocasional_nominado");
        }

        // Sirve para Habitual y Ocasionales
        function f_axisper001_modificar_conductor_nominado(NORDEN,PRINCIPAL) {   
            // NORDEN_2_MODIFY: Variable JS global                
            NORDEN_2_MODIFY = NORDEN;
            objDom.setValorPorId("SELECTED_NORDEN", NORDEN);
            objDom.setValorPorId("CPRINCIPAL", PRINCIPAL);
            
            objUtiles.abrirModal("axisper001", "src", "modal_axisper001.do?operation=form&faceptar=f_modificar_conductor_nominado");
        }
                   
        function f_cerrar_axisper001() {
            <% session.removeAttribute("faceptar"); %>
            objUtiles.cerrarModal("axisper001");                
        }
        
        function f_anadir_conductor_ocasional_nominado(SPERSON) {
            f_cerrar_axisper001();
            f_set_conductor(SPERSON, null,null,0);                
        }
        
        function f_modificar_conductor_nominado(SPERSON) {
            f_cerrar_axisper001();                
            // NORDEN_2_MODIFY: Variable JS global
            var NORDEN = NORDEN_2_MODIFY;
            var principal = document.miForm.CPRINCIPAL.value;
            if (!objUtiles.estaVacio(SPERSON) && !objUtiles.estaVacio(NORDEN)) {
                f_set_conductor(SPERSON, NORDEN, null, principal);
            }                
        }
        
        /****************************************************************************************/
        /************************************* AXISPER005 ***************************************/
        /****************************************************************************************/
        
        function  f_abrir_axisper005(faceptar, SPERSON, CPRINCIPAL) {
            // Si SPERSON está informado, quiere decir que modificamos una persona.
            // Si SPERSON == true, es una alta de nueva persona, invocada des de AXISPER001.
            
            if(!objUtiles.estaVacio(CPRINCIPAL))
                objDom.setValorPorId("CPRINCIPAL", CPRINCIPAL);
            
            if (objUtiles.estaVacio(faceptar))
                faceptar = "";
                
            if (typeof SPERSON == 'boolean') {
                // Alta
                SPERSON = "";
            } 
            
            faceptar = "f_aceptar_axisper005";    
            
            objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=" + faceptar + "&SPERSON=" + SPERSON+"&ORIGEN=AXISCTR061");
        }
        
        function f_cerrar_axisper005(faceptar) {
            objUtiles.cerrarModal("axisper005");
            
            if (!objUtiles.estaVacio(faceptar)) 
                if (faceptar.indexOf("axisper001") > 0)
                    // Reabrir modal AXPER001 de nuevo
                    objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=" + faceptar);
        }
        
        function f_aceptar_axisper005 (faceptar, SPERSON) {
            objUtiles.cerrarModal("axisper005");
            // alert(faceptar);
            var principal = document.miForm.CPRINCIPAL.value;
            if (!objUtiles.estaVacio(faceptar)) {
                
                // alert("--- Debug: SPERSON recibido de axisper005: " + SPERSON + " ---");
                
                if (faceptar.indexOf("axisper001") > 0) {
                    // Venimos de AXISPER005 pero pasando por AXISPER001, es una nueva persona
                    if (faceptar.indexOf("habitual") > 0) {
                        // alert("Nueva persona, HABITUAL");
                        f_set_conductor(SPERSON, 0, null,principal); 
                    } else if (faceptar.indexOf("ocasional") > 0) {
                        // alert("Nueva persona, OCASIONAL");
                        f_set_conductor(SPERSON, null, null,principal); 
                    }
                } else if (faceptar.indexOf("axisper005") > 0) {
                    // alert("MODIFICANDO!");
                    // Modificación datos persona
                    // Sólo estamos cambando sus datos, así que podemos recargar pantalla para que los cambios se vean reflejados.    
                   // objUtiles.ejecutarFormulario ("axis_axisctr061.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);        
                    if (principal == 1) {
                        // alert("Nueva persona, HABITUAL");
                        f_set_conductor(SPERSON, 0, null,principal); 
                    } else  {
                        // alert("Nueva persona, OCASIONAL");
                        f_set_conductor(SPERSON, null, null,principal); 
                    }
                }
            }
        }            

        /****************************************************************************************/
        /************************************* AXISCTR062 ***************************************/
        /****************************************************************************************/
        
        /* Funciones para añadir o modificar conductores ocasionales INNOMINADOS */
        
        function f_axisctr062_anadir_conductor_ocasional_innominado() {
            objDom.setValorPorId("CPRINCIPAL", 0);
            objUtiles.abrirModal("axisctr062", "src", "modal_axisctr062.do?operation=form");
        }
        
        function f_axisctr062_modificar_conductor_ocasional_innominado(NORDEN) {
            objDom.setValorPorId("SELECTED_NORDEN", NORDEN);
            objDom.setValorPorId("CPRINCIPAL", 0);
            objUtiles.abrirModal("axisctr062", "src", "modal_axisctr062.do?operation=form&NORDEN=" + NORDEN);
        }
        
        function f_cerrar_axisctr062() {
            objUtiles.cerrarModal("axisctr062");
        }
        
        function f_aceptar_axisctr062(isNew) {
            // El modal ya habrá insertado el conductor innominado
            // Por lo tanto, sólo recargamos pantalla, releemos conductores
            f_cerrar_axisctr062();
            
            if (isNew)
                // Establecer el NORDEN a seleccionar (el último de la lista)
                objDom.setValorPorId("SELECTED_NORDEN", "${fn:length(requestScope.T_IAX_AUTCONDUCTORES) + 1}");
                
            objUtiles.ejecutarFormulario ("axis_axisctr061.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }

        /****************************************************************************************/
        /******************************* CALLBACKS AJAX *****************************************/
        /****************************************************************************************/    
        
        function callbackAjaxSetConductor(ajaxResponse) { 
            objAppMensajes.existenErroresEnAplicacion(objAjax.domParse(ajaxResponse));
        }        
        
        function f_abrir_axisper006(faceptar,SPERSON){
        //alert("abrir comun");
        //alert(faceptar);
        objDom.setVisibilidadPorId("but_cerrar_modal_axisper006", "hidden");
        if(faceptar.indexOf("conductores") > 0 && !objUtiles.estaVacio(SPERSON)){
        objUtiles.abrirModal("axisper006", "src", "modal_axisper006.do?operation=form&SPERSON=" + SPERSON +"&faceptar="+faceptar);
        }
    }
        function f_act_check_tomador(){
          document.miForm.CTOMADOR.value = document.getElementById("CTOMADOR").checked ? "1" : "0";
          var SPERSON = "${CONDUCTOR_HABITUAL.SPERSON}";
                var strURL="axis_axisctr061.do?operation=gestion_tomador_json&ISTOM="+ document.miForm.CTOMADOR.value+"&SPERSON="+SPERSON;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonGestTom, ajaxTexto)
            
          
        }
        function callbackjsonGestTom(p){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	   try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var cont = 0;
                }
                
                }catch(e){}
        }
        function f_act_check_asegurado(){
          document.miForm.CASEGURADO.value = document.getElementById("CASEGURADO").checked ? "1" : "0";
          
        }
        
        function f_cerrar_axisper006(faceptar){
        //alert("cerrar comun");
        //alert(faceptar);
        objUtiles.cerrarModal("axisper006");
        if(faceptar.indexOf("conductores") > 0){
            objUtiles.ejecutarFormulario("axis_axisctr061.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
       
       // f_selecciona_tomador(objDom.getValorPorId("SPERSON_TOMAD"), this);
    }

        function f_cerrar_axisctr101 () {
            objUtiles.cerrarModal("axisctr101");
        }    
        
            function f_aceptar_axisctr101 (nombre,nombre1,nombre2,ape1,ape2,ctipide,tidenti,csexper,fnacimi,fnif,sperson_anti,NORDEN,CDOMICI,CPAIS,CPROVIN,CPOBLAC,COCUPACION) {
                objUtiles.cerrarModal("axisctr101");   
                document.miForm.TNOMBRE.value=nombre;
                document.miForm.TNOMBRE1.value=nombre1;
                document.miForm.TNOMBRE2.value=nombre2;
                document.miForm.TAPELLI1.value=ape1;
                document.miForm.TAPELLI2.value=ape2;
                document.miForm.CTIPIDE.value=ctipide;
                document.miForm.TIDENTI.value=tidenti;
                document.miForm.CSEXPER.value=csexper;
                
                document.miForm.FNACIMI.value=fnacimi;
                document.miForm.NNUMNIF.value=fnif;
                //document.miForm.CDOMICI.value=CDOMICI;
                document.miForm.CDOMICIx.value=CDOMICI;
                document.miForm.CPAIS.value=CPAIS;
                document.miForm.CPROVIN.value=CPROVIN;
                document.miForm.CPOBLAC.value=CPOBLAC;
                document.miForm.COCUPACION.value=COCUPACION;
                document.miForm.SPERSONBUS.value=sperson_anti;
               
                var SELECTED_NORDEN = document.miForm.SELECTED_NORDEN.value;
            
            if (objUtiles.estaVacio(SELECTED_NORDEN)) {
                // Si está vacío NORDEN, es porque estamos insertando un conductor ocasional.
                // El nuevo NORDEN a seleccionar, será el índice superior de la lista
                SELECTED_NORDEN = "${fn:length(requestScope.T_IAX_AUTCONDUCTORES) + 1}";
                objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
            }
            
        //    if (SELECTED_NORDEN == 0) {
                // No queremos seleccionar el primero, el habitual.
        //        SELECTED_NORDEN = null;
        //        objDom.setValorPorId("SELECTED_NORDEN", SELECTED_NORDEN);
        //    }        
                
                objUtiles.ejecutarFormulario("axis_axisctr061.do", "set_conductor_simul", document.miForm, "_self");
            }
            
          function f_abrir_axisctr101(valor,principal) {
                 document.miForm.SELECTED_NORDEN.value = valor;
                 document.miForm.CPRINCIPAL.value = principal;
                 
                 objUtiles.abrirModal("axisctr101", "src", "modal_axisctr101.do?operation=init&TIPO=4");
            }
            
          function f_intro_conductor(NORDEN,PRINCIPAL) {
          
            var modo = document.miForm.CMODO.value;
            if(modo == 'SIMULACION')
                f_abrir_axisctr101('0','1');
            else
               f_axisper001_modificar_conductor_nominado('0','1');
               
          }
        
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,CODIGO_CP){
             window.scrollTo(0,0);
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + "&CODIGO_CP=" + CODIGO_CP);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
          
            if (CODIGO_CONSULTA == "LISTA_PAIS_RESIDENCIA") {
            
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + TEXTO + "</b>");
                
                if (document.miForm.isNew.value == "true"){
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
                }
                
                
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS_NACIONALIDAD") {
                objDom.setValorPorId("CNACIONALIDAD", CODIGO);
                objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + TEXTO + "</b>");
            }
            
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                alert(1);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS_DIRECCION");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS_DIRECCION") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
        
        
        function f_onchange_CPAIS_DIRECCION() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS");
           
            if (!objUtiles.estaVacio(CPAIS_DIRECCION)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS_DIRECCION";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS_DIRECCION", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS_DIRECCION");
            }
        }
        function f_onchange_CPOBLAC() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            } else {
             /*   objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");*/
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {
            var CPAIS_DIRECCION=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS_DIRECCION="+CPAIS_DIRECCION
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axisper005.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
        function callbackajaxdireccion (ajaxResponseText){
            try{ 
            
           // alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS_DIRECCION", "");
                            limpiaCampos("CPAIS_DIRECCION");
                        }else{
                            objDom.setValorPorId("CPAIS_DIRECCION", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS_DIRECCION");
                            }
                        }
                    }
                 
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS_RESIDENCIA")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            if (document.miForm.isNew.value == "true"){
                                objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS_RESIDENCIA"), 0, 0));
                            }
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISRESIDENCIA")[0])){
                                objDom.setValorHTMLPorId("TPAISRESIDENCIA_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                  
                                    if (document.miForm.isNew.value == "true"){
                                     objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISRESIDENCIA"), 0, 0) + "</b>");
                                     }
                                
                                limpiaCampos("CPAIS_RESIDENCIA");
                            }
                        }
                    }
                    
                      if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CNACIONALIDAD")[0])) {
                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CNACIONALIDAD", "");
                            limpiaCampos("CNACIONALIDAD");
                        }else{
                            objDom.setValorPorId("CNACIONALIDAD", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CNACIONALIDAD"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAISNACIONALIDAD")[0])){
                                 objDom.setValorHTMLPorId("TPAISNACIONALIDAD_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAISNACIONALIDAD"), 0, 0) + "</b>");
                                limpiaCampos("CNACIONALIDAD");
                            }
                        }
                    }
                    
         
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
            
                <%-- Especial per controlar els scroll amb iPad --%>
                // recarrega scroll pane
                $.reinitialiseScroll();
                <%-- Especial per controlar els scroll amb iPad --%>
            
        }
        
    </script>        
</head>
    
<body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
          <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr100" c="TITULO_AXISCTR101" lit="1000199" /></c:param>
                <c:param name="nid" value="axisctr101" />
            </c:import>
  <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>        
    <form name="miForm" action="" method="POST">
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="SELECTED_NORDEN" id="SELECTED_NORDEN" value="${__formdata.SELECTED_NORDEN}"/>
        <input type="hidden" name="offset_dt" id="offset_dt" value="${__formdata.offset_dt}"/>
        <input type="hidden" name="CPRINCIPAL" id="CPRINCIPAL" value="${__formdata.CPRINCIPAL}"/>
        
        <input type="hidden" name="TNOMBRE1" id="TNOMBRE1" value=""/>
        <input type="hidden" name="TNOMBRE2" id="TNOMBRE2" value=""/>
        <input type="hidden" name="TAPELLI1" id="TAPELLI1" value=""/>
        <input type="hidden" name="TAPELLI2" id="TAPELLI2" value=""/>
        <input type="hidden" name="CTIPIDE" id="CTIPIDE" value=""/>
        <input type="hidden" name="TIDENTI" id="TIDENTI" value=""/>
        <input type="hidden" name="CSEXPER" id="CSEXPER" value=""/>
        <input type="hidden" name="NNUMNIF" id="NNUMNIF" value=""/>
        <input type="hidden" name="CDOMICIx" id="CDOMICIx" value=""/>
<%--        <input type="hidden" name="CDOMICI" id="CDOMICI" value="${__formdata.CDOMICI}"/>
         <input type="hidden" name="CPAIS" id="CPAIS" value="${__formdata.CPAIS}"/>
       <input type="hidden" name="CPROVIN" id="CPROVIN" value="${__formdata.CPROVIN}"/>
        <input type="hidden" name="CPOBLAC" id="CPOBLAC" value="${__formdata.CPOBLAC}"/> --%>
        <input type="hidden" name="CMODO" id="CMODO" value="${__formdata.CMODO}" />
     	<input type="hidden" name="COCUPACION" id="COCUPACION" value="${CONDUCTOR_HABITUAL.PERSONA.COCUPACION}" />

        <input type="hidden" name="DONDE" id="DONDE" value="${__formdata.DONDE}" />
        <input type="hidden" name="SPERSONBUS" id="SPERSONBUS" value="${__formdata.SPERSONBUS}" />
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
                ${literalPantalla}
            </c:param>
            <c:param name="formulario">
                ${literalPantalla}
            </c:param>
            <c:param name="modalidad">
                <axis:alt f="${pantalla}" c="LIT_MODALITAT" lit="101110"/>
            </c:param>
            <c:param name="form">
                ${pantalla}
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisper001|<axis:alt f="${pantalla}" c="LIT_BUSC_PERS" lit="1000235"/>#axisper005|<axis:alt f="${pantalla}" c="LIT_ALTA_RAPID_PERS" lit="1000214"/>#axisctr062|<axis:alt f="${pantalla}" c="LIT_CONDUCTOR_INNOM" lit="9001283"/>
            </c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="axisctr061" c="MDL_AXISPER006" lit="1000215"/>
        </c:param>
        <c:param name="nid" value="axisper006"/>
        
    </c:import>
        
        <!-- Area de campos  -->
        <table class="mainTableDimensions base" align="center" cellpadding="0"
               cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <!-- Sección Conductor Habitual -->                    
                    <div style="font-size:12px;color:#FF9900;font-weight:bold;float:left;">
                        <img src="images/flecha.gif"/><axis:alt f="${pantalla}"
                                                            c="LIT_PRIMER_SUBTITULO"
                                                            lit="9001168"/> <%-- Conductor Habitual --%>
                    </div> 
                    <table class="seccion" align="center" style="line-height:20px;border-top:1px solid #006000;">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:18%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:14%;height:0px"></th>
                                        <th style="width:18%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" colspan="5">
                                        
                                            <c:if test="${tomadorEsConductorOcasional != true && (empty tomVacio || tomVacio == 0) }">
                                              <axis:visible f="${pantalla}" c="CONDUCTOR_ES_TOMADOR">                                                
                                                    <b>                                                
                                                        <axis:alt f="${pantalla}" c="CONDUCTOR_ES_TOMADOR" lit="9001176"/>
                                                        	<input type="radio" id="TOMADOR_O_PROPIETARIO_0" name="TOMADOR_O_PROPIETARIO_0" 
                                                        	 <axis:atr f="axisctr061" c="CONDUCTOR_ES_TOMADOR" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        onclick="if (!${CONDUCTOR_HABITUAL.ES_TOMADOR == true}) { this.value = 0;f_set_conductor(null, 0, 'tomador','1') }"
                                                        <c:if test="${CONDUCTOR_HABITUAL.ES_TOMADOR == true}"> checked='checked' </c:if>/> 
                                                    </b>
                                                </axis:visible>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${propietarioEsConductorOcasional != true && tomadorIsAseg == false && hayPersonaFisica==true && (empty asegVacio || asegVacio == 0 )}">
                                                <c:if test="${empty CONDUCTOR_HABITUAL.ES_PROPIETARIO || CONDUCTOR_HABITUAL.ES_PROPIETARIO == true}">
                                                    <axis:visible f="${pantalla}" c="CONDUCTOR_ES_PROPIETARIO">                                                
                                                        <b>
                                                        <axis:alt f="${pantalla}" c="CONDUCTOR_ES_PROPIETARIO" lit="9001177"/>
                                                        	<input type="radio" id="TOMADOR_O_PROPIETARIO_0" name="TOMADOR_O_PROPIETARIO_0" 
                                                        	<axis:atr f="axisctr061" c="CONDUCTOR_ES_PROPIETARIO" a="modificable=true&obligatorio=false&isInputText=false"/>
                                                        onclick="if (!${CONDUCTOR_HABITUAL.ES_PROPIETARIO == true}) { this.value = 1;f_set_conductor(null, 0, 'propietario','1') }"                                                    
                                                        <c:if test="${CONDUCTOR_HABITUAL.ES_PROPIETARIO == true}"> checked="checked"</c:if> /> 
                                                        </b>
                                                    </axis:visible>                                                    
                                                </c:if>                                            
                                            </c:if>
                                        </td>
                                    </tr>
                                    <c:if test="${tomadorEsConductorOcasional != true || (propietarioEsConductorOcasional != true && tomadorIsAseg == false)}">
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>                                    
                                    </c:if>
                                     <c:if test="${!empty tomVacio && tomVacio == 1 && !empty CONDUCTOR_HABITUAL.SPERSON}">
                                            
                                    <tr>                               
                                      <axis:ocultar dejarHueco="false" f="${pantalla}" c="CTOMADOR">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="CTOMADOR" lit="9001176"/></b>
                                            </td>
                                        </axis:ocultar>
                                  
                                           <%--axis:ocultar dejarHueco="false" f="${pantalla}" c="CASEGURADO">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="CASEGURADO" lit="1"/></b>
                                            </td>
                                        </axis:ocultar--%>
                                    
                                    </tr>  </c:if>
                                     <c:if test="${!empty tomVacio && tomVacio == 1 && !empty CONDUCTOR_HABITUAL.SPERSON}">                         
                                    <tr>
                                     <axis:ocultar dejarHueco="false" f="${pantalla}" c="CTOMADOR">
                                     <td class="campocaja">
                                          <input type="checkbox" id="CTOMADOR" name="CTOMADOR" <c:if test="${__formdata.CTOMADOR == 1 || CONDUCTOR_HABITUAL.ES_TOMADOR == true }">checked</c:if> value="${__formdata.CTOMADOR}" onclick="f_act_check_tomador();"
                                           <axis:atr f="axisctr061" c="CTOMADOR" a="modificable=true&obligatorio=false&isInputText=false"/> />
                                     </td>
                                     </axis:ocultar>
                                         <%--axis:ocultar dejarHueco="false" f="${pantalla}" c="CASEGURADO">
                                      <td class="campocaja">
                                          <input type="checkbox" id="CASEGURADO" name="CASEGURADO" <c:if test="${__formdata.CASEGURADO == 1 || CONDUCTOR_HABITUAL.ES_PROPIETARIO == true}">checked</c:if> value="${__formdata.CASEGURADO}" onclick="f_act_check_asegurado();"
                                           <axis:atr f="axisctr061" c="CASEGURADO" a="modificable=true&obligatorio=false&isInputText=false"/> />
                                     </td>
                                     </axis:ocultar--%>
                                    </tr>
                                    </c:if>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NNUMIDE">
                                            <td class="titulocaja">
                                                <span id="TTIPIDE_CONDUCTOR_0">
                                                    <c:choose>
                                                        <c:when test="${!empty CONDUCTOR_HABITUAL.PERSONA.TTIPIDE}">
                                                            <b>${CONDUCTOR_HABITUAL.PERSONA.TTIPIDE}</b>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <b><axis:alt f="${pantalla}" c="NNUMIDE" lit="105330"/></b>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TNOMBRE">
                                            <td class="titulocaja" colspan="3">
                                                <b><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="SNIP">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="SNIP" lit="1000088"/></b>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NNUMIDE">
                                            <td class="campocaja">
                                                <input type="text"
                                                       class="campowidthinput campo campotexto"
                                                       id="NNUMIDE" name="NNUMIDE"
                                                       size="15"
                                                       value="${CONDUCTOR_HABITUAL.PERSONA.NNUMIDE}"
                                                       style="width:85%;"
                                                       <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/>/>
                                                <c:set var="canModify">
                                                    ${!empty CONDUCTOR_HABITUAL.SPERSON ? "visible" : "hidden"}
                                                </c:set>
                                                <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                              c="BT_EDITAR_PER">
                                                    <a style="visibility:${canModify}"
                                                       href="javascript:f_abrir_axisper005('f_aceptar_axisper005', '${CONDUCTOR_HABITUAL.SPERSON}','1')">
                                                         <img border="0"
                                                             alt='<axis:alt f="${pantalla}" c="LIT_ALTA_RAPID_PERS" lit="1000214"/>'
                                                             title='<axis:alt f="${pantalla}" c="LIT_ALTA_RAPID_PERS" lit="1000214"/>'
                                                             src="images/lapiz.gif"/>
                                                    </a>
                                                </axis:ocultar>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TNOMBRE">
                                            <td class="campocaja" colspan="3">
                                                <input type="text"
                                                       style="width:95.5%;"
                                                       class="campowidthinput campo campotexto"
                                                       id="TNOMBRE" name="TNOMBRE"
                                                       size="15"
                                                       value="${CONDUCTOR_HABITUAL.PERSONA.TNOMBRE} ${CONDUCTOR_HABITUAL.PERSONA.TAPELLI1} ${CONDUCTOR_HABITUAL.PERSONA.TAPELLI2}"
                                                       <axis:atr f="${pantalla}" c="TNOMBRE" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="SNIP">
                                            <td class="campocaja">
                                                <input type="text" style="width:85%"
                                                       class="campowidthinput campo campotexto"
                                                       id="SNIP" name="SNIP"
                                                       size="15"
                                                       value="${CONDUCTOR_HABITUAL.PERSONA.SNIP}"
                                                       <axis:atr f="${pantalla}" c="SNIP" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TSEXPER">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="TSEXPER" lit="100962"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TOCUPACION">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="TOCUPACION" lit="9904804"/></b>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/></b> <%-- Núm. puntos --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/></b> <%-- Fecha carnet --%>
                                            </td>
                                        </axis:ocultar>                                        
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                            <td class="campocaja">
                                                <input type="text" style="width:85%"
                                                       class="campowidthinput campo campotexto"
                                                       id="FNACIMI" name="FNACIMI"
                                                       size="15"
                                                       value="<fmt:formatDate value='${CONDUCTOR_HABITUAL.PERSONA.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                       <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=false&formato=fecha"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TSEXPER">
                                            <td class="campocaja">
                                                <input type="text" style="width:85%"
                                                       class="campowidthinput campo campotexto"
                                                       id="TSEXPER" name="TSEXPER"
                                                       size="15"
                                                       value="${CONDUCTOR_HABITUAL.PERSONA.TSEXPER}"
                                                       <axis:atr f="${pantalla}" c="TSEXPER" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="TOCUPACION">
                                            <td class="campocaja">
                                                <input type="text" style="width:93%"
                                                       class="campowidthinput campo campotexto"
                                                       id="TOCUPACION" name="TOCUPACION"
                                                       size="15"
                                                       title="<axis:alt f="${pantalla}" c="TOCUPACION" lit="9904804"/>"
                                                       value="${CONDUCTOR_HABITUAL.PERSONA.TOCUPACION}"
                                                       <axis:atr f="${pantalla}" c="TOCUPACION" a="modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                            <td class="campocaja">
                                                <input type="text" style="width:70%"
                                                       class="campowidthinput campo campotexto"
                                                       id="NPUNTOS" name="NPUNTOS"
                                                       size="15" alt="<axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/>" title="<axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/>"
                                                       formato="entero"
                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_HABITUAL.SPERSON}', '${CONDUCTOR_HABITUAL.NORDEN}', this.value, objDom.getValorPorId('FCARNET'),objDom.getValorPorId('CDOMICI'),'1','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                       value="${CONDUCTOR_HABITUAL.NPUNTOS}"
                                                       <axis:atr f="${pantalla}" c="NPUNTOS" a="formato=entero&modificable=true"/>/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                            <td class="campocaja">
                                                <input type="text" style="width:76%"
                                                       class="campowidthinput campo campotexto"
                                                       id="FCARNET" name="FCARNET"
                                                       size="15" alt="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>" title="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>"
                                                       formato="fecha"
                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_HABITUAL.SPERSON}', '${CONDUCTOR_HABITUAL.NORDEN}', objDom.getValorPorId('NPUNTOS'), this.value,objDom.getValorPorId('CDOMICI'),'1','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"                                                       
                                                       onchange="f_ajax_set_conductor(null,'${CONDUCTOR_HABITUAL.SPERSON}', '${CONDUCTOR_HABITUAL.NORDEN}', objDom.getValorPorId('NPUNTOS'), this.value,objDom.getValorPorId('CDOMICI'),'1','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"                                                       
                                                       value="<fmt:formatDate value='${CONDUCTOR_HABITUAL.FCARNET}' pattern='dd/MM/yyyy'/>"
                                                       <axis:atr f="${pantalla}" c="FCARNET" a="formato=fecha&modificable=true"/>/><a id="icon_FCARNET" style="vertical-align:middle;"><img 
                                                       alt="<axis:alt f="${pantalla}" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>
                                    </tr>
                                    <tr>  
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_CEXPER">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="EXPER_CEXPER" lit="9905039"/></b> <%-- experiencia que viene por interfaz.  --%>
                                            </td>
                                        </axis:ocultar>
                                         <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_MANUAL">
                                            <td class="titulocaja">
                                                <b><axis:alt f="${pantalla}" c="EXPER_MANUAL" lit="9905038"/></b> <%-- experiencia CONDUCTOR --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisctr061" c="CDOMICI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b><axis:alt f="axisctr061" c="CDOMICI" lit="101078"/></b>
                                            </td>
                                        </axis:ocultar>                                       
                                    </tr>
                                    <tr>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_CEXPER">
                                             <td class="campocaja">
                                                <input type="text" style="width:30%"
                                                       class="campowidthinput campo campotexto"
                                                       id="EXPER_CEXPER" name="EXPER_CEXPER"
                                                       size="15" alt="<axis:alt f="${pantalla}" c="EXPER_CEXPER" lit="9905039"/>" title="<axis:alt f="${pantalla}" c="EXPER_CEXPER" lit="9905039"/>"
                                                       formato="entero"
                                                       value="${CONDUCTOR_HABITUAL.EXPER_CEXPER}"
                                                       <axis:atr f="${pantalla}" c="EXPER_CEXPER" a="formato=entero&modificable=false"/>/>
                                            </td>
                                        </axis:ocultar>                                        
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_MANUAL">
                                            <td class="campocaja" >
                                            <!-- BUG 0026923/0151408 - JSV (26/08/2013) -->
                                            <input type="text" style="width:35%"
                                                       onblur="f_ajax_set_conductor_EXPER_MANUAL(this.value,'${CONDUCTOR_HABITUAL.SPERSON}', '${CONDUCTOR_HABITUAL.NORDEN}',  '${CONDUCTOR_HABITUAL.NPUNTOS}', objDom.getValorPorId('FCARNET'),objDom.getValorPorId('CDOMICI'),'1','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                       class="campowidthinput campo campotexto"
                                                       id="EXPER_MANUAL" name="EXPER_MANUAL"
                                                       size="15" alt="<axis:alt f="${pantalla}" c="EXPER_MANUAL" lit="9905038"/>" title="<axis:alt f="${pantalla}" c="EXPER_MANUAL" lit="9905038"/>"
                                                       formato="entero"
                                                       value="${CONDUCTOR_HABITUAL.EXPER_MANUAL}"
                                                       maxlength="2"
                                                       <axis:atr f="${pantalla}" c="EXPER_MANUAL" a="formato=entero&modificable=true"/>/>
                                            
                                            </td>
                                        </axis:ocultar>                                        
                                        <axis:ocultar f="axisctr061" c="CDOMICI" dejarHueco="false">
                                            <td class="campocaja">   
                                                <select name="CDOMICI"
                                                        <axis:atr f="axisctr061" c="CDOMICI" a="obligatorio=false&isInputText=false"/>
                                                        style="width:90%"
                                                        id="CDOMICI" size="1" 
                                                        title="<axis:alt f="axisctr061" c="CDOMICI" lit="101078"/>"
                                                        alt="<axis:alt f="axisctr061" c="CDOMICI" lit="101078"/>"
                                                        class="campowidthselect campo campotexto">
                                                    &nbsp;
                                                    <%--c:if test="${fn:length(sessionScope.axisctr_tomador.T_DOMICILIOS) > 1 || empty sessionScope.axisctr_tomador.T_DOMICILIOS}"--%>
                                                       <c:if test="${empty __formdata.CDOMICI}">
                                                        <option value="<%= Integer.MIN_VALUE %>">
                                                            -
                                                            <axis:alt f="axisctr061" c="SNV_COMBO" lit="108341"/>
                                                            -
                                                        </option>
                                                    </c:if>
                                                    <c:forEach var="domicilio"
                                                               items="${__formdata.lstdomicilios}"
                                                               varStatus="status">
                                                        <option value="${domicilio.CDOMICI}"
                                                              <c:if test="${domicilio.CDOMICI == __formdata.CDOMICI || domicilio.CDOMICI == CONDUCTOR_HABITUAL.CDOMICI || fn:length(__formdata.lstdomicilios) == 1}">selected</c:if> 
                                                                >
                                                            ${domicilio.TDOMICI}
                                                            ${domicilio.CPOSTAL}
                                                            ${domicilio.TPOBLAC}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <axis:visible f="axisctr061"
                                                              c="BT_EDITAR_DOMICILIO">
                                                    <a id="conductores_abrir_axisper006_a"
                                                       href="javascript:f_abrir_axisper006('f_aceptar_conductores_axisper006','${CONDUCTOR_HABITUAL.SPERSON}')">
                                                        <img border="0"
                                                             alt='<axis:alt f="axisctr061" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                             title='<axis:alt f="axisctr061" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                             src="images/lapiz.gif"/>
                                                    </a>
                                                </axis:visible>
                                            </td>
                                        </axis:ocultar>                                       
                                    </tr>
                            <tr>  
                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_SINIE">
                                            <td class="titulocaja">
                                                    <b><axis:alt f="${pantalla}" c="EXPER_SINIE" lit="9906558"/></b> <%-- experiencia que viene por interfaz.  --%>
                                            </td>
                                    </axis:ocultar>
                                     <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_SINIE_MANUAL">
                                            <td class="titulocaja">
                                                    <b><axis:alt f="${pantalla}" c="EXPER_SINIE_MANUAL" lit="9906559"/></b> <%-- experiencia CONDUCTOR --%>
                                            </td>
                                    </axis:ocultar>                                  
                            </tr>
                            <tr>
                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_SINIE">
                                            <td class="campocaja" >
                                            <select name="EXPER_SINIE"
                                                        <axis:atr f="${pantalla}" c="EXPER_SINIE" a="modificable=false&isInputText=false"/>
                                                        style="width:90%"
                                                        id="EXPER_SINIE" size="1" 
                                                        title="<axis:alt f="${pantalla}" c="EXPER_SINIE" lit="9906558"/>"
                                                        alt="<axis:alt f="${pantalla}" c="EXPER_SINIE" lit="9906558"/>"
                                                        class="campowidthselect campo campotexto">
                                                    &nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                            -
                                                            <axis:alt f="axisctr061" c="SNV_COMBO" lit="108341"/>
                                                            -
                                                    </option>
                                                    <option value="0" <c:if test="${CONDUCTOR_HABITUAL.EXPER_SINIE == 0}">selected</c:if>>
                                                        <axis:alt f="${pantalla}" c="NO_OPTION" lit="101779"/>
                                                    </option>
                                                    <option value="1" <c:if test="${CONDUCTOR_HABITUAL.EXPER_SINIE == 1}">selected</c:if>>
                                                        <axis:alt f="${pantalla}" c="SI_OPTION" lit="101778"/>
                                                    </option>
                                                </select>
                                                </td>
                                    </axis:ocultar>                                        
                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="EXPER_SINIE_MANUAL">
                                            <td class="campocaja" >
                                            <select name="EXPER_SINIE_MANUAL"
                                                        <axis:atr f="${pantalla}" c="EXPER_SINIE_MANUAL" a="modificable=true&isInputText=false"/>
                                                        style="width:90%"
                                                        id="EXPER_SINIE_MANUAL" size="1" 
                                                        title="<axis:alt f="${pantalla}" c="EXPER_SINIE_MANUAL" lit="9906559"/>"
                                                        alt="<axis:alt f="${pantalla}" c="EXPER_SINIE_MANUAL" lit="9906559"/>"
                                                        class="campowidthselect campo campotexto">
                                                    &nbsp;
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                            -
                                                            <axis:alt f="axisctr061" c="SNV_COMBO" lit="108341"/>
                                                            -
                                                    </option>
                                                    <option value="0" <c:if test="${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL == 0}">selected</c:if>>
                                                        <axis:alt f="${pantalla}" c="NO_OPTION" lit="101779"/>
                                                    </option>
                                                    <option value="1" <c:if test="${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL == 1}">selected</c:if>>
                                                        <axis:alt f="${pantalla}" c="SI_OPTION" lit="101778"/>
                                                    </option>
                                                </select>
                                                </td>
                                    </axis:ocultar>              
                            </tr>
                            <tr>
								<axis:ocultar f="axisctr061" c="CPAIS" dejarHueco="false">		 
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr061" c="TPAIS" lit="100816"/></b>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr061" c="CPROVIN" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr061" c="TPROVIN" lit="100756"/></b>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr061" c="CPOBLAC" dejarHueco="false">
                                <td class="titulocaja">                                    
                                    <b><axis:alt f="axisctr061" c="TPOBLAC" lit="100817"/></b>
                                </td>
								</axis:ocultar>

                            </tr>
                             <tr>
								<axis:ocultar f="axisctr061" c="CPAIS" dejarHueco="false">	
                                <td class="campocaja">
                                     <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS"  style="width:18%;" onchange="f_onchange_CPAIS_DIRECCION()"
                                    title="<axis:alt f="axisctr061" c="CPAIS_DIRECCION" lit="100816"/>" <axis:atr f="axisctr061" c="CPAIS_DIRECCION" a="obligatorio=false&modificable=false"/>/>&nbsp;
                                    &nbsp;
                                    <c:if test="${!empty(CONDUCTOR_HABITUAL)}"> 
                                    <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                    </c:if> 
                                    &nbsp;
                                    <span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                </td>
								</axis:ocultar>
								<axis:ocultar f="axisctr061" c="CPROVIN" dejarHueco="false">
                                <td class="campocaja" >
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" style="width:18%;" onchange="f_onchange_CPROVIN()" 
                                     title="<axis:alt f="axisctr061" c="CPROVIN" lit="100756"/>" <axis:atr f="axisctr061" c="CPROVIN" a="obligatorio=false&modificable=false"/>/>
                                    &nbsp;<img id="findProvincia" style="visibility:${(empty __formdata.CPAIS) ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)"/>                
                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                </td>
                                </axis:ocultar>
								<axis:ocultar f="axisctr061" c="CPOBLAC" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC"  style="width:18%;" onchange="f_onchange_CPOBLAC()"
                                    title="<axis:alt f="axisctr005" c="CPOBLAC" lit="100817"/>"
                                       <axis:atr f="axisctr061" c="CPOBLAC" a="obligatorio=false&modificable=false"/>/>
                                    &nbsp;<img id="findPoblacion" style="visibility:${(empty __formdata.CPROVIN ) ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value)"/>                
                                    &nbsp; <span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                </td> 
								</axis:ocultar>
                                <axis:visible f="${pantalla}" c="BT_ANYADIR_CONDUCTOR">                                
                                <td colspan="10">
                                            <div style="float:right;">                        
                                                <input type="button" class="boton" value="<axis:alt f='axisctr061' c='BT_ANYADIR_CONDUCTOR' lit='9001027'/>"
                                                onclick="f_intro_conductor('0','1')"/>
                                            </div>
                                        </td>
                                </axis:visible>                               
                             </tr>
                             
                                    
                                    
                                   
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <axis:visible c="DSP_OCASIONAL" f="axisctr061">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    
                    <!-- Sección Conductores Ocasionales -->                    
                    <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="${pantalla}"
                                                                c="LIT_SEGUNDO_SUBTITULO"
                                                                lit="9001169"/> <%-- Lista de conductores ocasionales --%>
                    </div>
                    <table class="seccion" align="center">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    
                                    <c:if test="${!empty CONDUCTOR_HABITUAL}">
                                        <tr>
                                            <td class="titulocaja">                                                
                                                <c:if test="${CONDUCTOR_HABITUAL.ES_TOMADOR != true && (empty tomVacio || tomVacio == 0)}">
                                                    <b>
                                                    <axis:alt f="${pantalla}" c="TOMADOR_O_PROPIETARIO_X" lit="9001314"/><input type="radio" id="TOMADOR_O_PROPIETARIO_X" name="TOMADOR_O_PROPIETARIO_X" 
                                                    onclick="if (!${tomadorEsConductorOcasional == true}) { this.value = 0;f_set_conductor(null, null, 'tomador','0') }" 
                                                    <c:if test="${tomadorEsConductorOcasional == true}"> checked='checked' </c:if>/> 
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </b>
                                                </c:if>
                                                
                                                <c:if test="${CONDUCTOR_HABITUAL.ES_PROPIETARIO != true && tomadorIsAseg == false && (empty asegVacio || asegVacio == 0 )}">
                                                    <b>
                                                    <axis:alt f="${pantalla}" c="IS_TOMADOR_OR_PROPIETARY_X" lit="9001315"/><input type="radio" id="IS_TOMADOR_OR_PROPIETARY_X" name="IS_TOMADOR_OR_PROPIETARY_X" 
                                                    onclick="if (!${propietarioEsConductorOcasional == true}) { this.value = 1;f_set_conductor(null, null, 'propietario','0') }"                                                    
                                                    <c:if test="${propietarioEsConductorOcasional == true}"> checked="checked"</c:if> /> 
                                                    </b>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:if>
                                    
                                    <tr>
                                        <td>
                                            <!-- DisplayTag Conductores Ocasionales -->
                                            <c:set var="title1">
                                                <axis:alt f="${pantalla}"
                                                          c="DSP_LIT_PRIMERA_COLUMNA"
                                                          lit="9001186"/> <%-- Conductores --%>
                                            </c:set>
                                            <c:set var="title2">
                                                <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                              c="ES_TOMADOR">
                                                    <axis:alt f="${pantalla}"
                                                              c="ES_TOMADOR"
                                                              lit="101027"></axis:alt> <%-- Tomador --%>
                                                </axis:ocultar>
                                            </c:set>
                                            <c:set var="title3">
                                                <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                              c="ES_PROPIETARIO">
                                                    <axis:alt f="${pantalla}"
                                                              c="ES_PROPIETARIO"
                                                              lit="9001174"></axis:alt> <%-- Propietario --%>
                                                </axis:ocultar>
                                            </c:set>
                                            <div class="separador">&nbsp;</div>
                                            
                                            <div class="displayspace" id="dt_conductores">
                                                <display:table name="${T_IAX_AUTCONDUCTORES}"
                                                               id="T_IAX_AUTCONDUCTORES"
                                                               export="false"
                                                               class="dsptgtable"
                                                               pagesize="-1"
                                                               defaultsort="1"
                                                               defaultorder="ascending"
                                                               sort="list"
                                                               cellpadding="0"
                                                               cellspacing="0"
                                                               requestURI="axis_${pantalla}.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                        <%-- Miramos si el conductor es innominado (SPERSON == null) o no --%>
                                                        <c:set var="esInnominado" value="${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON == null}"/>
                                                    
                                                        <display:column title=""
                                                                        sortProperty=""
                                                                        sortable="false"
                                                                        headerClass="headwidth5 sortable"
                                                                        media="html"
                                                                        autolink="false">
                                                                <div class="dspIcons">
                                                                    <input <c:if test="${CONDUCTOR_OCASIONAL.NORDEN == pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}">checked</c:if>
                                                                           onclick="javascript:f_selecciona_conductor('${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}')"
                                                                           value="${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}"
                                                                           type="radio"
                                                                           id="radioConductor"
                                                                           name="radioConductor"/>
                                                                </div>
                                                        </display:column>
                                                        <display:column title="${title1}"
                                                                        sortable="true"
                                                                        sortProperty="OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE"
                                                                        headerClass="sortable"
                                                                        media="html"
                                                                        autolink="false">
                                                                <div class="dspText">
                                                                    <c:if test="${!esInnominado}">
                                                                        ${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TNOMBRE}
                                                                        ${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI1}
                                                                        ${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.PERSONA.TAPELLI2}
                                                                    </c:if>
                                                                    <c:if test="${esInnominado}">
                                                                        <fmt:formatDate value='${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.FNACIMI}'
                                                                        pattern='dd/MM/yyyy'/>
                                                                        -
                                                                        ${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.TSEXO}
                                                                    </c:if>
                                                                </div>
                                                        </display:column>
                                                        
                                                        <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                                      c="ES_TOMADOR">
                                                            <display:column title="${title2}"
                                                                            sortable="false"
                                                                            sortProperty=""
                                                                            headerClass="sortable headwidth10"
                                                                            media="html"
                                                                            autolink="false">
                                                                    <div class="dspIcons">
                                                                        <c:if test="${!esInnominado}">
                                                                            <input <c:if test="${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.ES_TOMADOR == true}">checked="true"</c:if>
                                                                                   type="checkbox"
                                                                                   <axis:atr f="${pantalla}" c="ES_TOMADOR" a="modificable=false"/>
                                                                                   id="ES_TOMADOR"
                                                                                   name="ES_TOMADOR"
                                                                                   disabled="disabled"
                                                                                   value=""/>
                                                                        </c:if>                                                                               
                                                                    </div>
                                                            </display:column>
                                                        </axis:ocultar>                                                        
                                                        
                                                        <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                                      c="ES_PROPIETARIO">
                                                            <display:column title="${title3}"
                                                                            sortable="false"
                                                                            sortProperty=""
                                                                            headerClass="sortable headwidth10"
                                                                            media="html"
                                                                            autolink="false">
                                                                    <div class="dspIcons">
                                                                        <c:if test="${!esInnominado}">
                                                                            <input <c:if test="${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.ES_PROPIETARIO == true}">checked="true"</c:if>
                                                                                   type="checkbox"
                                                                                   <axis:atr f="${pantalla}" c="ES_PROPIETARIO" a="modificable=false"/>
                                                                                   id="ES_PROPIETARIO"
                                                                                   disabled="disabled"
                                                                                   name="ES_PROPIETARIO"
                                                                                   value=""/>
                                                                        </c:if>
                                                                    </div>
                                                            </display:column>
                                                        </axis:ocultar>                                 
                                                        
                                                        <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                                      c="BT_MODIF_TOMADOR">
                                                            <display:column title=""
                                                                            headerClass="headwidth5 sortable"
                                                                            media="html"
                                                                            autolink="false">
                                                                    <div class="dspIcons">
                                                                        <c:set var="javascriptModificar">
                                                                            <c:if test="${esInnominado}">
                                                                                f_axisctr062_modificar_conductor_ocasional_innominado('${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}')
                                                                            </c:if>
                                                                            <c:if test="${!esInnominado}">
                                                                                f_axisper001_modificar_conductor_nominado('${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}')
                                                                            </c:if>
                                                                        </c:set>
                                                                        <a href="javascript:${javascriptModificar}">
                                                                            <img border="0"
                                                                                 alt='<axis:alt f="${pantalla}" c="BT_MODIF_TOMADOR" lit="9000552"/>'
                                                                                 title='<axis:alt f="${pantalla}" c="BT_MODIF_TOMADOR" lit="9000552"/>'
                                                                                 src="images/find.gif"/>
                                                                        </a>
                                                                    </div>
                                                            </display:column>
                                                        </axis:ocultar>
                                                        <display:column title=""
                                                                        headerClass="headwidth5 sortable"
                                                                        media="html"
                                                                        autolink="false">
                                                                <div class="dspIcons">
                                                                    <a href="javascript:f_eliminar_conductor('${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.NORDEN}', '${pageScope.T_IAX_AUTCONDUCTORES.OB_IAX_AUTCONDUCTORES.SPERSON}')">
                                                                        <img border="0"
                                                                             alt='<axis:alt f="${pantalla}" c="BT_ELIMINA_TOMADOR" lit="1000127" />'
                                                                             title='<axis:alt f="${pantalla}" c="BT_ELIMINA_TOMADOR" lit="1000127" />'
                                                                             src="images/delete.gif"/>
                                                                    </a>
                                                                </div>
                                                        </display:column>                                                    
                                                </display:table>

                                            </div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    <tr>
                                         <c:if test="${!empty CONDUCTOR_HABITUAL}">
                                      
                                            <td align="right"> 
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="BT_OCASIONAL_INNOMINADO">                                            
                                            <div class="separador">&nbsp;</div>
                                            <input type="button" class="boton" style="width:183px;"
                                                   value='<axis:alt f="${pantalla}" c="BT_OCASIONAL_INNOMINADO" lit="9001240"/>'
                                                   onclick="f_axisctr062_anadir_conductor_ocasional_innominado()"/>
                                            
                                        </axis:ocultar>
                                        <axis:ocultar dejarHueco="false" f="${pantalla}" c="BT_OCASIONAL_NOMINADO">
                                            &nbsp;&nbsp;&nbsp;                                        
                                            <input type="button" class="boton" style="width:183px;"
                                                   value='<axis:alt f="${pantalla}" c="BT_OCASIONAL_NOMINADO" lit="9001241"/>'
                                                   onclick="f_axisper001_anadir_conductor_ocasional_nominado()"/>
                                            <div class="separador">&nbsp;</div>
                                        </axis:ocultar>
                                            </td>
                                        
                                        </c:if>
                                    </tr>
                                </table>
                            </td>
                        </tr>    
                        
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <div class="titulo"
                                                    style="margin-left:10px;font-size: 11px;width:98%">
                                                    <img src="images/flecha.gif"/><axis:alt f="${pantalla}" c="LIT_TERCER_SUBTITULO" lit="9001170"/> <%-- Datos conductor ocasional --%>
                                            </div>
                                            <table class="area" align="center">
                                                <tr>
                                                    <th style="width:18%;height:0px"></th>
                                                    <th style="width:14%;height:0px"></th>
                                                    <th style="width:39%;height:0px"></th>
                                                    <th style="width:11%;height:0px"></th>
                                                    <th style="width:18%;height:0px"></th>
                                                </tr>
                                                <%-- Miramos si el conductor es innominado (SPERSON == null) o no --%>
                                                <c:set var="esInnominado" value="${!empty CONDUCTOR_OCASIONAL && empty CONDUCTOR_OCASIONAL.SPERSON}"/>                                  
                                                
                                                <c:if test="${!esInnominado}">
                                                <tr>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="NNUMIDE">
                                                        <td class="titulocaja">
                                                            <span id="TTIPIDE_CONDUCTOR_OCASIONAL">
                                                                <c:choose>
                                                                    <c:when test="${!empty CONDUCTOR_OCASIONAL.PERSONA.TTIPIDE}">
                                                                        <b>${CONDUCTOR_OCASIONAL.PERSONA.TTIPIDE}</b>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <b><axis:alt f="${pantalla}" c="NNUMIDE" lit="105330"/></b>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TNOMBRE">
                                                        <td class="titulocaja" colspan="3">
                                                            <b><axis:alt f="${pantalla}" c="TNOMBRE" lit="105940"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="SNIP">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="SNIP" lit="1000088"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="NNUMIDE">
                                                        <td class="campocaja">
                                                            <input type="text"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="NNUMIDE" name="NNUMIDE"
                                                                   size="15"
                                                                   value="${CONDUCTOR_OCASIONAL.PERSONA.NNUMIDE}"
                                                                   style="width:85%;"
                                                                   <axis:atr f="${pantalla}" c="NNUMIDE" a="modificable=false"/>/>
                                                            <c:set var="canModify">
                                                                ${!empty CONDUCTOR_OCASIONAL.SPERSON ? "visible" : "hidden"}
                                                            </c:set>
                                                            <axis:ocultar dejarHueco="false" f="${pantalla}"
                                                                          c="BT_EDITAR_PER">
                                                                <a style="visibility:${canModify}"
                                                                   href="javascript:f_abrir_axisper005('f_aceptar_axisper005', '${CONDUCTOR_OCASIONAL.SPERSON}')">
                                                                     <img border="0"
                                                                         alt='<axis:alt f="${pantalla}" c="LIT_ALTA_RAPID_PERS" lit="1000214"/>'
                                                                         title='<axis:alt f="${pantalla}" c="LIT_ALTA_RAPID_PERS" lit="1000214"/>'
                                                                         src="images/lapiz.gif"/>
                                                                </a>
                                                            </axis:ocultar>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TNOMBRE">
                                                        <td class="campocaja" colspan="3">
                                                            <input type="text"
                                                                   style="width:95.5%;"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="TNOMBRE" name="TNOMBRE"
                                                                   size="15"
                                                                   value="${CONDUCTOR_OCASIONAL.PERSONA.TNOMBRE} ${CONDUCTOR_OCASIONAL.PERSONA.TAPELLI1} ${CONDUCTOR_OCASIONAL.PERSONA.TAPELLI2}"
                                                                   <axis:atr f="${pantalla}" c="TNOMBRE" a="modificable=false"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="SNIP">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="SNIP" name="SNIP"
                                                                   size="15"
                                                                   value="${CONDUCTOR_OCASIONAL.PERSONA.SNIP}"
                                                                   <axis:atr f="${pantalla}" c="SNIP" a="modificable=false"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                </c:if>
                                                <tr>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="FNACIMI" lit="1000064"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TSEXPER">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="TSEXPER" lit="100962"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <c:if test="${!esInnominado}">
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TOCUPACION">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="TOCUPACION" lit="9904804"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    </c:if>
                                                    <c:if test="${esInnominado}">
                                                    <td class="campocaja">
                                                        &nbsp;
                                                    </td>
                                                    </c:if>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/></b> <%-- Núm. puntos --%>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                                        <td class="titulocaja">
                                                            <b><axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/></b> <%-- Fecha carnet --%>
                                                        </td>
                                                    </axis:ocultar>                                        
                                                </tr>
                                                <tr>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="FNACIMI">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="FNACIMI_OCASIONAL" name="FNACIMI_OCASIONAL"
                                                                   size="15"
                                                                   <c:if test="${!esInnominado}">
                                                                       value="<fmt:formatDate value='${CONDUCTOR_OCASIONAL.PERSONA.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                                   </c:if>
                                                                   <c:if test="${esInnominado}">
                                                                       value="<fmt:formatDate value='${CONDUCTOR_OCASIONAL.FNACIMI}' pattern='dd/MM/yyyy'/>"
                                                                   </c:if>
                                                                   <axis:atr f="${pantalla}" c="FNACIMI" a="modificable=false&formato=fecha"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TSEXPER">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:85%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="TSEXPER" name="TSEXPER"
                                                                   size="15"
                                                                   <c:if test="${!esInnominado}">
                                                                       value="${CONDUCTOR_OCASIONAL.PERSONA.TSEXPER}"
                                                                   </c:if>
                                                                   <c:if test="${esInnominado}">
                                                                       value="${CONDUCTOR_OCASIONAL.TSEXO}"
                                                                   </c:if>
                                                                   <axis:atr f="${pantalla}" c="TSEXPER" a="modificable=false"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                
                                                    <c:if test="${!esInnominado}">
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="TOCUPACION">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:93%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="TOCUPACION" name="TOCUPACION"
                                                                   size="15"
                                                                   value="${CONDUCTOR_OCASIONAL.PERSONA.TOCUPACION}"
                                                                   <axis:atr f="${pantalla}" c="TOCUPACION" a="modificable=false"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                    </c:if>
                                                    <c:if test="${esInnominado}">
                                                        <td class="campocaja">
                                                            &nbsp;
                                                        </td>
                                                    </c:if>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="NPUNTOS">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:70%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="NPUNTOS_OCASIONAL" name="NPUNTOS_OCASIONAL"
                                                                   size="15" alt="<axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/>" title="<axis:alt f="${pantalla}" c="NPUNTOS" lit="9001173"/>"
                                                                   formato="entero"
                                                                   <c:if test="${!esInnominado}">
                                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', this.value, objDom.getValorPorId('FCARNET_OCASIONAL'),objDom.getValorPorId('CDOMICIOCA'),'0','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                                   </c:if>
                                                                   <c:if test="${esInnominado}">
                                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', this.value, objDom.getValorPorId('FCARNET_OCASIONAL'),objDom.getValorPorId('CDOMICIOCA'),'0', objDom.getValorPorId('FNACIMI_OCASIONAL'), ${CONDUCTOR_OCASIONAL.CSEXO},'${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                                   </c:if>
                                                                   value="${CONDUCTOR_OCASIONAL.NPUNTOS}"                                                       
                                                                   <axis:atr f="${pantalla}" c="NPUNTOS" a="formato=entero&modificable=true"/>/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
                                                        <td class="campocaja">
                                                            <input type="text" style="width:76%"
                                                                   class="campowidthinput campo campotexto"
                                                                   id="FCARNET_OCASIONAL" name="FCARNET_OCASIONAL"
                                                                   size="15" alt="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>" title="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>"
                                                                   formato="fecha"
                                                                   <c:if test="${!esInnominado}">
                                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', objDom.getValorPorId('NPUNTOS_OCASIONAL'), this.value,objDom.getValorPorId('CDOMICIOCA'),'0','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                                       onchange="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', objDom.getValorPorId('NPUNTOS_OCASIONAL'), this.value,objDom.getValorPorId('CDOMICIOCA'),'0','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"                                                       
                                                                   </c:if>
                                                                   <c:if test="${esInnominado}">
                                                                       onblur="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', objDom.getValorPorId('NPUNTOS_OCASIONAL'), this.value, objDom.getValorPorId('CDOMICIOCA'),'0', objDom.getValorPorId('FNACIMI_OCASIONAL'), ${CONDUCTOR_OCASIONAL.CSEXO},'${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"
                                                                       onchange="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', objDom.getValorPorId('NPUNTOS_OCASIONAL'), this.value, objDom.getValorPorId('CDOMICIOCA'),'0', objDom.getValorPorId('FNACIMI_OCASIONAL'), ${CONDUCTOR_OCASIONAL.CSEXO},'${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"                                                       
                                                                   </c:if>
                                                                   value="<fmt:formatDate value='${CONDUCTOR_OCASIONAL.FCARNET}' pattern='dd/MM/yyyy'/>"                                                       
                                                                   <axis:atr f="${pantalla}" c="FCARNET" a="formato=fecha&modificable=true"/>/><a id="icon_FCARNET_OCASIONAL" style="vertical-align:middle;"><img 
                                                                   alt="<axis:alt f="${pantalla}" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="${pantalla}" c="FCARNET" lit="9001171"/>" src="images/calendar.gif"/></a>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <c:if test="${ !empty CONDUCTOR_OCASIONAL.SPERSON}">
                                                        <axis:ocultar f="axisctr061" c="CDOMICIOCA" dejarHueco="false">
                                                        <td class="titulocaja" colspan="2">
                                                            <b><axis:alt f="axisctr061" c="CDOMICIOCA" lit="101078"/></b>
                                                        </td>
                                                         </axis:ocultar>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <c:if test="${ !empty CONDUCTOR_OCASIONAL.SPERSON}">
                                                    <axis:ocultar f="axisctr061" c="CDOMICIOCA" dejarHueco="false">
                                                        <td class="campocaja" colspan="2">   
                                                            <select name="CDOMICIOCA"
                                                                    <axis:atr f="axisctr061" c="CDOMICIOCA" a="obligatorio=false&isInputText=false"/>
                                                                    style="width:88%"
                                                                    id="CDOMICIOCA" size="1"
                                                                    onchange="f_ajax_set_conductor(null,'${CONDUCTOR_OCASIONAL.SPERSON}', '${CONDUCTOR_OCASIONAL.NORDEN}', objDom.getValorPorId('NPUNTOS_OCASIONAL'),objDom.getValorPorId('FCARNET_OCASIONAL'),this.value,'0', objDom.getValorPorId('FNACIMI_OCASIONAL'), '${CONDUCTOR_OCASIONAL.CSEXO}','${CONDUCTOR_HABITUAL.EXPER_SINIE_MANUAL}')"                                                    
                                                                    class="campowidthselect campo campotexto">
                                                                &nbsp;
                                                                <%--c:if test="${fn:length(sessionScope.axisctr_tomador.T_DOMICILIOS) > 1 || empty sessionScope.axisctr_tomador.T_DOMICILIOS}"--%>
                                                                   <c:if test="${empty __formdata.CDOMICI}">
                                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                                        -
                                                                        <axis:alt f="axisctr061" c="SNV_COMBO" lit="108341"/>
                                                                        -
                                                                    </option>
                                                                </c:if>
                                                                <c:forEach var="domicilio"
                                                                           items="${__formdata.lstdomioca}"
                                                                           varStatus="status">
                                                                    <option value="${domicilio.CDOMICI}"
                                                                            <c:if test="${domicilio.CDOMICI == __formdata.CDOMICIOCA}">selected</c:if>>
                                                                        ${domicilio.TDOMICI}
                                                                        ${domicilio.CPOSTAL}
                                                                        ${domicilio.TPOBLAC}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            <axis:visible f="axisctr061"
                                                                          c="BT_EDITAR_DOMICILIO">
                                                                <a id="conductores_abrir_axisper006_b"
                                                                   href="javascript:f_abrir_axisper006('f_aceptar_conductores_axisper006','${CONDUCTOR_OCASIONAL.SPERSON}')">
                                                                    <img border="0"
                                                                         alt='<axis:alt f="axisctr061" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                                         title='<axis:alt f="axisctr061" c="ICO_EDIT_DOMI" lit="1000069"/>'
                                                                         src="images/lapiz.gif"/>
                                                                </a>
                                                            </axis:visible>
                                                        </td>
                                                    </axis:ocultar>
                                                    </c:if>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </axis:visible>
                    </table>
                </td>
            </tr>
        </table>
        
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr061</c:param>
            <c:param name="__botones"><axis:visible f="${pantalla}" c="BT_SALIR">salir,</axis:visible><axis:visible f="${pantalla}" c="BT_CANCELAR">cancelar,</axis:visible><c:if test="${__formdata.DONDE != 'MODIFICAR'}"><axis:visible f="${pantalla}" c="BT_ANT">anterior,</axis:visible></c:if><axis:visible f="${pantalla}" c="BT_ACEPTAR">aceptar,</axis:visible><c:if test="${__formdata.DONDE != 'MODIFICAR'}"><axis:visible f="${pantalla}" c="BT_SIG">siguiente</axis:visible></c:if> </c:param>
        </c:import>
        
    </form>
    
    <c:import url="../include/mensajes.jsp" />

    <axis:ocultar dejarHueco="false" f="${pantalla}" c="FCARNET">
        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FCARNET",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FCARNET", 
                singleClick    :    true,
                firstDay       :    1
            });
            
            Calendar.setup({
                inputField     :    "FCARNET_OCASIONAL",    
                ifFormat       :    "%d/%m/%Y",     
                button         :    "icon_FCARNET_OCASIONAL",  
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
    </axis:ocultar>
    
</body>