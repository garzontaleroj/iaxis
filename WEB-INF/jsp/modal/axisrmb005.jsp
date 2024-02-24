<%/*
*  Fichero: axisrmb005.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 25/08/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <script type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/


        function f_onload() {
        try{
            var formdataCACTO = '${ __formdata.CACTO}';
			// Bug 12478.NMM.12/2009.
			var formdataTACTO = objUtiles.replaceAll("${__formdata.TDESACTO}", "-quote-", "\'");

            if (!objUtiles.estaVacio(formdataCACTO) && objUtiles.estaVacio(formdataTACTO)){
            	f_actualizar_literal_CACTO();
            }

            <c:if test="${!empty __formdata.NLINEA}">
            document.getElementById("NACTO").focus();
            objDom.setDisabledPorId("ITARCASS", false);
            objDom.setDisabledPorId("FBAJA", false);
            objDom.setDisabledPorId("FTRANS", false);
            objDom.setVisibilidadPorId("icon_FBAJA", "visible");
            //objDom.setVisibilidadPorId("icon_FTRANS", "visible");
            objDom.setDisabledPorId("NACTO", false);
            objDom.setDisabledPorId("ICASS", false);
            objDom.setDisabledPorId("PREEMB", false);
            objDom.setDisabledPorId("IEXTRA", false);
            objDom.setDisabledPorId("ITOT", false);
            objDom.setDisabledPorId("IPAGO", false);
            objDom.setDisabledPorId("IAHORRO", false);
           </c:if>

            <c:if test="${empty __formdata.NLINEA}">
            //alert("desactualizo");
            document.getElementById("NACTO").focus();
            objDom.setDisabledPorId("ITARCASS", true);
            document.miForm.FBAJA.value = "";
            objDom.setDisabledPorId("FBAJA", true);
            objDom.setDisabledPorId("FTRANS", true);
            objDom.setVisibilidadPorId("icon_FBAJA", "hidden");
            //objDom.setVisibilidadPorId("icon_FTRANS", "hidden");
            objDom.setDisabledPorId("NACTO", true);
            objDom.setDisabledPorId("ICASS", true);
            //objDom.setDisabledPorId("PREEMB", true);
            objDom.setDisabledPorId("IEXTRA", true);
            objDom.setDisabledPorId("ITOT", true);
            objDom.setDisabledPorId("IPAGO", true);
            objDom.setDisabledPorId("IAHORRO", true);
           </c:if>

           <c:if test="${!empty __formdata.DESCRIPCION_ERROR}">
                if(confirm("<axis:alt f="axisrmb005" c="DESC_ERROR" lit="9000642"/>" +": " + "${__formdata.DESCRIPCION_ERROR}" +" - "+"<axis:alt f="axisrmb005" c="PREG_ERROR" lit="9000543"/>")){
                       if (objValidador.validaEntrada()) {
                       objUtiles.ejecutarFormulario ("modal_axisrmb005.do", "alta_acto", document.miForm, "_self");
                       }

                }else{
                       //alert("En borrar errores");
                       objUtiles.ejecutarFormulario ("modal_axisrmb005.do", "borrar_errores", document.miForm, "_self");
                }
            </c:if>

            f_cargar_propiedades_pantalla();

            }catch(e){ alert (e.name + " " + e.message);}
            f_controlCalculadoras();
        }

        function Val(cadena)
        {
           return parseFloat(cadena); //String
        }

        function f_but_cancelar() {
           //parent.f_cerrar_modal('axisrmb005');
           parent.f_cerrar_axisrmb005();
        }

        function f_but_9000479()
         { // 9000479 = Validar
		if (!objUtiles.estaVacio(document.miForm.FBAJA.value))
		{
                 var miobjeto1= document.getElementById('IPAGO');
	             miobjeto1.removeAttribute('obligatorio');
                 var miobjeto2= document.getElementById('ITOT');
	             miobjeto2.removeAttribute('obligatorio');
                }
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario ("modal_axisrmb005.do", "alta_acto", document.miForm, "_self");
            }
         }

        function f_actualizar_importes(){

            if( document.miForm.CACTO.value!=0 && document.miForm.FACTO.value.length>0 ){
                objAjax.invokeAsyncCGI("modal_axisrmb005.do", callbackActualizar, "operation=actualizar" + "&NREEMB="+objDom.getValorPorId("NREEMB")+"&CACTO="+objDom.getValorPorId("CACTO")+ "&FACTO="+objDom.getValorPorId("FACTO"), this,  objJsMessages.jslit_cargando, false);
            }
         }

        function actualiza_pago(){

         if (  (objValidador.esCampoNumerico(document.miForm.NACTO.value, false,<%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )
              && ( objValidador.esCampoNumerico(document.miForm.ITOT.value, true,<%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )
              && ( objValidador.esCampoNumerico(document.miForm.PREEMB.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )
              && ( objValidador.esCampoNumerico(document.miForm.IEXTRA.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )

         ) {

                // Recogemos el valor
                var NACTO_cadena = document.miForm.NACTO.value;
                var ITOT_cadena = document.miForm.ITOT.value;
                var PREEMB_cadena = document.miForm.PREEMB.value;
                var IEXTRA_cadena = document.miForm.IEXTRA.value;
        
                // Quitamos los puntos
                var NACTO_cadena1 = objNumero.quitarSeparadorMiles(NACTO_cadena);
                var ITOT_cadena1 = objNumero.quitarSeparadorMiles(ITOT_cadena);
                var PREEMB_cadena1 = objNumero.quitarSeparadorMiles(PREEMB_cadena);
                var IEXTRA_cadena1 = objNumero.quitarSeparadorMiles(IEXTRA_cadena);
        
        
                var NACTO_cadena2 = objNumero.cambiarSeparadorDecimalesPorMiles(NACTO_cadena1);
                var ITOT_cadena2 = objNumero.cambiarSeparadorDecimalesPorMiles(ITOT_cadena1);
                var PREEMB_cadena2 = objNumero.cambiarSeparadorDecimalesPorMiles(PREEMB_cadena1);
                var IEXTRA_cadena2 = objNumero.cambiarSeparadorDecimalesPorMiles(IEXTRA_cadena1);
        
        
                var NACTO = Val( NACTO_cadena2 );
                var ITOT = Val( ITOT_cadena2 );
                var PREEMB = Val( PREEMB_cadena2 );
                var IEXTRA = Val( IEXTRA_cadena2);
        
                var valor = NACTO * ITOT *(100-PREEMB)+IEXTRA;
                valor=valor+"";
        
                var importe_comas = objNumero.cambiarSeparadorMilesPorDecimales(valor);
                var importe_pago = objValidador.valorFormateadoCampoNumerico(importe_comas,true,true);        
        
                document.miForm.IPAGO.value= importe_pago;    
             }
        }

        function obtiene_pago(){

             if (  (objValidador.esCampoNumerico(document.miForm.NACTO.value, false,<%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )
                  && ( document.miForm.CACTO.value!=0  ) && ( document.miForm.FACTO.value!=0 && document.miForm.FACTO.value!='' )
                  && (objUtiles.estaVacio(document.miForm.ICASS.value)||( !objUtiles.estaVacio(document.miForm.ICASS.value) && objValidador.esCampoNumerico(document.miForm.ICASS.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_IMPCASS" lit="9000472"/>") ) )
                  && ( objUtiles.estaVacio(document.miForm.ITARCASS.value)||(!objUtiles.estaVacio(document.miForm.ITARCASS.value) && objValidador.esCampoNumerico(document.miForm.ITARCASS.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_TARIFCASS" lit="9000459"/>")) )
                  && ( objValidador.esCampoNumerico(document.miForm.NREEMB.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUM" lit="800440"/><axis:alt f="axisrmb005" c="LIT_REEMB" lit="9000433"/>")  )

             ) {
                objAjax.invokeAsyncCGI("modal_axisrmb005.do", callbackObtieneImporte, "operation=obtener_importe" + "&NREEMB="+objDom.getValorPorId("NREEMB")+"&CACTO="+objDom.getValorPorId("CACTO")+ "&FACTO="+objDom.getValorPorId("FACTO")+"&NACTO="+objDom.getValorPorId("NACTO")+"&ICASS="+objDom.getValorPorId("ICASS")+"&IPAGO="+objDom.getValorPorId("IPAGO")+"&PREEMB="+objDom.getValorPorId("PREEMB")+"&ITARCASS="+objDom.getValorPorId("ITARCASS"), this,  objJsMessages.jslit_cargando, false);
             }else{
                alert("<axis:alt f="axisrmb005" c="LIT_ERROR_PARAM" lit="101901"/> : "+"<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/> : "+"<axis:alt f="axisrmb005" c="LIT_NUM" lit="800440"/><axis:alt f="axisrmb005" c="LIT_REEMB" lit="9000433"/> - "+"<axis:alt f="axisrmb005" c="LIT_IMPCASS" lit="9000472"/>- "+"<axis:alt f="axisrmb005" c="LIT_ACTO" lit="9000456"/> - "+"<axis:alt f="axisrmb005" c="LIT_FACTO" lit="9000458"/>");
             }
        }


        function obtiene_pago_comp(){

             if (  (objValidador.esCampoNumerico(document.miForm.NACTO.value, false,<%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/>")  )
                  && ( document.miForm.CACTO.value!=0  ) && ( document.miForm.FACTO.value!=0 && document.miForm.FACTO.value!='' )
                  && (objUtiles.estaVacio(document.miForm.ICASS.value)||( !objUtiles.estaVacio(document.miForm.ICASS.value) && objValidador.esCampoNumerico(document.miForm.ICASS.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_IMPCASS" lit="9000472"/>") ) )
                  && ( objUtiles.estaVacio(document.miForm.ITARCASS.value)||(!objUtiles.estaVacio(document.miForm.ITARCASS.value) && objValidador.esCampoNumerico(document.miForm.ITARCASS.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_TARIFCASS" lit="9000459"/>")) )
                  && ( objValidador.esCampoNumerico(document.miForm.NREEMB.value, true, <%= Integer.MIN_VALUE %>, "<axis:alt f="axisrmb005" c="LIT_NUM" lit="800440"/><axis:alt f="axisrmb005" c="LIT_REEMB" lit="9000433"/>")  )
             ) {
                objAjax.invokeAsyncCGI("modal_axisrmb005.do", callbackObtieneImporteComp, "operation=obtener_importe_comp" + "&ITOT="+objDom.getValorPorId("ITOT")+"&IPAGO="+objDom.getValorPorId("IPAGO")+ "&ICASS="+objDom.getValorPorId("ICASS"), this, objJsMessages.jslit_cargando, false);
             }else{
                alert("<axis:alt f="axisrmb005" c="LIT_ERROR_PARAM" lit="101901"/> : "+"<axis:alt f="axisrmb005" c="LIT_NUMACT" lit="9000457"/> : "+"<axis:alt f="axisrmb005" c="LIT_NUM" lit="800440"/><axis:alt f="axisrmb005" c="LIT_REEMB" lit="9000433"/> - "+"<axis:alt f="axisrmb005" c="LIT_IMPCASS" lit="9000472"/>- "+"<axis:alt f="axisrmb005" c="LIT_ACTO" lit="9000456"/> - "+"<axis:alt f="axisrmb005" c="LIT_FACTO" lit="9000458"/>");
             }
        }

        //////////////////////////////////////////////////////////////////////////
        //////////////////////////  AJAX /////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////

         function callbackActualizar(ajaxResponseText) {
             //alert(ajaxResponseText);

                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);

                    }else{


                        var PREEMB = objUtiles.existeObjetoXml(doc.getElementsByTagName("OPREEMB")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OPREEMB"), 0, 0) : "0";
                        objDom.setValorPorId("PREEMB",objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(PREEMB),true,true));

                        var IEXTRA = objUtiles.existeObjetoXml(doc.getElementsByTagName("OIEXTRA")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OIEXTRA"), 0, 0) : "0";
                        objDom.setValorPorId("IEXTRA", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(IEXTRA),true,true));


                        var ITARCASS = objUtiles.existeObjetoXml(doc.getElementsByTagName("OITARCASS")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OITARCASS"), 0, 0) : "0";
                        objDom.setValorPorId("ITARCASS", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(ITARCASS),true,true));

                        var NACTO = objUtiles.existeObjetoXml(doc.getElementsByTagName("ONACTO")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("ONACTO"), 0, 0) : "0";
                        objDom.setValorPorId("NACTO", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(NACTO),true,true));

                        var ICASS = objUtiles.existeObjetoXml(doc.getElementsByTagName("OICASS")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OICASS"), 0, 0) : "0";
                        objDom.setValorPorId("ICASS", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(ICASS),true,true));

                        objDom.setDisabledPorId("ITARCASS", false);
                        objDom.setDisabledPorId("FBAJA", false);
                        objDom.setDisabledPorId("FTRANS", false);
                        objDom.setVisibilidadPorId("icon_FBAJA", "visible");
                        //objDom.setVisibilidadPorId("icon_FTRANS", "visible");
                        objDom.setDisabledPorId("NACTO", false);
                        objDom.setDisabledPorId("ICASS", false);
                        objDom.setDisabledPorId("PREEMB", false);
                        objDom.setDisabledPorId("IEXTRA", false);
                        objDom.setDisabledPorId("ITOT", false);
                        objDom.setDisabledPorId("IPAGO", false);
                        objDom.setDisabledPorId("IAHORRO", false);

                        f_actualizar_literal_CACTO();
                    }
                }
                f_controlCalculadoras();
            }

            function callbackObtieneImporte(ajaxResponseText) {
             //alert("alert1" + ajaxResponseText);

                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);

                    }else{

                        var ITOT = objUtiles.existeObjetoXml(doc.getElementsByTagName("OITOT")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OITOT"), 0, 0) : "0";
                        objDom.setValorPorId("ITOT", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(ITOT),true,true));

                        var IPAGO = objUtiles.existeObjetoXml(doc.getElementsByTagName("OIPAGO")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OIPAGO"), 0, 0) : "0";
                        objDom.setValorPorId("IPAGO", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(IPAGO),true,true));

                        var ICASS = objUtiles.existeObjetoXml(doc.getElementsByTagName("OICASS")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OICASS"), 0, 0) : "0";
                        objDom.setValorPorId("ICASS", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(ICASS),true,true));

                        /* Anyadir nuevo campo */
                        var ITARCASS = objUtiles.existeObjetoXml(doc.getElementsByTagName("OITARCASS")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OITARCASS"), 0, 0) : "0";
                        objDom.setValorPorId("ITARCASS", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(ITARCASS),true,true));

                        var IEXTRA = objUtiles.existeObjetoXml(doc.getElementsByTagName("OIEXTRA")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OIEXTRA"), 0, 0) : "0";
                        objDom.setValorPorId("IEXTRA", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(IEXTRA),true,true));

                    }

                }
                f_controlCalculadoras();
            }

            function callbackObtieneImporteComp(ajaxResponseText) {
             //alert("alert1" + ajaxResponseText);

                var doc = objAjax.domParse(ajaxResponseText);

                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TINFO")[0])){
                        var mensaje = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TINFO"), 0, 0);

                    }else{

                        var IPAGOCOMP = objUtiles.existeObjetoXml(doc.getElementsByTagName("OIPAGOCOMP")[0]) ?
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("OIPAGOCOMP"), 0, 0) : "0";
                        objDom.setValorPorId("IPAGOCOMP", objValidador.valorFormateadoCampoNumerico(objNumero.cambiarSeparadorMilesPorDecimales(IPAGOCOMP),true,true));

                    }
                }
                f_controlCalculadoras();
            }

            function callbackajaxActo(ajaxResponseText){
            try{

             //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {

                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CACTO")[0])) {

                       if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CACTO", "");
                            limpiaCampos("CACTO");
                        }else{
                            objDom.setValorPorId("CACTO", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTO"), 0, 0));

                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TACTO")[0])){
                                objDom.setValorHTMLPorId("TACTO_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TACTO"), 0, 0) + "</b>");
                                limpiaCampos("CACTO");
                            }
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true"){
                alert (e.name + " " + e.message);
                }
            }
            f_controlCalculadoras();
        }

        //////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////// MODAL BUSQUEDA ACTOS /////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////

        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION, CODIGO_GARANTIA, CODIGO_AGR){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION + 
              "&CODIGO_GARANTIA=" + CODIGO_GARANTIA + "&CODIGO_AGR=" + CODIGO_AGR);
        }

        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){

            f_cerrar_axiscom001();

            if (!objUtiles.estaVacio(TEXTO)){
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            }

            if (CODIGO_CONSULTA == "LISTA_REEMBACTOS") {

                objDom.setValorPorId("CACTO", CODIGO);
                objDom.setValorHTMLPorId("TACTO_span", "<b>" + TEXTO + "</b>");
                //alert("Antes de actualizar importes en aceptar");
                f_actualizar_importes();
            }
         }

         function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
         }

         function f_onchange_CACTO() {
            //alert("En cambiar acto");
            var CACTO =objDom.getValorPorId("CACTO");
            var CGARANT =objDom.getValorPorId("CGARANT");
            var AGR_SALUD =objDom.getValorPorId("AGR_SALUD");

            if (!objUtiles.estaVacio(CACTO)){
                var qs="operation=ajax_acto";

                qs=qs+"&op="+"CACTO";
                qs=qs+"&CACTO="+CACTO.toUpperCase();
                qs=qs+"&CGARANT="+CGARANT;
                qs=qs+"&AGR_SALUD="+AGR_SALUD;
                qs=qs+"&dt="+(new Date().getTime());
                objAjax.invokeAsyncCGI("modal_axisrmb005.do", callbackajaxActo, qs, this);
                //alert("Antes de actualizar importes en aceptar");
                f_actualizar_importes();

            } else {
                objDom.setValorPorId("CACTO", "");
                objDom.setValorHTMLPorId("TACTO_span", "");
                limpiaCampos("CACTO");
            }
            f_controlCalculadoras();
         }


         function f_actualizar_literal_CACTO() {

            var CACTO =objDom.getValorPorId("CACTO");
            var CGARANT =objDom.getValorPorId("CGARANT");
            var AGR_SALUD =objDom.getValorPorId("AGR_SALUD");

            if (!objUtiles.estaVacio(CACTO)){
                var qs="operation=ajax_acto";
                qs=qs+"&op="+"CACTO";
                qs=qs+"&CACTO="+CACTO;
                qs=qs+"&CGARANT="+CGARANT;
                qs=qs+"&AGR_SALUD="+AGR_SALUD;
                qs=qs+"&dt="+(new Date().getTime());
                objAjax.invokeAsyncCGI("modal_axisrmb005.do", callbackajaxActo, qs, this);
            } else {
                objDom.setValorPorId("CACTO", "");
                objDom.setValorHTMLPorId("TACTO_span", "");
                limpiaCampos("CACTO");
            }
         }

         //////////////////////////////////////////////////////////////////////////////////////////////
         ////////////////////////////////  FUNCIONES FORMATEO DE FECHAS ///////////////////////////////
         //////////////////////////////////////////////////////////////////////////////////////////////


         function f_formatdate(entrada,title){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        }
        
        function f_controlCalculadoras(){
            //IPAGO
            if ((document.getElementById('IPAGO')!=null)&&(document.getElementById('icon_IPAGO')!=null)&&(document.getElementById('FTRANS')!=null)){ 
                if (objUtiles.estaVacio(document.getElementById('FTRANS').value)){
                    //editable visibility: visible;
                    document.getElementById('icon_IPAGO').style.visibility = 'visible';
                }else{
                    //No calculadora visibility:;
                    document.getElementById('icon_IPAGO').style.visibility = 'hidden';
                    
                }
            }
            //IPAGOCOMP
            if ((document.getElementById('IPAGOCOMP')!=null)&&(document.getElementById('icon_IPAGOCOMP')!=null)&&(document.getElementById('FTRANSCOMP')!=null)){ 
                if (objUtiles.estaVacio(document.getElementById('FTRANSCOMP').value)){
                    //editable visibility: visible;
                    document.getElementById('icon_IPAGOCOMP').style.visibility = 'visible';
                }else{
                    //No calculadora visibility:;
                    document.getElementById('icon_IPAGOCOMP').style.visibility = 'hidden';
                    
                }
            }
        }
    </script>
  </head>

  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>

    <form name="miForm" action="modal_axisrmb005.do" method="POST">
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><axis:alt f="axisrmb005" c="TITULO" lit="9000470"/></c:param>      <%-- Mto. Actos --%>
            <c:param name="formulario"><axis:alt f="axisrmb005" c="TITULO" lit="9000470"/></c:param>  <%-- Mto. Actos --%>
            <c:param name="form">axisrmb005</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|<axis:alt f="axisrmb005" c="LIT_ACTOS" lit="9000466"/></c:param>
        </c:import>
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="NFACT" name="NFACT" value="${__formdata.NFACT}"/>
        <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
        <input type="hidden" id="AGR_SALUD" name="AGR_SALUD" value="${__formdata.AGR_SALUD}"/>

        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            <tr>
                <td>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrmb005" c="LIT_DATOS_REEM" lit="9000468" /></div>
                    <!-- Seccion datos reembolso -->
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
                                            <b><axis:alt f="axisrmb005" c="NREEMB" lit="9001512"/></b> <%-- Nº Reembolso --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="NPOLIZA" lit="9001514"/></b> <%-- Nº Póliza --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="CESTADO" lit="100587"/></b>  <%-- Estado --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="FESTADO" lit="9000450"/></b> <%-- F. Estado --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NREEMB}" name="NREEMB" id="NREEMB"
                                            style="width:40%;" <axis:atr f="axisrmb005" c="NREEMB" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NREEMB" lit="9001512"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA"
                                            style="width:40%;" <axis:atr f="axisrmb005" c="NPOLIZA" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="LIT_NUM" lit="800440"/> <axis:alt f="axisrmb005" c="NUM_POLIZA" lit="100836"/>" />
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TESTADO}" name="CESTADO" id="CESTADO"
                                            style="width:55%;" <axis:atr f="axisrmb004" c="CESTADO" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="CESTADO" lit="100587"/>" />
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15"
                                            value="<fmt:formatDate value="${__formdata.FESTADO}" pattern="dd/MM/yyyy"/>" name="FESTADO" id="FESTADO"
                                            style="width:35%;" <axis:atr f="axisrmb005" c="FESTADO" a="formato=fecha&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="FESTADO" lit="9000450"/>"/><!--a id="icon_FESTADO" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisrmb005" c="FESTADO" lit="9000450" />" src="images/calendar.gif"/></a-->
                                        </td>
                                    </tr>
                                    <tr>
                                            <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb005" c="NOMBRE_TOM" lit="101027"/></b> <%-- Tomador --%>
                                            </td>
                                            <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb005" c="NOMBRE_ASEG" lit="101028"/></b>  <%-- Asegurado --%>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_TOM}" name="NOMBRE_TOM" id="NOMBRE_TOM"
                                            style="width:80%;" <axis:atr f="axisrmb004" c="NOMBRE_TOM" a="modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NOMBRE_TOM" lit="101027"/>"/>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NOMBRE_ASEG}" name="NOMBRE_ASEG" id="NOMBRE_ASEG"
                                            style="width:80%;" <axis:atr f="axisrmb004" c="NOMBRE_ASEG" a="modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NOMBRE_ASEG" lit="101028"/>" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <!-- Seccion Datos factura -->
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrmb005" c="LIT_DATOS_FAC" lit="9000469" /></div>
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
                                            <b><axis:alt f="axisrmb005" c="NFACTURA" lit="9000445"/></b>  <%-- Nº Fact. --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="NFACT_CLI" lit="9000650"/></b>  <%-- Nº Fact. Cli. --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="IMPFACT" lit="100563"/></b>   <%-- Importe --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACT}" name="NFACTURA" id="NFACTURA"
                                            style="width:35%;" <axis:atr f="axisrmb005" c="NFACTURA" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NFACTURA" lit="9000445"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NFACT_CLI}" name="NFACT_CLI" id="NFACT_CLI"
                                            style="width:60%;" <axis:atr f="axisrmb005" c="NFACT_CLI" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NFACT_CLI" lit="9000650"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" name="IMPFACT" id="IMPFACT"
                                            value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IMPFACT}'/>"
                                            style="width:35%;" <axis:atr f="axisrmb005" c="IMPFACT" a="formato=entero&modificable=false" /> title="<axis:alt f="axisrmb005" c="IMPFACT" lit="100563"/>"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                        </table>

                    <!-- Fin seccion datos factura -->
                    <!-- Seccion Datos Acto -->
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisrmb005" c="LIT_DATOS_ACTOS" lit="9000456" /></div>
                    <table class="seccion">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                        <th style="width:14%;height:0%;"/>
                                    </tr>

                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="NLINEA" lit="9000455" /></b>  <%-- Nº. Línia --%>
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisrmb005" c="CACTO" lit="9000456"/></b>   <%-- Acto. --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="FACTO" lit="9000458"/></b>   <%-- F. Acto --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="CTIPO" lit="9001978"/></b>   <%-- Tipo acto --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="TORIGEN" lit="9000443"/></b>   <%-- Origen --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="NACTO" lit="9000457"/></b>   <%-- Nº Actos. --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto_ob" size="15" value="${__formdata.NLINEA}" name="NLINEA" id="NLINEA"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="NLINEA" a="formato=entero&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="NLINEA" lit="9000455"/>"/>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                        <input type="text"  class="campowidthinput campo campotexto_ob" size="20"  maxlength="20" value="${__formdata.CACTO}" name="CACTO" id="CACTO" onchange="f_onchange_CACTO()" style="width:18%;" />
                                        <img id="findActo" border="0" src="images/find.gif" title="<axis:alt f="axisrmb005" c="CACTO" lit="9000456"/>" onclick="f_abrir_axiscom001('1000659', 'LISTA_REEMBACTOS', '', document.miForm.CGARANT.value, document.miForm.AGR_SALUD.value)" style="cursor:pointer"/> <!--_REEMBACTOS-->
                                        <span id="TACTO_span"><b>${__formdata.TDESACTO} </b></span>

                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto_ob" size="15" onchange="javascript:f_formatdate(this,'<axis:alt f="axisrmb005" c="FACTO" lit="9000458"/>');f_actualizar_importes();"
                                            value="<fmt:formatDate value="${__formdata.FACTO}" pattern="dd/MM/yyyy"/>" name="FACTO" id="FACTO" onblur="javascript:f_formatdate(this,'<axis:alt f="axisrmb005" c="FACTO" lit="9000458"/>');"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="FACTO" a="formato=fecha"/>
                                            title="<axis:alt f="axisrmb005" c="FACTO" lit="9000458"/>"/><a id="icon_FACTO" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisrmb005" c="FACTO" lit="9000458" />" src="images/calendar.gif"/></a>
                                        </td>
                                       <td class="campocaja">
                                            <select name="CTIPO" id="CTIPO" <axis:atr f="axisrmb005" c="CTIPO" a="isInputText=false&obligatorio=true"/> title="<axis:alt f="axisrmb005" c="CTIPO" lit="9001978"/>" size="1" class="campowidthselect campo campotexto" style="width:100%;">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrmb005" c="LIT_SELEC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.listaTipos}">
                                                    <option value = "${element.CATRIBU}"
                                                        <c:if test="${element.CATRIBU == __formdata.CTIPO || element.CATRIBU == 0}"> selected </c:if> />
                                                        ${element.TATRIBU}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TORIGEN}" name="TORIGEN" id="TORIGEN"
                                            style="width:80%;" <axis:atr f="axisrmb004" c="TORIGEN" a="modificable=false"/> title="<axis:alt f="axisrmb005" c="TORIGEN" lit="9000443"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NACTO}" name="NACTO" id="NACTO"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="NACTO" a="formato=entero&obligatorio=true"/>
                                            title="<axis:alt f="axisrmb005" c="NACTO" lit="9000457"/>"/>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="ITARCASS" lit="9000459"/></b>  <%-- Tarifa CASS. --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="ICASS" lit="9000472"/></b>   <%-- Importe CASS --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="PREEMB" lit="101467"/></b>   <%-- Porcentaje --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="IEXTRA" lit="9000473"/></b>   <%-- Importe Extra --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="IPAGO" lit="9000475"/></b>   <%-- Importe Pago --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="FTRANS" lit="9000465"/></b>   <%-- F. Trans--%>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ITARCASS}' />" name="ITARCASS" id="ITARCASS"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="ITARCASS" a="formato=decimal&obligatorio=true&modificable=true"/>
                                            title="<axis:alt f="axisrmb005" c="ITARCASS" lit="9000459"/>"/> <!-- modificable = false -->
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICASS}' />" name="ICASS" id="ICASS"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="ICASS" a="formato=decimal&obligatorio=true"/> title="<axis:alt f="axisrmb005" c="ICASS" lit="9000472"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='###,#00.00' value='${__formdata.PREEMB}' />" name="PREEMB" id="PREEMB"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="PREEMB" a="formato=decimal&obligatorio=true"/>
                                            title="<axis:alt f="axisrmb005" c="PREEMB" lit="101467"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IEXTRA}' />" name="IEXTRA" id="IEXTRA"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="IEXTRA" a="formato=decimal&modificable=false"/> title="<axis:alt f="axisrmb005" c="IEXTRA" lit="9000473"/>"/>
                                        </td>
                                        <axis:ocultar f="axisrmb005" c="IPAGO">
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPAGO}' />" name="IPAGO" id="IPAGO"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="IPAGO" a="formato=decimal&obligatorio=true"/> title="<axis:alt f="axisrmb005" c="IPAGO" lit="9000475"/>"/>
                                            <a id="icon_IPAGO" style="vertical-align:center;">
                                            <img alt="<axis:alt f="axisrmb005" c="IPAGO" lit="9000475"/>" title="<axis:alt f="axisrmb005" c="IPAGO" lit="9000475" />" src="images/calculadora.gif"/ onclick="javascript:obtiene_pago();"></a>
                                        </td>
                                        </axis:ocultar>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15"
                                            value="<fmt:formatDate value="${__formdata.FTRANS}" pattern="dd/MM/yyyy"/>" name="FTRANS" id="FTRANS"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="FTRANS" a="formato=fecha&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="FTRANS" lit="9000465"/>"/><!--a id="icon_FTRANS" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisrmb005" c="FTRANS" lit="9000465" />" src="images/calendar.gif"/></a-->
                                        </td>

                                     <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="FBAJA" lit="9000447"/></b>   <%-- F. Baja --%>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="IPAGOCOMP" lit="9001986"/></b>   <%-- Import complementari --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="FTRANSCOMP" lit="9001987"/></b>   <%-- F.trans.complementària --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <!--input type="text" class="campowidthinput campo campotexto" size="15"
                                            value="<fmt:formatDate value="${__formdata.FBAJA}" pattern="dd/MM/yyyy"/>" name="FBAJA" id="FBAJA" onblur="javascript:f_formatdate(this,'<axis:alt f="axisrmb005" c="FFACTURA" lit="9000451" />');"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="FBAJA" a="formato=fecha&obligatorio=false"/>
                                            title="<axis:alt f="axisrmb005" c="FBAJA" lit="9000447"/>"/><a id="icon_FBAJA" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisrmb005" c="FBAJA" lit="9000447" />" src="images/calendar.gif"/></a-->

                                            <input type="text" class="campowidthinput campo campotexto" size="15" onchange="f_carga_dependencias()"
                                            title="<axis:alt f="axisrmb005" c="FBAJA" lit="9000447"/>" value="<fmt:formatDate value='${__formdata.FBAJA}' pattern='dd/MM/yyyy'/>" name="FBAJA" id="FBAJA" onblur="javascript:f_formatdate(this,'<axis:alt f="axisrmb005" c="FBAJA" lit="9000447" />');"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="FBAJA" a="formato=fecha"/>/><a id="icon_FBAJA" style="vertical-align:middle;"><img
                                            alt="<axis:alt f="axisrmb005" c="LIT_SELECCIONAR" lit="108341"/>" title="<axis:alt f="axisrmb005" c="FBAJA" lit="9000447" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IPAGOCOMP}' />" name="IPAGOCOMP" id="IPAGOCOMP"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="IPAGOCOMP" a="formato=decimal&obligatorio=false"/>
                                            title="<axis:alt f="axisrmb005" c="IPAGOCOMP" lit="9001986"/>"/>
                                            <a id="icon_IPAGOCOMP" style="vertical-align:center;"><img
                                            alt="<axis:alt f="axisrmb005" c="IPAGOCOMP" lit="9001986"/>" title="<axis:alt f="axisrmb005" c="IPAGOCOMP" lit="9001986" />" src="images/calculadora.gif"/ onclick="javascript:obtiene_pago_comp();"></a>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15"
                                            value="<fmt:formatDate value="${__formdata.FTRANSCOMP}" pattern="dd/MM/yyyy"/>" name="FTRANSCOMP" id="FTRANSCOMP"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="FTRANSCOMP" a="formato=fecha&modificable=false"/>
                                            title="<axis:alt f="axisrmb005" c="FTRANSCOMP" lit="9001987"/>"/>
                                        </td>
                                    </tr>

                                     <tr>
                                        <td class="titulocaja" colspan="4">
                                            <b><axis:alt f="axisrmb005" c="CERROR" lit="100587"/></b>   <%-- Estado --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="ITOT" lit="9000474"/></b>   <%-- Importe Total --%>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisrmb005" c="IAHORRO" lit="9000476"/></b>   <%-- Importe Ahorro --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="4">
                                             <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CERROR}-${__formdata.TERROR}" name="CERROR" id="CERROR"
                                            <c:if test="${__formdata.CERROR==0}">style="width:80%"</c:if> <c:if test="${__formdata.CERROR!=0}">style="width:90%;color:red" </c:if>   <axis:atr f="axisrmb005" c="CERROR" a="formato=decimal&obligatorio=true&modificable=false"/> title="<axis:alt f="axisrmb005" c="LIT_ERROR" lit="9000464"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ITOT}' />" name="ITOT" id="ITOT"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="ITOT" a="formato=decimal&obligatorio=true"/> title="<axis:alt f="axisrmb005" c="ITOT" lit="9000474"/>"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.IAHORRO}' />" name="IAHORRO" id="IAHORRO"
                                            style="width:65%;" <axis:atr f="axisrmb005" c="IAHORRO" a="formato=decimal"/> title="<axis:alt f="axisrmb005" c="IAHORRO" lit="9000476"/>"/>
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
            <c:param name="f">axisrmb005</c:param>
            <c:param name="__botones">cancelar,9000479</c:param>
        </c:import>

    </form>
    <c:import url="../include/mensajes.jsp" />

    <script type="text/javascript">
        //Calendar.setup({
        //    inputField     :    "FESTADO",
        //    ifFormat       :    "%d/%m/%Y",
        //    button         :    "icon_FESTADO",
        //    singleClick    :    true,
        //    firstDay       :    1
        //});
        Calendar.setup({
            inputField     :    "FACTO",
            ifFormat       :    "%d/%m/%Y",
            button         :    "icon_FACTO",
            singleClick    :    true,
            firstDay       :    1
        });
        Calendar.setup({
            inputField     :    "FBAJA",
            ifFormat       :    "%d/%m/%Y",
            button         :    "icon_FBAJA",
            singleClick    :    true,
            firstDay       :    1
        });

        /*
        Calendar.setup({
            inputField     :    "FTRANS",
            ifFormat       :    "%d/%m/%Y",
            button         :    "icon_FTRANS",
            singleClick    :    true,
            firstDay       :    1
        });
        */
    </script>

  </body>
</html>